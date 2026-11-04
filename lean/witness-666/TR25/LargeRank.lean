import TR25.LargeRankRows0_00
import TR25.LargeRankRows0_10
import TR25.LargeRankRows0_20
import TR25.LargeRankRows0_30
import TR25.LargeRankRows0_40
import TR25.LargeRankRows0_50
import TR25.LargeRankRows0_60
import TR25.LargeRankRows0_70
import TR25.LargeRankRows1_00
import TR25.LargeRankRows1_10
import TR25.LargeRankRows1_20
import TR25.LargeRankRows1_30
import TR25.LargeRankRows1_40
import TR25.LargeRankRows1_50
import TR25.LargeRankRows1_60
import TR25.LargeRankRows1_70
import TR25.SmallRankGeneral
import TR25.LargeRankKernel

namespace TR25

theorem largeRightInverse0 :
    largeSelected0 ℤ * largeInverse0 = (36 : ℤ) • (1 : Matrix (Fin 80) (Fin 80) ℤ) := by
  ext i j
  fin_cases i
  · exact largeRightInverse0Row00 j
  · exact largeRightInverse0Row01 j
  · exact largeRightInverse0Row02 j
  · exact largeRightInverse0Row03 j
  · exact largeRightInverse0Row04 j
  · exact largeRightInverse0Row05 j
  · exact largeRightInverse0Row06 j
  · exact largeRightInverse0Row07 j
  · exact largeRightInverse0Row08 j
  · exact largeRightInverse0Row09 j
  · exact largeRightInverse0Row10 j
  · exact largeRightInverse0Row11 j
  · exact largeRightInverse0Row12 j
  · exact largeRightInverse0Row13 j
  · exact largeRightInverse0Row14 j
  · exact largeRightInverse0Row15 j
  · exact largeRightInverse0Row16 j
  · exact largeRightInverse0Row17 j
  · exact largeRightInverse0Row18 j
  · exact largeRightInverse0Row19 j
  · exact largeRightInverse0Row20 j
  · exact largeRightInverse0Row21 j
  · exact largeRightInverse0Row22 j
  · exact largeRightInverse0Row23 j
  · exact largeRightInverse0Row24 j
  · exact largeRightInverse0Row25 j
  · exact largeRightInverse0Row26 j
  · exact largeRightInverse0Row27 j
  · exact largeRightInverse0Row28 j
  · exact largeRightInverse0Row29 j
  · exact largeRightInverse0Row30 j
  · exact largeRightInverse0Row31 j
  · exact largeRightInverse0Row32 j
  · exact largeRightInverse0Row33 j
  · exact largeRightInverse0Row34 j
  · exact largeRightInverse0Row35 j
  · exact largeRightInverse0Row36 j
  · exact largeRightInverse0Row37 j
  · exact largeRightInverse0Row38 j
  · exact largeRightInverse0Row39 j
  · exact largeRightInverse0Row40 j
  · exact largeRightInverse0Row41 j
  · exact largeRightInverse0Row42 j
  · exact largeRightInverse0Row43 j
  · exact largeRightInverse0Row44 j
  · exact largeRightInverse0Row45 j
  · exact largeRightInverse0Row46 j
  · exact largeRightInverse0Row47 j
  · exact largeRightInverse0Row48 j
  · exact largeRightInverse0Row49 j
  · exact largeRightInverse0Row50 j
  · exact largeRightInverse0Row51 j
  · exact largeRightInverse0Row52 j
  · exact largeRightInverse0Row53 j
  · exact largeRightInverse0Row54 j
  · exact largeRightInverse0Row55 j
  · exact largeRightInverse0Row56 j
  · exact largeRightInverse0Row57 j
  · exact largeRightInverse0Row58 j
  · exact largeRightInverse0Row59 j
  · exact largeRightInverse0Row60 j
  · exact largeRightInverse0Row61 j
  · exact largeRightInverse0Row62 j
  · exact largeRightInverse0Row63 j
  · exact largeRightInverse0Row64 j
  · exact largeRightInverse0Row65 j
  · exact largeRightInverse0Row66 j
  · exact largeRightInverse0Row67 j
  · exact largeRightInverse0Row68 j
  · exact largeRightInverse0Row69 j
  · exact largeRightInverse0Row70 j
  · exact largeRightInverse0Row71 j
  · exact largeRightInverse0Row72 j
  · exact largeRightInverse0Row73 j
  · exact largeRightInverse0Row74 j
  · exact largeRightInverse0Row75 j
  · exact largeRightInverse0Row76 j
  · exact largeRightInverse0Row77 j
  · exact largeRightInverse0Row78 j
  · exact largeRightInverse0Row79 j

theorem largeSelected0_map :
    (largeSelected0 ℤ).map (Int.castRingHom ℂ) = largeSelected0 ℂ := by
  unfold largeSelected0 embeddedJacobian
  rw [← Matrix.submatrix_map, jacobian_map_intCast]

theorem largeSelected0_rank : (largeSelected0 ℂ).rank = 80 := by
  have h := rank_eq_card_of_integer_right_inverse (largeSelected0 ℤ)
    largeInverse0 36 (by decide) largeRightInverse0
  rw [largeSelected0_map] at h
  simpa using h

