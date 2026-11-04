# Reach of the TR-25 mechanism

## 0. Theorem and dependencies

**Theorem.** Let `r >= 5`, and let `a,b,c` be positive integers with

```
a >= 3,  b >= 3,  a+b >= r+2,  c >= r.
```

Over the complex numbers, the reduced affine variety
`X_r(a,b,c) = closure{sum of r pure tensors in C^a ⊗ C^b ⊗ C^c}` does not satisfy
Serre's condition S2. It is not Cohen--Macaulay, and its homogeneous local ring
at the cone vertex is not Cohen--Macaulay. Its dimension is
`r(a+b+c-2)`. Factor permutations are permitted.

In particular, the construction gives a failure for rank five in format
`3 × 4 × 5`, and for every `r >= 5` in format `3 × (r-1) × r`.
More balanced pairs `a+b=r+2`, `a,b>=3`, are also allowed. These are proved
sufficient ranges, not a classification of all formats or all ranks.

The [finite-case proof](../../proofs/PROOF.md) supplies the six rank-one
core matrices, their tangent intersections, and the conductor obstruction.
Sections 1--2 of that proof are reused only after
replacing their particular smooth open subset by the one proved below.

## 1. A matrix-span criterion

Let `A,B` be vector spaces of dimensions `a,b`. Take `r` nonzero rank-one
matrices `P_i = a_i ⊗ b_i` and assume the following condition for every subset
`J ⊂ {1,...,r}` of cardinality `t >= 2`:

```
rank(a_i : i in J) + rank(b_i : i in J) >= t+2.       (G)
```

Let `L=span(P_1,...,P_r)`.

**Lemma 1.** Under (G), the matrices `P_i` are linearly independent, the only
projective rank-one points in `P(L)` are `[P_1],...,[P_r]`, and

```
L ∩ T_{P_i}(rank-one matrix cone) = C P_i             (1)
```

for every `i`. In particular the projective scheme-theoretic intersection
`P(L) ∩ Seg(PA × PB)` consists of exactly these `r` reduced points.

**Proof.** For any nonzero coefficients supported on a set `J` of size `t`,
Sylvester's matrix rank inequality gives

```
rank(sum_{i in J} lambda_i a_i b_i^t)
  >= rank(a_i:i in J) + rank(b_i:i in J) - t.
```

For `t>=2` this is at least two; for `t=1` the sum is nonzero and rank one.
Consequently the `P_i` are independent and no new rank-one direction can lie
in their span.

For tangency at `P_i`, project to `(A/Ca_i) ⊗ (B/Cb_i)`. A nontrivial linear
combination of the projected `P_j`, supported on a nonempty set `J` not
containing `i`, cannot vanish. Indeed, let `t=|J|`; the two projected factor
matrices have ranks

```
rank(a_j:j in J ∪ {i})-1,
rank(b_j:j in J ∪ {i})-1.
```

Their sum is at least `t+1` by (G) applied to `J ∪ {i}`. Sylvester gives
rank at least one for the proposed linear combination. Thus the projected
`P_j`, `j != i`, are independent. The kernel of this projection is the affine
tangent space `a_i⊗B + A⊗b_i`, proving (1).

The projective intersection has only the listed points set-theoretically.
Its Zariski tangent space at each of them is zero by (1). A zero-dimensional
local algebra over C with zero cotangent space is C: its maximal ideal equals
its square, hence is zero by Nakayama. The intersection is therefore reduced.
∎

**Lemma 2.** Assume `a,b>=3` and `a+b>=r+2`. In the space of nonzero factor
vectors `(A\{0})^r × (B\{0})^r`, the failure of (G) has codimension at least two.

**Proof.** For a fixed set `J` of size `t`, prescribe ranks at most `x,y` in
the two factor matrices. Their determinantal codimensions add, giving

```
(a-x)(t-x) + (b-y)(t-y).                              (2)
```

Here `1<=x<=min(a,t)`, `1<=y<=min(b,t)` because columns are nonzero. A bad
pair satisfies `x+y<=t+1`. Generic ranks satisfy (G):
`min(a,t)+min(b,t)>=t+2` for `2<=t<=r`, using `a,b>=3` and `a+b>=r+2`.
Thus (2) cannot be zero for a bad pair.

