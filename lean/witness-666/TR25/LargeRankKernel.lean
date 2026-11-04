import TR25.Definitions

set_option backward.isDefEq.respectTransparency false

namespace TR25

abbrev ScalingIndex := Fin 5 × Fin 2

def scalingKernel {a b c : ℕ} (R : Type*) [CommRing R]
    (f : Factors a b c) : Matrix (Param a b c) ScalingIndex R :=
  fun t s => if t.1 = s.1 then
    match t.2 with
    | Sum.inl i => if s.2 = 0 then (f.a t.1 i : R) else 0
    | Sum.inr (Sum.inl j) => if s.2 = 1 then (f.b t.1 j : R) else 0
    | Sum.inr (Sum.inr k) => -(f.c t.1 k : R)
  else 0

theorem jacobian_mul_scalingKernel {a b c : ℕ} (R : Type*) [CommRing R]
    (f : Factors a b c) : jacobian R f * scalingKernel R f = 0 := by
  ext p s
  rcases s with ⟨s, u⟩
  fin_cases u <;>
    simp [Matrix.mul_apply, jacobian, scalingKernel, Fintype.sum_prod_type,
      Fintype.sum_sum_type] <;> ring

def scalingRows (d : Fin 2) (s : ScalingIndex) : Param 6 6 6 :=
  (s.1, if s.2 = 0 then
    Sum.inl (![0, 1, 2, 0, 0] s.1)
  else Sum.inr (Sum.inl ((if d = 0 then ![0, 0, 0, 0, 1] else ![0, 0, 0, 0, 2]) s.1)))

def scalingWeight (R : Type*) [CommRing R] (d : Fin 2) (s : ScalingIndex) : R :=
  if s.2 = 0 ∧ (s.1 = 3 ∨ (d = 0 ∧ s.1 = 4)) then -1 else 1

theorem scaling_submatrix (R : Type*) [CommRing R] (d : Fin 2) :
    (scalingKernel R (embedded d)).submatrix (scalingRows d) id =
      Matrix.diagonal (scalingWeight R d) := by
  ext ⟨t, u⟩ ⟨s, v⟩
  by_cases h : t = s
  · subst s
    fin_cases d <;> fin_cases t <;> fin_cases u <;> fin_cases v <;>
      norm_num [scalingKernel, scalingRows, scalingWeight, embedded, pad, small,
        Matrix.submatrix_apply, Matrix.diagonal_apply, Fin.ext_iff]
  · simp [scalingKernel, scalingRows, Matrix.submatrix_apply, h]

theorem scalingKernel_rank (d : Fin 2) : (scalingKernel ℂ (embedded d)).rank = 10 := by
  have hdiag : (Matrix.diagonal (scalingWeight ℂ d)).rank = 10 := by
    classical
    have hw : ∀ s, scalingWeight ℂ d s ≠ 0 := by
      intro s
      simp only [scalingWeight]
      split <;> norm_num
    have hd : (Matrix.diagonal (scalingWeight ℂ d)).det ≠ 0 := by
      rw [Matrix.det_diagonal]
      exact Finset.prod_ne_zero_iff.mpr (fun s _ => hw s)
    simpa [ScalingIndex] using Matrix.rank_of_det_ne_zero hd
  have hlo := (scalingKernel ℂ (embedded d)).rank_submatrix_le (scalingRows d) id
  rw [scaling_submatrix, hdiag] at hlo
  have hup := (scalingKernel ℂ (embedded d)).rank_le_card_width
  norm_num [ScalingIndex] at hup
  omega

theorem embeddedJacobian_rank_le (d : Fin 2) : (embeddedJacobian ℂ d).rank ≤ 80 := by
  have h := Matrix.rank_add_rank_le_card_of_mul_eq_zero
    (jacobian_mul_scalingKernel ℂ (embedded d))
  rw [scalingKernel_rank] at h
  norm_num [Param] at h
  exact (show (jacobian ℂ (embedded d)).rank ≤ 80 by omega)

end TR25
