import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean.LyapunovSchmidtReduction

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure VariationalBifurcationEquation {S : AbstractBifurcationSetting}
    (L : LyapunovSchmidtReductionData S) where
  reducedFunctional : S.baseManifold × S.parameterSpace → ℝ
  gradientEquation : Prop
  bifurcationCondition : Prop
  minimalityCharacterization : Prop
  gradientEquationTerm : gradientEquation
  bifurcationConditionTerm : bifurcationCondition
  minimalityCharacterizationTerm : minimalityCharacterization

structure VariationalBifurcationEquationEvidence {S : AbstractBifurcationSetting}
    {L : LyapunovSchmidtReductionData S} (V : VariationalBifurcationEquation L) where
  gradientEquationClosed : V.gradientEquation
  bifurcationConditionClosed : V.bifurcationCondition
  minimalityCharacterizationClosed : V.minimalityCharacterization

def VariationalBifurcationEquationClosed {S : AbstractBifurcationSetting}
    {L : LyapunovSchmidtReductionData S} (V : VariationalBifurcationEquation L) : Prop :=
  V.gradientEquation ∧ V.bifurcationCondition ∧ V.minimalityCharacterization

theorem variational_bifurcation_equation_closed_from_evidence
    {S : AbstractBifurcationSetting} {L : LyapunovSchmidtReductionData S}
    (V : VariationalBifurcationEquation L) (E : VariationalBifurcationEquationEvidence V) :
    VariationalBifurcationEquationClosed V := by
  exact And.intro E.gradientEquationClosed
    (And.intro E.bifurcationConditionClosed E.minimalityCharacterizationClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse
