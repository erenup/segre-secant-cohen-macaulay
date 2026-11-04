#!/usr/bin/env python3
"""Generate exact rank-50 right inverses; optional Lean emission after scope freeze.

All arithmetic uses Python integers and Fraction.  The generated identities are
subsequently checked by Lean against the coordinate Jacobian definitions.
"""
from fractions import Fraction
from hashlib import sha256
from itertools import product
from math import lcm
from pathlib import Path
import argparse
import json

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_WITNESS = ROOT / 'certificate' / 'witness.json'
DIMS = (3, 4, 5)
COORDS = list(product(*(range(n) for n in DIMS)))


def require(condition, message):
    if not condition:
        raise SystemExit(message)


def jacobian(terms):
    return [[
        (terms[t]['b'][j] * terms[t]['c'][k] if i == u else 0)
        if mode == 0 else
        (terms[t]['a'][i] * terms[t]['c'][k] if j == u else 0)
        if mode == 1 else
        (terms[t]['a'][i] * terms[t]['b'][j] if k == u else 0)
        for t in range(5) for mode, n in enumerate(DIMS) for u in range(n)
    ] for i, j, k in COORDS]


def rref(matrix, ncols=None):
    a = [[Fraction(v) for v in row] for row in matrix]
    cols = len(a[0]) if ncols is None else ncols
    pivots = []
    for c in range(cols):
        h = len(pivots)
        p = next((p for p in range(h, len(a)) if a[p][c]), None)
        if p is None:
            continue
        a[h], a[p] = a[p], a[h]
        v = a[h][c]
        a[h] = [x / v for x in a[h]]
        for i in range(len(a)):
            if i != h and a[i][c]:
                v = a[i][c]
                a[i] = [x - v*y for x, y in zip(a[i], a[h])]
        pivots.append(c)
        if len(pivots) == len(a):
            break
    return a, pivots


def rank_data(terms):
    j = jacobian(terms)
    _, rows = rref(list(map(list, zip(*j))))
    require(len(rows) == 50, 'Jacobian rank is not 50')
    a = [j[i] for i in rows]
    aug = [row + [int(i == h) for h in range(50)] for i, row in enumerate(a)]
    red, cols = rref(aug, 60)
    require(len(cols) == 50, 'Selected rows are not independent')
    b = [[Fraction(0) for _ in range(50)] for _ in range(60)]
    for i, c in enumerate(cols):
        b[c] = red[i][60:]
    scale = lcm(*(x.denominator for row in b for x in row))
    inv = [[int(x * scale) for x in row] for row in b]
    require(scale != 0, 'Zero scaling factor')
    for i in range(50):
        for h in range(50):
            require(sum(a[i][k] * inv[k][h] for k in range(60)) == scale * (i == h),
                    f'Right inverse identity fails at {i}, {h}')
    return {'selected_rows': [list(COORDS[i]) for i in rows],
            'pivot_columns': cols, 'scale': scale, 'inverse': inv}


def vector(items):
    return '![' + ', '.join(items) + ']'


def nested_sum(terms):
    result = '0'
    for t in reversed(terms):
        result = f'({t} + {result})'
    return result


