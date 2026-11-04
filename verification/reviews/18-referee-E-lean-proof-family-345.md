# Referee report E: the Lean proof for the 3×4×5 witness

Reviewed: the complete Lean project for `TR25Family.finiteCertificate` now in lean/family-345/, with earlier versions of its verifier and README.

Verdict: **ACCEPT**. Required changes: none. Acceptance is for the finite certificate at X_5(3,4,5), not the geometric family theorem.

## Statement and source binding

The 73 listed files of the copied project and its manifest were verified before review. The 22-module source inventory has digest `a71414dfdd5d7f35f86b2a6dacf1c6f6f972ab94c4c9c6578c79e8100d845cc7`; it is byte-identical to lean/family-345/audit/source-hashes.json. No author objects or cache were copied. The mathematical reference (the 17 files of the family package) was copied and its manifest verified.

The accepted files are unchanged and byte-identical to the repository files; the accepted scope note was also unchanged:

| File | SHA256 |
|---|---|
| lean/family-345/TR25Family/Statement.lean | bdfddcb1cd1f528576d8d65f0e19259b405b7b530c2155cbd096a2b44de43d21 |
| lean/family-345/TR25Family/Definitions.lean | cdefbfb9a0f7525cb7203f251e8a4321af38ecce94708558390e66b6b3f7b2d4 |

The theorem is precisely `TR25Family.finiteCertificate : TR25Family.FiniteCertificate`, without hypotheses. Its 14 fields prove the two literal five-term integer tensor sums, nonzero terms, pairwise nonproportionality over all complex scalars, a direction absent from the other decomposition, complex flattening ranks 3,3,5, both sets of pair-product and third-factor ranks 5, the six rational ratio determinants, and both full 60 by 60 coordinate Jacobian ranks 50. The fourth B coordinate is zero; the witness is not asserted concise in that ambient factor.

## Independent build and axiom check

PASS. All 22 local library modules were compiled from an initially empty reviewer-owned output directory, using the official Lean executable directly in dependency order. The copied author axiom file and independently written ReviewerAxioms.lean also compiled: all 24 compiler invocations exited zero. This is a clean direct-compiler build, not a claim to have run `lake build`.

Lean is v4.34.0-rc2 (commit 6a10ac8c22beadecabdbb0919c2b50214762f91d); Mathlib is 85e3a25e006c35636f0e53b0e9296caca2685bc0. All nine dependency revisions matched the lockfile, with clean source state. The official dependency cache was reused read-only; its 113,766-file path/size/mtime inventory remained unchanged. LEAN_PATH contained only fresh local objects and the pinned dependency libraries. An explicit environment allowlist excluded inherited compiler/plugin overrides.

The independent probe wraps the theorem at exactly TR25Family.FiniteCertificate, prints the structure and theorem, and prints both dependency sets. Both outputs are exactly `[propext, Classical.choice, Quot.sound]`; no sorryAx, custom or native-checking axiom occurs. The actual output was recorded.

The job used a 12 GiB memory limit, one CPU, and Lean -j1 -M12288. Maximum recorded child RSS was 3,429,936 KiB. All 74 fixed input files and 30 copied build inputs were unchanged afterward. A build receipt retains each command, exit status, log/object hash and dependency check.

## Source and proof review

I independently read the accepted definitions and statement, assembly, finite arithmetic, flattening and pair-rank arguments, and all general/kernel/rank assembly proofs. The separate source audit read the ordinary proof modules in full and checked the generated modules exhaustively with a strict parser, not merely by sampling their expressions. All 100 row theorems and 6,000 displayed Jacobian coefficients were checked. Both integer right-inverse identities have 2,500 checked entries. The audit's report and source census were kept.

The rank lower bound takes 50 output rows and all 60 parameter columns. The integer product with a 60 by 50 matrix is 36I; casting to C and rescaling yields rank 50. The independent upper bound uses ten factor-rescaling directions, two per term. Their product with the full Jacobian is zero, and a diagonal minor with weights ±1 gives rank 10. The product-zero rank inequality gives rank(J)+10 ≤ 60. No secant dimension or geometric tangent identification is used as a hidden premise.

The broad scan covers all 23 submitted Lean sources, seven Python sources, and three build/dependency configuration files. No local placeholder, additional axiom, unsafe/extern/implemented_by declaration, native_decide, native reduction axiom, kernel/debug checking override, custom macro/elaborator/syntax, initialization hook, or decision override occurs. Every raw hit was retained and explained:

- Five ordinary modules set `backward.isDefEq.respectTransparency false`. I read its registration and implementation in the pinned official Lean `Lean/Meta/ExprDefEq.lean`, including lines 379–419. It restores the older elaborator transparency bump for implicit-argument unification; it does not alter kernel checking.
- Arithmetic and row modules raise `maxHeartbeats`/`maxRecDepth`; these are resource limits. The ten row modules use 8,000,000 heartbeats and recursion depth 10,000. Other finite modules use the limits enumerated in the source audit.
- The author diagnostic uses `#print axioms`. Python hits are rejection patterns, axiom-output parsing, negative-control fixture strings, or generator text for the reviewed resource limits. None is a proof premise.
- Four ordinary `by decide` calls prove two finite index bounds and the two instances of integer 36 ≠ 0. They produce kernel-checked terms. The ordinary TOML library configuration contains no hooks or trust overrides.

The submitted verifier's token regex alone is narrower than the requested review scan. Acceptance uses the independent broader scan, not an inference that the regex covers every prohibited construct.

## Independent arithmetic and controls

The finite audit reconstructs both 60 by 60 Jacobians directly and uses exact integer elimination, obtaining ranks 50,50. It independently matches the accepted 3 by 3 by 5 reference to the added zero B coordinate, checks flattening ranks 3,3,5, all pair ranks 5, the two third-factor determinants 1, and the row determinants (-1/18,1/3,-2) and column determinants (-1/18,4/9,-3/2). It parses both Lean selected-row/inverse data files against the JSON certificate, checks the scaled inverse and scaling-kernel products, and obtains scaling rank 10. Both decompositions have five nonzero pairwise nonproportional terms; all five first-list directions are in fact absent from the second, stronger than the requested existential field.

The copied author check_exact/check_literal_data and their test suites pass normally and under -O (7 exact-test methods and 18 verifier-test methods in each mode). The independently written checker also passes identically in both modes. Fresh padding-coordinate and inverse-entry corruptions fail with explicit rejection in both modes; the source audit additionally rejects +1 inverse corruption separately for each decomposition. These are auxiliary exact checks; Lean proof acceptance rests on the fresh compiler build and kernel dependencies.

## Scope and verdict

The README of that time explicitly says the non-S2/non-Cohen–Macaulay geometry, secant dimension, border rank, tangent identification, normalization/conductor, depth and all-r theorem are outside the formalization. It distinguishes the coordinate matrix rank 50 from geometric dimension 50. This satisfies the requested scope disclosure without weakening the accepted finite statement.

The reviewed files and all reviewer input copies were rehashed at completion. No author source was edited, no author was contacted, and nothing was published.

ACCEPT for the completed proof of exactly the accepted finite certificate.
