# Referee report B: fidelity of the Lean statement for the 6×6×6 witness

Reviewed: the Lean proposition `TR25.FiniteCertificate` in lean/witness-666/TR25/Statement.lean and lean/witness-666/TR25/Definitions.lean, with lean/witness-666/certificate/witness.json and an earlier version of lean/witness-666/README.md. Only the statement was reviewed; the Lean proof was reviewed separately in report 16.

**Verdict: ACCEPT. Requested changes: none.** `TR25.FiniteCertificate`
faithfully states the finite coordinate facts used by the accepted TR-25
proof. This is acceptance of the statement, not certification that the full
proposition has been proved in Lean, and not a formalization of the geometric
non-S2/non-Cohen--Macaulay theorem.

## Reviewed copies and scope

The files were copied before review. All three supplied SHA256 values match,
and the three files are byte-identical to the repository files:

| File | SHA256 |
| --- | --- |
| lean/witness-666/TR25/Definitions.lean | 32506bbaac127706ce4eca7a62ce7dd51a5f79b677122840e99950a1ddcb8f9d |
| lean/witness-666/TR25/Statement.lean | 6aa442f9872b58239ee191601909eb9d9ee39eb89031df6d03ef3a8442a0f3a0 |
| lean/witness-666/certificate/witness.json | 4f856a7ff466a5f4116ea11b64bcdbafae31e70b9049cd2492e4f78f765d54e6 |

The README of that time was also copied for its expressly requested
scope-disclosure check; it is an earlier version of
lean/witness-666/README.md. Review was of the copies; no author file was
edited and the author was not contacted.

The reference written proof is the previously accepted PROOF.md with
SHA256 `9d1c3cefdfc46e02a9e8c34d3f1d74a4396b1e0f5beb9e8f04210d8a8ba82825`,
the source hash recorded for verification/core/proofs/PROOF.md in
verification/core/verification/SOURCE_BINDINGS.txt. The JSON is
byte-for-byte the same witness as in that accepted package.

## Statement and data fidelity

`FiniteCertificate : Prop` is a parameter-free structure with fourteen
mandatory fields. Its constructor requires every field. It has no hidden
premise, disjunction, existentially chosen replacement tensor, false
antecedent, or uninhabited quantified type. `Fin 2`, `Fin 5` and `Fin 3`
refer to the intended two decompositions, five terms and three determinants
per list. The only implication in pairwise distinction excludes comparing
a term with itself.

| Required finite fact | What the copied statement says |
| --- | --- |
| Explicit integer tensor | `witness ((i,j),k)` is the (i,j) entry of q_k for k=0,...,4; these are exactly Q_1,...,Q_5 of the proof |
| Both five-term sums | `tensor_eq` quantifies both d:Fin 2 and requires `total ℤ (small d)=witness` |
| Padding to 6x6x6 | `embedded` pads each factor by zeros; `witness6` retains exactly i<3,j<3,k<5; `embedded_tensor_eq` requires both padded sums to equal it |
| Nonzero terms | Every one of the five complete pure tensors is nonzero over C, in both formats |
| Pairwise projectively distinct terms | For all distinct indices and every z:C, one pure tensor differs from z times the other, in both formats |
| Different unordered decompositions | One fixed first-decomposition index has a direction absent from every second-decomposition term for all complex scalars, in both formats |
| Flattening ranks | The actual third-mode flattenings of sizes 9x5 and 36x6 have rank exactly 5 over C |
| Six rational determinants | All three row ratios have determinants (-1/18,1/3,-2), and all three column ratios (-1/18,4/9,-3/2), over Q |
| Linearized ranks | The coordinate Jacobians have complex rank 45 and 80, respectively, for every d:Fin 2 |

All thirty literal factor vectors match the accepted JSON. In the second
list the first four third factors are f_i-f_5 and the last matrix factor
is `(1,3,9) tensor e_3=-Q_6`; there is no lost minus sign. The first five
q slices include the negative first and second columns of M. The tensor
coordinate order is `((i,j),k)` throughout. Multiplication has no complex
conjugation, as required for tensor products over C.

The exact integer equalities imply the corresponding complex equalities
under the integer ring homomorphism, which preserves finite sums and
products. Using Z for these equality fields is stronger exact data, not
a wrong-field relaxation. All projective and rank predicates explicitly
use C.

`NonzeroTerms` concerns each full tensor rather than merely the entire list.
Over C it also forces each of the three factor vectors to be nonzero.
`DistinctDirections` compares the full tensor coordinates under the
pointwise complex scalar action, not just one factor, and includes every
complex scalar. Allowing zero causes no problem because each term is
nonzero. `DifferentDirections` has the correct quantifier order
`exists i, forall j, forall z`; a single missing direction suffices to
distinguish the two unordered configurations. Requiring the reverse
direction as well would add no needed information for this use.

The other-indices table is `[[1,2],[0,2],[0,1]]`, so the omitted row/column
is correct and the remaining order agrees with the determinant signs in
the proof. The base matrix is over Q, with every entry nonzero. The ratios
therefore use rational division with no zero denominator. Literal fractions
such as `(-1/18 : ℚ)` are rational values, not integer quotients.

The padded flattening has a zero sixth column and zero rows outside the
old 3x3 coordinate block. It retains the nonzero 5x5 minor of determinant
27. There is no replacement by a different flattening or reshape. Mathlib's
`Matrix.rank` is the finite dimension of the range of `mulVecLin`; the
explicit instantiation at C gives the ordinary complex matrix rank here.

## The Jacobian is the required addition differential

For arbitrary complex factor coordinates define the polynomial sum map

    Phi(A,B,C)_(i,j,k) = sum_(t=0)^4 A_(t,i) B_(t,j) C_(t,k).

Expanding at the displayed integer base point, the coefficient of a scalar
parameter h under variations (alpha,beta,gamma) is

    sum_t [alpha_(t,i) b_(t,j) c_(t,k)
             + a_(t,i) beta_(t,j) c_(t,k)
             + a_(t,i) b_(t,j) gamma_(t,k)].

This is its complex differential. `Param a b c` is exactly
`Fin 5 × (Fin a ⊕ (Fin b ⊕ Fin c))`: a summand index plus one coordinate
variation in one factor. The three cases of `jacobian` are precisely the
three standard-basis coefficients above, using the correct Kronecker delta
and the two unvaried factors. The summand index is `t.1` in every case.
No mode, scalar variation, or summand is omitted or duplicated.

Thus the small matrix has 45 rows and 55 columns, and the embedded matrix
has 216 rows and 90 columns. `embeddedJacobian` first pads the base factors,
then differentiates with all six coordinates in each mode. It does not
merely zero-pad the old Jacobian: complement-coordinate variations remain
present and nonzero when the other two factors are nonzero.

The two independent raw scaling-kernel directions per nonzero term may be
written `(a,-b,0)` and `(a,0,-c)`. All five terms have disjoint parameter
slots, giving ten kernel dimensions. Therefore ranks 45 out of 55 and 80
out of 90 are exactly the finite image-rank facts needed for injectivity
on the product of pure-cone tangent spaces. They are not an incorrect
assertion that the raw 55- or 90-dimensional parameter maps are injective.
The passage to tangent spaces of the smooth permutation quotient remains
part of the separate geometric proof.

The Lean statement defines the coordinate matrix; it does not include a
theorem using a derivative API or identifying a quotient-variety tangent
map. The direct polynomial expansion above verifies that its matrix is
the correct one. This matches the explicitly requested finite-coordinate
scope and requires no change to the proposition.

## Compilation and supplementary checks

The copied Definitions.lean and Statement.lean both compile unchanged with
Lean v4.34.0-rc2. The runtime reports commit
`6a10ac8c22beadecabdbb0919c2b50214762f91d`. The separate shared Mathlib
checkout used for imports has HEAD
`85e3a25e006c35636f0e53b0e9296caca2685bc0`, matching the README. No author
proof implementation was imported or executed. All generated review
objects were kept separate from the author's files.

A reviewer-written Lean file supplements the semantic review with index
cardinalities, all three Jacobian column formulas, projections of the rank
fields, and concrete integer sum equalities. Compilation details, including
development attempts for this reviewer-owned harness, were retained; they
are not changes requested of the author.
The final sanity file compiles successfully with exit code 0, including
both small and embedded integer tensor equalities. It contains no `sorry`,
new axiom, native-decide shortcut, or claimed inhabitant of the entire
`FiniteCertificate`. Initial harness resource/name-resolution issues were
resolved only in this reviewer-owned file; the copied modules stayed
byte-for-byte unchanged.

Independent restricted-literal readers also match the Lean arrays against
JSON without evaluating remote source text. Exact integer/Fraction checks
cover the tensor sums, projective distinctions, flattenings and rational
determinants. Their negative controls alter factor signs, q entries, ratio
indices, missing terms or format data and are rejected by explicit
SystemExit, with matching ordinary/optimized behavior. These are
supplementary semantic/data checks, not a substitute for Lean checking a
future proof of the complete `FiniteCertificate` proposition.

Three supporting audits, parts of this review, each independently accept
the statement without changes.

## Scope disclosure and disposition

The proposition contains no field asserting border rank, S2,
Cohen--Macaulayness, normalization, or a homogeneous-vertex depth statement.
Flattening rank is correctly included as a finite matrix fact; its use
as a border-rank obstruction is outside this formal statement.

The README of that time expressly says the geometric non-S2/non-CM conclusion,
normalization, conductor argument, quotient-variety tangent identification
and vertex inequality are not formalized. It places border rank outside
the formal statement and says, "Proof implementation is in progress;
defining this proposition is not yet a proof of it." These disclosures
are accurate and satisfy the review requirements.

There is no vacuous, weakened, mis-indexed or wrong-field condition requiring
correction. Verdict: **ACCEPT**, for statement fidelity only.
