#!/usr/bin/env python3
"""Independent exact check of the five-term double decomposition.

All tensor data are integers.  Full column-space ranks modulo 101 certify
the corresponding characteristic-zero tangent ranks.  No external
package and no assertions. Negative controls are selected on the command line.
"""
import argparse
from copy import deepcopy
from itertools import product


def require(condition, message):
    if not condition:
        raise SystemExit(message)


M = [[1,1,1], [1,2,3], [1,4,9]]
E3 = [[int(i == j) for i in range(3)] for j in range(3)]
E5 = [[int(i == j) for i in range(5)] for j in range(5)]
q = [(E3[i], M[i]) for i in range(3)]
q += [([-M[i][j] for i in range(3)], E3[j]) for j in range(3)]
left = [(a, b, E5[i]) for i, (a,b) in enumerate(q[:5])]
right = [(q[i][0], q[i][1], [E5[i][j]-E5[4][j] for j in range(5)])
         for i in range(4)]
right += [([-x for x in q[5][0]], q[5][1], E5[4])]


def tensor(terms, shape):
    return [sum(a[i]*b[j]*c[k] for a,b,c in terms)
            for i,j,k in product(*(range(n) for n in shape))]


def rank_mod(matrix):
    p = 101
    a = [[x % p for x in row] for row in matrix]
    r = 0
    pivots = []
    for c in range(len(a[0])):
        row = next((i for i in range(r, len(a)) if a[i][c]), None)
        if row is None:
            continue
        a[r], a[row] = a[row], a[r]
        inverse = pow(a[r][c], -1, p)
        for i in range(r+1, len(a)):
            factor = a[i][c]*inverse % p
            for j in range(c, len(a[0])):
                a[i][j] = (a[i][j]-factor*a[r][j]) % p
        pivots.append(c)
        r += 1
        if r == len(a):
            break
    return r, pivots


def tangent(terms, shape):
    columns = []
    for a,b,c in terms:
        for slot,n in enumerate(shape):
            for h in range(n):
                factors = [a,b,c]
                factors[slot] = [int(i == h) for i in range(n)]
                columns.append(tensor([factors], shape))
    return [list(row) for row in zip(*columns)]


def padded(terms):
    return [[list(v)+[0]*(6-len(v)) for v in term] for term in terms]


def verify(a,b):
    require(len(a) == len(b) == 5, 'term count')
    require(tensor(a,(3,3,5)) == tensor(b,(3,3,5)), 'tensor equality failed')
    # No summand vanishes; summand tensor sets differ even as exact vectors.
    ta = [tuple(tensor([term],(3,3,5))) for term in a]
    tb = [tuple(tensor([term],(3,3,5))) for term in b]
    require(all(any(t) for t in ta+tb), 'zero summand')
    require(len(set(ta)) == len(set(tb)) == 5, 'repeated summand')
    require(set(ta) != set(tb), 'same unordered decomposition')
    for terms in (a,b):
        small_rank,_ = rank_mod(tangent(terms,(3,3,5)))
        require(small_rank == 45, 'small tangent rank')
        large_rank,_ = rank_mod(tangent(padded(terms),(6,6,6)))
        require(large_rank == 80, 'large tangent rank')
    return True


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--negative-control', choices=('equality', 'degeneracy'))
    args = parser.parse_args()
    a, b = deepcopy(left), deepcopy(right)
    if args.negative_control == 'equality':
        b[-1][0][0] += 1
    elif args.negative_control == 'degeneracy':
        a = [deepcopy(left[0]) for _ in range(5)]
        b = deepcopy(a)
    verify(a,b)
    print('PASS: exact two distinct five-term decompositions; tangent ranks 45 and 80 on both modulo 101')


if __name__ == '__main__':
    main()
