#!/usr/bin/env python3
"""Bind the written boundary models and replay their finite exact core."""
import ast
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
FILES = {'run.py', 'check_exact.py', 'certificate.json', 'README.md',
         'SOURCE_BINDINGS.txt', 'CHECKERS.txt', 'NEGATIVE_CONTROLS.json',
         'SHA256SUMS'}
CHECKER_SHA256 = 'c8d6e88c631ed0f4811c29a264e6cfdd62acbd19063ae305e6942b1b71e00cca'
CERTIFICATE_SHA256 = '7d958fcb79bd2ac83ddf3be4fb605de76f1167f304186ce3095e339d81a8e4ae'
PROOF_BINDINGS = {
    'STATEMENT_D.md': (
        'adfad689af2540db78fe3fd382512e387309590437f1b1a3d59babf599fb77ec',
        'd745e0c1fd5751ca1f2ab0fb06ca2eefd704ca2828081e7768422da1bdc5830a'),
    'PROOF_D.md': (
        'b04258fc64f220c54b03c3bcdea51d65ce7bae42f1f96d514e5680d9078868ac',
        'e4f631a351a47b3c764d909f1d55bc1e437cf1567d7b210873cfe32adae8f7a9'),
    'DEPENDENCIES_D.md': (
        'ceb711d7c4eebaea3106a9735fed98f1b6f0825aed5456e7b6cd1632731f466f',
        '1ef268a16dde1bc8ce216d19c31739404f464b284e0c6ca19dfa108fbc3c99ec'),
    'STATEMENT_E.md': (
        '85f147de54733bddd8488221aafc4b9e3563844aa3cc9ad0acffe4eb8952f8a2',
        'ee1ad2a25b30fcdd00d964cb8998e9b4a3aeee96ee5bacb581ef553ee2af0f09'),
    'GEOMETRY_E.md': (
        '90f67c686313e9b6e3e0a91a9a0d3083b346698ded5a0f6b406f80705deb378c',
        '0cc403fcd7b5777493f404ea305712895d4403124f5b4b00d86e59f82fa93882'),
    'ALGEBRA_STAR.md': (
        '0f1890d9dff64ef2146beab0a50789a706b3aef139fbae767bda73a926fb63ba',
        '0f1890d9dff64ef2146beab0a50789a706b3aef139fbae767bda73a926fb63ba'),
    'DEFORMATION_LEMMA.md': (
        '0158411339602e599cc1ed1eff93c76b75dabe6f55c0574e2ca8349c153e5bf8',
        '0158411339602e599cc1ed1eff93c76b75dabe6f55c0574e2ca8349c153e5bf8'),
    'DEPENDENCIES_E.md': (
        '79fb365236382cdd8196b86686347c31f36dabb86450bb80d44e58e77fbdf056',
        'be8dd5caaed695886f9e477f33049efb48c542d07ddec05574d18e14ed3ec4f6'),
}
CONTROLS = [
    {'name': 'singular matrix', 'reason': 'matrix determinant'},
    {'name': 'wrong circuit rank', 'reason': 'circuit rank'},
    {'name': 'corrupted Jacobian', 'reason': 'Jacobian certificate'},
    {'name': 'wrong first elimination sign', 'reason': 'first elimination identity'},
    {'name': 'wrong second elimination multiplier', 'reason': 'second elimination identity'},
]
MODES = [('normal', [], '1'), ('optimized', ['-O'], '1'),
         ('hash-seed', [], '8675309')]


