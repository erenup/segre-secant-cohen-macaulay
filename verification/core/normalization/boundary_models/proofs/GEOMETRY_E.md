# Geometry proof of E1 and E2

The witnesses and all quantifiers are fixed in [STATEMENT_E.md](STATEMENT_E.md).
The citations [Normalization], [Reach], and [Base] refer to the prior
inputs listed in [DEPENDENCIES_E.md](DEPENDENCIES_E.md). The new mixed
normality input is proved within this package in
[ALGEBRA_STAR.md](ALGEBRA_STAR.md), using
[DEFORMATION_LEMMA.md](DEFORMATION_LEMMA.md). It is not assumed from the earlier normalization theorem.

## 1. Exact intersections, six decompositions, and the generic span map

Put S=Seg(PA x PB), W=A tensor B. The earlier six-point core computation
[Normalization, Section2] gives dim L0=5, the unique relation sum_i Q_i=0, and

    P(L0) intersect Seg(PA0 x PB0) = {[Q_1],...,[Q_6]}

as a reduced scheme. Every five Q_i are independent. The same exact
calculation in [Normalization, Section4] proves, for every integer z>=4,

    L0 intersect (A0 tensor C v(z))=0,
    L0 intersect (C v(z) tensor B0)=0.                 (1)

For clarity, the row avoidance follows from the determinant
-z(z-1)(z-3)/6 and the remaining third row. For column avoidance,
writing v(z)b^t in L0 gives b_j=jd/(j-z) and (j+z)d=je for j=1,2,3;
the first two equations force d=0 and b=0. The v-directions are pairwise
distinct and avoid the core factor directions.

These facts prove exhaustion for either witness of E. Write E_A,E_B for
the new row and column coordinate spaces. Every matrix in L has zero
E_A tensor E_B block. For a rank-one matrix x tensor y this implies
x_(E_A)=0 or y_(E_B)=0. A nonzero new row forces y_(E_B)=0 and has its
assigned v-direction. Distinct v-directions allow only one nonzero new
row; the first identity of (1) kills the old core block. Thus the matrix
is one of the R-directions. Transposition gives the S-directions when a
new column is nonzero. If neither is nonzero the matrix lies in L0.
Padding creates no additional possibilities: a nonzero rank-one matrix
in A' tensor B' has both factors in those subspaces, as is seen by the
two quotient maps.

The intersections are reduced, including after padding. At a core point,
an added row or column in its rank-one tangent space has that core factor
direction, distinct from the allowed v-direction, so all such coefficients
vanish and the earlier core scalar-only tangent calculation applies.
At an R-point, the zero E_A tensor E_B block kills the varying new-column
component; distinct row directions kill every other new-row coefficient;
(1) kills the old core part. Only the scalar tangent remains. The same
argument transposes at an S-point. Hence the projective intersections
have zero tangent space; their local maximal ideals satisfy m/m^2=0,
so Nakayama proves that these finite points are reduced.

There are exactly r+1 intersection points in each case. The sole relation
among their representatives is the six-core relation, because all added
matrices occupy separate row or column blocks. Precisely six r-subsets
are independent: those omitting a Q-point. The tensor's third flattening
has rank r and image L. An actual r-term decomposition must choose a
basis among these rank-one directions; its third factors are then uniquely
determined. Thus there are exactly six actual unordered decompositions,
and rank and border rank are exactly r.

Their addition differentials are injective modulo the usual summand
scalings. Indeed, use the independent third factors as part of a basis.
Each first-order matrix variation then lies in L as well as in its
rank-one tangent space; the scalar-only intersection just proved forces
that variation to be scalar. The matching third variation cancels it,
which is exactly the summand scaling. This recovers the earlier immersion
assertion rather than introducing a new decomposition count.

Let H be the closure in Gr(r,W) of spans of r independent points of S.
The unordered span map is birational. For a generic list of factors and
every subset J of cardinality j>=2,

    rank(a_i:i in J)+rank(b_i:i in J)
      =min(a,j)+min(b,j)>=j+2.                        (2)

