#!/usr/bin/env python3
"""Bind the (3,4,5) factor, Q-slice and witness literals to fixed sources."""
import argparse
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
WITNESS_SHA256 = 'c0f2ecb8ce43cf50ec88bc3bdb01b8ab0b5b5caf908ce8a0e2eac335dc16cc80'
DEFINITIONS_SHA256 = 'cdefbfb9a0f7525cb7203f251e8a4321af38ecce94708558390e66b6b3f7b2d4'
CONTROLS = ('wrong_factor', 'wrong_type', 'wrong_q', 'wrong_padding', 'boolean_coefficient')
BASE = [[1, 1, 1], [1, 2, 3], [1, 4, 9]]

def need(ok, message):
    if not ok:
        raise SystemExit('FAIL: ' + message)

def compact(text):
    return re.sub(r'\s+', '', text)

def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        need(key not in result, 'duplicate JSON field')
        result[key] = value
    return result

def reject_number(value):
    raise SystemExit('FAIL: non-integer JSON number: ' + value)

def literal(data):
    if isinstance(data, list):
        return '![' + ', '.join(literal(x) for x in data) + ']'
    need(type(data) is int, 'integer factor coefficient')
    return str(data)

def declaration(source, name, following):
    matches = list(re.finditer(r'^def ' + re.escape(name) + r'\b.*?\n\n(?=' + following + ')', source, re.S | re.M))
    need(len(matches) == 1, name + ' declaration boundary')
    return matches[0].group(0).strip()

def check(data, source):
    need(type(data) is dict and set(data) == {'format', 'r', 'decompositions'}, 'witness fields')
    need(type(data['format']) is list and all(type(x) is int for x in data['format'])
         and data['format'] == [3, 4, 5], 'witness format')
    need(type(data['r']) is int and data['r'] == 5, 'five terms')
    ds = data['decompositions']
    need(type(ds) is list and len(ds) == 2, 'two decompositions')
    factors = []
    for decomp in ds:
        need(type(decomp) is list and len(decomp) == 5, 'five terms')
        for term in decomp:
            need(type(term) is dict and set(term) == {'a', 'b', 'c'}, 'factor fields')
            for key, size in [('a', 3), ('b', 4), ('c', 5)]:
                need(type(term[key]) is list and len(term[key]) == size, 'factor shape')
                need(all(type(x) is int for x in term[key]), 'integer factor coefficient')
            need(term['b'][3] == 0, 'padded fourth B coordinate')
        factors.append('{ ' + ', '.join(key + ' := ' + literal([t[key] for t in decomp])
                                       for key in ('a', 'b', 'c')) + ' }')
    expected = 'def family : Fin 2 → Factors 3 4 5 := ![' + ', '.join(factors) + ']'
    actual = declaration(source, 'family', 'def pure')
    need(compact(actual).startswith(compact('def family : Fin 2 → Factors 3 4 5 :=')),
         'family declaration type')
    need(compact(actual) == compact(expected), 'family factor literals')

    q = []
    for selected in range(3):
        q.append([[BASE[i][j] if i == selected else 0 for j in range(3)] for i in range(3)])
    for selected in range(3):
        q.append([[-BASE[i][j] if j == selected else 0 for j in range(3)] for i in range(3)])
    actual = declaration(source, 'q', '/-- The first five Q slices')
    expected = 'def q : Fin 6 → Matrix (Fin 3) (Fin 3) ℤ := ' + literal(q)
    need(compact(actual) == compact(expected), 'q matrix literals')

    actual = declaration(source, 'witness', 'abbrev Param')
    expected = '''def witness : Tensor 3 4 5 ℤ := fun p =>
      if hj : p.1.2.val < 3 then
        q ⟨p.2.val, Nat.lt_trans p.2.isLt (by decide)⟩ p.1.1 ⟨p.1.2.val, hj⟩
      else 0'''
    need(compact(actual) == compact(expected), 'witness q-slice padding linkage')

    match = re.search(r'^def baseMatrix : Matrix \(Fin 3\) \(Fin 3\) ℚ := (.*?)\n', source, re.M)
    need(match is not None and compact(match.group(1)) == compact(literal(BASE)), 'ratio base matrix')

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--negative-control', choices=CONTROLS)
    control = parser.parse_args().negative_control
    witness_path = ROOT / 'certificate/witness.json'
    definitions_path = ROOT / 'TR25Family/Definitions.lean'
    need(witness_path.is_file() and not witness_path.is_symlink(), 'witness path')
    need(definitions_path.is_file() and not definitions_path.is_symlink(), 'definitions path')
    raw = witness_path.read_bytes()
    source_raw = definitions_path.read_bytes()
    need(hashlib.sha256(raw).hexdigest() == WITNESS_SHA256, 'witness hash')
    need(hashlib.sha256(source_raw).hexdigest() == DEFINITIONS_SHA256, 'definitions hash')
    data = json.loads(raw, object_pairs_hook=unique_pairs,
                      parse_float=reject_number, parse_constant=reject_number)
    source = source_raw.decode('utf-8')
    if control == 'wrong_factor':
        data['decompositions'][1][0]['c'][4] = 0
    elif control == 'wrong_type':
        source = source.replace('Fin 2 → Factors 3 4 5', 'Fin 2 → Factors 3 5 5')
    elif control == 'wrong_q':
        source = source.replace('![![1,1,1], ![0,0,0]', '![![2,1,1], ![0,0,0]')
    elif control == 'wrong_padding':
        source = source.replace('if hj : p.1.2.val < 3 then', 'if hj : p.1.2.val < 4 then')
    elif control == 'boolean_coefficient':
        data['decompositions'][0][0]['a'][0] = True
    check(data, source)
    need(control is None, 'accepted negative control')
    print('PASS: padded factor literals, six Q matrices, witness padding and ratio base matrix')

if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, IndexError, UnicodeError, RecursionError) as error:
        raise SystemExit('FAIL: literal-check input: ' + type(error).__name__)
