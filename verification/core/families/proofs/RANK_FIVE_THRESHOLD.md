# Rank five is the first possible rank for this three-factor mechanism

THEOREM. Over C, for 1<=r<=4, a three-factor tensor cannot have two
distinct immersive unordered decompositions into r nonzero pure summands.
This is a statement about the decomposition-branch mechanism, not a
theorem that all fourth secants are Cohen--Macaulay.

Proof. Write one immersive decomposition as sum a_i tensor b_i tensor c_i.
The three lists of opposite-factor pair products are linearly independent.
For example, a relation sum lambda_i(b_i tensor c_i)=0 gives the nonzero
kernel vector with i-th pure-cone tangent lambda_i z tensor b_i tensor c_i,
for any nonzero z in the first factor. A nonzero lambda_i makes that
component nonzero. This contradicts immersion. The same argument applies
in the other two factors.

Consequently the factor-column ranks equal the three flattening ranks of
T. Indeed, the first flattening is A times the transpose of the full-column-
rank opposite-pair matrix, so its rank equals rank A. Set these ranks to
a,b,c and restrict to their support spaces; the summands still lie in
these spaces. Any tangent kernel in the restricted source is also one
in the original ambient source.

If a,b,c<=r-1 and 2<=r<=4, the restricted source has dimension
r(a+b+c-2)>abc, so immersion is impossible. To verify the inequality for
all these dimensions, abc/(a+b+c-2) is nondecreasing in each positive
integer variable, and its maximum is (r-1)^3/(3r-5). This is respectively
1, 2, and 27/7 for r=2,3,4, always less than r. (The denominator is
positive; its derivative in a is bc(b+c-2)/(a+b+c-2)^2.) The case r=1
has a unique decomposition. Hence at least one factor has rank r.

Permute it to C, so that c_1,...,c_r are independent. The image of the
C-flattening is L=span(P_1,...,P_r), where P_i=a_i tensor b_i are independent.
Immersion implies

    L intersect T_(P_i)(rank-one matrix cone) = C P_i.           (*)

For otherwise take a tangent delta P_i in the intersection outside CP_i,
write it as sum h_j P_j, and cancel delta P_i tensor c_i using the
tangent variations -h_j P_j tensor c_i at the j-th summands. These
produce a nonzero source tangent kernel. The i-th component remains
nonzero after subtracting its proportional part.

Any other r-term decomposition has independent C-factors and independent
matrix factors P'_j spanning L, since the C-flattening rank is r. If all
P'_j directions equal the original P_i directions, comparison in the
basis P_i fixes the pure summands, giving the same unordered decomposition.
Thus a distinct decomposition gives a rank-one direction Q in L different
from every P_i.

Choose a minimal expression of Q as a linear combination of s of the P_i.
Then Q and those P_i form a circuit of m=s+1 points, with 3<=m<=r+1<=5:
all coefficients in their unique dependence are nonzero and their span
L_0 has dimension m-1. Let U,V be the spans of their first and second
factors, with dimensions u,v. The dependence is U_matrix D V_matrix^t=0
with D invertible diagonal. Therefore u+v<=m, since the rank-v image of
D V_matrix^t lies in the (m-u)-dimensional kernel of U_matrix.

If u=1 or v=1, every element of L_0 has rank at most one, so L_0 is
contained in the rank-one-cone tangent at each circuit point. Its
dimension m-1>=2 contradicts (*).

Otherwise u,v>=2 and u+v<=5. Up to order, the only possibilities are
(2,2) and (2,3). In U tensor V the rank-one-cone tangent at any circuit
point has dimension u+v-1. The linear intersection estimate gives

    dim(L_0 intersect T_P) >= (m-1)+(u+v-1)-uv.

For (u,v)=(2,2), m>=4 and the bound is m-2>=2. For (2,3), m>=5 and
the bound is m-3>=2. At any original P_i in the circuit this again
contradicts (*). Thus Q cannot exist, proving the theorem.

The rank-five witness has two immersive decompositions. Together
these statements give an exact dividing line r=5 for the existence of
this mechanism in THREE factors, allowing arbitrary finite ambient
dimensions. This is not a dividing line for aCM, for all tensor orders,
or for arbitrary kinds of nonnormality or conductor obstruction.
