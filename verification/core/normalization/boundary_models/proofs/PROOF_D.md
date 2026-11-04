# Proof of theorem D: normal boundary charts for one-sided extensions

Witness notation
and hypotheses are those of [STATEMENT_D.md](STATEMENT_D.md). All schemes in
image and graph closures are given their reduced structure over C.

The prior citations [Normalization], [Reach], and [Base] are specified,
including hashes and section numbers, in [DEPENDENCIES_D.md](DEPENDENCIES_D.md).
The proof restates the relevant exhaustion and birationality arguments;
none of the new boundary-chart conclusions is an assumed prior result.

## 1. The finite configurations and the span variety

Let S=Seg(PA x PB) in P(W), where W=A tensor B. The core matrices have
unique relation sum_i Q_i=0, any five are independent, and

    P(L0) intersect Seg(PA0 x PB0) = {[Q_1],...,[Q_6]}

as a reduced scheme. These are the exact core assertions in [Normalization, Section2],
proved there by the displayed polynomial elimination identity and the six
nonzero tangent determinants. For each integer z>=4, the same earlier
calculation gives

    L0 intersect (A0 tensor C v(z)) = 0.                  (1)

Its proof uses det[1,v(z),v(z)/(1,2,3)]=-z(z-1)(z-3)/6 and the remaining
row; see [Normalization, Section4] and [Reach, Section4]. The v(z) directions are
pairwise distinct and avoid the six core B-factor directions.

It follows that P(L_r) meets S in exactly the six Q-points and r-5 R-points.
Indeed, a rank-one matrix in L_r with a nonzero new A-row has that row's
v-direction. Distinct v-directions force all other new rows to vanish,
and (1) forces its core block to vanish. It is that R-point. Without a
new row the matrix lies in L0. Padding creates no further rank-one points:
a rank-one tensor in a tensor product of subspaces has each factor in
those subspaces, by applying the two quotient maps.

The intersection is reduced. At a Q-point, each added row of a tangent
matrix has the core B-factor direction, whereas its possible L_r component
has a distinct v-direction; all added coefficients vanish, and the earlier
core scalar-only tangent intersection applies. At R_s, the other new rows
vanish by the distinct v-directions; the core part vanishes by (1). Thus
L_r meets the affine rank-one tangent space at every listed point in its
scalar line. Padding adds separate complementary blocks and changes none
of these intersections. Zero projective tangent spaces imply reducedness
by Nakayama, exactly as in [Normalization, Sections2,4].

The only relation among these r+1 matrices is the six-core relation. Thus
six r-subsets, omitting a Q-point, are bases of L_r; the r-5 other subsets,
omitting R_s, have span dimension r-1. The third flattening of T_row has
rank r. Every actual r-term decomposition must therefore choose a basis
of rank-one directions in L_r, and its third factors are uniquely determined
by that basis. There are exactly six actual decompositions, and rank and
border rank equal r. Scalar-only matrix tangencies and the independent
third-factor basis give injective addition differentials at all six;
see the coefficient comparison in [Reach, Section4].

Let H be the closure in Gr(r,W) of spans of r independent points of S.
The unordered span map is birational onto H. Here is the criterion used
in [Reach, Sections1,3]. Generic factor lists satisfy, for every subset
J of size j>=2,

    rank(a_i:i in J)+rank(b_i:i in J)>=j+2,              (2)

because min(a,j)+min(b,j)>=j+2 under a,b>=3 and a+b>=r+2.
For a nonzero linear combination supported on j>=2 terms, Sylvester's
rank inequality makes its matrix rank at least two. Hence the matrix
factors are independent and their span contains only their own r rank-one
directions. The generic unordered configuration is unique. In characteristic
zero generic degree one is birationality. In particular

    dim H=r(a+b-2).                                     (3)

## 2. A proper graph model and why all boundary configurations count

Let C_r be the smooth configuration space of unordered independent
r-tuples of distinct points of S, viewed inside Hilb^r(S). Let W_r be the
reduced closure of its span graph in Hilb^r(S) x H. It is irreducible,
proper over H, and birational by (2). The closed condition that a length-r
subscheme Z be contained in P(K) holds throughout this graph closure.
Scheme-theoretically, it is the vanishing of the universal evaluation map
from the annihilator of the tautological K to the rank-r bundle of sections
of O_Z(1). It vanishes on the dense independent graph, hence on its reduced
closure. The fiber is therefore a closed subscheme of Hilb^r(S intersect
P(L_r)), which here is the discrete reduced scheme of r-element subsets.

Consequently, over L_r every possible Z is a length-r subscheme of the
reduced r+1-point scheme P(L_r) intersect S. It is exactly an r-element
subset. Repeated or infinitesimal points cannot occur. The graph is a
closed subscheme of Hilb^r(S) x H, so a fixed pair (Z,L_r) has at most one
underlying graph point. This does not yet prove that its normalization
has one point there; local normality is the obligation addressed below.

The six independent subsets give smooth graph points. Every dependent
subset is present too. If R_s is omitted, write v(s+3)=sum_(i=1)^3 lambda_i
row_i(M), and replace the first three core matrices by

    Q_i(epsilon)=(e_i+epsilon*lambda_i*u_s) tensor row_i(M).

Keep Q_4,Q_5,Q_6 and all retained R_j fixed. Their sum over the six core
indices is epsilon R_s. For epsilon!=0 the r matrices are independent:
projection to the core forces their six coefficients in any relation to
coincide, retained new rows kill their own coefficients, and the omitted
new row forces the common coefficient to vanish. Their spans tend to L_r:
five deformed core matrices, all retained added rows, and R_s form a basis
with independent limits. This is the explicit arc from [Normalization, Section4].
Hence the proper graph has exactly r+1 underlying points over L_r.

Work locally at a dependent configuration, ordering its distinct points.
Ordering is a free finite etale cover, so it introduces no local quotient
singularity. Choose nonzero factor-vector representatives; this is a
locally trivial torus torsor over the projective configuration. We denote
this smooth factor-vector space by F. Normality, regularity, and tangent
excess can be checked on this smooth cover.

## 3. The exact dependence ideal and auxiliary coefficients

The dependent configuration contains all six core points and ell=r-6
retained added rows. Its r columns have rank r-1. Fix an invertible
(r-1)-column coordinate minor. Row elimination identifies the ideal I of
all r x r minors with the residual coordinates of the final column modulo
the span of the first r-1. This is an equality of ideals, not of radicals.

Introduce the r-1 relation coefficients, with the coefficient of one core
column normalized to one. The other five core coefficients are units;
the ell retained-row coefficients mu_i vanish at the configuration.
On F x A^(r-1), let J be the ideal of the vector relation. The pivot minor
solves the auxiliary coefficients uniquely as regular functions of F.
Writing w_j for their differences from these solved values gives

    J=(w_1,...,w_(r-1), I).                               (4)

Absorb the five unit core coefficients into their A-factor vectors.
This is an invertible change of variables. With core factor matrices
A_c of size a x 6 and B_c of size b x 6, and retained-factor matrices U,V,
the relation is

    A_c B_c^t + U Delta V^t=0,
    Delta=diag(mu_1,...,mu_ell).                           (5)

No division by any mu_i is made.

## 4. Schur coordinates, with scheme structure retained

Split the core columns into two triples, and rows by the old 3-dimensional
supports:

    A_c=[A11 A12; A21 A22],    B_c=[B1 B2],
    B2=[B20;B21],             U=[U0;U1], V=[V0;V1].

The blocks A11 and B20 are invertible at the circuit and on the chosen
neighborhood. Set

    X=A11^-1 A12,       Y=A21 A11^-1,
    P=A22-A21 X,        C0=B1+B2 X^t,
    U'=U1-Y U0,         V'=V1-B21 B20^-1 V0.              (6)

These are regular invertible coordinate substitutions: they solve uniquely
for A22,B1,U1,V1, with all other coordinates retained.

The top three A rows of (5) solve

    C0^t=-A11^-1 U0 Delta V^t.

Subtracting Y times those rows leaves P B2^t+U'Delta V^t. Its first three
B columns solve

    P=-U'Delta V0^t(B20^t)^-1.

The remaining equations are exactly

    U'Delta(V')^t=0.                                    (7)

