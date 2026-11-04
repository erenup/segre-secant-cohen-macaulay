# Referee report A: the family theorem

Reviewed: the family statements and proofs now in verification/core/families/proofs/, the finite-case proof now in verification/core/proofs/PROOF.md, and the exact checks of the rank-five witness now in verification/core/verification/.

**Verdict: ACCEPT. No required corrections.**

I accept the whole stated negative range: for every integer $`r\ge5`$,
every $`a,b\ge3`$ with $`a+b\ge r+2`$, and every $`c\ge r`$, the reduced
complex affine border-rank-at-most-$`r`$ variety $`X_r(a,b,c)`$ is not S2
and is not Cohen--Macaulay. All permutations of the factors are included.
Its dimension is $`D=r(a+b+c-2)`$, and its homogeneous vertex has depth
strictly below $`D`$. The explicit integer witness has ordinary and border
rank exactly $`r`$, and its local ring is not CM. The associated projective
secant is locally non-CM at the nonzero witness class.

This acceptance includes the boundary cases $`a+b=r+2`$ and $`c=r`$,

- $`X_5(3,4,5)`$, dimension 50 and vertex depth below 50;
- $`X_r(3,r-1,r)`$, dimension $`2r^2`$, for every $`r\ge5`$;
- $`X_r(r,r,r)`$, the unit-tensor orbit closure, dimension $`3r^2-2r`$,
  for every $`r\ge5`$;
- the earlier $`X_5(6,6,6)`$ case, dimension 80.

The local S2 conclusion means the local ring at the witness is not an S2
ring; it does not assert its own depth is less than two. An S2 failure may
occur at a further localization. No exact numerical depth at the witness
or vertex is claimed.

## Independence, source scope, and bindings

I copied and verified every one of the 17 files registered in the manifest
of the reviewed files. I read the allowed statements, proofs, new proofs,
and verification code/data in that copy. I did not open the author's
internal reviews or notes outside the reviewed files, files of the other
referee, or the other referee's messages. There was no contact with the
author or the other referee. The report and reasoning were not shared with
the other referee.

This assignment permitted exposure to the submitted proofs before my
derivation was fixed. I independently reconstructed the mechanisms in my
own derivation, rather than treating the earlier baseline acceptance as
proof. The derivation and the independent regression checker were fixed
**before any mathematical checker ran**, and the exposure history was
recorded.

I independently downloaded and read Oeding, arXiv:1603.08980v2,
Conjecture 1.1, and Jagiełła--Jelisiejew, arXiv:2604.24879v3,
Conjecture 3.32. Both concern aCM of the ordinary Segre secants;
the latter explicitly identifies this with CM of the affine cone.
The theorem gives actual negative instances in their quantified setting.
It does not substitute a nonreduced ideal, a normalization, or the concise
secant variety. Public fetch receipts, PDFs, and extracted text were kept.

The reviewed baseline proof is byte-identical to the repository file:

| File | SHA256 |
| --- | --- |
| verification/core/proofs/PROOF.md | `ee50513933d0c18605ea8ae651537803e245f35ed222c3823015f05809c2ad0d` |

The original author files were not modified, and the reviewed files were
verified again after all executions.

## Decisive mathematical checks

**The source and its codimension-two bad locus.** Restrict the smooth
unordered decomposition source from the beginning to decompositions whose
third-factor vectors are independent. This is a nonempty dense open as
soon as $`c\ge r`$, so it retains dominance and both constructed witnesses.
There is no need to claim codimension two for third-rank failure when
$`c=r`$. The remaining good condition is

```math
\mathrm{rank}\,A_J+\mathrm{rank}\,B_J\ge |J|+2
\quad (|J|\ge2).
```

For fixed $`|J|=t`$, ranks at most $`(x,y)`$ have summed codimension
$`(a-x)(t-x)+(b-y)(t-y)`$. Generic ranks satisfy the condition, including
at $`a+b=r+2`$. A codimension-one stratum would require, up to exchange,
$`a=t,x=t-1,y=\min(b,t)`$; since $`a,b\ge3`$, this already has
$`x+y\ge t+2`$ and is not bad. Thus every actual bad stratum has
codimension at least two. The smooth torus cover and free finite
permutation quotient preserve this count.

