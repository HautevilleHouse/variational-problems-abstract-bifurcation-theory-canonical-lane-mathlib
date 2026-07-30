import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean.AbstractBifurcationSetting

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BifurcationPointCandidate {S : AbstractBifurcationSetting} where
  basePoint : S.baseManifold
  parameterValue : S.parameterSpace
  criticalPointCondition : Prop
  kernelDimensionCondition : Prop
  crossingCondition : Prop
  criticalPointConditionTerm : criticalPointCondition
  kernelDimensionConditionTerm : kernelDimensionCondition
  crossingConditionTerm : crossingCondition

structure BifurcationPointEvidence {S : AbstractBifurcationSetting}
    (B : BifurcationPointCandidate S) where
  criticalPointConditionClosed : B.criticalPointCondition
  kernelDimensionConditionClosed : B.kernelDimensionCondition
  crossingConditionClosed : B.crossingCondition

def BifurcationPointClosed {S : AbstractBifurcationSetting}
    (B : BifurcationPointCandidate S) : Prop :=
  B.criticalPointCondition ∧ B.kernelDimensionCondition ∧ B.crossingCondition

theorem bifurcation_point_closed_from_evidence
    {S : AbstractBifurcationSetting} (B : BifurcationPointCandidate S)
    (E : BifurcationPointEvidence B) : BifurcationPointClosed B := by
  exact And.intro E.criticalPointConditionClosed
    (And.intro E.kernelDimensionConditionClosed E.crossingConditionClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse
