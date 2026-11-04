# Referee report G: the one-sided boundary model

Reviewed: theorem D with its proof and dependencies now in verification/core/normalization/boundary_models/proofs/ (STATEMENT_D.md, PROOF_D.md, DEPENDENCIES_D.md), and the exact checks now in verification/core/normalization/boundary_models/verification/.

Verdict: **ACCEPT, with no required corrections**, for theorem D at the exact reviewed hashes below. This is one independent review. The geometry, algebra and executable component audits are part of it and do not supply a second acceptance.

For every r≥6, a≥r−2, b≥3, a+b≥r+2 and c≥r over C, at the specified one-sided added-row witness T_row, I accept the complete statement: ordinary and border rank r; exactly r+1 reduced normalization points; six smooth points corresponding to the six actual decompositions; and r−5 boundary points with the stated smooth/etale local model

    C[t,mu_i,z_ij,mu_i*z_ij/t],  1≤i≤r−6, 1≤j≤b−3,

inside the Laurent polynomial ring. This toric algebra is normal. At each boundary point, dimension is r(a+b+c−2) and embedding dimension is r(a+b+c−2)+(r−6)(b−3). All boundary points are smooth exactly when r=6 or b=3 and singular when r≥7 and b≥4. The normalization is unramified on a neighborhood of the witness; when all fiber points are smooth its entire source can be made smooth over a smaller neighborhood. Factor permutations transport the witness and conclusions. No mixed row/column, arbitrary-tensor, global-normalization, CM, exact-depth or rational-singularity claim is accepted beyond this scope.

## Material reviewed and independence

The reviewed statement and proof have SHA256 `adfad689af2540db78fe3fd382512e387309590437f1b1a3d59babf599fb77ec` and `b04258fc64f220c54b03c3bcdea51d65ce7bae42f1f96d514e5680d9078868ac`, the source hashes recorded for verification/core/normalization/boundary_models/proofs/STATEMENT_D.md and PROOF_D.md in verification/core/normalization/boundary_models/verification/SOURCE_BINDINGS.txt.

I copied only the reviewed files, verified all 18 manifest entries, and inventoried all 20 files including the manifest and the author's integrity record. The assignment used STATEMENTS.md as a filename; the actual STATEMENT_D.md and PROOF_D.md match its advertised digest prefixes, so there is no mathematical input ambiguity.

I read only the statement before writing and fixing an independent outline, before opening proof or checker content. That outline independently derives the monoid capacity inequalities and normality and identifies the embedded ideal, saturated Rees chart, and proper exhaustion as the geometric obligations. I disclosed my own earlier work on the rank-five circuit. Each component auditor separately fixed a derivation before proof/code access. No author internal files, author contact, other referee's report or other referee contact was used. The original and copied files were preserved unchanged.

My complete line audit was written out. Its decisive checks are as follows; the proof line numbers are those of the reviewed PROOF_D.md and are unchanged in the repository file:

| Proof lines | Obligation | Result |
|---|---|---|
| 14–72 | Exact intersection, six decompositions and generic birationality | The all-parameter avoidance and scalar tangent arguments exhaust the r+1 reduced rank-one points. The sole circuit relation classifies all r-subsets. The subset rank-sum/Sylvester criterion proves generic uniqueness in precisely the stated range. |
| 76–114 | Proper graph and all possible configurations | Universal scheme containment puts the entire fiber in the Hilbert scheme of a reduced finite set, excluding collisions and infinitesimal configurations. Explicit missing-row arcs include every dependent subset. |
| 118–194 | Actual dependence ideal | Pivot elimination gives the maximal-minor ideal exactly. Invertible block substitutions and the regular left inverse of the retained-row matrix reduce the auxiliary relation ideal to independent linear coordinates plus mu_i\*z_ij. |
| 196–214 | Removing relation coefficients without losing the embedded model | An invertible coefficient minor replaces selected linear coordinates by the auxiliary graph coordinates while keeping mu,z. The exact ideal equality and etale Jacobian permit restriction to the original factor-vector chart. |
| 218–251 | Actual saturated Rees chart and selected point | The rational span graph is the blowup of the true minor ideal; its t-chart is the Laurent subalgebra O_F[I/t]. Full saturation is retained. The missing-row arc has nonzero linear residual and identically zero z, placing the boundary point at the homogeneous toric origin. |
| 255–301 | Normality and embedding dimension for all parameters | Integer row/cell capacity allocation proves the exact cone–lattice description. The intersection of Laurent and monomial valuation rings proves integral closure. The degree-one generators give the exact embedding excess (r−6)(b−3), including both zero-size cases. |
| 305–336 | Entire normalization, reduced fibers, unramifiedness | All graph points over the witness are normal. Proper shrinking makes the graph finite normal birational, hence the full normalization. Its ordered version is a closed subscheme of finite unramified distinct-point incidence, proving the scheme assertions even at singular source points. |
| 340–362 | Tensor transfer and scope | The rank-r surjection bundle adds rc smooth dimensions, preserves normalization fibers and unramifiedness, and gives the asserted local dimension and embedding dimension. |

Two delicate distinctions were checked explicitly. The calculation is of the actual embedded maximal-minor ideal, not its radical or tangent cone. The toric chart is the saturated subalgebra, not the generally incorrect presentation with only t\*w_ij=mu_i\*z_ij; for ell=1,m=2 that presentation admits extra points excluded by z_1\*w_2=z_2\*w_1. The submitted proof avoids both errors. Local normality is established before identifying the graph with the complete normalization.

I read and checked both independent written component audits, of the geometry and of the algebra. They agree with my line audit.

The executable audit also passes. Sixteen isolated runs cover the clean checker, all five registered corruptions externalized as private certificates, and two additional false polynomial identities, each in ordinary and optimized Python. Return code, full stdout and full stderr agree between each mode pair. Clean output matches both archived candidate outputs byte for byte; stderr is empty. Every corruption exits 1 at the intended mathematical guard.

The two added corruptions replace H−K=b−a by H−K=a−b, rejected at `linear elimination`, and replace the factor a(a−1) by a(a+1), rejected at `quadratic elimination`. These change mathematical identities while preserving the checking guards. All mutations occur only in isolated review copies. The checker uses exact rational/polynomial arithmetic and explicit failures; no assertion disappears under optimization. Full evidence and replay commands were recorded.

The checker certifies the fixed core rank, Jacobians and elimination identities. It does not certify the all-r toric chart or normalization by finite sampling. The author's check summary accurately states this limit and explains the preserved earlier wording in its final output line. The all-parameter conclusions are accepted on the written proof above.

No required mathematical or artifact correction remains at the reviewed hashes.