**The target smoothness argument.** Sylvester's rank inequality proves
that the span of a good configuration has exactly its $`r`$ rank-one
directions. Applying it after quotienting by both factors of one point
gives scalar-only affine tangent intersection. Hence its projective
Segre intersection consists of precisely $`r`$ reduced points.

The projective incidence of such points over the span variety becomes
finite near this subspace. Its finite algebra $`F`$ over the integral
local ring $`R`$ has fiber dimension and generic rank both $`r`$.
Nakayama gives $`R^r\twoheadrightarrow F`$; the kernel is a rank-zero
submodule of a free module over a domain and therefore vanishes. This
proves local freeness without assuming target smoothness or normality.
The reduced geometric fiber makes the incidence etale. Ordering the
points identifies an etale cover with an open in the smooth configuration
space. This proves smoothness of the span variety at the required points.

The rank-$`r`$ third-flattening locus of the reduced secant is exactly the
surjective-map bundle over that span variety. Trivializing the
tautological bundle justifies both containments by taking reduced closures.
This proves target smoothness and the dimension $`r(a+b+c-2)`$, not merely
immersion of the source. The same chart proves generic uniqueness and
birationality in characteristic zero.

**The conductor contradiction.** I rechecked the baseline local algebra
lemma. For an S2 local domain $`A`$ and finite normalization $`B`$, the
conductor is $`\mathrm{Hom}_A(B,A)`$. An $`A`$-regular sequence of
length two stays regular on this Hom module by the pointwise division
argument. Heights agree at corresponding primes here, so the conductor
is S2 as a $`B`$-module. The depth lemma forces every minimal prime of a
nonzero proper conductor to have height one. Multiple normalization
points over the closed point make the conductor proper at each one.

Each immersive decomposition lies in the quasi-finite locus of the
birational map to the normalization. Zariski's Main Theorem identifies
that locus with an open normalization chart, so two distinct decompositions
give two distinct normalization points. A conductor divisor through either
point would lie in the complement of the source's smooth-image good locus.
That complement has codimension at least two. This contradiction proves
the local non-S2 and non-CM assertions. The graded-resolution argument
then correctly propagates failure to the homogeneous vertex. It does not
attempt to infer non-CM from nonnormality alone.

**Uniform integer witnesses.** The six core row/negative-column matrices
have exactly one relation and scalar-only tangent intersections; the six
rational determinants were reconstructed and subsequently checked exactly.
For every integer $`t\ge4`$, $`v(t)=(1,t,t^2)`$ avoids both relevant core
matrix subspaces. For one direction, row elimination gives
$`b_j=jd/(j-t)`$ and $`(j+t)d=je`$, forcing $`d=e=0`$. For the other,

```math
\det[\mathbf 1,v(t),v(t)/(1,2,3)]
=-t(t-1)(t-3)/6\ne0
```

and the third row eliminates the final coefficient. Distinct added rows
and columns then preserve scalar-only tangent intersection by explicit
support-block comparisons, including when both kinds are present.

Choose $`p,q\ge3`$, $`p+q=r+1`$, with $`p\le a,q\le b`$. The interval
`max(3,r+1-b) <= p <= min(a,r-2)` is nonempty throughout the claimed range.
The core plus $`p-3`$ row terms and $`q-3`$ column terms gives two integer
decompositions with matrix bases and independent third vectors. Coefficient
comparison proves their addition differentials injective. Padding adds
independent derivative blocks because all opposite pair lists are
independent; it yields rank $`D`$ in every ambient format claimed.
The full third flattening proves ordinary rank and border rank exactly $`r`$.

This is an arbitrary-$`r`$ written proof. The finite regressions below
provide no inference from sampled ranks to all ranks.

## Other submitted statements and scope limits

I also checked the ancillary mathematical statements in `STATEMENTS.md`:

