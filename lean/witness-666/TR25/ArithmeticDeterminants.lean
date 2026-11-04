import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.NormNum

set_option backward.isDefEq.respectTransparency false

namespace TR25

open Matrix

section
variable (R : Type*) [Field R] [CharZero R]

theorem det_ratio_row_one :
    Matrix.det (!![1, 1, 1; 1, 1 / 2, 1 / 3; 1, 1 / 4, 1 / 9] :
      Matrix (Fin 3) (Fin 3) R) = -(1 / 18) := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem det_ratio_row_two :
    Matrix.det (!![1, 1, 1; 1, 2, 3; 1, 1 / 2, 1 / 3] :
      Matrix (Fin 3) (Fin 3) R) = 1 / 3 := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem det_ratio_row_three :
    Matrix.det (!![1, 1, 1; 1, 4, 9; 1, 2, 3] :
      Matrix (Fin 3) (Fin 3) R) = -2 := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem det_ratio_column_one :
    Matrix.det (!![1, 1, 1; 1, 1 / 2, 1 / 4; 1, 1 / 3, 1 / 9] :
      Matrix (Fin 3) (Fin 3) R) = -(1 / 18) := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem det_ratio_column_two :
    Matrix.det (!![1, 1, 1; 1, 2, 4; 1, 2 / 3, 4 / 9] :
      Matrix (Fin 3) (Fin 3) R) = 4 / 9 := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

theorem det_ratio_column_three :
    Matrix.det (!![1, 1, 1; 1, 3, 9; 1, 3 / 2, 9 / 4] :
      Matrix (Fin 3) (Fin 3) R) = -(3 / 2) := by
  norm_num [Matrix.det_fin_three, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

end
end TR25
