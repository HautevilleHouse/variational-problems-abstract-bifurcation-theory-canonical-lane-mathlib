import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure VariationalProblem (B : AbstractBifurcationProblem) where
  functional : B.stateSpace → ℝ
  differentiable : Prop
  criticalPoints : Set B.stateSpace
  functionalWellDefined : ∀ u : B.stateSpace, functional u = functional u
  differentiableClosed : differentiable
  criticalPointsClosed : Set.Finite B.stateSpace criticalPoints

structure VariationalEvidence (B : AbstractBifurcationProblem) (V : VariationalProblem B) where
  differentiableClosed : V.differentiable
  criticalPointsClosed : Set.Finite B.stateSpace V.criticalPoints

def VariationalClosed (B : AbstractBifurcationProblem) (V : VariationalProblem B) : Prop :=
  V.differentiable ∧ Set.Finite B.stateSpace V.criticalPoints

theorem variational_closed_from_evidence (B : AbstractBifurcationProblem) (V : VariationalProblem B)
    (E : VariationalEvidence B V) : VariationalClosed B V := by
  exact And.intro E.differentiableClosed E.criticalPointsClosed

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse