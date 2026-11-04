# Smooth normalization fibers and boundary configurations

All varieties have reduced structure over C. A normalization means the
finite normalization of an integral variety in its own function field.

## 1. A criterion for the entire normalization fiber

Let S be a smooth irreducible projective subvariety of P(W), let r be a
positive integer, and suppose the open set U of ordered r-tuples of
linearly independent points of S is nonempty. Let H be the reduced
closure of their spans in Gr(r,W). Suppose that the span morphism

    U/S_r -> H

is birational. Suppose L in H has scheme-theoretic intersection

    P(L) intersect S = {p_1,...,p_m}

consisting of m>=r distinct reduced points, and suppose every r-element
subset of these points is linearly independent.

**Normalization criterion.** There is a Zariski open neighborhood N of L
whose normalization is smooth. The normalization fiber over L consists
of exactly binomial(m,r) reduced points, naturally indexed by the
r-element subsets of the displayed intersection. The normalization
morphism is unramified on N.

**Proof.** Consider the closed incidence Z in H x S defined by p in P(K).
Its projection to H is projective, since S is projective. Its fiber at L
is finite, so upper semicontinuity of fiber dimension and the theorem
that proper quasi-finite morphisms are finite allow us to shrink H around
L until Z->H is finite.

Every point of the fiber is C-rational and reduced. Its fiber cotangent
space is zero. Base change for relative differentials, followed by
Nakayama's lemma, shows that the relative differentials vanish at these
points. The finite-type unramified criterion therefore makes Z->H
unramified at all points over L. The complement of the unramified locus
is closed; its image is closed because the morphism is finite. Removing
that image gives an open neighborhood N on which Z_N->N is finite and
unramified. No flatness assertion is used here.

The diagonal of a separated unramified morphism is both open and closed.
In the r-fold fiber product Z_N x_N ... x_N Z_N, each locus where two
coordinates agree is therefore open and closed. Their union is open and
closed, so its complement D, the ordered distinct-tuples locus, is also
open and closed. In particular, D->N is finite and unramified. Its fiber
over L consists of the m(m-1)...(m-r+1) ordered distinct tuples.

Linear independence is open on D. By hypothesis its closed complement
has no point over L. A finite morphism is closed, so another shrinking
of N makes every tuple in D independent. Taking the span then identifies
D with the open subset s^{-1}(N) of U. These are inverse morphisms, not
only bijections of points: for a family of independent lines contained
in a rank-r subbundle K, their direct sum maps isomorphically to K.
Conversely, taking the span of an independent tuple supplies exactly the
incidence datum defining D. Thus D is smooth and irreducible.

The permutation action on D is free. Its quotient E=D/S_r exists and is
finite over N; this can be constructed on affine opens of N by taking
invariants in the finite algebra. The quotient map D->E is a finite
etale S_r-torsor. Hence E is smooth, and E is irreducible. The morphism
E->N agrees with the restriction of the unordered span morphism, so it
is birational. A finite birational morphism from a normal integral variety
to an integral variety is its normalization: on affine rings the finite
normal extension has the same fraction field and equals the integral
closure. Consequently E is the normalization of N.

Unramifiedness of E->N follows by descent through the etale surjection
D->E, or directly from the relative-differential sequence for that
surjection. The quotient fiber consists of the unordered r-subsets.
Its scheme structure is reduced since E->N is unramified and the residue
field is C. The asserted number and smoothness follow. QED.

### Tensor version

Let C be a vector space of dimension c>=r. Form the reduced closure X
of sums of r tensors P_i tensor c_i, where [P_i] lies in S. On the open
locus where the flattening C*->W has rank r, X is the bundle of
surjections C*->K over H. Indeed, sums with independent P_i and c_i are
dense in this locus, and all surjections onto a span of r independent
points of S are such sums. The same equality holds after taking closures,
because the bundle projection is smooth and open.

For a tensor T with image L satisfying the criterion, restrict this
bundle to N and pull it back to the smooth normalization E. The pullback
is an open subset of a vector bundle over E, hence smooth and integral.
Its map to X over N is finite and birational. It is therefore the entire
normalization of that open subset of X. Its fiber over T consists of
exactly binomial(m,r) reduced points, all smooth. Its normalization map
is unramified, by base change. In particular, there is an open
neighborhood of T whose normalization is smooth.

More generally, without the smoothness conclusion, the normalization of
any such rank-r bundle is its pullback to H's normalization: a vector
bundle over a normal variety is normal, as are its open subsets; the
map is finite and birational. This observation will also be used below.

## 2. The complete rank-one intersection of the core span

Let

    M = [[1,1,1],[1,2,3],[1,4,9]].

Write e_i for coordinate vectors, r_i for the rows of M and m_j for its
columns. Define Q_i=e_i tensor r_i for 1<=i<=3 and
Q_(3+j)=-m_j tensor e_j for 1<=j<=3. Their unique relation, up to scalar,
is sum_i Q_i=0. Their span L_0 has dimension five; any five form a basis.
Equivalently its matrices are

    N_ij = M_ij (x_i-y_j).

**Core intersection.** The scheme P(L_0) intersect Seg(P^2 x P^2)
consists of exactly the six reduced points [Q_1],...,[Q_6].

**Proof of exhaustion.** Let N=a b^t be a nonzero rank-one matrix in L_0.
If some a_i=0, the corresponding zero row forces y_1=y_2=y_3=x_i.
Every nonzero row is then a scalar multiple of the corresponding row of
M. Two such rows cannot be proportional, because M has independent rows.
A rank-one matrix has proportional nonzero rows, so exactly one row is
nonzero and N has direction Q_i for that row. If some b_j=0, the transposed
argument using the independent columns of M gives a column direction
Q_(3+j). This deals with every point having any zero factor coordinate.

Suppose instead that all coordinates of a and b are nonzero. In their
projective classes write a=(1,u,v) and b=(1,s,t), with u,v,s,t nonzero.
Membership in L_0 is equivalent to the four additive rectangle relations
for N_ij/M_ij. They give

    E1 = (u-2)s - 2(u-1) = 0,
    E2 = (u-3)t - 3(u-1) = 0,
    E3 = (v-4)s - 4(v-1) = 0,
    E4 = (v-9)t - 9(v-1) = 0.

There is the following exact polynomial identity in Z[u,v,s,t]:

    3(u-4)((u-2)E3-(v-4)E1)
      -(u-3)((u-3)E4-(v-9)E2) = 6u(u-1).

Thus u=1, since u is nonzero. But E1 then gives s=0, a contradiction.
There are no further rank-one directions.

**Reducedness.** At each Q_i the matrix tangent intersection is
L_0 intersect T_(Q_i)(rank-one cone)=C Q_i. This follows from the six
exact ratio determinants

    row determinants:    -1/18, 1/3, -2;
    column determinants: -1/18, 4/9, -3/2.

For a row point, the two other rows of a tangent matrix must be
proportional to that row. Substituting N_ij=M_ij(x_i-y_j) makes the three
coefficient vectors, with determinant displayed above, independent. It
forces both those rows to vanish. The column argument is its transpose.
The projective intersection consequently has zero Zariski tangent space
at each of its six points. Its local maximal ideal n satisfies n/n^2=0,
so Nakayama gives n=0. Each local ring is C, proving reducedness. QED.

The polynomial identity, the determinant values and det(M)=2 are verified
by the accompanying small exact checker. The exhaustion argument above
is a proof for all complex rank-one matrices, not a search over a sample.

## 3. Six smooth normalization points, and no others, at rank five

Let T_5=sum_(i=1)^5 Q_i tensor f_i in C^3 tensor C^3 tensor C^5.
Pad it by zeros to format a x b x c, where

    a,b>=3, a+b>=7, c>=5.

Then X_5(a,b,c) has a non-Cohen--Macaulay local ring at T_5. Nevertheless:

**Rank-five normalization theorem.** There is an open neighborhood of
T_5 in X_5(a,b,c) whose entire normalization is smooth. Its normalization
fiber over T_5 consists of exactly six reduced points. All six points
correspond to actual five-term decompositions, and all six decomposition
maps are immersive there. These conclusions are preserved by permuting
the tensor factors.

**Proof.** For these formats the unordered span morphism for
S=Seg(P^(a-1) x P^(b-1)) is birational onto its span variety H. Here is the
relevant generic criterion. If for every subset J with |J|>=2 the first
and second factor lists have rank sum at least |J|+2, Sylvester's rank
inequality shows that their span contains only the five specified
rank-one directions. The same inequality after quotienting by one factor
line gives the scalar-only tangent intersections. Such lists form a
nonempty open subset for a,b>=3 and a+b>=7. Consequently the unordered
span is generically unique, and in characteristic zero the span morphism
is birational. This is also the birationality used in the family theorem.

The flattening image of T_5 is the padded L_0. A nonzero rank-one matrix
contained in A_0 tensor B_0 has both factors in A_0 and B_0: apply the
quotient map by either support and use that the other factor is nonzero.
Thus padding creates no rank-one intersection points. The tangent
intersection in the larger format also reduces to the original one,
since varying either factor in its complementary space occupies a
different tensor block. The intersection remains exactly six reduced
points, every five of which are independent.

