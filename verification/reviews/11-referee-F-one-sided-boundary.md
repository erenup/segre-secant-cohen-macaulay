# Referee report F: the one-sided boundary model

Reviewed: theorem D with its proof and dependencies now in verification/core/normalization/boundary_models/proofs/ (STATEMENT_D.md, PROOF_D.md, DEPENDENCIES_D.md), and the exact checks now in verification/core/normalization/boundary_models/verification/.

This independent review was prepared separately from the other referee's review. I did not contact the author or open any author material outside the reviewed files. No author files were changed.

## Exact verdict and scope

ACCEPT theorem D in full, for every r>=6, a>=r-2, b>=3, a+b>=r+2 and c>=r over C, at the specified original one-sided added-row witness T_row:

- Rank and border rank are r, with exactly six actual unordered r-term decompositions.
- The finite normalization in the variety's own function field has exactly r+1 reduced points over T_row: six smooth decomposition points and r-5 boundary points.
- Each boundary germ has the stated normal toric model C[t,mu_i,z_ij,mu_i\*z_ij/t], ell=r-6 and m=b-3, up to the precisely described smooth and etale covers.
- The boundary points have dimension r(a+b+c-2) and embedding dimension that number plus (r-6)(b-3). They are smooth exactly when r=6 or b=3, and singular otherwise.
- The normalization map is unramified over a Zariski neighborhood of T_row. In the smooth cases, after shrinking, its whole source over that neighborhood is smooth.
- Transport under the stated factor permutations, including the one-sided column version, is valid.

No required mathematical corrections. This does not assert a canonical unframed coordinate isomorphism, cover mixed added-row/added-column witnesses, or give a global Cohen--Macaulay, depth or rational-singularity theorem for the normalization.

## Material reviewed and independent outline

The assignment named the statement file STATEMENTS.md, which is absent from the reviewed files; the actual STATEMENT_D.md matches the hash prefix given in the assignment exactly, so there is no ambiguity about the reviewed statement.

The reviewed statement and proof have SHA256 `adfad689af2540db78fe3fd382512e387309590437f1b1a3d59babf599fb77ec` and `b04258fc64f220c54b03c3bcdea51d65ce7bae42f1f96d514e5680d9078868ac`, the source hashes recorded for verification/core/normalization/boundary_models/proofs/STATEMENT_D.md and PROOF_D.md in verification/core/normalization/boundary_models/verification/SOURCE_BINDINGS.txt.

All 18 manifest entries were checked in the copied files before review and again after the checks. The accepted prior inputs are the unchanged snapshots included with the reviewed files; I checked their uses at the stated scope, not an assumed prior acceptance of D.

My independent outline was fixed before I opened the proof. Before fixing it I read only the statement and the assignment. The assignment named the review focus (embedded minors, Rees algebra, toric model, proper exhaustion), which is recorded. The outline independently proves the semigroup's saturation, toric normality and tangent excess, derives the framed residual monomials, and identifies the remaining scheme-theoretic and normalization obligations. Only then did I open the author's check summary, DEPENDENCIES_D.md, PROOF_D.md and the included prior snapshots.

## 1. Finite configurations, rank and generic birationality

The proof uses the accepted six-point core intersection at its exact scheme-theoretic scope. Its explicit elimination excludes all other complex rank-one directions; the scalar-only tangent intersections imply each projective local ring is C by Nakayama. The copied prior statement indeed asserts reducedness and padding, not merely a point enumeration.

For v(z), z>=4, the displayed determinant is nonzero, giving L0 intersect (A0 tensor C v(z))=0. The different v(z)'s are pairwise nonproportional and avoid the six core B-factor directions. A rank-one matrix with a nonzero added row must have that row's v-direction; other added rows and the core block then vanish. Padding contributes no additional rank-one points. The corresponding tangent argument at Q-points and R-points is valid in the full padded Segre. Thus the intersection is exactly r+1 reduced points.

Only the six-core relation survives after adding independent new rows. The six r-subsets omitting a Q are bases; the r-5 subsets omitting an R have rank r-1. The displayed tensor has C-flattening rank r and an r-term expression, proving both rank assertions. Any r-term decomposition must have independent matrix directions and third factors; hence it is one of those six bases, with uniquely determined tensor summands. No factor-scaling ambiguity creates extra decompositions.

