# All-r three-dimensional-factor boundary theorem

## Exact statement

Fix r>=6, a>=r-1, c>=r. Let B=B0=C^3, A contain A0=C^3 and independent added directions u_1,...,u_(r-5), and let Q_1,...,Q_6, L0, v(t) be the earlier TR-25 core data. Define

    R_j=u_j tensor v(j+3),       1<=j<=r-5,
    L_r=L0 direct-sum span(R_1,...,R_(r-5)),
    T_r=sum_(i=1)^5 Q_i tensor f_i + sum_j R_j tensor f_(5+j).

The finite normalization of X_r(a,3,c) has exactly r+1 points over T_r. All are smooth, and there is an open neighborhood of T_r whose entire normalization is smooth and whose normalization morphism is unramified. The fiber is consequently reduced. Six points come from actual r-term decompositions; each of the other r-5 points corresponds to the dependent r-subset consisting of all six core points and all added points except one R_j. Permuting factors preserves the claim.

The hypothesis B=B0 is essential to THIS proof. Arbitrary enlargement of the second matrix factor is not established by it. The third-factor dimension c may be enlarged freely, and a may be enlarged freely subject to a>=r-1.

## Inputs from the earlier normalization theorem

1. P(L_r) meets Seg(PA x PB) in exactly the r+1 listed reduced points.
2. Its only relation is the six-core relation. Exactly six r-subsets are independent; the other r-5 subsets have span dimension r-1.
3. For a>=r-1 and b=3, a+b>=r+2, the unordered generic span map is birational. This is the earlier rank-sum criterion, not a new identifiability assertion.
4. Full third-flattening-rank tensors are the surjective-map bundle over the corresponding span variety H. Normalization of this bundle is its pullback from the normalization of H.

## 1. Local residual coordinates for the rank-deficiency ideal

Let S=Seg(PA x PB), W=A tensor B, and let x=(p_1,...,p_r) be any ordered dependent r-subset above L_r. Relabel so p_1,...,p_(r-1) are independent; they span K of dimension r-1. Work in projective coordinate charts selecting regular nonzero affine representatives P_i near x. Shrink so a fixed (r-1)x(r-1) coordinate minor of the first r-1 columns is invertible. Their span is a subbundle K(y) of the constant W-bundle, and W/K(y) is trivial of rank

    h=dim W-(r-1)=3a-r+1.

Let q(y) be the image of P_r(y) in that quotient trivialization. Its h coordinate functions generate the ideal of ALL r x r minors of the r-column matrix, up to a unit: elementary row operations reduce the first r-1 columns to an identity block, and the residual final column is q. Thus this is an equality of ideals, not an equality only of zero sets. The rank-deficiency subscheme is D={q=0}.

Write the unique relation at x as sum_i lambda_i P_i=0. Its coefficients are nonzero at the six core entries and zero at retained added entries. Differentiating the residual column gives, up to a nonzero scalar and quotient coordinates,

    dq_x(delta P_1,...,delta P_r)
      = sum_(i core) lambda_i delta P_i  modulo K.

Projective representative choices change this only by elements of K.

## 2. The residual derivative is surjective

For the first three row-core points Q_i=e_i tensor r_i, the r_i are the three rows of the invertible matrix M, hence a basis of B. The affine rank-one tangent space at Q_i contains A tensor r_i. Consequently

    sum_(i=1)^3 T_(Q_i)(rank-one cone) contains A tensor B=W.

Since each corresponding relation coefficient lambda_i is nonzero, the image of the displayed differential is W/K. Passing from affine-cone tangents to projective tangents discards only the scalar Qi directions already in K. Hence dq_x is surjective.

The Jacobian criterion now shows that q is a smooth morphism to A^h near x, and D is smooth of codimension h with its exact maximal-minor scheme structure. Equivalently, after an etale coordinate change, the h functions q_1,...,q_h are h members of a regular coordinate system. This is the point where b=3 removes the singular-center obstruction possible in larger second-factor dimension.

## 3. The local span graph is a smooth blowup

