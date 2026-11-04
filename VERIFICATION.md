# Verification

Python checks use only the standard library. The mathematical programs use
exact integer and rational arithmetic, polynomial arithmetic, and
elimination in finite prime fields, with no floating-point tolerance. The
two Lean theorems `TR25.finiteCertificate` and `TR25Family.finiteCertificate`
prove finite certificate layers only; the family theorem, the geometry,
the normalization results and the depth conclusions are written proofs in
the [paper](paper/main.pdf). The outputs below were observed with
Python 3.12 from the repository root unless stated otherwise.

## Exact checks

```sh
python3 -S -s -B verification/run.py
python3 -S -s -B -O verification/run.py
```

Both commands exit zero with empty standard error and identical standard
output:

```text
PASS: check_five_term_tensor.py (normal, optimized, hash-seed)
PASS: check_witness.py (normal, optimized, hash-seed)
PASS: 15 negative-control runs; 2 proof bindings
PASS: check_normalization_identities.py (normal, optimized, hash-seed)
PASS: 9 direct negative-control runs; 3 proof bindings; source runner passed
PASS: check_exact.py (normal, optimized, hash-seed)
PASS: 15 reason-specific negative controls; 6 proof bindings
RESULT: PASS TR-25 higher-rank normalization verification
PASS: check_certificate.py (normal, optimized, hash-seed)
PASS: check_core.py (normal, optimized, hash-seed)
PASS: 15 direct negative-control runs; 2 proof bindings; 14-run driver passed
RESULT: PASS TR-25 completed local ring verification
PASS: check_exact.py finite core (normal, optimized, hash-seed)
PASS: 15 reason-specific negative controls; 8 proof bindings
SCOPE: finite core only; boundary normality, saturation and fiber exhaustion use written proofs
RESULT: PASS TR-25 boundary-model verification
RESULT: PASS TR-25 normalization verification
RESULT: PASS TR-25 verification
PASS: core/verification/run.py (normal, optimized, hash-seed)
normal: positive checks PASS
normal equality: intended rejection PASS; REJECT: negative control: decompositions differ
normal distinctness: intended rejection PASS; REJECT: negative control: unordered decompositions same
normal immersion: intended rejection PASS; REJECT: negative control: matrix factors dependent
normal avoidance: intended rejection PASS; REJECT: negative control: derivative rank fails in decomposition 0
optimized: positive checks PASS
optimized equality: intended rejection PASS; REJECT: negative control: decompositions differ
optimized distinctness: intended rejection PASS; REJECT: negative control: unordered decompositions same
optimized immersion: intended rejection PASS; REJECT: negative control: matrix factors dependent
optimized avoidance: intended rejection PASS; REJECT: negative control: derivative rank fails in decomposition 0
PASS: core/family-instances/run_checks.py (normal, optimized, hash-seed)
PASS: 110 files authenticated; 6 integrity controls rejected
RESULT: PASS TR-25 exact verification
```

The standard-output SHA256 is
`4559d12acc32d4603ab5b46bf5c2c7cee711cae0865624855f3224245601b5df`.

The entry point authenticates every file in `verification/` against its manifest,
binds the two child runners and their manifests by digest, runs each child in
normal, optimized and alternate hash-seed modes with the same recorded output, and
rejects six altered inventories. The first child,
`verification/core/verification/run.py`, checks the rank-five witness and runs the
normalization suites. The second child,
`verification/core/family-instances/run_checks.py`, checks the family witnesses for
the 15 pairs `(r,p)` with `5<=r<=9`, `3<=p<=r-2` and the extension from `4×5×8` to
`5×5×8` (31 pairs of decompositions), as described in Section 8 of the paper, and
requires its four negative controls to be rejected under `-I` and `-I -O`.

## Exact checks for the normalization results

From the repository root, or from `verification/core/normalization/verification/` as
`python3 -S -s -B run.py`:

```sh
python3 -S -s -B verification/core/normalization/verification/run.py
python3 -S -s -B -O verification/core/normalization/verification/run.py
```

