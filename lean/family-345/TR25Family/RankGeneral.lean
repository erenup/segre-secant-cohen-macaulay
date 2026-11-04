import TR25Family.Definitions

namespace TR25Family

theorem rank_eq_card_of_integer_right_inverse
    {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m]
    (A : Matrix m n ℤ) (B : Matrix n m ℤ) (k : ℤ)
    (hk : k ≠ 0) (hAB : A * B = k • (1 : Matrix m m ℤ)) :
    (A.map (Int.castRingHom ℂ)).rank = Fintype.card m := by
  have hkC : (k : ℂ) ≠ 0 := by exact_mod_cast hk
  have hcast : A.map (Int.castRingHom ℂ) * B.map (Int.castRingHom ℂ) =
      (k : ℂ) • (1 : Matrix m m ℂ) := by
    rw [← Matrix.map_mul, hAB]
    ext i j
    by_cases hij : i = j <;>
      simp [Matrix.map_apply, Matrix.smul_apply,
        Matrix.intCast_apply, hij]
  have hright : A.map (Int.castRingHom ℂ) *
      ((k : ℂ)⁻¹ • B.map (Int.castRingHom ℂ)) = 1 := by
    rw [Matrix.mul_smul, hcast, smul_smul, inv_mul_cancel₀ hkC, one_smul]
  apply le_antisymm (Matrix.rank_le_card_height _)
  have h := Matrix.rank_mul_le_left (A.map (Int.castRingHom ℂ))
    ((k : ℂ)⁻¹ • B.map (Int.castRingHom ℂ))
  simpa only [hright, Matrix.rank_one] using h

theorem jacobian_map_intCast {a b c : ℕ} (f : Factors a b c) :
    (jacobian ℤ f).map (Int.castRingHom ℂ) = jacobian ℂ f := by
  ext p t
  rcases t with ⟨t, i | (j | k)⟩
  · by_cases h : p.1.1 = i <;> simp [jacobian, Matrix.map_apply, h]
  · by_cases h : p.1.2 = j <;> simp [jacobian, Matrix.map_apply, h]
  · by_cases h : p.2 = k <;> simp [jacobian, Matrix.map_apply, h]

end TR25Family
