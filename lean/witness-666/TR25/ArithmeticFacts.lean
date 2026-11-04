import TR25.Embedding

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 100000
set_option maxHeartbeats 2500000

namespace TR25

theorem small_total_eq : ∀ d : Fin 2, total ℤ (small d) = witness := by
  intro d
  funext p
  rcases p with ⟨⟨i, j⟩, k⟩
  fin_cases d <;> fin_cases i <;> fin_cases j <;> fin_cases k <;>
    norm_num [total, pure, small, witness, q, Fin.sum_univ_succ,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

theorem embedded_total_eq : ∀ d : Fin 2, total ℤ (embedded d) = witness6 := by
  intro d
  exact embedding_tensor_eq d (small_total_eq d)

def pivotCoord : Fin 2 → Fin 5 → Coord 3 3 5 :=
  ![![((0,0),0), ((1,0),1), ((2,0),2), ((0,0),3), ((0,1),4)],
    ![((0,0),0), ((1,0),1), ((2,0),2), ((0,0),3), ((0,2),4)]]

theorem small_nonzero : ∀ d : Fin 2, NonzeroTerms (small d) := by
  intro d t h
  have hp := congrFun h (pivotCoord d t)
  fin_cases d <;> fin_cases t <;>
    norm_num [pure, small, pivotCoord, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at hp

theorem small_distinct : ∀ d : Fin 2, DistinctDirections (small d) := by
  intro d i j hij z h
  have hp := congrFun h (pivotCoord d i)
  have hq := congrFun h (pivotCoord d j)
  fin_cases d <;> fin_cases i <;> fin_cases j <;>
    norm_num [pure, small, pivotCoord, Pi.smul_apply, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at * <;>
    simp_all
  subst z
  norm_num at hp

theorem small_different : DifferentDirections (small 0) (small 1) := by
  refine ⟨0, ?_⟩
  intro j z h
  have hp := congrFun h ((0,0),0)
  have hq := congrFun h ((0,0),4)
  fin_cases j <;>
    norm_num [pure, small, Pi.smul_apply, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at * <;>
    simp_all

theorem embedded_nonzero : ∀ d : Fin 2, NonzeroTerms (embedded d) := by
  intro d
  exact embedding_nonzero d (small_nonzero d)

theorem embedded_distinct : ∀ d : Fin 2, DistinctDirections (embedded d) := by
  intro d
  exact embedding_distinct d (small_distinct d)

theorem embedded_different : DifferentDirections (embedded 0) (embedded 1) := by
  exact embedding_different small_different

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

end TR25
