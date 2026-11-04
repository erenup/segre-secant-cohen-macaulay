# Transfer of the TR-25 mechanism and its limitations

This note gives a structural test of whether the proved TR-25 witness or its finite-decomposition ambiguity mechanism gives a counterexample to Haiman or Artin--Hochster. No such counterexample is asserted.

## A. Full-rank identifiability and the witness support

### A1. Elementary full-rank identifiability

Let k be any field, let A,B,C be finite-dimensional k-vector spaces, and suppose

    T = sum_{i=1}^r a_i tensor b_i tensor c_i

is a decomposition into nonzero pure tensors with each flattening of T of rank r. Then the three lists (a_i), (b_i), (c_i) are linearly independent. Indeed the image of the A flattening is contained in span(a_i), so its rank r forces dim span(a_i)=r; the other factors are identical. Restricting to these three r-dimensional support spaces and changing bases sends T to Delta_r=sum e_i tensor e_i tensor e_i.

Every other r-term decomposition of Delta_r again has three independent factor lists. The flattening Delta_r:A* -> B tensor C has image L=span(e_i tensor e_i). Independence in the alternate A list implies that each alternate B--C pair belongs to L. The nonzero rank-one elements of the diagonal matrix space L are exactly the r coordinate lines: a diagonal matrix has rank equal to its number of nonzero diagonal entries. Independence of alternate B--C pairs forces each coordinate line to occur once. Comparing coefficient vectors in A then fixes the pure summands. Thus the r-term decomposition is unique up to order and factor rescaling.

PROVED, for every r>=1 and every field: a tensor of ordinary rank r and multilinear rank (r,r,r) has a unique unordered r-term decomposition.

This statement does not cover a border-rank-r tensor of ordinary rank greater than r.

### A2. Exact support of the TR-25 witness

The witness has T=sum_{i=1}^5 Q_i tensor f_i, where Q_1,Q_2,Q_3 have their nonzero rows in the three distinct coordinate row directions and Q_4,Q_5 are nonzero column matrices. The third flattening has rank 5 because Q_1,...,Q_5 are independent. The first and second flattening ranks are 3: each is at most 3 from the ambient 3x3x5 format, and each is at least 3 because an annihilating covector must annihilate every Q_i separately (the f_i are independent), including the first three Q_i, whose nonzero rows/row vectors span the two coordinate factor spaces. In the second factor the three rows of M are independent (det M=2). Thus the multilinear rank is (3,3,5), unchanged by padding into 6x6x6.

Consequently the witness is not of full multilinear rank (5,5,5) on its minimal border-rank-5 support. Any condition requiring the two 5-dimensional module factors in a tensor chart to have invertible contraction excludes this tensor: every contraction along any factor leaves a matrix of rank at most the smaller support dimension, which is at most 3 for every pair of factor spaces. In particular no contraction is a 5x5 isomorphism.

PROVED: the actual witness is outside every rank-5 invertible-slice chart, even after padding, basis changes, and permutation of factors.

### A3. Logical scope of a one-way implication

If universal secant aCM is denoted C and either downstream conjecture is denoted H, a theorem C => H permits the contrapositive not-H => not-C. The proved not-C gives no logical conclusion about H. An independent map transporting the local non-CM point, with suitable preservation/reflection of depth, would be required. Mere existence of a morphism, specialization, restriction, or degeneration is insufficient: Cohen--Macaulayness can change on a closed subvariety or under specialization.

### A4. The conductor proof is local to a specific normalization chart

The TR-25 argument uses a smooth normal source Y of unordered r-term decompositions, birational to the secant variety; two immersive points over one tensor provide distinct branches in the normalization. The source boundary on which conductor support is allowed is a union of factor-rank-drop loci. Their codimensions are n_j-r+1. With all n_j>=r+1 these are at least two, contradicting the divisorial conductor required by S2.

For factors of dimension exactly r this numerical codimension becomes 1. Thus merely replacing the large ambient tensor space by a rank-r chart destroys the key codimension-two estimate. On the full-rank part, moreover, A1 prohibits the two finite decomposition points outright. These are separate obstacles: the explicit witness is excluded by A2, and the global conductor codimension argument is not automatically inherited by a smaller chart.

A potential transfer would therefore need a new birational parametrization of the relevant Quot/Hilbert component with two distinct quasi-finite points, plus proof that its non-isomorphism boundary through a selected point has codimension at least two. Neither follows from TR-25.

