#!/usr/bin/env python3
"""Bind exact inputs and proofs; require deterministic results and all controls."""
import ast
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
DRIVER_SOURCE_SHA256 = '05207b2e35e419f5e1b90b09969269fe46f6b4c038f652f536460c4d3b553fdf'
DRIVER_OUTPUT_SHA256 = '1b7d3a0b020d2110d2224fc8f35644bf8b3884d4b74e4811e6c918d97ff58745'
MODES = [('normal', [], '1'), ('optimized', ['-O'], '1'),
         ('hash-seed', [], '8675309')]
EXPECTED_CHECKERS = {'check_core.py', 'check_certificate.py'}
EXPECTED_CONTROLS = {
    'check_core.py': {
        'polynomial': (['--mutate', 'polynomial'], 'REJECT: torus polynomial identity\n'),
        'core': (['--mutate', 'core'], 'REJECT: core determinant\n'),
        'arc': (['--mutate', 'arc'], 'REJECT: row arc coefficient identity\n')},
    'check_certificate.py': {
        'modular-inverse': (['negative_controls/bad_modular_inverse.json'],
                            'FAIL: all-span modular inverse identity\n'),
        'common-tangent': (['negative_controls/bad_common_tangent.json'],
                           'FAIL: common basis tangent condition\n')}}
INTEGER_MATH = {'ceil', 'comb', 'factorial', 'floor', 'gcd', 'isqrt',
                'lcm', 'perm', 'prod', 'trunc'}
FORBIDDEN_CALLS = {'float', 'complex', 'eval', 'exec', 'compile', '__import__', 'getattr'}
FORBIDDEN_MODULES = {'cmath', 'decimal', 'random', 'statistics', 'importlib'}


