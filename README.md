# Secant Varieties of Segre Products Need Not Be Cohen–Macaulay

*Two immersive decompositions, the conductor, and a failure of Serre's condition* $`S_2`$

Authors: Wenqi Zhu; Ping Nie.

Wenqi Zhu — Mathematical Institute, Woodstock Road, University of Oxford, Oxford, UK, OX2 6GG — wenqi.zhu@maths.ox.ac.uk

Ping Nie — David R. Cheriton School of Computer Science, University of Waterloo — ping.nie@uwaterloo.ca

Read the [paper](paper/main.pdf) and its [LaTeX source](paper/main.tex).
The theorem gives a negative answer to the [catalogue question](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/d49c11a1b2091547235e4779f7e067ed4b65774d/tensor-computations/TR-25/README.md),
which asks whether every secant variety of a Segre product is
arithmetically Cohen–Macaulay.

## Main theorem

**Family theorem.** For every integer $r\geq5$ and positive integers
$a,b,c$ satisfying

```math
a,b\geq3,\qquad a+b\geq r+2,\qquad c\geq r,
```

let $`X_r(a,b,c)`$ be the reduced affine variety of tensors of border rank
at most $r$ in $\mathbb C^a\otimes\mathbb C^b\otimes\mathbb C^c$.
Then $`X_r(a,b,c)`$ fails Serre's condition $`S_2`$ and is not
Cohen–Macaulay. Factor permutations are allowed. Its dimension is
$D=r(a+b+c-2)$, and for $`A=\mathbb C[X_r(a,b,c)]`$ and its homogeneous
maximal ideal $\mathfrak m$,

```math
\mathrm{depth}\,A_{\mathfrak m}<D=\dim A_{\mathfrak m}.
```

There is an explicit integer tensor of ordinary rank and border rank
exactly $r$ whose local ring is not Cohen–Macaulay. The projective secant
is also not locally Cohen–Macaulay at its nonzero tensor class.
See the [statements](verification/core/families/proofs/STATEMENTS.md),
[family proof](verification/core/families/proofs/REACH_DERIVATION.md), and
[proof guide](verification/core/families/README.md).

| Instance | Affine dimension |
| --- | --- |
| $`X_5(6,6,6)`$ | $80$ |
| $`X_5(3,4,5)`$ | $50$ |
| $`X_r(3,r-1,r)`$, every $r\geq5$ | $2r^2$ |
| $`X_r(r,r,r)`$, every $r\geq5$ | $3r^2-2r$ |

The last family consists of the unit-tensor orbit closures
$`\overline{(\mathrm{GL}_r(\mathbb C))^3\cdot\Delta_r}`$, where
$`\Delta_r=\sum_{i=1}^r e_i^{\otimes3}`$.
The original $6\times6\times6$ case has its own
[statement](verification/core/proofs/STATEMENT.md) and [proof](verification/core/proofs/PROOF.md).
The [paper](paper/main.pdf) presents the uniform family theorem
as its main result, Theorem 1.1, with the original $6\times6\times6$ case
in Corollary 1.2. It also proves the normalization fibres, rank-five
completed local ring, and one-sided and specified mixed boundary models
described below.

### Refutation of the universal conjecture

The question asks whether, for **every** $k\geq3$, every
$`n_1,\ldots,n_k\geq1`$, and every $r\geq1$, the reduced coordinate ring
of

```math
X_r=\overline{\left\{
\sum_{\ell=1}^{r}v_{1,\ell}\otimes\cdots\otimes v_{k,\ell}:
v_{j,\ell}\in\mathbb C^{n_j}
\right\}}^{\mathrm{Zar}}
```

is Cohen–Macaulay, equivalently whether depth equals dimension at its
homogeneous maximal ideal. Already $k=3$, $`(n_1,n_2,n_3)=(3,4,5)`$, and
$r=5$ refute this universal assertion.

This is precisely the assertion that all secant varieties of Segre
products of projective spaces are arithmetically Cohen–Macaulay:
Oeding's Conjecture 1.1 in *Are all Secant Varieties of Segre Products
Arithmetically Cohen–Macaulay?*
([arXiv:1603.08980v2](https://arxiv.org/pdf/1603.08980v2)), also stated as
Conjecture 3.32 by Jagiełła and Jelisiejew in *Unrestrictions and concise
secant varieties*
([arXiv:2604.24879v3](https://arxiv.org/pdf/2604.24879v3), p. 29).
The family theorem refutes both formulations over $\mathbb C$.
The implications from that universal conjecture to other
Cohen–Macaulayness conjectures do not turn its refutation into a
counterexample to Haiman's conjecture or to the Hilbert or Quot
assertions discussed there.

### Explicit rank-five witness

Set

```math
M=\begin{pmatrix}1&1&1\\1&2&3\\1&4&9\end{pmatrix}.
```

For the standard vectors $`e_1,e_2,e_3\in\mathbb C^3`$, define six
rank-one matrices

```math
Q_i=e_i\,\mathrm{row}_i(M)\quad(1\leq i\leq3),
\qquad
Q_{3+j}=-\mathrm{col}_j(M)\,e_j^{\mathsf T}\quad(1\leq j\leq3).
```

Their only linear relation, up to scalar, is $`\sum_{i=1}^6Q_i=0`$.
For the standard basis $`f_1,\ldots,f_5`$ of $\mathbb C^5$, the integer
tensor

```math
T=\sum_{i=1}^5Q_i\otimes f_i
 =\sum_{i=1}^4Q_i\otimes(f_i-f_5)-Q_6\otimes f_5
```

has two distinct unordered five-term pure-tensor decompositions.
Its third flattening has rank five, so its tensor rank and border rank
are both exactly five. Embed
$\mathbb C^3\otimes\mathbb C^3\otimes\mathbb C^5$ into
$(\mathbb C^6)^{\otimes3}$ by padding each factor with zeros.
The addition differentials at both displayed decompositions have rank
$45$ before embedding and rank $80$ after embedding. All factors are
listed in [witness.json](verification/core/verification/witness.json).

The [family construction](verification/core/families/proofs/REACH_DERIVATION.md) adds
rank-one matrices in new rows and columns, paired with new third-factor
basis vectors. It preserves two distinct immersive decompositions and
gives integer witnesses in every format of the theorem. Padding alone,
without the smooth-locus and codimension arguments, is not a transfer
principle for Cohen–Macaulayness.

### Proof outline

1. Restrict the smooth unordered decomposition source to independent
   third-factor columns. For every subset $J$ of at least two summands,
   impose $`\mathrm{rank}\,A_J+\mathrm{rank}\,B_J\geq\lvert J\rvert+2`$.
   Failure has codimension at least two when $a,b\geq3$ and
   $a+b\geq r+2$.
2. On this open locus, the span of the matrix factors meets the Segre
   variety in exactly $r$ reduced points. A finite étale incidence
   construction gives smooth charts and a unique unordered
   decomposition. The addition map is birational and the target has
   dimension $D=r(a+b+c-2)$.
3. Both constructed decomposition differentials are injective. After
   lifting addition to the finite normalization, Zariski's Main Theorem
   identifies neighborhoods of the two decomposition points with distinct open
   normalization charts above the witness $`T_r`$.
4. For an $`S_2`$ local domain essentially of finite type over $\mathbb C$,
   every proper conductor locus in its finite normalization has a
   height-one component through each of its points. On either displayed
   chart, the conductor is supported outside the smooth-image open
   locus, hence in codimension at least two. This contradiction proves
   failure of $`S_2`$ and non-Cohen–Macaulayness at $`T_r`$.
5. A graded free resolution and Auslander–Buchsbaum show that
   Cohen–Macaulayness at the homogeneous vertex would force
   Cohen–Macaulayness at every localization. The obstruction at $`T_r`$
   therefore gives the stated vertex-depth inequality.

The rank-five core tangent calculation reduces to six nonzero rational
$3\times3$ determinants. The all-rank extensions and the smooth charts
are proved in the [family proof](verification/core/families/proofs/REACH_DERIVATION.md);
the conductor lemma is in the [finite-case proof](verification/core/proofs/PROOF.md).

## Normalization fibres

All the following statements concern reduced complex varieties, with
normalization in their own function fields. See the exact
[statements A–E](verification/core/normalization/proofs/STATEMENTS.md) and
[proof guide](verification/core/normalization/README.md) for the displayed tensors and spans.

- **A.** Let $S\subseteq\mathbb P(W)$ be smooth, irreducible and projective,
  let $r\geq1$, and assume its nonempty independent unordered $r$-tuple
  span map is birational onto its image closure $H$. If
  $\mathbb P(L)\cap S$ consists of $m\geq r$ reduced points and every
  $r$-subset is independent, an open neighbourhood of $L$ has smooth
  normalization with unramified normalization map and exactly
  $\binom mr$ reduced points above $L$. The same conclusion holds near
  every rank-$r$ tensor with flattening image $L$ in the associated
  $r$-term tensor variety, for any third factor of dimension $c\geq r$.
- **B.** For every $r\geq5$, $p,q\geq3$, $p+q=r+1$, the explicitly
  defined span $`L_r`$ meets the matrix Segre variety in exactly $r+1$
  reduced points, including its six core points. This remains true
  under padding. Exactly six $r$-subsets are independent, each omitting
  one core point. In every format $a\geq p,b\geq q,c\geq r$, the tensor
  $`T_{r;p,q}`$ has exactly six unordered decompositions into $r$ nonzero
  pure summands, all with injective addition differential, and ordinary
  and border rank $r$.
- **C.** For $a,b\geq3$, $a+b\geq7$, $c\geq5$, the padded $`T_5`$ has
  exactly six reduced normalization preimages, and a neighbourhood whose
  entire normalization is smooth with unramified normalization map.
  For $r\geq6$, $p,q\geq3$, $p+q=r+1$, $a\geq p,b\geq q,c\geq r$ and
  $a+b\geq r+2$, the fibre above $`T_{r;p,q}`$ has at least $r+1$ distinct
  points: six distinguished smooth points from actual decompositions
  and at least $r-5$ further points not supplied by such decompositions.
  Factor permutations are allowed.
- **D.** An injective differential of a holomorphic map from a smooth
  $d$-dimensional complex manifold to a finite-dimensional Hermitian
  vector space admits a linear projection to $\mathbb C^d$ with a local
  holomorphic inverse. On a smaller neighbourhood the branch inverse
  derivative is bounded; when $`d>0`$, for any fixed smooth local
  Hermitian metric the least differential singular value is bounded
  below by a positive constant. This applies to each of the six actual
  branches above.
- **E.** A retract of a normal domain is normal, so nonnormality of a
  reduced affine tensor border-rank variety propagates to larger factor
  dimensions under coordinate inclusion and projection. This is not an
  $`S_2`$ or Cohen–Macaulay retraction theorem. For a finite normalization
  $A\subseteq B$, $`\mathrm{Ann}_A(B/A)=(A:B)`$ and the support of
  $B/A$ is precisely the nonisomorphism locus.

The [higher-rank statements A–C](verification/core/normalization/higher_rank/proofs/STATEMENTS.md)
give exact reduced smooth normalization fibres: six points for the diagonal
extensions with every $r\geq6$, $a,b\geq r-2$, $c\geq r$; seven for the
rank-six row witness with $a\geq4$, $b\geq3$, $a+b\geq8$, $c\geq6$
(also with the matrix factors exchanged); and $r+1$ for the row family
with every $r\geq6$, $a\geq r-1$, $c\geq r$ and second matrix factor
of dimension exactly three. Each fibre has six actual decomposition points;
the latter two cases have respectively one and $r-5$ further points. In
each case the entire normalization is smooth and unramified over a Zariski
neighbourhood of the displayed tensor. Factor permutations are allowed.

The [one-sided theorem D](verification/core/normalization/boundary_models/proofs/STATEMENT_D.md)
extends the row family to every $r\geq6$, $a\geq r-2$, $b\geq3$,
$c\geq r$ and $a+b\geq r+2$. There are exactly $r+1$ reduced
normalization points: six smooth actual decomposition points and $r-5$
dependent boundary points. Each boundary point has the normal model
$`R_{r-6,b-3}`$ and tangent excess $(r-6)(b-3)$. They are smooth exactly
when $r=6$ or $b=3$, and all are singular when $r\geq7$ and $b\geq4$.

The [mixed theorems E1 and E2](verification/core/normalization/boundary_models/proofs/STATEMENT_E.md)
give exact fibres for two specified row/column splits. E1 covers the
original witness $`T_{r;4,r-3}`$ with one added row and $r-6$ added columns,
for $r\geq7$, $a\geq4$, $b\geq r-3$, $c\geq r$ and
$a+b\geq r+2$. Its $r+1$ reduced points consist of six smooth actual
decomposition points, one singular point omitting the row with excess
$(r-6)(a-3)$, and $r-6$ singular points omitting a column with excess
$(r-7)(a-3)+b-r+4$. E2 covers only $`T_{9;5,5}`$ with two added rows and
two added columns, for $a,b\geq5$, $a+b\geq11$ and $c\geq9$.
Its ten reduced points consist of six smooth actual decomposition points,
two singular points omitting a row with excess $2a+b-11$, and two
singular points omitting a column with excess $a+2b-11$. The endpoint
cases $a=5$ or $b=5$ are included.

In D, E1 and E2 every point has dimension $r(a+b+c-2)$ (with $r=9$
in E2), and embedding dimension equal to that dimension plus its excess.
The [boundary-model guide](verification/core/normalization/boundary_models/README.md) specifies
the saturated Laurent subalgebras and the smooth/étale covers used for
their local models; no canonical unframed coordinate isomorphism is
asserted. The normalization map is unramified near the entire fibre in
all these cases, including those with singular boundary points. The
entire source is smooth nearby in D's cases $r=6$ or $b=3$. All
conclusions transport with the witness under factor permutations,
including the transposed families. Mixed boundary geometry beyond
E1 and E2 remains outside these results.

For the specified rank-five circuit witness, $a,b\geq3$, $a+b\geq7$,
$c\geq5$, the [completed local ring](verification/core/normalization/local_ring/proofs/STATEMENT.md)
is

```math
\mathbb C[[z_1,\ldots,z_h,x_{i,j}:1\leq i\leq6,1\leq j\leq q]]/
(x_{i,j}x_{k,\ell}:i\ne k),
```

where $q=2(a+b-6)$ and $h=3a+3b+5c+2$. It has dimension $h+q$, depth
$h+1$, embedding dimension $h+6q$, and multiplicity six; at
$6\times6\times6$ its dimension is $80$ and depth is $69$. Its
normalization is the product of six regular branches, with conductor
generated by all $`x_{i,j}`$ and conductor quotient $\mathbb C[[z]]$ in the
original completed ring. Global normalization geometry, including
Cohen–Macaulayness and rational singularities, and exact vertex depth
remain open. The local derivative bounds above give no probability-tail
or moment conclusion and no global single-valued inverse.

## Discussion and open questions

**Relation to known nonnormality results.** For every integer $m\geq5$,
Bürgisser and Ikenmeyer proved that

```math
\overline{(\mathrm{GL}_m(\mathbb C))^3\cdot\Delta_m}
\subseteq(\mathbb C^m)^{\otimes3},
\qquad \Delta_m=\sum_{i=1}^m e_i^{\otimes3},
```

is not normal: *Geometric complexity theory and tensor rank*, STOC
(2011), 509–518, Corollary 7.2(2)
([arXiv version](https://arxiv.org/pdf/1011.1350v1),
[DOI](https://doi.org/10.1145/1993636.1993704)).
The same result appears as Corollary 5.26 of their
*Fundamental invariants of orbit closures*, Journal of Algebra 477
(2017), 390–434
([arXiv version](https://arxiv.org/pdf/1511.02927v2),
[DOI](https://doi.org/10.1016/j.jalgebra.2016.12.035)).
Nonnormality alone does not imply failure of Cohen–Macaulayness.
For these same unit-tensor orbit closures, the family theorem proves
the stronger failure of $`S_2`$ and the vertex-depth inequality.
It gives no conclusion about Cohen–Macaulayness of their normalizations.
The cited nonnormality results are context, not assumptions of this proof.

**Scope.** The results concern reduced complex varieties with three tensor
factors, including the zero tensor in the affine cone. They determine
neither the exact vertex depth nor the exact depth at $`T_r`$ for $r\geq6$.
In particular, they do not assert
$`\mathrm{depth}\,\mathcal O_{X_r,T_r}<2`$: failure of $`S_2`$ for that
local ring may occur at a further localization. No claim is made that any
displayed format is the smallest counterexample, that every normalization
fiber has only the two displayed points, or that every tensor border-rank
variety fails Cohen–Macaulayness.

For $1\leq r\leq4$, no three-factor tensor in arbitrary finite
dimensions has two distinct immersive $r$-term decompositions.
Thus rank five is first for this particular mechanism; this does not
classify the Cohen–Macaulayness of rank-at-most-four secants or of
formats outside the theorem. In particular, the theorem does not
decide $`X_5(3,4,4)`$ or $`X_5(4,4,4)`$.

The adjacent family $`X_5(3,3,c)`$ is Cohen–Macaulay for every $c\geq1$:
it is the ambient space for $c\leq5$ and the generic $9\times c$
rank-at-most-five determinantal variety for $c\geq5$.
See the [rank threshold](verification/core/families/proofs/RANK_FIVE_THRESHOLD.md) and
[boundary results](verification/core/families/proofs/BOUNDARIES_AND_PROJECTIVIZATION.md).

On an invertible-slice chart with two matrix factors of dimension $r$,
length-$r$ decompositions are either unique or have a nonzero
addition-differential kernel. The original witness lifts to smooth
concise-secant points. The [transfer analysis](verification/core/families/proofs/TRANSFER_DERIVATION.md)
therefore gives no Hilbert or Quot counterexample and no refutation of
Haiman's or Artin–Hochster's conjectures.

## Evidence status

- **Formally proved in Lean 4 with Mathlib:** exactly two finite
  certificate layers, in two separate pinned projects.
  `TR25.finiteCertificate : TR25.FiniteCertificate` in [lean/witness-666/](lean/witness-666/README.md)
  formalizes the original finite $6\times6\times6$ certificate: the
  $3\times3\times5$ integer witness and its zero padding, two distinct
  decompositions with nonzero, pairwise nonproportional summands,
  flattening ranks five over $\mathbb C$, six rational determinant values,
  and coordinate Jacobian ranks $45$ and $80$ at both decompositions.
  `TR25Family.finiteCertificate : TR25Family.FiniteCertificate` in
  [lean/family-345/](lean/family-345/README.md) formalizes the fixed integer
  witness in ambient format $3\times4\times5$, its two five-term
  decompositions, flattening ranks $3,3,5$, the pair-product and
  third-factor ranks, the six determinant values, and both coordinate
  Jacobian ranks $50$. Each theorem uses exactly the axioms `propext`,
  `Classical.choice` and `Quot.sound`. Neither project formalizes border
  rank, secant dimension, geometric tangent identification, normalization,
  the conductor argument, $`S_2`$, Cohen–Macaulayness, vertex depth, or the
  family geometry. Those conclusions use the written proofs. The geometric
  dimension $50$ belongs to the written family proof; the formalized
  number $50$ is the rank of each coordinate Jacobian at the fixed witness.
  No numbered result of the paper is a Lean theorem in full.
- **Exact computation:** standard-library checkers verify the tensor
  equality, distinctness, flattening and pair-product ranks, and both
  tangent ranks of the rank-five witness by two independent routes. They
  use exact integer and rational arithmetic and elimination modulo the
  primes $1{,}000{,}003$ and $101$; a nonzero modular minor gives an exact
  lower bound on the characteristic-zero rank, and the dimensions in the
  proof give matching upper bounds. The normalization suites verify the
  torus-elimination identity, the six tangent determinants, the avoidance
  determinant and arc identities, the fixed six-point core of the
  higher-rank and boundary-model theorems, and the tangent dimensions of
  the local-ring theorem in three formats. A separate checker recomputes
  the $3\times4\times5$ certificate by full rational elimination, and a
  finite-instance suite checks the family witnesses for 15 pairs $(r,p)$
  and the extension from $4\times5\times8$ to $5\times5\times8$, 31 pairs of
  decompositions in all. Every
  suite requires identical registered output in normal, optimized (`-O`)
  and second-hash-seed runs, and every registered negative control must
  reject its altered input. These finite checks certify the witness
  calculations. The conclusions about $`S_2`$, Cohen–Macaulayness, and
  vertex depth also use the written algebraic-geometric and
  commutative-algebra arguments. No finite sampling is used to establish
  a universal quantifier.
- **Proved in the paper only:** the family theorem for every rank and
  format, including the dimension, the smooth birational charts, the
  conductor obstruction and the vertex-depth inequality; the projective
  statement; the rank-five threshold, the Cohen–Macaulay family
  $`X_5(3,3,c)`$ and the invertible-slice and concise-lift results; and
  every normalization-fibre, local-ring and boundary-model theorem, whose
  fixed finite cores are checked exactly. The
  [section map](paper-lean-mapping/by-section.md) gives the evidence for
  each numbered result.
- **Review:** the [review record](verification/reviews/README.md) contains
  the independent informal AI-agent audits of the original case, the family
  theorem, the normalization, local-ring and boundary-model results, both
  Lean certificates and the paper; none requested a mathematical correction.
- **Open:** the exact depth at the homogeneous vertex, the exact depth at
  $`T_r`$ for $r\geq6$, minimal counterexample formats, the
  Cohen–Macaulayness of rank-at-most-four secants and of formats outside
  the theorem such as $`X_5(3,4,4)`$ and $`X_5(4,4,4)`$, global
  normalization geometry including Cohen–Macaulayness and rational
  singularities, and mixed boundary geometry beyond E1 and E2.

## Where to read

Start with the [guide from the question to the checks](paper-lean-mapping/README.md),
then the [paper](paper/main.pdf). The
[section-by-section map](paper-lean-mapping/by-section.md) lists every
numbered result with its Lean declarations, exact checks or written-only
status.

Plain-text versions are the [statement](verification/core/proofs/STATEMENT.md) and
[proof](verification/core/proofs/PROOF.md) of the original $6\times6\times6$ case, the
[family statements](verification/core/families/proofs/STATEMENTS.md) and their
[proof guide](verification/core/families/README.md), and the
[normalization statements](verification/core/normalization/proofs/STATEMENTS.md) with their
[proof guide](verification/core/normalization/README.md), including the
[higher-rank](verification/core/normalization/higher_rank/README.md),
[local-ring](verification/core/normalization/local_ring/README.md) and
[boundary-model](verification/core/normalization/boundary_models/README.md) packages.
The formal propositions are in [TR25/Statement.lean](lean/witness-666/TR25/Statement.lean)
and [TR25Family/Statement.lean](lean/family-345/TR25Family/Statement.lean).
The [Lean guide](lean/witness-666/README.md), the [family Lean guide](lean/family-345/README.md),
the [exact-check guide](verification/README.md), the
[normalization exact-check guide](verification/core/normalization/verification/README.md)
and the [verification record](VERIFICATION.md) give reproduction details.

## Reproduce the checks

Use Python 3.11 or later, from the repository root:

```sh
python3 -S -s -B verification/run.py
python3 -S -s -B -O verification/run.py
python3 -S -s -B paper-lean-mapping/build_and_check.py
python3 -S -s -B -O paper-lean-mapping/build_and_check.py
python3 -I -B tools/check_markdown_math.py
sha256sum --check SHA256SUMS
```

The first runner also executes the normalization suites. With the pinned
Lean toolchain installed through elan, run from `lean/witness-666/`:

```sh
lake exe cache get
python3 -B audit/test_verify.py
python3 -B -O audit/test_verify.py
python3 -B audit/check_literal_data.py
python3 -B -O audit/check_literal_data.py
LEAN_NUM_THREADS=1 python3 -B audit/verify.py
```

and from `lean/family-345/`:

```sh
lake exe cache get
python3 -B audit/test_exact.py
python3 -O -B audit/test_exact.py
python3 -B audit/test_verify.py
python3 -O -B audit/test_verify.py
python3 -B audit/check_exact.py
python3 -O -B audit/check_exact.py
python3 -B audit/check_literal_data.py
python3 -O -B audit/check_literal_data.py
LEAN_NUM_THREADS=1 python3 -B audit/verify.py
```

The [paper guide](paper/README.md) gives the LaTeX build command.

## Layout

- `paper/`: manuscript source, section files, bibliography and PDF.
- `lean/`: two pinned Lean projects, `witness-666/` for the $6\times6\times6$ finite certificate and `family-345/` for the $3\times4\times5$ finite certificate, each with audit scripts and certificate data.
- `paper-lean-mapping/`: reading guide, result map, machine-readable mapping and its checker.
- `verification/`: one entry point for the exact checks; `core/proofs/` holds the plain-text statement and proof of the original $6\times6\times6$ case, `core/verification/` the exact checks for the rank-five witness, `core/families/` the plain-text proofs of the family theorem and its boundaries, `core/family-instances/` the finite-instance checks of the family witnesses, and `core/normalization/` the plain-text proofs and exact checks for the normalization fibres, the higher-rank fibres, the completed local ring and the boundary models; `reviews/` holds the review record.
- `tools/`: a static guard for GitHub Markdown math.

## License and citation

Files outside `paper/` are available under the [MIT license](LICENSE).
The files in `paper/`, including the manuscript source and PDF, are licensed
under [CC BY-SA 4.0](paper/LICENSE).
Citation information is in [CITATION.cff](CITATION.cff).

## Acknowledgements

We thank [NetMind.AI](https://www.netmind.ai/) and [AI4ALPHA](https://www.ai4alpha.ca/) for their
support of this project. The research of Wenqi Zhu was also supported by the Engineering and Physical Sciences Research
Council under grant EP/Y028872/1, *Mathematical Foundations of Intelligence: An "Erlangen Programme" for AI*.