def need(condition, message):
    if not condition:
        raise SystemExit('FAIL: '+message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def inventory():
    need(HERE.is_dir() and not HERE.is_symlink(), 'invalid verification directory')
    paths = list(HERE.iterdir())
    need({p.name for p in paths} == FILES, 'verification inventory')
    files = {}
    for path in paths:
        need(path.is_file() and not path.is_symlink(), 'invalid verification file: '+path.name)
        need(path.stat().st_size <= 4500000, 'verification file size: '+path.name)
        files[path.name] = path.read_bytes()
    return files


def proof_inventory():
    root = HERE.parent/'proofs'
    need(root.is_dir() and not root.is_symlink(), 'invalid proof directory')
    paths = list(root.iterdir())
    need({p.name for p in paths} == set(PROOF_BINDINGS), 'proof inventory')
    result = {}
    for path in paths:
        need(path.is_file() and not path.is_symlink(), 'invalid proof file: '+path.name)
        need(path.stat().st_size <= 4500000, 'proof file size: '+path.name)
        result[path.name] = digest(path.read_bytes())
    return result


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


def validate_python(name, data):
    allowed = ({'copy', 'itertools', 'json', 'fractions', 'pathlib'}
               if name == 'check_exact.py' else
               {'ast', 'hashlib', 'json', 'os', 'pathlib', 're', 'subprocess', 'sys'})
    forbidden = {'float', 'complex', 'eval', 'exec', 'compile', '__import__', 'getattr'}
    tree = ast.parse(data.decode(), filename=name)
    for node in ast.walk(tree):
        need(not isinstance(node, ast.Assert), 'assert in '+name)
        if isinstance(node, ast.Import):
            need(all(alias.name in allowed for alias in node.names), 'unexpected import in '+name)
        if isinstance(node, ast.ImportFrom):
            need(node.level == 0 and node.module in allowed, 'unexpected import in '+name)
        if isinstance(node, ast.Constant):
            need(type(node.value).__name__ not in {'float', 'complex'}, 'inexact literal in '+name)
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            need(node.func.id not in forbidden, 'inexact or dynamic call in '+name)


def validate():
    files = inventory()
    sums = {}
    for line in files['SHA256SUMS'].decode().splitlines():
        parts = line.split('  ', 1)
        need(len(parts) == 2 and re.fullmatch('[0-9a-f]{64}', parts[0]), 'manifest syntax')
        sha, name = parts
        need(name not in sums, 'duplicate manifest entry')
        sums[name] = sha
    need(set(sums) == FILES-{'SHA256SUMS'}, 'manifest coverage')
    for name, sha in sums.items():
        need(digest(files[name]) == sha, 'manifest mismatch: '+name)
    for name in ('run.py', 'check_exact.py'):
        validate_python(name, files[name])
    read_json(files['certificate.json'])
    need(read_json(files['NEGATIVE_CONTROLS.json']) == CONTROLS, 'negative-control definitions')
    need(digest(files['check_exact.py']) == CHECKER_SHA256, 'reviewed checker source mismatch')
    need(digest(files['certificate.json']) == CERTIFICATE_SHA256, 'reviewed certificate mismatch')
    bindings = {}
    for line in files['SOURCE_BINDINGS.txt'].decode().splitlines():
        parts = line.split()
        need(len(parts) == 3 and all(re.fullmatch('[0-9a-f]{64}', value) for value in parts[:2]),
             'proof binding syntax')
        source, included, name = parts
        need(name.startswith('proofs/'), 'proof binding path')
        name = name.removeprefix('proofs/')
        need(name in PROOF_BINDINGS and name not in bindings, 'proof binding coverage')
        bindings[name] = (source, included)
    need(bindings == PROOF_BINDINGS, 'reviewed proof bindings mismatch')
    proofs = proof_inventory()
    need(proofs == {name: values[1] for name, values in PROOF_BINDINGS.items()}, 'proof binding mismatch')
    registry = files['CHECKERS.txt'].decode().splitlines()
    need(len(registry) == 1, 'checker registry coverage')
    parts = registry[0].split()
    need(len(parts) == 2 and parts[0] == 'check_exact.py'
         and re.fullmatch('[0-9a-f]{64}', parts[1]), 'checker registry syntax')
    return files, proofs, parts[1]


def main():
    before, proofs, expected = validate()
    previous = None
    for mode, flags, seed in MODES:
        command = [sys.executable, '-S', '-s', '-B']+flags+[str(HERE/'check_exact.py')]
        env = {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': seed}
        try:
            result = subprocess.run(command, cwd=HERE, env=env, stdin=subprocess.DEVNULL,
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
    need(inventory() == before, 'verification files changed during execution')
    need(proof_inventory() == proofs, 'proof files changed during execution')
    print('PASS: check_exact.py finite core (normal, optimized, hash-seed)')
    print('PASS: 15 reason-specific negative controls; 8 proof bindings')
    print('SCOPE: finite core only; boundary normality, saturation and fiber exhaustion use written proofs')
    print('RESULT: PASS TR-25 boundary-model verification')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, SyntaxError, UnicodeError) as error:
        raise SystemExit('FAIL: verification input: '+type(error).__name__)
