# Secant Varieties of Segre Products Need Not Be Cohen–Macaulay

*Two immersive decompositions, the conductor, and a failure of Serre's condition* $`S_2`$

Authors: Wenqi Zhu; Ping Nie.

Wenqi Zhu — Mathematical Institute, Woodstock Road, University of Oxford, Oxford, UK, OX2 6GG — wenqi.zhu@maths.ox.ac.uk

Ping Nie — David R. Cheriton School of Computer Science, University of Waterloo — ping.nie@uwaterloo.ca

The [paper](main.pdf) proves, in Theorem 1.1, that for every integer
$r\geq5$ and all $a,b\geq3$ with $a+b\geq r+2$ and $c\geq r$, up to
factor permutation, the reduced affine variety of complex tensors of
border rank at most $r$ in $\mathbb C^a\otimes\mathbb C^b\otimes\mathbb C^c$
has dimension $D=r(a+b+c-2)$ and fails Serre's condition $`S_2`$. Its
coordinate ring is not Cohen–Macaulay, its homogeneous vertex has depth
strictly less than $D$, and explicit integer witnesses have
non-Cohen–Macaulay local rings. The corresponding projective secants are
locally non-Cohen–Macaulay at the displayed nonzero classes. Section 6
shows that rank five is the first rank for this mechanism and that the
rank-five family in format $3\times3\times c$ is Cohen–Macaulay. Section 7
determines normalization fibres, the completed local ring at the
rank-five witness and the boundary models D, E1 and E2.

The source is [main.tex](main.tex), with eleven included files in
[sections/](sections/) and bibliography [refs.bib](refs.bib).
Build from this directory with LaTeX, BibTeX, and `latexmk`:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -no-shell-escape -outdir=build/ci main.tex
```

The rebuilt PDF is `build/ci/main.pdf`. The included `main.pdf` has the
same content, 42 pages. Standard TeX Live packages, including `lmodern`,
`microtype`, `natbib`, `xurl` and `hyperref`, suffice. The source and PDF
list the authors above. [SHA256SUMS](SHA256SUMS) lists the SHA-256 of every
other file in this directory.

The finite witness calculations are certified by exact arithmetic and by
two Lean finite certificates; see the
[section-by-section map](../paper-lean-mapping/by-section.md) for the
evidence attached to each numbered result. The infinite family, the
geometry and the depth conclusions follow from the written proofs.

All files in this directory, including the manuscript source and PDF, are
licensed under [CC BY-SA 4.0](LICENSE).
