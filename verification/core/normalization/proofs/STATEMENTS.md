# Exact statements concerning normalization fibers

All varieties and tensor products below are over C, and image closures
carry their reduced structure. Normalization is in the variety's own
function field.

## A. General normalization criterion

Let S be a smooth irreducible projective subvariety of P(W). Let r>=1,
let U be the nonempty open subset of ordered independent r-tuples in S^r,
and let H be the closure of their spans in Gr(r,W). Assume the unordered
span morphism U/S_r -> H is birational. Let L in H satisfy:

- the scheme P(L) intersect S consists of m>=r distinct reduced points;
- every r-element subset of those points is linearly independent.

Then there is a Zariski open neighborhood N of L whose normalization is
smooth, the normalization morphism over N is unramified, and its fiber
over L consists of exactly binomial(m,r) reduced points, indexed by the
r-element subsets of that intersection.

For any vector space C_0 of dimension c>=r, let X be the closure in
W tensor C_0 of sums of r terms P_i tensor c_i, with [P_i] in S. If T has
flattening C_0* -> W of rank r and image L as above, there is an open
neighborhood of T in X whose entire normalization is smooth. Its
normalization map is unramified and its fiber over T consists of exactly
binomial(m,r) reduced points.

## Definitions for B and C

Put M=[[1,1,1],[1,2,3],[1,4,9]], with rows r_i and columns m_j.
In A_0 tensor B_0=C^3 tensor C^3 put

    Q_i=e_i tensor r_i (1<=i<=3),
    Q_(3+j)=-m_j tensor e_j (1<=j<=3),
    L_0=span(Q_1,...,Q_6),
    T_5=sum_(i=1)^5 Q_i tensor f_i.

Here tensor factors in a row vector mean its corresponding vector in B_0,
and f_i are coordinate vectors of the third factor.

For r>=5 and p,q>=3 with p+q=r+1, extend A_0 and B_0 to C^p and C^q,
with complementary coordinate bases u_s (1<=s<=p-3) and w_t
(1<=t<=q-3). Put v(z)=(1,z,z^2)^t and

    R_s=u_s tensor v(s+3),
    S_t=v(t+3) tensor w_t,
    L_r=span(Q_1,...,Q_6,R_1,...,R_(p-3),S_1,...,S_(q-3)),
    T_(r;p,q)=sum_(i=1)^5 Q_i tensor f_i
               +sum_s R_s tensor f_(5+s)
               +sum_t S_t tensor f_(p+2+t).

Let X_r(a,b,c) be the affine border-rank-at-most-r tensor variety.

## B. Complete rank-one intersections and actual decompositions

The scheme P(L_0) intersect Seg(PA_0 x PB_0) consists exactly of the six
reduced points [Q_i]. For every r,p,q as above, P(L_r) intersect
Seg(P^(p-1) x P^(q-1)) consists exactly of the r+1 reduced points [Q_i],
[R_s], [S_t]. These assertions remain true after padding A_0,B_0 or
C^p,C^q into larger factors.

The independent r-subsets of these r+1 points are exactly the six subsets
omitting one Q-point. Every padded T_(r;p,q), in any format a>=p,b>=q,c>=r,
has exactly six actual unordered decompositions into r nonzero pure
summands. All six addition differentials on the smooth pure-summand
configuration space are injective. The rank and border rank are r.

## C. Entire normalization fibers in admissible formats

For every a,b>=3 with a+b>=7 and c>=5, pad T_5 to format a x b x c.
There is a Zariski open neighborhood of T_5 in X_5(a,b,c) whose entire
normalization is smooth, and the normalization map there is unramified.
The fiber over T_5 consists of exactly six reduced points, corresponding
bijectively to its six actual decompositions.

For r>=6, take p,q as above and a>=p,b>=q,c>=r satisfying
a,b>=3 and a+b>=r+2. The finite normalization of X_r(a,b,c) has at least
r+1 distinct points over the padded tensor T_(r;p,q). Six distinguished
smooth points correspond bijectively to its six actual r-term
decompositions. At least r-5 further distinct normalization points lie
over the same tensor and are not supplied by actual r-term decompositions.
No exact total cardinality or smoothness assertion for these further
points is included. The claim is invariant under permutation of factors.

In each of these admissible formats the previously established family
theorem says that X_r(a,b,c) fails S2 and that its local ring at the
displayed tensor is not Cohen--Macaulay. The new assertions are about the
normalization fiber; they make no global CM or rational-singularity claim
for the normalization.

## D. Local inverse derivatives

Let f:Y->V be holomorphic, with Y a smooth complex manifold of dimension d
and V a finite-dimensional Hermitian vector space. If df_y is injective,
there is a linear map pi:V->C^d and a neighborhood U of y on which pi f
is biholomorphic. Its inverse composed with pi restricts to an inverse of
f on f(U). After shrinking to a smaller neighborhood of y, that inverse
branch has bounded derivative. Equivalently, with any fixed smooth local
Hermitian metric on Y, the least singular value of df is bounded below
by a positive constant there.

Thus each of the six actual decomposition branches above has this local
stability property, even though their common tensor has a non-CM local
ring in the admissible formats. No probability-tail, moment, or global
single-valued inverse assertion is included.

## E. Elementary normality and conductor facts

A retract of a normal domain is normal: if domains A and B have ring maps
A->B->A with identity composite and B is integrally closed in Frac(B),
then A is integrally closed in Frac(A). In particular, nonnormality of a
reduced affine tensor border-rank variety propagates to larger factor
dimensions via coordinate inclusion and projection. This does not assert
that a general ring retraction transfers Cohen--Macaulayness or S2.

For a finite normalization A subset B of a domain, the finite A-module
B/A has annihilator (A:B), and its support is precisely the locus where
the normalization is not an isomorphism.
