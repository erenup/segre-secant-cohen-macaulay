#!/usr/bin/env python3
"""Independent integer/Fraction checks of the fixed (3,4,5) certificate.

No Lean rank data or previous checker code is used. Gaussian elimination
over Q supplies both bounds for every reported rank.
"""
import argparse
import copy
from fractions import Fraction
from itertools import combinations, product
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DIMS = (3, 4, 5)
KEYS = ('a', 'b', 'c')
COORDS = tuple(product(*(range(d) for d in DIMS)))
BASE_MATRIX = ((1, 1, 1), (1, 2, 3), (1, 4, 9))
CONTROLS = ('equality', 'zero_factor', 'proportional_terms', 'same_decomposition',
            'pair_rank', 'jacobian_rank', 'boolean_coefficient', 'unknown_field')

def need(ok, message):
    if not ok:
        raise SystemExit('FAIL: ' + message)

def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        need(key not in result, 'duplicate JSON field')
        result[key] = value
    return result

def reject_number(value):
    raise SystemExit('FAIL: non-integer JSON number: ' + value)

def read_json(path):
    need(path.is_file() and not path.is_symlink() and path.stat().st_size <= 200000,
         'invalid certificate file')
    return json.loads(path.read_text(encoding='utf-8'), object_pairs_hook=unique_pairs,
                      parse_float=reject_number, parse_constant=reject_number)

def validate_shape(data):
    need(type(data) is dict and set(data) == {'format', 'r', 'decompositions'}, 'witness fields')
    need(type(data['format']) is list and all(type(x) is int for x in data['format'])
         and data['format'] == list(DIMS), 'witness format')
    need(type(data['r']) is int and data['r'] == 5, 'term count')
    ds = data['decompositions']
    need(type(ds) is list and len(ds) == 2, 'two decompositions')
    for decomp in ds:
        need(type(decomp) is list and len(decomp) == 5, 'five terms')
        for term in decomp:
            need(type(term) is dict and set(term) == set(KEYS), 'factor fields')
            for key, dim in zip(KEYS, DIMS):
                vector = term[key]
                need(type(vector) is list and len(vector) == dim, 'factor shape')
                need(all(type(x) is int and abs(x) <= 1000 for x in vector), 'integer factor coefficient')
    return ds

def rank(rows):
    need(bool(rows) and bool(rows[0]) and all(len(row) == len(rows[0]) for row in rows),
         'rank matrix shape')
    work = [[Fraction(x) for x in row] for row in rows]
    pivot_row = 0
    for column in range(len(work[0])):
        pivot = next((i for i in range(pivot_row, len(work)) if work[i][column]), None)
        if pivot is None:
            continue
        work[pivot_row], work[pivot] = work[pivot], work[pivot_row]
        scale = work[pivot_row][column]
        work[pivot_row] = [x / scale for x in work[pivot_row]]
        for i in range(pivot_row + 1, len(work)):
            scale = work[i][column]
            if scale:
                work[i] = [x - scale * y for x, y in zip(work[i], work[pivot_row])]
        pivot_row += 1
    return pivot_row

def determinant(rows):
    work = [[Fraction(x) for x in row] for row in rows]
    need(bool(work) and all(len(row) == len(work) for row in work), 'determinant matrix shape')
    answer = Fraction(1)
    for column in range(len(work)):
        pivot = next((i for i in range(column, len(work)) if work[i][column]), None)
        if pivot is None:
            return Fraction(0)
        if pivot != column:
            work[pivot], work[column] = work[column], work[pivot]
            answer = -answer
        value = work[column][column]
        answer *= value
        for i in range(column + 1, len(work)):
            scale = work[i][column] / value
            for j in range(column + 1, len(work)):
                work[i][j] -= scale * work[column][j]
            work[i][column] = 0
    return answer

def pure(term):
    return [term['a'][i] * term['b'][j] * term['c'][k] for i, j, k in COORDS]

def proportional(left, right):
    pivot = next((i for i, x in enumerate(right) if x), None)
    need(pivot is not None, 'zero direction')
    return all(x * right[pivot] == left[pivot] * y for x, y in zip(left, right))

def explicit_witness():
    # The first three slices are rows of M, and the last two are negative columns.
    answer = {}
    for i, j, k in COORDS:
        value = 0
        if j < 3:
            if k < 3 and i == k:
                value = BASE_MATRIX[k][j]
            elif k >= 3 and j == k - 3:
                value = -BASE_MATRIX[i][k - 3]
        answer[i, j, k] = value
    return answer

def flatten(tensor, mode):
    others = [j for j in range(3) if j != mode]
    rows = []
    for pair in product(*(range(DIMS[j]) for j in others)):
        row = []
        for coordinate in range(DIMS[mode]):
            full = [0, 0, 0]
            full[mode] = coordinate
            for j, value in zip(others, pair):
                full[j] = value
            row.append(tensor[tuple(full)])
        rows.append(row)
    return rows

def pair_matrix(decomp, first, second):
    return [[term[KEYS[first]][i] * term[KEYS[second]][j] for term in decomp]
            for i in range(DIMS[first]) for j in range(DIMS[second])]

