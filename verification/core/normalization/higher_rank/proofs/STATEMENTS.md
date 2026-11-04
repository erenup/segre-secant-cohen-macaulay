# Higher-rank normalization fibers: statements A–C

All varieties are reduced over C, all
normalizations are finite normalizations in their own function fields, and
all tensors below have THREE factors. No global smoothness, global
Cohen–Macaulayness, rational-singularity, or exact-depth claim is made.

## Common data

Let A0=B0=C^3. Set

    M = [[1,1,1],[1,2,3],[1,4,9]],
    Qi = ei ⊗ row_i(M)             (1<=i<=3),
    Q_(3+j) = -column_j(M) ⊗ ej    (1<=j<=3),
    L0 = span(Q1,...,Q6),
    T5 = sum_(i=1)^5 Qi ⊗ fi,
    v(z) = (1,z,z^2).

The fi are distinct coordinate vectors in the third factor C. Let
X_r(a,b,c) denote the reduced affine variety of tensors of border rank at
most r in C^a⊗C^b⊗C^c. Every tensor displayed below has rank and border
rank exactly r. All factor permutations of the statements are allowed.

## A. Diagonal extensions: six points in every rank

For every integer r>=6, set t=r-5. For every a,b>=r-2 and c>=r, choose
independent extra coordinate vectors u_1,...,u_t in A/A0 and
w_1,...,w_t in B/B0, and put

    D_s = u_s⊗w_s,
    T_diag = T5 + sum_(s=1)^t D_s⊗f_(5+s).

The finite normalization of X_r(a,b,c) has exactly SIX reduced points
over T_diag. All six are smooth and correspond bijectively to the six
actual unordered r-term decompositions of T_diag. There is a Zariski
open neighborhood of T_diag whose entire normalization is smooth and
whose normalization morphism is unramified. No boundary normalization
point occurs over this tensor.

The disjoint diagonal extension is different from the row/column family
in the [earlier normalization theorem](../../proofs/STATEMENTS.md), which has extra boundary points. Proof: DIAGONAL_EXTENSIONS.md.

## B. Original rank-six witness: exactly seven smooth points

For every a>=4,b>=3,c>=6 with a+b>=8, let u be one new coordinate in A/A0
and put

    T_row6 = T5 + (u⊗v(4))⊗f6.

The finite normalization of X_6(a,b,c) has exactly SEVEN reduced points
over T_row6. All seven are smooth. Six correspond to actual six-term
decompositions. The seventh corresponds to the limiting configuration
of all six core directions Q1,...,Q6 and is not an actual six-term
decomposition. There is a Zariski open neighborhood of T_row6 whose
entire normalization is smooth and whose normalization map is unramified.

Exchanging A and B gives the column-extension statement with a>=3,b>=4,
a+b>=8,c>=6. Proof: RANK6_BOUNDARY.md.

## C. Original row family with a three-dimensional matrix factor

For every integer r>=6, every a>=r-1 and c>=r, take dim B=3 and choose
independent extra A-coordinate vectors u_1,...,u_(r-5). Put

    R_s = u_s⊗v(s+3),
    T_row = T5 + sum_(s=1)^(r-5) R_s⊗f_(5+s).

The finite normalization of X_r(a,3,c) has exactly r+1 reduced points
over T_row. All r+1 are smooth. Six correspond to actual r-term
decompositions; the other r-5 correspond to the dependent configurations
which omit one added R_s and include all six Q_i. There is a Zariski
open neighborhood of T_row whose entire normalization is smooth and
whose normalization map is unramified.

Arbitrary enlargement of the matrix factor B is not included in C.
Proof: THREE_DIMENSIONAL_FACTOR.md.

## Prior results and novelty boundary

The [earlier normalization theorem](../../proofs/STATEMENTS.md) proved the complete rank-five fiber, the exact rank-one
intersections for the original row/column family, its six actual
decompositions, and at least r+1 normalization points at higher ranks.
Those are reused inputs, not new conclusions here. The new work is the
exclusion of all hidden boundary points in A and the smooth local
blowup calculations proving exhaustion and regularity in B and C.

The full original mixed row/column family for r>=7 with both matrix
factors enlarged remains outside these three statements. Its boundary
singularities are not part of
this package.
