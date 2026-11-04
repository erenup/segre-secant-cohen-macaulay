# A counterexample to universal Cohen--Macaulayness of tensor border-rank varieties

## Theorem

Over C, let X be the reduced Zariski closure of sums of five pure tensors in

    V = C^6 tensor C^6 tensor C^6.

Then dim X=80. Its coordinate ring does not satisfy Serre's condition S2 and is not Cohen--Macaulay. In particular, if m is its homogeneous maximal ideal, then

    depth C[X]_m < 80 = dim C[X]_m.

This disproves the universal statement TR-25. The proof uses one explicit integer tensor, not a nonreduced auxiliary scheme or an unrelated component. The decisive finite data consist of a 3-by-3 integer matrix and six nonzero rational determinants. Independent integer checkers additionally verify the two tensor decompositions and their tangent ranks.

## 1. A conductor fact

We use the following elementary consequence of S2.

**Lemma 1.** Let A be a local domain essentially of finite type over C, satisfying S2, and let B be its finite normalization in its fraction field. Write

    I = (A:B) = {a in A : aB is contained in A}.

If I is proper at a prime q of B, there is a height-one prime h contained in q with I contained in h.

**Proof.** The conductor is a nonzero ideal of both A and B. As a B-module it identifies with Hom_A(B,A): an A-linear map becomes multiplication by a scalar after passing to the common fraction field; its value at 1 is in A and multiplies B into A.

We first show that I satisfies S2 as a B-module. For a prime q of B put p=q cap A. Finite birational extensions of these affine domains preserve heights. This follows from the common transcendence degree, the finite residue-field extension at corresponding primes, and the dimension formula; it is preserved by the localizations here. If the common height is at least two, choose an A_p-regular sequence x,y in pA_p. It is also regular on

    Hom_{A_p}(B_p,A_p)=I_p.

Multiplication by x is injective. If yf=xg, then for every b in B_p one has yf(b) in xA_p. Regularity of y modulo x implies f(b) in xA_p. Therefore division by x defines an A_p-linear map h:B_p -> A_p, with f=xh. This proves regularity of y on I_p/xI_p. Localizing further at q preserves this regular sequence. In height one, torsion-freeness gives depth at least one. Thus I is S2 over B.

Choose a prime h minimal over I and contained in q. Since I is nonzero, h has positive height. If ht(h)>=2, normality of B and the preceding paragraph give depth B_h>=2 and depth I_h>=2. In the exact sequence

    0 -> I_h -> B_h -> (B/I)_h -> 0,

the depth lemma then gives depth(B/I)_h>=1. But this is a nonzero zero-dimensional local module, hence has depth zero. Contradiction. Therefore ht(h)=1. □

If the normalization has two distinct points over the closed point of Spec A, I is proper at every point above it. Indeed, if I_q=B_q, some c in I avoids q. Since c belongs to A, it avoids the maximal ideal of A and is a unit of A. This gives I=A and B=A, contradicting the two points.

## 2. Two immersive decompositions obstruct S2

For this section take any r>=2 and n_1,n_2,n_3>=r+1. Let X_r be the reduced border-rank-at-most-r variety in the corresponding tensor product, and let P be its nonzero pure-tensor cone. The variety P is smooth and irreducible of dimension

    n_1+n_2+n_3-2.

For example, it is the nonzero tautological line bundle over the product of the three projective factor spaces. Remove repeated summands from P^r and quotient by the free action of S_r. Denote this smooth irreducible quotient by Y. The quotient map is finite etale in characteristic zero. Addition defines a dominant morphism

    f:Y -> X_r,     {p_1,...,p_r} -> sum_i p_i.

Put D=r(n_1+n_2+n_3-2)=dim Y.

Let Y_full be the open set of decompositions whose three factor matrices each have column rank r. This condition is unaffected by rescaling the vectors representing the pure summands. Its image is precisely the group orbit of

    Delta_r = sum_{i=1}^r e_i tensor e_i tensor e_i.

This tensor has a unique unordered r-term decomposition. To see this, its flattening ranks are all r, so every r-term decomposition has independent factor vectors in the true r-dimensional supports. Its first flattening image is the diagonal matrix space in the other two supports. Each proposed second-and-third pair product must belong to that space. The only rank-one directions in the diagonal matrix space are the r coordinate diagonal directions. They fix the pure summands, up to their order. The same holds throughout the orbit.

