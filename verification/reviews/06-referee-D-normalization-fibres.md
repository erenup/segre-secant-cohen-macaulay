# Referee report D: the normalization fibres

Reviewed: statements A–E and the proof now in verification/core/normalization/proofs/ (STATEMENTS.md and NORMALIZATION_FIBERS.md), and the exact checks now in verification/core/normalization/verification/.

**Verdict: ACCEPT every displayed item A–E at its stated ranges.** No mathematical
claim needs correction. The two optional presentation clarifications at the
end do not change the verdict or restrict any theorem.

The component audits described below are parts of this review; they are not
counted as a separate review.

## Material reviewed and independence

The reviewed statement has SHA256
`29f66382cd0c4d865a80279a4fe27622cffb920698d681c33b44df2cc8a4cd25`,
the source hash recorded for verification/core/normalization/proofs/STATEMENTS.md
in verification/core/normalization/verification/SOURCE_BINDINGS.txt; the
reviewed proof, SHA256
`604f100ec5faa6aa5469eb9f13d54085a4838cfe496be0dd16c0958cb1ee7b49`,
is byte-identical to verification/core/normalization/proofs/NORMALIZATION_FIBERS.md.
All six listed files were copied byte-for-byte, checked against their
hashes, and checked for manifest membership. The copied manifest was
checked too. Only the statements, the proof and the verification files were
opened for mathematical review. The author's triage file was copied and
hashed as opaque bytes, as required to verify the full set of files; its
contents were not read. No author review or other
author note was opened. No author was contacted, and no author file was
edited.

Before reading any submitted proof or checker, I wrote and fixed my own
derivation of all A–E. I had not read any component derivation at that
point. Each component auditor also fixed a derivation before proof
comparison.

The allowed accepted family theorem was verified against its full
17-file manifest. Its statement and REACH_DERIVATION.md identify
the same witnesses, padding range and previously established local non-S2 /
non-CM conclusion used as background in C. This review does not count that
old family theorem as a new claim or use its old review notes.

## Accepted ranges and conclusions

| Item | Precisely accepted scope |
|---|---|
| A | Every smooth irreducible projective S over C, r≥1, with nonempty independent-tuple locus and the expressly assumed birational unordered span map. At L with m≥r reduced intersection points and every r-subset independent: an entire smooth normalization neighborhood, unramified normalization map, and exactly binomial(m,r) reduced points. The rank-r tensor-bundle version holds for every c≥r. |
| B | Every r≥5, p,q≥3 with p+q=r+1, and every padding a≥p,b≥q,c≥r. The rank-one intersection has exactly r+1 reduced points (six in the core); exactly six independent r-subsets and actual unordered r-term decompositions; all six addition differentials injective; ordinary and border rank exactly r. This item does not require a+b≥r+2 and includes the minimal 3×3×5 core. |
| C, rank five | Every a,b≥3, a+b≥7,c≥5: the entire normalization is smooth over an open neighborhood of the padded T_5, the normalization map there is unramified, and the fiber has exactly six reduced points, all corresponding to actual decompositions. |
| C, higher ranks | Every r≥6 and p,q as in B, padded into a≥p,b≥q,c≥r with a+b≥r+2: at least r+1 distinct normalization points, including the six distinguished smooth actual-decomposition points and at least r−5 further points. Their total number and the smoothness of the additional points are not settled. Factor permutations transport these conclusions. |
| D | Every local holomorphic immersion in the statement has a projected holomorphic local inverse with bounded derivative after shrinking, for any fixed smooth local Hermitian metric. The dimension-zero inverse assertion is trivial. This is a branchwise local result, with no probability, moment or global inverse consequence. |
| E | The normal-domain retract statement and its tensor-padding consequence, and the conductor/normalization-quotient support statement, exactly as stated. No general transfer of S2 or Cohen–Macaulayness is accepted or asserted. |

## A: the entire normalization, not just a birational model

The submitted finite-incidence proof is valid. Projectivity of the point
incidence Z→H and finiteness of its special fiber allow shrinking to a finite
map. The reduced C-points in that fiber have zero relative cotangent space;
base change for differentials and Nakayama imply unramifiedness there.
Removing the finite image of the non-unramified locus makes the map
unramified throughout the chosen neighborhood. This does not assume
flatness or constancy of the point count.

