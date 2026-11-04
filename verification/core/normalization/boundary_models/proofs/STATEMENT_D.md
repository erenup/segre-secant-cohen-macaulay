# D. One-sided circuit extensions with arbitrary admissible padding

All varieties are
reduced over C. Normalization is the finite normalization in the variety's
own function field. The proof is [PROOF_D.md](PROOF_D.md).

## Witness and hypotheses

Let r>=6, a>=r-2, b>=3, c>=r, and a+b>=r+2. Set A=C^a, B=C^b,
C=C^c, and choose coordinate subspaces A0=B0=C^3. In A0 tensor B0 put

    M = [[1,1,1],[1,2,3],[1,4,9]],
    Q_i = e_i tensor row_i(M)          (1<=i<=3),
    Q_(3+j) = -column_j(M) tensor e_j  (1<=j<=3),
    L0 = span(Q_1,...,Q_6),
    v(s) = (1,s,s^2).

Choose distinct new coordinate vectors u_1,...,u_(r-5) in A/A0, and let
f_1,...,f_r be the first r coordinate vectors of C. Define

    R_s = u_s tensor v(s+3)                    (1<=s<=r-5),
    L_r = L0 direct-sum span(R_1,...,R_(r-5)),
    T_row = sum_(i=1)^5 Q_i tensor f_i
              + sum_(s=1)^(r-5) R_s tensor f_(5+s).

The vectors v(s+3) belong to B0 even when b>3. Write X_r(a,b,c) for
the affine variety of tensors of border rank at most r in A tensor B tensor C.

## Theorem D

The tensor T_row has ordinary rank and border rank exactly r. The finite
normalization of X_r(a,b,c) has exactly r+1 reduced points over T_row.
There are precisely six actual unordered r-term decompositions. Their six
normalization points are smooth. Each of the other r-5 normalization points
corresponds to a dependent configuration containing all six Q-directions and
all R-directions except one R_s; it is not an actual r-term decomposition.

Put

    ell = r-6,       m = b-3,
    R_(ell,m) = C[t, mu_i, z_ij, mu_i*z_ij/t :
                        1<=i<=ell, 1<=j<=m]
                  inside C[t,t^-1,mu_i,z_ij].

At every boundary normalization point the local singularity is smoothly
equivalent to the homogeneous origin of Spec R_(ell,m): explicitly, a
smooth local cover of the boundary germ is etale over a product of this
toric germ with a smooth germ. This statement includes the factor-vector
and ordered-configuration covers used in the proof; it does not assert a
canonical coordinate isomorphism on the unframed normalization.

The ring R_(ell,m) is normal. Its origin is smooth if ell*m=0 and singular
if ell*m>0. Its embedding dimension minus its dimension is ell*m. Hence
all r-5 boundary normalization points are smooth exactly when r=6 or b=3;
all are singular when r>=7 and b>=4. Each such boundary point has dimension
r(a+b+c-2) and embedding dimension r(a+b+c-2)+(r-6)(b-3).

There is a Zariski open neighborhood of T_row on which the normalization
morphism is unramified. If r=6 or b=3 its entire source over a sufficiently
small such neighborhood is smooth. For r>=7 and b>=4 the boundary points
above T_row are singular, with the normal local models just specified.

All statements remain valid under permutation of factors together with
transport of this witness. In particular swapping A and B gives the
one-sided added-column version.

## Relation to the other statements and limits

D includes B at r=6 and C when b=3. It supersedes those
statements on their one-sided witness families. A concerns different,
disjoint diagonal witnesses and is not replaced by D.

The complete rank-one intersections, six actual decompositions, and lower
bound r+1 on normalization points were proved in the [earlier normalization theorem](../../proofs/STATEMENTS.md). D's
contribution is exact exhaustion and local regularity/singularity
of every dependent boundary point. The prior inputs are listed in [DEPENDENCIES_D.md](DEPENDENCIES_D.md).

This theorem does not cover simultaneous added-row and added-column witnesses.
It asserts no global smoothness, Cohen--Macaulayness, rational-singularity,
or exact-depth property of the normalization.