The inequality holds under a,b>=3 and a+b>=r+2, and every format of E
has these properties. A combination supported on J has matrix rank at
least two by Sylvester's inequality. Thus no such combination is zero
or a new rank-one matrix; the generic span has just its r chosen
rank-one directions. Its unordered configuration is unique. In
characteristic zero this proves birationality, as in [Reach, Sections1,3],
and gives

    dim H=r(a+b-2).

## 2. A proper graph containing exactly the required configurations

Take the reduced closure G of the independent unordered span graph in
Hilb^r(S) x H. It is integral, proper over H, and birational by (2).
The closed incidence condition Z contained in P(K) holds throughout G:
the universal evaluation of the annihilator of K in H^0(Z,O_Z(1))
vanishes on the dense independent graph and hence on its reduced closure.
Therefore the fiber over L is a closed subscheme of

    Hilb^r(S intersect P(L)).

Since the intersection is the reduced r+1-point scheme from Section1,
this Hilbert scheme is precisely the discrete reduced scheme of its
r-element subsets. Repeated or infinitesimal points cannot occur. A
fixed pair (Z,L) has at most one underlying graph point. This does not
yet bound the number of points after normalization; local normality is
required for that step.

The six independent subsets lie in G and give smooth graph points.
Every dependent subset lies there too. If R_s=u_s tensor v(s+3) is
omitted, write v(s+3)=sum_i lambda_i row_i(M) and deform

    Q_i(epsilon)=(e_i+epsilon*lambda_i*u_s) tensor row_i(M)
                                                (1<=i<=3),

leaving all other core and retained added matrices fixed. Their core
sum is epsilon R_s. For epsilon!=0 they are independent: a relation
projected to the core forces its six core coefficients to coincide,
the retained added blocks force their coefficients to vanish, and
the omitted row forces the common core coefficient to vanish. Five
deformed core matrices, the retained added matrices, and fixed R_s form
a basis with independent limits. Consequently their spans extend to L.

If S_s=v(s+3) tensor w_s is omitted, choose eta_j with
v(s+3)=sum_j eta_j*(-column_j(M)), and deform

    Q_(3+j)(epsilon)=(-column_j(M)) tensor
                                     (e_j+epsilon*eta_j*w_s).

The identical column argument gives independence away from zero and
limit span L. These are the exact arcs in [Normalization, Section4]. Thus G has
exactly r+1 reduced fiber points. For E2, r=9 and this means ten.

All those configurations consist of distinct points. Locally ordering
them is a free finite etale cover. Choosing nonzero factor-vector
representatives is a smooth torus torsor; call that cover F. Normality,
regularity, and tangent excess can be checked on this cover. Near each
such configuration the graph in the Hilbert scheme agrees with the
ordinary graph of the rational span map on the smooth configuration
space, so the following embedded-ideal calculation applies to G.

## 3. The exact maximal-minor ideal and its Schur reduction

At a dependent subset the r representative columns have rank r-1.
Fix an invertible (r-1)-column coordinate minor. Let I be the ideal of
all r-by-r minors on F. Row elimination expresses I exactly as the
residual coordinates of the remaining column modulo those r-1 columns.

Introduce r-1 auxiliary relation coefficients and normalize the remaining
core coefficient to one. The five other core coefficients are units;
all retained-added-point coefficients vanish at the witness. The pivot
minor solves the auxiliary coefficients uniquely. If w_i denote the
differences from those solved values, the vector-relation ideal is

    J=(w_1,...,w_(r-1),I).                            (3)

Absorb the five unit core coefficients into their first factors, an
invertible coordinate change. Write the vector relation as

    A_c B_c^t+U Delta V^t=0,                          (4)

where U,V collect the retained added-point factors and Delta is diagonal
in their coefficients. No vanishing coefficient is inverted. Split the
old three-dimensional supports and the two triples of core columns:

    A_c=[A11 A12; A21 A22],   B_c=[B1 B2], B2=[B20;B21],
    U=[U0;U1],               V=[V0;V1].

