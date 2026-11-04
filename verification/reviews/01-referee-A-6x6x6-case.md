# Referee report A: the original 6×6×6 case

Reviewed: the written statement and proof of the original 6×6×6 case now in verification/core/proofs/, the witness and primary checker now in verification/core/verification/, and, after the verdict had been fixed, an earlier version of the secondary checker verification/core/verification/check_five_term_tensor.py.

**Verdict: ACCEPT. No mathematical corrections required.**

The reviewed theorem is a full negative answer to the live catalogue's universal assertion: for the reduced affine border-rank-at-most-five variety X in C^6 tensor C^6 tensor C^6, dim X=80 and depth C[X]_m<80 at its homogeneous vertex. The proof establishes failure of S2 and non-Cohen--Macaulayness; it does not merely establish nonnormality.

## Material reviewed and independence

All 110 manifest entries of the reviewed files matched before review and
again at completion. The reviewed proof has SHA256
`9d1c3cefdfc46e02a9e8c34d3f1d74a4396b1e0f5beb9e8f04210d8a8ba82825`
and the reviewed statement
`cc6e46a4afbfae14dd004d3618cf42b1863497ca2f943ec8106d94392992a0a1`;
these are the source hashes recorded for verification/core/proofs/PROOF.md
and verification/core/proofs/STATEMENT.md in
verification/core/verification/SOURCE_BINDINGS.txt. The witness, SHA256
`4f856a7ff466a5f4116ea11b64bcdbafae31e70b9049cd2492e4f78f765d54e6`,
is byte-identical to verification/core/verification/witness.json.

The initial reconstruction was made from the stated review topics, the public target, STATEMENT.md and witness.json alone. It was completed and fixed before PROOF.md, the author's check summary or any checker code was opened. The post-proof adversarial audit and a separately written checker were completed before any checker execution. A list of mechanisms to examine accompanied the assignment; it supplied no author proof. The author's check summary contains summaries of internal reviews, but their agreement was not used as evidence. No draft or internal-review file and no file or note of the other referee was opened. The author was not contacted and the author's files were not modified.

## Scope against the public target

The exact live README.md and problem.tex were fetched independently; their hashes and URLs were recorded. Both state the universal assertion for k>=3, positive integer mode dimensions and r>=1 over C, with the Zariski closure of sums of r pure tensors and its reduced vanishing ideal. They explicitly ask for Cohen--Macaulayness at the positive-degree homogeneous maximal ideal. Thus k=3, dimensions (6,6,6), r=5, the reduced affine cone and its homogeneous vertex match every part of the target. No restriction on r, conciseness or nonzero tensors excludes this example.

## Independent mathematical findings

1. Let R1,...,R5 be the first decomposition's 3x3 matrix factors, and R6=(1,3,9)^T(0,0,1). Direct computation gives R1+...+R5=R6, and R1,...,R5 are independent. Hence the two displayed five-term tensor decompositions are equal and have different unordered summand sets. The third flattening has rank five, proving border rank at least five; a displayed five-term decomposition proves both tensor rank and border rank equal five. Zero padding preserves these facts.

2. I independently solved the tangent-intersection equations in five coordinates. Each of the six rank-one matrix tangent spaces meets L=span(R1,...,R5) only in its own matrix line. Therefore the core addition differential has rank25+5\*4=45. The extra mode directions in (6,6,6) contribute15,15,5 in disjoint coordinate blocks, giving rank80 at each decomposition. The source has dimension80. Exact independent calculations confirm these ranks and all six determinant values (-1/18,1/3,-2; -1/18,4/9,-3/2).

3. The nonzero rank-one tensor cone is smooth. Removing repeated summands and taking the free finite S5 quotient gives a smooth, separated, irreducible 80-dimensional decomposition space. Full column rank in each mode gives the open GL6^3 orbit of the diagonal tensor. A flattening into the diagonal matrix space proves its unordered decomposition is unique; its only rank-one matrix directions are the five coordinate diagonals. This proves birationality in characteristic zero without importing a generic identifiability theorem. The orbit is open and smooth, so normalization is an isomorphism there.

4. The normal source lifts to the finite normalization of the reduced irreducible affine variety. Both witness points lie in the single quasifinite open locus because their addition differentials are injective. Zariski's Main Theorem identifies that entire locus with an open subset of the normalization. In particular the two source points give two different normalization points over T. No properness of the addition map, complete description of its fibers, or global codimension-one regularity assumption is being smuggled into this step.

5. The crucial conductor step is valid. If A=O_(X,T) were S2, the conductor I=Hom_A(B,A), with B its finite normalization, would be S2 as a B-module. An A_p-regular pair x,y remains regular on the Hom module: yf=xg implies pointwise divisibility of f by x, and division defines an A_p-linear map. Further localization preserves this regular pair. Heights at corresponding primes agree by the finite-type dimension formula and finite residue-field extension; localization at T retains all prime chains below the branch primes. If a minimal prime over a proper conductor ideal had height at least two, depth B_h>=2 and depth I_h>=2 would imply depth(B/I)_h>=1, contradicting the nonzero zero-dimensional quotient. Thus a conductor divisor must pass through each branch over T. Properness at each branch follows because a conductor element invertible at one branch would be a unit at T and make normalization an isomorphism there.

6. In the source chart, failure of full column rank is a union of loci of codimension(6-4)(5-4)=2. Smooth torus descent and the free finite quotient preserve codimension, as does restriction to the open normalization chart. A conductor divisor in that chart cannot be supported inside this codimension-two complement, while the conductor has no support over the smooth full-rank orbit. This contradiction proves A is not an S2 ring, hence is not CM. It does not claim depth A<2 at its maximal ideal.

7. The homogeneous-vertex step is valid. If the vertex were CM, its minimal graded free resolution over the 216-variable polynomial ring would have length216-80=136. Localization retains a resolution of length at most136; Auslander--Buchsbaum and the prime-ideal dimension formula force every localization to be CM, contradicting T. Independently, the non-CM locus is closed for this finite-type C-scheme and invariant under C* scaling, so its containing T forces it to contain the vertex. Both arguments give the exact requested strict inequality depth<80.

The detailed coordinate derivation and localization audit were written out in full. I found no gap in the conductor, normalization or branch argument.

## Exact checks and adversarial controls

The primary author checker, now verification/core/verification/check_witness.py, uses standard-library integer arithmetic, exact fractions and modular ranks over the provably prime1000003. Its modular lower bounds combine with the two independent scaling kernels per nonzero term to certify the exact rational ranks. All decisive checks use explicit SystemExit and survive optimization.

My independently written checker generates coordinate Jacobian rows and uses integer row elimination with gcd rescaling, with no finite-field ranks or external algebra package. It confirms tensor equality, different actual unordered decompositions, flattening ranks(3,3,5), all three pair-product ranks5 for both decompositions, tangent ranks(45,80) for both, all six one-dimensional tangent intersections, and the six rational determinants.

The primary author's positive check and three built-in negative controls were run normally and with `python3 -I -O`. Both modes have identical outputs and exit statuses. I added two substantive corruptions: a common rank-four C-mode collapse with every factor still nonzero, and the all-ones 3x3 matrix construction. Both preserve tensor equality. The first reduces flattening rank to4 and both core differential ranks to41; the second retains flattening rank5 and pair independence but reduces both differential ranks to35. Both are rejected in both modes by both implementations. An earlier collapse also created a zero factor and was correctly rejected; its record is retained, and the stronger nonzero collapse was added rather than overstating that first test.

All 22 pre-verdict runs behaved as expected. Positive runs took0.02--0.03s each and at most14332KB peak RSS; commands, outputs and exit statuses were recorded. The computer checks certify only the finite tensor/rank data; the commutative-algebra conclusion was reviewed as a written proof.

The author's optional secondary implementation was excluded until the verdict had been fixed. Its later reproduction, described below, cannot supply the independent derivation above.

## Literature and priority

The public catalogue still marks the universal question open/partially resolved. The independently fetched Oeding preprint1603.08980v2 states Conjecture1.1; Jagiełła--Jelisiejew2604.24879v2 states Conjecture3.32 and explicitly says the conjecture is wide open. Their scope agrees with the target reviewed here.

I additionally searched OpenAlex, the arXiv API and Crossref, and examined the returned titles/abstracts. Targeted normality searches led to Bürgisser--Ikenmeyer, *Geometric Complexity Theory and Tensor Rank*, arXiv1011.1350, Corollary7.2, and *Fundamental invariants of orbit closures*, arXiv1511.02927, Corollary5.26. They already prove nonnormality of the m-th unit-tensor orbit closure in (C^m)^tensor3 for m>=5. That related nonnormality is prior work and must not be presented as new. It does not state the non-S2/non-CM conclusion for the present (6,6,6), r=5 example; nonnormality alone would be insufficient. Neither paper contains a Cohen--Macaulay assertion resolving this case in the text inspected.

No prior statement of this non-Cohen--Macaulayness or of a full counterexample to TR-25 was located in the searched results and primary sources. This is a bounded priority check, not a guarantee of novelty. The initial Google/DuckDuckGo requests were blocked or unusable and one Bing response was unrelated; their saved outputs were not treated as successful searches. The subsequent bibliographic APIs did return relevant sources. Fetch records, result summaries and primary-source snapshots were kept.

The theorem is accepted on its complete written proof and exact certificates. No formal Lean verification or exhaustive historical novelty claim is made.

## Reproduction after the verdict

The mathematical ACCEPT verdict above was fixed before the secondary source was opened. Only after that, the secondary checker (an earlier version of verification/core/verification/check_five_term_tensor.py, which ran its two negative controls by default) was inspected and run normally and with `python3 -I -O`. It reconstructs the witness from the displayed matrix, checks both tangent ranks modulo101, and rejects its equality and repeated-summand controls. Both runs passed with identical output, in0.06--0.07s and at most12368KB peak RSS. No draft or internal review was opened. The verdict and its mathematical basis are unchanged.

All24 recorded runs behaved as expected. The reviewed files were rehashed at completion and all110 original manifest entries still match.
