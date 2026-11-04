# Paper results and their evidence

This map follows [the paper source](../paper/main.tex) and its eleven
section files in [sections/](../paper/sections/) in TeX order.
Theorems, propositions, lemmas, corollaries and remarks share one counter
within each section. There are forty-two numbered results: nine theorems,
ten propositions, seventeen lemmas, four corollaries and two remarks. No
numbered definitions occur, and Sections 5 and 8 contain no numbered
result. Equation numbers below are those of the paper.

| Result | Label | Title | Evidence |
| --- | --- | --- | --- |
| Theorem 1.1 | `thm:main` | Failure of S2 and of Cohen-Macaulayness for the secant family | Paper proof; finite ingredients proved in Lean |
| Corollary 1.2 | `cor:examples` | The rank-five examples and the unit-tensor orbit closures | Paper proof; finite ingredients proved in Lean |
| Corollary 1.3 | `cor:projective` | Local non-Cohen-Macaulayness of the projective secant | Paper only |
| Lemma 2.1 | `geom:matrix-criterion` | Rank-one points in a span satisfying condition (G) | Paper only |
| Lemma 2.2 | `geom:bad-pairs-codimension` | Codimension of the failure locus of condition (G) | Paper only |
| Lemma 2.3 | `geom:smooth-span` | Smoothness of the span variety at reduced spanning intersections | Paper only |
| Lemma 2.4 | `geom:flattening-bundle` | The third-flattening bundle and the dimension of the secant | Paper only |
| Proposition 2.5 | `prop:geometry-summary` | The smooth birational decomposition space | Paper only |
| Lemma 3.1 | `lem:conductor` | A conductor divisor under S2 | Paper only |
| Lemma 3.2 | `lem:proper-at-fiber` | Properness of the conductor at a fibre with two points | Paper only |
| Proposition 3.3 | `prop:conductor-obstruction` | The two-point obstruction | Paper only |
| Remark 3.4 | `rem:fiber-scope` | Scope of the two-point obstruction | Paper only |
| Lemma 4.1 | `lem:L`, `lemma:witness-core` | The circuit of six rank-one matrices | Paper proof; exact checks of fixed finite identities |
| Lemma 4.2 | `lem:tangent-intersections` | Six tangent intersections | Paper proof; finite ingredients proved in Lean |
| Lemma 4.3 | `lemma:tangent-criterion` | From matrix tangencies to tensor immersion | Paper only |
| Lemma 4.4 | `lemma:avoidance` | Two avoidance identities | Paper proof; exact checks of fixed finite identities |
| Lemma 4.5 | `lemma:extended-tangencies` | Tangent intersections after adding rows and columns | Paper only |
| Proposition 4.6 | `prop:witness-immersion` | Integer witnesses with two immersive decompositions | Paper proof; finite ingredients proved in Lean |
| Theorem 6.1 | `bound:small-rank` | Rank five is the first possible rank | Paper only |
| Proposition 6.2 | `bound:adjacent` | The adjacent Cohen-Macaulay family in format 3×3×c | Paper proof; finite ingredients proved in Lean |
| Proposition 6.3 | `bound:invertible-slice` | No two immersive decompositions on invertible-slice charts | Paper only |
| Proposition 6.4 | `bound:smooth-lifts` | Smooth concise lifts of the two decompositions | Paper proof; finite ingredients proved in Lean |
| Proposition 7.1 | `norm:criterion` | Finite reduced intersection criterion | Paper only |
| Lemma 7.2 | `norm:core` | The six-point core intersection | Paper proof; exact checks of fixed finite identities |
| Corollary 7.3 | `norm:rank-five` | The rank-five normalization fibre | Paper only |
| Proposition 7.4 | `norm:row-column` | Row-column configurations and the fibre lower bound | Paper proof; exact checks of fixed finite identities |
| Lemma 7.5 | `nf:proper-graph` | Fibre schemes and the normalization model | Paper only |
| Theorem 7.6 | `nf:diagonal` | Diagonal fibres | Paper only |
| Lemma 7.7 | `nf:diagonal-block` | Diagonal block valuation | Paper only |
| Theorem 7.8 | `nf:rank-six` | The rank-six row-extension fibre | Paper only |
| Theorem 7.9 | `nf:three-factor` | The three-dimensional-factor row family | Paper only |
| Theorem 7.10 | `nl:theorem` | The completed local ring of the rank-five circuit | Paper proof; exact checks of fixed finite identities |
| Remark 7.11 | `nl:scope` | Specializations and scope of the local-ring theorem | Paper only |
| Theorem 7.12 | `nb:D` | One-sided extensions, D | Paper only |
| Theorem 7.13 | `nb:E1` | One row and several columns, E1 | Paper only |
| Theorem 7.14 | `nb:E2` | Two rows and two columns, E2 | Paper only |
| Lemma 7.15 | `nb:configuration` | The configuration graph | Paper proof; exact checks of fixed finite identities |
| Lemma 7.16 | `nb:charts` | Exact boundary charts | Paper only |
| Proposition 7.17 | `nb:monomial` | Normality of the monomial boundary algebras | Paper only |
| Lemma 7.18 | `nb:deformation` | Regular-parameter deformation | Paper only |
| Corollary 7.19 | `nb:graded-deformation` | The graded regular-parameter deformation | Paper only |
| Proposition 7.20 | `nb:star` | Star algebra | Paper only |

