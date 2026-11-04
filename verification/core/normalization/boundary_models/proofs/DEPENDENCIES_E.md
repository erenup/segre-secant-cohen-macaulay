# Dependencies and scope of E1 and E2

This file binds the prior citations in [GEOMETRY_E.md](GEOMETRY_E.md).
The new mixed normality and boundary conclusions are proved by this
package, rather than assumed from an earlier theorem.

## Prior inputs

### [Normalization]

[Normalization proof](../../proofs/NORMALIZATION_FIBERS.md)

SHA256 `604f100ec5faa6aa5469eb9f13d54085a4838cfe496be0dd16c0958cb1ee7b49`.

- Section1 supplies finite unramified point/configuration incidence and
  the full-flattening tensor bundle over the matrix span variety.
- Section2 supplies the exhaustive six-point core Segre intersection,
  its exact elimination calculation, and reducedness by the scalar-only
  tangent calculation.
- Section4 gives the original row/column witnesses T_(r;p,q), both
  avoidance identities for v(z), the reduced r+1-point intersection,
  exactly six actual decompositions and their immersions, and the
  core-deformation arcs realizing every dependent r-subset.

In particular E1 is exactly T_(r;4,r-3); E2 is exactly T_(9;5,5).
The earlier theorem proves only a lower bound r+1 on normalization points
at these higher-rank witnesses and leaves exact counts and the boundary
local rings open. Those missing assertions are the new work in E.

The companion [normalization statements](../../proofs/STATEMENTS.md) have SHA256
`9cbc35de9c9508fe74af4e6b0fc576564c7fc3801452202b1280fe17f76ca4bd`.

The general complete-normalization criterion in [Normalization, Section1] assumes
that every r-subset is independent. It is not applied at a dependent
configuration here. Only its incidence and tensor-bundle constructions
are reused; the new normal local models are essential to exhaust the
whole normalization.

### [Reach]

[Family derivation](../../../families/proofs/REACH_DERIVATION.md)

SHA256 `49e1a0cbf95bc8a3cc853580d8dc93aca5258cbe227c2bff94f895169be1d072`.

Sections1 and3 give the generic subset rank-sum/Sylvester criterion and
birationality of the unordered span map when a,b>=3 and a+b>=r+2.
Section4 supplies the original flexible row/column construction,
avoidance identities and immersion coefficient comparison. GEOMETRY_E,
Section1, repeats the relevant generic uniqueness, rank-one exhaustion,
reducedness and decomposition arguments to make their exact use visible.

### [Base]

[Baseline proof](../../../proofs/PROOF.md)

SHA256 `ee50513933d0c18605ea8ae651537803e245f35ed222c3823015f05809c2ad0d`.

Sections3--4 provide the integer six-point circuit, its unique relation,
six rational tangent determinants, full third flattening and immersion
calculation. The geometry proof uses the earlier refined formulations
in [Normalization]; this baseline records their original provenance.

## New proofs contained in this package

[GEOMETRY_E.md](GEOMETRY_E.md) proves the following, with the exact
families and quantifiers of [STATEMENT_E.md](STATEMENT_E.md):

1. The proper Hilbert-scheme span graph contains precisely the required
   r+1 reduced configurations, with no repeated-point or infinitesimal
   configurations above the witness.
2. Exact Schur elimination and scheme-theoretic auxiliary-coordinate
   cancellation put the maximal-minor ideal into independent linear
   generators plus the stated residual monomial or star quadratics.
3. The explicit pivot-avoiding core arcs select the homogeneous origins
   of the fully saturated graph algebras, also when the omitted and
   retained additions have different types.
4. The pure monomial model R_(s,m) is normal by an integer-capacity proof
   identifying its monoid with its cone intersected with its lattice.
5. The tangent dimensions follow from linear independence of the
   degree-one generators. Local normality at every finite graph fiber
   point identifies the entire normalization, and the incidence/tangent
   argument proves unramifiedness near the whole fiber.

[ALGEBRA_STAR.md](ALGEBRA_STAR.md) proves that the exact independent-variable
subalgebra

    B_(k,alpha,beta)=
      C[t,p,q_j,x_j,z_j,u_h,v_ij,
        (p*z_j+q_j*x_j)/t, p*u_h/t, q_j*v_ij/t]

is normal for every nonnegative k,alpha,beta, and computes its dimension
and homogeneous tangent space. Here k counts the retained columns,
alpha counts the v-rows, and beta counts the u-variables. Its proof
establishes all-power denominator ideals at every intermediate stage,
the complete multivariate kernel, finite terminating SAGBI reduction,
and saturation of the resulting monomial algebra by integral network flow.

[DEFORMATION_LEMMA.md](DEFORMATION_LEMMA.md) proves the local normality
transfer from a normal regular-parameter quotient and its nonnegatively
graded consequence. It supplies the exact deformation step for the
finite weighted Rees algebra in ALGEBRA_STAR. It does not rely on an
unlocated deformation citation or assume properness of that family.

The algebra theorem applies here because the geometric reduction retains
independent base variables and the actual saturated subalgebra, rather
than merely producing a matching tangent cone or unsaturated numerator
equations. Its boundary cases are used explicitly: k=0 in E1 at r=7,
and beta=0 in E2 when b=5 or, after transposition, when a=5.

## Standard inputs and verification limits

Standard geometric and commutative-algebra facts used are: projectivity
of Hilb^r(S) for projective S; the closed condition that a finite
subscheme lie in a varying linear space; proper quasi-finite morphisms
are finite; finite normalization and the open normal locus for varieties
over C; the Jacobian, tangent and unramified criteria; normality descent
under smooth covers; free finite-group quotients in characteristic zero;
the Rees-algebra description of the graph of a projective rational map;
and flat base change for ideal powers. The algebra proof also uses
integral max-flow, the principal ideal theorem, the affine dimension
formula, the height-one valuation description of a Noetherian normal
domain, and Nakayama's lemma. The specific chart, saturation and
normality-transfer arguments are written out in the package.

The exact checker described in the
[verification guide](../verification/README.md) verifies the finite core. It do not prove mixed
normality for unbounded parameters, identify a normalization fiber from
samples, or authenticate the mathematical prose. Those are obligations
of the written proofs and the verification manifest.

The proofs of E1 and E2 assume no new theorem from the higher-rank A–C
or one-sided D statements: their toric normality argument is reproduced in
GEOMETRY_E. The separate rank-five exact
local-ring/depth result is not an input. The parameter
kappa=3a+3b-r-8 counts independent linear generators of a dependence
ideal; it is not a smooth-parameter count from that other result.

E concerns E1's one-row/many-column mixed family and its transpose, and
E2's two-row/two-column rank-nine family. Its conclusions are local near
the specified entire normalization fibers. They include no global
normalization, Cohen--Macaulayness, rational-singularity, or exact-depth
claim.
