# Referee report D: the higher-rank normalization fibres

Reviewed: statements A–C and their proofs now in verification/core/normalization/higher_rank/ (proofs/ and PRIOR_INPUTS.md), and the exact checks now in its verification/ directory.

**A, B, and C are all accepted as stated, with no corrections.** This is one
independent review; the other referee's review is separate.

## Exact accepted scope

All varieties are reduced over C and all normalizations are finite in the
variety's own function field.

| Item | Range | Complete normalization fibre at the stated tensor |
| --- | --- | --- |
| A: diagonal extensions | Every r>=6, a,b>=r-2, c>=r | Exactly six reduced smooth points, one per actual unordered decomposition; no boundary point |
| B: rank-six row witness | a>=4, b>=3, c>=6, a+b>=8; also the stated factor swap | Exactly seven reduced smooth points: six actual decompositions and one dependent core boundary configuration |
| C: row family with dim B=3 | Every r>=6, a>=r-1, c>=r | Exactly r+1 reduced smooth points: six actual decompositions and r-5 dependent configurations, each omitting one added row direction |

For every item, there is a Zariski neighborhood of the tensor whose entire
normalization is smooth and whose normalization map is unramified. The
displayed tensor has rank and border rank exactly r. Permuting tensor
factors preserves the respective statement.

This accepts no claim of global normalization smoothness, global CM or
rational singularities, arbitrary enlargement of B in C, or the unresolved
mixed row/column family. The rank-five theorem, original finite rank-one
intersections and prior lower bound are not counted as new results.

## Material reviewed and independence

- All 19 manifest members of the reviewed files were verified. The reviewed
  STATEMENTS.md has SHA256
  `5814bb3f636571b4059063b34947d650fd7edd1ef0560150d53d52bdea646bb7`,
  the source hash recorded for
  verification/core/normalization/higher_rank/proofs/STATEMENTS.md in
  verification/core/normalization/higher_rank/verification/SOURCE_BINDINGS.txt.
- My independent derivation was fixed before any access to the proofs or
  checker. It contains the valuation exclusion for A, local span graph and
  smooth blowup centre for B, residual differential for C, complete fibre
  counts, unramifiedness, and normalization transfer.
- Supporting sub-auditors independently fixed statement-only derivations
  before their own proof access. Their work is supporting evidence within
  this one review, not additional reviews.
- The author was not contacted; no author files outside the reviewed files
  and no other referee's report were inspected.

## Decisive mathematical checks

For A, the Schur-complement valuation argument handles arbitrary pole order
and all ranks/paddings. Simultaneously fixing retained diagonal factors
uses invertible DVR changes reducing to the identity. Pole clearing forces
the unique core circuit, and the omitted diagonal entry has incompatible
orders k and >=k+1. Independently, I obtained a constant-rank quotient
exclusion: fixing the first three core left factors and last three core
right factors puts all six moving core matrices in
E=A0 tensor B + A tensor B0; the quotient span of retained diagonal
directions has independent reduction and cannot acquire the omitted one.
Transverse finite Segre intersection excludes collisions. Thus no hidden
configuration remains in the proper fibre.

For B, the residual maximal-minor ideal equals the relation-incidence ideal
after eliminating five pivot coefficients. On the unit-coefficient chart,
the lifted relation AB^t=0 is solved scheme-theoretically by
A2=-A1 D C^-1 and E=D C^-1 F. After the five relation parameters and twelve
factor scalings, the centre has dimension 3a+3b+2 and codimension
3a+3b-14. This establishes a smooth reduced centre, not just the expected
tangent dimension. Its normal space is
(A0 tensor B + A tensor B0)/L0. The graph is its Rees blowup, and the row
direction selects exactly one smooth exceptional point.

For C, the relation coefficients of retained added points really are zero;
the proof does not divide by them. The three core row right factors form
a basis of the three-dimensional B, so core tangent variations alone
surject onto (A tensor B)/K. The residual maximal-minor ideal is consequently
a smooth complete-intersection centre. Its exceptional fibre is the whole
P((A tensor B)/K), giving exactly one graph point for each omitted added
direction. This surjectivity is why the restriction dim B=3 matters.

For B and C, the proper Hilbert graph has fibre a closed subscheme of the
Hilbert scheme of r-element subsets of the finite reduced Segre intersection.
That scheme is discrete and reduced. The local blowup calculations produce
every permitted subset and prove its smoothness, so the entire fibre is
exhausted and reduced. Generic unordered birationality follows independently
from the full-spark/Sylvester argument when r<=a+b-2, an inequality satisfied
by all accepted formats. Proper shrinking therefore identifies the finite
smooth graph with the entire normalization and yields an unramified
neighborhood. The full-rank third-flattening surjection bundle preserves
these conclusions for tensors.

A complete line-by-line comparison, with supporting independent
derivations and post-access comparisons, was written out.

## Exact checks and independent corruptions

The supplied standard-library checker passes normally and under Python
`-O`, with byte-identical stdout/stderr. All five built-in reason-specific
negative controls reject. I inspected its exact arithmetic and fail-closed
logic; it uses no optimization-sensitive assertions.

Two added corruptions also reject in both modes with identical results:

1. Change `every_five_rank` from 5 to 4: exit 1,
   `REJECT: five point independence`.
2. Change M33 from 9 to 8, while coherently recomputing its determinant and
   all six Jacobian certificate values: exit 1,
   `REJECT: second elimination identity`.

The second corruption deliberately survives the determinant and Jacobian
checks before failing an independent polynomial identity. Original candidate
files remain unchanged. The altered certificates, checker copies and actual
execution records were kept with a replay script.

Additional independent core arithmetic confirms that the nine 2x2 minors
in five slice coordinates have mixed-product coefficient rank nine, with
a nonzero 9x9 determinant 1728. Their projective zero set is precisely
five coordinate points and the all-ones point, with Jacobian rank four at
each. A separate exact row-direction determinant is
-z(z-3)^2(z-1)(z+3), nonzero for all real z>=4. Supporting checkers pass
normally and under `-O`, with their own rejected negative controls.

These computations support the fixed core and parameter identities. The
all-r valuation, blowup, properness and normalization assertions are accepted
on the written proofs and independent derivations, not extrapolated from
finite tests.

## Disposition

**ACCEPT A; ACCEPT B; ACCEPT C. Required corrections: none.**