def emit_lean(terms, certs):
    for d, (f, cert) in enumerate(zip(terms, certs)):
        scale = cert['scale']
        prefix = f'familyInverse{d}Row'
        basis = f'familyBasis{d}'
        rows = cert['selected_rows']
        inv = cert['inverse']
        out = ['import TR25Family.Definitions', '', 'namespace TR25Family', '',
               f'def {basis} (i j : Fin 50) : ℤ := if i = j then 1 else 0', '',
               f'def familyRows{d} : Fin 50 → Coord 3 4 5 :=',
               '  ' + vector([f'(({i}, {j}), {k})' for i, j, k in rows]), '',
               f'def familySelected{d} (R : Type*) [CommRing R] : Matrix (Fin 50) (Param 3 4 5) R :=',
               f'  (familyJacobian R {d}).submatrix familyRows{d} id', '']
        for i, row in enumerate(inv):
            summands = [f'({v}) * {basis} {j} j' for j, v in enumerate(row) if v]
            param = 'j' if summands else '_j'
            out.extend([f'def {prefix}{i:02d} ({param} : Fin 50) : ℤ :=',
                        '  ' + (' + '.join(summands) if summands else '0'), ''])
        out.extend([f'def familyInverse{d} : Matrix (Param 3 4 5) (Fin 50) ℤ :=',
                    '  fun p => match p.2 with'])
        for off, n, pat in [(0, 3, 'Sum.inl i'), (3, 4, 'Sum.inr (Sum.inl i)'),
                            (7, 5, 'Sum.inr (Sum.inr i)')]:
            values = vector([vector([f'{prefix}{12*t+off+i:02d}' for i in range(n)]) for t in range(5)])
            out.append(f'  | {pat} => {values} p.1 i')
        out.extend(['', 'end TR25Family', ''])
        (ROOT/'TR25Family'/f'RankData{d}.lean').write_text('\n'.join(out))
        full = jacobian(f)
        selected = [full[COORDS.index(tuple(p))] for p in rows]
        for chunk in range(0, 50, 10):
            out = [f'import TR25Family.RankData{d}', '', 'set_option maxRecDepth 10000',
                   'set_option maxHeartbeats 8000000', '', 'namespace TR25Family', '']
            for i in range(chunk, chunk+10):
                products = [f'({v}) * {prefix}{k:02d} j' for k, v in enumerate(selected[i])]
                groups = []
                for t in range(5):
                    a = nested_sum(products[12*t:12*t+3])
                    b = nested_sum(products[12*t+3:12*t+7])
                    c = nested_sum(products[12*t+7:12*t+12])
                    groups.append(f'({a} + ({b} + {c}))')
                expanded = nested_sum(groups)
                active = ', '.join(f'{prefix}{k:02d}' for k, v in enumerate(selected[i]) if v)
                simplifiers = ['zero_mul']
                if 1 in selected[i]:
                    simplifiers.append('one_mul')
                simplifiers += ['zero_add', 'add_zero']
                nonzero_columns = [k for k, v in enumerate(selected[i]) if v]
                closes_by_unfolding = (
                    len(nonzero_columns) == 1 and
                    selected[i][nonzero_columns[0]] == 1 and
                    inv[nonzero_columns[0]] == [scale * int(i == j) for j in range(50)]
                )
                out.extend([f'theorem familyRightInverse{d}Row{i:02d} (j : Fin 50) :',
                    f'    (familySelected{d} ℤ * familyInverse{d}) {i} j =',
                    f'      (({scale} : ℤ) • (1 : Matrix (Fin 50) (Fin 50) ℤ)) {i} j := by',
                    f'  change (familySelected{d} ℤ * familyInverse{d}) {i} j = {scale} * {basis} {i} j',
                    '  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,',
                    '    Fin.sum_univ_succ]',
                    f'  change {expanded} = {scale} * {basis} {i} j',
                    '  simp only [' + ', '.join(simplifiers) + ']',
                    f'  simp only [{active}]'])
                if not closes_by_unfolding:
                    out.append('  ring')
                out.append('')
            out.extend(['end TR25Family', ''])
            (ROOT/'TR25Family'/f'RankRows{d}_{chunk:02d}.lean').write_text('\n'.join(out))


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--witness', type=Path, default=DEFAULT_WITNESS)
    p.add_argument('--emit-lean', action='store_true')
    args = p.parse_args()
    raw = args.witness.read_bytes()
    witness = json.loads(raw)
    require(witness['format'] in ([3, 3, 5], [3, 4, 5]) and witness['r'] == 5,
            'Unexpected source witness format')
    small = witness['decompositions']
    require(len(small) == 2 and all(len(d) == 5 for d in small), 'Wrong factor count')
    for d in small:
        for term in d:
            require(set(term) == {'a', 'b', 'c'}, 'Unexpected term keys')
            for key, n in zip('abc', witness['format']):
                require(len(term[key]) == n and all(type(v) is int for v in term[key]),
                        'Bad integer factor vector')
    terms = [[{'a': term['a'], 'b': term['b'] + [0] * (4 - len(term['b'])), 'c': term['c']}
              for term in dec] for dec in small]
    certs = [rank_data(d) for d in terms]
    data = {'schema': 'TR25Family.rank.v1', 'source_witness_sha256': sha256(raw).hexdigest(),
            'format': list(DIMS), 'rank': 50, 'coordinate_order': 'a,b,c; c varies fastest',
            'parameter_order': 'term; a entries, b entries, c entries',
            'decompositions': terms, 'certificates': certs}
    path = ROOT/'certificate'/'rank_data.json'
    path.write_text(json.dumps(data, indent=2) + '\n')
    if args.emit_lean:
        emit_lean(terms, certs)
    for d, cert in enumerate(certs):
        print(f"decomposition {d}: 50 selected rows; scaled right inverse k={cert['scale']}; identity checked")
    print('rank_data.json sha256:', sha256(path.read_bytes()).hexdigest())


if __name__ == '__main__':
    main()
