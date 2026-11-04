# Two full flattenings and families of non-S2 tensor secants

Let X_r(a,b,c) be the reduced affine border-rank-at-most-r variety over C.
In a decomposition write the three factor-column lists as A,B,C.

## Smooth chart lemma

If B and C have column rank r, and the nonzero columns of A are pairwise
nonproportional, the image tensor is a smooth point of X_r(a,b,c).

First take b=c=r. Choose a linear functional alpha on the first factor
nonzero on every A column. The alpha slice M_0 is invertible. Divide all
remaining matrix slices by M_0 on the right, obtaining X_1,...,X_(a-1).
On the dense decomposition locus these matrices commute, so the same
polynomial identities hold throughout the reduced secant on this chart.
Pairwise nonproportional A columns say that the r joint eigenvalue tuples
are pairwise distinct. Choose a linear combination X of the normalized
slices with simple spectrum; such a combination exists by avoiding the
finitely many hyperplanes where two joint eigenvalues coincide.

The open variety of commuting tuples containing this fixed simple-spectrum
linear combination is smooth. After choosing that combination as the first
coordinate of the tuple, it is the vector bundle of (a-2) elements of the
rank-r centralizer over the smooth open set of simple-spectrum r by r
matrices. The centralizer is locally free since its dimension is constantly
r. Its dimension is r^2+(a-2)r. Conversely every tuple on this open set is
simultaneously diagonalizable, and together with any M_0 in GL_r it gives
a sum of r pure tensors. Thus equality with the secant holds as reduced
varieties on this open set; its dimension is 2r^2+(a-2)r and it is smooth.

For b,c >= r restrict to the open subset of X_r where the B and C
flattenings both have rank r. Their images are regular support maps to
Gr(r,B) and Gr(r,C), using the usual invertible-minor charts. Local
trivializations identify this subset with the corresponding full-support
open of X_r(a,r,r) times an affine Grassmann chart. The inverse map inserts
the supports. This identification is valid for reduced varieties: a tensor
in the smaller support has border rank <=r in the large ambient space iff
it does in that support, because linear projections to the supports
preserve sums of r pure tensors and their closures. Hence the original
point is smooth too.

These charts also give uniqueness of the unordered decomposition, by
the distinct joint eigenspaces. Thus when two factor dimensions are >=r
and a>=2, the unordered addition morphism is birational and
dim X_r = r(a+b+c-2).

## Codimension estimates in the decomposition source

Use the smooth unordered source Y of r distinct nonzero pure tensors,
as in the input proof. Rank and proportionality conditions can be computed
on the smooth factor-vector cover and descended through its torus fibers
and the free finite permutation quotient.

(A) If a,b,c >= r and r>=3: remove loci where at least two factor matrices
have rank <r, and all loci where two columns in any factor are proportional.
Two rank deficiencies have codimension at least 2. A proportionality locus
has codimension n_i-1 >=2. Every remaining point has two full factor
matrices and distinct projective columns in the third factor. Its image
is smooth by the lemma. Thus a smooth-image open has complement of
codimension at least two.

(B) If a>=3 and b,c>=r+1: remove B or C rank deficiency (each has
codimension at least two) and A pairwise proportionality (codimension
a-1>=2). Again the image of the resulting open is smooth and its
complement has codimension at least two. No full-rank assumption on A
is required.

The conductor argument of the input proof therefore applies in (A) and
(B): two distinct immersive decompositions force failure of S2 and a
non-CM local ring at their common image.

## Diagonal enlargement of the witness

For r=5+s, s>=0, enlarge each old support by s fresh basis vectors and put

    T_r = T_5 + sum_(j=1)^s u_j tensor v_j tensor w_j.

Here T_5 is the existing 3 by 3 by 5 witness. Its two decompositions extend
by the same s diagonal terms. The support dimensions are (r-2,r-2,r).
The third flattening rank is r: its image is the direct sum of the old
five-dimensional matrix space and the s distinct diagonal matrices.
Thus rank and border rank are both r.

In any larger factor spaces, the tangent spaces at the five old terms
still sum directly: the old tangent calculation and the independence
of each list of opposite-factor pair products prove this, by separating
the three complementary-factor summands. The old differential image has
tensor coordinates with at most one new-factor coordinate. Every tangent
coordinate at a new diagonal term has two of that term's new coordinates.
These spaces have zero intersection with the old image. Tangent spaces
at different new diagonal terms have disjoint coordinate supports: an
ordered triple of indices cannot have two indices from each of two
distinct diagonal labels. Hence all r pure-tensor tangent spaces sum
directly. Both extended decompositions are immersive, including after
further padding. Their old five summands ensure that they remain distinct.

## Theorems proved by the preceding argument

For every r>=5, the varieties below are non-S2 and not CM, with local
non-CM witnesses T_r and hence depth defect at the homogeneous vertex:

* X_r(a,b,c) with a,b,c>=r;
* X_r(a,b,c) with a>=r-2 and b,c>=r+1, and factor permutations.

The second range ensures a>=3 and room for the witness support. In
particular X_5(5,5,5), dimension65, and X_5(3,6,6), dimension65, are
smaller-format counterexamples. These statements give neither
a least possible format nor a least possible rank. No conclusion is
drawn for ranks <=4, nor for all dimensions containing the raw 3 by 3 by 5
witness: the latter secant itself is ambient space and is smooth.
