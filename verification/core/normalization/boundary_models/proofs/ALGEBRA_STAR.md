# Normality of the star graph algebra

Work over C. All index ranges are finite, and an index range of length zero contributes no variables or generators.

## 1. Statement

Let k,alpha,beta>=0 be integers. Let

    t,p,q_j,x_j,z_j,u_h,v_ij
    (1<=j<=k, 1<=h<=beta, 1<=i<=alpha)

be algebraically independent. In the Laurent polynomial ring with t inverted, define

    G_j=(p z_j+q_j x_j)/t,
    P_h=p u_h/t,
    Q_ij=q_j v_ij/t.

Set

    R=C[t,p,q,x,z,u,v,G,P,Q].                              (1)

**Theorem.** The domain R is normal for every k,alpha,beta>=0. Its dimension is

    d=2+3k+beta+alpha*k.                                   (2)

At the homogeneous point where all displayed generators of R vanish, its embedding dimension is

    N=2+4k+2beta+2alpha*k.                                 (3)

The tangent-space excess is k+beta+alpha*k. That point is smooth exactly when k=beta=0.

These conclusions concern the exact subalgebra (1). An algebra defined only by the unsaturated numerator equations is not substituted for it.

## 2. Coefficient algebra and leading terms

The elements

    H_ij=p z_j v_ij/t=v_ij G_j-x_j Q_ij                    (4)

already belong to R. Let

    B=C[t,p,q,x,z,u,v,P,Q,H].

This is a monomial algebra, and R=B[G_1,...,G_k]. Give every q_j degree one and every other free variable degree zero. Thus Q_ij has degree one, while P_h and H_ij have degree zero. The leading term of G_j is

    E_j=q_j x_j/t,                                        (5)

and its lower-degree term is p z_j/t. We will prove that the associated graded algebra of R for total q degree is the monomial algebra

    A=B[E_1,...,E_k].                                     (6)

## 3. Denominator ideals at every intermediate stage

For S subset {1,...,k}, write B_S=B[E_l:l in S]. Fix j not in S. In this monomial algebra, the only fractional generators consuming q_j are Q_ij, and x_j occurs only as a free variable. The earlier E_l have l!=j, so these assertions remain true at every stage.

For every n>=0 define

    D_(j,n)={b in B_S : b E_j^n belongs to B_S}.

Then

    D_(j,n)=(t,v_1j,...,v_(alpha,j))^n                     (7)

as ideals of B_S. When alpha=0, the right side is (t^n).

To prove this, first take b to be a Laurent monomial of B_S and choose a representation of bE_j^n by its monomial generators. Let s be the number of Q_ij factors with this fixed j, counted with multiplicity. If b has q_j exponent a_q and x_j exponent a_x, the representation has exactly a_q+n-s free q_j factors and a_x+n free x_j factors. Both a_q and a_x are nonnegative.

If s>=n, remove n such Q factors and n free x_j factors. Their product is q_j^n x_j^n times a degree-n monomial in v_(.,j), divided by t^n. The remaining generator expression is b divided by that v monomial and lies in B_S. Thus b belongs to the right side of (7).

If s<n, remove all s such Q factors, n-s free q_j factors, and n free x_j factors. Enough free q_j factors exist because a_q+n-s>=n-s. The remaining product equals b divided by t^(n-s) times the degree-s v monomial from the removed Q factors. Again b belongs to the right side of (7).

Conversely,

    tE_j=q_j x_j,   v_ij E_j=x_j Q_ij

belong to B_S. Any product of n generators of (t,v_(.,j)) therefore lies in D_(j,n). Finally, multiplication by the monomial E_j^n preserves distinct Laurent monomials, so membership is termwise. The monomial argument proves the full ideal equality (7).

## 4. The complete multivariate kernel

The kernel of B_S[Y_j]->B_S[E_j] is

    (tY_j-q_j x_j, v_ijY_j-x_jQ_ij : 1<=i<=alpha).         (8)

Indeed, group polynomial terms with equal Laurent images. Every kernel element is a linear combination of binomials bY_j^n-cY_j^m. After cancelling a common Y_j power, it suffices to consider bY_j^e-c with c=bE_j^e in B_S. By (7), some product g_1...g_e of e factors chosen from t,v_(.,j) divides b in the monoid of B_S. Write b=b'*g_1...g_e and set h_l=g_lE_j. Each h_l is q_j x_j or x_jQ_ij. The product telescoping identity expresses

    b'[(g_1...g_e)Y_j^e-h_1...h_e]

as a combination of the linear relations g_lY_j-h_l. Multiplying back the cancelled Y_j power proves (8). This proves equality before localization; higher powers and torsion relations are included.

Adjoin E_1,...,E_k in order. At each stage the relative kernel (8) has generators whose coefficients lie in the original B. Taking its preimage in the preceding polynomial presentation therefore adds precisely these generators to the already known kernel. Induction gives the full multivariate equality

    ker[B[Y_1,...,Y_k] -> B[E_1,...,E_k]]
      =(tY_j-q_j x_j, v_ijY_j-x_jQ_ij : all i,j).          (9)

Thus cross-relations involving several Y_j are included. Relations internal to B are already identities in the coefficient algebra.

## 5. Terminating leading-degree reduction

Give each Y_j weight one, in addition to the total-q grading on B. Every generator in (9) is homogeneous of weight one. Replacing Y_j by G_j gives the exact identities

    tG_j-q_j x_j=p z_j,
    v_ijG_j-x_jQ_ij=H_ij,                                 (10)

whose right sides belong to B and have weight zero.