On q!=0 the r-span equals K(y) plus the nonzero residual line [q(y)]. Via the Plucker embedding, its rational coordinates are the r x r minors. The closure of the graph of a rational map defined by generators of an ideal I is Proj(Rees(I)); here I=(q_1,...,q_h). Thus the local span graph is Bl_D(S^r).

For completeness, no smooth-blowup theorem beyond coordinates is needed. In the chart corresponding to q_j, the graph has equations q_i=q_j*z_i for i!=j. Since q is part of an etale coordinate system, one may eliminate all q_i with i!=j; the remaining coordinates q_j,z_i and the complementary smooth coordinates are free. Every chart is smooth.

Over the fixed configuration x, the exceptional fiber is P(W/K). Its map to the Grassmannian sends the line [w] to the r-space K+Cw. This is the standard scheme isomorphism between P(W/K) and the space of r-dimensional subspaces containing K. In particular, the fixed target L_r determines exactly ONE point of this exceptional fiber, and that point is smooth. This is not merely a count of arcs: every possible graph point over x is included by the blowup identification.

## 4. Exhaustion of the normalization fiber

Use the proper span-graph closure in Hilb^r(S) x Gr(r,W). Every graph point above L_r has a length-r scheme Z contained scheme-theoretically in P(L_r) intersect S. That intersection is reduced and consists of r+1 points, so Z is one of its r+1 r-element subsets. Nonreduced collisions are impossible. At each independent subset the span graph is the usual smooth configuration chart and gives one point. At each dependent subset Section 3 gives precisely one point, also smooth. Thus the proper graph fiber has exactly r+1 points.

The smoothness argument may be made on the ordered configuration etale cover. All points are distinct, so the permutation action is free and its quotient is smooth. No stabilizer quotient singularity occurs.

Properness and upper semicontinuity permit shrinking H around L_r until the graph is finite over H. Remove the proper image of its closed nonsmooth locus; that image avoids L_r. The resulting source is smooth and integral. Generic birationality of the unordered span map then identifies this finite smooth source with the ENTIRE normalization of that neighborhood. Its fiber has exactly the asserted r+1 points.

One can alternatively construct the graph inside the finite configuration incidence used in the earlier normalization theorem. The point incidence near L_r is finite and unramified because its fiber is finite reduced. Its r-fold ordered distinct-point incidence is finite unramified, since diagonals of an unramified separated map are open and closed. The graph is a closed subscheme of this incidence on the distinct-point locus. A closed immersion is unramified, so the finite graph map to H is unramified. This gives reducedness of the normalization fiber, and after shrinking gives the stated unramified normalization neighborhood.

## 5. Tensor conclusion and exact limits

Pull the finite smooth normalization neighborhood back along the bundle of surjections C*->K. The pullback remains smooth and its map is finite birational, so it is the normalization of the tensor neighborhood. Unramifiedness is stable under base change. This proves the exact statement.

This determines local normalization geometry for the indicated infinite family. It proves neither global normality/CM/rational singularities of the normalization nor the case with both matrix factors enlarged beyond this three-dimensional-factor family. It is stronger than a lower bound or an actual-decomposition count because Section 4 exhausts every proper graph boundary point, and Section 3 proves its local source regularity.

## Standard references

- The Stacks Project, Tag 01OF, definition of blowing up as relative Proj of the Rees algebra, with affine blowup charts. The graph identification can also be checked directly from the Rees presentation and the Plucker minors.
- The Stacks Project, Tag 02LS: proper finite-fiber maps are finite.
- The Stacks Project, Tag 035E: normalization and its universal property. Finite birational normal sources equal the normalization by integral closure.
- Hilb^r(S) is projective for projective S; containment in a varying projective linear subspace is a closed condition. Only the open distinct-point locus is used for local regularity.

The important risks have been discharged explicitly: exact minors ideal (not just its radical), projective-versus-affine tangent scalings, zero coefficients on retained added points, quotient freeness, proper exhaustiveness, and ambient generic birationality. The restriction B=B0 is a mathematical hypothesis, not an implementation convenience.
