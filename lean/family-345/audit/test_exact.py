#!/usr/bin/env python3
"""Substantive fail-closed controls for the independent exact/literal checks."""
import ast
import copy
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import unittest

sys.dont_write_bytecode = True
import check_exact
import check_literal_data

ROOT = Path(__file__).resolve().parent.parent
MODES = [('normal', [], '1'), ('optimized', ['-O'], '1'), ('hash-seed', [], '8675309')]
EXACT_ERRORS = {
    'equality': 'tensor equality with explicit witness',
    'zero_factor': 'zero factor',
    'proportional_terms': 'proportional summands',
    'same_decomposition': 'decomposition directions are not different',
    'pair_rank': 'pair-product rank is not five',
    'jacobian_rank': 'Jacobian rank is not fifty',
    'boolean_coefficient': 'integer factor coefficient',
    'unknown_field': 'witness fields',
}
LITERAL_ERRORS = {
    'wrong_factor': 'family factor literals',
    'wrong_type': 'family declaration type',
    'wrong_q': 'q matrix literals',
    'wrong_padding': 'witness q-slice padding linkage',
    'boolean_coefficient': 'integer factor coefficient',
}
EXPECTED_EXACT = {
    'arithmetic': 'integers and Fraction; all ranks by full rational elimination',
    'column_ratio_determinants': ['-1/18', '4/9', '-3/2'],
    'first_direction_indices_absent_from_second': [0, 1, 2, 3, 4],
    'flattening_ranks': [3, 3, 5], 'format': [3, 4, 5],
    'jacobian_ranks': [50, 50], 'jacobian_shape': [60, 60],
    'pair_ranks': [[5, 5, 5], [5, 5, 5]],
    'row_ratio_determinants': ['-1/18', '1/3', '-2'],
    'scope': 'one finite witness; no geometric or all-r conclusion',
    'status': 'PASS', 'tensor_coordinates': 60, 'terms_per_decomposition': 5,
    'third_factor_ranks': [5, 5],
}
EXACT_OUTPUT = (json.dumps(EXPECTED_EXACT, sort_keys=True) + '\n').encode()
LITERAL_OUTPUT = b'PASS: padded factor literals, six Q matrices, witness padding and ratio base matrix\n'

def execute(script, flags, seed, extra=()):
    command = [sys.executable, '-S', '-s', '-B', *flags, str(ROOT / 'audit' / script), *extra]
    env = {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': seed,
           'TMPDIR': str(ROOT / '.lake')}
    return subprocess.run(command, cwd=ROOT, env=env, stdin=subprocess.DEVNULL,
                          capture_output=True, timeout=120)

class ExactControls(unittest.TestCase):
    def test_registered_controls_complete(self):
        self.assertEqual(set(EXACT_ERRORS), set(check_exact.CONTROLS))
        self.assertEqual(set(LITERAL_ERRORS), set(check_literal_data.CONTROLS))
        self.assertNotIn('accepted negative control', EXACT_ERRORS.values())
        self.assertNotIn('accepted negative control', LITERAL_ERRORS.values())

    def test_positive_exact_modes(self):
        for mode, flags, seed in MODES:
            with self.subTest(mode=mode):
                result = execute('check_exact.py', flags, seed)
                self.assertEqual(result.returncode, 0)
                self.assertEqual(result.stderr, b'')
                self.assertEqual(result.stdout, EXACT_OUTPUT)

    def test_exact_controls_require_intended_errors(self):
        for mode, flags, seed in MODES:
            for control, error in EXACT_ERRORS.items():
                with self.subTest(mode=mode, control=control):
                    result = execute('check_exact.py', flags, seed, ['--negative-control', control])
                    self.assertEqual(result.returncode, 1)
                    self.assertEqual(result.stdout, b'')
                    self.assertEqual(result.stderr, ('FAIL: ' + error + '\n').encode())

    def test_positive_literal_modes(self):
        for mode, flags, seed in MODES:
            with self.subTest(mode=mode):
                result = execute('check_literal_data.py', flags, seed)
                self.assertEqual(result.returncode, 0)
                self.assertEqual(result.stderr, b'')
                self.assertEqual(result.stdout, LITERAL_OUTPUT)

    def test_literal_controls_require_intended_errors(self):
        for mode, flags, seed in MODES:
            for control, error in LITERAL_ERRORS.items():
                with self.subTest(mode=mode, control=control):
                    result = execute('check_literal_data.py', flags, seed, ['--negative-control', control])
                    self.assertEqual(result.returncode, 1)
                    self.assertEqual(result.stdout, b'')
                    self.assertEqual(result.stderr, ('FAIL: ' + error + '\n').encode())

    def test_integer_json_and_schema_controls(self):
        for module in (check_exact, check_literal_data):
            for raw in ('{"x":1,"x":2}', '{"x":1.5}', '{"x":NaN}'):
                with self.subTest(module=module.__name__, raw=raw), self.assertRaises(SystemExit):
                    json.loads(raw, object_pairs_hook=module.unique_pairs,
                               parse_float=module.reject_number, parse_constant=module.reject_number)
        original = check_exact.read_json(ROOT / 'certificate/witness.json')
        for replacement in (True, 5, [], '3,4,5'):
            changed = copy.deepcopy(original)
            changed['format'] = replacement
            with self.subTest(replacement=replacement), self.assertRaises(SystemExit):
                check_exact.validate_shape(changed)

    def test_exact_arithmetic_source(self):
        for name in ('check_exact.py', 'check_literal_data.py'):
            tree = ast.parse((ROOT / 'audit' / name).read_text())
            for node in ast.walk(tree):
                self.assertNotIsInstance(node, ast.Assert)
                if isinstance(node, ast.Constant):
                    self.assertNotIn(type(node.value), (float, complex))
                if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
                    self.assertNotIn(node.func.id, {'float', 'complex', 'eval', 'exec', 'compile', '__import__'})

if __name__ == '__main__':
    unittest.main()
