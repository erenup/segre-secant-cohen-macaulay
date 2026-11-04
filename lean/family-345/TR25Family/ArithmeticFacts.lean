import TR25Family.Definitions

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 100000
set_option maxHeartbeats 2500000

namespace TR25Family

theorem family_total_eq : ∀ d : Fin 2, total ℤ (family d) = witness := by
  intro d
  funext p
  rcases p with ⟨⟨i, j⟩, k⟩
  fin_cases d <;> fin_cases i <;> fin_cases j <;> fin_cases k <;>
    norm_num [total, pure, family, witness, q, Fin.sum_univ_succ,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

def pivotCoord : Fin 2 → Fin 5 → Coord 3 4 5 :=
  ![![((0,0),0), ((1,0),1), ((2,0),2), ((0,0),3), ((0,1),4)],
    ![((0,0),0), ((1,0),1), ((2,0),2), ((0,0),3), ((0,2),4)]]

theorem family_nonzero : ∀ d : Fin 2, NonzeroTerms (family d) := by
  intro d t h
  have hp := congrFun h (pivotCoord d t)
  fin_cases d <;> fin_cases t <;>
    norm_num [pure, family, pivotCoord, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at hp

theorem family_distinct : ∀ d : Fin 2, DistinctDirections (family d) := by
  intro d i j hij z h
  have hp := congrFun h (pivotCoord d i)
  have hq := congrFun h (pivotCoord d j)
  fin_cases d <;> fin_cases i <;> fin_cases j <;>
    norm_num [pure, family, pivotCoord, Pi.smul_apply, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at *
  all_goals simp_all
  subst z
  norm_num at hp

theorem family_different : DifferentDirections (family 0) (family 1) := by
  refine ⟨0, ?_⟩
  intro j z h
  have hp := congrFun h ((0,0),0)
  have hq := congrFun h ((0,0),4)
  fin_cases j <;>
    norm_num [pure, family, Pi.smul_apply, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead, Matrix.vecTail] at *
  all_goals simp_all

end TR25Family
