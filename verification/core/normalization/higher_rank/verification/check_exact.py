#!/usr/bin/env python3
"""Small standard-library exact checker; no assertions or floating point."""
import copy
import itertools
import json
from fractions import Fraction
from pathlib import Path

N = 4
ZERO = (0,) * N

class Rejection(Exception):
    pass

def need(condition, label):
    if not condition:
        raise Rejection(label)

def scalar(c):
    return {} if c == 0 else {ZERO: Fraction(c)}

def var(i):
    key = [0] * N
    key[i] = 1
    return {tuple(key): Fraction(1)}

def add(*polys):
    ans = {}
    for poly in polys:
        for exp, coef in poly.items():
            ans[exp] = ans.get(exp, Fraction(0)) + coef
    return {exp: coef for exp, coef in ans.items() if coef}

def scale(c, poly):
    return {exp: c * coef for exp, coef in poly.items() if c * coef}

def sub(a, b):
    return add(a, scale(-1, b))

def mul(a, b):
    ans = {}
    for ea, ca in a.items():
        for eb, cb in b.items():
            exp = tuple(x + y for x, y in zip(ea, eb))
            ans[exp] = ans.get(exp, Fraction(0)) + ca * cb
    return {exp: coef for exp, coef in ans.items() if coef}

def evaluate(poly, point):
    value = Fraction(0)
    for exp, coef in poly.items():
        term = coef
        for x, power in zip(point, exp):
            term *= x ** power
        value += term
    return value

def derivative(poly, i):
    ans = {}
    for exp, coef in poly.items():
        if exp[i]:
            nxt = list(exp)
            nxt[i] -= 1
            ans[tuple(nxt)] = coef * exp[i]
    return ans

def determinant(mat):
    n = len(mat)
    need(all(len(row) == n for row in mat), 'nonsquare determinant input')
    ans = Fraction(0)
    for perm in itertools.permutations(range(n)):
        inversions = sum(perm[i] > perm[j] for i in range(n) for j in range(i+1,n))
        term = Fraction((-1) ** inversions)
        for i, j in enumerate(perm):
            term *= mat[i][j]
        ans += term
    return ans

def rank(rows):
    a = [[Fraction(x) for x in row] for row in rows]
    if not a:
        return 0
    pivot = 0
    for col in range(len(a[0])):
        chosen = next((i for i in range(pivot,len(a)) if a[i][col]), None)
        if chosen is None:
            continue
        a[pivot], a[chosen] = a[chosen], a[pivot]
        factor = a[pivot][col]
        a[pivot] = [x / factor for x in a[pivot]]
        for i in range(pivot+1,len(a)):
            factor = a[i][col]
            a[i] = [x-factor*y for x,y in zip(a[i],a[pivot])]
        pivot += 1
        if pivot == len(a):
            break
    return pivot

def equations(M, row_pivot, col_pivot):
    ui, vi = iter([var(0),var(1)]), iter([var(2),var(3)])
    u = [scalar(1) if i == row_pivot else next(ui) for i in range(3)]
    v = [scalar(1) if j == col_pivot else next(vi) for j in range(3)]
    return [add(scale(M[i][j], sub(sub(mul(u[0],v[0]),mul(u[0],v[j])),mul(u[i],v[0]))),mul(u[i],v[j])) for i in (1,2) for j in (1,2)]

def verify(cert):
    M = cert['matrix']
    need(len(M)==3 and all(len(row)==3 for row in M), 'matrix shape')
    need(all(type(x) is int and x for row in M for x in row), 'nonzero integer entries')
    need(M[0]==[1,1,1] and [row[0] for row in M]==[1,1,1], 'cycle normalization')
    need(determinant(M)==cert['matrix_determinant']!=0, 'matrix determinant')
    Q = [[M[i][j] if i==k else 0 for i in range(3) for j in range(3)] for k in range(3)]
    Q += [[-M[i][j] if j==k else 0 for i in range(3) for j in range(3)] for k in range(3)]
    need(all(sum(q[i] for q in Q)==0 for i in range(9)), 'circuit relation')
    need(rank(Q)==cert['circuit_rank']==5, 'circuit rank')
    need(all(rank(Q[:k]+Q[k+1:])==cert['every_five_rank']==5 for k in range(6)), 'five point independence')
    determinants = []
    for k in range(6):
        if k < 3:
            rp,cp=k,0
            upt=[int(i==k) for i in range(3)]
            vpt=M[k]
        else:
            rp,cp=0,k-3
            upt=[M[i][cp] for i in range(3)]
            vpt=[int(j==cp) for j in range(3)]
        point=[upt[i] for i in range(3) if i!=rp]+[vpt[j] for j in range(3) if j!=cp]
        eq=equations(M,rp,cp)
        need(all(evaluate(f,point)==0 for f in eq), 'rank one point satisfies cycle equations')
        jac=[[evaluate(derivative(f,i),point) for i in range(4)] for f in eq]
        determinants.append(determinant(jac))
    need(determinants==cert['row_column_jacobian_determinants'], 'Jacobian certificate')
    need(all(determinants), 'transversality')
    a,b,c,d=[var(i) for i in range(4)]
    f,g,h,j=equations(M,0,0)
    H=add(mul(sub(a,scalar(3)),b),scale(2,a))
    K=add(mul(sub(a,scalar(4)),b),scale(3,a))
    need(sub(mul(sub(a,scalar(2)),h),mul(sub(b,scalar(4)),f))==scale(cert['elimination_first_factor'],H), 'first elimination identity')
    need(sub(mul(sub(a,scalar(3)),j),mul(sub(b,scalar(9)),g))==scale(cert['elimination_second_factor'],K), 'second elimination identity')
    need(sub(H,K)==sub(b,a), 'linear elimination')
    need(sub(H,mul(sub(a,scalar(3)),sub(b,a)))==mul(a,sub(a,scalar(1))), 'quadratic elimination')
    return determinants

def main():
    cert=json.loads(Path(__file__).with_name('certificate.json').read_text())
    determinants=verify(cert)
    controls=[]
    for label,mutator,expected in [
        ('singular matrix',lambda q:q['matrix'].__setitem__(2,[1,2,3]),'matrix determinant'),
        ('wrong circuit rank',lambda q:q.__setitem__('circuit_rank',6),'circuit rank'),
        ('corrupted Jacobian',lambda q:q['row_column_jacobian_determinants'].__setitem__(4,13),'Jacobian certificate'),
        ('wrong first elimination sign',lambda q:q.__setitem__('elimination_first_factor',2),'first elimination identity'),
        ('wrong second elimination multiplier',lambda q:q.__setitem__('elimination_second_factor',-3),'second elimination identity')
    ]:
        candidate=copy.deepcopy(cert)
        mutator(candidate)
        try:
            verify(candidate)
        except Rejection as exc:
            need(str(exc)==expected,'negative control wrong rejection: '+label)
            controls.append(label)
        else:
            raise Rejection('negative control accepted: '+label)
    print('PASS exact circuit, four elimination identities, and six reduced points')
    print('Jacobians: '+','.join(str(x) for x in determinants))
    print('PASS five reason-specific negative controls')
    print('Scope: fixed core identities only; all-r diagonal boundary exclusion is a written DVR proof')

if __name__=='__main__':
    try:
        main()
    except (Rejection,KeyError,TypeError,ValueError) as exc:
        raise SystemExit('REJECT: '+str(exc))