If (2) were one, exactly one matrix would be deficient; say its factor is
`(a-x)(t-x)=1`. Then `a=t`, `x=t-1`, and the other rank is
`y=min(b,t)`. Because `a=t>=3` and `b>=3`, their sum is at least
`(t-1)+3=t+2`, contrary to badness. The other possibility is symmetric.
So every bad rank stratum has codimension at least two. There are finitely
many subsets and rank pairs, proving the assertion. Removing zero columns,
and later removing repeated tensor summands, does not lower this bound. ∎

## 2. Smoothness from a full third flattening

Write `S=Seg(PA × PB) ⊂ P(A⊗B)` and let `H` be the reduced irreducible closure
in `Gr(r,A⊗B)` of the spans of `r` independent points of `S`.

**Lemma 3.** Suppose `L` is an `r`-dimensional subspace such that `P(L)∩S`
consists of exactly `r` reduced points spanning `L`. Assume there exists a
nonempty open family of such configurations; for the dimensions in our theorem
this is guaranteed by Lemmas 1--2. Then `H` is smooth at `L`.

**Proof.** Consider the projective incidence

```
Z = {(K,p) in H × S : p in P(K)} -> H.
```

Its fiber over `L` has length `r`. Upper semicontinuity of fiber dimension
and properness let us shrink `H` about `L` so that `Z -> H` is finite.
Generically it has degree `r`: a general spanning configuration satisfies
Lemma 1, so its span has exactly `r` reduced rank-one points.

For clarity, the elementary algebra giving flatness at `L` is included.
Let `R=O_{H,L}`, an integral local ring, and `F` the finite R-algebra of the
incidence over this local base. Because `F/m_R F` has dimension `r`, lift a
basis and use Nakayama to obtain a surjection `R^r -> F`. At the fraction field
both sides have dimension `r`, so the kernel has rank zero. As a submodule of
the free module `R^r` over a domain, that kernel is zero. Thus `F` is free of
rank `r`. After shrinking, the incidence is finite flat of degree `r`.
Its fiber at `L` is reduced over characteristic zero, hence it is etale above
`L`, and after one further shrink it is finite etale throughout.

Pass to the finite etale cover ordering the `r` incidence points. Their
spanning property is open. On this cover they give an ordered tuple of
distinct independent points of `S`; conversely taking the span of such a
tuple in the chosen neighborhood recovers `K`. These two morphisms are
inverse. Consequently the ordered cover is an open subset of the smooth
configuration space of ordered independent distinct points of `S`.
Smoothness descends under a surjective etale morphism, so `H` is smooth at L.
∎

**Lemma 4.** If a tensor `T in A⊗B⊗C` has third flattening rank `r` and its
image `L⊂A⊗B` satisfies Lemma 3, then `X_r(a,b,c)` is smooth at `T`.

**Proof.** The rank-exactly-`r` locus of linear maps `C* -> A⊗B` is the open
surjective-map bundle over `Gr(r,A⊗B)` whose fiber over `L` is the space of
surjections `C* -> L`. On this rank stratum, `X_r` is exactly the restriction
of that bundle to `H`, with reduced structures. For sums of `r` tensors of
flattening rank `r`, this follows directly: the matrix factors are independent
and span the flattening image. Taking reduced closures gives one containment.
For the other, trivialize the tautological bundle on a Grassmann chart and
approximate a point of `H` by spans of independent rank-one points; every
surjection over the limiting image is then the limit of such surjections.
Each approximating tensor is a sum of `r` pure tensors. Hence the containment
holds as well.

All tensors in `X_r` have third flattening rank at most `r`, so rank exactly
`r` is open in `X_r`. The described restriction is smooth at `T` because `H`
is smooth at `L` and the bundle fiber is smooth. ∎

## 3. Birational decomposition map and codimension-two complement

