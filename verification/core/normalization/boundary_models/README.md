# Boundary models for one-sided and specified mixed circuit extensions

The [one-sided theorem D](proofs/STATEMENT_D.md) and
[mixed theorems E1 and E2](proofs/STATEMENT_E.md) determine the entire
normalization fibres at the displayed circuit witnesses, including the
dependent boundary configurations. All varieties are reduced over
$\mathbb C$, and normalization is in the variety's own function field.
The witnesses have rank and border rank $r$ and exactly six actual
unordered $r$-term decompositions. These give six smooth normalization
points; the further points correspond to dependent configurations and
are not actual decompositions.

## Witnesses and exact ranges

- **D:** the six-point core with $r-5$ added rows, whose second-factor
  directions remain in the original three-dimensional subspace. Its
  range is $r\geq6$, $a\geq r-2$, $b\geq3$, $c\geq r$ and
  $a+b\geq r+2$. There are exactly $r+1$ reduced normalization points:
  six actual decomposition points and $r-5$ boundary points.
- **E1:** the original witness $`T_{r;4,r-3}`$ with one added row and
  $r-6$ added columns. Its range is $r\geq7$, $a\geq4$,
  $b\geq r-3$, $c\geq r$ and $a+b\geq r+2$. There are exactly
  $r+1$ reduced normalization points: six actual decomposition points,
  one boundary point omitting the added row, and $r-6$ boundary points
  each omitting one added column.
- **E2:** only the original rank-nine witness $`T_{9;5,5}`$ with two
  added rows and two added columns. Its range is $a,b\geq5$,
  $a+b\geq11$ and $c\geq9$. There are exactly ten reduced
  normalization points: six actual decomposition points, two boundary
  points omitting an added row, and two omitting an added column.

All conclusions allow permutations of the tensor factors together with
transport of the specified witness. In particular D includes the
added-column version, and E1 includes the family with one added column
and $r-6$ added rows, with the corresponding formulas transported.

## Normal local models and tangent dimensions

With independent base variables, set

```text
R_(s,m) = C[t,mu_j,y_ij,mu_j*y_ij/t : 1<=j<=s, 1<=i<=m],

B_(k,alpha,beta) =
  C[t,p,q_j,x_j,z_j,u_h,v_ij,
    (p*z_j+q_j*x_j)/t, p*u_h/t, q_j*v_ij/t :
           1<=j<=k, 1<=h<=beta, 1<=i<=alpha].
```

These are the actual subalgebras of the corresponding Laurent polynomial
rings with $t$ inverted, retaining all saturation relations. Both are
normal for every nonnegative integer parameter, including empty index
sets. In $B$, $\alpha$ counts the $v$-rows and $\beta$ the $u$-variables.
Equations obtained only by multiplying each fraction by $t$ do not
replace these subalgebras.

At their homogeneous origins the tangent excess (embedding dimension
minus dimension) is $sm$ for $`R_{s,m}`$ and
$k(\alpha+1)+\beta$ for $`B_{k,\alpha,\beta}`$. The following table lists
every boundary normalization point type:

| Witness and omitted direction | Number of points | Model | Tangent excess |
| --- | ---: | --- | --- |
| D, one added row | $r-5$ | $`R_{r-6,b-3}`$ | $(r-6)(b-3)$ |
| E1, the added row | $1$ | $`R_{r-6,a-3}`$ | $(r-6)(a-3)$ |
| E1, one added column | $r-6$ | $`B_{r-7,a-4,b-r+4}`$ | $(r-7)(a-3)+b-r+4$ |
| E2, one added row | $2$ | $`B_{2,a-4,b-5}`$ | $2a+b-11$ |
| E2, one added column | $2$ | $`B_{2,b-4,a-5}`$ | $a+2b-11$ |

Every point has dimension $D=r(a+b+c-2)$, with $r=9$ in E2. Its
embedding dimension is $D$ plus its listed excess; the six actual
decomposition points have excess zero.

D's boundary points are smooth exactly when $r=6$ or $b=3$, and all
are singular when $r\geq7$ and $b\geq4$. All E1 boundary points are
singular, including at $r=7$, where
$`B_{0,a-4,b-3}`$ is $`R_{1,b-3}`$ after renaming variables. All four E2
boundary points are singular, with excess at least five. E2 includes
$b=5$ or $a=5$: the respective row-omission or column-omission star
model then has $\beta=0$.

Each geometric model assertion is **smooth equivalence**: a smooth
local cover of the boundary germ is étale over a product of the
model's homogeneous origin with a smooth germ. This includes the
factor-vector and ordered-configuration covers in the proofs and does
not specify canonical coordinates on the unframed normalization.

For D, E1 and E2 the normalization morphism is unramified over a
Zariski neighbourhood of the displayed tensor, including when boundary
points are singular. The entire normalization source is smooth over
such a neighbourhood in D's cases $r=6$ or $b=3$. The positive tangent
excesses in the other cases prevent that smooth-source conclusion.

## Proofs and dependencies

[PROOF_D.md](proofs/PROOF_D.md) gives the one-sided local models and
their normality. [GEOMETRY_E.md](proofs/GEOMETRY_E.md) derives the exact
mixed boundary ideals and the selected saturated span-graph charts.
[ALGEBRA_STAR.md](proofs/ALGEBRA_STAR.md) proves all-parameter normality
of the star algebra using all-power denominator ideals, the complete
multivariate kernel, terminating leading-degree reduction, and integral
network-flow saturation. [DEFORMATION_LEMMA.md](proofs/DEFORMATION_LEMMA.md)
supplies its finite weighted-degeneration normality step.

The earlier inputs are identified in [DEPENDENCIES_D.md](proofs/DEPENDENCIES_D.md)
and [DEPENDENCIES_E.md](proofs/DEPENDENCIES_E.md). Their complete-normalization
criterion requiring every $r$-subset to be independent is not applied
at a dependent boundary configuration. The new normality arguments at
all finite graph-fibre points are needed to identify the entire
normalization.

D includes the one-sided cases B and C of the
[higher-rank statements](../higher_rank/proofs/STATEMENTS.md), leaving
their diagonal case A unchanged. E1 and E2 use neither those A–C
conclusions nor D as new inputs; the needed toric argument is reproduced
in their geometry proof. The separate rank-five
[completed local-ring theorem](../local_ring/proofs/STATEMENT.md) is not
an input. Here $\kappa=3a+3b-r-8$ counts linear generators of a
dependence ideal, not the smooth-parameter count in that rank-five result.

## Exact verification and limits

From this directory, with Python 3.11 or later:

```sh
python3 -S -s -B verification/run.py
```

The [verification guide](verification/README.md) describes the finite
core certificate and its rejection controls. Those calculations do not
prove all-parameter normality or saturation, nor identify normalization
fibres from samples. These conclusions require the written proofs.

The results are local near the specified entire normalization fibres.
D covers only one-sided additions; the mixed cases covered here are
exactly E1 and E2. Broader mixed splits remain outside these statements.
No global description or smoothness, Cohen–Macaulayness,
rational-singularity, or exact-depth conclusion for the normalization
is asserted. These local models give no exact vertex-depth conclusion.