Apply the normalization criterion and its tensor version with r=5 and
m=6. The six subsets each give a basis of L_0. Expressing T_5 in any such
basis determines unique third factors, which form a basis of its
third-factor support because the flattening has rank five. Hence each
subset gives one unordered five-term decomposition, and there are no
others. Scalar-only matrix tangencies give injectivity of addition by
comparing coefficients in the independent third-factor basis. Padding
adds independent complementary derivative blocks. The six normalization
points therefore have the asserted decomposition interpretation. QED.

This theorem is local near the displayed tensor. It does not assert that
the normalization of the entire secant is smooth, Cohen--Macaulay, or has
rational singularities. It does show that at these tensors the non-CM
defect coexists with a smooth entire normalization neighborhood.

## 4. The higher-rank boundary cannot be omitted

Fix r>=5 and p,q>=3 with p+q=r+1. Write A'=A_0 direct-sum E and
B'=B_0 direct-sum F with dim A_0=dim B_0=3, and choose bases u_s of E
and w_t of F. Let v(z)=(1,z,z^2)^t. Put

    R_s = u_s tensor v(s+3),  1<=s<=p-3,
    S_t = v(t+3) tensor w_t,  1<=t<=q-3,
    L_r = L_0 direct-sum span(R_s) direct-sum span(S_t).

The explicit rank-r tensor is

    T_(r;p,q) = sum_(i=1)^5 Q_i tensor f_i
                + sum_s R_s tensor f_(5+s)
                + sum_t S_t tensor f_(p+2+t).

Pad it to an admissible format a x b x c with a>=p, b>=q, c>=r and
a,b>=3, a+b>=r+2. The mode-C flattening still has image L_r and rank r.

**Higher-rank boundary theorem.** In every such format:

1. The rank-one intersection P(L_r) intersect Seg(PA x PB) consists
   of exactly r+1 reduced points: the six Q-points and all R- and S-points.
2. The tensor has exactly six actual unordered r-term decompositions;
   all six are immersive. The six independent r-subsets omit one Q-point.
3. If r>=6, its entire normalization fiber has at least r+1 points.
   Six distinguished smooth points correspond bijectively to the actual
   decompositions. At least r-5 further distinct points are required by
   boundary configurations. No assertion is made here that these further
   points are smooth, or that there are exactly r+1 normalization points.

The further normalization points may also be smooth; that is not decided here.

**Proof of the rank-one intersection.** The avoidance identities are

    L_0 intersect (C v(z) tensor B_0)=0,
    L_0 intersect (A_0 tensor C v(z))=0,   z integer, z>=4.

For the first, write a matrix as v(z)b^t. Its first two rows give
b_j=jd/(j-z), and its third row gives (j+z)d=je for j=1,2,3. Comparing
j=1,2 forces zd=0 and then b=0. For the second, the first two row planes
intersect only in C(1,1,1), because

    det [[1,1,1],[1,z,z^2],[1,z/2,z^2/3]]
       = -z(z-1)(z-3)/6 != 0.

The remaining row vector (1,z/4,z^2/9) is not constant, forcing that
intersection to be zero as well. The v-lines for distinct integers are
distinct and avoid the factor lines of the core matrices.

Let x tensor y be a nonzero rank-one matrix in L_r. Its E tensor F block
is zero, so x_E=0 or y_F=0. If x_E!=0, then y_F=0. The nonzero E-rows
of L_r have the pairwise distinct directions v(s+3). Therefore only one
such row can be nonzero, y has that v-direction, and the core block must
vanish by the second avoidance identity. All F-columns vanish. The matrix
has direction R_s. Transposing proves that y_F!=0 gives an S-direction.
If both complementary parts are zero, the matrix lies in L_0 and is a
Q-direction by the core result. This exhausts the points.

The scalar-only tangencies for Q-points follow by excluding all added
rows and columns using the distinct factor lines. At R_s, the zero
E tensor F block eliminates the varying F component; the distinct row
directions eliminate every other R-row; the second avoidance identity
kills the core block. The intersection is C R_s. The transposed argument
works at S_t, including when both E and F are nonzero. Thus every point
of the finite intersection is reduced, as in the core argument. Padding
preserves both exhaustion and reducedness by the support/block argument.

The only relation among the r+1 matrices is the six-core relation.
An r-subset is independent precisely when it omits one Q-point. Omitting
an added matrix leaves all six core matrices and hence a relation. Since
the flattening has rank r, an actual r-term decomposition must choose a
basis of rank-one matrices in its image. This proves that exactly the
six independent subsets give actual decompositions; comparison of third
coefficients proves uniqueness for each subset, and the scalar tangent
criterion proves immersion.

