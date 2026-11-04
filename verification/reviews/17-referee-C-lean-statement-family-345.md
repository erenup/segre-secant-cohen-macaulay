# Referee report C: fidelity of the Lean statement for the 3×4×5 witness

Reviewed: the Lean proposition `TR25Family.FiniteCertificate` in lean/family-345/TR25Family/Statement.lean and lean/family-345/TR25Family/Definitions.lean, a scope note that is not part of the repository, and an earlier version of lean/family-345/README.md. Only the statement was reviewed; the Lean proof was reviewed separately in report 18.

**Verdict: ACCEPT. No required changes.**

The proposition accurately states the fixed finite certificate needed at the zero-padded 3×4×5 rank-five witness. It neither weakens that finite input nor claims the subsequent geometric conclusions. This is a statement-fidelity review of the specified files, not a fresh Lean proof/build audit.

## Reviewed files and procedure

I copied the prescribed files before reviewing them and verified all three requested SHA256 values. The two Lean files are byte-identical to the repository files:

| File | SHA256 |
|---|---|
| `lean/family-345/TR25Family/Definitions.lean` | `cdefbfb9a0f7525cb7203f251e8a4321af38ecce94708558390e66b6b3f7b2d4` |
| `lean/family-345/TR25Family/Statement.lean` | `bdfddcb1cd1f528576d8d65f0e19259b405b7b530c2155cbd096a2b44de43d21` |

The third prescribed file was a feasibility and scope note. The README of that time was also copied; it is an earlier version of lean/family-345/README.md.

The reference family package was also copied and its complete 17-file manifest verified. The detailed correspondence uses `proofs/PROOF.md` §§3–4 (now verification/core/proofs/PROOF.md) and `new_proofs/REACH_DERIVATION.md` §4 (now verification/core/families/proofs/REACH_DERIVATION.md). The copies, independent derivations and exact checks were kept with this review. No author contact or author-file edit occurred.

## Literal tensor, decompositions and predicates

The integer factor arrays agree exactly with the accepted 3×3×5 witness after adjoining one zero B coordinate. The six matrices `q` are the three row pieces of M followed by the negatives of its three column pieces, hence sum to zero. The literal witness uses q0,…,q4 as its five slices and has zero fourth B column. The alternate final pair product is −q5; its fifth slice is consequently −q0−q1−q2−q3−q5=q4. Both five-term sums therefore equal the specified integer tensor, rather than merely an existential tensor or each other.

The `FiniteCertificate` fields are unconditional requirements of a proposition on these fixed literals. `NonzeroTerms` quantifies all five actual complex pure tensors. `DistinctDirections` forbids proportionality for every distinct pair of indices and every complex scalar. `DifferentDirections` requires a direction in the first list absent from every direction of the second, excluding identification by reordering or rescaling. No empty index type, false antecedent, wrong-field interpretation or existential choice makes these assertions vacuous.

## Ranks and determinants

The complex flattening ranks are exactly **3,3,5**. The B rank3 is correct: this tensor is not concise in its four-dimensional B factor. All AB, AC and BC pair-product matrices have rank5 in each decomposition, as do both third-factor matrices. These are the independence facts used in the written zero-padding argument and in the restricted source with full third-factor rank.

The row-ratio determinants over Q are **−1/18, 1/3, −2**; the column-ratio determinants are **−1/18, 4/9, −3/2**. `otherIndices` takes the other two indices in increasing order, so the signs match the baseline proof. Every ratio denominator is a nonzero literal entry of M. No rank claim is accidentally over the integers, rationals alone, a finite field, or an unspecified field: all required matrix-rank fields explicitly use C.

## The coordinate Jacobian and its exact scope

For the five-term polynomial sum, its (i,j,k) coordinate is

    F_ijk = sum_t a_ti b_tj c_tk.

The first-order variation is

    sum_t (da_ti b_tj c_tk + a_ti db_tj c_tk + a_ti b_tj dc_tk).

The three branches of `jacobian` are precisely these coordinate partials. `Coord 3 4 5` has 60 elements and `Param 3 4 5` has 5(3+4+5)=60 elements. Crucially, all four B variations are included even though the fourth coordinate vanishes at the base point.

Each nonzero pure term has exactly two independent factor-rescaling directions in its parameter kernel. Thus the five terms contribute a ten-dimensional kernel. Complex coordinate rank50 is exactly the finite condition for injectivity of the addition differential on the five pure-tensor tangent spaces, of total dimension5(3+4+5−2)=50. This is a mathematical correspondence check; the Lean proposition itself does not assert a formal derivative or geometric tangent-identification theorem.

At r=5 the written family construction uses the 3×3×5 core, with no extra summands. Its rank45 image and the five new A⊗C directions from fourth-B variation lie on disjoint supports. Hence the padded rank is45+5=50 at both decompositions. The literal formulas and pairAC rank therefore supply exactly the finite input used by REACH §4, rather than relying on an unsupported equality between matrix rank and secant dimension.

## Exact independent corroboration

My exact checker parses the reviewed Lean literals and uses integer/Fraction arithmetic. It independently verifies both tensor sums, pairwise direction separation within each list, all flattening/pair/third-factor ranks, both 60×60 Jacobian ranks, and all six determinants. Its normal and optimized outputs agree. Reversing the alternate final sign and deleting the padded B derivative columns reject with the intended errors in both modes; the latter altered matrices have ranks45,45.

An independent literal audit additionally verifies the absent cross-list direction and rejects six distinct literal/predicate/determinant corruptions identically in normal and optimized execution. The independent geometry audit derives the differential correspondence and padding argument. These finite calculations support this statement review; no Lean proof modules were inspected or compiled, and no new kernel-verification claim is made.

The detailed evidence comprises my derivation and field audit, a literal/direction/determinant audit, and a differential and geometric-use audit, all parts of this review.

## Scope and disposition

The statement, feasibility note and README explicitly exclude non-S2, non-Cohen–Macaulayness, secant-variety dimension and the all-r theorem. The scope documents also separate the normalization/conductor argument, geometric tangent identification, border rank and depth from the finite layer. They identify 50 as a matrix rank. This is accurate, and no correction is requested.
