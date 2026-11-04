import TR25Family.Definitions

set_option backward.isDefEq.respectTransparency false

namespace TR25Family

theorem row_determinants_exact : ∀ i : Fin 3,
    (rowRatio i).det = (![(-1/18 : ℚ), 1/3, -2] i) := by
  intro i
  fin_cases i <;>
    norm_num [rowRatio, baseMatrix, otherIndices, Matrix.det_fin_three,
      Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem column_determinants_exact : ∀ j : Fin 3,
    (colRatio j).det = (![(-1/18 : ℚ), 4/9, -3/2] j) := by
  intro j
  fin_cases j <;>
    norm_num [colRatio, baseMatrix, otherIndices, Matrix.det_fin_three,
      Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

end TR25Family
