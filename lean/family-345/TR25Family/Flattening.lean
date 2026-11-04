import TR25Family.Definitions

set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000

namespace TR25Family

theorem card_le_rank_of_minor_det_ne_zero
    {m n s : Type*} [Fintype m] [Fintype n] [Fintype s] [DecidableEq s]
    (A : Matrix m n ℂ) (rows : s → m) (cols : s → n)
    (hdet : (A.submatrix rows cols).det ≠ 0) : Fintype.card s ≤ A.rank := by
  have hrank := Matrix.rank_of_det_ne_zero hdet
  have hle := Matrix.rank_submatrix_le A rows cols
  simpa only [hrank] using hle

def flattenRowsA : Fin 3 → Fin 4 × Fin 5 := ![(0,0), (0,1), (0,2)]
def flattenRowsB : Fin 3 → Fin 3 × Fin 5 := ![(0,3), (0,4), (0,0)]
def flattenColsB (j : Fin 3) : Fin 4 := j.castLE (by decide)
def flattenRowsC : Fin 5 → Fin 3 × Fin 4 :=
  ![(0,2), (1,2), (2,2), (0,0), (0,1)]

theorem flatten_minorA_det :
    ((flatteningA ℂ).submatrix flattenRowsA id).det = 1 := by
  norm_num [Matrix.det_fin_three, Matrix.submatrix, flatteningA, flattenRowsA,
    witness, q, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

theorem flatten_minorB_det :
    ((flatteningB ℂ).submatrix flattenRowsB flattenColsB).det = 1 := by
  norm_num [Matrix.det_fin_three, Matrix.submatrix, flatteningB, flattenRowsB,
    flattenColsB, witness, q, Matrix.cons_val_two, Matrix.cons_val_three,
    Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail]

theorem flatten_minorC_det :
    ((flatteningC ℂ).submatrix flattenRowsC id).det = 27 := by
  have htri : ((flatteningC ℂ).submatrix flattenRowsC id).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases i <;> fin_cases j <;>
      norm_num [Matrix.submatrix, flatteningC, flattenRowsC, witness, q,
        Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  norm_num [Fin.prod_univ_succ, Matrix.submatrix, flatteningC, flattenRowsC,
    witness, q, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

def flattenLeftB : Matrix (Fin 3 × Fin 5) (Fin 3) ℂ :=
  fun ik j => flatteningB ℂ ik (flattenColsB j)

def flattenRightB : Matrix (Fin 3) (Fin 4) ℂ :=
  fun i j => if i.val = j.val then 1 else 0

theorem flatteningB_factor : flatteningB ℂ = flattenLeftB * flattenRightB := by
  ext ik j
  fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ, flattenLeftB, flattenRightB,
      flattenColsB, flatteningB, witness]
  rfl

theorem flatteningA_rank_exact : (flatteningA ℂ).rank = 3 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (flatteningA ℂ)
  · have hdet : ((flatteningA ℂ).submatrix flattenRowsA id).det ≠ 0 := by
      rw [flatten_minorA_det]
      norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (flatteningA ℂ) flattenRowsA id hdet

theorem flatteningB_rank_exact : (flatteningB ℂ).rank = 3 := by
  apply le_antisymm
  · rw [flatteningB_factor]
    calc
      (flattenLeftB * flattenRightB).rank ≤ flattenLeftB.rank :=
        Matrix.rank_mul_le_left _ _
      _ ≤ 3 := by simpa using Matrix.rank_le_card_width flattenLeftB
  · have hdet : ((flatteningB ℂ).submatrix flattenRowsB flattenColsB).det ≠ 0 := by
      rw [flatten_minorB_det]
      norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (flatteningB ℂ)
      flattenRowsB flattenColsB hdet

theorem flatteningC_rank_exact : (flatteningC ℂ).rank = 5 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (flatteningC ℂ)
  · have hdet : ((flatteningC ℂ).submatrix flattenRowsC id).det ≠ 0 := by
      rw [flatten_minorC_det]
      norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (flatteningC ℂ) flattenRowsC id hdet

end TR25Family
