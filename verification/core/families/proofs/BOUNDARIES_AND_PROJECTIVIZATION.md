# Projective consequence and a positive adjacent family

All statements in this note concern reduced complex varieties.

## 1. The projective variety is locally non-CM

Let X be any cone occurring in the negative theorems, and let T be its
nonzero witness. Choose a degree-one coordinate ell with ell(T)!=0. Then

    X intersect D(ell) = D_+(ell) in Proj(C[X]) times G_m,

by sending a tensor to its rescaling with ell=1 and its ell-value. This
is an isomorphism of varieties. A local ring on this product at a closed
point is Cohen--Macaulay if and only if the corresponding local ring of
D_+(ell) is: polynomial extension and localization preserve CM, and
quotient by the regular parameter t-ell(T) descends it. Thus non-CM of
O_(X,T) proves non-CM of the projective secant at [T]. In particular the
negative result is stronger than failure of arithmetic CM only at the
vertex. No exact numerical depth at T is claimed.

## 2. Every X_5(3,3,c) is CM

The core witness has addition differential rank45 in format
3 by 3 by 5, the dimension of the entire ambient tensor space. Hence
X_5(3,3,5) is the entire space: its dimension is at least45 and it is
closed in an irreducible45-dimensional affine space. Projection to a
third factor of dimension c<=5 shows X_5(3,3,c) is the entire space too.

For c>=5, flatten in the third factor. X_5(3,3,c) is contained in the
determinantal variety D of 9 by c matrices of rank at most5. This D is
irreducible, of dimension5(9+c-5)=5(c+4). Pad the same witness to the
larger third factor. Its five matrix factors are independent, so each
new third-factor coordinate adds five independent tangent directions;
the differential rank is45+5(c-5)=5(c+4). Consequently X_5(3,3,c) has
the same dimension as D. Containment and irreducibility imply equality
as reduced varieties. The classical generic determinantal coordinate
ring is normal and Cohen--Macaulay. This includes c=5, where D is the
entire space.

Thus the minimal raw witness format3 by3 by5 is itself CM, and no
counterexample follows from merely displaying its two decompositions.
The new theorem proves failure after increasing the second factor to4,
for every c>=5. This is a sharp change between second dimensions3 and4
at fixed first dimension3, rank bound5, and third dimension c>=5.
It does not establish global format minimality or classify c<5.

## 3. Unit-tensor orbit closures

For every r>=5, the new range a,b>=3, a+b>=r+2, c>=r includes a=b=c=r.
The dense source open whose three factor matrices are invertible maps
onto (GL_r)^3 times Delta_r, where Delta_r=sum e_i tensor e_i tensor e_i.
Therefore X_r(r,r,r) is exactly the closure of that unit-tensor orbit.
It is non-S2, with vertex depth less than3r^2-2r. This strengthens
nonnormality to non-S2 for these particular orbit closures; it says
nothing about Cohen--Macaulayness of their normalizations.

## 4. Exact boundaries of the assertions

The negative family is sufficient, not necessary. Rank5 is the least
rank for two immersive ambiguous decompositions in THREE factors, by
RANK_FIVE_THRESHOLD.md. No claim says it is the least rank for failure
of aCM by every possible mechanism. No arbitrary tensor-order extension
or result about rank4 secants is asserted. The smaller examples3 by4 by4
and4 by4 by4 are not decided by these results.