def jacobian(decomp):
    rows = []
    for coordinate in COORDS:
        row = []
        for term in decomp:
            for mode in range(3):
                others = [j for j in range(3) if j != mode]
                value = term[KEYS[others[0]]][coordinate[others[0]]] * term[KEYS[others[1]]][coordinate[others[1]]]
                row.extend(value if q == coordinate[mode] else 0 for q in range(DIMS[mode]))
        rows.append(row)
    return rows

def ratio_determinants():
    row_values, column_values = [], []
    for i in range(3):
        other = [j for j in range(3) if j != i]
        row_values.append(determinant([[1, 1, 1]] + [
            [Fraction(BASE_MATRIX[i][k], BASE_MATRIX[j][k]) for k in range(3)] for j in other]))
        column_values.append(determinant([[1, 1, 1]] + [
            [Fraction(BASE_MATRIX[k][i], BASE_MATRIX[k][j]) for k in range(3)] for j in other]))
    need(row_values == [Fraction(-1, 18), Fraction(1, 3), Fraction(-2)], 'row ratio determinants')
    need(column_values == [Fraction(-1, 18), Fraction(4, 9), Fraction(-3, 2)], 'column ratio determinants')
    return row_values, column_values

def verify(data, corrupt_jacobian=False):
    decompositions = validate_shape(data)
    term_vectors = []
    for decomp in decompositions:
        need(all(any(term[key]) for term in decomp for key in KEYS), 'zero factor')
        vectors = [pure(term) for term in decomp]
        need(all(any(vector) for vector in vectors), 'zero pure term')
        need(all(not proportional(vectors[i], vectors[j]) for i, j in combinations(range(5), 2)),
             'proportional summands')
        term_vectors.append(vectors)
    missing = [i for i in range(5) if all(not proportional(term_vectors[0][i], v) for v in term_vectors[1])]
    need(bool(missing), 'decomposition directions are not different')

    pair_ranks = []
    third_ranks = []
    for decomp in decompositions:
        values = [rank(pair_matrix(decomp, a, b)) for a, b in combinations(range(3), 2)]
        need(values == [5, 5, 5], 'pair-product rank is not five')
        pair_ranks.append(values)
        value = rank([[term['c'][i] for term in decomp] for i in range(5)])
        need(value == 5, 'third-factor rank is not five')
        third_ranks.append(value)

    target = explicit_witness()
    for vectors in term_vectors:
        total = [sum(vector[i] for vector in vectors) for i in range(60)]
        need(total == [target[p] for p in COORDS], 'tensor equality with explicit witness')
    flattening_ranks = [rank(flatten(target, mode)) for mode in range(3)]
    need(flattening_ranks == [3, 3, 5], 'flattening ranks')

    jacobian_ranks = []
    for decomp in decompositions:
        matrix = jacobian(decomp)
        need(len(matrix) == 60 and all(len(row) == 60 for row in matrix), 'Jacobian dimensions')
        if corrupt_jacobian:
            matrix = [row[:-12] + [0] * 12 for row in matrix]
        value = rank(matrix)
        need(value == 50, 'Jacobian rank is not fifty')
        jacobian_ranks.append(value)
    rows, columns = ratio_determinants()
    return {'status': 'PASS', 'format': list(DIMS), 'tensor_coordinates': 60,
            'terms_per_decomposition': 5, 'pair_ranks': pair_ranks,
            'third_factor_ranks': third_ranks, 'flattening_ranks': flattening_ranks,
            'jacobian_shape': [60, 60], 'jacobian_ranks': jacobian_ranks,
            'first_direction_indices_absent_from_second': missing,
            'row_ratio_determinants': [str(x) for x in rows],
            'column_ratio_determinants': [str(x) for x in columns],
            'arithmetic': 'integers and Fraction; all ranks by full rational elimination',
            'scope': 'one finite witness; no geometric or all-r conclusion'}

def mutate(data, control):
    changed = copy.deepcopy(data)
    ds = changed['decompositions']
    if control == 'equality':
        ds[1][0]['c'][0] += 1
    elif control == 'zero_factor':
        ds[0][0]['a'] = [0, 0, 0]
    elif control == 'proportional_terms':
        ds[0][1] = copy.deepcopy(ds[0][0])
    elif control == 'same_decomposition':
        ds[1] = copy.deepcopy(ds[0])
    elif control == 'pair_rank':
        for decomp in ds:
            for term in decomp:
                term['a'] = [sum(term['a']), 0, 0]
    elif control == 'boolean_coefficient':
        ds[0][0]['a'][0] = True
    elif control == 'unknown_field':
        changed['extra'] = 0
    return changed

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--negative-control', choices=CONTROLS)
    args = parser.parse_args()
    data = read_json(ROOT / 'certificate/witness.json')
    if args.negative_control:
        data = mutate(data, args.negative_control)
    result = verify(data, args.negative_control == 'jacobian_rank')
    need(not args.negative_control, 'accepted negative control')
    print(json.dumps(result, sort_keys=True))

if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, IndexError, UnicodeError, RecursionError) as error:
        raise SystemExit('FAIL: exact-check input: ' + type(error).__name__)