**A finite model containing all limiting configurations.** Let H be the
span variety in the padded A tensor B. The same birationality criterion
applies under a,b>=3 and a+b>=r+2: for every 2<=j<=r,
min(a,j)+min(b,j)>=j+2, so generic factor lists satisfy the subset condition.
Near L_r, the incidence Z->H is finite and unramified because its fiber
is finite and reduced. Its ordered distinct r-tuples form a finite
unramified scheme D, and the unordered quotient F=D/S_r is finite over H.
Independence is an open condition in F. On that open, F is the actual
unordered span configuration space. The closure F_0 of this open, with
reduced structure, is integral and finite birational over H: the open
configuration space is irreducible, and the span morphism is birational.

The normalization of H maps finitely and surjectively to F_0. On affine
rings, its integral closure contains the finite intermediate domain
defining F_0, and both have the same fraction field. Thus every point
of F_0 over L_r has at least one point of the normalization above it.

The fiber of F has precisely the r+1 unordered r-subsets of the r+1
reduced intersection points. The six independent subsets lie in F_0.
We now show that every dependent subset lies there as well.

Suppose the omitted matrix is R_s=u_s tensor v(s+3). The three rows r_i
of M form a basis of B_0. Write v(s+3)=sum_(i=1)^3 lambda_i r_i and put

    Q_i(z)=(e_i+z lambda_i u_s) tensor r_i  (i=1,2,3),
    Q_i(z)=Q_i                              (i=4,5,6).

Keep every other added matrix fixed, and omit R_s. These are r rank-one
points. Their six core representatives satisfy

    sum_(i=1)^6 Q_i(z)=z R_s.

For z!=0 they are linearly independent together with the other added
matrices. Indeed, projecting a relation to the core block forces the six
core coefficients to be equal. Projection to the other added blocks
forces their coefficients to vanish; the u_s-row then gives a nonzero
multiple of z v(s+3), forcing the common coefficient to vanish as well.

Their span tends to L_r. To verify this without division in a Grassmann
limit, use five of Q_i(z), all the retained added matrices, and the fixed
R_s as a basis: their limits form a basis of L_r, and for z!=0 the fixed
R_s is in the span by the displayed identity. This defines the required
algebraic arc in the Grassmannian, extending to L_r at z=0.

For an omitted S_t, write v(t+3)=sum_(j=1)^3 mu_j(-m_j), and deform

    Q_(3+j)(z)=(-m_j) tensor (e_j+z mu_j w_t),

keeping Q_1,Q_2,Q_3 and all other added matrices fixed. Their sum is
z S_t. The identical column-block argument proves independence for
z!=0 and convergence of spans to L_r. These arcs show that every
dependent subset is a limit of actual independent configurations, and
hence is in F_0. Distinct subsets are distinct points of F_0.

It follows that the normalization of H has at least r+1 distinct points
over L_r. The normalization of the rank-r tensor bundle is its pullback
to that normalization, so the same bound holds over T_(r;p,q).
The six independent points of F_0 have neighborhoods isomorphic to open
subsets of the smooth configuration space, so normalization is an
isomorphism there. They give exactly the six smooth points arising from
actual decompositions. The other r-5 subsets require distinct additional
normalization points and cannot be actual decompositions because they
do not span L_r. This proves all the claims. QED.

For every format in the family theorem one may choose
p=max(3,r+1-b), q=r+1-p; the required inclusions then hold. Thus the
higher-rank conclusions apply uniformly to its explicit witnesses.

## 5. What this proves, and what remains

The rank-five local question closes: the entire normalization is smooth
on a neighborhood of each displayed witness, with six preimages. The
criterion proves this from the rank-one intersection and the span map,
without a global description of the normalization.

At higher ranks the same finite-intersection description remains exact,
but the six actual decompositions do not exhaust the normalization fiber.
The explicit dependent limiting configurations identify the obstruction
to extending the rank-five proof unchanged. Determining the local rings
of the normalization over those boundary configurations remains a
separate target. Global Cohen--Macaulayness or rational singularities of
the normalization are not determined even in rank five, since points
outside the displayed neighborhoods have not been classified.

At every immersive decomposition, the addition map has a bounded local
inverse derivative on its branch after restricting to a smaller
neighborhood. Choose a linear projection making its differential square
and invertible, apply the holomorphic inverse function theorem, and use
continuity of the inverse derivative on a relatively compact
neighborhood. Thus multiple normalization branches can give global
ambiguity while each actual local branch remains well-conditioned. No
condition-number tail exponent, expectation, or probability-law statement
follows from this local geometric conclusion.
