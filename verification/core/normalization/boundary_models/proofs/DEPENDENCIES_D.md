# Prior inputs and scope of theorem D

This file identifies the mathematical inputs used in [PROOF_D.md](PROOF_D.md).

## [Normalization]

[Normalization proof](../../proofs/NORMALIZATION_FIBERS.md)
SHA256 `604f100ec5faa6aa5469eb9f13d54085a4838cfe496be0dd16c0958cb1ee7b49`.

- Section1: finite unramified configuration incidence; normalization of the
  full-flattening tensor bundle.
- Section2: exhaustive six-point core matrix-Segre intersection, its exact
  polynomial identity, and reducedness via scalar-only tangent intersections.
- Section4: the all-r row/column witnesses, avoidance identity (1), exact
  reduced rank-one intersection, six actual decompositions, and explicit
  arcs proving the dependent configurations occur. That section proves only
  a lower bound r+1 for normalization points and explicitly leaves their
  exact total and boundary regularity open.

The companion [normalization statements](../../proofs/STATEMENTS.md) have SHA256
`9cbc35de9c9508fe74af4e6b0fc576564c7fc3801452202b1280fe17f76ca4bd`.

The full normalization criterion in [Normalization, Section1] requires every
r-subset to be independent and is NOT applied at a dependent boundary.
Only its incidence and tensor-bundle constructions are reused. The new
normality calculation is required to identify the whole normalization.

## [Reach]

[Family derivation](../../../families/proofs/REACH_DERIVATION.md)
SHA256 `49e1a0cbf95bc8a3cc853580d8dc93aca5258cbe227c2bff94f895169be1d072`.

Sections1 and3 give the subset rank-sum/Sylvester generic uniqueness criterion
and birationality in a,b>=3,a+b>=r+2. Section4 gives the flexible row/column
witnesses, avoidance identities and immersion coefficient comparison.
PROOF_D.md Section1 restates the generic uniqueness and exact-intersection
arguments rather than treating the normalization conclusion as a black box.

## [Base]

[Baseline proof](../../../proofs/PROOF.md)
SHA256 `ee50513933d0c18605ea8ae651537803e245f35ed222c3823015f05809c2ad0d`.

Sections3--4 give the explicit integer circuit, unique relation, six rational
tangent determinants, full third flattening and immersion calculation. The
proof of D uses the earlier refinements in [Normalization] for exhaustive intersection.

## New assertions and standard inputs

Theorem D's new work starts at the dependent boundary configurations:
the exact maximal-minor ideal, Schur reduction to linear coordinates plus
mu_i*z_ij, cancellation of auxiliary coefficient coordinates, the fully
saturated Rees subalgebra, all-ell,m normality, and the distinction between
smooth and singular boundary normalization points. These are supplied as
written proofs in PROOF_D.md Sections3--7. They are not conclusions
of the earlier results or of a finite sample.

Standard facts used are: projectivity of Hilb^r(S) for projective S;
closed containment of a finite subscheme in a varying linear space;
proper quasi-finite morphisms are finite; the open normal locus for varieties
over C; finite normalization; the Jacobian and unramified criteria; descent
of normality through smooth covers; free finite-group quotients in
characteristic zero; and the Rees-algebra description of a projective
rational-map graph. The exact scheme computations and toric normality
are proved locally rather than delegated to an unspecified theorem.

The auxiliary parameter `kappa=3a+3b-r-8` counts linear generators of the
rank-deficiency ideal. It does not denote the smooth parameter count `h`
in the separate rank-five exact-local-depth result. That result is NOT
used as an input here.

D includes B and C on their one-sided families. It leaves
A's disjoint diagonal witnesses unchanged and makes no assertion about the
mixed added-row/added-column family.