Let `P` be the smooth nonzero pure-tensor cone in `A⊗B⊗C`, of dimension
`a+b+c-2`. In `P^r`, retain only tuples whose C-factor vectors are linearly
independent, and take the free symmetric-group quotient `Y`. Third-factor
independence already implies that the summands are distinct. This nonempty
open subset of the unordered decomposition space is smooth, irreducible,
and has dimension `D=r(a+b+c-2)`. Its addition morphism `f:Y -> X_r` remains
dominant: it is the restriction of the dominant addition morphism to a dense
open subset of its irreducible source.

Let `Y_good` consist of those decompositions for which the A/B factor vectors
satisfy (G). Third-factor independence is now built into Y. Lemma 2 shows

```
codim_Y(Y \ Y_good) >= 2.                              (3)
```

This count may be made upstairs in nonzero factor-vector coordinates. The
map to ordered pure tensors is a smooth torus torsor, so it preserves
codimensions, as does the free finite symmetric-group quotient.

By Lemma 4 every point of `f(Y_good)` is smooth in `X_r`. The decomposition is
unique there: its flattening image has exactly the `r` rank-one directions
given by the matrices `P_i`, and the flattening map determines each third
vector relative to this basis. The span map to `H` is locally an isomorphism
up to ordering as proved in Lemma 3, so
`dim H=r(a+b-2)`. The flattening bundle therefore gives

```
dim X_r = r(a+b-2)+rc = D.
```

Thus `f` is generically one-to-one and, in characteristic zero, birational.
The source dimensions and the smooth-image argument do not invoke an
unproved generic identifiability theorem.

## 4. Immersive ambiguous witnesses in all ranks r>=5

We first recall the core. Let

```
M = [[1,1,1],[1,2,3],[1,4,9]].
Q_i = e_i (row_i M),                 i=1,2,3;
Q_{3+j} = -(column_j M)e_j^t,        j=1,2,3.
```

These six pairwise nonproportional matrices sum to zero. Any five are
independent. In their five-dimensional span `L_0⊂C³⊗C³`, every one of the six
satisfies

```
L_0 ∩ T_{Q_i}(rank-one matrix cone) = C Q_i.            (4)
```

The six nonzero rational determinants proving (4) are given in Section 3
of the baseline proof. Let

```
T_5 = sum_{i=1}^5 Q_i⊗f_i
    = sum_{i=1}^4 Q_i⊗(f_i-f_5) - Q_6⊗f_5.            (5)
```

Both decompositions have independent matrix factors and independent third
vectors. Their five tangent spaces sum directly, as in baseline Section 4.

Here is an exact flexible extension. Choose any `p,q>=3` with `p+q=r+1`.
Write

```
A'=A_0 ⊕ E,   dim A_0=3, dim E=p-3;
B'=B_0 ⊕ F,   dim B_0=3, dim F=q-3.
```

For integers `t>=4`, put `v(t)=(1,t,t²)^t` in either three-dimensional core
factor. We need the two exact avoidance statements

```
L_0 ∩ (Cv(t)⊗B_0) = 0,
L_0 ∩ (A_0⊗Cv(t)) = 0.                               (6)
```

For the first, any `N in L_0` is `N_ij=j^(i-1)(x_i-y_j)`. If
`N=v(t)b^t`, the first two rows give, with `d=x_1-x_2`,

```
b_j = j d/(j-t),       j=1,2,3.
```

The third row then gives `(j+t)d=j e`, where `e=x_1-x_3`. Comparing `j=1,2`
and using `t!=0` gives `d=e=0`, hence all `b_j=0`.

For the second, write `N=a v(t)^t`. For each row index `i`, the vector
`y=(y_1,y_2,y_3)` belongs to the span of `1=(1,1,1)` and
`v(t)/(row_i M)`, componentwise. Direct expansion gives

```
det[ 1, v(t), v(t)/(1,2,3) ] = -t(t-1)(t-3)/6 != 0.    (7)
```

Thus the first two planes meet only along `C1`; the corresponding two entries
of `a` vanish. The vector `v(t)/(1,4,9)` is not constant for any integer
`t>=4` (constancy would require both `t=4` and `t²=9`), so its coefficient
also vanishes. This proves (6).

