#!/usr/bin/env python3
"""Independent exact finite-instance corroboration of REACH_DERIVATION.md.

This is not a substitute for the all-r written proof. Uses standard-library
integer/rational arithmetic only. Explicit failures remain active under -O.
"""
from fractions import Fraction
import argparse
from math import isqrt


def require(condition, message):
    if not condition:
        raise SystemExit("REJECT: " + message)


def basis(n, i):
    return [int(j == i) for j in range(n)]


def rank_mod(matrix, prime=101):
    require(prime > 1 and all(prime % d for d in range(2, isqrt(prime)+1)),
            "rank modulus not prime")
    if not matrix:
        return 0
    m = [[x % prime for x in row] for row in matrix]
    rows, cols = len(m), len(m[0])
    require(all(len(row) == cols for row in m), "ragged matrix")
    h = 0
    for col in range(cols):
        pivot = next((k for k in range(h, rows) if m[k][col]), None)
        if pivot is None:
            continue
        m[h], m[pivot] = m[pivot], m[h]
        inv = pow(m[h][col], prime-2, prime)
        m[h] = [(x*inv) % prime for x in m[h]]
        for k in range(h+1, rows):
            if m[k][col]:
                factor = m[k][col]
                m[k] = [(x-factor*y) % prime for x, y in zip(m[k], m[h])]
        h += 1
        if h == rows:
            break
    return h


def pure(a, b, c):
    return [x*y*z for x in a for y in b for z in c]


def tensor(decomposition):
    tensors = [pure(*term) for term in decomposition]
    return [sum(entries) for entries in zip(*tensors)]


def matrix_pair(a, b):
    return [x*y for x in a for y in b]


def derivative(decomposition):
    a, b, c = map(len, decomposition[0])
    columns = []
    for av, bv, cv in decomposition:
        columns.extend(pure(basis(a, i), bv, cv) for i in range(a))
        columns.extend(pure(av, basis(b, j), cv) for j in range(b))
        columns.extend(pure(av, bv, basis(c, k)) for k in range(c))
    return [list(row) for row in zip(*columns)]


def seed(r, p):
    q = r+1-p
    require(r >= 5 and p >= 3 and q >= 3, "invalid seed dimensions")
    m = [[1, 1, 1], [1, 2, 3], [1, 4, 9]]
    aa = [basis(p, i) for i in range(3)]
    aa += [[-m[i][j] for i in range(3)] + [0]*(p-3) for j in range(3)]
    bb = [row + [0]*(q-3) for row in m]
    bb += [basis(q, j) for j in range(3)]
    first = [(aa[i], bb[i], basis(r, i)) for i in range(5)]
    second = []
    for i in range(4):
        cv = basis(r, i)
        cv[4] = -1
        second.append((aa[i], bb[i], cv))
    second.append(([-x for x in aa[5]], bb[5], basis(r, 4)))
    cindex = 5
    for offset in range(p-3):
        t = offset+4
        term = (basis(p, offset+3), [1, t, t*t]+[0]*(q-3), basis(r, cindex))
        first.append(term)
        second.append(term)
        cindex += 1
    for offset in range(q-3):
        t = offset+4
        term = ([1, t, t*t]+[0]*(p-3), basis(q, offset+3), basis(r, cindex))
        first.append(term)
        second.append(term)
        cindex += 1
    require(cindex == r, "wrong number of seed terms")
    return first, second


def pad(decomposition, a, b, c):
    return [(av+[0]*(a-len(av)), bv+[0]*(b-len(bv)), cv+[0]*(c-len(cv)))
            for av, bv, cv in decomposition]


def verify_pair(first, second, label):
    r = len(first)
    require(len(second) == r, label+": unequal lengths")
    a, b, c = map(len, first[0])
    require(tensor(first) == tensor(second), label+": decompositions differ")
    require(sorted(tuple(pure(*t)) for t in first) !=
            sorted(tuple(pure(*t)) for t in second), label+": unordered decompositions same")
    for number, decomp in enumerate((first, second)):
        require(all(any(av) and any(bv) and any(cv) for av, bv, cv in decomp),
                label+": zero factor")
        pairs = [matrix_pair(av, bv) for av, bv, cv in decomp]
        require(rank_mod(pairs) == r, label+": matrix factors dependent")
        require(rank_mod([cv for av, bv, cv in decomp]) == r,
                label+": third factors dependent")
        target = r*(a+b+c-2)
        require(rank_mod(derivative(decomp)) == target,
                label+": derivative rank fails in decomposition "+str(number))
    return r*(a+b+c-2)


def det3(rows):
    a,b,c = rows[0]
    d,e,f = rows[1]
    g,h,i = rows[2]
    return a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--mutate", choices=("equality", "distinctness", "immersion", "avoidance"))
    args = parser.parse_args()
    for t in range(4, 40):
        actual = det3([[1, 1, 1], [1, t, t*t],
                       [1, Fraction(t, 2), Fraction(t*t, 3)]])
        expected = Fraction(-t*(t-1)*(t-3), 6)
        require(actual == expected and actual != 0, "avoidance determinant")
    if args.mutate:
        first, second = seed(5, 3)
        if args.mutate == "equality":
            second[0][2][0] += 1
        elif args.mutate == "distinctness":
            second = first
        elif args.mutate == "immersion":
            first, second = seed(6, 3)
            first[-1] = first[0]
            second[-1] = first[0]
        elif args.mutate == "avoidance":
            # Replace the avoidance vector v(4) of the first added term by v(1),
            # a root of the avoidance determinant, in both decompositions.
            first, second = seed(6, 3)
            for decomposition in (first, second):
                _, bv, cv = decomposition[5]
                decomposition[5] = ([1, 1, 1], bv, cv)
        verify_pair(first, second, "negative control")
        print("UNEXPECTED ACCEPT: selected negative control survived")
        return
    count = 0
    for r in range(5, 10):
        for p in range(3, r-1):
            q = r+1-p
            first, second = seed(r, p)
            seed_rank = verify_pair(first, second, f"seed {p}x{q}x{r}")
            first = pad(first, p, q+1, r)
            second = pad(second, p, q+1, r)
            ambient_rank = verify_pair(first, second, f"padded {p}x{q+1}x{r}")
            print(f"PASS r={r} seed={p}x{q}x{r} rank={seed_rank}; "
                  f"padded={p}x{q+1}x{r} rank={ambient_rank}")
            count += 1
    first, second = seed(8, 4)
    first, second = pad(first, 5, 5, 8), pad(second, 5, 5, 8)
    extra_rank = verify_pair(first, second, "selected padded 5x5x8")
    print(f"PASS additional selected r=8 padded=5x5x8 rank={extra_rank}")
    print(f"PASS exact finite-instance checks: {count} seeds, {count} padded pairs")


if __name__ == "__main__":
    main()
