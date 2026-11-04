#!/usr/bin/env python3
"""Check proof bindings, exact output hashes, and negative controls in three modes."""
import ast
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
DRIVER_SOURCE_SHA256 = '7bc2470b94f402d2e18057d2b704bccf5ccb4d60a94fa1f84a251bee0cc2ef8d'
DRIVER_OUTPUT_SHA256 = '9703712028077bde918a12c5425f4d8531cf47d80007855bd2ec6dcbc26bc3f2'
MODES = [('normal', [], '1'), ('optimized', ['-O'], '1'), ('hash-seed', [], '8675309')]
MATH_INTEGER = {'ceil', 'comb', 'factorial', 'floor', 'gcd', 'isqrt', 'lcm', 'perm', 'prod', 'trunc'}
FORBIDDEN_CALLS = {'float', 'complex', 'eval', 'exec', 'compile', '__import__', 'getattr'}
FORBIDDEN_MODULES = {'cmath', 'decimal', 'random', 'statistics', 'importlib'}
# Authenticate each child before execution and its complete stdout afterwards.
# A replaced child must not bypass the manifest that it would normally check.
EXTENSIONS = {
    'higher_rank': (
        'b821faaf76a3358c589707a43aacb296d47d28776510ae7780d09988da2f0efd',
        'e9fa14f954c98ea6bcb326d7673a078825f93f26369b8b90b57adb66a93cf90a'),
    'local_ring': (
        'b5fdbce6d8414c0474ab6d92a0fbf4f3090f1384add45e31ce3e46c91d23828b',
        '8ac4afee8e63769b8c4328171c825036ddf915ab7435c1e2d053418232f08d1f'),
    'boundary_models': (
        '823358688943bc6dcb1a88b6697f124b920b6ae00d0025d232d25da67addbf92',
        '628264f81b59c1544b5635169bf86d882aac5fa2a878631bcbd98ccc1a5d24bb'),
}


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
    need({p.name for p in paths} == {'NORMALIZATION_FIBERS.md', 'RETRACTS_AND_CONDUCTOR.md', 'STATEMENTS.md'}, 'proof coverage')
    need(all(p.is_file() and not p.is_symlink() for p in paths), 'invalid proof file')
    return {p.name: digest(p.read_bytes()) for p in paths}


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


def validate_controls(data, registry):
    controls = read_json(data)
    need(type(controls) is dict and set(controls) == set(registry), 'negative-control coverage')
    for name, entries in controls.items():
        need(type(entries) is list and bool(entries), 'missing negative controls: '+name)
        seen = set()
        for entry in entries:
            need(type(entry) is dict and set(entry) == {'name', 'stderr'}, 'negative-control fields')
            label, error = entry['name'], entry['stderr']
            need(type(label) is str and re.fullmatch('[a-z][a-z0-9_-]*', label) is not None,
                 'negative-control name')
            need(label not in seen, 'duplicate negative control')
            seen.add(label)
            need(type(error) is str and bool(error.strip()) and error.endswith('\n'),
                 'negative-control expected error')
    return controls


def inventory():
    files = {}
    for path in HERE.rglob('*'):
        need(not path.is_symlink(), 'symbolic link: '+str(path.relative_to(HERE)))
        if path.is_file():
            name = path.relative_to(HERE).as_posix()
            need('__pycache__' not in path.parts and not name.endswith('.pyc'), 'cache file: '+name)
            need(path.stat().st_size <= 4500000, 'file size: '+name)
            files[name] = path.read_bytes()
    return files


def validate_directory():
    files = inventory()
    need('SHA256SUMS' in files and 'CHECKERS.txt' in files, 'missing manifest or registry')
    sums = {}
    for line in files['SHA256SUMS'].decode().splitlines():
        parts = line.split('  ', 1)
        need(len(parts) == 2 and re.fullmatch('[0-9a-f]{64}', parts[0]) is not None, 'manifest syntax')
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
        if not line.strip() or line.lstrip().startswith('#'):
            continue
        parts = line.split()
        need(len(parts) == 2 and re.fullmatch(r'check_[a-z0-9_]+\.py', parts[0]) is not None
             and re.fullmatch('[0-9a-f]{64}', parts[1]) is not None, 'registry syntax')
        name, sha = parts
        need(name not in registry, 'duplicate checker')
        registry[name] = sha
    python_files = {name for name in files if name.endswith('.py')}
    need(all('/' not in name for name in python_files), 'Python file below top level')
    need(bool(registry) and set(registry) == {n for n in python_files if n.startswith('check_')}, 'registry coverage')
    modules = {Path(n).stem for n in python_files}
    need(not (modules & sys.stdlib_module_names), 'standard-library module shadow')
    used = set()
    for name in sorted(python_files):
        tree = ast.parse(files[name].decode(), filename=name)
        for node in ast.walk(tree):
            need(not isinstance(node, ast.Assert), 'assert in '+name)
            if isinstance(node, ast.ImportFrom):
                need(node.level == 0 and node.module, 'relative import in '+name)
                roots = [node.module.split('.')[0]]
                if node.module == 'math':
                    need(all(n.name in MATH_INTEGER for n in node.names), 'non-integer math import')
            elif isinstance(node, ast.Import):
                roots = [n.name.split('.')[0] for n in node.names]
            else:
                roots = []
            for root in roots:
                need(root in sys.stdlib_module_names | modules, 'nonstandard import in '+name)
                need(root not in FORBIDDEN_MODULES, 'inexact or dynamic module in '+name)
                if name not in {'run.py', 'run_checks.py'}:
                    need(root not in {'subprocess', 'multiprocessing', 'concurrent'}, 'checker process import')
                    used.add(root)
            need(not (isinstance(node, ast.Constant) and type(node.value).__name__ in {'float', 'complex'}), 'inexact literal in '+name)
            if isinstance(node, ast.Call):
                if isinstance(node.func, ast.Name):
                    need(node.func.id not in FORBIDDEN_CALLS, 'inexact or dynamic call in '+name)
                if isinstance(node.func, ast.Attribute) and isinstance(node.func.value, ast.Name) and node.func.value.id == 'math':
                    need(node.func.attr in MATH_INTEGER, 'non-integer math call')
    helpers = modules-{'run', 'run_checks'}-{Path(n).stem for n in registry}
    need(helpers <= used, 'unused arithmetic module')
    for name, data in files.items():
        if name.endswith('.json'):
            read_json(data)
    proofs = validate_bindings(files['SOURCE_BINDINGS.txt'])
    controls = validate_controls(files['NEGATIVE_CONTROLS.json'], registry)
    return registry, controls, proofs, {name: digest(data) for name, data in files.items()}


