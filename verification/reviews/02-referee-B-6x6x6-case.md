# Referee report B: the original 6×6×6 case

Reviewed: the written statement and proof of the original 6×6×6 case now in verification/core/proofs/, and the witness and primary checker now in verification/core/verification/.

**Verdict: ACCEPT. No corrections are required.** The copied proof establishes
a full negative answer to the catalogue's universal assertion: the reduced
affine variety of border-rank-at-most-five tensors in
`C^6 tensor C^6 tensor C^6` has dimension 80, does not satisfy S2, and its
homogeneous vertex has depth strictly less than 80.

This verdict concerns the mathematical theorem and its scope. The bounded
literature search described below is not a certificate of historical novelty.
No author contact or publication occurred.

## Material reviewed and independence

The reviewed proof has SHA256
`9d1c3cefdfc46e02a9e8c34d3f1d74a4396b1e0f5beb9e8f04210d8a8ba82825`,
the source hash recorded for verification/core/proofs/PROOF.md in
verification/core/verification/SOURCE_BINDINGS.txt. All 110 manifest
entries of the reviewed files, totaling 7,047,941 bytes, were verified in
the review copy. Symlinks and unsafe relative paths were rejected.

Only the copied `STATEMENT.md`, `PROOF.md`, the author's check summary, and
the certificate directory (the witness and primary checker now in
verification/core/verification/) were opened for mathematical review. Other
files were copied and hashed as bytes only; no draft, internal author
review, author source folder, or file or note of the other referee was
read. The source files were not edited.

My full independent derivation, including all proof steps, was completed
and fixed before any mathematical checker execution in this review. All
later checks use exact arithmetic. I read the supporting derivations of this
review, described at the end, only after fixing my own. Their agreement is
not substituted for the proof below or the complete written derivations.

## Exact match with the public question

Fresh copies of both the public README.md and problem.tex were fetched with
`python3 -I` into a new empty directory. The URLs, retrieval times, byte
sizes and hashes were recorded. README SHA256 is
`a8e9ff7f686b322bd25d0d18090e6839544d617fbfd791602e89ca2c5cb2a7aa`;
problem.tex SHA256 is
`147b721bb3ac9dadc3e600e82700b9ecfdac663d332b13eccfbe8c8f3dca8484`.
I compared their mathematical statement with the submitted theorem, rather
than relying on the submitted transcription.

| Public quantifier or definition | Claimed counterexample |
| --- | --- |
| Integers k>=3 | k=3 |
| Every n_i>=1 | n_1=n_2=n_3=6 |
| Every rank threshold r>=1 | r=5 |
| Ground field C | Ground field C throughout |
| Zariski closure of sums of r pure tensors | Exactly that image closure; its dense source may remove zero/repeated summands without changing the closure |
| Vanishing ideal I(X_r) | Reduced vanishing ideal of the irreducible image closure, hence a prime ideal |
| Affine cone, retaining zero | The actual affine tensor cone in 216 coordinates |
| Depth equals dimension at the positive-degree maximal ideal | Section 5 proves depth strictly below dimension 80 at that precise ideal |

There is no rank-range exclusion, concise-tensor restriction, generic-point
restriction, nonreduced scheme replacement, or projective-only loophole.
A single permitted instance refutes the universal question. Failure of
normality alone would not suffice; the S2 and vertex arguments supply the
stronger conclusion actually requested.

The freshly fetched live catalogue marks TR-25 PARTIAL; the live resolution
archive contains no TR-25 entry. The latest commit affecting the public TR-25
directory is `d7fcfe7bfe8c02cd98d9463fa5a8ba12850d5bdb`, 2026-09-12,
a rendering update. The previous status audit was 2026-09-10. These are
observations about the fetched public state, not guarantees against an
unindexed subsequent result.

## Mathematical review

### The explicit finite witness

For M with rows `(1,1,1)`, `(1,2,3)`, `(1,4,9)`, take its three row
matrices Q_1,Q_2,Q_3 and the negatives Q_4,Q_5,Q_6 of its column matrices.
Their sum is zero. In any relation, entry (i,j) is
`M_ij(alpha_i-alpha_(3+j))`. Since every M_ij is nonzero, all coefficients
agree. Consequently their span L has dimension five and any five are a
basis. Their supports make all six rank-one matrix directions distinct.

For N in L, write `N_ij=M_ij(x_i-y_j)`. At a row point Q_i, its other
two rows in a tangent matrix must be multiples of row i of M. The resulting
linear system in three coefficients has determinant respectively
`-1/18, 1/3, -2`. Transposing gives the column determinants
`-1/18, 4/9, -3/2`. I expanded all six rational determinants before running
code. Their nonvanishing proves `L intersect T_(Q_s)=C Q_s` for each s.

Thus

    T = sum_(i=1)^5 Q_i tensor f_i
      = sum_(i=1)^4 Q_i tensor(f_i-f_5) - Q_6 tensor f_5

has two distinct unordered five-term decompositions. The third flattening
has independent columns Q_1,...,Q_5; a 5-by-5 minor is 27. Flattening minors
therefore prove border rank at least five, while either decomposition gives
ordinary rank at most five. Both ranks are exactly five, including after
padding to the ambient format 6,6,6.

After a third-factor basis change, a zero sum of tangent vectors has
coefficients `delta P_j + sum_i h_ji P_i=0`. Each delta P_j belongs to L
and to the rank-one tangent at P_j, so is a multiple of P_j. Independence
then forces every original pure-tensor tangent vector to vanish. This gives
the direct sum of five 9-dimensional tangent spaces and rank 45. The three
padding complements add 15,15,5 dimensions. Pair-product independence and
the four distinct tensor-product gradings prove their independence, giving
rank 80 at both points. This is injectivity on the intrinsic 80-dimensional
source; the raw factor parametrization has ten scaling-kernel dimensions.

### Birationality and actual normalization branches

The nonzero pure cone is smooth; the ordered r-fold product with repeated
summands deleted has a free S_r action. Its quotient Y is a smooth
irreducible separated variety, dimension `D=r(n_1+n_2+n_3-2)`. Addition
is dominant onto the reduced secant cone.

The locus Y_full of full column rank in all three factors maps onto the
orbit of `Delta_r=sum_i e_i tensor e_i tensor e_i`. Each r-term decomposition
of this tensor lies in its intrinsic r-dimensional supports by flattening
ranks. Its first flattening image is the diagonal matrix space; the only
rank-one lines there are the coordinate diagonal lines. This proves unique
unordered decomposition, not merely uniqueness in a preferred chart. It
proves dimension D and generic degree one in characteristic zero. Thus
addition is birational. The dense locally closed orbit is open and smooth.

In factor-vector coordinates, loss of rank in an n_j-by-r factor matrix
has codimension n_j-r+1. The smooth torus cover and free finite quotient
preserve this codimension. For n_j>=r+1, `Y minus Y_full` has codimension
at least two. The actual parameters satisfy this condition.

Normal Y lifts to the finite normalization Xbar: integral rational
functions pull back into its integrally closed local rings. Injective
differential at each displayed point implies quasi-finiteness there.
On the simultaneous open quasi-finite locus Y_0, the lift is separated,
birational and quasi-finite to a normal target, hence an open immersion
by Zariski's Main Theorem. The two source points therefore give distinct
normalization points above T. No assumption that all fibers are finite,
that there are exactly two decompositions, or that no boundary points
occur is used.

### The conductor and S2 obstruction

This was the principal adversarial review point. Let A=O_(X,T) be assumed
S2, B its finite normalization, and I its nonzero conductor. B is a
semilocal domain in the common fraction field; it is not treated as a
single branch or a product. Multiplication identifies
`I=Hom_A(B,A)`.

Corresponding prime heights in A and B agree by the affine dimension
formula, the common fraction field and finite residue-field extensions.
Localization at T does not remove any prime below the primes in question.
At height at least two take an A_p-regular sequence x,y. If yf=xg in the
Hom module, evaluation at every b gives f(b) in xA_p; division by x defines
another A_p-linear map. Hence x,y is regular on Hom. Localization to B_q
preserves the injections, and Nakayama supplies the nonzero quotients.
In height one torsion freeness suffices. The conductor is thus S2 as a
B-module.

A prime h minimal over a proper conductor cannot have height at least two:
normal B_h and I_h would both have depth at least two, and the depth lemma
would give depth at least one to the nonzero zero-dimensional module
`(B/I)_h`. It has depth zero. Thus such a minimal prime has height one.
Moreover the conductor is proper at every point over T: a conductor
element avoiding one such point would be a unit in the local ring A,
forcing A=B and contradicting the two normalization points.

The resulting height-one conductor prime through a displayed branch lies
in its Y_0 chart, since an open neighborhood contains all generizations.
Conductors commute with the relevant localization. Above the smooth full
orbit normalization is an isomorphism, so the conductor support in that
chart is contained in `Y_0 minus Y_full`, a set of codimension at least
two. It cannot contain the height-one prime. This contradiction proves
that A is not an S2 ring, and therefore is not CM.

The distinction between "A is not S2 as a ring" and "depth A<2" matters.
The proof correctly asserts the former; the failure may occur at a further
prime localization. A CM local ring has CM localizations, so this still
proves the required failure of CM without the stronger unproved assertion.

### Homogeneous vertex

The homogeneous prime ideal in S=C[z_1,...,z_216] has height 136. If the
homogeneous vertex were CM of dimension 80, Auslander--Buchsbaum would give
projective dimension 136 there. A minimal graded free resolution remains
minimal at the homogeneous maximal ideal, so its global length is 136.
Localize it at the closed tensor point T. The local polynomial ring has
dimension 216 and X has local dimension 80, forcing depth at least
216-136=80 by Auslander--Buchsbaum. This contradicts the preceding failure
of CM. This closed-point specialization already suffices; the proof's
general height formula for arbitrary primes is also valid.

The proof uses standard finite normalization, smooth finite free quotients
in characteristic zero, the indicated form of Zariski's Main Theorem,
normal implies S2, the depth lemma and Auslander--Buchsbaum. Each is used
with its hypotheses. No unverified contemporary theorem is needed.

## Exact computation and fail-closed checks

The primary author checker, now verification/core/verification/check_witness.py,
was inspected, then executed using
`python3 -I`, both with and without `-O`. It imports only standard-library
modules, validates integer entries and dimensions, and uses explicit
SystemExit conditions. Its elimination modulo 1,000,003 is a correct
lower-bound certificate over Q; trial division through 1000 proves this
modulus prime. The intrinsic source dimensions provide matching upper
bounds. No floating arithmetic or probabilistic rank inference appears.

The recorded results contain fourteen
processes, with identical stdout, stderr and exit code between modes:

| Input | Result in each mode |
| --- | --- |
| Original witness | PASS; border rank 5; pair-product ranks 5; tangent ranks 45,80 at both decompositions |
| Author equality control | FAIL: tensor equality |
| Author rank control | FAIL: pair-product independence |
| Author distinctness control | FAIL: decompositions must be distinct even after scaling and permutation |
| Own common third-factor projection f_5 -> f_1+f_2+f_3+f_4 | FAIL: small tangent rank must be 45; tensor equality is preserved |
| Own boolean in an integer slot | FAIL: integer entries required |
| Own zero factor | FAIL: zero factor |

The original passed with exit 0; all corruptions exited 1 by explicit
SystemExit. The three added corruptions were stored outside the reviewed
files. The author's secondary implementation was neither opened nor run;
only the primary author checker was executed.

For an independent exact recomputation, I wrote a separate chart-rank
checker. It reconstructs both decompositions
from M without reading the author's JSON or importing its code. In each
pure-tensor chart it fixes one nonzero coordinate of each of the first two
factors, removing the two scaling freedoms before differentiating. Exact
integer row operations, with gcd normalization, compute Q-rank directly.
Each elimination multiplies the target row by a nonzero rational scalar
and subtracts a multiple of a pivot row, so preserves rational rank.

Its six recorded processes give:

| Input | Normal and optimized result |
| --- | --- |
| Displayed M | PASS; chart ranks [[45,80],[45,80]] |
| Rank-one M corruption | FAIL; ranks [35,70] |
| Repeated-summand corruption | FAIL; ranks [36,64] |

This calculation uses integers, not modular arithmetic or floating point.
The chart construction and integer elimination were independently audited
by a supporting sub-auditor of this review, after that sub-auditor's own
derivation had been fixed. A further supporting finite-data audit, also part
of this review, made its own rational/integer checks. I inspected that
independent implementation and its report. It recomputes
the six determinants by Fraction permutation expansion and the raw Jacobian
ranks by integer cross-elimination. Its twelve normal/optimized processes
include five rejected corruptions. Thus the completed review records 32
mathematical checker processes in total, all with the expected behavior and
identical paired outputs under optimization. These checks do not replace
the separate written conductor and geometry proof.

## Literature check and its limits

Fresh free sources include Oeding, *Are all Secant Varieties of Segre
Products Arithmetically Cohen-Macaulay?*, arXiv:1603.08980v2, whose Conjecture
1.1 is exactly the all-format assertion. Its inheritance results impose
additional hypotheses and do not contradict the counterexample.

The initial catalogue citation was Jagiełła--Jelisiejew, *Unrestrictions
and concise secant varieties*, arXiv:2604.24879v2. A fresh arXiv API query
located v3, updated 2026-09-19, which was fetched and reviewed as well.
Conjecture 3.32 in v3 still states the all-Segre-secant aCM assertion and
is followed by "The conjecture is wide open." Its positive statements
about rank four or normalizations do not establish CM of the rank-five
variety here. The independent bounded search and exact public-source
provenance were recorded.
In particular, v3's Theorem 1.2 is a positive statement for the normalization
of the fourth secant in format 4,4,4; Remark 3.31 discusses the concise
rank-five model and future work. Neither is a prior proof of this negative
result for the actual rank-five secant cone.

Targeted searches addressed non-CM/non-normal Segre secants, rank five,
Oeding's conjecture and later counterexamples. No prior source proving
this non-CM result was located in the usable results. Some web search
endpoints returned redirects, challenges or unrelated pages; these were
recorded as unusable, not counted as successful negative searches. The
arXiv API and primary manuscripts provided usable evidence. This establishes
the observed public status and search outcome, not exhaustive novelty.

## Supporting independent derivations and disposition

Three supporting derivations, parts of this review, were completed and fixed
before their sub-auditors read or ran checker implementations: one on the
decomposition geometry, birationality, codimension and branch separation;
one on the conductor/depth argument and the vertex, whose final report also
audits my checker; and one on the explicit tensor, determinant expansions,
flattening minor and tangent ranks.

All substantive assertions have been rederived; the exact checks support
the finite witness and do not purport to automate the algebraic geometry.
There is no required correction and no missing hypothesis that changes the
theorem. The verdict is ACCEPT of the claimed full disproof.
