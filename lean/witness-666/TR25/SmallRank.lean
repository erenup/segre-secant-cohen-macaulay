import TR25.SmallRankRows0_0
import TR25.SmallRankRows0_1
import TR25.SmallRankRows0_2
import TR25.SmallRankRows0_3
import TR25.SmallRankRows0_4
import TR25.SmallRankRows0_5
import TR25.SmallRankRows0_6
import TR25.SmallRankRows0_7
import TR25.SmallRankRows0_8
import TR25.SmallRankRows1_0
import TR25.SmallRankRows1_1
import TR25.SmallRankRows1_2
import TR25.SmallRankRows1_3
import TR25.SmallRankRows1_4
import TR25.SmallRankRows1_5
import TR25.SmallRankRows1_6
import TR25.SmallRankRows1_7
import TR25.SmallRankRows1_8

namespace TR25

theorem smallRightInverse0_mul :
    smallJacobian ℤ 0 * smallRightInverse0 =
      (36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ) := by
  ext p q
  rcases p with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z
  · exact smallRightInverse0Row0 q
  · exact smallRightInverse0Row1 q
  · exact smallRightInverse0Row2 q
  · exact smallRightInverse0Row3 q
  · exact smallRightInverse0Row4 q
  · exact smallRightInverse0Row5 q
  · exact smallRightInverse0Row6 q
  · exact smallRightInverse0Row7 q
  · exact smallRightInverse0Row8 q
  · exact smallRightInverse0Row9 q
  · exact smallRightInverse0Row10 q
  · exact smallRightInverse0Row11 q
  · exact smallRightInverse0Row12 q
  · exact smallRightInverse0Row13 q
  · exact smallRightInverse0Row14 q
  · exact smallRightInverse0Row15 q
  · exact smallRightInverse0Row16 q
  · exact smallRightInverse0Row17 q
  · exact smallRightInverse0Row18 q
  · exact smallRightInverse0Row19 q
  · exact smallRightInverse0Row20 q
  · exact smallRightInverse0Row21 q
  · exact smallRightInverse0Row22 q
  · exact smallRightInverse0Row23 q
  · exact smallRightInverse0Row24 q
  · exact smallRightInverse0Row25 q
  · exact smallRightInverse0Row26 q
  · exact smallRightInverse0Row27 q
  · exact smallRightInverse0Row28 q
  · exact smallRightInverse0Row29 q
  · exact smallRightInverse0Row30 q
  · exact smallRightInverse0Row31 q
  · exact smallRightInverse0Row32 q
  · exact smallRightInverse0Row33 q
  · exact smallRightInverse0Row34 q
  · exact smallRightInverse0Row35 q
  · exact smallRightInverse0Row36 q
  · exact smallRightInverse0Row37 q
  · exact smallRightInverse0Row38 q
  · exact smallRightInverse0Row39 q
  · exact smallRightInverse0Row40 q
  · exact smallRightInverse0Row41 q
  · exact smallRightInverse0Row42 q
  · exact smallRightInverse0Row43 q
  · exact smallRightInverse0Row44 q

theorem small_linearized_rank0 :
    (smallJacobian ℂ 0).rank = 45 := by
  have h := rank_eq_card_of_integer_right_inverse
    (smallJacobian ℤ 0) smallRightInverse0 36 (by decide) smallRightInverse0_mul
  simpa only [smallJacobian, jacobian_map_intCast, Fintype.card_prod,
    Fintype.card_fin] using h

theorem smallRightInverse1_mul :
    smallJacobian ℤ 1 * smallRightInverse1 =
      (36 : ℤ) • (1 : Matrix (Coord 3 3 5) (Coord 3 3 5) ℤ) := by
  ext p q
  rcases p with ⟨⟨x, y⟩, z⟩
  fin_cases x <;> fin_cases y <;> fin_cases z
  · exact smallRightInverse1Row0 q
  · exact smallRightInverse1Row1 q
  · exact smallRightInverse1Row2 q
  · exact smallRightInverse1Row3 q
  · exact smallRightInverse1Row4 q
  · exact smallRightInverse1Row5 q
  · exact smallRightInverse1Row6 q
  · exact smallRightInverse1Row7 q
  · exact smallRightInverse1Row8 q
  · exact smallRightInverse1Row9 q
  · exact smallRightInverse1Row10 q
  · exact smallRightInverse1Row11 q
  · exact smallRightInverse1Row12 q
  · exact smallRightInverse1Row13 q
  · exact smallRightInverse1Row14 q
  · exact smallRightInverse1Row15 q
  · exact smallRightInverse1Row16 q
  · exact smallRightInverse1Row17 q
  · exact smallRightInverse1Row18 q
  · exact smallRightInverse1Row19 q
  · exact smallRightInverse1Row20 q
  · exact smallRightInverse1Row21 q
  · exact smallRightInverse1Row22 q
  · exact smallRightInverse1Row23 q
  · exact smallRightInverse1Row24 q
  · exact smallRightInverse1Row25 q
  · exact smallRightInverse1Row26 q
  · exact smallRightInverse1Row27 q
  · exact smallRightInverse1Row28 q
  · exact smallRightInverse1Row29 q
  · exact smallRightInverse1Row30 q
  · exact smallRightInverse1Row31 q
  · exact smallRightInverse1Row32 q
  · exact smallRightInverse1Row33 q
  · exact smallRightInverse1Row34 q
  · exact smallRightInverse1Row35 q
  · exact smallRightInverse1Row36 q
  · exact smallRightInverse1Row37 q
  · exact smallRightInverse1Row38 q
  · exact smallRightInverse1Row39 q
  · exact smallRightInverse1Row40 q
  · exact smallRightInverse1Row41 q
  · exact smallRightInverse1Row42 q
  · exact smallRightInverse1Row43 q
  · exact smallRightInverse1Row44 q

theorem small_linearized_rank1 :
    (smallJacobian ℂ 1).rank = 45 := by
  have h := rank_eq_card_of_integer_right_inverse
    (smallJacobian ℤ 1) smallRightInverse1 36 (by decide) smallRightInverse1_mul
  simpa only [smallJacobian, jacobian_map_intCast, Fintype.card_prod,
    Fintype.card_fin] using h

theorem small_linearized_rank (d : Fin 2) :
    (smallJacobian ℂ d).rank = 45 := by
  fin_cases d
  · exact small_linearized_rank0
  · exact small_linearized_rank1

end TR25
