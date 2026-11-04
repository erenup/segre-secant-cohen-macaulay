# Referee report A: the Lean proof for the 6×6×6 witness

Reviewed: the complete Lean project for `TR25.finiteCertificate` now in lean/witness-666/, with earlier versions of its audit scripts and README.

**Verdict: ACCEPT. No corrections required.**

This accepts `TR25.finiteCertificate : TR25.FiniteCertificate`
for the exact statement previously accepted by the statement reviewer. It
accepts the finite certificate layer only, not a Lean formalization of the
geometric TR-25 disproof.

## Statement and source identity

I copied the project, including the sources, configuration, lockfile,
toolchain, witness and audit files. No compiled TR25 artifact was copied.
All 60 entries of the supplied source manifest match, as do the accepted
inputs, which are byte-identical to the repository files:

| File | SHA256 |
|---|---|
| lean/witness-666/TR25/Definitions.lean | 32506bbaac127706ce4eca7a62ce7dd51a5f79b677122840e99950a1ddcb8f9d |
| lean/witness-666/TR25/Statement.lean | 6aa442f9872b58239ee191601909eb9d9ee39eb89031df6d03ef3a8442a0f3a0 |
| lean/witness-666/certificate/witness.json | 4f856a7ff466a5f4116ea11b64bcdbafae31e70b9049cd2492e4f78f765d54e6 |

The final theorem file, lean/witness-666/TR25.lean, has SHA256
`f50ffdafc48c72d8c569d50f0730c04a203f96791bc8aa73590ccfdbc33d17bf`.
The copied source snapshot is unchanged after verification. The author was
not contacted and no author project file was modified. I did not rely on
the author's internal integration-review conclusions.

The theorem supplies all 14 accepted fields without additional hypotheses:
both five-term tensor identities and their padding; nonzero, distinct and
different complex directions; both flattening ranks five over C; the six
rational determinants; and both coordinate-Jacobian ranks 45 and 80 over C.
The definitions, coefficient fields, indices and quantifiers are unchanged.
The literal-data check binds the factor arrays to the accepted JSON witness.

## Independent clean build and axiom check

I compiled all 48 proof modules, including the unimported generic determinant
module, from source into an initially empty `clean_build/` directory. The
reviewer-written driver calls the pinned Lean compiler directly in dependency
order, with one Lean thread, under a 16 GB memory limit. It does not invoke
the author's audit driver, reuse the author's TR25 oleans, or write through
Lake into the dependency cache. The unchanged Lake configuration is also
included in the source binding.

Lean is v4.34.0-rc2, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d.
Mathlib is pinned to 85e3a25e006c35636f0e53b0e9296caca2685bc0. All nine
dependency Git HEADs match the lockfile and have no tracked source changes;
their existing cache is read only in this compilation.

All 50 compiler invocations (48 modules and two probes)
exited zero. Elapsed time was 1006.14 seconds; the largest
measured compiler RSS was 3952380 KiB (3.769 GiB).
The only diagnostics were ordinary unused-variable, unused-simp-argument
and tactic-style linter warnings.

My own probe file type-checks the exact theorem type and extracts
rank fields before printing the theorem's dependencies. Its exact output is:

```text
'TR25.finiteCertificate' depends on axioms: [propext, Classical.choice, Quot.sound]
```

The author's separate probe also passed against these newly compiled modules.
The build driver, build record, probe and per-module logs and timing
records were kept.

## Proof-source audit

Both ripgrep and an independent Python scan covered all 49 submitted Lean
files, including comments and strings. No sorry/sorryAx, admit, custom axiom,
unsafe, implemented_by, extern, native_decide, ofReduceBool, custom syntax,
macro or elaborator, initialization, run_meta/run_tac/run_elab, #eval,
#reduce, debug kernel bypass, or trust-level override occurs. The expected
`#print axioms` command only reports dependencies.

Every option hit is explained. maxRecDepth and maxHeartbeats raise resource
limits. Four `backward.isDefEq.respectTransparency false` settings permit
more unfolding during elaborator unification; I checked their definition
in the pinned Lean Meta/ExprDefEq source. They do not disable or alter kernel
proof checking. The broader non-Lean scan finds only the verifier's token
patterns/error text and deliberately invalid strings in negative-control
fixtures. Those temporary fixtures are not proof imports.

I also checked the proof assembly. Integer right-inverse identities
`A B = 36 I` are proved from the literal coordinate matrices and transported
to C using a proved nonzero scalar. The padded upper bound uses an explicitly
proved rank-ten scaling kernel, giving rank at most 90-10=80. The flattening
minor has determinant 27, and the padded factorization supplies its upper
bound. Generated proof text is checked by Lean; Python generation is not a
trusted mathematical oracle. Detailed findings and every option location
were recorded with the saved grep logs.

The copied audit's 14 control groups passed normally and under Python -O.
The literal-data check passed in both modes and rejected its two corruptions.
Two additional reviewer-authored Lean probes deliberately demand wrong ranks
(4 instead of 5; 81 instead of 80); both are rejected by actual type mismatch.
A preliminary negative-probe attempt used an insufficient 2048 MB Lean
memory limit and was discarded as inconclusive. Its log is preserved; the
accepted rerun uses an 8 GB memory limit and fails for the intended
mathematical type mismatch.

## Scope

The README of that time states plainly that border rank, geometric tangent-space
identification, normalization/conductor arguments, non-S2 and
non-Cohen--Macaulay geometry, and homogeneous-vertex depth are outside this
formalization. The formal ranks concern the defined coordinate matrices.
The previously accepted written TR-25 geometric proof remains a separate
mathematical result. There is no claim here that it is now formalized in Lean.