The vectors `v(t)` are pairwise nonproportional. They are not proportional to
any of the six core A-factor vectors, or to any of the six core B-factor
vectors: the coordinate basis directions are excluded by their nonzero
coordinates; the remaining possibilities are the three rows or columns of M,
which are excluded by direct comparison for `t>=4`.

Choose bases `u_1,...,u_{p-3}` of `E` and `w_1,...,w_{q-3}` of `F`, and distinct
integers at least four for the added vectors within each of the following
two lists. Define `r-5=(p-3)+(q-3)` additional rank-one matrices

```
R_s = u_s ⊗ v(t_s)       (s=1,...,p-3),
S_t = v(h_t) ⊗ w_t       (t=1,...,q-3).
```

Their supports lie in distinct added rows or columns. Therefore they are
independent of each other and of `L_0`. Put

```
L = L_0 ⊕ span(R_s) ⊕ span(S_t),    dim L=r.
```

For every core matrix `Q_i` and every added matrix, the tangent intersection
with L is precisely its scalar line. Here are the full block comparisons.

* At a core `Q_i=a_i⊗b_i`, an added A-row in a tangent matrix is a multiple
  of `b_i`, whereas in L it is a multiple of its chosen `v(t_s)`; these are
  not proportional. Thus all added A-row coefficients vanish. The analogous
  added B-column argument kills all S-coefficients. The remaining assertion
  is (4).
* At `R_s=u_s⊗v(t_s)`, all other added A-rows in a tangent matrix are multiples
  of `v(t_s)`; the distinctness of the `v(t)` kills the other R-coefficients.
  An added B-column in a tangent matrix is a multiple of `u_s`, whereas its
  possible L-component has its A-vector inside `A_0`; thus all S-coefficients
  vanish. In the core block the intersection is zero by the second assertion
  in (6). Only the scalar line `C R_s` remains.
* The argument at an S-matrix is the same with A and B exchanged, using the
  first assertion in (6).

Use each added matrix with its own new third basis vector, beyond `f_1,...,f_5`.
Adding these identical summands to both sides of (5) gives two distinct
unordered r-term decompositions of a tensor `T_r in A'⊗B'⊗C^r`.
Their third vectors form bases, and their matrix factors form bases of L.

For completeness, the tangent criterion converts these statements into
immersion as follows. Make the third vectors the standard basis. If

```
sum_i (delta P_i⊗f_i + P_i⊗delta c_i)=0,
delta c_i=sum_j h_{ji} f_j,
```

then the coefficient of `f_j` says
`delta P_j = -sum_i h_{ji}P_i`. Tangent intersection gives
`delta P_j=lambda_j P_j`, and independence gives
`h_{ji}=0` for `i!=j`, `h_{jj}=-lambda_j`. Every individual pure-tensor tangent
vector is zero. The addition differential is therefore injective at both
decompositions. The third flattening has rank `r`, so ordinary rank and border
rank of `T_r` are exactly `r`.

To embed this seed into any format in the theorem, choose integers `p,q>=3`
with `p<=a`, `q<=b`, and `p+q=r+1`. Such a choice exists because `r>=5` and
`a+b>=r+2`: equivalently choose `p` between `max(3,r+1-b)` and
`min(a,r-2)`, an interval which is nonempty under these inequalities.
Every seed and padded decomposition belongs to the restricted source Y,
since its third vectors are independent. Padding the three factors preserves
immersion. In the additional A-directions,
the derivative image has independent pair products `b_i⊗c_i`; these are
independent because the `c_i` are a basis and `b_i!=0`. Likewise for additional
B-directions. For additional C-directions the matrix factors `P_i` are
independent. These new derivative blocks have mutually distinct complement
supports and are disjoint from the old image. They contribute respectively
`r(a-p)`, `r(b-q)`, and `r(c-r)` dimensions, giving total tangent rank D at
each decomposition.

## 5. Applying the conductor obstruction

This is the baseline proof's Lemma 2 with only its source good locus changed.
It is restated to make the logical scope explicit.