Take f in R and represent it by F in B[Y_1,...,Y_k]. Let d be the largest weight appearing in F. If its weight-d piece survives after substituting E, that image is the leading part of f and lies in A. If it cancels, that homogeneous piece belongs to (9). Express it using homogeneous coefficients of weight d-1 times the displayed weight-one kernel generators. Upon substituting G, replace these generators by the weight-zero remainders (10). This gives a representation of the same f with strictly smaller largest weight. The weights are nonnegative integers, so the process terminates.

Every leading part of an element of R therefore belongs to A. Conversely the generators of A are leading parts of the corresponding B generators or G_j. This proves (6). The same reduction shows that every f of degree at most d has a representation of weighted degree at most d using the enlarged generating family consisting of the monomial generators of B and the G_j. In particular the H_ij are included as explicit weight-zero generators. This will ensure finite generation of the weighted Rees algebra below.

## 6. Saturation by integral network flow

Write a proposed exponent vector as t exponent K and nonnegative other exponents

    a_p,a_(q_j),a_(x_j),a_(z_j),a_(u_h),a_(v_ij).

The negative-t generators of A are P_h,E_j,Q_ij,H_ij. Their nonnegative multiplicities must satisfy

    sum_h P_h'+sum_(i,j) H_ij' <= a_p,
    E_j'+sum_i Q_ij' <= a_(q_j),
    E_j' <= a_(x_j),
    sum_i H_ij' <= a_(z_j),
    P_h' <= a_(u_h),
    Q_ij'+H_ij' <= a_(v_ij).                               (11)

Let N' be the total number of these generators. The t exponent can be K exactly when N'>=-K: the free t multiplicity is then K+N'. Unused resource exponents are supplied by free variables.

The inequalities (11) are realized by a single-commodity network:

- Source to p has capacity a_p, and source to q_j has capacity a_(q_j).
- p to u_h is unrestricted; u_h to sink has capacity a_(u_h).
- p to gate_j has capacity a_(z_j); gate_j to v_ij is unrestricted.
- q_j to x_j is unrestricted; x_j to sink has capacity a_(x_j).
- q_j to v_ij is unrestricted; v_ij to sink has capacity a_(v_ij).

The four source-to-sink path types are P,H,E,Q. Every unrestricted edge can be given the finite capacity a_p+sum_j a_(q_j). For integer exponent data all capacities are integral. Integral max-flow therefore supplies integer multiplicities whenever real multiplicities reach a prescribed integer demand -K>0. Deleting unit paths permits any smaller required nonnegative integer flow value. If K>=0, the free-variable representation already suffices.

The cone of the exponent monoid is exactly the real-feasible region just described: a real generator expression gives a feasible packing, and a packing together with unused resources gives a real generator expression. Thus every integer lattice point of this cone has an integer generator expression. The lattice is the full integer lattice because every free variable is present. Consequently

    monoid(A)=cone(A) intersect its integer lattice.        (12)

The monoid is saturated, and A is normal. One direct form of the standard monoid-algebra normality criterion is to intersect the Laurent polynomial ring with the monomial valuation rings supplied by the rational facets of the cone. The intersection consists exactly of the monomials in (12). Each constituent ring is integrally closed, so the intersection is integrally closed. This also covers all empty index ranges.

## 7. Normality of the original algebra

Let F_dR be the elements of total q degree at most d, and form

    Rees=direct_sum_(d>=0) F_dR * xi^d.

By Section 5 this is a finitely generated C-domain: it is generated by xi, the weight-zero elements t,p,x,z,u,v,P,H, and q_j*xi,Q_ij*xi,G_j*xi. Including H explicitly is necessary because its cancellation expression (4) has higher weight before cancellation. Its grading is nonnegative. Moreover

    Rees/(xi)=gr(R)=A,
    Rees[xi^(-1)]=R[xi,xi^(-1)].                             (13)

The special fiber A is normal by Section 6, and xi is a nonzero homogeneous element of positive degree. The graded consequence proved in [DEFORMATION_LEMMA.md](DEFORMATION_LEMMA.md) therefore shows that Rees is normal. Its proof uses the finite-normalization local lemma along xi=0 and then the nonnegative grading action to exclude a nonnormal locus away from that fiber; no properness of the family is assumed.

Localizing (13) gives a normal Laurent polynomial ring R[xi,xi^(-1)]. An element of Frac(R) integral over R belongs to this ring by normality, and, being independent of xi, belongs to R itself. Thus R is normal.

## 8. Dimension and the homogeneous point

After inverting t, the fractional generators G,P,Q are eliminated. Hence R has the rational function field of its independent free variables and dimension (2).

For the grading in this section, give ALL free variables t,p,q,x,z,u,v degree one. Each original generator G,P,Q is then also homogeneous of degree one, whereas H has degree two. The ring R is generated by its displayed degree-one elements, and its degree-zero part is C. Their common zero is therefore a well-defined homogeneous maximal ideal.

There is no linear relation among these original generators. The free variables and P,Q are distinct Laurent monomials. Each G_j contains the monomial pz_j/t, which occurs in no other original generator; its coefficient in a linear relation must vanish. The remaining distinct monomials also have zero coefficients. The original degree-one generators therefore form a basis of the cotangent space at the homogeneous point.

There are 2+3k+beta+alpha*k free variables and k+beta+alpha*k fractional generators G,P,Q. This gives (3) and tangent excess k+beta+alpha*k. It is positive whenever k>0 or beta>0. If k=beta=0, the algebra is simply C[t,p], independently of alpha, and is smooth. The theorem follows. ∎
