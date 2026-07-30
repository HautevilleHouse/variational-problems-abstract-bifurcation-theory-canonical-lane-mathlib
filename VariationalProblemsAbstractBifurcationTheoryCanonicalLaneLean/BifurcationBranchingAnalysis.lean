import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean.VariationalBifurcationEquation

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BranchingSolutionComponent {S : AbstractBifurcationSetting}
    {L : LyapunovSchmidtReductionData S} (V : VariationalBifurcationEquation L) where
  branchParameter : ℝ
  solutionCurve : ℝ → S.baseManifold
  bifurcationPersistence : Prop
  stabilityProperty : Prop
  bifurcationPersistenceTerm : bifurcationPersistence
  stabilityPropertyTerm : stabilityProperty

structure BranchingAnalysisEvidence {S : AbstractBifurcationSetting}
    {L : LyapunovSchmidtReductionData S} {V : VariationalBifurcationEquation L}
    (B : BranchingSolutionComponent V) where
  bifurcationPersistenceClosed : B.bifurcationPersistence
  stabilityPropertyClosed : B.stabilityProperty

def BranchingAnalysisClosed {S : AbstractBifurcationSetting}
    {L : LyapunovSchmidtReductionData S} {V : VariationalBifurcationEquation L}
    (B : BranchingSolutionComponent V) : Prop :=
  B.bifurcationPersistence ∧ B.stabilityProperty

theorem branching_analysis_closed_from_evidence
    {S : AbstractBifurcationSetting} {L : LyapunovSchmidtReductionData S}
    {V : VariationalBifurcationEquation L} (B : BranchingSolutionComponent V)
    (E : BranchingAnalysisEvidence B) : BranchingAnalysisClosed B := by
  exact And.intro E.bifurcationPersistenceClosed E.stabilityPropertyClosed

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse
