# Referee report G: the mixed boundary models

Reviewed: theorems E1 and E2 with their proofs now in verification/core/normalization/boundary_models/proofs/ (STATEMENT_E.md, GEOMETRY_E.md, ALGEBRA_STAR.md, DEFORMATION_LEMMA.md, DEPENDENCIES_E.md), and the exact checks now in verification/core/normalization/boundary_models/verification/.

**E1: ACCEPT. E2: ACCEPT. No corrections required.**

The proofs establish the exact statements in the reviewed
STATEMENT_E.md, including every stated padding and endpoint.
This is one independent review. Its component audits are supporting
work within it and do not count as additional reviews.

## Material reviewed and independence

| Reviewed file | SHA256 | Relation to the repository file in verification/core/normalization/boundary_models/proofs/ |
|---|---|---|
| STATEMENT_E.md | `85f147de54733bddd8488221aafc4b9e3563844aa3cc9ad0acffe4eb8952f8a2` | source of STATEMENT_E.md |
| GEOMETRY_E.md | `90f67c686313e9b6e3e0a91a9a0d3083b346698ded5a0f6b406f80705deb378c` | source of GEOMETRY_E.md |
| ALGEBRA_STAR.md | `0f1890d9dff64ef2146beab0a50789a706b3aef139fbae767bda73a926fb63ba` | byte-identical |
| DEFORMATION_LEMMA.md | `0158411339602e599cc1ed1eff93c76b75dabe6f55c0574e2ca8349c153e5bf8` | byte-identical |
| DEPENDENCIES_E.md | `79fb365236382cdd8196b86686347c31f36dabb86450bb80d44e58e77fbdf056` | source of DEPENDENCIES_E.md |

The source hashes are recorded in verification/core/normalization/boundary_models/verification/SOURCE_BINDINGS.txt.

All 20 manifest members were verified, together with the complete 22-file
inventory including the manifest and the author's integrity record. Both the author's
files and the review copy were rechecked unchanged. No author material
outside the reviewed files was opened for this review.

I read only the statement before writing and fixing my independent
outline. My prior exposure consists of my own earlier rank-five work and
the completed theorem D review, explicitly disclosed in that outline. Each
component auditor separately fixed a statement-only derivation before
opening proof or checker content. No contact with the author or the other
referee occurred, and no other referee's review was read.

My full line audit was fixed before I read the component reports. It
expands the arguments below so the verdict does not rest on a checklist or
agreement among auditors.

The completed component reports are a geometry audit (E1/E2 geometry
ACCEPT), an algebra audit (E1/E2 algebra ACCEPT), and a verification audit
(finite diagnostics PASS). I read each and authenticated all 64 members of
their three component manifests before completing this report.

## Exact embedded geometry

The maximal-minor ideal is the remaining-column residual ideal on an
invertible (r-1)-pivot chart. The auxiliary relation construction gives
the exact ideal `J=(w,I)`. Absorbing only unit core coefficients and
performing the displayed reversible block substitutions reduces the
vector relation to independent solved coordinates plus
`U' Delta (V')^t`. Direct substitution reproduces the Schur residual
without a higher-order remainder.

The auxiliary-coordinate cancellation is valid scheme-theoretically:
`dw` lies in the span of the independent solved differentials because
the residual quadratics have zero differential. An invertible coefficient
minor permits replacement of r-1 solved coordinates by w, leaving the
quadratic variables fixed. The resulting coordinate change is etale.
Restricting to w=0 therefore leaves precisely
`I=(l_1,...,l_kappa,Q)`, with `kappa=3a+3b-r-8` and independent nonlinear
variables. It introduces no extra equations among p, q, x, z, u and v.

With only columns retained, a left inverse of the retained V' frame
gives exactly `(q_j y_ij)`. With one row retained, independent invertible
frame changes on the two factors give exactly

    (p z_j+q_j x_j, p u_h, q_j v_ij).

The indices are those stated in E1 and E2. In particular, no off-diagonal
term mixing different j or unrecorded higher-order term remains.

The graph chart is the actual subalgebra `O_F[I/t]` in `O_F[t^-1]`.
It is not replaced by the unsaturated numerator equations. Etale flat
base change preserves ideal powers and hence the Rees graph. The other
linear ratios split off as smooth coordinates.

The explicit arcs can use a pivot avoiding the omitted new row/column.
Along each arc all retained relation coefficients stay identically zero,
so every nonlinear residual is identically zero. The residual derivative
detects the omitted matrix and supplies a nonzero linear t-direction.
All remaining ratios tend to zero. This selects exactly the homogeneous
origins of the stated R and B models, including opposite omitted/retained
types. The resulting assertion is the precise smooth equivalence in the
statement.

## Universal normality and tangent dimensions

For the star algebra, adjoining the monomials
`H_ij=v_ij G_j-x_j Q_ij=p z_j v_ij/t` is legitimate. At every intermediate
stage, the all-power denominator ideals for `E_j=q_j x_j/t` are exactly
`(t,v_1j,...,v_alpha,j)^n`. The monomial removal argument works for every
n, including alpha=0. Product telescoping then gives the full relative
kernel before localization. Successive adjoining gives the complete
multivariate kernel, including cross-relations.

The kernel relations lift to strictly lower total q-degree remainders.
The finite reduction therefore terminates and proves equality of the
associated graded algebra with the displayed monomial algebra; this
is not a guessed initial-term degeneration. Including H explicitly
gives finite generation of the weighted Rees algebra.

Each negative-t generator corresponds to one path in the stated network.
Its integral resource capacities encode exactly its p, q, x, z, u, v
exponents. Integral max-flow converts every real feasible integer demand
to integer generator multiplicities. The monoid consequently equals its
cone intersected with its full lattice, proving normality of the initial
algebra for all nonnegative k, alpha and beta.

The deformation lemma has the correct direction and hypotheses. In a
local finite-type domain with normal domain quotient by f, finite
normalization, the unique height-one valuation over f, and normality of
the quotient give `N=D+fN`. Nakayama gives `N=D`. For the graded Rees
algebra, the closed invariant nonnormal locus, if nonempty, would have
a grading limit on xi=0, where the local lemma rules it out. Localization
and intersection with the original fraction field prove normality of
the star algebra. This uses neither improper specialization logic nor
properness of that deformation family.

The pure R model has a separate exact integer-allocation saturation
proof. Both algebras are standard graded in their original generators.
Multiplication by t and comparison of distinct numerator monomials proves
linear independence in degree one; the added H elements have degree two
and do not enlarge the cotangent basis. Dimension comes from the unchanged
base rational function field. Thus their excesses are exactly sm and
`k(alpha+1)+beta`.

## Entire fibers, unramifiedness, and per-item verdicts

The reduced proper Hilbert graph satisfies scheme-theoretic containment
of each configuration in the varying span. Its fiber is a closed
subscheme of the Hilbert scheme of the reduced (r+1)-point Segre
intersection. That Hilbert scheme consists of the discrete reduced
r-subsets, so repeated and infinitesimal configurations are excluded.
The explicit arcs realize all dependent subsets. The six independent
subsets are smooth graph points.

Every remaining graph point is normal by the exact models above. Removing
the proper images of the non-quasi-finite and nonnormal loci identifies
the graph with the finite normalization near the whole fiber. There can
be no additional splitting over a dependent configuration. The reduced
fiber has zero relative tangent spaces; differentials and Nakayama prove
unramifiedness, which extends to a neighborhood by openness and properness.
The full-third-flattening tensor locus is the surjective-map bundle over
the span variety. Its normalized pullback adds rc smooth dimensions and
preserves the entire fiber and unramifiedness.

| Item | Verdict and exact accepted conclusion |
|---|---|
| E1 | **ACCEPT.** For all stated r,a,b,c: exactly r+1 reduced normalization points, six smooth actual points; omitted row model `R_(r-6,a-3)` with excess `(r-6)(a-3)`; each omitted column model `B_(r-7,a-4,b-r+4)` with excess `(r-7)(a-3)+b-r+4`. All boundary points are singular. At r=7 the star model reduces to `R_(1,b-3)`, as stated. The transposed family is included. |
| E2 | **ACCEPT.** For every stated a,b,c: exactly ten reduced points, six smooth actual points; two omitted-row models `B_(2,a-4,b-5)` with excess `2a+b-11`, and two transposed models with excess `a+2b-11`. All four boundary points are singular. Both beta=0 endpoints are included. |

For both items every point has dimension `r(a+b+c-2)`, embedding dimension
equal to that dimension plus the stated excess, and the normalization
morphism is unramified near the whole fiber. Transport under the stated
factor permutations follows by the corresponding isomorphisms.

## Exact executions and additional corruptions

The unchanged standard-library checker has no assert statements and uses
integer/Fraction arithmetic. Its preserved earlier scope sentence is explained
in the author's check summary and is not used as a claim about theorem E.

I checked every entry of the execution receipt against its saved stdout/stderr and exit
status. Sixteen executions gave the intended outcomes:

- The unmodified copied checker passes normally and with `-O`, with
  identical output matching the archived positive output.
- All five built-in controls were also run separately in each mode and
  reject for their intended reasons: singular matrix, wrong circuit rank,
  corrupted Jacobian, wrong first elimination sign, wrong second multiplier.
- Added corruption 1 reverses the sign of all column circuit directions.
  It rejects with `REJECT: circuit relation` in both modes.
- Added corruption 2 deletes the bilinear term from the cycle equations.
  It rejects with `REJECT: rank one point satisfies cycle equations` in
  both modes.

Mutations exist only in private reviewer copies. All positive/control
pairs have identical normal/optimized status and output. The copied
files remain unchanged. The finite checks establish the fixed core
identities only; universal star normality, exact charts, exhaustion and
unramifiedness are justified by the written proofs audited above.

There is no requested correction or unresolved proof obligation for E1
or E2. No conclusion beyond their stated local families is included in
this acceptance.
