import TR25Family.Flattening

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 100000
set_option maxHeartbeats 2000000

namespace TR25Family

def pairRowsAB : Fin 2 → Fin 5 → Fin 3 × Fin 4 :=
  ![![(0,2), (1,2), (2,2), (0,0), (0,1)],
    ![(0,1), (1,1), (2,1), (0,0), (0,2)]]

def pairRowsAC : Fin 5 → Fin 3 × Fin 5 :=
  ![(0,0), (1,1), (2,2), (0,3), (0,4)]

def pairRowsBC : Fin 2 → Fin 5 → Fin 4 × Fin 5 :=
  ![![(0,0), (0,1), (0,2), (0,3), (1,4)],
    ![(0,0), (0,1), (0,2), (0,3), (2,4)]]

theorem pairAB_minor_det (d : Fin 2) :
    ((pairAB ℂ d).submatrix (pairRowsAB d) id).det = (![27, -8] : Fin 2 → ℂ) d := by
  have htri : ((pairAB ℂ d).submatrix (pairRowsAB d) id).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases d <;> fin_cases i <;> fin_cases j <;>
      norm_num [Matrix.submatrix, pairAB, pairRowsAB, family,
        Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  fin_cases d <;>
    norm_num [Fin.prod_univ_succ, Matrix.submatrix, pairAB, pairRowsAB, family,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

theorem pairAC_minor_det (d : Fin 2) :
    ((pairAC ℂ d).submatrix pairRowsAC id).det = (![1, -1] : Fin 2 → ℂ) d := by
  have htri : ((pairAC ℂ d).submatrix pairRowsAC id).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases d <;> fin_cases i <;> fin_cases j <;>
      norm_num [Matrix.submatrix, pairAC, pairRowsAC, family,
        Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  fin_cases d <;>
    norm_num [Fin.prod_univ_succ, Matrix.submatrix, pairAC, pairRowsAC, family,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

theorem pairBC_minor_det (d : Fin 2) :
    ((pairBC ℂ d).submatrix (pairRowsBC d) id).det = 1 := by
  have htri : ((pairBC ℂ d).submatrix (pairRowsBC d) id).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases d <;> fin_cases i <;> fin_cases j <;>
      norm_num [Matrix.submatrix, pairBC, pairRowsBC, family,
        Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  fin_cases d <;>
    norm_num [Fin.prod_univ_succ, Matrix.submatrix, pairBC, pairRowsBC, family,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

theorem thirdFactors_det (d : Fin 2) : (thirdFactors ℂ d).det = 1 := by
  have htri : (thirdFactors ℂ d).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    fin_cases d <;> fin_cases i <;> fin_cases j <;>
      norm_num [thirdFactors, family, Matrix.cons_val_two, Matrix.cons_val_three,
        Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at *
  rw [Matrix.det_of_isLowerTriangular _ htri]
  fin_cases d <;>
    norm_num [Fin.prod_univ_succ, thirdFactors, family, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail]

theorem pairAB_rank_exact (d : Fin 2) : (pairAB ℂ d).rank = 5 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (pairAB ℂ d)
  · have hdet : ((pairAB ℂ d).submatrix (pairRowsAB d) id).det ≠ 0 := by
      rw [pairAB_minor_det]
      fin_cases d <;> norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (pairAB ℂ d) (pairRowsAB d) id hdet

theorem pairAC_rank_exact (d : Fin 2) : (pairAC ℂ d).rank = 5 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (pairAC ℂ d)
  · have hdet : ((pairAC ℂ d).submatrix pairRowsAC id).det ≠ 0 := by
      rw [pairAC_minor_det]
      fin_cases d <;> norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (pairAC ℂ d) pairRowsAC id hdet

theorem pairBC_rank_exact (d : Fin 2) : (pairBC ℂ d).rank = 5 := by
  apply le_antisymm
  · simpa using Matrix.rank_le_card_width (pairBC ℂ d)
  · have hdet : ((pairBC ℂ d).submatrix (pairRowsBC d) id).det ≠ 0 := by
      rw [pairBC_minor_det]
      norm_num
    simpa using card_le_rank_of_minor_det_ne_zero (pairBC ℂ d) (pairRowsBC d) id hdet

theorem thirdFactors_rank_exact (d : Fin 2) : (thirdFactors ℂ d).rank = 5 := by
  have hdet : (thirdFactors ℂ d).det ≠ 0 := by
    rw [thirdFactors_det]
    norm_num
  simpa using Matrix.rank_of_det_ne_zero hdet

end TR25Family
