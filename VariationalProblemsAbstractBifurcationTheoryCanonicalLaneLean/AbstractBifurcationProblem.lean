import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure AbstractBifurcationProblem where
  parameterSpace : Type u
  stateSpace : Type v
  equation : parameterSpace → stateSpace → stateSpace
  trivialSolution : parameterSpace → stateSpace
  bifurcationPoint : parameterSpace
  linearizationDerivative : stateSpace → stateSpace
  fredholmIndex : ℤ
  nondegeneracyCondition : Prop

structure AbstractBifurcationProblemEvidence (P : AbstractBifurcationProblem) where
  nondegeneracyConditionClosed : P.nondegeneracyCondition
  fredholmIndexCorrect : P.fredholmIndex = 0

def AbstractBifurcationProblemClosed (P : AbstractBifurcationProblem) : Prop :=
  P.nondegeneracyCondition ∧ P.fredholmIndex = 0

theorem abstract_bifurcation_problem_closed_from_evidence (P : AbstractBifurcationProblem)
    (E : AbstractBifurcationProblemEvidence P) : AbstractBifurcationProblemClosed P := by
  exact And.intro E.nondegeneracyConditionClosed E.fredholmIndexCorrect

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse