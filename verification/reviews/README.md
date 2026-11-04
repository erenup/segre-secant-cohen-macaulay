# Review record

These reports record the independent informal AI-agent audits of the
paper's mathematics. Each auditor worked separately from the other auditor
of the same result and was not the author of the result it reviewed (see
the independence notes below), checked every step, and ran its own exact tests or builds. Each report states what
was read before its auditor's own derivation was written, including any
permitted exposure to the submitted proof. No report claims formal
certification or external peer review.

| Report | Scope | Verdict |
|---|---|---|
| [01](01-referee-A-6x6x6-case.md) | Original 6×6×6 case: catalogue scope, explicit witness and tangent ranks, birationality and normalization branches, conductor and S2 obstruction, homogeneous vertex, exact checks and literature | Accept; no corrections |
| [02](02-referee-B-6x6x6-case.md) | Same scope, independent referee | Accept; no corrections |
| [03](03-referee-A-family-theorem.md) | Family theorem for every r≥5: codimension-two bad locus, smooth target charts, conductor transfer, uniform integer witnesses, the ancillary rank-five threshold, adjacent Cohen–Macaulay family, projective and invertible-slice statements, and the exact checks | Accept; no corrections |
| [04](04-referee-C-family-theorem.md) | Same scope, independent referee | Accept; no corrections |
| [05](05-referee-A-normalization-fibres.md) | Normalization fibres, items A–E: finite reduced intersection criterion, six-point core and six decompositions, rank-five fibre and higher-rank lower bound, local inverse branches, retracts and the conductor | Accept; no corrections |
| [06](06-referee-D-normalization-fibres.md) | Same scope, independent referee | Accept; no corrections (two optional presentation remarks) |
| [07](07-referee-A-higher-rank.md) | Higher-rank fibres A–C: diagonal extensions, rank-six row witness, row family with three-dimensional second factor | Accept; no corrections |
| [08](08-referee-D-higher-rank.md) | Same scope, independent referee | Accept; no corrections |
| [09](09-referee-E-local-ring.md) | Completed local ring at the rank-five circuit witness: exact presentation, depth, embedding dimension, multiplicity, normalization and conductor | Accept; no corrections |
| [10](10-referee-C-local-ring.md) | Same scope, independent referee | Accept; no corrections |
| [11](11-referee-F-one-sided-boundary.md) | One-sided boundary model, theorem D: exhaustion, embedded minor ideal, saturated Rees chart, toric normality, tangent excess, entire normalization | Accept; no corrections |
| [12](12-referee-G-one-sided-boundary.md) | Same scope, independent referee | Accept; no corrections |
| [13](13-referee-F-mixed-boundary.md) | Mixed boundary models, theorems E1 and E2: embedded ideals, star algebra and its normality, deformation lemma, tangent excesses, entire normalization | Accept E1 and E2; no corrections |
| [14](14-referee-G-mixed-boundary.md) | Same scope, independent referee | Accept E1 and E2; no corrections |
| [15](15-referee-B-lean-statement-witness-666.md) | Fidelity of the Lean proposition `TR25.FiniteCertificate` to the finite facts of the 6×6×6 proof (statement only) | Accept; no changes required |
| [16](16-referee-A-lean-proof-witness-666.md) | Lean proof of `TR25.finiteCertificate`: clean build, axioms, source audit, negative probes | Accept; no corrections |
| [17](17-referee-C-lean-statement-family-345.md) | Fidelity of the Lean proposition `TR25Family.FiniteCertificate` to the finite input of the family proof at 3×4×5 (statement only) | Accept; no changes required |
| [18](18-referee-E-lean-proof-family-345.md) | Lean proof of `TR25Family.finiteCertificate`: clean build, axioms, source audit, exact arithmetic | Accept; no changes required |
| [19](19-referee-E-paper-draft-1.md) | Fidelity of an earlier draft of the paper on the 6×6×6 case to the accepted proof, its history and credit, finite examples and build | Accept; no corrections (optional editorial suggestions) |
| [20](20-referee-A-paper-draft-2.md) | Fidelity of an earlier draft of the paper with the family theorem to the accepted family proofs, its references, finite checks and build | Accept; no corrections |
| [21](21-referee-A-paper-draft-3.md) | Fidelity of an earlier draft of the paper with the normalization section to the accepted normalization proofs, and preservation of the previous draft | Accept; no corrections |

Reports 01, 03, 05, 07, 16, 20 and 21 are by referee A; 02 and 15 by B;
04, 10 and 17 by C; 06 and 08 by D; 09, 18 and 19 by E; 11 and 13 by F;
12 and 14 by G. The two reports on each written result are by different
referees, and the Lean statement and Lean proof of each certificate were
also reviewed by different referees.

Independence notes. Reports 12 and 14 state that referee G had prior
involvement with the rank-five results on which theorems D, E1 and E2
build; reports 11 and 13, by referee F, are independent of that work.
Referee E had prior involvement with the Lean certificate of the 6×6×6
witness that the draft of report 19 describes; that certificate's statement
and proof were reviewed by referees B and A (reports 15 and 16). The proofs
of item E in `RETRACTS_AND_CONDUCTOR.md` and in
`paper/sections/normalization.tex`, lines 282–304, are taken from the
derivation in report 05 (referee A); report 06, by referee D, independently
gives the same arguments, and report 21, also by referee A, is not an
independent check of that passage.

