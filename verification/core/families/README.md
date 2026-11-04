# Family proofs

Over $\mathbb C$, the reduced three-factor border-rank variety
$`X_r(a,b,c)`$ is non-$`S_2`$ and non-Cohen–Macaulay for every integer
$r\geq5$, $a,b\geq3$, $a+b\geq r+2$, and $c\geq r$, allowing factor
permutations. Its dimension is $r(a+b+c-2)$; its homogeneous vertex has
smaller depth. An explicit integer tensor of ordinary and border rank
exactly $r$ has a non-Cohen–Macaulay local ring.

The precise assertions and qualifications are in
[STATEMENTS.md](proofs/STATEMENTS.md).

| Proof | Contents |
| --- | --- |
| [Family theorem](proofs/REACH_DERIVATION.md) | Subset-rank criterion, smooth incidence charts, codimension estimate, integer witnesses in every stated format, and conductor obstruction |
| [Spectral subfamilies](proofs/SPECTRAL_FAMILIES.md) | A simpler proof when two flattenings have full rank |
| [Rank-five threshold](proofs/RANK_FIVE_THRESHOLD.md) | No two distinct immersive decompositions for ranks one through four in three factors |
| [Projectivization and boundaries](proofs/BOUNDARIES_AND_PROJECTIVIZATION.md) | Local non-Cohen–Macaulayness in projective secants, the Cohen–Macaulay family $`X_5(3,3,c)`$, and unit-tensor orbit closures |
| [Transfer limitations](proofs/TRANSFER_DERIVATION.md) | Invertible-slice obstruction and the distinction from Hilbert and Quot assertions |

These arguments use the rank-five witness and conductor lemma in the
[original proof](../proofs/PROOF.md). The existing
[verification guide](../verification/README.md) describes its exact finite
certificate. From this directory:

```sh
python3 -S -s -B ../verification/run.py
```

The all-rank extension is a written proof using this same finite input,
not a finite sampling assertion. The [original Lean project](../../../lean/witness-666/README.md) covers the original
$6\times6\times6$ finite certificate. The [family-instance Lean project](../../../lean/family-345/README.md)
checks the fixed $3\times4\times5$ witness, including rank 50 for both
$60\times60$ coordinate Jacobians. Both formalize finite certificates only;
neither formalizes the family geometry, its dimension or depth, or the
theorem for every rank.
