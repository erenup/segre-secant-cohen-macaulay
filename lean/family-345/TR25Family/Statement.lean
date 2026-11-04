import TR25Family.Definitions

namespace TR25Family

/-- Exact finite data for the fixed five-term witness in format 3 by 4 by 5.
No assertion about a secant variety, its dimension, S2, or Cohen–Macaulayness
is included, and this proposition has no quantification over ambient formats. -/
structure FiniteCertificate : Prop where
  tensor_eq : ∀ d : Fin 2, total ℤ (family d) = witness
  terms_nonzero : ∀ d : Fin 2, NonzeroTerms (family d)
  terms_distinct : ∀ d : Fin 2, DistinctDirections (family d)
  decompositions_different : DifferentDirections (family 0) (family 1)
  flatteningA_rank : (flatteningA ℂ).rank = 3
  flatteningB_rank : (flatteningB ℂ).rank = 3
  flatteningC_rank : (flatteningC ℂ).rank = 5
  pairAB_rank : ∀ d : Fin 2, (pairAB ℂ d).rank = 5
  pairAC_rank : ∀ d : Fin 2, (pairAC ℂ d).rank = 5
  pairBC_rank : ∀ d : Fin 2, (pairBC ℂ d).rank = 5
  thirdFactors_rank : ∀ d : Fin 2, (thirdFactors ℂ d).rank = 5
  row_determinants : ∀ i : Fin 3, (rowRatio i).det = (![(-1/18 : ℚ), 1/3, -2] i)
  column_determinants : ∀ j : Fin 3, (colRatio j).det = (![(-1/18 : ℚ), 4/9, -3/2] j)
  linearized_rank : ∀ d : Fin 2, (familyJacobian ℂ d).rank = 50

end TR25Family
