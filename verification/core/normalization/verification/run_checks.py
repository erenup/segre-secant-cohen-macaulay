#!/usr/bin/env python3
"""Run the exact normalization-identity checks and three fail-closed mutations.

Both ordinary and optimized Python must accept the unchanged identities
and reject each corruption for its intended reason. No geometric theorem
is inferred from the runner's success.
"""

from pathlib import Path
import subprocess
import sys

script = Path(__file__).with_name('check_normalization_identities.py')
controls = {'polynomial': 'torus polynomial identity',
            'core': 'core determinant',
            'arc': 'row arc coefficient identity'}
for optimized in [False, True]:
    cmd = [sys.executable, '-I', '-S', '-B'] + (['-O'] if optimized else [])
    label = 'optimized' if optimized else 'normal'
    result = subprocess.run(cmd + [str(script)], capture_output=True, text=True)
    if result.returncode != 0 or not result.stdout.startswith('PASS ') or result.stderr:
        raise SystemExit(f'REJECT: {label} positive run: {result}')
    print(label + ': ' + result.stdout.strip())
    for mutation, reason in controls.items():
        result = subprocess.run(cmd + [str(script), '--mutate', mutation],
                                capture_output=True, text=True)
        if result.returncode == 0 or result.stdout or result.stderr.strip() != 'REJECT: ' + reason:
            raise SystemExit(f'REJECT: {label} negative control {mutation}: {result}')
        print(label + ': intended rejection PASS: ' + mutation)
print('PASS: two positive runs and six intended rejections')