For a separated unramified map the diagonal is open and closed. Thus the
distinct ordered r-tuples in the r-fold fiber product form an open-and-closed
finite unramified subscheme. The independence hypothesis at L permits
removing the closed image of dependent tuples. What remains is, as a scheme,
the graph of the span map on an open subset of the smooth independent
configuration space. The inverse identification uses the direct sum of
independent line subbundles, so it is not merely a bijection on closed points.

Taking the free symmetric quotient gives a smooth integral finite source.
The assumed birationality gives the same function field as H; hence this
source is the normalization. Unramifiedness descends through the finite
étale ordering torsor. Its fiber is the set of unordered r-subsets and is
reduced. This proves the entire-neighborhood assertion in A.

My independently derived alternative used the proper graph in the
length-r Hilbert scheme. Its limiting schemes lie in S∩P(L); a finite
reduced intersection admits only reduced r-subsets. This independently
explains why no unobserved colliding configurations enlarge this fiber.
The submitted incidence proof is simpler and does not need that alternative.

On the rank-r flattening locus, the tensor variety is the open bundle of
surjections C_0*→L over H. This equality follows by dense independent
decompositions and local trivialization of the tautological bundle.
Pulling the bundle back to H's normalization gives a normal integral
finite birational cover, and therefore its entire normalization. Smoothness,
fiber cardinality and unramifiedness transfer as claimed.

## B: exhaustive scheme intersection and exactly six decompositions

The displayed core has its single relation ΣQ_i=0, with all six coefficients
nonzero. The proof separates zero factor coordinates from the dense factor
torus. On the torus its four rectangle equations satisfy the exact stated
polynomial identity 6u(u−1); nonzero u forces u=1 and then s=0, a
contradiction. The zero-coordinate cases give exactly the three row and
three column points. This is an all-complex-points exhaustion proof.

The six nonzero rational ratio determinants establish scalar-only affine
matrix tangencies. Consequently the projective intersection has zero
Zariski tangent spaces. Since its support is finite, Nakayama shows that
each local ring is C, establishing reducedness rather than just support.
The component audit and my own derivation also supply independent
coordinate eliminations of this core intersection.

The extended span has zero lower-right block. A pure matrix with a nonzero
complementary row must have no complementary column; distinct prescribed
row directions force it to be one R-point, and the avoidance identity
eliminates a simultaneous core block. The column case is symmetric. The
same block comparisons prove scalar-only tangencies at every added point.
The support and tangent arguments remain valid with either or both added
blocks empty, and padding adds no point or tangent direction. They do not
use the stronger admissibility inequality needed in C.

The extra matrices occupy independent blocks, leaving the core relation
as the only relation. Thus exactly the six r-subsets omitting a Q-point
are bases. The tensor's flattening has rank r, so any r-term decomposition
must use one of those bases, and its third-factor coefficients are uniquely
determined and nonzero. This counts actual pure summands, not redundant
factor parametrizations. The same flattening gives the lower bound for
ordinary and border rank.

For immersion, project a vanishing sum of summand tangent vectors to
(W/L_r)⊗C. Independence of the third factors puts each matrix variation
in L_r. Scalar-only tangencies allow absorbing it into the third variation;
independence of the matrix basis then makes every actual summand tangent
zero. This proves injectivity on the smooth pure-summand configuration
space at each of the six decompositions.

## C: birationality and the dependent boundary configurations

In each admissible format, general factor lists have every subset of
size k of rank min(a,k), respectively min(b,k). For 2≤k≤r,

    min(a,k)+min(b,k)−k ≥ 2.

Sylvester's rank inequality therefore excludes a rank-one combination
supported on two or more points and proves the generic uniqueness of the
unordered span. In characteristic zero this gives birationality. For the
optional generic tangent assertion one projects by both factor lines of
the selected point; the same inequality on subsets containing that point
gives rank at least one after quotienting. The accepted background states
this argument in full. There is no unproved generic identifiability input.

At rank five every five of the six core points are independent, so A
applies directly. In particular the conclusion is stronger than finding
six smooth points on a resolution: it identifies the entire normalization
over a neighborhood. The excluded 3×3 case is not silently included in C.

At r≥6 the submitted proof constructs a finite intermediate model F_0
over H. It is the reduced closure of the independent-configuration locus
inside the finite unordered distinct-tuple incidence scheme. That locus
is irreducible, and generic birationality gives F_0 the same function
field as H. H's integral closure contains the finite intermediate domain,
so the normalization maps finitely and surjectively to F_0.