theorem largeRightInverse1 :
    largeSelected1 ℤ * largeInverse1 = (36 : ℤ) • (1 : Matrix (Fin 80) (Fin 80) ℤ) := by
  ext i j
  fin_cases i
  · exact largeRightInverse1Row00 j
  · exact largeRightInverse1Row01 j
  · exact largeRightInverse1Row02 j
  · exact largeRightInverse1Row03 j
  · exact largeRightInverse1Row04 j
  · exact largeRightInverse1Row05 j
  · exact largeRightInverse1Row06 j
  · exact largeRightInverse1Row07 j
  · exact largeRightInverse1Row08 j
  · exact largeRightInverse1Row09 j
  · exact largeRightInverse1Row10 j
  · exact largeRightInverse1Row11 j
  · exact largeRightInverse1Row12 j
  · exact largeRightInverse1Row13 j
  · exact largeRightInverse1Row14 j
  · exact largeRightInverse1Row15 j
  · exact largeRightInverse1Row16 j
  · exact largeRightInverse1Row17 j
  · exact largeRightInverse1Row18 j
  · exact largeRightInverse1Row19 j
  · exact largeRightInverse1Row20 j
  · exact largeRightInverse1Row21 j
  · exact largeRightInverse1Row22 j
  · exact largeRightInverse1Row23 j
  · exact largeRightInverse1Row24 j
  · exact largeRightInverse1Row25 j
  · exact largeRightInverse1Row26 j
  · exact largeRightInverse1Row27 j
  · exact largeRightInverse1Row28 j
  · exact largeRightInverse1Row29 j
  · exact largeRightInverse1Row30 j
  · exact largeRightInverse1Row31 j
  · exact largeRightInverse1Row32 j
  · exact largeRightInverse1Row33 j
  · exact largeRightInverse1Row34 j
  · exact largeRightInverse1Row35 j
  · exact largeRightInverse1Row36 j
  · exact largeRightInverse1Row37 j
  · exact largeRightInverse1Row38 j
  · exact largeRightInverse1Row39 j
  · exact largeRightInverse1Row40 j
  · exact largeRightInverse1Row41 j
  · exact largeRightInverse1Row42 j
  · exact largeRightInverse1Row43 j
  · exact largeRightInverse1Row44 j
  · exact largeRightInverse1Row45 j
  · exact largeRightInverse1Row46 j
  · exact largeRightInverse1Row47 j
  · exact largeRightInverse1Row48 j
  · exact largeRightInverse1Row49 j
  · exact largeRightInverse1Row50 j
  · exact largeRightInverse1Row51 j
  · exact largeRightInverse1Row52 j
  · exact largeRightInverse1Row53 j
  · exact largeRightInverse1Row54 j
  · exact largeRightInverse1Row55 j
  · exact largeRightInverse1Row56 j
  · exact largeRightInverse1Row57 j
  · exact largeRightInverse1Row58 j
  · exact largeRightInverse1Row59 j
  · exact largeRightInverse1Row60 j
  · exact largeRightInverse1Row61 j
  · exact largeRightInverse1Row62 j
  · exact largeRightInverse1Row63 j
  · exact largeRightInverse1Row64 j
  · exact largeRightInverse1Row65 j
  · exact largeRightInverse1Row66 j
  · exact largeRightInverse1Row67 j
  · exact largeRightInverse1Row68 j
  · exact largeRightInverse1Row69 j
  · exact largeRightInverse1Row70 j
  · exact largeRightInverse1Row71 j
  · exact largeRightInverse1Row72 j
  · exact largeRightInverse1Row73 j
  · exact largeRightInverse1Row74 j
  · exact largeRightInverse1Row75 j
  · exact largeRightInverse1Row76 j
  · exact largeRightInverse1Row77 j
  · exact largeRightInverse1Row78 j
  · exact largeRightInverse1Row79 j

theorem largeSelected1_map :
    (largeSelected1 ℤ).map (Int.castRingHom ℂ) = largeSelected1 ℂ := by
  unfold largeSelected1 embeddedJacobian
  rw [← Matrix.submatrix_map, jacobian_map_intCast]

theorem largeSelected1_rank : (largeSelected1 ℂ).rank = 80 := by
  have h := rank_eq_card_of_integer_right_inverse (largeSelected1 ℤ)
    largeInverse1 36 (by decide) largeRightInverse1
  rw [largeSelected1_map] at h
  simpa using h

theorem embeddedJacobian_rank (d : Fin 2) : (embeddedJacobian ℂ d).rank = 80 := by
  apply le_antisymm (embeddedJacobian_rank_le d)
  fin_cases d
  · change 80 ≤ (embeddedJacobian ℂ 0).rank
    have h := (embeddedJacobian ℂ 0).rank_submatrix_le largeRows0 id
    change (largeSelected0 ℂ).rank ≤ _ at h
    simpa only [largeSelected0_rank] using h
  · change 80 ≤ (embeddedJacobian ℂ 1).rank
    have h := (embeddedJacobian ℂ 1).rank_submatrix_le largeRows1 id
    change (largeSelected1 ℂ).rank ≤ _ at h
    simpa only [largeSelected1_rank] using h

end TR25