- For $`r\le4`$, an immersive decomposition has independent opposite pair
  lists. If every support rank were below $`r`$, its source dimension would
  exceed the ambient dimension. A full flattening is therefore present.
  A second decomposition would give a rank-one circuit of size at most
  five. The bound $`u+v\le m`$ on its two support dimensions forces a
  tangent intersection of dimension at least two, contradicting immersion.
  Thus rank five is the first rank for this specific three-factor mechanism.
- The adjacent $`X_5(3,3,c)`$ family is ambient for $`c\le5`$ and is the
  generic $`9\times c`$ rank-at-most-five determinantal variety for $`c\ge5`$.
  Its CM assertion follows from the exact tangent dimension and the
  classical determinantal theorem. It does not conflict with the new
  $`3\times4\times5`$ failure.
- The nonzero cone chart is a product of the projective chart with
  $`\mathbb G_m`$, so the local projective non-CM conclusion follows.
- On an invertible-slice chart with two $`r`$-dimensional factors,
  normalized first-factor labels are intrinsic joint eigencharacters.
  Distinct characters give uniqueness; a repeated character gives the
  explicit constant-sum shear family and nonzero differential kernel.
  The displayed witness lifts to smooth concise-secant points over the
  smooth unit tensor, as checked against JJ's framed construction.

No claim is accepted that all smaller-rank secants are CM, that this range
classifies every non-S2 format, or that $`3\times4\times4`$ or
$`4\times4\times4`$ is settled. The witness does not refute a Hilbert or
Quot CM conjecture. These are the submitted scope restrictions, not
corrections or weakened substitutes for the main theorem.

## Checkers and the two added corruptions

After my derivation had been fixed I ran the unchanged supplied runner
(an earlier version of verification/core/verification/run.py) using the
workspace Python:

```text
python -I -S -B verification/core/verification/run.py
python -I -S -B -O verification/core/verification/run.py
```

Both passed identically. Each runner invocation executed both independent
baseline checkers in normal, optimized, and alternate-hash-seed modes:
six positive executions and fifteen registered negative-control executions.
Every negative control rejected exactly as registered. The runner also
verified both proof bindings, complete verification coverage, and hashes
before and after execution. Wall times were 0.72 and 0.74 seconds, with
peak RSS 19,284 and 19,296 KiB respectively.

The independent reviewer checker `check_mixed_extensions.py` imports no
author code. It checks six core determinants with rational arithmetic,
integer decomposition equality, distinctness, all opposite pair ranks,
full third flattening, and tangent ranks modulo the proved prime 1009.
The nonzero scaling kernels give the matching characteristic-zero tangent
upper bounds. Both normal and `-O` runs passed identically:

| Rank | Format | Third flattening rank | Tangent ranks at the two decompositions |
| --- | --- | --- | --- |
| 5 | 3 × 4 × 5 | 5 | 50, 50 |
| 6 | 3 × 5 × 6 | 6 | 72, 72 |
| 6 | 5 × 3 × 6 | 6 | 72, 72 |
| 7 | 4 × 5 × 7 | 7 | 98, 98 |
| 9 | 5 × 6 × 9 | 9 | 162, 162 |

Each run took 0.04 seconds and less than 14,200 KiB peak RSS.

The two NEW corruptions target the new mixed-extension argument, rather
than repeating the supplied equality/rank/distinctness mutations:

1. `--corrupt row-core-alignment`: replace an added row's second factor
   by the first core row direction.
2. `--corrupt column-core-alignment`: replace an added column's first
   factor by the first core column direction.

Both preserve equality of the two decompositions and full third flattening
rank seven. They pass those checks, then reject with exit 1 and
`FAIL: mixed extension immersion: expected 98, got 96`, identically under
normal and optimized Python. The common core factor explicitly creates
two independent tangent overlaps; this explains the corruption's failure
without relying on a modular rank loss alone. There are no asserts or
floating-point decisions in the reviewer checker.

Full commands, UTC timestamps, stdout/stderr, exit codes, timings and RSS
were recorded.
