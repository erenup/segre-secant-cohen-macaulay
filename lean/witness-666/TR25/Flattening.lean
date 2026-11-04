import TR25.Definitions

set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000

namespace TR25

def flattenRows : Fin 5 → Fin 3 × Fin 3 :=
  ![(0,2), (1,2), (2,2), (0,0), (0,1)]

def flattenRows6 (i : Fin 5) : Fin 6 × Fin 6 :=
  ((flattenRows i).1.castLE (by decide), (flattenRows i).2.castLE (by decide))

def flattenCols6 (k : Fin 5) : Fin 6 := k.castLE (by decide)

theorem flatten_minor_det :
    ((flattening ℂ).submatrix flattenRows id).det = 27 := by
  have htri : ((flattening ℂ).submatrix flattenRows id).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases i <;> fin_cases j <;>
      norm_num [Matrix.submatrix, flattening, flattenRows, witness, q,
        Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  norm_num [Fin.prod_univ_succ, Matrix.submatrix, flattening, flattenRows, witness, q,
    Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

theorem small_flattening_rank : (flattening ℂ).rank = 5 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (flattening ℂ)
  · have hdet : ((flattening ℂ).submatrix flattenRows id).det ≠ 0 := by
      rw [flatten_minor_det]
      norm_num
    have hrank := Matrix.rank_of_det_ne_zero hdet
    have hle := Matrix.rank_submatrix_le (flattening ℂ) flattenRows id
    simpa [hrank] using hle

theorem embedded_flatten_minor_eq :
    (flattening6 ℂ).submatrix flattenRows6 flattenCols6 =
      (flattening ℂ).submatrix flattenRows id := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.submatrix, flattening6, flattenRows6, flattenCols6,
      flattening, flattenRows, witness6, witness, q,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

theorem embedded_flatten_minor_det :
    ((flattening6 ℂ).submatrix flattenRows6 flattenCols6).det = 27 := by
  rw [embedded_flatten_minor_eq, flatten_minor_det]

def flattenLeft : Matrix (Fin 6 × Fin 6) (Fin 5) ℂ :=
  fun ij k => flattening6 ℂ ij (flattenCols6 k)

def flattenRight : Matrix (Fin 5) (Fin 6) ℂ :=
  fun i j => if i.val = j.val then 1 else 0

theorem embedded_flatten_factor : flattening6 ℂ = flattenLeft * flattenRight := by
  ext ij k
  fin_cases k <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ, flattenLeft, flattenRight,
      flattenCols6, flattening6, witness6] <;> rfl

theorem embedded_flattening_rank : (flattening6 ℂ).rank = 5 := by
  apply le_antisymm
  · rw [embedded_flatten_factor]
    calc
      (flattenLeft * flattenRight).rank ≤ flattenLeft.rank :=
        Matrix.rank_mul_le_left _ _
      _ ≤ 5 := by simpa using Matrix.rank_le_card_width flattenLeft
  · have hdet : ((flattening6 ℂ).submatrix flattenRows6 flattenCols6).det ≠ 0 := by
      rw [embedded_flatten_minor_det]
      norm_num
    have hrank := Matrix.rank_of_det_ne_zero hdet
    have hle := Matrix.rank_submatrix_le (flattening6 ℂ) flattenRows6 flattenCols6
    simpa [hrank] using hle

end TR25