"Finite ingredients proved in Lean" means that some finite identities,
determinants or matrix ranks used in the statement or proof are fields of
one of the two Lean propositions `TR25.FiniteCertificate` (in
[lean/witness-666/](../lean/witness-666/README.md)) and `TR25Family.FiniteCertificate` (in
[lean/family-345/](../lean/family-345/README.md)). "Exact checks of fixed
finite identities" means that a standard-library program verifies a fixed
finite identity or rank used in the proof. No numbered result is a Lean
theorem in full, and no exact check establishes a statement quantified over
all ranks or formats. Every quantified statement, every geometric argument
and every commutative-algebra argument is a written proof in the paper.

The Lean coordinate definitions are in
[TR25/Definitions.lean](../lean/witness-666/TR25/Definitions.lean) and
[TR25Family/Definitions.lean](../lean/family-345/TR25Family/Definitions.lean).
In both, a coordinate Jacobian is the matrix of the derivative of the
five-term tensor-sum map in the factor coordinates. Its rank equals
$r(a+b+c-2)$ exactly when the differential on the product of the
pure-tensor cones is injective, because each summand contributes two
scaling directions to the kernel; this passage is part of the written proof.

## 1. The main theorem and its context

**Theorem 1.1** proves, for every $r\geq5$, $a,b\geq3$, $a+b\geq r+2$
and $c\geq r$, that $`X_r(a,b,c)`$ has dimension $D=r(a+b+c-2)$, fails
$`S_2`$, is not Cohen–Macaulay and has vertex depth less than $D$, with an
explicit integer witness. Its proof is in Section 5. At $r=5$ the witness
is the tensor $`T_5`$ of (4.5), padded to the target format. For the two
paddings that are formalized, the following finite data are Lean theorems:

| Lean theorem | Certificate field | Exact conclusion |
| --- | --- | --- |
| `TR25.small_total_eq` | `tensor_eq` | Both five-term sums equal the 3×3×5 witness over the integers |
| `TR25.small_different` | `decompositions_different` | Some summand of the first decomposition is not a complex multiple of any summand of the second |
| `TR25.small_flattening_rank` | `flattening_rank` | The 9×5 third flattening has rank 5 over ℂ |
| `TR25.embeddedJacobian_rank` | `embedded_linearized_rank` | Both 216×90 coordinate Jacobians in format 6×6×6 have rank 80 over ℂ |
| `TR25Family.family_total_eq` | `tensor_eq` | Both five-term sums equal the 3×4×5 witness over the integers |
| `TR25Family.family_different` | `decompositions_different` | The two 3×4×5 decompositions are different in the same sense |
| `TR25Family.flatteningC_rank_exact` | `flatteningC_rank` | The 12×5 third flattening of the 3×4×5 witness has rank 5 over ℂ |
| `TR25Family.family_linearized_rank` | `linearized_rank` | Both 60×60 coordinate Jacobians in format 3×4×5 have rank 50 over ℂ |

`verification/core/verification/check_witness.py:main` and
`verification/core/verification/check_five_term_tensor.py:main` recompute the 3×3×5 and
6×6×6 data; `lean/family-345/audit/check_exact.py:verify` recomputes the
3×4×5 data with full rational elimination. The theorem for every rank and
format, the dimension, the conductor obstruction, failure of $`S_2`$,
non-Cohen–Macaulayness, the depth inequality (1.3), border rank $r$ and
factor permutations are proved in the paper.