Consequently the image orbit has dimension D, dim X_r=D, and f is generically one-to-one. Characteristic zero makes f birational. The orbit is locally closed and dense, hence open in X_r, and group orbits in characteristic zero are smooth. Therefore

    f(Y_full) is contained in the smooth locus of X_r.       (2.1)

The complement of Y_full has codimension at least two. Indeed, the smooth surjection from ordered factor vectors to P^r has torus fibers (C*)^(2r). In those factor coordinates, each rank-deficient locus is the determinantal locus of an n_j-by-r matrix of rank at most r-1. Its codimension is n_j-r+1>=2. Removing zero columns and repeated summands, descending through the torus, and taking the free finite quotient preserve codimension. Thus

    codim_Y(Y minus Y_full)>=2.                             (2.2)

**Lemma 2.** If there are two distinct points y_1,y_2 of Y with the same image T, and both differentials df_{y_i} are injective, then the local ring O_{X_r,T} is not Cohen--Macaulay. Moreover X_r cannot satisfy S2.

**Proof.** Let nu:Xbar -> X_r be the finite normalization. A dominant morphism from the normal variety Y lifts to g:Y -> Xbar: the pullback of an integral rational function is integral over each relevant normal local ring of Y and hence regular. Since f is birational, g is birational.

Injectivity of df at y_i implies that the tangent space to the fiber is zero there, so f, and hence g, is quasi-finite at y_i. The quasi-finite locus Y_0 of g is open and contains both points. A separated quasi-finite birational morphism to a normal variety is an open immersion, by Zariski's Main Theorem. Applied to g restricted to Y_0, this identifies Y_0 with an open subset of Xbar. In particular the two points q_i=g(y_i) are distinct normalization points above T.

Suppose A=O_{X_r,T} satisfied S2. By Lemma 1 and its following observation, a conductor divisor in the normalization must pass through q_1. On the open normalization chart identified with Y_0, (2.1) says that the conductor has no support on Y_0 intersect Y_full, since normalization is an isomorphism above every smooth point. Its support is therefore contained in Y_0 minus Y_full, which has codimension at least two by (2.2). It cannot contain a divisor through q_1. This contradiction shows that A is not an S2 ring. A Cohen--Macaulay local ring and all its localizations are S2, so A is not Cohen--Macaulay. Assuming X_r globally S2 gives the same contradiction. □

The lemma requires only the two displayed immersive points. It does not assume there are no other decompositions, no other points in the normalization fiber, or no positive-dimensional boundary fibers. It also makes no global codimension-one smoothness assumption on X_r.

## 3. Six rank-one matrices and their exact tangent intersections

Let

    M = [1 1 1
         1 2 3
         1 4 9].

Write r_i for row i, m_j for column j, and e_1,e_2,e_3 for the standard basis of C^3. Define

    Q_i = e_i r_i                 for i=1,2,3,
    Q_{3+j} = -m_j e_j^t          for j=1,2,3.

They are six nonzero, pairwise nonproportional rank-one matrices, with

    Q_1+Q_2+Q_3+Q_4+Q_5+Q_6=0.                             (3.1)

This is their only linear relation, up to scalar. For if sum_s alpha_s Q_s=0, the (i,j) entry is M_ij(alpha_i-alpha_{3+j})=0. Every M_ij is nonzero, so all six coefficients agree. Hence their span L has dimension five and any five form a basis.

Every N in L has the form

    N_ij = M_ij(x_i-y_j).                                   (3.2)

The affine tangent space to the rank-one matrix cone at ab^t is a(C^3)^t+C^3b^t. We claim

    L intersect T_{Q_s}(rank-one matrix cone) = C Q_s
    for each s=1,...,6.                                    (3.3)

For a row point Q_i, let k,l be the other two row indices in increasing order. Tangency means rows k,l of N are z_k r_i,z_l r_i. Equation (3.2) implies

    y_j = x_k-z_k M_ij/M_kj = x_l-z_l M_ij/M_lj.

The determinants with rows (1,1,1), r_i/r_k, r_i/r_l are respectively

    -1/18,  1/3,  -2                  for i=1,2,3.          (3.4)

Thus x_k=x_l and z_k=z_l=0. All y_j equal x_k, leaving just a scalar multiple of row i of M. This proves (3.3) for the row points.

For a column point Q_{3+j}, the sign does not affect its tangent space. The analogous determinants with columns of M, viewed as three-entry vectors, are

    -1/18,  4/9,  -3/2               for j=1,2,3.          (3.5)

