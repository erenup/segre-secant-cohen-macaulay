# Exact rank-one slice and exclusion of diagonal-extension boundary configurations

## Scope

Work over C. Put M=[[1,1,1],[1,2,3],[1,4,9]], and let Q_1,Q_2,Q_3 be its three row-supported matrices and Q_4,Q_5,Q_6 the negatives of its three column-supported matrices. Let L_0 be their span. For t>=0, take vector spaces A,B of dimensions a,b>=3+t, put D_s=e_(3+s) tensor e_(3+s), and set

    L_t=L_0 direct-sum span(D_1,...,D_t),   r=5+t.

All unused coordinates in A and B are zero. The exact rank-one intersection and actual-decomposition count below are proved without a generic-identifiability assumption. The boundary-exclusion result is likewise unconditional for this L_t. Section 5 proves the required generic birationality directly, and Section 6 proves the flattening-bundle transfer. The resulting normalization statement is unconditional in the displayed range.

The core six-point intersection and rank-five normalization fiber have already been proved in the existing TR-25 normalization package. The calculation here verifies that core. The new angle is the all-r diagonal extension and the exclusion of dependent limiting decompositions; these diagonal extensions differ from the previously treated Vandermonde row/column extensions, where extra boundary points are known to occur.

## 1. The core intersection has exactly six reduced points

The parametrization

    A_ij=M_ij(x_i-y_j)

has one-dimensional kernel (all x_i and y_j equal), because every M_ij is nonzero. Hence dim L_0=5. The relation sum_(i=1)^6 Q_i=0 is its only generator relation, and every coefficient in this relation is nonzero; any five Q_i are independent.

Let A=u v^t be nonzero of rank one and belong to L_0. If u_i=0, its zero row gives y_j=x_i for every j; thus A=diag(x-x_i)M. Since det M=2, rank A is the number of surviving rows, so exactly one survives. This gives one of the three row points. A zero coordinate of v gives one of the three column points by the same argument. Thus every further point would have full support.

In the full-support chart set u=(1,a,b), v=(1,c,d). Membership in L_0 is equivalent to the four integer cycle equations

    F=(a-2)c-2(a-1)=0,
    G=(a-3)d-3(a-1)=0,
    H=(b-4)c-4(b-1)=0,
    J=(b-9)d-9(b-1)=0.

The following identities are identities of polynomials, with no division by a variable:

    (a-2)H-(b-4)F = -2[(a-3)b+2a],
    (a-3)J-(b-9)G = -6[(a-4)b+3a].

Subtract the two bracketed expressions to obtain b-a=0. Subtract (a-3)(b-a) from the first to obtain a(a-1)=0. Full support forces a=1, and then F=G=0 forces c=d=0, a contradiction. Therefore only the six listed points exist, over C, and no positive-dimensional component exists.

For reducedness use the four equations

    G_ij=M_ij(u_1v_1-u_1v_j-u_iv_1)+u_iv_j, i,j in {2,3}.

At row point R_i normalize u_i=v_1=1. At column point C_j normalize u_1=v_j=1. Order the two free u coordinates first and the two free v coordinates second, each in increasing index. The 4-by-4 Jacobian determinants at R_1,R_2,R_3,C_1,C_2,C_3, respectively, are

    12, -12, 12, -12, 12, -12.

Thus the ideal of the intersection generates the maximal ideal modulo its square in each smooth four-dimensional Segre chart. In the local intersection ring m=m^2, so Nakayama gives m=0. All six local rings are C; the scheme-theoretic intersection is exactly these six reduced points. Equivalently, the affine tangent to the Segre cone meets L_0 only in the radial line at every listed point.

## 2. All diagonal extensions: intersection and actual decompositions

A nonzero rank-one matrix in L_t is block diagonal. Its rank is the sum of the ranks of its nonzero diagonal blocks, so exactly one block is nonzero. The projective rank-one intersection therefore consists exactly of the six core points and the t points [D_s].

It is reduced. At a core point choose a nonzero pivot (p,q) in the core and use the Segre chart u_p=v_q=1. The off-block entries (p,j) and (i,q) vanish on L_t, forcing every factor coordinate outside the core to be zero scheme-theoretically. What remains is precisely the reduced core intersection. At [D_s], use pivot (3+s,3+s); all off-diagonal entries in that pivot row and column vanish on L_t, forcing every other factor coordinate to zero. The local scheme is one reduced point. This also proves the transverse-tangent assertion at every point, including after arbitrary coordinate padding.

The only relation among these r+1 projective generators is the full-support relation on the six core points. Consequently the r-element subsets which span L_t are exactly the six subsets omitting one core point; omitting a D_s leaves a rank-(r-1) subset. There are exactly six unordered projective rank-one bases of L_t.

If a tensor T in A tensor B tensor C has third flattening of rank r and image L_t, any r-term decomposition supplies a projective rank-one basis of L_t. Conversely each such basis determines the C-coefficients uniquely and hence determines one unordered decomposition into r nonzero pure tensor summands. Thus T has exactly six actual unordered r-term decompositions. Its tensor rank and border rank equal r, by the flattening lower bound and this expression. This count is not, by itself, a normalization-fiber count.

## 3. A DVR lemma forbidding missing diagonal directions

Write R=C[[z]], K=C((z)). Let P,N be matrices over R, each of rank at most 3 over K, with P(0)=N(0)=M embedded in the upper-left 3-by-3 block. Write

    P=[A_P B_P; C_P E_P],  N=[A_N B_N; C_N E_N].

The A blocks are invertible over R and the B,C blocks lie in zR. Rank at most 3 implies the exact graph identities

    E_P=C_P A_P^(-1) B_P,   E_N=C_N A_N^(-1) B_N.

If A_P-A_N, B_P-B_N and C_P-C_N are all divisible by z^k, with k>=1, then E_P-E_N is divisible by z^(k+1). Indeed,

    E_P-E_N
      = C_P A_P^(-1)(B_P-B_N)
        +(C_P-C_N)A_N^(-1)B_N
        +C_P(A_P^(-1)-A_N^(-1))B_N,

and

    A_P^(-1)-A_N^(-1)
      =-A_P^(-1)(A_P-A_N)A_N^(-1).

The first two summands are divisible by z^(k+1), and the last by z^(k+2). This argument is valid for arbitrary rectangular outer blocks and arbitrary ambient padding.

## 4. The proper span graph has no boundary points above L_t

Let S=Seg(PA x PB). Let U be the open subset of ordered independent r-tuples in S^r, and let Gamma be the closure of the graph of their span map in S^r x Gr(r,A tensor B). The projection Gamma -> Gr is proper. I claim that its fiber over L_t consists exactly of the 6 r! ordered independent tuples already described, all reduced; in particular no point of that fiber belongs to Gamma minus U.

Any point of that fiber is approached by an arc whose generic tuple belongs to U (take a curve through the point with generic point in the dense open graph, then normalize and complete). Incidence is closed, so every limiting projective point lies in P(L_t) intersect S.

First no two limiting points coincide. Otherwise normalize both rank-one matrix arcs to have one fixed common pivot equal to 1. Their nonzero difference has a leading coefficient w after division by its smallest power of z. The defining equations of the Segre show that w is a tangent vector to its affine cone at the common limit q. Since both matrix arcs lie in the moving span, w belongs to L_t. Its pivot coordinate is zero. By the transverse-tangent assertion of Section 2, w lies in Cq, but its zero pivot then gives w=0, a contradiction.

Thus the limiting tuple consists of r distinct points out of the r+1 listed points. If it omits a core point it is independent and already belongs to U. The only possible boundary case omits one D_s, and contains all six Q_i plus all other D_j. We exclude that case now.

Choose regular rank-one matrix representatives p_i(z) tending to Q_i and d_j(z) tending to D_j for j!=s. Factoring the d_j(z) in their pivot charts, their first-factor vectors are independent over R and likewise their second-factor vectors. Separate changes of basis in A and B, both congruent to the identity modulo z, make every retained d_j(z) exactly D_j. These changes preserve the limiting subspace L_t. They do not impose any restriction on the six p_i(z).

The moving rank-r span extends as a rank-r subbundle over R with special fiber L_t. Choose a regular section Z(z) of this subbundle with Z(0)=D_s. Over K write

    Z(z)=sum_(i=1)^6 alpha_i(z)p_i(z)+sum_(j!=s) beta_j(z)D_j.

Some coefficient has a pole: otherwise D_s would lie in the span of the limiting tuple. Let k>=1 be the largest pole order, and multiply the equation by z^k. The resulting coefficients are integral and not all zero modulo z. Their reductions form a relation on the limiting tuple. Its only relation is sum Q_i=0, so the six core coefficients all have the same nonzero constant lambda and the other coefficients have constant zero. Divide by lambda, and write the resulting integral core coefficients as a_i(z), each with constant 1, and the others as b_j(z), each with constant zero.

Put

    P=sum_(i=1)^3 a_i p_i,
    N=-sum_(i=4)^6 a_i p_i.

Each has rank at most 3, and P(0)=N(0)=M. The equation is

    P-N+sum_(j!=s) b_j D_j = lambda^(-1) z^k Z(z).

Its upper-left and two cross blocks show that A_P-A_N, B_P-B_N, C_P-C_N are divisible by z^k. Section 3 therefore makes the whole lower-right block of P-N divisible by z^(k+1). Every retained D_j has zero (3+s,3+s) entry. But the right-hand side's (3+s,3+s) entry has valuation exactly k, because Z(0)=D_s. Contradiction.

This excludes all boundary tuples, for every t>=1 (and t=0 has no omitted diagonal to consider). At an independent tuple the tangent to the span map sends the individual tangent vectors to their classes in (A tensor B)/L_t. Its kernel is zero by the transverse-tangent assertion. Therefore the finite fiber has zero tangent space at every point and is reduced.

## 5. Direct generic birationality in the required range

Assume a,b>=2 and r<=a+b-2. There is a nonempty open set of ordered r-tuples (a_i tensor b_i) for which every subset of the a_i of size at most a is linearly independent, and likewise for the b_i with b in place of a. Nonemptiness follows by taking Vandermonde vectors at distinct complex parameters, separately in A and B. Call these the full-spark tuples.

