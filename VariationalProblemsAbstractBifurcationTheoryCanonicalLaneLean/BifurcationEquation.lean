import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BifurcationEquation (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) where
  equation : L.kernelProjection (V.functional ∘ L.rangeProjection) = 0
  solutionSet : Set B.stateSpace
  solutionNonzero : ∃ u : B.stateSpace, u ≠ 0 ∧ u ∈ solutionSet
  finitelyManySolutions : Set.Finite B.stateSpace solutionSet

structure BifurcationEquationEvidence (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (E : BifurcationEquation B V L) where
  equationClosed : E.equation
  solutionNonzeroClosed : ∃ u : B.stateSpace, u ≠ 0 ∧ u ∈ E.solutionSet
  finitelyManySolutionsClosed : Set.Finite B.stateSpace E.solutionSet

def BifurcationEquationClosed (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (E : BifurcationEquation B V L) : Prop :=
  E.equation ∧ (∃ u : B.stateSpace, u ≠ 0 ∧ u ∈ E.solutionSet) ∧ Set.Finite B.stateSpace E.solutionSet

theorem bifurcation_equation_closed_from_evidence (B : AbstractBifurcationProblem) (V : VariationalProblem B) (L : LyapunovSchmidtReduction B V) (E : BifurcationEquation B V L)
    (Ev : BifurcationEquationEvidence B V L E) : BifurcationEquationClosed B V L E := by
  exact And.intro Ev.equationClosed (And.intro Ev.solutionNonzeroClosed Ev.finitelyManySolutionsClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse