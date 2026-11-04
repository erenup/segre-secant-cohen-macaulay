#!/usr/bin/env python3
"""Run the exact finite checker under normal/-O and reject surviving mutations."""
from pathlib import Path
import subprocess
import sys


def fail(message):
    raise SystemExit("HARNESS REJECT: " + message)


root = Path(__file__).resolve().parent
checker = root / "check_reach_instances.py"
reports = []
ordinary = None
for optimize in (False, True):
    command = [sys.executable, "-I"] + (["-O"] if optimize else []) + [str(checker)]
    result = subprocess.run(command, capture_output=True, text=True, check=False)
    mode = "optimized" if optimize else "normal"
    (root / ("check_"+mode+".log")).write_text(result.stdout+result.stderr)
    if result.returncode != 0:
        fail(mode+" positive run rejected")
    if ordinary is None:
        ordinary = result.stdout
    elif result.stdout != ordinary:
        fail("ordinary and optimized outputs differ")
    reports.append(mode+": positive checks PASS")
    expected_reasons = {
        "equality": "decompositions differ",
        "distinctness": "unordered decompositions same",
        "immersion": "matrix factors dependent",
        "avoidance": "derivative rank fails",
    }
    for mutation, reason in expected_reasons.items():
        result = subprocess.run(command+["--mutate", mutation], capture_output=True,
                                text=True, check=False)
        output = result.stdout+result.stderr
        if result.returncode == 0 or "REJECT:" not in output or reason not in output:
            fail(mode+" mutation "+mutation+" did not give intended rejection")
        reports.append(mode+" "+mutation+": intended rejection PASS; "+output.strip())
(root / "check_harness.log").write_text("\n".join(reports)+"\n")
print("\n".join(reports))