**Corollary 1.2.** The Lean theorems `TR25.embedded_total_eq`,
`TR25.embedded_different`, `TR25.embeddedJacobian_rank`,
`TR25Family.family_total_eq`, `TR25Family.family_different` and
`TR25Family.family_linearized_rank` give the finite data of the two
rank-five examples in formats 6×6×6 and 3×4×5. The Jacobian ranks 80 and
50 are ranks of explicit integer matrices; the equal numbers in the
corollary are variety dimensions, proved in the paper. Failure of
$`S_2`$, the vertex-depth inequalities, the family $`X_r(3,r-1,r)`$ and the
orbit-closure identity (1.4) are written proofs.

**Corollary 1.3** (the projective statement) is paper only.

## 2. Matrix spans and the decomposition morphism

Lemmas 2.1 to 2.4 and Proposition 2.5 are paper only. They give the
subset-rank condition (G), its codimension estimate, the smooth span
variety, the third-flattening bundle, the dimension formula (2.10) and the
smooth birational decomposition space. No Lean declaration or exact check
is assigned to this section.

## 3. The conductor obstruction

Lemmas 3.1 and 3.2, Proposition 3.3 and Remark 3.4 are paper only. The
conductor lemma and the two-point obstruction are general
commutative-algebra and algebraic-geometry arguments.

## 4. Integer witnesses in every rank at least five

**The two decompositions (4.5) and (4.7).**

| Lean theorem | Certificate field | Exact conclusion |
| --- | --- | --- |
| `TR25.small_total_eq` | `tensor_eq` | Both literal five-term sums equal the 3×3×5 witness over the integers |
| `TR25.small_nonzero` | `terms_nonzero` | Every summand is a nonzero complex tensor |
| `TR25.small_distinct` | `terms_distinct` | No summand is a complex multiple of a different summand of the same decomposition |
| `TR25.small_different` | `decompositions_different` | Some summand of the first decomposition is not a complex multiple of any summand of the second |
| `TR25.small_flattening_rank` | `flattening_rank` | The third flattening has rank 5 over ℂ |

The literal factors are in [lean/witness-666/certificate/witness.json](../lean/witness-666/certificate/witness.json)
and [verification/core/verification/witness.json](../verification/core/verification/witness.json). The
derivation of (4.7) from relation (4.3), and the passage from flattening
rank 5 to rank and border rank 5 in (4.8), are written arguments.

**Lemma 4.1.** `verification/core/normalization/higher_rank/verification/check_exact.py:verify`
checks relation (4.3), rank 5 of the six matrices $`Q_1,\ldots,Q_6`$ and
rank 5 of every five of them. Hence the relation is unique up to a scalar.
The coordinate description (4.4) is a written expansion.

**Lemma 4.2.** The six determinant values are Lean theorems over ℚ, in both
projects:

| Lean theorem | Certificate field | Exact conclusion |
| --- | --- | --- |
| `TR25.row_determinants_exact` | `row_determinants` | $`(D_1,D_2,D_3)=(-1/18,1/3,-2)`$, as in (4.11) |
| `TR25.column_determinants_exact` | `column_determinants` | $`(E_1,E_2,E_3)=(-1/18,4/9,-3/2)`$, as in (4.12) |
| `TR25Family.row_determinants_exact` | `row_determinants` | The same row values |
| `TR25Family.column_determinants_exact` | `column_determinants` | The same column values |

`verification/core/normalization/verification/check_normalization_identities.py:main`
recomputes them with rational arithmetic. The reduction of each tangency
condition to one of these determinants, and the conclusion (4.10), are
written arguments.

**Lemma 4.3** is paper only. The differential rank (4.13) is the rank of a
coordinate Jacobian: `TR25.small_linearized_rank` proves that both 45×55
coordinate Jacobians in format 3×3×5 have rank 45 over ℂ, and both root
checkers recompute it.

**Lemma 4.4.** `verification/core/normalization/verification/check_normalization_identities.py:main`
verifies the determinant (4.15) as a polynomial identity. The two
intersection statements (4.14) for every integer $t\geq4$ and the
distinctness and avoidance of the lines are written arguments.

