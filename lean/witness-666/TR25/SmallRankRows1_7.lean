import TR25.SmallRankData

namespace TR25

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
theorem smallRightInverse1Row35 (q : Coord 3 3 5) :
    (smallJacobian ℤ 1 * smallRightInverse1) ((2, 1), 0) q =
      ((36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ))
        ((2, 1), 0) q := by
  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,
    Fin.sum_univ_succ]
  norm_num [smallJacobian, jacobian, small]
  rcases q with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z <;> decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
theorem smallRightInverse1Row36 (q : Coord 3 3 5) :
    (smallJacobian ℤ 1 * smallRightInverse1) ((2, 1), 1) q =
      ((36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ))
        ((2, 1), 1) q := by
  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,
    Fin.sum_univ_succ]
  norm_num [smallJacobian, jacobian, small]
  rcases q with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z <;> decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
theorem smallRightInverse1Row37 (q : Coord 3 3 5) :
    (smallJacobian ℤ 1 * smallRightInverse1) ((2, 1), 2) q =
      ((36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ))
        ((2, 1), 2) q := by
  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,
    Fin.sum_univ_succ]
  norm_num [smallJacobian, jacobian, small]
  rcases q with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z <;> decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
theorem smallRightInverse1Row38 (q : Coord 3 3 5) :
    (smallJacobian ℤ 1 * smallRightInverse1) ((2, 1), 3) q =
      ((36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ))
        ((2, 1), 3) q := by
  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,
    Fin.sum_univ_succ]
  norm_num [smallJacobian, jacobian, small]
  rcases q with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z <;> decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
theorem smallRightInverse1Row39 (q : Coord 3 3 5) :
    (smallJacobian ℤ 1 * smallRightInverse1) ((2, 1), 4) q =
      ((36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ))
        ((2, 1), 4) q := by
  simp only [Matrix.mul_apply, Fintype.sum_prod_type, Fintype.sum_sum_type,
    Fin.sum_univ_succ]
  norm_num [smallJacobian, jacobian, small]
  rcases q with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z <;> decide

end TR25
