import TR25.Definitions

namespace TR25

def liftCoord (p : Coord 3 3 5) : Coord 6 6 6 :=
  ((p.1.1.castLE (by decide), p.1.2.castLE (by decide)), p.2.castLE (by decide))

theorem embedded_pure_at (d : Fin 2) (t : Fin 5) (p : Coord 3 3 5) :
    pure ℂ (embedded d) t (liftCoord p) = pure ℂ (small d) t p := by
  simp [pure, embedded, pad, liftCoord]

theorem embedding_nonzero (d : Fin 2) (h : NonzeroTerms (small d)) :
    NonzeroTerms (embedded d) := by
  intro t hz
  apply h t
  funext p
  have hp := congrFun hz (liftCoord p)
  simpa only [embedded_pure_at, Pi.zero_apply] using hp

theorem embedding_distinct (d : Fin 2) (h : DistinctDirections (small d)) :
    DistinctDirections (embedded d) := by
  intro i j hij z heq
  apply h i j hij z
  funext p
  have hp := congrFun heq (liftCoord p)
  simpa only [Pi.smul_apply, embedded_pure_at] using hp

theorem embedding_different (h : DifferentDirections (small 0) (small 1)) :
    DifferentDirections (embedded 0) (embedded 1) := by
  obtain ⟨i, hi⟩ := h
  refine ⟨i, ?_⟩
  intro j z heq
  apply hi j z
  funext p
  have hp := congrFun heq (liftCoord p)
  simpa only [Pi.smul_apply, embedded_pure_at] using hp

theorem embedding_tensor_eq (d : Fin 2) (h : total ℤ (small d) = witness) :
    total ℤ (embedded d) = witness6 := by
  funext p
  by_cases hi : p.1.1.val < 3
  · by_cases hj : p.1.2.val < 3
    · by_cases hk : p.2.val < 5
      · have hp := congrFun h ((⟨p.1.1.val, hi⟩, ⟨p.1.2.val, hj⟩), ⟨p.2.val, hk⟩)
        simpa [total, pure, embedded, pad, witness6, hi, hj, hk] using hp
      · simp [total, pure, embedded, pad, witness6, hi, hj, hk]
    · simp [total, pure, embedded, pad, witness6, hi, hj]
  · simp [total, pure, embedded, pad, witness6, hi]

end TR25