Let `nu:Xbar -> X_r` be the finite normalization. Because the smooth source Y
is normal and f is dominant birational, f lifts to a birational map
`g:Y -> Xbar`. At the two immersive decompositions above `T_r`, g is
quasi-finite. Its quasi-finite locus is open, and the quasi-finite birational
form of Zariski's Main Theorem identifies that locus with an open subset of
the normal variety Xbar. Hence the two decompositions give distinct
normalization points above `T_r`.

If the local domain `O_{X_r,T_r}` satisfied S2, its conductor in the finite
normalization would have a height-one prime through each of these points.
This is exactly the conductor lemma proved in baseline Section 1: the
conductor is an S2 module over the normalization, so a minimal prime of its
support must have height one; the multiple normalization points ensure its
support is nonempty at each such point.

On the identified normalization chart, the conductor is trivial at every
point of `Y_good`, since f maps that locus into the smooth locus of X_r.
Its support is therefore contained in `Y\Y_good`, whose codimension is at
least two by (3). It cannot contain the required divisor. Thus
`O_{X_r,T_r}` does not satisfy S2. In particular X_r is not S2 and is not
Cohen--Macaulay. The same graded-resolution argument as baseline Section 5
shows that the homogeneous local ring at the vertex is not Cohen--Macaulay.

## 6. Exact limits and rank-five core minimality

The theorem does not establish failure for rank five in `3×4×4` or `4×4×4`.
It does establish failure in `3×4×5` and `4×4×5`. The argument requires a
full-rank third flattening at both witnesses, hence `c>=r`. We restrict the
source to that open locus from the start; no assertion is needed about its
rank-deficient boundary. A coordinate embedding alone does not carry
non-Cohen--Macaulayness to arbitrary larger secant
varieties. What does carry here is the explicit pair of immersive
decompositions, coupled with the separately proved smooth good locus.
Likewise increasing the rank bound without the explicit added summands
would not justify any conclusion.

The matrix-span ambiguity mechanism with one full flattening cannot start
below rank five. More precisely, suppose `r<=4`, `P_1,...,P_r` are independent
rank-one matrices, and their span contains a rank-one point Q distinct from
their directions. Choose a minimal expression for Q using `k>=2` of the
P_i. Those k points and Q form a rank-one circuit of size `s=k+1<=5`; its span
has dimension `s-1`. If the first/second support dimensions are `alpha,beta`,
the circuit relation and Sylvester imply `alpha+beta<=s`.

If one support dimension is one, the circuit span lies in the tangent space
of every circuit point and has dimension at least two. If both are at least
two, the only possible support pairs, up to exchange, are `(2,2)` for `s=4`
and `(2,2)` or `(2,3)` for `s=5`. At every circuit point the affine tangent
space in its support has dimension `alpha+beta-1`. Therefore its intersection
with the `(s-1)`-dimensional circuit span has dimension at least

```
(s-1)+(alpha+beta-1)-alpha*beta >= 2.
```

Thus at least one of the original P_i violates the scalar-only tangent
criterion. If the tensor's third flattening has rank r, every r-term
decomposition has third vectors and matrix factors forming bases. Distinct
decompositions would yield such an extra Q, while immersion requires the
scalar-only tangent criterion. Hence no two immersive decompositions of
this full-flattening type exist for `r<=4`.

This is a minimality result for this mechanism only. It does not prove that
all smaller-rank secant varieties are Cohen--Macaulay, and it does not exclude
other non-S2 constructions with no full flattening.

## 7. Standard dependencies

Standard facts used: determinantal codimension; Sylvester rank inequality;
projectivity of the incidence of points in linear spaces; upper
semicontinuity of fiber dimension; proper quasi-finite morphisms are finite;
Nakayama's lemma; finite flat with reduced geometric fiber is etale near that
fiber; smoothness descends etale locally; free finite-group quotients in
characteristic zero; finite normalization and its universal property;
Zariski's Main Theorem; the baseline conductor lemma; and the graded
Auslander--Buchsbaum argument for the cone vertex.

No floating-point statement is used. Formula (7) and the avoidance identities
can be checked by direct rational expansion. The core six determinant values
come from the finite-case proof. The generalized witness is
given by integer vectors for every r and requires no search or numerical
recognition.
