# TR-25: finite certificate for the 3×4×5 family instance

`TR25Family.finiteCertificate : TR25Family.FiniteCertificate` proves the exact
finite certificate for the explicit integer witness with two five-term
decompositions in format 3×4×5. The proposition is fixed in
[TR25Family/Statement.lean](TR25Family/Statement.lean), and every tensor,
factor list, flattening, and Jacobian is defined in
[TR25Family/Definitions.lean](TR25Family/Definitions.lean).

Only the exact finite certificate layer is formalized. The geometric
non-S2 / non-Cohen–Macaulay conclusion and the theorem for all r are outside
scope. This project does not prove secant-variety dimension, border rank,
geometric tangent-space identification, normalization/conductor properties,
or a depth statement. The geometric dimension 50 belongs to the written
family proof; the formalized number 50 is the rank of each coordinate
Jacobian at this fixed witness.

The fourth coordinate in every B factor is zero. In particular, the witness
has flattening ranks **3, 3, 5**, although the ambient format is 3×4×5.

## The exact proposition

The single certificate theorem combines:

- equality over ℤ of both five-term tensor sums to the literal witness;
- nonzero, pairwise nonproportional summands over ℂ in each list, and a
  summand direction of the first list absent from the second;
- flattening ranks 3, 3, 5 over ℂ;
- rank 5 for each of the AB, AC and BC pair-product matrices, and for the
  third-factor matrix, in both decompositions;
- row-ratio determinants −1/18, 1/3, −2 and column-ratio determinants
  −1/18, 4/9, −3/2 over ℚ;
- rank 50 over ℂ for both 60×60 coordinate Jacobians of the five-term
  tensor-sum formula.

The rank lower bounds use explicit 50-row submatrices with integer right
inverses scaled by 36. Ten independent rescaling directions lie in each
Jacobian kernel, giving the matching upper bound. The lower-bound matrices
are recorded in [certificate/rank_data.json](certificate/rank_data.json);
the Lean proof checks the integer identities directly. The generator is
reproducibility support and is not a trusted proof step.

## Relation to the written proofs

The integer witness and its two five-term decompositions come from
[the original proof](../../verification/core/proofs/PROOF.md), sections 3–4. The
[family proof](../../verification/core/families/proofs/REACH_DERIVATION.md), section 4, specializes this
construction to format 3×4×5 by zero-padding the B factors. At rank five,
no additional summands are needed. This project checks the resulting
finite tensor and matrix identities. The six rational determinant values
retain the arithmetic input to the written tangent-intersection argument;
the geometric argument itself is outside the Lean theorem.

The [original Lean project](../witness-666/README.md) covers the original
6×6×6 finite certificate. This project separately covers the fixed
3×4×5 family instance, including both full 60×60 coordinate Jacobians.
Neither project proves the family theorem for every rank or its geometry.

## Build and verify

Lean is pinned to `v4.34.0-rc2`; Mathlib is pinned in
[lake-manifest.json](lake-manifest.json) to
`85e3a25e006c35636f0e53b0e9296caca2685bc0`, together with the transitive
dependency revisions. With the pinned toolchain available, run these
commands from this directory:

```sh
lake exe cache get
python3 -B audit/test_exact.py
python3 -O -B audit/test_exact.py
python3 -B audit/test_verify.py
python3 -O -B audit/test_verify.py
python3 -B audit/check_exact.py
python3 -O -B audit/check_exact.py
python3 -B audit/check_literal_data.py
python3 -O -B audit/check_literal_data.py
LEAN_NUM_THREADS=1 python3 -B audit/verify.py
```

The verifier binds the literal definitions and statement, the complete
source inventory, the build configuration and certificate data. It
cleans the local Lake package and recompiles all 22 proof modules. The
independent exact checker uses integer and rational arithmetic; rejection
controls run under both normal and optimized Python. The literal-data
checker binds the JSON certificate to its Lean representation.

The theorem uses only `propext`, `Classical.choice`, and `Quot.sound`.
Proof placeholders, additional axioms, native decision and kernel-checking
overrides are excluded. The official pinned dependency cache may be reused;
the project audit rebuilds local modules, not all of Mathlib.

The optional [rank-data generator](scripts/generate_rank.py) reproduces the
scaled integer right-inverse data from the literal witness. Its output is
checked independently and by Lean; the generator is not a proof premise.
