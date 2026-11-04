# Prior mathematical inputs

The proofs use the following existing repository files:

- [The baseline proof](../../proofs/PROOF.md): the circuit matrices, tangent
  intersections and elementary generic diagonal-orbit arguments.
- [The family derivation](../../families/proofs/REACH_DERIVATION.md): the
  full-spark/Sylvester generic birationality criterion and the original
  row/column witness family, including tangent and avoidance formulas.
- [The normalization statements](../proofs/STATEMENTS.md) and
  [normalization proof](../proofs/NORMALIZATION_FIBERS.md): the complete
  rank-one intersections; the finite unramified configuration model; the
  full-flattening-rank tensor bundle; the complete rank-five normalization
  theorem and the at-least-`r+1` higher-rank bound.

The rank-five theorem, exact rank-one intersections and six actual-decomposition counts are prior results. This package does not claim them as new. In the diagonal proof the core algebra and generic birationality are independently re-derived. The other proofs explicitly identify their use of these earlier facts.

Standard background includes projectivity of the Hilbert scheme of finite subschemes of a projective variety, proper quasi-finite morphisms being finite, finite normalization over C, smoothness under free finite-group quotients, the Jacobian criterion, and the Rees-algebra description of the graph of a rational map. Where a stronger local statement is needed, the proof supplies the coordinate argument.

The child verifier binds the four new statement/proof files and the two
normalization inputs above. The baseline and family derivation are written
mathematical references, not runtime inputs to this checker; their existing
verification remains in the enclosing TR-25 suite.