Every dependent r-subset is explicitly realized in F_0. To omit R_s,
express its core right direction in the row basis of M and perturb the
three row Q-points in the u_s direction. Their total relation becomes
zR_s. A core-block relation forces equal coefficients, and the added row
forces this common coefficient to vanish for z≠0; hence the configuration
is independent. Five deformed Q-points, all retained extra points and the
fixed R_s give a basis tending to L_r. The column construction omitting
S_t has the same properties. These are algebraic limiting arcs, not a
numerical or heuristic limit.

Thus all r+1 distinct r-subsets occur as distinct points of the finite
model's special fiber. Surjectivity from normalization gives at least
one normalization point over each, so they cannot be collapsed into one
normalization point. The six independent configurations have smooth
configuration neighborhoods; normalization is an isomorphism there.
No smoothness or exact cardinality is inferred for the dependent points.
The flattening-bundle argument transfers the lower bound to the tensor.

This finiteness step is essential: distinct points on an arbitrary proper
birational model would not suffice. The submitted proof includes it and
therefore proves the claimed normalization lower bound.

## D and E

For D choose a complex linear projection π which is a left inverse to
df_y in local coordinates. The holomorphic inverse function theorem
applies to πf. On a smaller relatively compact neighborhood the derivative
of (πf)^−1π is continuous and bounded. The least singular value of df
stays positive by continuity in positive dimension. This verifies exactly
the local branchwise assertion used for the six actual decompositions.

The submitted proof file has no separate proof of E. Both ring claims
are elementary and are established here, so they are included in the
acceptance. Identify A with its embedded image in B. If x=a/s∈Frac(A)
is integral over A, it is integral over B and therefore lies in B when
B is normal. Applying the retraction ρ to sx=a gives sρ(x)=a, whence
x=ρ(x)∈A. This does not require extending ρ to all of Frac(B).
Coordinate inclusion and projection preserve border-rank varieties and
compose to the identity, giving the indicated coordinate-ring retract.

For a finite normalization A⊂B, an element a∈A kills B/A precisely
when aB⊂A, which is the conductor (A:B). The finite quotient module
vanishes at a prime p precisely when A_p=B_p. Finite generation then
makes equality hold on a neighborhood of p, exactly the local isomorphism
locus of the normalization. Thus its support is the asserted complement.

## Exact checker executions and two additional corruptions

The copied checker and runner use integer/Fraction polynomial identities
and explicit SystemExit guards; there are no removable assertion checks.
The logged normal and `-O` harness runs both pass and have identical output.
Each harness invokes the identity checker normally and optimized and
requires its three built-in controls to fail at their designated reasons:
torus identity, core determinant and row arc coefficient identity.

Two additional corruptions modify copied source expressions and use no
`--mutate` flag or unconditional rejection branch:

1. Add one to a computed row-ratio entry. Both normal and optimized runs
   exit 1 with empty stdout and exactly `REJECT: row tangent determinants`.
2. Replace the avoidance matrix's u/2 entry by u/4. Both runs exit 1
   with empty stdout and exactly `REJECT: avoidance determinant polynomial`.

The changed sources, exact diffs/recipes, hashes and all four execution
records were preserved. These controls extend
the built-in ones to tangent and avoidance computations. The finite exact
checks verify their advertised identities. They do not formalize the
normalization geometry or establish an all-r statement from samples;
those conclusions were audited as written proofs above.

The independently derived higher-rank component also records a
column-arc-sign corruption and its own avoidance-matrix corruption, both
rejected in normal and optimized modes. These are additional checks beyond
the two required source corruptions described above.

## Optional presentation clarifications; no required corrections

- Add the short E proofs above to the eventual mathematical exposition.
  Their absence from this submitted proof file does not leave a logical
  uncertainty after this review.
- For d=0 in D, the inverse assertion is trivial. The equivalent
  least-singular-value wording may explicitly use the empty-infimum
  convention, or say “when d>0.” This changes no immersion or stability
  claim, including the positive-dimensional decomposition applications.

No tail exponent, moment bound, global inverse, global property of the
normalization, exact higher-rank fiber cardinality, or smoothness of its
additional points is accepted beyond what A–E expressly claim.
