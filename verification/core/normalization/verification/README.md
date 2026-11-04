# Exact normalization identities

Run from this directory:

```sh
python3 -S -s -B run.py
```

The standard-library checker uses rational and polynomial arithmetic for
the torus-elimination identity, six tangent determinants, the avoidance
determinant polynomial, and both symbolic boundary-arc coefficients.
It also provides three corruptions, each required to fail for its
specified mathematical reason. The unchanged `run_checks.py` checks
the identities and all three corruptions normally and under `-O`.

The outer runner binds every verification file and the three written
proof files, checks exact stdout in normal, optimized and second-hash-seed
modes, requires all nine direct corruption runs to reject, and replays
`run_checks.py` against its recorded output hash. It rejects missing,
unregistered, altered or symbolic-link inputs and changes during execution.
The main TR-25 runner invokes this suite in CI.

These identities support the written proofs. They do not formalize the
normalization geometry, the universal quantifiers, or a probability law.
`SOURCE_BINDINGS.txt` records source hash, included-file hash and filename.