These substitutions can be made as exact row operations on ideals. The
ell columns of U' at the witness are the independent retained new-row
coordinate vectors. A fixed ell x ell row minor stays invertible.
Multiplication by its regular left inverse shows that the ideal of (7)
is exactly the ideal of Delta(V')^t. The reverse ideal containment follows
by multiplication by U'. If ell=0 this residual ideal is zero.

Put m=b-3 and let z_ij be the j-th coordinate of the i-th column of V'.
The two solved blocks above give

    d0=3b+3(a-3)=3a+3b-9

independent coordinate equations L_1,...,L_d0. The residual ideal is
(mu_i z_ij). Thus

    J=(L_1,...,L_d0, mu_i z_ij).                         (8)

The L's, mu's, z's, and unused free parameters are an etale coordinate
system; in fact the displayed block eliminations are regular coordinates
on the localized factor-vector chart. This is an exact local ideal model,
not an approximation by its tangent cone.

We now remove the auxiliary relation variables without changing that
embedded monomial model. Each w_j in (4) is in J. At the witness all mu
and z vanish, so dJ is spanned by dL_1,...,dL_d0. The r-1 differentials
dw_j are independent: the w_j are graph coordinates for independent
auxiliary coefficients. They therefore have an invertible coefficient
minor on r-1 of the L directions. Expressing each w_j in (8), replacing
those L's by the w's, and inverting that coefficient minor preserves the
exact ideal generated together with the remaining L's and mu_i z_ij.
The replacement also has invertible Jacobian while retaining mu,z and
the unused parameters. Restrict to w=0, which is the original F chart.
The result is the exact etale-local embedded ideal

    I=(x_1,...,x_kappa, mu_i z_ij),
    kappa=d0-(r-1)=3a+3b-r-8.                            (9)

Here kappa counts the independent linear-coordinate generators of the
dependence ideal. It has no relation to the symbol h for common smooth
parameters in the separate rank-five local-ring result. In particular
mu,z are still independent local coordinates after restricting to w=0.

## 5. The selected saturated blowup chart

The rational span map is represented in Plucker coordinates by the maximal
minors. Its graph closure is Proj of the Rees algebra of I, that is, the
blowup of I. This can be checked as the closure of the graph of the rational
projective map defined by its generators. Blowups commute with the etale
coordinate base change above because flat base change commutes with ideal
powers. Rescaling representatives and passing through the torus cover
therefore do not change this local graph calculation.

The arc in Section2 has nonzero residual first derivative R_s modulo the
(r-1)-dimensional retained span. Choose a linear combination of the x's,
called t=x_1, nonzero on this direction, and the other x's to vanish on it.
The monomial coordinates mu_i z_ij have zero first derivative. Moreover,
along this explicit arc every B factor remains in B0, so V'=0 and all z_ij
vanish identically. Hence all monomial ratios below are zero at its limit.

In the t-chart the blowup is the subalgebra

    O_F[x_2/t,...,x_kappa/t, mu_i z_ij/t] subset O_F[t^-1].

After writing x_j=t*alpha_j, its coordinate model is a smooth polynomial
factor times

    R_(ell,m)=C[t,mu_i,z_ij,mu_i z_ij/t].                 (10)

This subalgebra definition keeps the full t-saturation. It must not be
replaced by just the equations t*w_ij=mu_i z_ij: for ell=1 the additional
2 x 2 minors of [[t,z_1j],[mu_1,w_1j]] are necessary. At the graph point
over (Z,L_r), t,mu,z and every monomial ratio vanish. The alpha_j can be
centered at zero by the chosen normal direction. Thus the point corresponds
to the homogeneous origin of (10), up to the retained smooth parameters.

This proves the smooth-equivalence assertion in D. It also proves existence
of the selected chart point independently of an unproved presentation by
equations; the Section2 arc places it in the actual graph closure.

## 6. Normality of the monomial subalgebra

Represent monomial exponents by (k;u_i;v_ij), with k the t exponent. The
semigroup of (10) consists exactly of integer vectors satisfying

    u_i>=0, v_ij>=0,
    k+sum_i min(u_i,sum_j v_ij)>=0.                       (11)

For necessity, if p_ij copies of mu_i z_ij/t occur, then sum_j p_ij<=u_i
and p_ij<=v_ij. Their total is at most the sum of these minima, and k is
at least minus that total.

For sufficiency, if k>=0 only nonnegative t,mu,z generators are needed.
If k<0, put N=-k. Condition (11) allows integers N_i with

    0<=N_i<=min(u_i,sum_j v_ij),    sum_i N_i=N.

Choose them successively up to the available capacities. Then distribute
N_i among j with p_ij<=v_ij, again successively. This gives integer p_ij
of total N, and the remaining mu,z exponents are nonnegative. The resulting
monomial has t exponent k exactly. Thus (11) is proved in both directions.

The inequalities are polyhedral: besides u_i,v_ij>=0 they are equivalent,
for every subset E of {1,...,ell}, to

    k+sum_(i in E) u_i+sum_(i not in E,j) v_ij>=0.         (12)

The generator lattice is the full integer lattice, since t,mu,z themselves
are generators. Equations (11)--(12) therefore identify the semigroup with
its rational cone intersected with the integer lattice.

Here is a direct normality proof. Inside the common rational-function field,
intersect the Laurent polynomial ring in t,mu,z with the valuation rings
of the finitely many monomial-weight valuations in (12) and u_i,v_ij>=0.
On a Laurent polynomial a weight valuation is its minimum exponent weight;
it is multiplicative since the lowest homogeneous parts multiply nontrivially
in a Laurent polynomial domain. The intersection consists exactly of Laurent
polynomials all of whose exponents satisfy (11), hence equals (10). Each
valuation ring and the Laurent polynomial ring is integrally closed.
Their intersection is therefore integrally closed. This proves normality
for all ell,m, including zero values, without a sampled calculation.

The total-degree functional k+sum_i u_i+sum_ij v_ij assigns degree one to
each of the distinct monomial generators of (10). The homogeneous origin
therefore has cotangent dimension 1+ell+2ell*m. The ring's dimension is
the exponent-lattice rank 1+ell+ell*m. Its tangent excess is ell*m.
For ell*m=0 it is a polynomial ring; otherwise its origin is singular.
These properties are invariant under the smooth and etale covers used
above and under the subsequent tensor-bundle factors.

## 7. Identifying the graph with the complete normalization locally

All r+1 graph points over L_r have now been accounted for. At six points
the graph is a smooth independent-configuration chart. At every dependent
point Section5 gives an etale/smooth chart of the normal ring (10).
Normality descends through the factor-vector torus torsor and the free
ordered-configuration etale quotient. Thus the graph is normal at every
point of this finite fiber. Its normal locus is open, since it is a variety
over C. Properness permits removing the closed image of its nonnormal
locus, as well as the image of its non-quasi-finite locus. After shrinking
H about L_r the graph is finite and normal. It is integral and birational
by Section1. A finite birational normal integral algebra is the integral
closure in the common function field, so this graph is the ENTIRE
normalization of that neighborhood, not an intermediate cover. In particular
there is exactly one normalization point at every one of the r+1 subsets.

The fiber is reduced and the normalization map is unramified on a neighborhood.
To verify this additional scheme assertion, the projective point-incidence
Z_H={(K,p):p in P(K) intersect S} has finite reduced fiber at L_r. Properness
first makes it finite near that fiber. Fiber cotangent spaces vanish;
base change for relative differentials and Nakayama show that it is
unramified there. Remove the closed image of the remaining non-unramified
locus. In its r-fold fiber product the distinct-point locus is both open
and closed, because diagonals of a separated unramified morphism are both
open and closed. Hence that locus is finite and unramified over H.

The graph, after ordering its distinct points, is a closed subscheme of
this finite incidence near the fiber; the proper image of the Hilbert
nonreduced-point locus can be removed because it misses the fiber. Closed
immersions are unramified. Thus the graph morphism is unramified, and this
descends through the free etale permutation quotient. Over C a finite
unramified fiber is reduced. If ell*m=0, every graph point above L_r is
also smooth; the same proper closed-image argument gives a neighborhood
whose entire normalization source is smooth.

## 8. Tensor bundle and dimensions

On the locus where the C flattening has rank r, X_r(a,b,c) is the bundle
of surjections C* onto K over H. For a span of r independent rank-one
matrices every such surjection is an r-term tensor sum. Conversely a
rank-r-flattening r-term sum supplies such a span. Taking reduced closures
gives equality on this open rank stratum: a local trivialization makes the
bundle a product, and its smooth open projection commutes with taking
closure. This is also the full argument in [Normalization, Section1, tensor version].

Pulling back the finite normalization of H along this bundle gives a finite
birational map from a normal variety: an open vector bundle over a normal
variety is normal. It is therefore the full normalization of the tensor
neighborhood. Unramifiedness is stable under base change, and the fiber over
T_row is identified with the fiber over L_r. The bundle contributes rc
smooth dimensions. Equation (3) gives dimension r(a+b+c-2) at each point.
Section6's tangent excess ell*m gives the claimed embedding dimension.
The six actual-decomposition points stay smooth; all boundary points have
the normality and smoothness/singularity stated in D.

Swapping the first two factors gives the one-sided column version, and
transporting the whole construction gives the other factor permutations.
The proof used independence of the retained added A directions to turn (7)
into monomials. It provides no corresponding assertion for simultaneous
added-row and added-column witnesses. This proves theorem D. QED.
