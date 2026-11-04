import TR25.Statement
import TR25.ArithmeticFacts
import TR25.Flattening
import TR25.SmallRank
import TR25.LargeRank

namespace TR25

/-- The complete explicit finite tensor certificate, with matrix ranks over ℂ. -/
theorem finiteCertificate : FiniteCertificate where
  tensor_eq := small_total_eq
  embedded_tensor_eq := embedded_total_eq
  terms_nonzero := small_nonzero
  terms_distinct := small_distinct
  decompositions_different := small_different
  embedded_terms_nonzero := embedded_nonzero
  embedded_terms_distinct := embedded_distinct
  embedded_decompositions_different := embedded_different
  flattening_rank := small_flattening_rank
  embedded_flattening_rank := embedded_flattening_rank
  row_determinants := row_determinants_exact
  column_determinants := column_determinants_exact
  small_linearized_rank := small_linearized_rank
  embedded_linearized_rank := embeddedJacobian_rank

end TR25
