import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure VariationalBifurcationEndpointPackage where
  solutionBranch : Type u
  bifurcationValue : ℝ
  endpointCondition : Prop
  multiplicity : ℕ
  stabilityChange : Prop

structure VariationalBifurcationEndpointEvidence
    (V : VariationalBifurcationEndpointPackage) where
  endpointConditionClosed : V.endpointCondition
  multiplicityClosed : V.multiplicity ≥ 1
  stabilityChangeClosed : V.stabilityChange

def VariationalBifurcationEndpointClosed
    (V : VariationalBifurcationEndpointPackage) : Prop :=
  V.endpointCondition ∧ V.multiplicity ≥ 1 ∧ V.stabilityChange

theorem variational_bifurcation_endpoint_closed_from_evidence
    (V : VariationalBifurcationEndpointPackage)
    (E : VariationalBifurcationEndpointEvidence V) :
    VariationalBifurcationEndpointClosed V := by
  exact And.intro E.endpointConditionClosed
    (And.intro E.multiplicityClosed E.stabilityChangeClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse