# Referee report A: the normalization fibres

Reviewed: statements A–E and the proof now in verification/core/normalization/proofs/ (STATEMENTS.md and NORMALIZATION_FIBERS.md), and the exact checks now in verification/core/normalization/verification/.

Verdict: **ACCEPT**, for every item A–E of STATEMENTS.md, with exactly its stated hypotheses and exclusions. No required correction.

This review was performed independently of the other referee and of all reviews internal to the author's work. I have not seen any of those reviews.

## Material reviewed and independence

The reviewed statement has SHA256 `29f66382cd0c4d865a80279a4fe27622cffb920698d681c33b44df2cc8a4cd25`, the source hash recorded for verification/core/normalization/proofs/STATEMENTS.md in verification/core/normalization/verification/SOURCE_BINDINGS.txt. The reviewed proof (SHA256 `604f100ec5faa6aa5469eb9f13d54085a4838cfe496be0dd16c0958cb1ee7b49`), arithmetic checker (`8101973551b482e2da67c605104fd61994e8fe04e210431f0761a16e0f39f2ab`) and runner (`7bc2470b94f402d2e18057d2b704bccf5ccb4d60a94fa1f84a251bee0cc2ef8d`) are byte-identical to verification/core/normalization/proofs/NORMALIZATION_FIBERS.md, verification/core/normalization/verification/check_normalization_identities.py and verification/core/normalization/verification/run_checks.py.

I copied and verified all six manifest entries before review and rechecked the source and copy before this verdict. Only the statement was read before my independent derivation. The submitted proofs and verification files were initially copied and hashed as opaque bytes. No author reviews or other author notes were opened; the author's triage note was verified against the manifest only, since it is outside the allowed reading set. Background exposure is the previously accepted family theorem and an earlier draft of the paper, which I had reviewed earlier; this is disclosed rather than called fresh independent discovery.

My complete derivation was written and fixed before I read NORMALIZATION_FIBERS.md or either submitted script. It covers the general criterion, generic birationality, entire rank-one intersection, six decompositions and their differentials, all dependent limiting configurations, the local inverse bound, and both elementary item-E facts. An interruption occurred before the derivation was fixed; the unfixed checkpoint was retained. I neither consulted the author's new proof during the interruption nor altered the derivation after fixing it.

## A — ACCEPT in the full stated generality

I reconstructed a proper Hilbert-scheme graph: a limiting length-r subscheme must lie in the scheme intersection S intersect P(L). A finite reduced intersection permits only reduced r-subsets, so under the independence hypothesis every fibre point lies in the smooth independent-tuple open. Proper quasi-finiteness gives finiteness near L; the finite smooth birational graph is the normalization. The tangent intersection is zero at each selected point, so the span differential is injective and the normalization map is unramified after shrinking. This also verifies that there are no missing colliding or dependent configurations in A.

The submitted proof instead uses the finite unramified incidence of individual points and then its distinct-tuple fibre powers. I checked every step of that alternative: finite fibre plus properness permits a finite neighbourhood; zero fibre cotangents and Nakayama give unramifiedness; the separated unramified diagonal is both open and closed; therefore the distinct-tuple locus remains finite, and dependence can be excluded by deleting a closed image. Its identification with an open of U is functorial, using an isomorphism from the direct sum of independent lines to the rank-r subbundle. The free finite permutation quotient is an étale torsor, preserving smoothness, and its finite birational map is the full normalization. No unjustified flatness or surjectivity assumption is used.

Thus A holds for every smooth irreducible projective S, every r>=1 with nonempty U, the explicit birational unordered-span assumption, and every stated finite reduced m-point intersection with all r-subsets independent. The fibre consists of exactly binomial(m,r) reduced points. The full rank-r flattening locus of the associated tensor variety is the surjection bundle over H. Its normalization is the pullback of the base normalization, since locally it is a polynomial extension and localization of a normal domain and the map is finite birational. This proves the entire-neighbourhood tensor assertion for every c>=r, not merely smoothness at selected lifts.

## B — ACCEPT, including the minimal unpadded formats

I proved the core intersection by a calculation different from the author's torus elimination. In the Q_1,...,Q_5 coordinates, the nine minor quadrics span the nine-dimensional space of differences between the ten mixed monomials x_i x_j. Their first-nine-column coefficient determinant is exactly 1728, independently checked by Fraction elimination with explicit pivots and row-swap sign. Consequently the projective scheme has exactly the five coordinate points and the all-one point. Its projective tangent spaces are zero, which proves reducedness by Nakayama. The full matrix and calculation are in my derivation.

I also checked the submitted universal torus-elimination identity, all six exact tangent determinants, and the det(M)=2 computation. The zero-coordinate cases exhaust row/column points; the nonzero-coordinate case forces u=1 and then s=0, a contradiction. These are complex-algebraic arguments, not finite searches.

For the extensions, the zero E tensor F block forces at most one factor tail to be nonzero. Distinct v-lines and the two core avoidance conditions leave only the R or S points. The tangent/block argument gives reducedness at every added point, and padding changes neither the intersection nor these tangencies. My pre-proof argument derives the avoidance from the already exhausted core factor lines; the submitted explicit polynomial argument gives the same result.

There is exactly one relation among the r+1 matrices, namely the relation among the six Q points. Precisely six r-subsets are independent. Rank-r flattening forces every actual r-term decomposition to use one such basis; each basis uniquely determines nonzero independent third-factor coefficients. Thus there are exactly six actual unordered decompositions and ordinary and border rank both equal r. Reducing an addition-kernel tangent modulo L and using those independent third factors forces all matrix tangents radial, then forces every summand tangent zero. This establishes all six immersions.

These B arguments apply for every r>=5, p,q>=3, p+q=r+1, and every padding a>=p,b>=q,c>=r. They do not need the extra admissibility a+b>=r+2 used for normalization in C. The normalization assertions are not silently extended to the 3x3 rank-five family, where the generic birationality needed in A is absent.

## C — ACCEPT with the exact rank-five / higher-rank distinction

For admissible formats, I independently obtained generic span birationality from the standard Kruskal uniqueness inequality used in the accepted family background. The submitted subset-rank/Sylvester argument also checks directly: for 2<=j<=r, min(a,j)+min(b,j)>=j+2, so a combination supported on j generic points has matrix rank at least two. The generic span therefore contains precisely its r original rank-one points, giving generic uniqueness and birationality in characteristic zero.

At rank five every five-subset of the six reduced core points is independent, so A proves exactly six reduced normalization preimages and a Zariski neighbourhood whose entire normalization is smooth and whose normalization map is unramified. This is accepted for all a,b>=3, a+b>=7,c>=5, and factor permutations.

At r>=6 it is essential that the remaining r-subsets are dependent. I reconstructed the submitted row and column arcs before reading them: omitting R_s, deform the three row Q points so their six-core sum is zR_s; omitting S_t, deform the three negative-column Q points so their sum is zS_t. Invertibility of M gives the coefficients symbolically for every allowed index. The core relation, separate tail blocks and the nonzero z coefficient prove independence off zero. Five deformed core points, the omitted fixed matrix, and all retained added matrices have independent limits, verifying the Grassmann limit without relying on an informal cancellation.

There are r-5 distinct such dependent limiting configurations, in addition to the six actual ones. My proper graph and the submitted finite incidence-configuration model both make them distinct points of a finite birational intermediate model. The integral closure maps finitely and surjectively to that model, so distinct intermediate points require distinct normalization preimages. The independent-configuration open is smooth, giving six distinguished smooth normalization points. The tensor bundle preserves these counts.

I therefore accept the lower bound r+1 on the total normalization fibre, and at least r-5 points not supplied by actual decompositions, for r>=6, p,q>=3, p+q=r+1, a>=p,b>=q,c>=r, a+b>=r+2, including factor permutations. I do not turn this into exact cardinality, smoothness of the extra points, or a smooth entire-normalization neighbourhood at higher rank. The submitted statement correctly avoids those assertions. Non-S2/non-CM at the tensor is inherited from the previously accepted family theorem in its admissible range; no global CM or rational-singularity theorem about normalization is claimed.

## D and E — ACCEPT

D follows from a linear projection with invertible derivative, the holomorphic inverse function theorem, and restriction to a relatively compact smaller coordinate neighbourhood. Continuity also gives a positive lower bound on the least singular value for any fixed smooth local Hermitian metric. This is local on each of the six actual branches. It supplies neither a global single-valued inverse nor a probability tail or moment assertion.

I independently prove both E statements in my derivation; I have not opened the excluded triage text. For the retract, if z=a/s in Frac(A) is integral over A, it lies in the normal domain B; applying the retraction to sz=a puts z in A. Coordinate inclusion/projection of reduced irreducible tensor secants gives the claimed propagation of nonnormality. No CM or S2 retraction theorem is inferred. For finite normalization, Ann_A(B/A) is exactly {a:aB subset A}; finite-module support equals the vanishing locus of that conductor, and localization of B/A is zero exactly on the normalization's isomorphism locus.

## Exact checking and limits of computation

I inspected both standard-library scripts. Their proof gates are explicit failures and contain no assertions. The exact polynomial dictionary arithmetic, rational determinants, avoidance identity, and symbolic row/column coefficients implement the stated identities. The runner does not claim to formalize normalization geometry; nor do I.

Both complete runner invocations (normal outer interpreter and -O) passed in 0.2199 s and 0.2076 s, with identical output SHA256 `9703712028077bde918a12c5425f4d8531cf47d80007855bd2ec6dcbc26bc3f2`, the value recorded in verification/core/normalization/verification/RUNNER_OUTPUT.sha256. I separately compared the direct positive checker outputs in normal and optimized modes; they are identical. I checked the three supplied corruptions in both modes with exact exit code 1, empty stdout and the intended rejection reason.

Two additional corruptions in my own copies also reject in both modes:
- Change the avoidance polynomial's root 3 to 4: `REJECT: avoidance determinant polynomial`.
- Reverse the column-arc coefficient sign: `REJECT: column arc coefficient identity`.

The outcome records, logs and the modified private copies were kept. None of the reviewed files was edited or executed in place in the author's directory. The finite identities support the written proof; the universal quantifiers, entire-normalization claim, and distinct-boundary-point argument are verified by the mathematical reasoning above.

All requested claims and ranges are accepted without corrections. The exact higher-rank cardinality and the local rings of its additional normalization points remain outside this verdict.