## B. Invertible-slice chart obstruction

The following strengthens A1 and applies directly to the usual module charts, where the first factor need not have dimension r or full flattening rank.

### B1. No two immersive rank-r decompositions on an invertible-slice chart

Let k be an algebraically closed field of characteristic zero, let dim B=dim C=r, and let T in A tensor B tensor C admit alpha in A* such that T_alpha:B* -> C is an isomorphism. Suppose T admits a decomposition into r nonzero pure summands. Then precisely one of the following occurs:

1. T has a unique unordered r-term pure-tensor decomposition;
2. every r-term pure-tensor decomposition belongs to a positive-dimensional family of such decompositions, and the differential of the addition map on the smooth unordered distinct-summand source is not injective there.

Proof. In any r-term decomposition T=sum a_i tensor b_i tensor c_i, invertibility of T_alpha forces every alpha(a_i) nonzero and both lists (b_i),(c_i) to be bases. Absorb alpha(a_i) into b_i and normalize alpha(a_i)=1. For beta in A*, the endomorphism

    X_beta = T_beta composed with T_alpha^{-1}: C -> C

is diagonal in the basis (c_i), with eigenvalues beta(a_i). Its joint eigenspaces are E_a=span{c_i:a_i=a}. The distinct normalized labels a are intrinsic: they are the joint eigenvalue characters beta -> beta(a). Thus if all labels are distinct, each c_i line is intrinsic, and T_alpha then fixes the paired b_i line and coefficient; the summands of T are unique up to order.

If a_1=a_2=a, replace the two summands by the family

    a tensor (b_1+t b_2) tensor c_1
      + a tensor b_2 tensor (c_2-t c_1).

Their sum is constant. For t near 0 all factors remain nonzero and the summands remain pairwise distinct because the B and C factors are bases. At t=0 the two nonzero pure-cone tangent vectors are

    a tensor b_2 tensor c_1,    -a tensor b_2 tensor c_1.

Their sum is zero, providing a nonzero kernel vector for the addition differential; quotient by the finite free permutation action does not remove this tangent vector. The curve is nonconstant modulo permutations and hence gives a positive-dimensional fiber through the decomposition. If some labels repeat for one decomposition, the intrinsic joint eigenspaces have dimension greater than one. Every decomposition must choose a basis in them, so the same argument applies to every decomposition. This proves the dichotomy.

The same proof works over any infinite field when formulated for decompositions over that field; the displayed C/characteristic-zero version is all that is used here.

PROVED: on every invertible-slice chart, the specific hypothesis “two distinct immersive rank-r decompositions of the same tensor” is impossible. This excludes transplanting the TR-25 decomposition-source proof to that chart. It does not prove that the chart, a corresponding Quot scheme, or a corresponding Hilbert component is S2 or Cohen--Macaulay; ordinary-rank-greater-than-r boundary points remain outside this argument. No assertion is made here about nonreduced scheme structures.

## C. Relation to concise secants and Hilbert and Quot schemes

### C1. The Jagiella--Jelisiejew dictionary

Primary source: Jakub Jagiella and Joachim Jelisiejew, *Unrestrictions and concise secant varieties*, arXiv:2604.24879v3 (arXiv stamp 19 September 2026; manuscript date 22 September 2026).

- Proposition 3.20, equation (3.4), pp.21--22, describes framed unrestrictions by a concise tensor Ttilde on r-dimensional W_i and restriction maps phi_i with open intermediate conciseness conditions.
- Theorem 3.25, equation (3.8), pp.25--26, gives smooth maps from framed arithmetic concise secant to the arithmetic concise secant and to the concise locus of the ordinary secant in W_1 tensor ... tensor W_d. The analogous projective diagram is (3.10). Remark 3.27 warns that the maps denoted smooth equivalences need not be surjective in every format; no surjectivity beyond the explicit points used below is assumed here.
- Section 3.6.1, p.27, says that sufficiently 1-generic tensors correspond to multiplication tensors in modules or algebras. For d=3, one generic coordinate means an invertible slice between the two r-dimensional module factors. The proof of Theorem 1.3, pp.28--29, explicitly allows multiplication tensors nonconcise in the first factor and says they are concise in the other two factors.
- The full deformation dictionary is described informally before Proposition 3.28; the displayed proposition itself states the equivalence of smoothness. The preprint cites [GJLM25] for the smoothness statement and [JLP24, §2] for the dictionary. The structural obstruction proved in B1 does not depend on either cited result.
- Conjecture 3.32, p.29, is the universal secant aCM conjecture. The following paragraph says that it contains the CM assertions for Quot schemes on A^2 and smoothable Hilbert components, via smooth equivalences. This does not supply an implication in the reverse direction.

