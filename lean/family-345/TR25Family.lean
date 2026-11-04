import TR25Family.Statement
import TR25Family.ArithmeticFacts
import TR25Family.ArithmeticDeterminants
import TR25Family.Flattening
import TR25Family.PairRanks
import TR25Family.Rank

namespace TR25Family

/-- The fixed finite certificate in ambient format 3 by 4 by 5. -/
theorem finiteCertificate : FiniteCertificate where
  tensor_eq := family_total_eq
  terms_nonzero := family_nonzero
  terms_distinct := family_distinct
  decompositions_different := family_different
  flatteningA_rank := flatteningA_rank_exact
  flatteningB_rank := flatteningB_rank_exact
  flatteningC_rank := flatteningC_rank_exact
  pairAB_rank := pairAB_rank_exact
  pairAC_rank := pairAC_rank_exact
  pairBC_rank := pairBC_rank_exact
  thirdFactors_rank := thirdFactors_rank_exact
  row_determinants := row_determinants_exact
  column_determinants := column_determinants_exact
  linearized_rank := family_linearized_rank

end TR25Family
