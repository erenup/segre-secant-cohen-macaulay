# Higher-rank normalization fibres

The [statements A–C](proofs/STATEMENTS.md) determine complete normalization fibres
over three explicit families of complex rank-`r` tensors:

- Diagonal extensions: exactly six reduced smooth points for `r≥6`,
  `a,b≥r−2`, `c≥r`, all represented by actual decompositions.
- The row-extension rank-six witness: exactly seven reduced smooth points
  for `a≥4`, `b≥3`, `a+b≥8`, `c≥6`; six actual decompositions and one
  additional point. The transposed statement also holds.
- The row family with `b=3`: exactly `r+1` reduced smooth points for
  `r≥6`, `a≥r−1`, `c≥r`; six actual decompositions and `r−5` additional
  points.

Each family has an open neighborhood whose entire normalization is smooth
and whose normalization map is unramified. The proofs are
[diagonal extensions](proofs/DIAGONAL_EXTENSIONS.md),
[the rank-six boundary point](proofs/RANK6_BOUNDARY.md), and
[the three-dimensional-factor family](proofs/THREE_DIMENSIONAL_FACTOR.md).
[Prior inputs](PRIOR_INPUTS.md) identify the earlier results used.

The [exact checker](verification/README.md) verifies the fixed core algebra.
The universal conclusions rely on the written proofs. The full mixed
row/column family at `r≥7` with both matrix factors enlarged, the global
normalization, and homogeneous-vertex depth remain outside these statements.
