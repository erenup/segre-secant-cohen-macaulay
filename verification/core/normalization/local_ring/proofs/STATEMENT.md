# TR-25 circuit local ring: exact statement

Over C, let X_5(a,b,c) be the reduced affine closure of sums of five
decomposable tensors in C^a⊗C^b⊗C^c. Assume a,b≥3, a+b≥7, c≥5.
In coordinate C³ subspaces of the first two factors, put

    M = [[1,1,1],[1,2,3],[1,4,9]],
    Q_i = e_i⊗row_i(M)        (i=1,2,3),
    Q_(3+j) = −col_j(M)⊗e_j   (j=1,2,3),
    T = Σ_(i=1)^5 Q_i⊗f_i,

where f_i are the first five coordinate vectors of C^c. Set
q=2(a+b−6) and h=3a+3b+5c+2.

The theorem identifies the completed local C-algebra at T as

    C[[z_1,...,z_h, x_(i,j):1≤i≤6,1≤j≤q]] /
        (x_(i,j)x_(k,l):i≠k).

It implies the following exact invariants of O_(X_5(a,b,c),T):

- Dimension h+q=5(a+b+c−2).
- Depth h+1=3a+3b+5c+3.
- Embedding dimension h+6q.
- Hilbert–Samuel multiplicity six.

The normalization of this completed ring is the product of its six
regular branch rings C[[z,x_i]]. Every two branches meet the same reduced
smooth h-dimensional germ. The conductor into that normalization is
(all x_(i,j)), with quotient C[[z]].

The formula is invariant under simultaneously permuting tensor factors
and transporting this specified witness. It concerns this explicit
rank-five family only. It asserts no depth at the homogeneous vertex,
no global property of the normalization, and no higher-rank fiber formula.
In particular depth69 at the 6×6×6 witness does not assert depth<2 there.

The result addresses the local-depth question in the earlier normalization
result. It is not presented as a separate named conjecture in the literature.
The full proof is [PROOF.md](PROOF.md).
