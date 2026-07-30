import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure StabilityAnalysis (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) where
  trivialBranchStability : Prop
  bifurcatedBranchStability : Prop
  spectralData : Type u
  eigenvalueCrossing : Prop
  stabilityClosed : trivialBranchStability ∧ bifurcatedBranchStability ∧ eigenvalueCrossing

structure StabilityEvidence (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (S : StabilityAnalysis B V L) where
  trivialBranchStabilityClosed : S.trivialBranchStability
  bifurcatedBranchStabilityClosed : S.bifurcatedBranchStability
  eigenvalueCrossingClosed : S.eigenvalueCrossing

def StabilityClosed (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (S : StabilityAnalysis B V L) : Prop :=
  S.trivialBranchStability ∧ S.bifurcatedBranchStability ∧ S.eigenvalueCrossing

theorem stability_closed_from_evidence (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (S : StabilityAnalysis B V L)
    (E : StabilityEvidence B V L S) : StabilityClosed B V L S := by
  exact And.intro E.trivialBranchStabilityClosed
    (And.intro E.bifurcatedBranchStabilityClosed E.eigenvalueCrossingClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse