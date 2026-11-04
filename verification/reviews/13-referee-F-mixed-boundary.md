# Referee report F: the mixed boundary models

Reviewed: theorems E1 and E2 with their proofs now in verification/core/normalization/boundary_models/proofs/ (STATEMENT_E.md, GEOMETRY_E.md, ALGEBRA_STAR.md, DEFORMATION_LEMMA.md, DEPENDENCIES_E.md), and the exact checks now in verification/core/normalization/boundary_models/verification/.

Verdict: ACCEPT E1; ACCEPT E2.

This is an independent review. I did not contact the author, open other author material, or read the other referee's review. My earlier review of theorem D is explicitly disclosed as prior knowledge; E's new algebra and geometry have been checked separately.

## Exact verdicts

**E1: ACCEPT in full.** For every r>=7, a>=4, b>=r-3, a+b>=r+2 and c>=r, for the specified original witness with one added row and r-6 added columns (and its transported transpose), rank and border rank are r and there are exactly six actual unordered r-term decompositions. The entire normalization fibre consists of r+1 reduced points. Six are smooth. Omitting the row gives the normal singular model R_(r-6,a-3), with tangent excess (r-6)(a-3). Each omitted-column point gives B_(r-7,a-4,b-r+4), with tangent excess (r-7)(a-3)+b-r+4. All these boundary excesses are positive, including r=7 and k=0 in the star model.

**E2: ACCEPT in full.** For every a>=5, b>=5, a+b>=11 and c>=9, for the specified original rank-nine witness with two added rows and two added columns, rank and border rank are nine and there are exactly six actual unordered nine-term decompositions. The normalization fibre consists of exactly ten reduced points: six smooth points, two normal singular points with model B_(2,a-4,b-5) and excess 2a+b-11, and two with model B_(2,b-4,a-5) and excess a+2b-11. Both excesses are at least five; beta=0 cases are included.

For both items, the models are the stated smooth/etale local equivalences at their homogeneous origins. Every point has dimension D=r(a+b+c-2) and embedding dimension D plus its stated excess, using r=9 in E2. The normalization is unramified over a Zariski neighborhood of the witness. Transport under the specified factor permutations is valid. The common normality and tangent assertions for R_(s,m) and B_(k,alpha,beta), for all nonnegative indices, are also accepted.

No global Cohen--Macaulay, depth, rational-singularity or smoothness claim, no canonical unframed coordinate identification, and no broader mixed split is inferred. No required corrections to E1 or E2.

## Material reviewed and independent derivation

The reviewed statement has SHA256 `85f147de54733bddd8488221aafc4b9e3563844aa3cc9ad0acffe4eb8952f8a2`, the source hash recorded for verification/core/normalization/boundary_models/proofs/STATEMENT_E.md in verification/core/normalization/boundary_models/verification/SOURCE_BINDINGS.txt. The hashes of all three proof files and of the checker inputs were recorded. All 20 manifest entries were authenticated in the private copy before review and again after the runs.

My statement-only outline was fixed before I read the proofs. Before fixing it I read only the assignment and STATEMENT_E.md. The assignment named the requested proof checkpoints, which is recorded. Using my prior D review, I independently derived the expected mixed residual equations, all four parameter substitutions, tangent excesses, fibre-exhaustion obligations, and the toric special cases. I did not independently prove arbitrary star-algebra normality or embedded coordinate cancellation before exposure. Those are the principal checks made after the outline, below.

## 1. Prior input scope, finite configurations and actual decompositions

The earlier normalization theorem (now in verification/core/normalization/proofs/) supplies the exact six-point reduced core, both v(z) avoidance identities, the original mixed witnesses and their arcs. I checked the cited sections in the copy. Its earlier complete-normalization criterion assumes every r-subset independent and is correctly not used for the present dependent subsets. Its higher-rank result supplies only a lower bound on normalization points; E supplies the missing local normality and exact count.

For a rank-one matrix in L, the zero new-A by new-B block forces at least one new-coordinate factor to vanish. Pairwise distinct v-directions then permit only a single added row or column; the appropriate core-avoidance identity removes any core admixture. The remaining possibility lies in the six-point core. Quotienting by unused support directions proves the padding assertion. The same block constraints on rank-one tangents leave only the scalar tangent at each point, including in mixed formats. Zero projective tangent and Nakayama give reducedness, rather than merely a point enumeration.

All added matrices occupy separate row or column blocks, so the only relation is the six-core circuit. Precisely the six subsets omitting a Q are bases. Third flattening rank r and an r-term expression prove rank and border rank r. Every actual r-term decomposition selects one of those bases and has uniquely determined third coefficients. The scalar-only tangent condition also proves immersion of the six addition branches.

For generic configurations, min(a,j)+min(b,j)>=j+2 for every 2<=j<=r follows from the format hypotheses. Sylvester's inequality rules out both zero combinations and new rank-one matrices supported on at least two points. In characteristic zero the generic unordered span map is consequently birational and dim H=r(a+b-2).

## 2. Proper exhaustion is scheme-theoretic

The reduced integral closure of the span graph inside Hilb^r(S) x H is proper and birational over H. The annihilator-to-H^0(O_Z(1)) bundle map vanishes on its dense independent locus, and hence on the reduced graph. This imposes containment Z subset S intersect P(K) scheme-theoretically. The fibre at L is therefore a closed subscheme of Hilb^r of the reduced r+1-point intersection, which is a discrete reduced scheme of r-element subsets. Every such closed subscheme is reduced. Infinitesimal and colliding configurations are excluded by this argument.

The six independent subsets occur immediately. For a missing row, the explicit three-core-row arc has core sum epsilon times that omitted matrix. Projection to the core and retained added blocks proves independence for epsilon!=0. Replacing one core vector by the fixed omitted matrix gives a basis with independent limits, proving that its Grassmann limit is L. The column arc is the exact transpose. Thus every dependent subset occurs, and the graph has precisely the required r+1 reduced fibre points. The later normality argument is still necessary to identify its points with the full normalization fibre.

## 3. Embedded maximal-minor ideal and coordinate cancellation

On the rank-(r-1) pivot chart, row reduction gives equality between the r-minor ideal I and the residual coordinates of the remaining column. Introducing relation coefficients gives J=(w,I), where w are the differences from the uniquely solved coefficients. The five nonnormalized core coefficients are units and are absorbed by invertible rescalings; retained added coefficients vanish and are never inverted.

I recomputed the Schur substitutions. Solving the first three A rows removes C0, subtracting their Y-multiple gives P B2^t+U'Delta V^t, and solving the first three B columns removes P. The remaining matrix is exactly U'Delta(V')^t. These are invertible operations on ideals. The solved blocks give 3a+3b-9 independent linear coordinate generators.

The subsequent row and column frame changes are invertible: a retained row has a unit A coordinate, and retained columns have a unit B minor. Their original nonvanishing frame data stay as independent smooth parameters. The opposite vanishing factor columns transform invertibly. In the one-row case this leaves exactly the independent variables p,q_j,x_j,z_j,u_h,v_ij and quadratics p\*z_j+q_j\*x_j, p\*u_h, q_j\*v_ij. With no row retained, a left inverse for the retained B frame gives exactly q_j\*y_ij. No cross-column terms or unaccounted higher-order terms remain.

Every nonlinear generator has zero differential at the witness. The r-1 independent differentials dw therefore have full rank within the span of the solved dL. Choose a unit coefficient minor expressing w in (L,Q), and replace those L coordinates by w while keeping Q's variables and the unused coordinates. The ideal is unchanged, and the Jacobian is invertible. Restricting to w=0 yields I=(l_1,...,l_kappa,Q), kappa=3a+3b-r-8, with all nonlinear variables still independent. This establishes the embedded ideal, not just its radical or tangent cone.

The substitutions are exactly those stated: E1 omit row gives R_(r-6,a-3); E1 omit column gives B_(r-7,a-4,b-r+4); E2 omit row gives B_(2,a-4,b-5); the omitted-column case transposes it.

## 4. The actual saturated graph chart and its centre

The graph of the projective rational span map is the blowup of its maximal-minor ideal. Flat base change preserves all ideal powers, so the frame covers and etale coordinate changes preserve that description.

The selected pivot avoids the omitted new row or column. Along the explicit core arc, its old-core entries and every retained-added pivot entry are unchanged. Hence the pivot relation keeps all retained coefficients identically zero. This makes every residual quadratic identically zero along the arc, even though some Schur-transformed opposite vectors can vary.

The residual derivative is the omitted direction modulo the retained span and is nonzero. Since dQ=0, a linear generator t detects it. The other linear generators can be chosen to have zero first derivative along the arc. Thus their quotients by t tend to zero; Q/t is identically zero on the arc. All nonlinear base variables tend to zero as well. The graph point is the homogeneous origin of the claimed model, rather than another point of its exceptional fibre.

The chart is O_F[l_i/t,Q/t] inside O_F[t^-1]. Eliminating l_i=t\*h_i splits independent smooth variables off from the exact toric or star subalgebra. Full t-saturation is retained. The argument never replaces this algebra by the generally insufficient equations t\*w=Q.

## 5. Star algebra: denominator ideals and every cancellation

The included algebra proof treats H_ij=p\*z_j\*v_ij/t=v_ij\*G_j-x_j\*Q_ij as an additional element of the monomial coefficient algebra B. With total q-degree, the leading term of G_j is E_j=q_j\*x_j/t. This enlargement is essential.

For each intermediate B_S and j not in S, only Q_(.,j) can consume q_j in a fractional generator, and x_j occurs only freely. I checked the all-power denominator formula D_(j,n)=(t,v_(.,j))^n. In a monomial representation of bE_j^n, if at least n Q_(.,j) factors occur, removing n of them and n free x_j factors shows b is divisible in B_S by the corresponding degree-n v monomial. If only s\<n occur, removing all s, n-s free q_j factors and n free x_j factors leaves b/(t^(n-s) times that degree-s v monomial) in B_S. The free factors needed really are available because their original exponents are nonnegative. The converse follows from tE_j=q_j\*x_j and v_ij E_j=x_j Q_ij. Membership extends termwise to arbitrary coefficients.

Grouping polynomial terms with the same Laurent monomial image reduces the relative kernel to binomials bY^n-cY^m. The denominator formula makes the difference after cancelling a common power a telescoping combination of the linear relations tY_j-q_j\*x_j and v_ijY_j-x_jQ_ij. This proves the complete relative kernel, not a localization of it. Its coefficients lie in the original B, so adjoining the E_j in order proves the full multivariate kernel and includes cross-relations.

Every such relation has weight one and acquires a weight-zero remainder upon Y_j=G_j. Homogeneous decomposition of coefficients therefore replaces any cancelled largest-weight piece by a strictly smaller-weight representation of the same element. All weights are nonnegative integers, so the process terminates. Both inclusions for the associated graded algebra follow. This is a finite generating SAGBI argument; no presumed completeness of a few leading relations is used.

## 6. Integral-flow saturation and the deformation lemma

The exponent inequalities in ALGEBRA_STAR section 6 exactly describe consumption by P,E,Q,H. The four allowed source-to-sink path types consume precisely their p/q, x/z/u/v resources, including the shared capacity on v_ij and the gate capacity on z_j. The total flow is the number of denominator units. Integral capacities give an integral maximum flow; deleting integral paths supplies any smaller required integer demand. Therefore every integer point of the real generator cone has an integer monomial expression. All base variables are present, so the lattice is the full exponent lattice. This proves saturation and normality of the entire initial monomial algebra, including all empty index sets.

The weighted Rees algebra is finitely generated because the previous reduction preserves the filtration and explicitly includes all H_ij in degree zero. Its quotient by xi is exactly the normal associated graded algebra, and its localization is R[xi,xi^-1].

I checked the separate local deformation lemma. For a local finite-type domain D with nonzero f in its maximal ideal and normal domain D/(f), the prime (f) has height one and D_(f) is a DVR. The finite normalization N embeds in that DVR and has exactly one height-one prime above f, with valuation one. Prime heights are preserved by the finite birational extension using the affine dimension formula and finite residue-field extensions; localizing does not change this conclusion. The reduction N/Q embeds in Frac(D/(f)) and is integral over D/(f), hence equals it. For n in N subtract the corresponding d in D. Then (n-d)/f has nonnegative valuation at every height-one prime of N and belongs to N. Nakayama applied to N/D=f(N/D) proves D=N.

For the graded consequence, normality holds at every point on xi=0. The nonnormal locus is closed and invariant under nonzero grading scalars. Nonnegative degrees give every closed-point orbit an affine limit on xi=0, even though the degree-zero algebra is nontrivial. A nonempty nonnormal locus would contain such a limit, contradiction. This legitimately proves normality of the full Rees algebra without properness. Localizing and taking elements independent of xi then proves normality of R. This supplies the previously missing normality for all k,alpha,beta.

## 7. Tangent dimensions and the whole normalization

For R_(s,m), the elementary integer-capacity formula for its exponent monoid gives saturation. For B, invert t to see its fraction field is that of the 2+3k+beta+alpha\*k independent base variables. Under the total base-variable grading, all original generators have degree one. Each paired fraction has a p\*z_j/t monomial unique to it; all other original generators have distinct Laurent monomials. Thus there are no linear relations, and its tangent excess is precisely k\*(alpha+1)+beta. The extra H generators have degree two in this grading and do not add cotangent directions. The analogous count for R gives s\*m.

Substituting the geometric parameters gives all four claimed excesses, with the stated positive minima and beta=0/k=0 boundary cases. Smooth/etale covers preserve them. The six independent configuration points are smooth open graph points; every dependent graph point is normal by the exact local models.

Properness permits removal of the images of the non-quasi-finite and nonnormal loci, which miss the entire finite fibre. The resulting finite normal integral birational source is the full normalization of a neighborhood in H. Thus each configuration contributes exactly one normalization point. The already reduced zero-dimensional graph fibre has zero relative cotangent spaces. Nakayama and openness of the unramified locus, followed by another proper-image shrinking, prove unramifiedness near the whole fibre.

Finally the full third-flattening-rank stratum is the bundle of surjections C* onto K over H. Pullback to the normalization is a normal open vector bundle, finite and birational over that stratum, hence its full normalization. This preserves the fibre and unramifiedness and adds rc smooth dimensions. It proves D=r(a+b+c-2) and every claimed embedding dimension. No assertion about an arbitrary mixed split or global normalization geometry is needed.

## Exact replay and added corruptions

The copied checker passes with python -I -S -B both normally and under -O. Stdout hashes agree at 341d93f0321c0ce51d1e3309feccee3539b362a53e80bf2906b904a306587f5c, and stderr is empty. The five built-in controls reject at their named checks. Its arithmetic and fixed-core scope were checked; its preserved reference to the older diagonal proof is documented by the author's check summary and is not evidence for mixed normality.

Two extra certificate corruptions reject with exit 1 and identical diagnostics in both modes:

- Change the claimed matrix determinant from 2 to -2: REJECT: matrix determinant.
- Change every_five_rank from 5 to 4: REJECT: five point independence.

The runs, mutation copies and logs were recorded. These computations verify fixed-core data only. All-parameter star normality, exact embedded charts, fibre exhaustion and unramifiedness are accepted on the written arguments checked above.

## Final verdict

ACCEPT E1 and ACCEPT E2, at the exact reviewed scopes. No mathematical corrections required.