**Lemma 4.5** is paper only.

**Proposition 4.6.** At $r=5$ and $p=q=3$ the formalized instances are the
seed format 3×3×5, its padding to 6×6×6 and its padding to 3×4×5. In
addition to the five theorems listed above for (4.5) and (4.7):

| Lean theorem | Certificate field | Exact conclusion |
| --- | --- | --- |
| `TR25.embedded_total_eq` | `embedded_tensor_eq` | Both padded sums equal the 6×6×6 witness |
| `TR25.embedded_nonzero` | `embedded_terms_nonzero` | Padded summands are nonzero |
| `TR25.embedded_distinct` | `embedded_terms_distinct` | Padded summands are pairwise nonproportional |
| `TR25.embedded_different` | `embedded_decompositions_different` | The padded decompositions are different |
| `TR25.embedded_flattening_rank` | `embedded_flattening_rank` | The 36×6 third flattening has rank 5 |
| `TR25.small_linearized_rank` | `small_linearized_rank` | Coordinate Jacobian rank 45 in format 3×3×5 |
| `TR25.embeddedJacobian_rank` | `embedded_linearized_rank` | Coordinate Jacobian rank 80 in format 6×6×6 |
| `TR25Family.family_total_eq` | `tensor_eq` | Both sums equal the 3×4×5 witness |
| `TR25Family.family_nonzero` | `terms_nonzero` | Summands are nonzero |
| `TR25Family.family_distinct` | `terms_distinct` | Summands are pairwise nonproportional |
| `TR25Family.family_different` | `decompositions_different` | The two decompositions are different |
| `TR25Family.flatteningC_rank_exact` | `flatteningC_rank` | Third flattening rank 5 |
| `TR25Family.pairAB_rank_exact` | `pairAB_rank` | The products of first and second factors have rank 5 |
| `TR25Family.pairAC_rank_exact` | `pairAC_rank` | The products of first and third factors have rank 5 |
| `TR25Family.pairBC_rank_exact` | `pairBC_rank` | The products of second and third factors have rank 5 |
| `TR25Family.thirdFactors_rank_exact` | `thirdFactors_rank` | The third factors have rank 5 |
| `TR25Family.family_linearized_rank` | `linearized_rank` | Coordinate Jacobian rank 50 in format 3×4×5 |

The values 45, 80 and 50 equal $r(a+b+c-2)$ in the three formats.
`verification/core/verification/check_witness.py:main`, `verification/core/verification/check_five_term_tensor.py:main`
and `lean/family-345/audit/check_exact.py:verify` recompute these data. The
proposition for every $r\geq5$, every admissible $p,q$ and every padding,
the passage from coordinate Jacobian rank to injectivity on the unordered
decomposition space, and rank and border rank $r$ are written proofs.

## 5. The depth defect and the projective statement

This section has no numbered result. It contains the proofs of Theorem 1.1
and Corollaries 1.2 and 1.3, which combine Propositions 2.5, 3.3 and 4.6
with the Auslander–Buchsbaum formula and a chart argument for the
projective secant.

## 6. Boundaries of the decomposition obstruction

- **Theorem 6.1** (rank five is first) is paper only; its sharpness is
  Proposition 4.6.
- **Proposition 6.2.** The differential rank 45 of the core decomposition
  in format 3×3×5 is `TR25.small_linearized_rank`, recomputed by both root
  checkers. The identification of $`X_5(3,3,c)`$ with the ambient space or
  a determinantal variety and its Cohen–Macaulayness are written proofs.
- **Proposition 6.3** (invertible-slice charts) is paper only.
- **The flattening ranks (3,3,5) of $`T_5`$** in Section 6.4 are
  `TR25Family.flatteningA_rank_exact`, `TR25Family.flatteningB_rank_exact`
  and `TR25Family.flatteningC_rank_exact` for the 3×4×5 padding, and are
  recomputed by `lean/family-345/audit/check_exact.py:verify`.
- **Proposition 6.4.** The two decompositions of $`T_5`$ are different
  (`TR25.small_different`); in the 3×4×5 padding the products of second
  and third factors and the third factors have rank 5
  (`TR25Family.pairBC_rank_exact`, `TR25Family.thirdFactors_rank_exact`),
  as recomputed by `verification/core/verification/check_witness.py:main` and
  `lean/family-345/audit/check_exact.py:verify`. Smoothness and distinctness
  of the lifted points in the concise secant are written proofs using the
  cited construction of Jagiełła and Jelisiejew.