Thus B1 applies to precisely the broader chart highlighted on pp.28--29, without incorrectly assuming the first factor is concise. A1 alone would have been too narrow to treat that broader chart.

### C2. The two witness unrestrictions are smooth points, not CM counterexamples

For either displayed TR-25 decomposition T=sum_{i=1}^5 a_i tensor b_i tensor c_i, set W_i=k^5 and

    Ttilde=Delta_5,  phi_1(e_i)=a_i,  phi_2(e_i)=b_i,  phi_3(e_i)=c_i.

These satisfy the framed unrestriction conditions (3.4): Delta_5 is concise; after phi_3 the first two flattenings still have rank 5 since the remaining coordinate vectors e_i separate the summands and each c_i is nonzero; after phi_2 and phi_3 the first flattening still has rank 5 since the pair products b_i tensor c_i are independent (the c_i are a basis). The final restriction is T. Hence both are actual points in the framed concise secant.

The unit tensor Delta_5 is a smooth point of sigma_5(k^5 tensor k^5 tensor k^5). Here is a direct proof. The image of the locus of decompositions with all three factor lists bases is the GL_5^3 orbit of Delta_5. It is dense in the secant because the source locus is dense. Its stabilizer has dimension 10 (two independent diagonal scalings per summand, plus the finite permutation group), so its orbit has dimension 75-10=65, the parameter-count bound 5(5+5+5-2). A group orbit is locally closed; a dense locally closed orbit is open, and in characteristic zero this orbit is smooth. Thus Delta_5 lies in the smooth open orbit.

Near either framed witness lift, the framed concise secant is an open subset of

    sigma_5(k^5 tensor k^5 tensor k^5)^{conc}
         x P Hom(W_1,V_1) x Hom(W_2,V_2) x Hom(W_3,V_3),

with the displayed projection onto the first factor. The first Hom factor is projectivized, as required for the projective framed concise secant; the arithmetic framed version instead uses Hom. This follows directly from (3.4): the only equations are those of sigma_5, while all other conditions are open. The first factor is smooth at Delta_5; therefore both framed points are smooth. Smoothness descends through the principal GL_5^3 bundle to the unframed concise secant. The two unframed lift points are distinct: an identification would preserve Delta_5 and hence, by A1, permute its five pure summands, making the two original unordered decompositions equal, contrary to the explicit witness.

PROVED, using the source's explicit framed construction checked above: the two decomposition points giving the non-S2 secant singularity lift to distinct SMOOTH points of the concise secant. Under the projection to the concise tensor factor they both map to the SAME smooth unit tensor Delta_5. Consequently passing to these unrestrictions removes the local defect used by TR-25; it does not transport it to a singular minimal-border-rank tensor.

In the algebra dictionary Delta_5 is the multiplication tensor of the semisimple algebra k^5 (up to the standard identifications of dual coordinate factors). Embedded reduced configurations of five distinct points are smooth points of the Hilbert scheme: on the locus of distinct support the Hilbert scheme is the finite free symmetric-group quotient of the configuration space in the smooth ambient affine space. Thus the natural algebra supplied by either witness decomposition is also smooth on the Hilbert side. This gives a concrete explanation, beyond the logical non-implication, for why the present ambiguity does not produce a Haiman counterexample.

Equivalently, in the usual abstract secant picture the two decompositions give distinct reduced length-five subschemes Z_1,Z_2 of the Segre product. The Hilbert scheme remembers Z_i, whereas the map to the tensor secant forgets it. Two smooth source points may have one singular image; the CM failure of the image need not be a CM failure in that Hilbert scheme.

### C3. Haiman's original conjecture is stronger than the paraphrase

Primary source: Mark Haiman, *Hilbert schemes, polygraphs and the Macdonald positivity conjecture*, arXiv:math/0010246, published JAMS 14 (2001), 941--1006. In §5.2, p.59, Conjecture 5.2.1 says exactly:

> For all d and n, the isospectral Hilbert scheme X_n(C^d) over the principal component H_n(C^d) of Hilb^n(C^d) is normal and Cohen--Macaulay.

The next paragraph says that, since H_n(C^d)=X_n(C^d)/S_n, the conjecture implies that H_n(C^d) itself is normal and Cohen--Macaulay.

Therefore the JJ phrase “Haiman's conjecture ... on the Cohen--Macaulayness of Hilb^sm” refers to a consequence/weaker assertion. Distinguish:

- H_full: normality and CM of every isospectral X_n(C^d), the literal original Conjecture 5.2.1;
- H_CM: CM of every smoothable/principal Hilbert component H_n(C^d).

The primary Haiman text gives H_full => H_CM. The cited JJ passage gives universal-secant-aCM => H_CM; it does not by itself prove universal-secant-aCM => H_full. Our non-CM secant gives no negation of either H_full or H_CM.

No current-status claim about either conjecture is inferred from these old/new papers alone. This note establishes only what the stated TR-25 proof does and does not imply.

### C4. Artin--Hochster is a scheme statement

In Samuel Stark, *On the Quot scheme Quot^l_S(E)*, arXiv:2107.03991v3 (2 May 2026), pp.15--16, Stark defines the commuting scheme C(gl(V)) by the entries of [x,y]=0, and Conjecture 3.2 (Artin--Hochster) says that this SCHEME is Cohen--Macaulay. The immediately following sentence says that reducedness was not known at the time of that version. Theorem 3.2 identifies Quot^l_{A^2}(O^{q}) with a quotient of the stable open U in C(gl_l) x (k^l)^q by a principal GL_l bundle. Hence scheme-level CM of the commuting scheme implies CM of all such Quot schemes by smooth base change, restriction to an open, and smooth descent. Conversely, if all ranks q are allowed, choose q=l and restrict to tuples of framing vectors forming a basis; this gives an open isomorphic to C(gl_l) x GL_l, with every point stable. CM of the corresponding Quot schemes therefore implies CM of C(gl_l) by smooth descent. This verifies the precise all-l/all-q equivalence from the displayed quotient presentation, retaining the full scheme structures.

Meanwhile JJ Definition 3.14(a), p.18, explicitly defines the minimal border rank locus as the largest REDUCED closed subscheme with the stated pointwise border-rank property. One must distinguish that variety and principal/smoothable components from the full commuting/Quot schemes. This argument does not establish every scheme-theoretic identification needed for the full implication quoted by JJ, and does not claim the implication is false. Its conclusion is narrower and sufficient: neither the reduced TR-25 witness nor its conductor proof supplies a non-CM point on the full Quot/commuting scheme, and one cannot identify the relevant scheme structures by agreement of their closed points alone.

## D. Exact conclusions and the missing ingredient

Conclusions:

1. Full multilinear rank (r,r,r) plus ordinary rank r implies unique unordered r-term decomposition (A1).
2. The TR-25 witness has multilinear rank (3,3,5); every slice has rank at most 3, so it is outside all rank-five invertible-slice charts (A2).
3. In any invertible-slice chart with two r-dimensional factors, an r-term decomposition is either unique or has a nonzero tangent kernel. In particular two immersive r-term decompositions cannot exist there (B1).
4. Using the explicit framed construction, both witness decompositions lift to smooth concise-secant points lying over the smooth unit tensor Delta_5; the associated algebra is k^5, giving smooth reduced Hilbert points (C2).

Source distinctions:

- universal-secant-aCM => downstream CM is one direction; its failure supplies no downstream failure;
- original Haiman 5.2.1 concerns isospectral normality and CM, with CM of the principal Hilbert component a weaker consequence;
- Artin--Hochster concerns the full commuting scheme and equivalently all surface Quot schemes via the stable framed presentation; reduced varieties alone do not settle its scheme structure.

The exact missing ingredient for a tensor-chart counterexample to the smoothable-Hilbert CM assertion is a PROVED non-CM local ring at a fully concise minimal-border-rank multiplication tensor of a smoothable finite algebra, together with the appropriate local deformation equivalence. Such a tensor would have ordinary rank strictly greater than its border rank: ordinary rank r and all supports r put it in the smooth unit-tensor orbit. The present two finite decompositions do not provide this tensor.

For surface Quot, a suitable non-CM point must first lie in the module/invertible-slice chart and one must verify the full scheme-level equivalence. B1 proves that the exact two-immersive-decomposition/conductor mechanism cannot produce such a point there, even when the first factor is nonconcise. A different source of normalization branches, non-semisimple module degenerations, or an independent depth obstruction would be required. This is a structural obstruction to this route, not a proof of either downstream conjecture and not an obstruction to all conceivable conductor arguments.
