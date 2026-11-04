# E. Normal singular boundary points for specified mixed circuit extensions

All varieties
are reduced over C. Normalization means finite normalization in the
variety's own function field. The complete proof is in
[GEOMETRY_E.md](GEOMETRY_E.md), [ALGEBRA_STAR.md](ALGEBRA_STAR.md), and
[DEFORMATION_LEMMA.md](DEFORMATION_LEMMA.md); prior inputs are
listed in [DEPENDENCIES_E.md](DEPENDENCIES_E.md).

## Common core and local models

Let A=C^a, B=C^b, and C=C^c, with coordinate three-dimensional subspaces
A0,B0. Let f_i be the coordinate vectors of the third factor. In A0 tensor
B0 define

    M=[[1,1,1],[1,2,3],[1,4,9]],
    Q_i=e_i tensor row_i(M)          (1<=i<=3),
    Q_(3+j)=-column_j(M) tensor e_j  (1<=j<=3),
    L0=span(Q_1,...,Q_6),
    v(s)=(1,s,s^2).

Write X_r(a,b,c) for the affine variety of tensors of border rank at most
r in A tensor B tensor C. Two kinds of normal local model occur:

    R_(s,m)=C[t,mu_j,y_ij,mu_j*y_ij/t :
                              1<=j<=s, 1<=i<=m],

    B_(k,alpha,beta)=
      C[t,p,q_j,x_j,z_j,u_h,v_ij,
        (p*z_j+q_j*x_j)/t, p*u_h/t, q_j*v_ij/t :
              1<=j<=k, 1<=h<=beta, 1<=i<=alpha].

Each is defined as the displayed subalgebra of the Laurent polynomial
ring in its independent base variables with t inverted. Empty index
sets are allowed. In B, alpha always counts the v-rows and beta the
u-variables. Both algebras are normal for all nonnegative integer
parameters. Their homogeneous origins have tangent excesses

    excess(R_(s,m))=s*m,
    excess(B_(k,alpha,beta))=k*(alpha+1)+beta,

where tangent excess means embedding dimension minus Krull dimension.
Normality of R is proved in GEOMETRY_E and normality of B in ALGEBRA_STAR;
both tangent counts are proved in GEOMETRY_E.

The local-model claims below mean smooth equivalence: a smooth local cover
of the indicated germ is etale over the product of the model's homogeneous
origin with a smooth germ. They include the factor-vector and ordered-point
covers in the proof. They do not specify canonical coordinates on the
unframed normalization.

## E1. One added row and r-6 added columns, in every admissible rank

Let

    r>=7, a>=4, b>=r-3, c>=r, a+b>=r+2,
    k=r-6.

Choose one new A coordinate u and k new B coordinates w_1,...,w_k. Set

    R=u tensor v(4),
    S_j=v(j+3) tensor w_j          (1<=j<=k),
    L=L0 direct-sum C R direct-sum span(S_1,...,S_k),
    T=sum_(i=1)^5 Q_i tensor f_i
                          +R tensor f6+sum_(j=1)^k S_j tensor f_(6+j).

This is the original flexible witness T_(r;4,r-3), of support dimensions
(4,r-3,r), padded to the stated format. Its rank and border rank are r.
It has exactly six actual unordered r-term decompositions.

The entire normalization fiber of X_r(a,b,c) over T consists of exactly
r+1 reduced points, indexed by the r-element subsets of the r+1 matrix
directions Q_1,...,Q_6,R,S_1,...,S_k. Their complete local classification is:

- The six subsets omitting a Q-point give the six actual decompositions;
  their normalization points are smooth.
- The subset omitting R gives one singular normalization point with local
  model R_(r-6,a-3) and tangent excess (r-6)(a-3).
- Each of the r-6 subsets omitting an S_j gives a singular normalization
  point with local model B_(r-7,a-4,b-r+4) and tangent excess
  (r-7)(a-3)+b-r+4.

The last two types are dependent configurations, not actual decompositions.
All displayed excesses are positive in this range, including r=7, when
the last model B_(0,a-4,b-3) is just R_(1,b-3) after renaming p and u.

Every normalization point has dimension D=r(a+b+c-2). Its embedding
dimension is D for the six smooth points and D plus the corresponding
displayed excess for each boundary point. There is a Zariski open
neighborhood of T over which the normalization morphism is unramified.

Swapping A and B and transporting T gives the corresponding original
family with one added column and r-6 added rows. All counts, local models,
and formulas transport with that swap.

## E2. Two added rows and two added columns in rank nine

Let

    a>=5, b>=5, a+b>=11, c>=9.

Choose new A coordinates u1,u2 and new B coordinates w1,w2. Set

    R1=u1 tensor v(4),   R2=u2 tensor v(5),
    S1=v(4) tensor w1,   S2=v(5) tensor w2,
    L=L0 direct-sum span(R1,R2,S1,S2),
    T=sum_(i=1)^5 Q_i tensor f_i
                  +R1 tensor f6+R2 tensor f7+S1 tensor f8+S2 tensor f9.

This is the original flexible witness T_(9;5,5), of support dimensions
(5,5,9), padded to the stated format. Its rank and border rank are nine,
and it has exactly six actual unordered nine-term decompositions.

The entire normalization fiber of X_9(a,b,c) over T consists of exactly
ten reduced points, indexed by the nine-element subsets of the ten
matrix directions Q_1,...,Q_6,R1,R2,S1,S2. Their classification is:

- Six smooth points, omitting a Q-point, correspond to the six actual
  decompositions.
- Two singular points, omitting R1 or R2, have local model
  B_(2,a-4,b-5) and tangent excess 2a+b-11.
- Two singular points, omitting S1 or S2, have local model
  B_(2,b-4,a-5) and tangent excess a+2b-11.

The four boundary configurations are dependent. Both excesses are at
least five in the stated range. The cases b=5 or a=5 are included:
respectively the first or second star model has beta=0, which the
algebra theorem permits.

Every normalization point has dimension D=9(a+b+c-2), and its embedding
dimension is D plus its stated excess, taking zero at the smooth points.
There is a Zariski open neighborhood of T over which the normalization
morphism is unramified.

## Scope

All conclusions transport under permutation of the tensor factors along
with the specified witness. E1 and E2 concern exactly the original
mixed row/column witnesses displayed above, including their admissible
padding. E2 supplies only the two-row/two-column split at rank nine.

The exact rank-one intersections, six actual decompositions, and lower
bound r+1 on normalization points were proved in the
[earlier normalization theorem](../../proofs/STATEMENTS.md).
The new content is the exact exhaustion of the normalization fibers and
the normal, singular local models and tangent dimensions of all their
boundary points in these specified mixed families.

These theorems assert no global normality, smoothness, Cohen--Macaulayness, rational
singularity, or depth property of the normalization, and no broader
mixed split with several retained rows and columns.
