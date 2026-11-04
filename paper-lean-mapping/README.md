# From the Cohen–Macaulay question to the checks

The catalogue question asks whether, for every $k\geq3$, all
$`n_1,\ldots,n_k\geq1`$ and every $r\geq1$, the reduced coordinate ring of
the variety of complex tensors of border rank at most $r$ is
Cohen–Macaulay. One format and one rank in which it is not
Cohen–Macaulay refute the universal assertion.

The paper proves much more: for every $r\geq5$, $a,b\geq3$, $a+b\geq r+2$
and $c\geq r$, the variety $`X_r(a,b,c)`$ fails Serre's condition $`S_2`$
and is not Cohen–Macaulay. Already $`X_5(3,4,5)`$ is a counterexample.

| Symbol | Meaning |
| --- | --- |
| $`X_r(a,b,c)`$ | The reduced affine variety of tensors of border rank at most $r$ in $`\mathbb C^a\otimes\mathbb C^b\otimes\mathbb C^c`$ |
| $D$ | $r(a+b+c-2)$, the dimension of $`X_r(a,b,c)`$ |
| $M$ | The integer matrix with rows $(1,1,1)$, $(1,2,3)$, $(1,4,9)$ |
| $`Q_1,\ldots,Q_6`$ | Rank-one matrices built from the rows and the negated columns of $M$; their only relation is $`\sum_iQ_i=0`$ |
| $`T_5`$ | $`\sum_{i=1}^5Q_i\otimes f_i\in\mathbb C^3\otimes\mathbb C^3\otimes\mathbb C^5`$, with a second decomposition using $`Q_6`$ |
| $`T_{r;p,q}`$ | The integer witness (4.18) obtained from $`T_5`$ by adding rank-one matrices in new rows and columns |
| (G) | The subset-rank condition $`\mathrm{rank}\,A_J+\mathrm{rank}\,B_J\geq\lvert J\rvert+2`$ for every $`\lvert J\rvert\geq2`$ |
| $Y$, $f$ | The smooth space of unordered decompositions with independent third factors, and the addition map to $`X_r(a,b,c)`$ |

## The argument in five steps

1. **Smooth birational charts (paper Section 2).** Condition (G) forces the
   span of the matrix factors to meet the Segre variety in exactly the
   expected reduced points. This gives a smooth birational decomposition
   space $Y$ whose good open set has image in the smooth locus and
   complement of codimension at least two.
2. **The conductor obstruction (Section 3).** If two distinct points of $Y$
   over one tensor have injective differentials, the local ring at that
   tensor is neither $`S_2`$ nor Cohen–Macaulay.
3. **Integer witnesses (Section 4).** The tensor $`T_5`$ has two distinct
   immersive decompositions. Six nonzero rational determinants control
   the tangent intersections, and adding rows and columns gives witnesses
   $`T_{r;p,q}`$ in every rank and format of the theorem.
4. **The vertex (Section 5).** A graded free resolution and the
   Auslander–Buchsbaum formula turn the local failure into the strict
   vertex-depth inequality, and a chart argument gives the projective
   statement.
5. **Limits and normalization fibres (Sections 6 and 7).** Rank five is the
   first rank for this mechanism, $`X_5(3,3,c)`$ is Cohen–Macaulay, and
   the mechanism cannot occur on invertible-slice charts. Section 7
   determines normalization fibres, the completed local ring at the
   rank-five circuit and the boundary models D, E1 and E2.

Read [by-section.md](by-section.md) alongside the [paper](../paper/main.pdf).
It lists every numbered result in order with its evidence.
[mapping.json](mapping.json) records the paper labels, the Lean
declarations and certificate fields, the exact-check functions and the
limits of each entry.

## What each kind of evidence establishes

Two separate Lean projects each prove one aggregate finite certificate.
In [lean/witness-666/](../lean/witness-666/README.md), `TR25.finiteCertificate : TR25.FiniteCertificate`
covers the 3×3×5 witness and its padding to 6×6×6: tensor equalities,
nonzero and pairwise nonproportional summands, different decompositions,
third-flattening rank five, the six rational determinants of Lemma 4.2,
and coordinate Jacobian ranks 45 and 80. In
[lean/family-345/](../lean/family-345/README.md),
`TR25Family.finiteCertificate : TR25Family.FiniteCertificate` covers the
fixed witness in format 3×4×5: the same kinds of data, flattening ranks
3, 3 and 5, pair-product and third-factor ranks, and both coordinate
Jacobian ranks 50. The permitted axioms are `propext`, `Classical.choice`
and `Quot.sound`.

Neither Lean theorem formalizes border rank, secant-variety dimension,
geometric tangent-space identification, normalization, the conductor
argument, $`S_2`$, Cohen–Macaulayness, vertex depth or the family
geometry. None of these is an assumption of either Lean theorem, and no
numbered result of the paper is a Lean theorem in full. The geometric
dimension 50 of $`X_5(3,4,5)`$ belongs to the written proof; the
formalized number 50 is the rank of each coordinate Jacobian at the fixed
witness.

The exact checks recompute the finite witness data with integer and
rational arithmetic and elimination modulo primes, by two independent
routes for the 3×3×5 witness and by full rational elimination for the
3×4×5 witness. The normalization suites verify fixed identities used in
Section 7: the torus-elimination identity, the six-point core, the
avoidance determinant, the arc coefficients and the tangent dimensions
of the local-ring theorem in three formats. Each suite has registered
negative controls that must be rejected. These computations support the
written argument; they do not establish a statement for all parameters.

Everything else is proved in the paper. No finite sampling is used to
establish a universal quantifier.

## Check the correspondence

From the repository root, run:

```sh
python3 -S -s -B paper-lean-mapping/build_and_check.py
python3 -S -s -B -O paper-lean-mapping/build_and_check.py
```

The standard-library script indexes the numbered results of the TeX
sources in order, with the shared counter in each section, and every
direct label of each result. It indexes the Lean declarations of both
projects after masking comments and strings, the fields of the two
certificate structures, and the field assignments of the two aggregate
theorems. Each of the 28 certificate fields must be mapped to exactly the
theorem that fills it, in its own project, and each axiom probe must name
its aggregate theorem. Mapped exact-check functions must exist in the
named checkers. The result table in [by-section.md](by-section.md) must
equal the table generated from the mapping, and every mapped declaration
and check must be named there.

A missing paper label, numbered result, paper input, Lean file,
declaration, certificate field, exact-check file or function makes the
script fail. Thirty-three in-memory negative controls exercise these
rejections without changing any file. Both commands print the same
output. The script does not compile Lean, build the PDF or run the
mathematical checks; their commands are in the [Lean guide](../lean/witness-666/README.md),
the [family Lean guide](../lean/family-345/README.md), the
[exact-check guide](../verification/README.md) and the
[verification record](../VERIFICATION.md).