Both commands exit zero with empty standard error and print lines 4 to 17
of the output above. The standard-output SHA256 is
`bebc80ebbbc42e1a5629a4da4f7697fa1de7e6f21e0d96e1ea9a94fe640bd90b`.
This runner checks the normalization identities and replays their source
driver, then runs the three nested suites after authenticating their
manifests. Each nested suite can also be run from its own directory, as
its guide states:

```sh
cd verification/core/normalization/higher_rank/verification && python3 -S -s -B run.py
cd verification/core/normalization/local_ring/verification && python3 -S -s -B run.py
cd verification/core/normalization/boundary_models/verification && python3 -S -s -B run.py
```

Each also exits zero with empty standard error under `-O`, with identical
output in both modes:

| Suite | Final line | Standard-output SHA256 |
| --- | --- | --- |
| [Higher-rank core](verification/core/normalization/higher_rank/verification/README.md) | `RESULT: PASS TR-25 higher-rank normalization verification` | `e9fa14f954c98ea6bcb326d7673a078825f93f26369b8b90b57adb66a93cf90a` |
| [Completed local ring](verification/core/normalization/local_ring/verification/README.md) | `RESULT: PASS TR-25 completed local ring verification` | `8ac4afee8e63769b8c4328171c825036ddf915ab7435c1e2d053418232f08d1f` |
| [Boundary models](verification/core/normalization/boundary_models/verification/README.md) | `RESULT: PASS TR-25 boundary-model verification` | `628264f81b59c1544b5635169bf86d882aac5fa2a878631bcbd98ccc1a5d24bb` |

These suites check fixed finite identities only: the torus-elimination
identity, the six tangent determinants, the avoidance determinant and arc
identities, the six-point core, and the local-ring tangent dimensions in
three formats. The universal quantifiers, the normalization geometry,
normality, saturation and fibre exhaustion are written proofs; see the
[normalization exact-check guide](verification/core/normalization/verification/README.md).
The family theorem is a written proof using the finite input checked above;
its finite-instance corroboration is the second child of the entry point
(`verification/core/family-instances/`).

## Lean finite certificates

Both projects pin Lean `v4.34.0-rc2` and Mathlib revision
`85e3a25e006c35636f0e53b0e9296caca2685bc0`; the transitive dependency
revisions are pinned in [lean/witness-666/lake-manifest.json](lean/witness-666/lake-manifest.json)
and [lean/family-345/lake-manifest.json](lean/family-345/lake-manifest.json).

From `lean/witness-666/`, as in the [Lean guide](lean/witness-666/README.md):

```sh
lake exe cache get
python3 -B audit/test_verify.py
python3 -B -O audit/test_verify.py
python3 -B audit/check_literal_data.py
python3 -B -O audit/check_literal_data.py
LEAN_NUM_THREADS=1 python3 -B audit/verify.py
lake env lean audit/Axioms.lean
```

From `lean/family-345/`, as in the [family Lean guide](lean/family-345/README.md):

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

In each Python mode, `lean/witness-666/audit/test_verify.py` reports `Ran 17 tests` and `OK`;
`lean/family-345/audit/test_exact.py` reports `Ran 7 tests` and `OK`;
`lean/family-345/audit/test_verify.py` reports `Ran 18 tests` and `OK`. The
literal-data checkers print

```text
PASS: literal factors bind to the fixed witness; two negative controls rejected.
PASS: padded factor literals, six Q matrices, witness padding and ratio base matrix
```

for `lean/witness-666/` and `lean/family-345/` respectively. The independent 3×4×5
checker `lean/family-345/audit/check_exact.py` prints one JSON line with
`"status": "PASS"`, flattening ranks `[3, 3, 5]`, pair ranks
`[[5, 5, 5], [5, 5, 5]]`, third-factor ranks `[5, 5]` and Jacobian ranks
`[50, 50]` for the `[60, 60]` Jacobians, identically under `-O`.

**Lean build result.** Both projects were rebuilt from source with the
pinned toolchain on 2026-11-01. The audit runs reported (excerpt):

