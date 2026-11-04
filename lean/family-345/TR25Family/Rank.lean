import TR25Family.RankRows0_00
import TR25Family.RankRows0_10
import TR25Family.RankRows0_20
import TR25Family.RankRows0_30
import TR25Family.RankRows0_40
import TR25Family.RankRows1_00
import TR25Family.RankRows1_10
import TR25Family.RankRows1_20
import TR25Family.RankRows1_30
import TR25Family.RankRows1_40
import TR25Family.RankGeneral
import TR25Family.RankKernel

namespace TR25Family

theorem familyRightInverse0 :
    familySelected0 ℤ * familyInverse0 = (36 : ℤ) • (1 : Matrix (Fin 50) (Fin 50) ℤ) := by
  ext i j
  fin_cases i
  · exact familyRightInverse0Row00 j
  · exact familyRightInverse0Row01 j
  · exact familyRightInverse0Row02 j
  · exact familyRightInverse0Row03 j
  · exact familyRightInverse0Row04 j
  · exact familyRightInverse0Row05 j
  · exact familyRightInverse0Row06 j
  · exact familyRightInverse0Row07 j
  · exact familyRightInverse0Row08 j
  · exact familyRightInverse0Row09 j
  · exact familyRightInverse0Row10 j
  · exact familyRightInverse0Row11 j
  · exact familyRightInverse0Row12 j
  · exact familyRightInverse0Row13 j
  · exact familyRightInverse0Row14 j
  · exact familyRightInverse0Row15 j
  · exact familyRightInverse0Row16 j
  · exact familyRightInverse0Row17 j
  · exact familyRightInverse0Row18 j
  · exact familyRightInverse0Row19 j
  · exact familyRightInverse0Row20 j
  · exact familyRightInverse0Row21 j
  · exact familyRightInverse0Row22 j
  · exact familyRightInverse0Row23 j
  · exact familyRightInverse0Row24 j
  · exact familyRightInverse0Row25 j
  · exact familyRightInverse0Row26 j
  · exact familyRightInverse0Row27 j
  · exact familyRightInverse0Row28 j
  · exact familyRightInverse0Row29 j
  · exact familyRightInverse0Row30 j
  · exact familyRightInverse0Row31 j
  · exact familyRightInverse0Row32 j
  · exact familyRightInverse0Row33 j
  · exact familyRightInverse0Row34 j
  · exact familyRightInverse0Row35 j
  · exact familyRightInverse0Row36 j
  · exact familyRightInverse0Row37 j
  · exact familyRightInverse0Row38 j
  · exact familyRightInverse0Row39 j
  · exact familyRightInverse0Row40 j
  · exact familyRightInverse0Row41 j
  · exact familyRightInverse0Row42 j
  · exact familyRightInverse0Row43 j
  · exact familyRightInverse0Row44 j
  · exact familyRightInverse0Row45 j
  · exact familyRightInverse0Row46 j
  · exact familyRightInverse0Row47 j
  · exact familyRightInverse0Row48 j
  · exact familyRightInverse0Row49 j

theorem familySelected0_map :
    (familySelected0 ℤ).map (Int.castRingHom ℂ) = familySelected0 ℂ := by
  unfold familySelected0 familyJacobian
  rw [← Matrix.submatrix_map, jacobian_map_intCast]

theorem familySelected0_rank : (familySelected0 ℂ).rank = 50 := by
  have h := rank_eq_card_of_integer_right_inverse (familySelected0 ℤ)
    familyInverse0 36 (by decide) familyRightInverse0
  rw [familySelected0_map] at h
  simpa using h

theorem familyRightInverse1 :
    familySelected1 ℤ * familyInverse1 = (36 : ℤ) • (1 : Matrix (Fin 50) (Fin 50) ℤ) := by
  ext i j
  fin_cases i
  · exact familyRightInverse1Row00 j
  · exact familyRightInverse1Row01 j
  · exact familyRightInverse1Row02 j
  · exact familyRightInverse1Row03 j
  · exact familyRightInverse1Row04 j
  · exact familyRightInverse1Row05 j
  · exact familyRightInverse1Row06 j
  · exact familyRightInverse1Row07 j
  · exact familyRightInverse1Row08 j
  · exact familyRightInverse1Row09 j
  · exact familyRightInverse1Row10 j
  · exact familyRightInverse1Row11 j
  · exact familyRightInverse1Row12 j
  · exact familyRightInverse1Row13 j
  · exact familyRightInverse1Row14 j
  · exact familyRightInverse1Row15 j
  · exact familyRightInverse1Row16 j
  · exact familyRightInverse1Row17 j
  · exact familyRightInverse1Row18 j
  · exact familyRightInverse1Row19 j
  · exact familyRightInverse1Row20 j
  · exact familyRightInverse1Row21 j
  · exact familyRightInverse1Row22 j
  · exact familyRightInverse1Row23 j
  · exact familyRightInverse1Row24 j
  · exact familyRightInverse1Row25 j
  · exact familyRightInverse1Row26 j
  · exact familyRightInverse1Row27 j
  · exact familyRightInverse1Row28 j
  · exact familyRightInverse1Row29 j
  · exact familyRightInverse1Row30 j
  · exact familyRightInverse1Row31 j
  · exact familyRightInverse1Row32 j
  · exact familyRightInverse1Row33 j
  · exact familyRightInverse1Row34 j
  · exact familyRightInverse1Row35 j
  · exact familyRightInverse1Row36 j
  · exact familyRightInverse1Row37 j
  · exact familyRightInverse1Row38 j
  · exact familyRightInverse1Row39 j
  · exact familyRightInverse1Row40 j
  · exact familyRightInverse1Row41 j
  · exact familyRightInverse1Row42 j
  · exact familyRightInverse1Row43 j
  · exact familyRightInverse1Row44 j
  · exact familyRightInverse1Row45 j
  · exact familyRightInverse1Row46 j
  · exact familyRightInverse1Row47 j
  · exact familyRightInverse1Row48 j
  · exact familyRightInverse1Row49 j

theorem familySelected1_map :
    (familySelected1 ℤ).map (Int.castRingHom ℂ) = familySelected1 ℂ := by
  unfold familySelected1 familyJacobian
  rw [← Matrix.submatrix_map, jacobian_map_intCast]

theorem familySelected1_rank : (familySelected1 ℂ).rank = 50 := by
  have h := rank_eq_card_of_integer_right_inverse (familySelected1 ℤ)
    familyInverse1 36 (by decide) familyRightInverse1
  rw [familySelected1_map] at h
  simpa using h

theorem family_linearized_rank (d : Fin 2) : (familyJacobian ℂ d).rank = 50 := by
  apply le_antisymm (familyJacobian_rank_le d)
  fin_cases d
  · change 50 ≤ (familyJacobian ℂ 0).rank
    have h := (familyJacobian ℂ 0).rank_submatrix_le familyRows0 id
    change (familySelected0 ℂ).rank ≤ _ at h
    simpa only [familySelected0_rank] using h
  · change 50 ≤ (familyJacobian ℂ 1).rank
    have h := (familyJacobian ℂ 1).rank_submatrix_le familyRows1 id
    change (familySelected1 ℂ).rank ≤ _ at h
    simpa only [familySelected1_rank] using h

end TR25Family