A11 and B20 are invertible. Make the regular invertible substitutions

    X=A11^-1 A12,   Y=A21 A11^-1,
    P=A22-A21 X,    C0=B1+B2 X^t,
    U'=U1-YU0,      V'=V1-B21 B20^-1 V0.              (5)

The top three A rows of (4) solve

    C0^t=-A11^-1 U0 Delta V^t.

Subtracting Y times those rows leaves P B2^t+U'Delta V^t; its first
three B columns solve

    P=-U'Delta V0^t(B20^t)^-1.

The remaining entries are exactly

    U'Delta(V')^t.                                   (6)

These are invertible operations on ideals, not only operations on their
zero sets. The solved blocks give d0=3b+3(a-3)=3a+3b-9 independent
coordinate generators L_1,...,L_d0. Section4 will put (6) into quadratics
Q in independent coordinates vanishing at the witness. Thus

    J=(L_1,...,L_d0,Q).

The auxiliary cancellation must retain that embedded ideal. Each w_i
of (3) lies in J. Because dQ=0 at the witness, dw_i is a linear
combination of the dL_j. The r-1 differentials dw_i are independent,
so one coefficient minor is a unit. Expressing w in the displayed
generators, replace those r-1 L's by w, leaving the nonlinear and unused
coordinates unchanged. This preserves the exact ideal generated with
the other L's and Q, and has invertible Jacobian. It is an etale
coordinate change. Restricting to w=0, which is the original F, yields

    I=(l_1,...,l_kappa,Q),
    kappa=d0-(r-1)=3a+3b-r-8.                        (7)

The nonlinear variables remain independent coordinates. No radical,
initial ideal, or higher-order truncation was used. In E2 the count is
kappa=3a+3b-17. It is unrelated to the smooth-parameter count in any
separate rank-five local-ring theorem.

## 4. Residual ideals in every case of E

### 4.1 E1, omit its single row

All k=r-6 retained points are columns. The k columns of V' are
independent new B directions, while U'=0 at the witness. A fixed
k-by-k minor stays invertible, so V' has a regular left inverse.
Consequently the ideal of (6) is exactly the ideal of U'Delta. Writing
q_j for its coefficients and y_ij for the entries of U' gives

    Q=(q_j*y_ij : 1<=j<=r-6, 1<=i<=a-3).             (8)

The y_ij and q_j are independent vanishing coordinates; the retained
V'-matrix data are smooth parameters. This is an exact monomial ideal.

### 4.2 One retained row and k retained columns

At the witness U'_R is nonzero and V'_R=0 for the retained row, whereas
U'_(S_j)=0 and the k columns V'_(S_j) are independent. Regular invertible
row operations in A/A0 send U'_R to e_1. Independently, regular invertible
row operations in B/B0 send all V'_(S_j) to e_j. The needed coordinate
or minor is a unit; its original data remain smooth parameters. These
operations act invertibly on the opposite vanishing columns.

With p the row coefficient and q_j the column coefficients, write

    alpha=a-4,     beta=b-3-k,
    U'_R=e_1,     U'_(S_j)=(x_j,v_1j,...,v_alphaj),
    V'_(S_j)=e_j, V'_R=(z_1,...,z_k,u_1,...,u_beta).

Then the complete list of nonzero entries of (6) is

    p*z_j+q_j*x_j          (1<=j<=k),
    p*u_h                 (1<=h<=beta),
    q_j*v_ij              (1<=i<=alpha,1<=j<=k).      (9)

All other matrix entries are identically zero. In particular, no term
q_j*x_l with l!=j occurs and no higher-order remainder has been omitted.
These free coordinates are precisely the variables of B_(k,alpha,beta).