For a linear combination with precisely s nonzero coefficients, its matrix is A_S diag(lambda_i) B_S^t. Sylvester's elementary rank inequality gives

    rank >= min(a,s)+min(b,s)-s.

To recall that inequality, the restriction of a linear map F to the image of G has dimension at least dim(im G)-dim(ker F), so rank(FG)>=rank(F)+rank(G)-s for maps with an s-dimensional intermediate space.

When s=1 the matrix has rank one. When 2<=s<=r the displayed lower bound is at least 2: it is respectively s, a, b, or a+b-s according to whether s is below both dimensions, above a only, above b only, or above both. In the last case it is at least a+b-r>=2. In particular no nonzero linear combination vanishes, so the r matrices are independent, and their span contains exactly their r projective rank-one points.

Every unordered full-spark tuple is therefore the unique unordered independent tuple with its span. This nonempty open set is dense. The unordered span map is generically injective, hence birational onto its image H in characteristic zero. No external identifiability theorem is needed.

For t>=1, r=5+t and a,b>=3+t=r-2 imply a+b>=2r-4>=r+2, so this applies to every diagonal format under consideration. For t=0 and a=b=3, it does not apply; generic birationality is false there. The rank-five case requires a+b>=7, and its normalization conclusion is already in the earlier normalization theorem.

## 6. Unconditional normalization theorem for every r>=6

**Theorem.** For every integer r>=6 and a,b>=r-2, c>=r, form L_(r-5) as above. Let X_r(a,b,c) be the reduced affine border-rank-at-most-r tensor variety over C. If T has third flattening of rank r and image L_(r-5), then there is a Zariski open neighborhood of T in X_r(a,b,c) whose entire normalization is smooth. Its normalization map is unramified and the normalization fiber over T consists of exactly six reduced points. These six points correspond bijectively to the six actual unordered r-term decompositions of T. In particular this applies to

    T=sum_(i=1)^5 Q_i tensor f_i + sum_(s=1)^(r-5) D_s tensor f_(5+s),

with unused coordinates zero. Tensor rank and border rank are both r. The result is invariant under permutations of the three factors. This theorem makes no claim about the global normalization, its global Cohen--Macaulayness, or the exact local ring of X_r.

**Proof on the span variety.** Let H be the closure of the unordered span image. Pass from Gamma to its finite permutation quotient. Its good open subset of independent tuples is smooth, since the permutation action there is free. Section 4 says its entire fiber over L_t lies in this good open subset and consists of six reduced points. The image of the closed bad locus is closed, by properness, and misses L_t. Remove this image. The locus where the remaining proper map is not quasi-finite is closed in the source and also has closed image; it misses the six fiber points. Remove that image too. The resulting morphism over a neighborhood N of L_t is finite. At the six fiber points its relative tangent space is zero, so it is unramified there. Remove the closed image of the complement of its unramified locus and shrink N once more. The entire finite source over N is smooth and the finite map is unramified.

Section 5 gives birationality. A finite birational map from a normal source to the reduced irreducible variety N is its normalization: on affine charts its ring is integral over the target, lies in the same fraction field, and is integrally closed, hence equals the integral closure. Thus the normalization of N is smooth, is unramified over N, and has exactly six reduced points over L_t.

**Transfer to tensors.** Let W=A tensor B and regard tensors as linear maps C* -> W. On the rank-r flattening locus, the map rho sending a linear map to its image is the bundle of surjections C* -> L over Gr(r,W). Locally on the Grassmannian this is the product with the open variety of full-rank r-by-c matrices. The rank-r part of X_r is precisely rho^(-1)(H), with its reduced structure. One inclusion follows from decompositions into r summands and closure. For the other, approximate an L in H by independent spans, trivialize the tautological bundle on a Grassmann chart, and keep the surjection coordinates fixed; this produces tensors of rank at most r approaching any prescribed surjection onto L. The equality is therefore an equality of reduced varieties.

Over a trivializing chart, normalization of rho^(-1)(N) is the product of the normalization of N with that full-rank matrix open set. Indeed this product is finite and birational over rho^(-1)(N), and is normal: a polynomial algebra over a normal domain is normal, as are its localizations. These local descriptions agree on overlaps by uniqueness of normalization. Smoothness of the normalized source and unramifiedness of the finite map follow from the product descriptions (equivalently, smooth base change). The fiber over any fixed surjection onto L_t consists of the same six reduced points. This proves the theorem.

## 7. Exact calculation and negative controls

check_exact.py uses only the Python standard library, rational arithmetic, polynomial dictionaries, Gaussian rank computation, and permutation expansion of determinants. It checks the matrix determinant, circuit relation and all six five-point basis ranks; the four polynomial elimination identities; all six chart equations and Jacobian determinants. It has five reason-specific negative controls: a singular matrix, wrong circuit rank, a corrupted Jacobian value, and each of the two corrupted elimination multipliers. It uses no assert statements and exits through explicit SystemExit on rejection. Normal and python -O outputs are identical. Its scope is the fixed core algebra; the all-r DVR result is the written proof above, not a finite computational inference.
