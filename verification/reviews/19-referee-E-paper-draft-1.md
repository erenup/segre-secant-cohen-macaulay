# Referee report E: fidelity of an earlier draft of the paper (original 6×6×6 case)

Reviewed: an earlier, 12-page draft of the paper on the original 6×6×6 case only, against the statement and proof now in verification/core/proofs/ and the exact checks now in verification/core/verification/. The current paper/ is a later, restructured and extended version.

**Verdict: ACCEPT. Required corrections: none. No patch applied.**

This review followed a fixed paper-review checklist. It is a review of the
reviewed draft, not a publication or a new Lean kernel verification.

The paper faithfully presents the accepted proof, its expanded arguments
are valid and readable, its historical claims give appropriate credit,
and its explicit finite examples pass fresh exact replays. The manuscript
correctly distinguishes the earlier nonnormality results from its stronger
failure of Serre's condition S2 and Cohen–Macaulayness.

## 1. Inputs and review method

The reviewed draft was a single-file 12-page manuscript (887 lines of
`main.tex`) with its bibliography and PDF. The accepted reference was the
statement and proof of the original 6×6×6 case with its exact checks:

| Accepted reference | SHA256 |
| --- | --- |
| `proofs/PROOF.md`, now verification/core/proofs/PROOF.md | `ee50513933d0c18605ea8ae651537803e245f35ed222c3823015f05809c2ad0d` |
| `proofs/STATEMENT.md`, now verification/core/proofs/STATEMENT.md | `256b1acd563cc7be692ce7ac96e46d3bb8a844f4c5a3adb2eaa6b08916526e7c` |

Both are byte-identical to the repository files. All 276 entries in the
author's draft manifest verified. The final audit rechecked all 348
copied files against both their initial hashes and their original files,
including complete inventories: no input changed and no author file was
edited.

I read the accepted README, statement, and proof before reading all 887
lines of the manuscript. I wrote my mathematical reading separately from
the fidelity, finite-example, and history subreviews, then read and checked
those reports. These are components of this review, not additional
reviews. No author's report, fidelity-map claims, research audit, or saved
execution results were used as evidence for the mathematics. The author
was not contacted.

## 2. Fidelity and referee reading

The theorem concerns the **reduced complex affine variety** of tensors of
border rank at most five in `(C^6) tensor (C^6) tensor (C^6)`. It has dimension
80, its coordinate ring fails S2 and is not Cohen–Macaulay, an explicit
tensor has a non-Cohen–Macaulay local ring, and the homogeneous vertex has
depth strictly less than 80. This is the accepted statement, with no
weakening or unsupported strengthening. In particular, no exact vertex
depth or inequality `depth O_(X,T) < 2` is claimed.

Every numbered assertion and its proof agrees with the accepted proof (line numbers refer to the reviewed draft):

| Manuscript statement | `main.tex` line | Conclusion of review |
| --- | ---: | --- |
| Theorem 1.1 | 73 | Same variety, dimension, S2/CM failure, and vertex inequality. |
| Proposition 2.1 | 241 | Smooth decomposition source, unique full-rank orbit decompositions, birationality, and source codimension bound. |
| Lemma 3.1 | 331 | Correct conductor-divisor consequence of S2, with the necessary local finite-type hypotheses. |
| Lemma 3.2 | 407 | Two normalization points force the conductor to be proper at every point above the local closed point. |
| Proposition 3.3 | 421 | Two distinct decompositions with injective differentials give the stated S2 obstruction. |
| Lemma 4.1 | 537 | Correct six-matrix relation, five-dimensional span, and independence of each five-element subset. |
| Lemma 5.1 | 615 | Correct tangent intersections and all six rational determinants. |

The expansions are sound. In particular:

- The distinct, nonzero summand conditions make the permutation action
  free; its quotient is finite étale over C and preserves the smooth source
  and its tangent dimension. The full-column-rank uniqueness argument
  identifies whole unordered pure summands, including coefficients.
  The rank-deficient complement has codimension at least two **in the
  source**, under the retained hypotheses `r >= 2`, `n_j >= r+1`.
- The conductor is identified with `Hom_A(B,A)`. The regular-sequence
  division argument proves the needed S2 module property without assuming
  flatness. Equality of heights follows from the finite-type dimension
  formulas and finite residue extensions. The depth lemma then forces a
  height-one conductor component through every point of its support.
- Injective differentials imply quasi-finiteness at the two specified
  decompositions. The lifted quasi-finite birational morphism to the normal
  target is an open immersion by Zariski's Main Theorem. Thus the two points
  remain distinct in the normalization. The conductor divisor persists on
  the chart and cannot lie in its codimension-two deficient locus.
  No assumption that the fiber has only two points, or that the target is
  smooth in codimension one, enters the proof.
- The direct-sum tangent calculation treats tangent vectors to pure tensors
  correctly, without confusing them with the redundant factor coordinates.
  Padding adds independent blocks of dimensions 15, 15, and 5 to rank 45,
  giving the required rank 80 at both decompositions.
- The graded-resolution argument correctly transfers the non-CM obstruction
  at T to the vertex. Minimality survives homogeneous localization; a CM
  vertex would give projective dimension 136, and localization with
  Auslander–Buchsbaum would force every local ring to be CM. This does not
  assume the nonhomogeneous maximal ideal of T lies inside the homogeneous
  maximal ideal.

I found no missing case, notation conflict, or under-justified step requiring
revision. Full line mappings and derivations were written out.

## 3. History, credit, and cited results

Five primary research references were checked against freshly downloaded
exact arXiv versions, exceeding the checklist's five-reference threshold
when the additional Raicu check is included. The historical assertions are
accurate in the following precise ranges:

