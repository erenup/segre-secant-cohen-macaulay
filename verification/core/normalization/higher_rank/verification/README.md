# Exact higher-rank core verification

Run from this directory:

```sh
python3 -S -s -B run.py
```

The unchanged standard-library checker and integer certificate verify the
circuit relation, all six five-point basis ranks, four elimination identities,
and six nonzero Jacobian determinants. Every run also executes five
reason-specific negative controls: a singular matrix, an incorrect circuit
rank, a corrupted Jacobian, and the two corrupted elimination multipliers.

The wrapper authenticates every file in this subdirectory's package, including
its statements and proofs, and binds the two earlier normalization inputs.
It runs the checker normally, under `-O`, and with a second hash seed; each
run must match the recorded exact stdout and have empty stderr. All fifteen
negative-control checks are mandatory. A separate literal hash pins the reviewed
checker source, so regenerating the manifest cannot silently remove a control.
Missing or extra files, symbolic links,
altered hashes, non-integer JSON numbers, duplicate JSON keys, assertions,
inexact arithmetic in the checker, and changes during execution are rejected.
`SOURCE_BINDINGS.txt` records source hash, included-file hash and relative path.

These finite identities support the proofs. They do not verify the all-rank
valuation arguments, blowup geometry, or complete normalization statements.
