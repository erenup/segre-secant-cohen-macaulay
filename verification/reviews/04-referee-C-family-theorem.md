# Referee report C: the family theorem

Reviewed: the family statements and proofs now in verification/core/families/proofs/, the finite-case proof now in verification/core/proofs/PROOF.md, and the exact checks of the rank-five witness now in verification/core/verification/.

## Verdict: ACCEPT

I accept the full stated theorem, with **no mathematical corrections or range restrictions**:

For every integer **r≥5**, and every triple admitting an ordering with **a,b≥3, a+b≥r+2, c≥r**, the reduced affine complex border-rank variety X_r(a,b,c) is **not S2** and **not Cohen–Macaulay**. Its dimension is

    D = r(a+b+c−2).

The construction gives an explicit integer tensor of ordinary and border rank exactly r with a non-CM local ring. The homogeneous vertex has depth strictly below D. The proof covers both boundaries **a+b=r+2** and **c=r**, and all factor permutations.

In particular I accept X_5(3,4,5), dimension **50**, with vertex depth **<50**; X_r(3,r−1,r), dimension **2r²**; and every unit-tensor orbit closure X_r(r,r,r), dimension **3r²−2r**, for r≥5. The family includes the earlier rank-five 6×6×6 case, dimension 80. The projective varieties are locally non-CM at the displayed nonzero tensor classes.

“Smallest” here means smallest format in the accepted sufficient range. This is not a classification of all non-CM tensor secants, does not decide X_5(3,4,4) or X_5(4,4,4), and does not claim a specific depth at the nonzero witness or depth below two there. Failure of S2 for its local ring can occur at a localization. This report supplies one independent review.

## Material reviewed and independence

All **17** manifest entries of the reviewed files, complete coverage and absence of symlinks were verified, and all entries were reverified unchanged after execution. Mathematical reading was confined to the statements and proofs (now in verification/core/families/proofs/ and verification/core/proofs/). Checker inspection used only the permitted verification code/data (now in verification/core/verification/). No internal reviews of the author or notes outside the reviewed files were opened, the author was not contacted, and no author files were modified. No other referee's review was read and no other referee was contacted.

I wrote an initial reconstruction plan, then independently rederived the geometry and witnesses before reading the detailed derivations of the supporting sub-auditors of this review. Short status messages were received during that work; no claim of total blindness to those messages is made. The separate geometry, witness and public-source notes were independently written and fixed. They agree with my reconstruction and contain the proofs, rather than treating agreement as evidence.

My derivation and the supporting notes were fixed together before any supplied checker was inspected or executed.

## Primary-source scope check

Both required public sources were independently fetched successfully, with browser User-Agent, URL/time/hash receipts and inert PDF/text copies:

* Luke Oeding, [arXiv:1603.08980](https://arxiv.org/abs/1603.08980), Conjecture 1.1: all secant varieties of Segre products of projective spaces are arithmetically Cohen–Macaulay.
* Jakub Jagiełła and Joachim Jelisiejew, [arXiv:2604.24879](https://arxiv.org/abs/2604.24879), v3, Conjecture 3.32: the same conjecture, explicitly identified with Cohen–Macaulayness of the affine cone.

The reduced affine complex varieties in the package are exactly within these conjectures. The result does not replace them by a nonreduced candidate ideal or a different component. The newer paper's positive results for **concise secant varieties**, and its results about normalizations, concern different spaces and do not contradict the present ordinary-secant theorem. Oeding's stated positive cases with a two-dimensional factor and for lower-rank families also do not cover the accepted range. Detailed quotations and source distinctions were written out in an independent source derivation and comparison.

## Decisive mathematical checks

**The pair-subset condition has the required strength and codimension.** For rank-one matrices P_i=a_i b_iᵀ, assume rank(A_J)+rank(B_J)≥|J|+2 for every subset of size at least two. Sylvester's inequality implies any combination supported on at least two terms has rank at least two. Thus the P_i are independent and their span contains exactly the listed projective rank-one directions. After quotienting A and B by the factors of P_i, the same inequality shows that its affine tangent intersection with the span is precisely CP_i. The projective intersection is consequently finite with zero tangent spaces; Nakayama makes every local Artinian algebra a field. This establishes exactly r **reduced scheme-theoretic** intersection points.

For a subset of size t and rank bounds x,y, the bad locus has determinantal codimension

    (a−x)(t−x)+(b−y)(t−y), with x+y≤t+1.

Generic ranks satisfy the required inequality throughout a,b≥3 and a+b≥r+2. Codimension one would force a=t, x=t−1 and y=min(b,t)≥3, or the symmetric case, contradicting x+y≤t+1. Every bad stratum therefore has codimension at least two, including when a+b=r+2. The finite union, smooth torus descent and free finite permutation quotient preserve this bound.

**The target smoothness argument is valid, including its flatness step.** Let H be the reduced Grassmannian closure of spans of r independent two-factor Segre points. At a span L with precisely r reduced intersection points, the projective incidence of a Segre point in the varying span becomes finite near L. Its generic rank is r. Over the integral local ring R=O_(H,L), its finite algebra F has a length-r closed fiber. Nakayama gives R^r↠F; equal generic ranks make the kernel torsion, while it is a submodule of a free module over a domain, so it is zero. Hence F is free. This uses neither smoothness nor normality of H in advance.

The finite flat incidence is etale near the reduced characteristic-zero fiber. Ordering its r points gives a finite etale cover identified with an open of the smooth configuration space of independent Segre points. The inverse maps are genuine morphisms: r distinct sections exhaust the finite etale degree-r incidence, and their span recovers the Grassmannian point. Smoothness descends, yielding dim H=r(a+b−2). On the full third-flattening-rank stratum, the reduced secant is the bundle of surjections C*→L restricted to H. Equality follows by taking reduced closures in local bundle charts. Thus the good tensors are smooth points of the actual reduced secant, and dim X_r=D.

**The source restriction handles c=r.** The entire decomposition source Y consists of r nonzero pure tensors with independent third-factor vectors, modulo the free symmetric group action. It is a smooth irreducible dense source open of dimension D. Its good subset imposes only the pair-subset criterion, so its complement has codimension at least two. No false codimension-two assertion is made about the third-factor determinant boundary at c=r: that boundary is excluded from Y from the outset. At good tensors, the r rank-one directions of the flattening image uniquely determine all pure summands. The addition morphism is therefore generically one-to-one and, in characteristic zero, birational.

**The all-r integer witnesses and their tangent blocks work.** The six core row/negative-column matrices from

    M = [[1,1,1],[1,2,3],[1,4,9]]

have a unique relation, their sum zero; any five are independent. I independently expanded all six tangent determinants: −1/18, 1/3, −2 for rows and −1/18, 4/9, −3/2 for columns. These prove the scalar-line tangent intersections for both rank-five decompositions.

For p,q≥3 with p+q=r+1, add p−3 rows u_s⊗v(s+3) and q−3 columns v(t+3)⊗w_t, where v(t)=(1,t,t²). Both avoidance identities for the core span follow from the displayed row equations and the nonzero determinant −t(t−1)(t−3)/6. At every core or added matrix, direct block comparison eliminates every tangent component except its scalar line; empty added lists cause no exception. Appending the same new terms with separate third basis vectors gives two distinct r-term decompositions. Their matrix and third-vector lists are bases, so their ordinary and border ranks are exactly r. Comparing tangent vectors in the third basis proves injection on the pure-tensor source itself; the within-term scaling ambiguity is not counted as a genuine tangent kernel.

For every target format, one can take p=max(3,r+1−b), q=r+1−p. Then p≤a, q≤b and p,q≥3. At a+b=r+2 the seed uses exactly one fewer total A/B dimension, and padding contributes the missing r tangent directions. In general, padding contributes r(a−p), r(b−q), r(c−r), in mutually disjoint complement blocks. Independence of the opposite-factor pair products proves that no new tangent kernel appears. Thus both source points have differential rank D throughout the stated range. Factor permutations are linear isomorphisms preserving all the relevant objects and local-ring properties.

**The conductor contradiction supplies the missing S2 implication.** Two immersive decompositions alone would not establish non-S2. Here the normal source Y lifts birationally to the finite normalization Xbar. At the witnesses the maps are quasi-finite, and Zariski's Main Theorem identifies the quasi-finite locus with an open normalization chart. The two source points therefore give distinct normalization points over the same tensor.

For a hypothetical S2 local domain A=O_(X,T), its conductor I in the finite normalization B identifies with Hom_A(B,A) and is S2 as a B-module. An A-regular sequence of length two remains regular on this Hom by pointwise division; height preservation follows from the affine dimension formula for finite birational maps. A minimal conductor prime of height at least two would make B/I have depth at least one by the depth lemma, although its localization there is a nonzero zero-dimensional module. Hence every proper conductor point lies on a conductor divisor. The multiple normalization points make the conductor proper at each point over T.

In the identified source chart, normalization is an isomorphism over the good smooth-image locus, so conductor support is confined to a subset of codimension at least two. It cannot contain the required divisor through the witness. Localization to O_(X,T) does not remove that divisor: opens containing a point contain its generizations. The contradiction proves that this local ring is not S2 as a ring and is not CM. No assumption of globally finite decomposition fibers or global codimension-one smoothness of X is required.

Finally, if the graded vertex local ring were CM, its minimal graded ambient-polynomial resolution would have length abc−D by Auslander–Buchsbaum. Localizing this resolution and using the height formula would make every local ring CM, contradicting the witness. Thus the asserted vertex depth defect follows. A degree-one cone chart is a projective chart times G_m, giving the projective non-CM consequence.

## Ancillary statements and limits

I also checked the low-rank mechanism statement: for r≤4, an immersive decomposition forces independent opposite-factor pair lists. A support-dimension count forces a full flattening. A distinct decomposition would then produce a rank-one circuit of at most five points; its support ranks and the tangent intersection dimension bound contradict immersion. Thus rank five is first for this **three-factor mechanism**, not necessarily for every possible non-CM mechanism.

The adjacent family X_5(3,3,c) is correctly positive. For c≤5 it is ambient space. For c≥5, the seed differential and padding attain the dimension of the 9×c rank-at-most-five determinantal variety containing it, so the reduced varieties agree and are CM. This explains why embedding the raw ambiguous witness alone is insufficient.

The invertible-slice dichotomy was rederived: distinct normalized joint eigenvalue labels give unique summands; a repeated label gives an explicit constant-sum curve and nonzero tangent kernel. The primary JJ source supports the corrected projective framed chart and the smooth concise-secant lifts of the original witness. No Hilbert/Quot counterexample follows. Detailed historical Haiman/Stark citations are not independently certified by this two-source review and are unnecessary for the accepted family theorem.

## Exact verification and two new corruptions

After the mathematical derivation had been fixed, the unchanged supplied runner (an earlier version of verification/core/verification/run.py) was executed with `python3 -I -S -B` normally and with `-O`, in a separate copy preserving its proof/verification layout. Both runs passed with identical stdout and empty stderr. Together they performed **12 positive checker executions and 30 registered-control rejections**, covering normal, optimized and a second hash-seed mode. The five control types all reached their exact registered failure messages. Proof/verification hashes and inventories remained unchanged.

The primary checker (verification/core/verification/check_witness.py) uses exact integers, Fractions and column elimination modulo the trial-division-certified prime 1,000,003. It verifies tensor equality, nonzero/distinct directions, distinct decompositions, all pair-product ranks five, third flattening rank five, and tangent ranks **45** and **80** at both decompositions. The independent secondary checker (verification/core/verification/check_five_term_tensor.py) constructs the factors directly from M and uses separate row elimination modulo **101**. Modular ranks give characteristic-zero lower bounds; the two scaling directions per summand give matching theoretical upper bounds. There are no assert proof gates or inexact arithmetic, and optimized execution retains every rejection.

Two reviewer corruptions were added and rejected normally and under `-O`:

1. **Equality-preserving integer-data corruption:** replace M's third row by (15,10,9) and rebuild both decompositions from the same row/column relation. Tensor equality, distinct decompositions, all six pair ranks five and flattening rank five remain valid. Independent rational elimination gives tangent ranks **40,40** and padded ranks **75,75**. The primary checker rejects with `FAIL: small tangent rank must be 45`. This tests the decisive immersion condition while preserving the earlier certificate gates.
2. **Tangent-assembly corruption:** in a separate secondary-checker copy, omit every third-factor derivative column while retaining the unchanged tensor data and equality. Both modes reject with `small tangent rank`. This detects a structurally incomplete tangent calculation rather than a changed tensor equality.

Direct paired runs and complete commands, outputs, hashes and static audits were recorded in separate audits of the runner, the primary witness checker and the secondary checker. The official runner binds the two baseline proof files and the finite rank-five certificate; its historical source-hash column is metadata. It does not mechanically verify the new all-r proofs. Those are bound by the manifest of the reviewed files and supported by the independent written derivations above. No finite sampling is used to establish an infinite range.

## Value of the result

The accepted result is a strong infinite-family extension of the earlier counterexample to Oeding's universal aCM conjecture, with the stronger local failure of S2 and an explicit small-format example. The main new ingredients are the pair-subset rank condition with its codimension-two estimate, the finite-incidence smooth charts, and the mixed integer row/column construction that reaches a+b=r+2. The proof explains both the obstruction and the nearby positive 3×3×c family, while preserving the distinction between ordinary secants, concise secants and normalizations. Its value is not contingent on interpreting a finite tangent computation as a general theorem.
