# Exact verification

Run `python3 -S -s -B run.py` from the
this directory with Python 3.11 or later. Only the standard library is
needed. All arithmetic uses integers, `Fraction`, or finite prime fields.

`check_witness.py` reads [witness.json](witness.json). It checks the exact
integer equality of the two five-term decompositions, nonzero factors,
distinct summand directions and distinct decompositions, rank-five pair
products and third-mode flattening, and tangent matrix ranks 45 and 80
at both decompositions. Its independent column elimination uses the prime
1,000,003, whose primality it checks by trial division.

`check_five_term_tensor.py` constructs both decompositions directly from
the matrix `[[1,1,1],[1,2,3],[1,4,9]]`. It checks integer equality,
nonzero and distinct pure summands, distinct unordered decompositions,
and tangent matrix ranks 45 and 80 at both decompositions. Its separate
row elimination uses the prime 101. It does not import the first checker
or read its witness file.

A rank computed over a prime field gives an exact lower bound on the
rank of the integer matrix over the rationals or complex numbers. Each
nonzero pure summand has two independent scaling directions in the kernel
of its factor-coordinate derivative. These give the matching tangent
upper bounds `5(3+3+5-2)=45` and `5(6+6+6-2)=80`. The rank-five
flattening and displayed five-term decomposition prove tensor rank and
border rank five, using the fact that flattening minors vanish on the
Zariski closure of the corresponding lower-rank tensors.

The checkers establish this finite existence input. The failure of S2
and Cohen--Macaulayness, including the depth defect at the homogeneous
vertex, follows from the [written proof](../proofs/PROOF.md). A tangent
matrix rank or nonnormality alone is not a proof of that conclusion.

## Negative controls

The first checker has three controls: `equality` changes one integer
factor entry; `rank` applies a common rank-one projection to the first
mode, preserving tensor equality while destroying pair-product
independence; and `distinct` supplies the same decomposition twice.

The second checker has two controls: `equality` changes a factor entry
in its separately constructed decomposition, and `degeneracy` repeats
one summand five times. These are selected through `--negative-control`.
Each must exit with status 1, empty stdout, and exactly the stderr
registered in [NEGATIVE_CONTROLS.json](NEGATIVE_CONTROLS.json).

## Bindings and execution

[CHECKERS.txt](CHECKERS.txt) records each checker's expected stdout SHA256.
Positive executions must exit zero, produce no stderr, and match these
hashes. The runner executes each checker and all its controls in three
modes: normal with hash seed 1, `-O` with seed 1, and normal with seed
8675309. Site initialization and bytecode writes are disabled. The three
positive outputs must be byte-identical. There are six positive
executions and fifteen negative-control executions.

[SHA256SUMS](SHA256SUMS) covers every verification file except itself,
including the runner, guide, registries, bindings, and witness. The runner
checks complete manifest and checker coverage, standard-library imports,
absence of assertions and inexact literals, and JSON with unique keys
and integer numbers. Symbolic links, bytecode files, and unregistered
files fail validation.

[SOURCE_BINDINGS.txt](SOURCE_BINDINGS.txt) records the source and curated
proof hashes. The runner verifies the two files under `proofs/` against
their curated hashes. It checks all verification and proof hashes again
after execution. Any mismatch exits nonzero, including under `-O`.