def need(ok, message):
    if not ok:
        raise SystemExit('FAIL: '+message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def reject_number(value):
    raise SystemExit('FAIL: non-integer JSON number: '+value)


def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        need(key not in result, 'duplicate JSON key')
        result[key] = value
    return result


def read_json(data):
    return json.loads(data, object_pairs_hook=unique_pairs,
                      parse_float=reject_number, parse_constant=reject_number)


def proof_inventory():
    root = HERE.parent/'proofs'
    need(root.is_dir() and not root.is_symlink(), 'invalid proof directory')
    paths = list(root.iterdir())
    need({p.name for p in paths} == {'PROOF.md', 'STATEMENT.md'}, 'proof coverage')
    need(all(p.is_file() and not p.is_symlink() for p in paths), 'invalid proof file')
    return {p.name: digest(p.read_bytes()) for p in paths}


def inventory():
    need(not HERE.is_symlink(), 'invalid verification directory')
    files = {}
    for path in HERE.rglob('*'):
        need(not path.is_symlink(), 'symbolic link: '+str(path.relative_to(HERE)))
        if path.is_file():
            name = path.relative_to(HERE).as_posix()
            need('__pycache__' not in path.parts and not name.endswith('.pyc'), 'cache file: '+name)
            need(path.stat().st_size <= 4500000, 'file size: '+name)
            files[name] = path.read_bytes()
    return files


def validate_bindings(data):
    registered = {}
    for line in data.decode().splitlines():
        if not line.strip() or line.lstrip().startswith('#'):
            continue
        parts = line.split()
        need(len(parts) == 3 and all(re.fullmatch('[0-9a-f]{64}', s) for s in parts[:2]),
             'source binding syntax')
        source, curated, name = parts
        need(name not in registered, 'duplicate proof binding')
        registered[name] = curated
    need(registered == proof_inventory(), 'proof binding mismatch')
    return registered


def validate_controls(data):
    controls = read_json(data)
    need(type(controls) is dict and set(controls) == EXPECTED_CHECKERS,
         'negative-control checker coverage')
    for checker, cases in controls.items():
        need(type(cases) is list, 'negative-control list')
        seen = set()
        for case in cases:
            need(type(case) is dict and set(case) == {'name', 'arguments', 'stderr'},
                 'negative-control fields')
            name = case['name']
            need(type(name) is str and name not in seen, 'duplicate or invalid control name')
            seen.add(name)
            need(name in EXPECTED_CONTROLS[checker], 'unexpected control name')
            args, error = EXPECTED_CONTROLS[checker][name]
            need(case['arguments'] == args and case['stderr'] == error,
                 'negative-control semantics: '+name)
        need(seen == set(EXPECTED_CONTROLS[checker]), 'missing required control')
    return controls


def validate_directory():
    files = inventory()
    need({'SHA256SUMS', 'CHECKERS.txt', 'NEGATIVE_CONTROLS.json', 'INPUT_HASHES.json',
          'SOURCE_BINDINGS.txt', 'RUNNER_OUTPUT.sha256', 'run.py', 'run_checks.py'} <= set(files),
         'missing verification files')
    sums = {}
    for line in files['SHA256SUMS'].decode().splitlines():
        parts = line.split('  ', 1)
        need(len(parts) == 2 and re.fullmatch('[0-9a-f]{64}', parts[0]) is not None,
             'manifest syntax')
        sha, name = parts
        need(name not in sums, 'duplicate manifest entry')
        sums[name] = sha
    need(set(sums) == set(files)-{'SHA256SUMS'}, 'manifest coverage')
    for name, sha in sums.items():
        need(digest(files[name]) == sha, 'manifest mismatch: '+name)
    need(digest(files['run_checks.py']) == DRIVER_SOURCE_SHA256,
         'identity driver source mismatch')
    need(files['RUNNER_OUTPUT.sha256'].decode().strip() == DRIVER_OUTPUT_SHA256,
         'identity driver output binding mismatch')
    registry = {}
    for line in files['CHECKERS.txt'].decode().splitlines():
        parts = line.split()
        need(len(parts) == 2 and parts[0] in EXPECTED_CHECKERS
             and re.fullmatch('[0-9a-f]{64}', parts[1]) is not None, 'checker registry syntax')
        name, sha = parts
        need(name not in registry, 'duplicate checker')
        registry[name] = sha
    need(set(registry) == EXPECTED_CHECKERS, 'checker coverage')
    python_files = {name for name in files if name.endswith('.py')}
    need(python_files == EXPECTED_CHECKERS | {'run.py', 'run_checks.py'}, 'Python file coverage')
    modules = {Path(name).stem for name in python_files}
    need(not (modules & sys.stdlib_module_names), 'standard-library module shadow')
    for name in sorted(python_files):
        tree = ast.parse(files[name].decode(), filename=name)
        for node in ast.walk(tree):
            need(not isinstance(node, ast.Assert), 'assert in '+name)
            if isinstance(node, ast.ImportFrom):
                need(node.level == 0 and node.module, 'relative import in '+name)
                roots = [node.module.split('.')[0]]
                if node.module == 'math':
                    need(all(n.name in INTEGER_MATH for n in node.names), 'non-integer math import')
            elif isinstance(node, ast.Import):
                roots = [n.name.split('.')[0] for n in node.names]
            else:
                roots = []
            for root in roots:
                need(root in sys.stdlib_module_names | modules, 'nonstandard import in '+name)
                need(root not in FORBIDDEN_MODULES, 'inexact or dynamic module in '+name)
                if name in EXPECTED_CHECKERS:
                    need(root not in {'subprocess', 'multiprocessing', 'concurrent'}, 'checker process import')
            need(not (isinstance(node, ast.Constant) and type(node.value).__name__ in {'float', 'complex'}),
                 'inexact literal in '+name)
            if isinstance(node, ast.Call):
                if isinstance(node.func, ast.Name):
                    need(node.func.id not in FORBIDDEN_CALLS, 'inexact or dynamic call in '+name)
                if isinstance(node.func, ast.Attribute) and isinstance(node.func.value, ast.Name) and node.func.value.id == 'math':
                    need(node.func.attr in INTEGER_MATH, 'non-integer math call')
    for name, data in files.items():
        if name.endswith('.json'):
            read_json(data)
    input_hashes = read_json(files['INPUT_HASHES.json'])
    expected_inputs = EXPECTED_CHECKERS | {'CERTIFICATE.json',
        'negative_controls/bad_modular_inverse.json', 'negative_controls/bad_common_tangent.json'}
    need(type(input_hashes) is dict and set(input_hashes) == expected_inputs, 'input hash coverage')
    for name, sha in input_hashes.items():
        need(name in files and digest(files[name]) == sha, 'source input binding: '+name)
    proofs = validate_bindings(files['SOURCE_BINDINGS.txt'])
    controls = validate_controls(files['NEGATIVE_CONTROLS.json'])
    return registry, controls, proofs, {name: digest(data) for name, data in files.items()}


def execute(command, env, label):
    try:
        return subprocess.run(command, cwd=HERE, env=env, stdin=subprocess.DEVNULL,
                              capture_output=True, timeout=600)
    except subprocess.TimeoutExpired:
        raise SystemExit('FAIL: checker timeout: '+label)


def main():
    registry, controls, proofs, before = validate_directory()
    negative_runs = 0
    for name, expected in sorted(registry.items()):
        previous = None
        for mode, flags, seed in MODES:
            command = [sys.executable, '-S', '-s', '-B']+flags+[str(HERE/name)]
            env = {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': seed}
            result = execute(command, env, name+' '+mode)
            need(result.returncode == 0 and not result.stderr, 'checker failure: '+name+' '+mode)
            need(digest(result.stdout) == expected, 'output hash mismatch: '+name+' '+mode)
            need(previous is None or previous == result.stdout, 'mode mismatch: '+name)
            previous = result.stdout
            for control in controls[name]:
                label = name+' '+mode+' '+control['name']
                result = execute(command+control['arguments'], env, label)
                need(result.returncode == 1, 'negative-control exit status: '+label)
                need(not result.stdout, 'negative-control standard output: '+label)
                need(result.stderr == control['stderr'].encode(), 'negative-control error: '+label)
                negative_runs += 1
        print('PASS: '+name+' (normal, optimized, hash-seed)')
    result = execute([sys.executable, '-I', '-S', '-B', str(HERE/'run_checks.py')],
                     {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8'}, '14-run identity driver')
    need(result.returncode == 0 and not result.stderr, 'identity driver failed')
    expected = (HERE/'RUNNER_OUTPUT.sha256').read_text().strip()
    need(re.fullmatch('[0-9a-f]{64}', expected) is not None, 'identity driver hash syntax')
    need(digest(result.stdout) == expected, 'identity driver output mismatch')
    payload = read_json(result.stdout)
    need(payload['status'] == 'PASS' and payload['executions'] == 14
         and payload['negative_controls'] == 5 and payload['normal_optimized_identical'] is True,
         'identity driver coverage')
    need({name: digest(data) for name, data in inventory().items()} == before,
         'verification files changed during execution')
    need(proof_inventory() == proofs, 'proof files changed during execution')
    print('PASS: '+str(negative_runs)+' direct negative-control runs; 2 proof bindings; 14-run driver passed')
    print('RESULT: PASS TR-25 completed local ring verification')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, SyntaxError, UnicodeError) as error:
        raise SystemExit('FAIL: verification input: '+type(error).__name__)
