# Family theorem and its scope

All fields below are C, all secant varieties use their reduced structure,
and all tensor products have THREE factors.

1. For every integer r>=5 and a,b,c with a,b>=3, a+b>=r+2, c>=r,
   the affine border-rank-at-most-r variety X_r(a,b,c) is non-S2 and
   non-Cohen--Macaulay. Its dimension is D=r(a+b+c-2); its homogeneous
   vertex has depth<D. An explicit integer tensor of ordinary and
   border rank exactly r has a non-CM local ring. Factor permutations
   are allowed. Proof: REACH_DERIVATION.md and the baseline
   conductor proof in ../../proofs/PROOF.md.
2. In particular X_5(3,4,5) has dimension50 and vertex depth<50, and
   every X_r(3,r-1,r), r>=5, has dimension2r^2 and is non-S2. Every
   unit-tensor orbit closure X_r(r,r,r), r>=5, is non-S2.
3. For 1<=r<=4 no three-factor tensor in arbitrary finite dimensions
   has two distinct immersive r-term decompositions. Thus r=5 is the
   first possible rank for THIS mechanism. Proof:
   RANK_FIVE_THRESHOLD.md.
4. The projective varieties in (1) are not locally CM at the displayed
   nonzero tensor classes. The adjacent family X_5(3,3,c), every c>=1,
   is ambient space for c<=5 and a generic flattening determinantal
   variety for c>=5, hence CM. Proof:
   BOUNDARIES_AND_PROJECTIVIZATION.md.
5. In an invertible-slice chart with the two matrix factors of dimension
   r, length-r decompositions are either unique or have an explicit
   nonzero addition-differential kernel. In particular the two-immersive-
   decomposition mechanism cannot occur there. The original witness
   lifts to smooth concise-secant points and does not produce a Hilbert
   or Quot counterexample. Proof: TRANSFER_DERIVATION.md,
   including the projective framed chart.

SPECTRAL_FAMILIES.md gives a simpler proof of subfamilies of (1).
From the repository root, run
`python3 -I -S -B verification/run.py`;
its certificate proves the fixed
rank-five numerical input, while the generalization is a written proof.
No finite sampling certifies an all-r statement. All results above are
limited to their displayed quantifiers.
