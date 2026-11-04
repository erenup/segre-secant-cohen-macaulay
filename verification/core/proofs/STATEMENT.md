# TR-25: complete negative answer

## Original quantified target

For every k>=3, n_1,...,n_k>=1, r>=1, over C, let X_r be the Zariski closure of tensors that are sums of r pure tensors in V=C^(n_1) tensor ... tensor C^(n_k). Let A_r=C[V]/I(X_r), using the reduced vanishing ideal, and m its homogeneous maximal ideal. The catalogue asks whether depth (A_r)_m = dim (A_r)_m for every such format and r.

## Result

The universal assertion is false. For k=3, n_1=n_2=n_3=6 and r=5, the reduced affine border-rank-at-most-five variety X has dimension 80 and

    depth C[X]_m < 80.

In fact X does not satisfy Serre's condition S2. The proof exhibits an explicit integer tensor T with two immersive five-term decompositions and shows O_(X,T) is not Cohen--Macaulay using the conductor of the finite normalization. It does not claim depth O_(X,T)<2; the failure of S2 as a ring may occur at a localization.

All tensor entries and decomposition factors are given in witness.json. PROOF.md is self-contained apart from precisely stated standard algebraic-geometric and commutative-algebra results.

This counterexample concerns the actual reduced tensor secant variety and its affine cone, including the vertex. It does not substitute a nonreduced ideal, a different component, numerical evidence, or a restricted positive statement for the original question.