For generic configurations, the inequality min(a,j)+min(b,j)>=j+2 for every 2<=j<=r follows from the hypotheses. Sylvester's inequality applied with nonzero coefficient diagonal makes every linear combination with support size at least two have matrix rank at least two. It excludes both linear dependencies and extra rank-one directions. The unordered span map is consequently generically one-to-one and birational in characteristic zero. Its dimension is r(a+b-2). This proof does not require an unproved general identifiability assertion.

## 2. Proper exhaustion, including nonreduced limits

The closure of the independent span graph inside Hilb^r(S) x H is irreducible, proper and birational over H. The containment condition Z subset P(K) is closed scheme-theoretically: the universal annihilator-to-O_Z(1) evaluation is zero on the dense independent graph, hence on its reduced closure. The fibre at L_r therefore lies in Hilb^r of the finite reduced r+1-point intersection. Its length-r subschemes are exactly the r-element subsets. This rules out colliding or infinitesimal configurations, rather than just failing to count them.

A fixed pair (Z,L_r) gives at most one graph point. The explicit epsilon arc realizes every dependent subset: the six deformed core matrices sum to epsilon R_s, their r columns are independent for epsilon!=0, and a basis with independent limits proves the limiting span is exactly L_r. Thus all r+1 possible graph points occur. The proof correctly postpones the assertion about normalization branches until local normality is established.

## 3. Embedded maximal-minor ideal and auxiliary cancellation

On the rank-(r-1) chart, row elimination identifies the full r-minor ideal with the remaining column's residual coordinates. This is equality of ideals. Introducing the r-1 relation coefficients gives J=(w,I), where w are differences from the unique coefficients solved by the invertible pivot minor. The five other core coefficients are units and can be absorbed in their factor vectors by an invertible change; no vanishing retained coefficient mu_i is inverted.

The Schur substitutions in (6) are invertible on the localized factor-vector chart. The first three A rows solve C0, and the first three B columns solve P; the unsolved block is exactly U' Delta (V')^t. The retained U' columns have an invertible ell-row minor. Applying its regular left inverse proves equality with the ideal of Delta(V')^t, including the reverse containment. There is no radical replacement here. The remaining entries are precisely mu_i\*z_ij.

The d0=3a+3b-9 eliminated block entries are independent coordinate equations L. At the witness mu=z=0, so the differential of J is spanned by dL. The w_j have r-1 independent differentials. An invertible coefficient minor on r-1 of the L directions lets one replace those L's by w, while retaining mu,z and all other variables. This preserves the ideal itself: express w as a linear combination of L and the mu\*z generators and invert the selected coefficient matrix in the local ring. Its invertible Jacobian gives the claimed etale coordinate chart. Restricting w=0 therefore preserves independent mu,z coordinates and gives exactly

 I=(x_1,...,x_kappa,mu_i\*z_ij),  kappa=3a+3b-r-8.

This is the principal embedded-structure check. The argument does not merely compare tangent cones or reduced dependence loci, and kappa is positive in the admissible range.

## 4. Saturated graph chart and the correct point

The rational span map is represented by maximal minors, so its graph is the blowup defined by the Rees algebra of I. On the smooth factor-vector and etale coordinate covers, flat base change preserves ideal powers and this graph description.

The omitted-row arc has nonzero residual first derivative in the R_s direction modulo the retained span. The quadratic mu\*z generators have zero first derivative, so a linear generator t can be chosen nonzero there and the remaining x's adjusted to vanish in that direction. Throughout the explicit arc all B factors lie in B0, hence V'=0 and every z_ij=0. Consequently all ratios mu_i\*z_ij/t tend to zero at the graph point. The slope coordinates x_j/t can be centered at zero. This identifies the point with the toric homogeneous origin, not an arbitrary point of the exceptional fibre.

The t-chart is the actual localization subalgebra O_F[x_j/t,mu_i\*z_ij/t] inside O_F[t^-1]. After eliminating x_j=t\*alpha_j it is a smooth factor times the specified toric algebra. Full t-saturation is retained. The proof expressly avoids the generally incorrect unsaturated presentation by only t\*w_ij=mu_i\*z_ij; its warning about additional determinantal relations is correct.

## 5. All-parameter toric normality and singularity

The exponent characterization (11) is exact. For negative t exponent -N, the integral capacities min(u_i,sum_j v_ij) allow an integer distribution N_i and then p_ij, with no divisibility obstruction. Thus every lattice point in the rational cone belongs to the semigroup. The inequalities (12) are equivalent because taking the minimum independently in each row gives the minimum over all subsets E. The generator lattice is full.

I independently derived this characterization before exposure. The proof's intersection-of-valuation-rings normality argument is also valid: each monomial weight extends to a valuation on the rational-function field; the lowest nonzero weighted homogeneous parts multiply without cancellation in the Laurent polynomial domain. Its nonnegative condition on a Laurent polynomial is precisely the stated support condition. Intersecting these integrally closed rings yields the claimed subalgebra.

Each distinct generator has degree one for k+sum u+sum v, so there are no degree-one relations. The cotangent dimension at the homogeneous origin is 1+ell+2ell\*m; the Krull dimension is 1+ell+ell\*m. The excess is ell\*m. For ell=0 or m=0 the ring is polynomial, and otherwise the vertex is singular. Smooth and etale covers preserve this excess. No finite semigroup sample is used to prove the all-parameter assertion.

## 6. Entire normalization, reduced fibres and unramifiedness

The six independent graph points are smooth; the r-5 dependent graph points are normal by the toric chart. Normality descends through the factor-vector torus torsor and free ordered-configuration etale quotient. Properness allows removal of the closed images of the nonnormal and non-quasi-finite loci, both missing this finite fibre. The resulting map is finite, normal, integral and birational. It is therefore the full normalization in the common function field, not an intermediate cover. This proves that each graph subset contributes exactly one normalization point.

The separate unramified argument correctly addresses infinitesimal fibres. The projective point-incidence is proper with finite reduced fibre, hence finite and unramified near it after shrinking: relative differentials have zero fibre and Nakayama applies. Its distinct-point r-fold incidence is open and closed, since diagonals of a separated unramified morphism are open and closed. The ordered graph is a closed subscheme of that finite unramified incidence after removing the image of the nonreduced Hilbert-point locus. Closed immersions and their composites are unramified; this descends through the free etale permutation quotient. Finite unramified fibres over C are reduced. In the smooth cases, removing the proper image of the singular locus gives the asserted whole-source smooth neighborhood.

No older criterion requiring every r-subset to be independent is applied to the dependent configurations. The proof supplies the missing local normality explicitly.

## 7. Tensor passage, dimensions and boundary cases

On the full C-flattening stratum, the tensor variety is the bundle of surjections C* onto K over H. The dense independent-span locus identifies this bundle there, and local trivialization plus its smooth open projection justifies passage to reduced closures. Pulling back the finite normalization of H gives a finite birational map from a normal open vector bundle, hence the whole normalization of this tensor neighborhood. Unramifiedness is stable under base change and the fibre is unchanged.

The rc added smooth dimensions give r(a+b+c-2). The toric tangent excess gives the stated embedding dimension at every boundary point. At r=6 there is one boundary point and ell=0; at b=3, m=0. Both cases are polynomial/smooth. For r>=7,b>=4 both parameters are positive and all r-5 boundary points are singular. Factor permutations transport the witness and argument. The proof explicitly uses independence of the retained added-A directions and makes no unsupported extension to mixed row-and-column configurations.

## Exact checks and limitations of their scope

The copied checker passed with exit zero and empty stderr normally and under -O. Both stdout hashes are 341d93f0321c0ce51d1e3309feccee3539b362a53e80bf2906b904a306587f5c, matching the earlier recorded output (the value recorded in verification/core/normalization/higher_rank/verification/CHECKER_OUTPUT.sha256). I checked its rational matrix-rank/determinant routines and polynomial identities. Its five reason-specific controls all reject.

Two added certificate corruptions reject with identical nonzero exits in both modes:

- Alter the first-row cycle normalization entry: REJECT: cycle normalization.
- Change the asserted every-five rank to four: REJECT: five point independence.

The replays and mutation copies were recorded. The unchanged checker's final sentence refers to the prior diagonal DVR proof; the author's check summary correctly explains this preserved wording. These finite checks certify the fixed core identities only. The all-r one-sided model, normality and fibre exhaustion are justified by the written proof above, not by those finite computations.

## Final verdict

ACCEPT theorem D, exactly as reviewed, with no required mathematical corrections. All accepted content is bound to the actual matching statement hash.
