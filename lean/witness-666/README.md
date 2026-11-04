# TR-25 finite tensor certificate in Lean

`TR25.finiteCertificate : TR25.FiniteCertificate` proves the explicit finite
certificate used in the [TR-25 argument](../../verification/core/proofs/PROOF.md). The integer
3×3×5 tensor has two distinct five-term decompositions with nonzero,
pairwise nonproportional summands. The theorem also proves the corresponding
statements after zero padding to 6×6×6, flattening ranks five over ℂ, six
rational determinant values, and coordinate Jacobian ranks 45 and 80 at
both decompositions.

Only this finite certificate layer is formalized. The theorem does not assert
border rank, secant-variety dimension, geometric tangent-space identification,
normalization or conductor properties, failure of S2 or Cohen–Macaulayness,
or the depth at the homogeneous vertex.

The proposition is in [TR25/Statement.lean](TR25/Statement.lean), with literal
definitions in [TR25/Definitions.lean](TR25/Definitions.lean) and integer
factors in [certificate/witness.json](certificate/witness.json). The rank
lower bounds use integer right-inverse identities with scale factor 36.
Ten independent scaling directions give the padded rank upper bound.

## Build and verify

The project uses Lean `v4.34.0-rc2` and Mathlib revision
`85e3a25e006c35636f0e53b0e9296caca2685bc0`. Dependency revisions are pinned
in `lake-manifest.json`. With [elan](https://github.com/leanprover/elan)
and Python 3.11 or later installed, run from this directory:

```sh
lake exe cache get
python3 -B audit/test_verify.py
python3 -B -O audit/test_verify.py
python3 -B audit/check_literal_data.py
python3 -B -O audit/check_literal_data.py
LEAN_NUM_THREADS=1 python3 -B audit/verify.py
```

The first command downloads the official Mathlib cache. The verifier checks
the complete proof inventory against
[audit/source-hashes.json](audit/source-hashes.json), binds the literal witness
and build configuration, cleans the local package, and rebuilds every proof
module in dependency order. It then type-checks the theorem against the stated
proposition and requires exactly `propext`, `Classical.choice`, and `Quot.sound`.
Missing or changed inputs, proof placeholders, additional axiom declarations,
build failures and unexpected dependency output cause a nonzero exit.

After a successful build, print the theorem's dependencies separately with:

```sh
lake env lean audit/Axioms.lean
```
