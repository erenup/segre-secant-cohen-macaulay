# Referee report A: fidelity of an earlier draft of the paper (family theorem)

Reviewed: an earlier, 24-page draft of the paper with the family theorem, against the family statements and proofs now in verification/core/families/proofs/ and verification/core/proofs/, with the exact checks now in verification/core/verification/ and an earlier version of verification/core/family-instances/.

Verdict: **ACCEPT**. No required changes.

This is the requested paper-fidelity review against the previously accepted family results, not a new blind review of that theorem. The author’s internal notes, reports, research/provenance material, and reviews were not read. Only the manifest, paper sources, PDF, public-reference files, and certificate dependencies were used; all inspected paper material was first copied and verified.

## Reviewed version

- The reviewed draft had 24 pages: `main.tex`, seven section files, a
  bibliography and a submitted PDF, with copies of the finite certificate
  and of the family-instance checks.
- The accepted reference was the 17-file family package: the statements and
  proofs now in verification/core/families/proofs/ and
  verification/core/proofs/, and the exact checks now in
  verification/core/verification/.
- The finite proof, Lean statement, and definitions copied with the paper
  match the accepted files byte for byte.
- All inspected paper material was first copied and verified; all
  constituent hashes, build outputs, checker logs, and source receipts were
  recorded.

## Statement fidelity

Every principal result has the accepted quantifiers and scheme structure:

| Paper | Accepted statement |
| --- | --- |
| Theorem 1.1 | Item 1: reduced complex three-factor secants, every integer r≥5, a,b≥3, a+b≥r+2, c≥r, with factor permutations; dimension r(a+b+c−2), non-S2/non-CM, vertex depth defect, explicit integer ordinary-rank/border-rank-r local witness |
| Corollary 1.2 | Item 2 and the original finite instance: X5(3,4,5) has dimension 50; X5(6,6,6) has dimension 80; Xr(3,r−1,r) has dimension 2r²; all unit-tensor orbit closures Xr(r,r,r), r≥5 |
| Corollary 1.3 | Item 4: the corresponding projective local rings at the nonzero displayed classes are not CM |
| Theorem 6.1 | Item 3: no two distinct immersive r-term decompositions for 1≤r≤4 in arbitrary finite-dimensional three-factor formats; sharpness is for this mechanism |
| Proposition 6.2 | Item 4: X5(3,3,c) is ambient for c≤5 and the generic 9×c rank≤5 determinantal variety for c≥5; hence CM for every c≥1 |
| Propositions 6.3–6.4 | Item 5: invertible-slice uniqueness/tangent-kernel alternative, and distinct smooth concise-secant lifts of the original witness |

The paper does not classify rank≤4 secants, other formats, higher tensor orders, or CM of normalizations. It does not assert depth less than two at the witness, an exact depth, or a two-point bound on the complete normalization fiber. It supplies no Hilbert, isospectral-Hilbert, Quot, Haiman, or Artin–Hochster counterexample.

## Proof fidelity and referee reading

I read the complete paper sources. The following are substantial details checked directly, rather than inferred from agreement with the theorem statement.

1. **Section 2, Lemmas 2.1–2.4 and Proposition 2.5:** these faithfully expand `REACH_DERIVATION.md` §§1–3. The subset-rank argument proves independence, absence of extra rank-one directions, and zero projective tangent space. The rank-stratum codimension calculation covers t=2 and the boundary a+b=r+2. The entire decomposition source is restricted to independent C-columns, so c=r introduces no missing divisor estimate. The finite incidence proof establishes generic length r before using Nakayama; a rank-zero submodule of R^r over the domain R is zero. The subsequent shrinking, finite étale ordering cover, and inverse morphisms are justified on families, not just closed points. The full-flattening bundle equality is proved in both directions with reduced structures. Generic uniqueness and characteristic zero then establish birationality.
2. **Section 3:** the conductor argument faithfully expands the original finite proof. It proves I≅Hom_A(B,A), supplies the regular-sequence argument for I to be S2 over the normalization, justifies equality of prime heights, and uses the depth lemma at a minimal conductor prime. Multiple points over the closed point force the conductor to be proper at both. The quasi-finite locus is the only locus to which Zariski’s Main Theorem is applied. Localization preserves the relevant heights, and an open neighborhood contains generalizations of its points, so the divisor contradiction is valid. No global quasi-finiteness or codimension-one smoothness is silently assumed.
3. **Section 4:** the matrix factors, signs in the second decomposition, six rational determinants, and tensor flattening are faithful to the finite proof. The two avoidance identities are written out. The mixed added-row/added-column tangent comparisons include the E⊗F block and work when both added spaces are nonzero. Empty lists at r=5 are covered. The third-coordinate indices in (4.18) use exactly r coordinates. The explicit choice p=max(3,r+1−b), q=r+1−p satisfies all seed bounds. Padding contributes three disjoint derivative blocks with the claimed dimensions. Proposition 4.6 is the supporting construction already proved in the accepted package, not an extension of the non-CM theorem to the raw seed formats.
4. **Section 5:** the minimal graded resolution remains minimal at the homogeneous maximal ideal; Auslander–Buchsbaum and the polynomial-ring height formula give CM at every localization under the contrary vertex hypothesis. The projective argument uses the actual Laurent-product chart and a regular parameter, establishing the local equivalence needed at the displayed class.
5. **Section 6:** the rank≤4 dimension estimate, support restriction, circuit argument, and both support pairs (2,2)/(2,3) are complete. The positive adjacent family uses the rank-45 core and the matching determinantal dimension. The invertible-slice proof retains nonconcise first factors, identifies intrinsic joint eigenspaces, and gives a nonzero differential kernel when labels repeat. For the concise lifts, the first Hom factor is projectivized while the concise tensor factor is affine, as required. The intermediate conciseness conditions, smooth unit orbit, principal-bundle descent, and distinctness modulo a possible common scalar are all addressed.

No step is compressed beyond a specialist referee’s reading, and no mathematical repair or unsupported strengthening was needed.

## History and references

Seven primary PDFs were fetched independently from their specified arXiv URLs during this review: Landsberg–Weyman, Catalisano–Geramita–Gimigliano, Raicu, Bürgisser–Ikenmeyer (both papers), Haiman, and Stark. All seven match the paper’s supplied PDF hashes. Oeding and Jagiełła–Jelisiejew match my independent earlier primary-source downloads. Receipts and extracted text are in the review directory.

- **Oeding Conjecture 1.1 and Jagiełła–Jelisiejew Conjecture 3.32:** both assert universal arithmetic CM of Segre secants. The latter explicitly identifies this with CM of the affine cone. The paper refutes their actual reduced complex assertion, without adding a conciseness or balanced-format restriction.
- **Landsberg–Weyman Theorems 1.1–1.3:** the stated positive cases are correct. The proof of Theorem 1.1 identifies the relevant affine subspace variety and gives rational singularities, supporting the arithmetic conclusion. The paper’s dimensions for the other two cases are within the sources’ ranges.
- **Catalisano–Geramita–Gimigliano Theorem 2.4:** it gives the stated determinantal unbalanced cases. For the adjacent family, use n1=n2=2, N=8, n=c−1≥5, and s=5; this is precisely case (2). The c≤5 cases have separate proofs in the paper.
- **Oeding Theorem 3.2:** the range σ4(Seg(P²×P²×Pⁿ)), n≥3, is correct.
- **Raicu Corollary 4.2:** cubic flattening-minor ideal generation is correctly distinguished from an arithmetic-CM theorem.
- **Bürgisser–Ikenmeyer Corollary 7.2(2) / Corollary 5.26:** the all-r≥5 unit-orbit nonnormality claims and their arXiv numbering are accurate. The new result concerns these same orbit closures and strengthens nonnormality to non-S2/non-CM; nonnormality is not used as a proof of non-CM.
- **Haiman Conjecture 5.2.1:** the literal conjecture concerns normality and CM of the isospectral Hilbert scheme; the principal-component statement is a consequence, as the following source paragraph says.
- **Stark Theorem 3.2 / Conjecture 3.2 and Jagiełła–Jelisiejew Definition 3.14(a):** the stable framed Quot presentation and full commuting scheme are distinguished correctly from the reduced minimal-border-rank locus. The paper makes no converse inference from failure of the universal secant conjecture.
- **Stacks Project:** all 15 cited tags were retrieved and checked, including normalization finiteness/lifting, the quasi-finite locus, Zariski’s Main Theorem, free finite quotients, height/dimension facts, the depth lemma, CM localization, and Auslander–Buchsbaum. The statements and hypotheses match their uses.

## Finite checks, Lean scope, build, and hygiene

- The original finite runner passes both checkers in normal, optimized, and alternate-hash-seed modes, with all 15 registered negative-control runs and both proof bindings. The first attempt on my deliberately restricted copy failed closed because I had not yet copied its public `proofs/` dependencies. After copying and verifying those two manifest-bound files, the complete-copy run passed; this was a review-copy setup issue, not a paper defect.
- The new family-instance runner (an earlier version of verification/core/family-instances/run_checks.py) passes normal and optimized executions, identical positive output, and all four mutation categories in both modes. The enumeration is exactly 15 seeds plus 15 one-factor paddings plus the 5×5×8 example: 31 pairs. The arithmetic is integer/rational or over the verified prime 101. The paper explicitly treats these as finite corroboration; the all-r conclusion uses the written proof. The avoidance control checks failure of the displayed nonvanishing condition at t=1.
- Section 7’s Lean assertions match `TR25.FiniteCertificate`: fixed equality/distinctness, flattening ranks, six determinants, and coordinate Jacobian ranks 45/80. The scope is the original 3×3×5 core and 6×6×6 padding only. Border rank, geometric tangent identification, family dimension, normalization, conductor, S2, CM, and vertex depth are explicitly left to the written proof. No new Lean theorem is claimed.
- A fresh `latexmk` build succeeds (24 pages) with no undefined references/citations, LaTeX warnings, or overfull boxes. The submitted and rebuilt PDFs have byte-identical extracted text. Author and acknowledgement placeholders are present.
- Term scans for process and internal names pass on `main.tex`, all seven section files, and the bibliography together. No process history or internal identities appear in the manuscript.

The report binds the submitted version above. There are no mandatory corrections and no changes were made to the author’s files.
