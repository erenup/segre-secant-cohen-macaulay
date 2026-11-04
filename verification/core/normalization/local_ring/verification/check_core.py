#!/usr/bin/env python3
"""Check exact polynomial and rational identities for the rank-one-section proof.

This checks the core torus-elimination identity, six tangent determinants,
the avoidance determinant polynomial, and both symbolic arc coefficient
identities. It does not formalize normalization geometry or universal tensor
statements. Three mutations must fail with the same behavior under python -O.
"""

import argparse
from fractions import Fraction as F
import json

ZERO = (0, 0, 0, 0)


def const(c):
    return {} if c == 0 else {ZERO: F(c)}


def var(i):
    k = list(ZERO)
    k[i] = 1
    return {tuple(k): F(1)}


def add(*ps):
    result = {}
    for p in ps:
        for k, c in p.items():
            result[k] = result.get(k, F(0)) + c
    return {k: c for k, c in result.items() if c}


def scale(a, p):
    return {k: F(a) * c for k, c in p.items() if a * c}


def mul(*ps):
    result = const(1)
    for p in ps:
        nxt = {}
        for k, c in result.items():
            for ell, d in p.items():
                key = tuple(x + y for x, y in zip(k, ell))
                nxt[key] = nxt.get(key, F(0)) + c * d
        result = {k: c for k, c in nxt.items() if c}
    return result


def det(a):
    return (a[0][0] * (a[1][1] * a[2][2] - a[1][2] * a[2][1])
            - a[0][1] * (a[1][0] * a[2][2] - a[1][2] * a[2][0])
            + a[0][2] * (a[1][0] * a[2][1] - a[1][1] * a[2][0]))


def pdet(a):
    return add(mul(a[0][0], a[1][1], a[2][2]),
               mul(a[0][1], a[1][2], a[2][0]),
               mul(a[0][2], a[1][0], a[2][1]),
               scale(-1, mul(a[0][2], a[1][1], a[2][0])),
               scale(-1, mul(a[0][1], a[1][0], a[2][2])),
               scale(-1, mul(a[0][0], a[1][2], a[2][1])))


def inverse(a):
    work = [[F(x) for x in row] + [F(i == j) for j in range(3)]
            for i, row in enumerate(a)]
    for j in range(3):
        pivot = next((i for i in range(j, 3) if work[i][j]), None)
        if pivot is None:
            raise SystemExit('REJECT: singular matrix')
        work[j], work[pivot] = work[pivot], work[j]
        value = work[j][j]
        work[j] = [x / value for x in work[j]]
        for i in range(3):
            if i != j:
                value = work[i][j]
                work[i] = [x - value * y for x, y in zip(work[i], work[j])]
    return [row[3:] for row in work]


def require(condition, name):
    if not condition:
        raise SystemExit('REJECT: ' + name)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutate', choices=['polynomial', 'core', 'arc'])
    args = parser.parse_args()
    u, v, s, t = (var(i) for i in range(4))
    shift = lambda x, c: add(x, const(-c))
    e1 = add(mul(shift(u, 2), s), scale(-2, shift(u, 1)))
    e2 = add(mul(shift(u, 3), t), scale(-3, shift(u, 1)))
    e3 = add(mul(shift(v, 4), s), scale(-4, shift(v, 1)))
    e4 = add(mul(shift(v, 9), t), scale(-9, shift(v, 1)))
    lhs = add(scale(3, mul(shift(u, 4), add(mul(shift(u, 2), e3),
                                         scale(-1, mul(shift(v, 4), e1))))),
              scale(-1, mul(shift(u, 3), add(mul(shift(u, 3), e4),
                                           scale(-1, mul(shift(v, 9), e2))))))
    rhs = scale(5 if args.mutate == 'polynomial' else 6, mul(u, shift(u, 1)))
    require(lhs == rhs, 'torus polynomial identity')

    m = [[F(x) for x in row] for row in [[1, 1, 1], [1, 2, 3], [1, 4, 9]]]
    if args.mutate == 'core':
        m[2][2] = F(8)
    require(det(m) == 2, 'core determinant')
    rows, cols = [], []
    for i in range(3):
        k, ell = [j for j in range(3) if j != i]
        rows.append(det([[F(1)] * 3,
                         [m[i][j] / m[k][j] for j in range(3)],
                         [m[i][j] / m[ell][j] for j in range(3)]]))
        cols.append(det([[F(1)] * 3,
                         [m[j][i] / m[j][k] for j in range(3)],
                         [m[j][i] / m[j][ell] for j in range(3)]]))
    require(rows == [F(-1, 18), F(1, 3), F(-2)], 'row tangent determinants')
    require(cols == [F(-1, 18), F(4, 9), F(-3, 2)], 'column tangent determinants')

    vv = [const(1), u, mul(u, u)]
    avoidance = pdet([[const(1)] * 3, vv,
                      [const(1), scale(F(1, 2), u), scale(F(1, 3), mul(u, u))]])
    require(avoidance == scale(F(-1, 6), mul(u, shift(u, 1), shift(u, 3))),
            'avoidance determinant polynomial')

    inv = inverse(m)
    # Row coefficients lambda=v^t M^{-1}; column coefficients mu=-M^{-1}v.
    lam = [add(*(scale(inv[j][i], vv[j]) for j in range(3))) for i in range(3)]
    mu = [add(*(scale(-inv[i][j], vv[j]) for j in range(3))) for i in range(3)]
    if args.mutate == 'arc':
        lam[0] = add(lam[0], const(1))
    row_sum = [add(*(scale(m[i][j], lam[i]) for i in range(3))) for j in range(3)]
    col_sum = [add(*(scale(-m[i][j], mu[j]) for j in range(3))) for i in range(3)]
    require(row_sum == vv, 'row arc coefficient identity')
    require(col_sum == vv, 'column arc coefficient identity')
    print('PASS ' + json.dumps({'polynomial_identity': True,
                               'row_determinants': [str(x) for x in rows],
                               'column_determinants': [str(x) for x in cols],
                               'avoidance_polynomial': True,
                               'symbolic_row_and_column_arcs': True}, sort_keys=True))


if __name__ == '__main__':
    main()