## 7. Normalization fibres and local structure

All results of this section are written proofs. Four exact-check suites
verify fixed finite identities used in them; none verifies a statement
for all parameters.

- **Proposition 7.1** (finite reduced intersection criterion) is paper only.
- **Lemma 7.2.** `verification/core/normalization/verification/check_normalization_identities.py:main`
  verifies the torus-elimination polynomial identity in the proof, whose
  right-hand side is $6u(u-1)$.
  `verification/core/normalization/higher_rank/verification/check_exact.py:verify` gives a
  second route: the rank-one cycle equations at the six points, their
  nonzero Jacobian determinants and four elimination identities.
  Exhaustion of the rank-one points, reducedness and the padding statement
  are written arguments.
- **Corollary 7.3** (the rank-five fibre) is paper only.
- **Proposition 7.4.** `verification/core/normalization/verification/check_normalization_identities.py:main`
  verifies symbolically the row and column arc coefficient identities that
  express $v$ in the rows of $M$ and in the negated columns of $M$. The
  intersection, the six decompositions, the arcs and the fibre lower bound
  are written arguments.
- **Lemma 7.5, Theorems 7.6, 7.8 and 7.9 and Lemma 7.7** (higher-rank
  fibres) are paper only. Their fixed core input is Lemma 7.2.
- **Theorem 7.10.** `verification/core/normalization/local_ring/verification/check_certificate.py:check_format`
  computes, for first two factor dimensions $(3,4)$, $(4,4)$ and $(6,6)$,
  the dimensions of one branch tangent space, the common tangent space and
  the span of all six: 25, 23, 35; 30, 26, 50; 50, 38, 110. The
  branch-minus-common differences are $q=2(a+b-6)$.
  `verification/core/normalization/local_ring/verification/check_core.py:main`, a
  byte-identical copy of the normalization identity checker, verifies the
  torus-elimination identity, the six tangent determinants and
  $\det M=2$. The isomorphism (7.12) and the dimension, depth, embedding
  dimension, multiplicity, normalization and conductor are written proofs.
- **Remark 7.11** (specializations and scope) is paper only.
- **Theorems 7.12, 7.13 and 7.14** (boundary models D, E1 and E2) are
  paper only. Their fixed core input is Lemma 7.15.
- **Lemma 7.15.** `verification/core/normalization/boundary_models/verification/check_exact.py:verify`,
  a byte-identical copy of the higher-rank core checker with the same
  certificate, verifies the six-point core. The intersections for the
  displayed witnesses, the independent subsets, birationality and the graph
  closure are written arguments.
- **Lemma 7.16, Propositions 7.17 and 7.20, Lemma 7.18 and Corollary 7.19**
  (boundary charts and normality of the boundary algebras) are paper only.
  No bounded semigroup enumeration is used to prove saturation.

The final subsection of Section 7 proves, without numbered results, the
local inverse-branch statement and the retract and conductor facts; these
are paper only.

## 8. Exact arithmetic and the finite formal certificate

This section has no numbered result. Section 8.1 describes the two root
checkers `verification/core/verification/check_witness.py:main` and
`verification/core/verification/check_five_term_tensor.py:main`. The five items of Section 8.2
are exactly the fourteen fields of `TR25.FiniteCertificate`, proved by
`TR25.finiteCertificate`; the separate 3×4×5 certificate
`TR25Family.finiteCertificate` is not described in the paper. Section 8.3
describes the uniform construction, which is a written proof. The additional
finite corroboration it reports, for 15 pairs $(r,p)$ and one extension from
4×5×8 to 5×5×8, is `verification/core/family-instances/check_reach_instances.py:main`.

Each aggregate theorem permits exactly the axioms `propext`,
`Classical.choice` and `Quot.sound`. Neither Lean proposition contains a
border-rank, secant-dimension, tangent-space, normalization, conductor,
$`S_2`$, Cohen–Macaulay or depth statement, and none of these is a premise
of either Lean theorem.

The [mapping](mapping.json) records the same correspondence in
machine-readable form. Its checker reads the TeX sources, the Lean sources
and the exact checkers, and fails if a label, declaration, certificate
field, file or function named here is missing.
