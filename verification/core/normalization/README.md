# Normalization fibres

The [statements A–E](proofs/STATEMENTS.md) give the general finite reduced
intersection criterion, six actual decompositions of the explicit tensor
families, the precise rank-five normalization fibre, and the additional
higher-rank boundary points. All varieties are reduced over the complex
numbers and normalization is in their own function fields.

The [geometric proof](proofs/NORMALIZATION_FIBERS.md) proves A–D using the
[family theorem](../families/proofs/REACH_DERIVATION.md). The elementary
[retract and conductor arguments](proofs/RETRACTS_AND_CONDUCTOR.md) prove E.
The [exact identities](verification/README.md) support the calculations.

The [higher-rank statements A–C](higher_rank/proofs/STATEMENTS.md) give
six reduced smooth normalization points for the diagonal extensions with
$r\geq6$, $a,b\geq r-2$ and $c\geq r$, as well as exact smooth
fibres for their rank-six and three-dimensional-factor row witnesses.
The row cases are included in the
[one-sided theorem D](boundary_models/proofs/STATEMENT_D.md): for
$r\geq6$, $a\geq r-2$, $b\geq3$, $c\geq r$ and
$a+b\geq r+2$, its row witness has exactly $r+1$ reduced
normalization points. Six are smooth actual decomposition points. The
$r-5$ dependent boundary points are smooth exactly when $r=6$ or $b=3$,
and are singular when $r\geq7$ and $b\geq4$.

The [mixed theorems E1 and E2](boundary_models/proofs/STATEMENT_E.md)
give exact fibres for two further specified splits. E1 covers
$`T_{r;4,r-3}`$ with one added row and $r-6$ added columns for
$r\geq7$, $a\geq4$, $b\geq r-3$, $c\geq r$ and
$a+b\geq r+2$: there are $r+1$ reduced points, six actual and smooth
and $r-5$ dependent and singular. E2 covers only $`T_{9;5,5}`$ with two
added rows and two added columns for $a,b\geq5$, $a+b\geq11$ and
$c\geq9$: there are ten reduced points, six actual and smooth and four
dependent and singular, including when $a=5$ or $b=5$.

These conclusions allow factor permutations with the witness transported.
The normalization morphism is unramified near the entire fibre in all
the stated cases, including those with singular boundary points. See the
[boundary-model guide](boundary_models/README.md) for the normal local
models, their smooth/étale covers and the exact tangent dimensions.
The [rank-five completed local-ring theorem](local_ring/proofs/STATEMENT.md)
describes the local ring for its specified circuit witnesses.

Boundary geometry beyond these stated families, including broader mixed
splits beyond E1 and E2, is not determined by these results. Global
Cohen–Macaulayness and rational singularities of the normalization also
remain undetermined.
The local inverse derivative bounds imply no probability-tail or moment
conclusion and no global single-valued inverse.