| Primary source | Checked location and claim |
| --- | --- |
| Landsberg–Weyman, `math/0601452v2` | Introduction p. 3 asks the general ACM question. Theorems 1.1–1.3 give the cited normal/rational-singularity and ACM families with their stated dimension restrictions. The manuscript does not attribute normality to Theorems 1.2–1.3. |
| Catalisano–Geramita–Gimigliano, `math/0609054v2` | Theorem 2.4, p. 8, gives the stated unbalanced determinantal cases and ACM conclusion. The manuscript does not claim that every unbalanced secant belongs to these cases. |
| Oeding, `1603.08980v2` | Conjecture 1.1 is the universal arithmetic CM assertion. Theorem 3.2, p. 6, gives the fourth secants of `P^2 x P^2 x P^n` for all `n >= 3`. |
| Bürgisser–Ikenmeyer 2011, `1011.1350v1` | Corollary 7.2(2), printed p. 8 / PDF p. 9, proves nonnormality of the full-size unit-tensor orbit closure for `m >= 5`. The bibliography correctly identifies the longer arXiv version as the source of that numbering. |
| Bürgisser–Ikenmeyer 2017, `1511.02927v2` | Corollary 5.26, p. 29, repeats that unit-tensor result and expressly credits the earlier paper. The draft correctly calls this a later treatment. |

The paper distinguishes the earlier full-size unit tensor in `(C^m)^3`
from the embedded rank-five unit tensor in `(C^6)^3`. It also explains why
nonnormality does not imply failure of S2 or CM: Serre's normality criterion
requires both R1 and S2, and the cusp `C[t^2,t^3]` is a valid nonnormal CM
example. The earlier results are credited without being used as hypotheses
of the new proof. There is no claim to the first nonnormal tensor secant.

The unused Raicu bibliography entry was checked against `1011.5867v2` and
publication metadata; no incorrect universal ACM attribution occurs.
All fifteen cited Stacks tags were fetched and checked for their stated
roles. Titles, authors, publication years, page ranges, and DOI metadata
agree with the checked sources. Two direct publisher requests returned
HTTP 403; those failures are recorded, and the corresponding primary arXiv
papers were available and read. In total, 35 successful source receipts,
including six primary PDFs and fifteen Stacks pages, pass the final hash
audit.

There are only optional editorial suggestions: add the precise p. 3 locator
to the Landsberg–Weyman question; optionally print the full unbalanced range;
remove the unused Raicu entry if desired; or expand the Zariski's Main
Theorem citation with the integral finite intermediary. None changes or
repairs the proof, and none is a condition of acceptance. No patch was made.

## 4. Exact examples and formalization scope

There is no `check_examples.py` in this draft. Its actual equivalents were
run from fresh copies: `check_witness.py`, `check_five_term_tensor.py`,
`check_independent_data.py`, `check_literal_data.py`, and the registered
`verification/run.py`. Both draft-included TR-25 snapshots match all 71
files of the accepted package, including inventories (142 comparisons).

The replay used Python 3.12.10 with `-I -B`, normally and with `-O`:
**26 direct invocations**, comprising five positive programs and eight
selected negative controls in each mode. Every positive returned zero;
every selected control returned exactly one with its expected rejection.
All 13 normal/optimized pairs had byte-identical stdout, stderr, and exits.
The literal-data program also checked its two internal mutations. Each of
the two registered-wrapper invocations ran six positive and fifteen negative
child executions, including effective hash seeds 1 and 8675309. The direct
isolated `-I` runs ignore `PYTHONHASHSEED`; the wrapper children use
`-S -s -B`, so the seed coverage comes from those children.

The replays confirm exact equality of the two tensors before and after
padding, nonzero/distinct projective directions, all required independence
claims, flattening rank five, row determinants `-1/18, 1/3, -2`, column
determinants `-1/18, 4/9, -3/2`, and Jacobian ranks 45 and 80 for both
decompositions. The second decomposition's final factor `(1,3,9)` has the
correct sign. The independent reconstruction uses exact integer elimination
with gcd reduction for rational ranks; the modular checks are also rigorous
lower bounds with the written upper-bound arguments.

The final receipt audit rechecked 59 manifest artifacts, all 26 expected
exits, 52 raw-log hashes, 13 output-parity pairs, and 73 immutable inputs,
with no discrepancies. This final audit did not rerun the already
successful arithmetic.

The finite Lean description agrees with the actual accepted proposition
and definitions. It covers the stated literal tensor identities, direction
conditions, determinants, flattenings, and coordinate Jacobians. It does
**not** formally establish the geometric tangent-space interpretation,
border rank, normalization/conductor argument, S2/CM conclusion, or vertex
depth. The manuscript states those limits correctly. This review checked
the formal statement's scope and literal binding; **no fresh Lean kernel
build was run or is claimed**.

## 5. Build, layout, and hygiene

A fresh build from copied `main.tex` and `refs.bib` succeeded with
`latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error`.
The final LaTeX and BibTeX logs contain no warnings, unresolved references,
or over/underfull boxes. The rebuilt PDF has 12 pages; its extracted text
is byte-identical to the extracted text of the submitted PDF; the PDFs are
not claimed to be byte-identical. I inspected all twelve
freshly rendered pages, and pages 7–8 at larger scale: formulas, tables,
references, numbering, and margins are readable and unclipped.

Both required term scanners returned clean on the unchanged manuscript.
There is no internal process history, AI claim, internal name, or
review narrative. The Python/Lean discussion describes only mathematical
verification. The author and acknowledgement placeholders are the intended
placeholders.