They are nonzero and the identical argument, with rows and columns interchanged, proves (3.3). Each value in (3.4)--(3.5) is simply a 3-by-3 rational determinant, independently checked by direct expansion.

## 4. The explicit tensor and both immersive decompositions

Let f_1,...,f_5 be a basis of C^5, and set

    T = sum_{i=1}^5 Q_i tensor f_i
      in C^3 tensor C^3 tensor C^5.                         (4.1)

By (3.1) it also equals

    T = sum_{i=1}^4 Q_i tensor (f_i-f_5) - Q_6 tensor f_5.   (4.2)

Both expressions have five nonzero pure summands and differ as unordered sets, even after within-term rescalings. In each expression the third-factor vectors form a basis, while the five matrix factors form a basis of L. The third flattening of T has image L and rank five. Matrix flattening rank is a lower bound for border rank, so (4.1) proves exactly

    rank(T)=border rank(T)=5.                               (4.3)

We next check immersion without a general-position assertion. In either decomposition call the matrix factors P_i and the third vectors c_i. A third-factor basis change takes c_i to f_i. A tangent vector in the i-th pure-tensor cone can be written

    delta P_i tensor f_i + P_i tensor delta c_i,

with delta P_i tangent to the rank-one matrix cone. If the sum of these five tangent vectors vanishes and delta c_i=sum_j h_ji f_j, then comparison of f_j coefficients gives

    delta P_j + sum_i h_ji P_i=0.

Therefore delta P_j belongs to L. By (3.3), delta P_j=lambda_j P_j. Independence of the P_i now gives h_ji=0 for i!=j and h_jj=-lambda_j. The i-th tangent vector itself is zero. The five pure-tensor tangent spaces consequently sum directly, giving differential rank

    5(3+3+5-2)=45                                             (4.4)

at both decompositions.

Embed the three factor spaces into C^6, by padding with zero coordinates. Choose complements of dimensions 3,3,1. In either decomposition the five first-and-second pair products are independent because they form a basis of L. The other two lists of pair products are independent because the c_i are a basis and all a_i,b_i are nonzero. Varying one factor into its complement therefore adds subspaces of dimensions 3*5,3*5,1*5 to the differential image. These three subspaces and the old image are mutually independent, distinguished by which factor lies in its complement. Each enlarged differential has rank

    45+15+15+5=80.                                           (4.5)

The unordered five-term source in format 6-by-6-by-6 has exactly that dimension, 5(6+6+6-2)=80. The differential is injective at both displayed points. All hypotheses of Lemma 2 now hold with r=5 and n_1=n_2=n_3=6. Thus X is not S2 and O_{X,T} is not Cohen--Macaulay.

## 5. The homogeneous maximal ideal

For completeness, this local obstruction proves exactly the assertion about the cone vertex in TR-25. Let S=C[z_1,...,z_216] and A=S/I(X), of dimension80. If A_m were Cohen--Macaulay at the homogeneous maximal ideal, its minimal graded free resolution over S would have length216-80=136, by Auslander--Buchsbaum. Localization at that maximal ideal retains minimality of a graded resolution. Localize the resulting finite resolution at any prime P containing I(X). Then

    depth A_P >= dim S_P-136 = dim A_P.

The last equality is the height/dimension formula in the polynomial ring for the prime ideal I(X). Hence every such local ring would be Cohen--Macaulay, contrary to Section4 at T. Therefore depth A_m<80, as claimed. □

## Exact verification and dependencies

The written proof is complete using the six determinants (3.4)--(3.5). The primary independent finite certificate is witness.json with check_witness.py. It reads explicit integer factors and verifies equality, distinctness, flattening rank five, pair-product ranks five, and tangent ranks45 and80 at both decompositions. Modular rank over a proved prime supplies exact lower bounds for the rational ranks; the scaling kernels give matching upper bounds. This is exact finite-field arithmetic, not floating-point screening. Ordinary and optimized runs agree, and deliberately altered equality, rank, and distinctness inputs are rejected.

A separate implementation, check_five_term_tensor.py, constructs the factors from M and checks the same tangent ranks modulo a different prime (101). It shares no code with the primary checker.

Standard results used, with their exact roles, are: finite normalization for varieties over C; smooth free finite-group quotients in characteristic zero; the quasi-finite birational form of Zariski's Main Theorem for a normal target; normal domains satisfy S2; the depth lemma; and Auslander--Buchsbaum for regular local rings. No recent preprint, numerical output, unpublished assertion, or theorem about generic tensor identifiability is needed for the proof.