```text
PASS: rebuilt 48 proof modules; all project Lean sources checked.
PASS: complete source inventory and SHA256 binding match.
PASS: TR25.finiteCertificate uses exactly propext, Classical.choice, Quot.sound.
PASS: rebuilt 22 proof modules; all project Lean sources checked.
PASS: complete source inventory and SHA256 binding match.
PASS: TR25Family.finiteCertificate uses exactly propext, Classical.choice, Quot.sound.
```

Each verifier checks the source inventory against its fixed hashes, binds
the literal witness and build configuration, cleans the local package and
rebuilds every proof module. It then type-checks the aggregate theorem
against its proposition and requires exactly the axioms `propext`,
`Classical.choice` and `Quot.sound`. Proof placeholders, additional axiom
declarations, failed builds and unexpected dependency output cause a
nonzero exit. The formal propositions contain only finite identities and
ranks; see the [Lean guide](lean/witness-666/README.md), the
[family Lean guide](lean/family-345/README.md), and the
[section map](paper-lean-mapping/by-section.md) for the paper results they
support.

## Paper-to-Lean correspondence map

```sh
python3 -S -s -B paper-lean-mapping/build_and_check.py
python3 -S -s -B -O paper-lean-mapping/build_and_check.py
```

Both commands exit zero with empty standard error and identical standard
output:

```text
PASS: 42 numbered results in 8 paper sections, in TeX order
PASS: 28 Lean certificate fields mapped to their declarations: 14 in TR25.finiteCertificate and 14 in TR25Family.finiteCertificate
PASS: 9 exact-check links and 5 supporting paper anchors
PASS: by-section.md result table and declaration references match the mapping
PASS: 33 mapping negative controls rejected
RESULT: PASS mapping structure; mathematical coverage is stated per entry
```

The standard-output SHA256 is
`719ab0c0ba8f3020576e0d5d2fb8f662e05a88f06e42826608aeba2b4afd118c`.
This checks references and the stated coverage of each entry. It does not
infer mathematical equivalence from prose and does not replace the Lean
build or the exact checks. See the [reading guide](paper-lean-mapping/README.md).

## Markdown math

```sh
python3 -I -B tools/check_markdown_math.py
python3 -I -B -O tools/check_markdown_math.py
```

The static guard checks the tracked Markdown files against the GitHub math
profile and runs its own positive and negative controls. Both commands give
the same result:

```text
PASS: 67 tracked Markdown files; controls passed
```

Five README files, `verification/core/families/README.md`,
`verification/core/normalization/README.md`,
`verification/core/normalization/boundary_models/README.md`,
`lean/witness-666/README.md` and `lean/family-345/README.md`, use GitHub's
protected inline math form for formulas with subscripts and relative links
for this layout; these are Markdown-only edits.

## Manuscript

From `paper/`:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -no-shell-escape -outdir=build/ci main.tex
```

This builds 42 pages with no undefined references or citations and no
overfull boxes. The included `paper/main.pdf` has SHA256
`f13dc4c33e6264fcc8d6e152465746fc559b32109ddf56b12cb3d99fbb5aaddc`.
The text extracted from the included and the rebuilt PDF by
`pdftotext -layout` is identical; its SHA256 is
`9a543739dd6d63e048388dec19a47303badc3746bf183d97d5b9815933f0c34a`.
PDF container metadata may differ between builds. See the
[paper guide](paper/README.md).

## File integrity

The root manifest lists every tracked file except itself. Run:

```sh
sha256sum --check SHA256SUMS
(cd paper && sha256sum --check SHA256SUMS)
(cd verification && sha256sum --check SHA256SUMS)
```

Nested manifests in `paper/`, `verification/`, `verification/core/verification/`,
`verification/core/family-instances/`, `verification/core/normalization/` and its
three packages, and the source-hash files of both Lean projects bind the
manuscript, the exact suites, the proof documents and the Lean sources.
Dependency caches and regenerated build products are excluded. File hashes
establish byte identity; the commands above supply the verification
evidence.
