#!/usr/bin/env python3
"""Authenticate and replay the exact higher-rank core in three Python modes."""
import ast
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
MANIFEST = 'verification/SHA256SUMS'
# Pin the reviewed source so refreshing the manifest cannot remove a control.
CHECKER_SOURCE_SHA256 = 'c8d6e88c631ed0f4811c29a264e6cfdd62acbd19063ae305e6942b1b71e00cca'
MODES = [('normal', [], '1'), ('optimized', ['-O'], '1'),
         ('hash-seed', [], '8675309')]
PROOFS = {
    'proofs/STATEMENTS.md', 'proofs/DIAGONAL_EXTENSIONS.md', 'proofs/RANK6_BOUNDARY.md',
    'proofs/THREE_DIMENSIONAL_FACTOR.md', '../proofs/STATEMENTS.md',
    '../proofs/NORMALIZATION_FIBERS.md',
}


def need(condition, message):
    if not condition:
        raise SystemExit('FAIL: '+message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def inventory():
    need(ROOT.is_dir() and not ROOT.is_symlink(), 'invalid package directory')
    files = {}
    for path in ROOT.rglob('*'):
        name = path.relative_to(ROOT).as_posix()
        need(not path.is_symlink(), 'symbolic link: '+name)
        need('__pycache__' not in path.parts and not name.endswith('.pyc'),
             'cache file: '+name)
        if path.is_file():
            need(path.stat().st_size <= 4500000, 'file size: '+name)
            files[name] = path.read_bytes()
        else:
            need(path.is_dir(), 'invalid file type: '+name)
    return files


def proof_inventory():
    result = {}
    for name in sorted(PROOFS):
        path = ROOT/name
        need(path.is_file() and not path.is_symlink(), 'invalid proof: '+name)
        need(not path.parent.is_symlink(), 'symbolic proof directory: '+name)
        result[name] = digest(path.read_bytes())
    return result


def reject_number(value):
    raise SystemExit('FAIL: non-integer JSON number: '+value)


def unique_pairs(pairs):
    result = {}
    for key, value in pairs:
        need(key not in result, 'duplicate JSON key')
        result[key] = value
    return result


def validate_checker(data):
    tree = ast.parse(data.decode(), filename='check_exact.py')
    allowed = {'copy', 'itertools', 'json', 'fractions', 'pathlib'}
    forbidden = {'float', 'complex', 'eval', 'exec', 'compile', '__import__',
                 'getattr'}
    for node in ast.walk(tree):
        need(not isinstance(node, ast.Assert), 'assert in checker')
        if isinstance(node, ast.Import):
            need(all(alias.name in allowed for alias in node.names),
                 'unexpected checker import')
        if isinstance(node, ast.ImportFrom):
            need(node.level == 0 and node.module in allowed,
                 'unexpected checker import')
        if isinstance(node, ast.Constant):
            need(type(node.value).__name__ not in {'float', 'complex'},
                 'inexact checker literal')
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            need(node.func.id not in forbidden, 'inexact or dynamic checker call')


def validate():
    files = inventory()
    need(MANIFEST in files, 'missing manifest')
    sums = {}
    for line in files[MANIFEST].decode().splitlines():
        parts = line.split('  ', 1)
        need(len(parts) == 2 and re.fullmatch('[0-9a-f]{64}', parts[0]),
             'manifest syntax')
        sha, name = parts
        need(name not in sums, 'duplicate manifest entry')
        sums[name] = sha
    need(set(sums) == set(files)-{MANIFEST}, 'manifest coverage')
    for name, sha in sums.items():
        need(digest(files[name]) == sha, 'manifest mismatch: '+name)
    need({name for name in files if name.endswith('.py')} ==
         {'verification/check_exact.py', 'verification/run.py'},
         'Python file coverage')
    for name, data in files.items():
        if name.endswith('.json'):
            json.loads(data, object_pairs_hook=unique_pairs,
                       parse_float=reject_number, parse_constant=reject_number)
    need(digest(files['verification/check_exact.py']) == CHECKER_SOURCE_SHA256,
         'reviewed checker source mismatch')
    validate_checker(files['verification/check_exact.py'])
    bindings = {}
    for line in files['verification/SOURCE_BINDINGS.txt'].decode().splitlines():
        parts = line.split()
        need(len(parts) == 3 and
             all(re.fullmatch('[0-9a-f]{64}', value) for value in parts[:2]),
             'proof binding syntax')
        source, included, name = parts
        need(name in PROOFS and name not in bindings, 'proof binding coverage')
        bindings[name] = included
    proofs = proof_inventory()
    need(bindings == proofs, 'proof binding mismatch')
    expected = files['verification/CHECKER_OUTPUT.sha256'].decode().strip()
    need(re.fullmatch('[0-9a-f]{64}', expected), 'output binding syntax')
    return files, proofs, expected


def main():
    before, proofs, expected = validate()
    previous = None
    for mode, flags, seed in MODES:
        command = [sys.executable, '-S', '-s', '-B']+flags+[str(HERE/'check_exact.py')]
        env = {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': seed}
        try:
            result = subprocess.run(command, cwd=HERE, env=env,
                                    stdin=subprocess.DEVNULL,
                                    capture_output=True, timeout=30)
        except subprocess.TimeoutExpired:
            raise SystemExit('FAIL: checker timeout: '+mode)
        need(result.returncode == 0, 'checker exit status: '+mode)
        need(not result.stderr, 'checker standard error: '+mode)
        need(digest(result.stdout) == expected, 'checker output mismatch: '+mode)
        need(previous is None or result.stdout == previous, 'checker mode mismatch')
        need(b'PASS five reason-specific negative controls\n' in result.stdout,
             'missing mandatory negative-control result')
        previous = result.stdout
    need(inventory() == before, 'package changed during execution')
    need(proof_inventory() == proofs, 'proof inputs changed during execution')
    print('PASS: check_exact.py (normal, optimized, hash-seed)')
    print('PASS: 15 reason-specific negative controls; 6 proof bindings')
    print('RESULT: PASS TR-25 higher-rank normalization verification')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, SyntaxError, UnicodeError) as error:
        raise SystemExit('FAIL: verification input: '+type(error).__name__)
