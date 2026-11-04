#!/usr/bin/env python3
"""Read-only exact replays; geometric claims remain written-proof obligations."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parent


def require(condition, message):
    if not condition:
        raise SystemExit('FAIL: ' + message)


def main():
    bindings = json.loads((ROOT / 'INPUT_HASHES.json').read_text())
    for name, expected in bindings.items():
        require(hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected,
                'input digest ' + name)
    cases = [
        ('core', 'check_core.py', [], None),
        ('core_polynomial', 'check_core.py', ['--mutate', 'polynomial'],
         'REJECT: torus polynomial identity\n'),
        ('core_matrix', 'check_core.py', ['--mutate', 'core'],
         'REJECT: core determinant\n'),
        ('core_arc', 'check_core.py', ['--mutate', 'arc'],
         'REJECT: row arc coefficient identity\n'),
        ('tangents', 'check_certificate.py', [str(ROOT / 'CERTIFICATE.json')], None),
        ('tangent_inverse', 'check_certificate.py',
         [str(ROOT / 'negative_controls/bad_modular_inverse.json')],
         'FAIL: all-span modular inverse identity\n'),
        ('tangent_common', 'check_certificate.py',
         [str(ROOT / 'negative_controls/bad_common_tangent.json')],
         'FAIL: common basis tangent condition\n'),
    ]
    results = []
    for name, checker, arguments, error in cases:
        modes = []
        for optimized in (False, True):
            command = [sys.executable, '-I', '-S', '-B']
            if optimized:
                command.append('-O')
            command += [str(ROOT / checker)] + arguments
            result = subprocess.run(command, capture_output=True, text=True, timeout=60)
            modes.append((result.returncode, result.stdout, result.stderr))
        require(modes[0] == modes[1], name + ' normal/-O mismatch')
        code, out, err = modes[0]
        if error is None:
            require(code == 0 and err == '', name + ' positive run')
            payload = out.removeprefix('PASS ') if name == 'core' else out
            parsed = json.loads(payload)
            require(parsed.get('polynomial_identity') is True if name == 'core'
                    else parsed.get('status') == 'PASS', name + ' success payload')
        else:
            require(code == 1 and out == '' and err == error,
                    name + ' intended rejection')
        results.append({'case': name, 'returncode': code, 'stdout': out, 'stderr': err})
    print(json.dumps({'status': 'PASS', 'executions': 14, 'negative_controls': 5,
                      'normal_optimized_identical': True,
                      'scope': 'exact core identities and three finite tangent formats',
                      'results': results}, sort_keys=True))


if __name__ == '__main__':
    main()
