# Exact verification of the local-ring calculation

Run from this directory:

```sh
python3 -S -s -B run.py
```

Both checkers use only the Python standard library and exact integer,
rational and polynomial arithmetic. `check_core.py` verifies the
torus-elimination identity, the six tangent determinants and `det(M)=2`.
It also retains the earlier avoidance and boundary-arc identities.
Those additional identities are not inputs to this local-ring theorem.

`check_certificate.py` reconstructs the circuit and quotient tangent
spaces independently of the certificate data. Integer containments
give upper bounds, and inverse certificates modulo the prime 101
give matching rational rank lower bounds. The exact dimensions are:

| First two factor dimensions | One branch | Common tangent | Span of all six |
|---|---:|---:|---:|
| `(3,4)` | 25 | 23 | 35 |
| `(4,4)` | 30 | 26 | 50 |
| `(6,6)` | 50 | 38 | 110 |

The five mandatory negative controls alter the polynomial identity,
core matrix, arc coefficient, modular inverse, or common-tangent data.
Each must exit with its exact mathematical rejection message.

The outer runner binds all verification files and both proof files,
checks registered stdout hashes in normal, optimized and second-hash-seed
execution, and runs all five controls in each mode. It also replays the
unchanged `run_checks.py`, whose 14 subruns include the same five
controls in normal and optimized execution. Thus the complete suite
has 35 checker subruns, including 25 required rejections. The source
driver's output is independently hash-bound. Missing, extra, modified
or symbolic-link inputs and changes during execution are failures.

The general residue-map surjectivity, simultaneous scheme gluing,
branch exhaustion, tensor-bundle passage and depth calculation remain
written proofs. `SOURCE_BINDINGS.txt` records source hash, included-file
hash and filename for the two proof files.
