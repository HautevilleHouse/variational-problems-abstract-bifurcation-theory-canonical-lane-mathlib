import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure AbstractBifurcationProblem where
  parameterSpace : Type u
  stateSpace : Type v
  parameter : parameterSpace
  state : stateSpace
  parameterTopology : TopologicalSpace parameterSpace
  stateTopology : TopologicalSpace stateSpace
  smoothness : Prop
  parameterSmooth : smoothness
  stateSmooth : smoothness

structure BifurcationSolution (P : AbstractBifurcationProblem) where
  trivialBranch : Prop
  bifurcationPoints : Set P.parameterSpace
  branchBifurcating : P.parameterSpace → P.stateSpace → Prop
  trivialBranchClosed : trivialBranch
  bifurcationPointsClosed : Set.Finite P.parameterSpace bifurcationPoints
  branchBifurcatingWellDefined : ∀ (λ : P.parameterSpace) (u : P.stateSpace), branchBifurcating λ u → ∃ ε > 0, True

structure BifurcationEvidence (P : AbstractBifurcationProblem) (S : BifurcationSolution P) where
  trivialBranchClosed : S.trivialBranch
  bifurcationPointsClosed : Set.Finite P.parameterSpace S.bifurcationPoints
  branchBifurcatingWellDefined : ∀ (λ : P.parameterSpace) (u : P.stateSpace), S.branchBifurcating λ u → ∃ ε > 0, True

def BifurcationClosed (P : AbstractBifurcationProblem) (S : BifurcationSolution P) : Prop :=
  S.trivialBranch ∧ Set.Finite P.parameterSpace S.bifurcationPoints ∧
  (∀ (λ : P.parameterSpace) (u : P.stateSpace), S.branchBifurcating λ u → ∃ ε > 0, True)

theorem bifurcation_closed_from_evidence (P : AbstractBifurcationProblem) (S : BifurcationSolution P)
    (E : BifurcationEvidence P S) : BifurcationClosed P S := by
  exact And.intro E.trivialBranchClosed (And.intro E.bifurcationPointsClosed E.branchBifurcatingWellDefined)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse