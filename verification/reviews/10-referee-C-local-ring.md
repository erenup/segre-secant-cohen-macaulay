# Referee report C: the completed local ring

Reviewed: the statement and proof of the completed local ring now in verification/core/normalization/local_ring/proofs/, and the exact checks now in verification/core/normalization/local_ring/verification/.

**Verdict: ACCEPT. No correction is required.** The proof establishes the exact completed local ring, not merely its tangent cone or six parametrized pieces.

This is one independent review; the component audits below are part of it and do not count as further reviews.

## Exact scope and bindings

For the specified rank-five six-point circuit tensor over C, with a,b>=3, a+b>=7 and c>=5, put q=2(a+b-6) and h=3a+3b+5c+2. I accept

    C[[z_1,...,z_h, x_(i,j) : 1<=i<=6, 1<=j<=q]]
        / (x_(i,j)*x_(k,l) : i!=k).

Consequently the local dimension is h+q=5(a+b+c-2), depth is h+1, embedding dimension is h+6q and multiplicity is 6. The normalization of this complete ring is the product of its six regular branch rings. Its conductor is the ideal of all x variables, with quotient C[[z_1,...,z_h]]. At 6x6x6 the respective dimension, depth and embedding dimension are 80,69,140. This verdict makes no higher-rank, global, vertex-depth or arbitrary-tensor claim.

The reviewed statement and proof have SHA256
`6a95237ee75336be462e1714d0071ea33a5bf6d99c6e164a91ddae96e249ac5b` and
`3a71b96df3debe8fac2a81ba37f7050a9ab54bc5fbac62860e8a1e8f71eb664f`,
the source hashes recorded for verification/core/normalization/local_ring/proofs/STATEMENT.md and PROOF.md in verification/core/normalization/local_ring/verification/SOURCE_BINDINGS.txt.

All twelve manifest entries were verified, and the reviewed files were rechecked unchanged at completion.

## Independence and derivation order

I read the statement and wrote and fixed an independent outline before reading the proof or verifier implementation.

The outline independently recovered the residue groups, shared graph values, simultaneous translation and fiber-product algebra. I then read the proof line by line and wrote a detailed section-by-section review. Supporting geometry, algebra and verification components of this review also fixed their own derivations before their assigned proof or implementation reading. I read and checked each component report before this verdict. Only the reviewed files were accessed: no internal geometry/algebra/tangents derivations of the author, author contact, or other referee's review was used. The author's files and the review copy were not edited.

## Decisive mathematical checks

1. **Core chart.** The exact six-point reduced matrix-Segre intersection is exhausted algebraically. Its incidence is a smooth dimension-20 Grassmann bundle; the invertible differential gives a finite etale six-section chart after shrinking. Labeling after an etale base change preserves the completed local ring at the chosen complex point.
2. **Residues in all formats.** The residue maps are surjective vector-bundle maps: representatives can be corrected by multiples of the six factor vectors to enforce their sole relation. Their kernels have ranks 3(a-3) and 3(b-3). This gives six independent groups of dimension q, also when either complementary factor dimension is zero.
3. **Exact simultaneous translation.** Each omitted-index branch has an actual regular last-block graph H_i over its residue axis, and all H_i restrict to the same H_0 at zero residues. The single invertible translation by H_0+sum_i(H_i-H_0) straightens every branch as a scheme. Pairwise tangent independence alone is not used to infer this conclusion.
4. **Exhaustion.** The padded incidence is finite unramified near its full reduced fiber; flatness is neither asserted nor required. Its distinct-five-tuples locus is open and closed, hence finite. Independence failures have proper closed image disjoint from the witness and can be removed. This excludes collided, dependent or other hidden boundary branches. Equality of the resulting reduced closed loci proves the exact six-graph scheme description.
5. **Tensor and completion transfer.** The full rank-five flattening chart is the surjection bundle over the span variety and contributes 5c smooth parameters. Flat completion preserves the finite intersection of branch ideals, which is exactly the cross-group monomial ideal.
6. **Local algebra.** The exact sequence from the six branch rings to five copies of the common ring gives depth h+1 since q>=2. The Hilbert series gives multiplicity 6 and the minimal quadratic presentation gives embedding dimension h+6q. Adjoining branch idempotents gives the finite normalization; testing these idempotents proves the conductor formula and reduced common intersection. These are deductions from the exact ring, not extrapolations from finite tangent checks.

## Exact execution and corruptions

The copied driver, now verification/core/normalization/local_ring/verification/run_checks.py, passed normally and under `-O`. Complete stdout agrees byte for byte, stderr is empty, and stdout SHA256 is `1b7d3a0b020d2110d2224fc8f35644bf8b3884d4b74e4811e6c918d97ff58745`, the value recorded in verification/core/normalization/local_ring/verification/RUNNER_OUTPUT.sha256. Each runner invocation checks seven cases in both child modes, including all five registered controls with their exact intended rejection reasons: torus polynomial, core determinant, row arc, all-span modular inverse and common tangent membership.

Two new structural corruptions were made only in isolated copies, beyond those registered controls:

- Changing a quotient correction coefficient from -9 to -8 rejects with `FAIL: quotient kills circuit`.
- Replacing the circuit basis-transport subtraction by addition rejects with `FAIL: branch differential condition`.

Each changed checker rejects with code 1 and the same exact reason in normal and optimized Python. Each changed copy whose input hashes were not updated also fails the outer runner with `FAIL: input digest check_certificate.py` in both modes. The audit receipt, commands, outputs, mutation sources and hashes were preserved; the 53-entry audit manifest was checked.

The inner runner authenticates five computational inputs. The independently verified outer manifest binds the statement, proof, runner and inner input manifest. These distinct integrity layers are not conflated. Finite checks establish the core identities and the three listed tangent formats; the all-format nonlinear local-ring theorem rests on the written proof reviewed above.

## Conclusion

No mathematical defect, missing hypothesis or required artifact correction was found at the reviewed hashes.
