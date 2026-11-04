# Referee report A: the higher-rank normalization fibres

Reviewed: statements A–C and their proofs now in verification/core/normalization/higher_rank/ (proofs/ and PRIOR_INPUTS.md), and the exact checks now in its verification/ directory.

I accept **A, B, and C exactly as stated**, without mathematical corrections.
This is one independent review; the other referee's review is separate.

## Material reviewed and independence

I copied the reviewed files and verified all 19 manifest entries before
review. The statement and all proof/checker bytes remained unchanged.

Before reading any proof, prior-proof snapshot, certificate, checker,
or README, I read only STATEMENTS.md, the manifest and file names, and the
assignment. The assignment named the focus mechanisms (valuation exclusion,
span graph / blow-up, residual differential); it did not supply an author
argument. I had previously reviewed the rank-five normalization result.
Those exposures were recorded. I contacted neither the author nor the other
referee and opened no author material outside the reviewed files.

My independent reconstruction and rational core calculation were fixed
before I opened the proofs. For A I reconstructed an all-valuation exclusion
using the exact smooth dependence-center ideal, rather than anticipating the
author's particular Schur-complement formula. I then checked that formula
line by line. The reconstruction also covers the B/C local models, fiber
counts, reducedness, and normalization transfer.

## A — ACCEPT

For every r>=6, a,b>=r-2, c>=r, the diagonal witness has exactly six
normalization points, all reduced and smooth, corresponding to its six actual
unordered decompositions. There are no boundary points. The entire
normalization is smooth and unramified over a suitable Zariski neighborhood.

The core intersection is exactly six reduced points. Block support then gives
the full r+1-point reduced intersection for the diagonal extension. No
colliding configuration can occur over its span: a first nonzero difference
of two normalized colliding arcs would be a nonradial Segre tangent in the
span. Equivalently the flat length-r limit would lie in a reduced intersection.

The only remaining boundary candidate omits one added diagonal. The retained
diagonals can be fixed simultaneously over the DVR by separate near-identity
basis changes. The leading pole relation has all six core coefficients equal
and nonzero and all retained diagonal coefficients zero. Splitting the core
sum into two rank-at-most-three matrices with common invertible 3-by-3 block
is legitimate. The exact identities E=C A^{-1} B make the difference of their
outer blocks have valuation at least k+1 when the three other block differences
have valuation at least k. The omitted diagonal coordinate of z^k Z has
valuation exactly k, which contradicts this. This controls arbitrary arcs and
padding, not only a first-order deformation.

## B — ACCEPT

For a>=4,b>=3,c>=6,a+b>=8, the rank-six row witness has exactly seven reduced
smooth normalization points: six actual decompositions and one boundary point
at the six-core configuration. The asserted column permutation and entire
smooth unramified normalization neighborhood are also accepted.

The pivot elimination identifies the maximal-minor ideal with the relation
incidence scheme. The relation coefficients are units at the six-core point,
so absorbing them into factor columns is valid here. In the AB^t=0 chart,
the invertible blocks solve A2=-A1 D C^{-1} and E=D C^{-1}F scheme-theoretically.
The free chart has dimension 3a+3b+9 before coefficient restoration and torus
descent, giving dependence-center dimension 3a+3b+2 and codimension
3a+3b-14. Thus the proof establishes the actual ideal's smoothness, not only
smoothness of its radical.

The Plucker graph is the blow-up of this regular ideal. Its exceptional normal
space maps isomorphically to
`(A0 tensor B + A tensor B0)/L0`. The omitted row direction is in this space
and gives exactly one exceptional point over the prescribed span. The proper
Hilbert graph exhausts every configuration because its length-six fiber lies
inside the reduced seven-point intersection. This proves both completeness and
regularity of the boundary branch.

## C — ACCEPT

For every r>=6, a>=r-1, c>=r with dim B=3, the stated row-family witness has
exactly r+1 reduced smooth normalization points: six ordinary points and r-5
boundary points indexed by omitted added rows. The entire smooth unramified
normalization neighborhood is accepted. No enlargement of B is inferred.

At each dependent subset the residual coordinates generate the exact
maximal-minor ideal. Its differential is the core-weighted sum of point
variations modulo the retained (r-1)-span. The three row-core B factors form a
basis of B, and their relation coefficients are nonzero. Their A variations
therefore cover A tensor B; projective radial directions already lie in the
retained span. This proves surjectivity even though the coefficients of the
other retained points are zero. The regular-center blow-up has one smooth
point over each specified residual line. Proper exhaustion gives the exact
count. This mechanism correctly explains the restriction dim B=3.

## Common global-to-local steps

The full-spark / Sylvester inequality proves generic unordered birationality
in every claimed format: r<=a+b-2. It is an elementary replacement for the
standard generic Kruskal criterion used in my initial reconstruction.
Properness permits shrinking to a finite morphism whose whole source is
smooth. Finite birationality then identifies it with the entire normalization.
The fibers are reduced and have zero relative tangent space, so the finite
map is unramified, with no flatness or etaleness assertion needed. The
full-third-flattening-rank locus is locally the product of the span variety
with the full-rank r-by-c matrix open set; integral closure, smoothness, and
unramifiedness transfer as stated. Rank and border rank equal r by flattening.

## Executed verification

The unchanged standard-library checker passes normally and under `python -O`,
with identical stdout and stderr. Both runs reject all five built-in controls
for their intended reasons. The final valid runs took 0.02675 s / 12,676 KiB
and 0.02866 s / 12,392 KiB peak RSS, respectively (subprocess wall time).

I added two distinct certificate corruptions in separate copied directories:

1. `every_five_rank=4`: rejected with `five point independence` in both modes.
2. Change M[2][2] from 9 to 10 and compensate its determinant from 2 to 3:
   rejected with `second elimination identity` in both modes.

All four corrupted runs exit 1. The initial reviewer harness predicted the
second corruption would first fail the Jacobian check; it actually preserves
those determinants and fails the second elimination identity. I corrected that
expected label, preserved the original executions, and reran the final harness.
No change to the reviewed files was made; this was a reviewer-side issue.

The independent SymPy rational check also passes in both modes: all six
projective Jacobian determinants are +/-1/18 in equations scaled by the four
M entries, equivalent to the author's +/-12, and the remaining chart ideal
is `(a3-a2,a2^2-a2)`. The checker certifies fixed core algebra only. The
unbounded-r conclusions rest on the written arguments reviewed above.

## Scope

This accepts three new local normalization theorems. It does not recount the
rank-five result or old lower bound as new, and it claims nothing about global
normalization smoothness, global CM/rational singularities, exact local depth,
or arbitrary mixed row/column families at r>=7. No required corrections remain.
