import canonicalLaneMathlib.AdmissibleClass

/-!
# Bifurcation Endpoint Classification Package
-/

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BifurcationEndpointPackage where
  parameterSpace : Type u
  solutionBranch : Prop
  bifurcationPoint : Prop
  endpointReached : Prop
  exchangeStability : Prop

structure BifurcationEndpointEvidence (E : BifurcationEndpointPackage) where
  solutionBranchClosed : E.solutionBranch
  bifurcationPointClosed : E.bifurcationPoint
  endpointReachedClosed : E.endpointReached
  exchangeStabilityClosed : E.exchangeStability

def BifurcationEndpointClosed (E : BifurcationEndpointPackage) : Prop :=
  E.solutionBranch ∧ E.bifurcationPoint ∧ E.endpointReached ∧ E.exchangeStability

theorem bifurcation_endpoint_closed_from_evidence
    (E : BifurcationEndpointPackage) (Ev : BifurcationEndpointEvidence E) :
    BifurcationEndpointClosed E := by
  exact And.intro Ev.solutionBranchClosed
    (And.intro Ev.bifurcationPointClosed
      (And.intro Ev.endpointReachedClosed Ev.exchangeStabilityClosed))

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse