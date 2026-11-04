#!/usr/bin/env python3
"""Small independent integer checker: explicit quotient, exact membership,
and modular inverse certificates proving rational rank lower bounds.
"""
import argparse
import json
from pathlib import Path


def need(condition,message):
    if not condition:
        raise SystemExit('FAIL: '+message)


def rank_lower(columns,proof,rank,name):
    rows,cols=proof['rows'],proof['columns']
    inv=proof['inverse_mod_p']
    need(proof['rank']==rank and len(rows)==len(cols)==rank,name+' rank size')
    need(len(set(rows))==len(set(cols))==rank,name+' repeated minor index')
    need(all(type(i) is int and 0<=i<len(columns[0]) for i in rows),name+' row range')
    need(all(type(j) is int and 0<=j<len(columns) for j in cols),name+' column range')
    need(len(inv)==rank and all(len(row)==rank for row in inv),name+' inverse shape')
    need(all(type(x) is int and 0<=x<101 for row in inv for x in row),name+' residue range')
    # AB=I over F_101 is a certificate: the selected integer minor is
    # nonsingular over F_101 and therefore over Q. No rank algorithm trusted.
    for i,row in enumerate(rows):
        sparse=[(j,columns[col][row]%101) for j,col in enumerate(cols) if columns[col][row]%101]
        for k in range(rank):
            need(sum(value*inv[j][k] for j,value in sparse)%101==int(i==k),
                 name+' modular inverse identity')


def proportional(value,line):
    return all(value[i]*line[j]==value[j]*line[i] for i in range(3) for j in range(i+1,3))


def check_format(item):
    a,b=item['a'],item['b']
    need((a,b) in ((3,4),(4,4),(6,6)),'unexpected format')
    M=((1,1,1),(1,2,3),(1,4,9))
    av=[[int(i==k) for i in range(a)] for k in range(3)]
    av += [[-M[i][k] if i<3 else 0 for i in range(a)] for k in range(3)]
    bv=[[M[k][j] if j<3 else 0 for j in range(b)] for k in range(3)]
    bv += [[int(j==k) for j in range(b)] for k in range(3)]
    Q=[[av[k][i]*bv[k][j] for i in range(a) for j in range(b)] for k in range(6)]
    need(all(sum(q[t] for q in Q)==0 for t in range(a*b)),'circuit relation')
    pivots=(0,1,2,b,2*b)
    outputs=[(i,j) for i in range(a) for j in range(b) if i*b+j not in pivots]
    position={pair:index for index,pair in enumerate(outputs)}
    e=len(outputs)
    def quotient(vector):
        # Closed formulas independently derived from the 5 pivot equations.
        z=list(vector)
        z[b+1]-=2*vector[b]+2*vector[1]-2*vector[0]
        z[b+2]-=3*vector[b]+3*vector[2]-3*vector[0]
        z[2*b+1]-=4*vector[2*b]+4*vector[1]-4*vector[0]
        z[2*b+2]-=9*vector[2*b]+9*vector[2]-9*vector[0]
        return [z[i*b+j] for i,j in outputs]
    need(all(not any(quotient(q)) for q in Q),'quotient kills circuit')
    # Solve W's five pivot equations and verify a left inverse exactly.
    for col in range(5):
        x=Q[col]
        coefficients=[x[2],x[b]+x[2]-x[0],x[2*b]+x[2]-x[0],x[2]-x[0],x[2]-x[1]]
        need(coefficients==[int(i==col) for i in range(5)],'five-vector circuit basis')
    def allowed(value,k):
        if any(value[position[i,j]] for i in range(3,a) for j in range(3,b)):
            return False
        for i in range(3,a):
            if not proportional([value[position[i,j]] for j in range(3)],bv[k][:3]):
                return False
        for j in range(3,b):
            if not proportional([value[position[i,j]] for i in range(3)],av[k][:3]):
                return False
        return True
    U=[]
    for k in range(6):
        cols=[quotient([int(i==r)*bv[k][j] for i in range(a) for j in range(b)]) for r in range(a)]
        cols += [quotient([av[k][i]*int(j==c) for i in range(a) for j in range(b)]) for c in range(b)]
        need(all(allowed(value,k) for value in cols),'affine tangent block containment')
        # The allowed block space has dimension 4+(a-3)+(b-3).
        # Matching lower bound proves that it is precisely the quotient tangent.
        rank_lower(cols,item['quotient_tangent_ranks'][k],a+b-2,'quotient tangent')
        U.append(cols)
    def eval_six(linear):
        values=[linear[t*e:(t+1)*e] for t in range(5)]
        return values+[[-sum(values[t][i] for t in range(5)) for i in range(e)]]
    branches=[]
    for omit in range(6):
        cols=[]
        for k in range(6):
            if k==omit:
                continue
            for value in U[k]:
                coordinates=[]
                for domain in range(5):
                    factor=int(k==domain)-int(omit==domain)
                    coordinates.extend(factor*x for x in value)
                need(all(allowed(v,j) for j,v in enumerate(eval_six(coordinates)) if j!=omit),
                     'branch differential condition')
                cols.append(coordinates)
        branches.append(cols)
    s=a+b-6
    ambient=5*(a*b-5);branch=20+5*s;common=20+3*s;span=20+15*s
    need((item['ambient_dimension'],item['branch_dimension'],item['common_dimension'],item['all_span_dimension'])
         ==(ambient,branch,common,span),'dimension claims')
    # A branch is parametrized injectively by five quotient tangents at the
    # five basis points. This gives rational upper bound 5(a+b-2).
    for k,cols in enumerate(branches):
        rank_lower(cols,item['branch_ranks'][k],branch,'branch')
    common_cols=item['common_basis']
    need(len(common_cols)==common and all(len(col)==ambient for col in common_cols),'common basis size')
    need(all(type(x) is int for col in common_cols for x in col),'common basis integer type')
    need(all(allowed(v,k) for col in common_cols for k,v in enumerate(eval_six(col))),
         'common basis tangent condition')
    rank_lower(common_cols,item['common_rank'],common,'common')
    all_cols=sum(branches,[])
    # Every generator vanishes on the doubly exterior block, hence the
    # rational span is at most 5(4+3s)=20+15s dimensional.
    need(all(col[d*e+position[i,j]]==0 for col in all_cols for d in range(5)
             for i in range(3,a) for j in range(3,b)),'all-span exterior support')
    rank_lower(all_cols,item['all_span_rank'],span,'all-span')
    need(span==common+6*(branch-common),'direct sum dimension identity')
    # Since the certified common space lies in every branch, equality of
    # this upper bound proves the six branch quotients form a direct sum.
    return {'a':a,'b':b,'branch':branch,'common':common,'normal_each':branch-common,
            'span':span,'ambient':ambient,'span_codimension':ambient-span,
            'k_branch_span':[common+k*(branch-common) for k in range(1,7)],
            'any_intersection_of_at_least_two_branches':common}


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('certificate',nargs='?',default=str(Path(__file__).with_name('CERTIFICATE.json')))
    args=parser.parse_args()
    data=json.loads(Path(args.certificate).read_text())
    need(data['schema']=='tr25-circuit-tangents-v1','schema')
    need(data['modulus']==101 and all(101%d for d in range(2,11)),'prime modulus')
    need(data['matrix']==[[1,1,1],[1,2,3],[1,4,9]],'specified circuit matrix')
    need([(x['a'],x['b']) for x in data['formats']]==[(3,4),(4,4),(6,6)],'format coverage')
    result=[check_format(item) for item in data['formats']]
    print(json.dumps({'status':'PASS','arithmetic':'integer identities and exact F_101 inverse certificates',
                      'scope':'rational tangent dimensions for the three specified formats',
                      'formats':result},sort_keys=True))


if __name__=='__main__':
    main()