No report requires a correction, so there is none to incorporate. Every
optional suggestion of reports 06 and 19 is taken up by an editorial
change that alters no mathematical claim. From report 06, the short
proofs of item E are in
[RETRACTS_AND_CONDUCTOR.md](../core/normalization/proofs/RETRACTS_AND_CONDUCTOR.md),
lines 3–5, and in
[paper/sections/normalization.tex](../../paper/sections/normalization.tex),
lines 282–304; the least-singular-value form of item D is stated for
$`d>0`$ in the same file, lines 275–278, and in
[README.md](../../README.md), lines 202–205, while the reviewed
`STATEMENTS.md` in `core/normalization/proofs/` is unchanged. From
report 19, the Landsberg–Weyman question is located at p. 3 of the
arXiv version in
[paper/sections/history.tex](../../paper/sections/history.tex), line 5;
the range of Theorem 2.4 of Catalisano, Geramita and Gimigliano is
stated in lines 27–38 of that file; the bibliography entry found unused
is cited in lines 42–45; and the citation of Zariski's Main Theorem in
[paper/sections/conductor.tex](../../paper/sections/conductor.tex),
lines 141–148, shows the integral scheme finite over the normalization
through which the open immersion factors. The scope limits that the
reports record are stated in the repository: no exact vertex depth, no
exact depth at $`T_r`$ for $r\geq6$, no assertion
$`\mathrm{depth}\,\mathcal O_{X_r,T_r}<2`$, and no decision of
$`X_5(3,4,4)`$ or $`X_5(4,4,4)`$
([README.md](../../README.md), lines 303–318 and 391–396); the Lean
theorems prove finite certificate layers only
([lean/witness-666/README.md](../../lean/witness-666/README.md), lines
11–14; [lean/family-345/README.md](../../lean/family-345/README.md),
lines 10–16).

The reviewed files relate to the repository as follows.

- Reports 01 and 02 reviewed the statement and proof now in
  [core/proofs/](../core/proofs/). These differ from the reviewed files only
  in file references and the removal of provenance and process sentences;
  [SOURCE_BINDINGS.txt](../core/verification/SOURCE_BINDINGS.txt) records
  the reviewed and the current hashes. `witness.json` and `check_witness.py`
  in [core/verification/](../core/verification/) are byte-identical to the
  reviewed witness and primary checker. Report 02 did not open the
  secondary checker `check_five_term_tensor.py`; report 01 ran it only after
  its verdict, and the current file differs from that version only in its
  docstring and in selecting its negative controls on the command line. The
  current file is byte-identical to the version run in reports 03 and 04.
- Reports 03 and 04 reviewed the six family documents now in
  [core/families/proofs/](../core/families/proofs/), together with the
  current `core/proofs/PROOF.md` and `STATEMENT.md` and the exact checks of
  the rank-five witness. The two finite-case files are byte-identical to the
  reviewed ones. The six family documents differ from the reviewed files
  only by the removal of provenance, status and process sentences, updated
  file references and section headings. In `core/verification/`, both
  checkers, `witness.json`, `CHECKERS.txt`, `NEGATIVE_CONTROLS.json` and
  `SOURCE_BINDINGS.txt` are byte-identical to the reviewed files, and
  `run.py` differs only by the added invocation of the normalization suites.
  The finite-instance checks in [core/family-instances/](../core/family-instances/)
  were not part of their material (see report 20).
- Reports 05 and 06 reviewed statements A–E and the proof now in
  [core/normalization/proofs/](../core/normalization/proofs/).
  `NORMALIZATION_FIBERS.md` is byte-identical; `STATEMENTS.md` differs only
  in the heading of item E. `check_normalization_identities.py` and
  `run_checks.py` in [core/normalization/verification/](../core/normalization/verification/)
  are byte-identical to the reviewed checker and runner; the outer `run.py`
  was added later. `RETRACTS_AND_CONDUCTOR.md` was not part of the reviewed
  material: the reviewed proof contained no separate proof of item E, and
  both reports prove item E themselves. That file is taken from the item-E
  part of the derivation of report 05, whose hash is the source hash
  recorded in [SOURCE_BINDINGS.txt](../core/normalization/verification/SOURCE_BINDINGS.txt);
  report 06 gives the same arguments.
- Reports 07 and 08 reviewed the four proof documents now in
  [core/normalization/higher_rank/proofs/](../core/normalization/higher_rank/proofs/)
  and `PRIOR_INPUTS.md`. These differ from the reviewed files only by the
  removal of status and provenance sentences and updated file references;
  [SOURCE_BINDINGS.txt](../core/normalization/higher_rank/verification/SOURCE_BINDINGS.txt)
  records the reviewed and the current hashes. `certificate.json` and
  `check_exact.py` are byte-identical; `run.py` was added later. The
  prior-input snapshots they reviewed are byte-identical to the current
  `core/proofs/PROOF.md`, `core/families/proofs/REACH_DERIVATION.md`,
  `core/normalization/proofs/STATEMENTS.md` and `NORMALIZATION_FIBERS.md`.