def execute(command, env, label):
    try:
        return subprocess.run(command, cwd=HERE, env=env, stdin=subprocess.DEVNULL,
                              capture_output=True, timeout=600)
    except subprocess.TimeoutExpired:
        raise SystemExit('FAIL: checker timeout: '+label)


EXTENSION_MANIFESTS = {
    'higher_rank': 'c0c9799ecbb9ffecc83faa8a4480ace552e729e4ca1596ff1a961fff54fe76e1',
    'local_ring': '407bd1d5842068ff5a22fc95484ccfa001904dcb70a6f744e8282a7fb365ead4',
    'boundary_models': '35c8aaf1e51e8eced83e761a7b0595f6c52e4d2dddf858a59f424a8ed243b954',
}


def authenticate_child_manifest(verification, expected, label):
    manifest = verification / 'SHA256SUMS'
    need(manifest.is_file() and not manifest.is_symlink(), label+' missing regular manifest')
    need(digest(manifest.read_bytes()) == expected, label+' manifest binding mismatch')


def run_extension(name):
    need(name in EXTENSIONS, 'unregistered normalization extension')
    runner_hash, output_hash = EXTENSIONS[name]
    root = HERE.parent/name
    verification = root/'verification'
    runner = verification/'run.py'
    need(root.is_dir() and not root.is_symlink()
         and verification.is_dir() and not verification.is_symlink()
         and runner.is_file() and not runner.is_symlink(),
         'missing '+name+' runner')
    need(digest(runner.read_bytes()) == runner_hash, name+' runner source mismatch')
    authenticate_child_manifest(verification, EXTENSION_MANIFESTS[name], name)
    result = execute([sys.executable, '-S', '-s', '-B', str(runner)],
                     {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': '1'},
                     name+' suite')
    need(result.returncode == 0 and not result.stderr, name+' suite failed')
    need(digest(result.stdout) == output_hash, name+' suite output mismatch')
    need(runner.is_file() and not runner.is_symlink()
         and digest(runner.read_bytes()) == runner_hash, name+' runner changed during execution')
    authenticate_child_manifest(verification, EXTENSION_MANIFESTS[name], name)
    print(result.stdout.decode(), end='')


def main():
    registry, controls, proofs, before = validate_directory()
    negative_runs = 0
    for name, expected in sorted(registry.items()):
        previous = None
        for mode, flags, seed in MODES:
            command = [sys.executable, '-S', '-s', '-B']+flags+[str(HERE/name)]
            env = {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8', 'PYTHONHASHSEED': seed}
            result = execute(command, env, name+' '+mode)
            need(result.returncode == 0, 'checker exit status: '+name+' '+mode)
            need(not result.stderr, 'checker standard error: '+name+' '+mode)
            need(digest(result.stdout) == expected, 'output hash mismatch: '+name+' '+mode)
            need(previous is None or previous == result.stdout, 'mode mismatch: '+name)
            previous = result.stdout
            for control in controls[name]:
                label = name+' '+mode+' '+control['name']
                result = execute(command+['--mutate', control['name']], env, label)
                need(result.returncode == 1, 'negative-control exit status: '+label)
                need(not result.stdout, 'negative-control standard output: '+label)
                need(result.stderr == control['stderr'].encode(), 'negative-control error: '+label)
                negative_runs += 1
        print('PASS: '+name+' (normal, optimized, hash-seed)')
    # Replay the unchanged source runner as well as the hash-bound direct runs.
    result = execute([sys.executable, '-I', '-S', '-B', str(HERE/'run_checks.py')],
                     {'PATH': os.defpath, 'LC_ALL': 'C.UTF-8'}, 'identity runner')
    need(result.returncode == 0 and not result.stderr, 'identity runner failed')
    expected_runner = (HERE/'RUNNER_OUTPUT.sha256').read_text().strip()
    need(re.fullmatch('[0-9a-f]{64}', expected_runner) is not None,
         'identity runner output binding syntax')
    need(digest(result.stdout) == expected_runner, 'identity runner output mismatch')
    after = {name: digest(data) for name, data in inventory().items()}
    need(after == before, 'verification files changed during execution')
    need(proof_inventory() == proofs, 'proof files changed during execution')
    print('PASS: '+str(negative_runs)+' direct negative-control runs; 3 proof bindings; source runner passed')
    run_extension('higher_rank')
    run_extension('local_ring')
    run_extension('boundary_models')
    print('RESULT: PASS TR-25 normalization verification')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, TypeError, KeyError, SyntaxError, UnicodeError) as error:
        raise SystemExit('FAIL: verification input: '+type(error).__name__)