For E1 with a column omitted, k=r-7, alpha=a-4>=0, and
beta=b-r+4>=1. The case k=0 is included: only the p*u_h remain.
For E2 with a row omitted, k=2, alpha=a-4>=1, and beta=b-5>=0.
If beta=0, admissibility forces alpha>=2. For E2 with a column omitted,
transpose: k=2, alpha=b-4>=1, beta=a-5>=0. These are all four dependent
configurations of E2 and all dependent configurations of E1.

## 5. The selected saturated graph chart is the homogeneous origin

The rational span map in Plucker coordinates is represented by the
maximal minors; its graph is the blowup of I, the Proj of its Rees
algebra. Flat base change commutes with all ideal powers, so this graph
description commutes with the etale coordinate changes in Section3
and with the factor-vector cover.

Use the explicit arc of Section2 for whichever added point is omitted.
Choose the pivot from five independent old-core coordinate entries and
one nonzero coordinate entry detecting each retained added point.
For retained rows use their own new row and an old B coordinate; for
retained columns use their own new column and an old A coordinate.
Crucially, none of these entries uses the omitted new row or column.
On this arc the normalized pivot relation remains the six-core relation
with every retained coefficient identically zero. This follows first
from the unchanged old-core entries and then from the separate retained
added entries, none of which sees the deformation.

Thus all residual generators (8) or (9) vanish along the entire arc,
even when the Schur-substituted opposite factor vectors vary to first
order. The relation residual has nonzero derivative equal to the
omitted matrix modulo the retained span. Since the residual quadratics
have zero differential, this derivative is nonzero in the linear
directions of (7). Choose t=l_1 nonzero on it and replace the other l_i
by linear combinations whose derivative on that arc is zero.

The t-chart of the graph is the actual subalgebra

    O_F[l_2/t,...,l_kappa/t,Q/t] inside O_F[t^-1].     (10)

Set l_i=t*h_i. The h_i are independent smooth coordinates, centered
at zero at the chosen limit. Together with the other unused coordinates,
they split off smooth factors. The remaining chart is R_(r-6,a-3) for
(8), or exactly B_(k,alpha,beta) for (9), as defined in STATEMENT_E.
All base variables of these models vanish at the witness. Every
nonlinear numerator is identically zero on the arc, so all of its
ratios by t have limit zero too. The target is therefore the homogeneous
origin, not a different exceptional point.

This argument handles opposite omitted and retained types as well as
the same type. In particular it proves the origin assertion for E1's
omitted row with only columns retained, and for both omitted types in E2.
The algebra in (10) is fully t-saturated. Equations saying only t times
each introduced fraction equals its numerator need not present that
algebra and are not substituted for it anywhere in the proof.

## 6. Normality and the exact tangent excesses

First consider the monomial algebra R_(s,m). An exponent vector has
t-exponent K and other exponents A_j,B_ij. Its monoid consists exactly
of the integer vectors satisfying

    A_j>=0, B_ij>=0,
    K+sum_j min(A_j,sum_i B_ij)>=0.                   (11)

Each negative-t generator uses one mu_j and one y_ij, so these are
necessary. Conversely, if K<0, allocate -K integer units among groups
j of capacities min(A_j,sum_i B_ij), and within each group among the
integer capacities B_ij. The resulting mu_j*y_ij/t factors use exactly
-K denominator units. All remaining exponents are supplied by base
variables. If K>=0 use base variables alone. This proves (11).

The last inequality is equivalent to the finite family of linear
inequalities obtained by choosing, for each j, either A_j or sum_i B_ij.
Thus this monoid is its rational cone intersected with the full exponent
lattice. Its algebra is normal: equivalently it is the intersection of
the Laurent polynomial ring with the monomial valuation rings belonging
to these cone inequalities, an intersection of integrally closed domains.
This proof includes empty index sets and uses exact integer allocation,
not finite numerical tests.

There are 1+s+s*m independent base variables and s*m fraction generators
in R. All have degree one for the total base-variable grading, and no
linear relation exists between them: multiply a proposed relation by t
and compare its distinct monomials. The homogeneous origin therefore
has dimension 1+s+s*m, embedding dimension 1+s+2s*m, and excess s*m.

The companion theorem in ALGEBRA_STAR proves normality of B_(k,alpha,beta)
for every nonnegative k,alpha,beta, with exactly the independent variables
and saturated subalgebra of (9)--(10). Its finite SAGBI proof uses total
q-degree; the resulting monomial algebra has an integral-flow saturation
proof, and DEFORMATION_LEMMA supplies the normality transfer. No additional
equations among the base variables are imposed in the geometric chart,
by Sections3--4, so that theorem applies directly, including beta=0 and
k=0.

There are

    n=2+k*(alpha+3)+beta

base variables in B, so dim B=n: the algebra contains their polynomial
ring and lies in its fraction field. There are

    g=k+beta+alpha*k=k*(alpha+1)+beta

displayed fraction generators. The total base-variable grading gives
degree one to these as well. To check linear independence, multiply a
linear relation by t. Terms containing t come only from base generators;
each p*u_h and q_j*v_ij occurs in its unique fraction numerator; and
each p*z_j occurs only in its own paired numerator. All coefficients
vanish. Since this is a standard graded algebra, its degree-one
generators are a basis of the cotangent space at the origin. Thus

    embdim B=n+g,    excess(B)=k*(alpha+1)+beta.       (12)

No assertion about a naive unsaturated presentation is used to obtain
this count. Applying (11)--(12) gives exactly:

    E1, omit row:      (r-6)(a-3);
    E1, omit column:   (r-7)(a-3)+b-r+4;
    E2, omit row:      2a+b-11;
    E2, omit column:   a+2b-11.

The first is positive since r>=7 and a>=4; the second is positive since
b-r+4>=1. In E2 the last two numbers are at least five because a,b>=5
and a+b>=11. Thus all these normal graph points are singular. Smooth
and etale covers preserve normality and tangent excess, so these are
also the invariants of the original graph germs.

## 7. Identification with the entire normalization and unramifiedness

Every point of G above L is now normal: six are smooth and each boundary
point has the normal model of Sections5--6. Properness and the finite
fiber imply, after shrinking H about L, that G->H is finite. More
explicitly, remove the proper image of its closed non-quasi-finite
locus. The nonnormal locus is closed for a variety over C and misses
the whole fiber. Remove its proper image as well. The resulting finite
normal birational source is exactly the normalization of that neighborhood
of H in its function field. Hence no extra normalization point remains
above any dependent configuration, and the exact fiber counts are r+1
for E1 and ten for E2.

The morphism is unramified on a neighborhood of the whole fiber. One
way to see this is the finite point-incidence model of [Normalization]: its fiber
is the reduced Segre intersection, so it is finite unramified nearby;
its distinct-tuple scheme is finite unramified, and the ordered graph
is a closed subscheme thereof. Descent through the free ordering cover
gives the claim. Equivalently, Section2 has already identified the graph
fiber scheme as reduced and zero-dimensional. Its relative tangent
spaces are zero; Nakayama applied to relative differentials proves
unramifiedness at every point of the fiber. The unramified locus is open,
and properness allows its complement's image to be removed. This also
proves that the normalization fibers under discussion are reduced schemes.

Finally the mode-C flattening-rank-r locus in X_r(a,b,c) is the bundle
of surjective maps C*->K over K in H, by [Normalization, Section1]. Pulling this
smooth bundle back to the normalization of H gives a normal finite
birational source, hence the full normalization of that tensor locus.
This base change preserves the fiber points and unramifiedness and
adds only smooth parameters to each germ. Its dimension is

    dim H+r*c=r(a+b+c-2)=D.

Consequently every boundary embedding dimension is D plus its excess
from Section6, and the six actual-decomposition points have embedding
dimension D. This proves all the statements of E1 and E2. Factor
permutations transport the variety, normalization and witness, so all
claims transport with them.

The argument describes only neighborhoods of the specified fibers and
the exact mixed splits in STATEMENT_E. It gives no global regularity,
depth, Cohen--Macaulayness, or rational-singularity claim for a normalization.