- Reports 09 and 10 reviewed the statement and proof now in
  [core/normalization/local_ring/proofs/](../core/normalization/local_ring/proofs/).
  These differ from the reviewed files only by the removal of status and
  provenance sentences and updated references; in `PROOF.md` this moves
  every line cited in report 09 one line earlier.
  [SOURCE_BINDINGS.txt](../core/normalization/local_ring/verification/SOURCE_BINDINGS.txt)
  records both hashes. `CERTIFICATE.json`, `INPUT_HASHES.json`,
  `check_certificate.py`, `check_core.py` and both negative-control
  fixtures are byte-identical; the reviewed driver is now `run_checks.py`,
  byte-identical, and the outer `run.py` was added later.
- Reports 11 to 14 reviewed theorems D, E1 and E2 now in
  [core/normalization/boundary_models/proofs/](../core/normalization/boundary_models/proofs/).
  `ALGEBRA_STAR.md` and `DEFORMATION_LEMMA.md` are byte-identical; the
  statements, `PROOF_D.md`, `GEOMETRY_E.md` and both dependency files differ
  only by the removal of status and provenance sentences and the relabelling
  of references to the earlier normalization theorem and to file paths,
  so the line numbers of `PROOF_D.md` cited in report 12 are unchanged.
  [SOURCE_BINDINGS.txt](../core/normalization/boundary_models/verification/SOURCE_BINDINGS.txt)
  records the reviewed and the current hashes. `certificate.json` and
  `check_exact.py` are byte-identical; `run.py` was added later.
- Report 15 reviewed `TR25/Statement.lean`, `TR25/Definitions.lean` and
  `certificate/witness.json`, which are byte-identical to those in
  [lean/witness-666/](../../lean/witness-666/); the README it checked has
  since been rewritten. For report 16, all 49 Lean source files, the Lake
  configuration, lockfile, toolchain and witness are byte-identical;
  `audit/verify.py`, `audit/test_verify.py` and
  `audit/check_literal_data.py` were later extended to pin the complete
  source inventory (now in `audit/source-hashes.json`) and the definitions
  file and to authenticate the helper program, and the README was rewritten.
- Report 17 reviewed `TR25Family/Statement.lean` and
  `TR25Family/Definitions.lean`, which are byte-identical to those in
  [lean/family-345/](../../lean/family-345/), and a scope note that is not
  part of the repository. For report 18, all 23 Lean source files, the
  certificate data, the generator script, the Lake configuration, lockfile
  and toolchain, `audit/source-hashes.json` and the audit scripts other than
  `audit/verify.py` are byte-identical; `audit/verify.py` was later extended
  to authenticate its Python helper programs, and the README was rewritten.
- Report 19 reviewed an earlier, single-file 12-page draft of the paper on
  the 6×6×6 case only. No source file of the current [paper/](../../paper/)
  is byte-identical to it: the current paper is restructured into section
  files, states the family theorem as Theorem 1.1 with the 6×6×6 case as
  Corollary 1.2, and adds the family, boundary and normalization sections.
  The accepted proof and statement that report 19 compared against are
  byte-identical to the current `core/proofs/` files.
- Report 20 reviewed an earlier, 24-page draft of the paper with the family
  theorem.
  `boundaries.tex`, `main_proof.tex`, `verification.tex`, `witness.tex`
  and `refs.bib` are byte-identical to the current files; `geometry.tex`
  differs only by one trailing blank line, `conductor.tex` only by one
  trailing blank line and the expanded citation of Zariski's Main Theorem,
  and `history.tex` only by the page locator of the Landsberg–Weyman
  question (line 5) and the statement of the range of Theorem 2.4
  (lines 27–38). Its family-instance checks differ from the current
  [core/family-instances/](../core/family-instances/) only in the avoidance
  negative control, which now replaces the avoidance vector of the first
  added term by the root $`v(1)`$ in both decompositions and is rejected by
  the derivative-rank check, instead of testing the nonvanishing condition
  at $t=1$ directly; the logs changed accordingly. Its `main.tex` differs
  from the current one by the line that inputs the normalization section
  (added in the draft of report 21) and by the changes listed for report 21.
- Report 21 reviewed an earlier, 51-page draft of the paper with the
  normalization section.
  `refs.bib` and eight of the eleven section files are byte-identical to
  those now in [paper/](../../paper/). The other three differ only by the
  editorial changes listed above: `history.tex` by the page locator of the
  Landsberg–Weyman question (line 5) and the statement of the range of
  Theorem 2.4 (lines 27–38), `conductor.tex` by the expanded citation of Zariski's
  Main Theorem, and `normalization.tex` by stating the least-singular-value
  form of item D for $`d>0`$. `paper/main.tex` differs from the reviewed draft
  only in the document class options and page layout, the title and
  subtitle, the author block and PDF metadata, and the closing statements
  and declarations, which replace the acknowledgement placeholder; the PDF
  was rebuilt and now has 42 pages.
