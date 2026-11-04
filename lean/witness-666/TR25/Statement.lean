import TR25.Definitions

namespace TR25

/-- Exact finite certificate layer only. This proposition makes no claim about
Zariski closure, smoothness, Serre's condition S2, or Cohen–Macaulayness. -/
structure FiniteCertificate : Prop where
  tensor_eq : ∀ d : Fin 2, total ℤ (small d) = witness
  embedded_tensor_eq : ∀ d : Fin 2, total ℤ (embedded d) = witness6
  terms_nonzero : ∀ d : Fin 2, NonzeroTerms (small d)
  terms_distinct : ∀ d : Fin 2, DistinctDirections (small d)
  decompositions_different : DifferentDirections (small 0) (small 1)
  embedded_terms_nonzero : ∀ d : Fin 2, NonzeroTerms (embedded d)
  embedded_terms_distinct : ∀ d : Fin 2, DistinctDirections (embedded d)
  embedded_decompositions_different : DifferentDirections (embedded 0) (embedded 1)
  flattening_rank : (flattening ℂ).rank = 5
  embedded_flattening_rank : (flattening6 ℂ).rank = 5
  row_determinants : ∀ i : Fin 3, (rowRatio i).det = (![(-1/18 : ℚ), 1/3, -2] i)
  column_determinants : ∀ j : Fin 3, (colRatio j).det = (![(-1/18 : ℚ), 4/9, -3/2] j)
  small_linearized_rank : ∀ d : Fin 2, (smallJacobian ℂ d).rank = 45
  embedded_linearized_rank : ∀ d : Fin 2, (embeddedJacobian ℂ d).rank = 80

end TR25
