# Exact finite-core verification for the boundary models

Run from this directory:

```sh
python3 -S -s -B run.py
```

The unchanged standard-library checker and integer certificate verify the fixed
six-point core: the circuit relation and rank, all six five-point basis ranks,
four polynomial elimination identities, and six nonzero Jacobian determinants.
The same checker and certificate occur in the earlier higher-rank package.
Their literal SHA-256 pins reject alterations even after a manifest is refreshed.

Every checker run executes five reason-specific negative controls: a singular
matrix, an incorrect circuit rank, a corrupted Jacobian, an incorrect first
elimination sign, and an incorrect second elimination multiplier. The wrapper
runs the checker normally, under `-O`, and with a second hash seed. All three
runs must have the recorded stdout bytes and empty stderr; all fifteen internal
negative-control checks must run. `NEGATIVE_CONTROLS.json` records their exact
names and expected rejection reasons. The source pin prevents silently deleting
a control while retaining its printed success line.

`SHA256SUMS` covers every verification file except itself; the wrapper requires
the exact flat file inventory. `SOURCE_BINDINGS.txt` records the source hash,
included-file hash, and path for each of the eight written proof files. Literal
bindings in the wrapper independently authenticate both columns and the exact
proof inventory. The wrapper rejects symlinks, extra or missing inputs, malformed
manifests, duplicate JSON keys, non-integer JSON numbers, assertions, inexact
Python literals, unexpected imports, dynamic calls, and input changes during
execution. Every rejection uses explicit failure, including under outer `-O`.

This computation establishes only the finite identities just listed. It does
not establish the boundary models for all parameters, normality, saturation,
fiber exhaustion, or the mixed-model geometry. Those assertions rely on the
written proofs; authenticating their bytes does not formalize their mathematics.
No bounded semigroup enumeration is used to prove saturation. The unchanged
checker's final line refers to the earlier diagonal DVR argument; it describes
that checker's original scope and is not a claim to verify the new geometry.
