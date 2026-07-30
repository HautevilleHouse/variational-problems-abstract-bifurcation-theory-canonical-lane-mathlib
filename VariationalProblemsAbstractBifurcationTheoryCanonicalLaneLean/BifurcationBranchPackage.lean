import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BifurcationBranchPackage (V : PotentialWellPackage) where
  criticalValue : ℝ
  branchParameter : ℝ → ℝ
  bifurcationCondition : Prop
  stabilityTransfer : Prop
  crossingTopology : Prop

structure BifurcationBranchEvidence {V : PotentialWellPackage} (B : BifurcationBranchPackage V) where
  criticalValueClosed : B.criticalValue ≠ 0
  branchParameterClosed : ∀ λ, B.branchParameter λ ≠ 0
  bifurcationConditionClosed : B.bifurcationCondition
  stabilityTransferClosed : B.stabilityTransfer
  crossingTopologyClosed : B.crossingTopology

def BifurcationBranchClosed {V : PotentialWellPackage} (B : BifurcationBranchPackage V) : Prop :=
  B.criticalValue ≠ 0 ∧ (∀ λ, B.branchParameter λ ≠ 0) ∧ B.bifurcationCondition ∧ B.stabilityTransfer ∧ B.crossingTopology

theorem bifurcation_branch_closed_from_evidence
    {V : PotentialWellPackage} (B : BifurcationBranchPackage V) (E : BifurcationBranchEvidence B) :
    BifurcationBranchClosed B := by
  exact And.intro E.criticalValueClosed
    (And.intro E.branchParameterClosed
      (And.intro E.bifurcationConditionClosed
        (And.intro E.stabilityTransferClosed E.crossingTopologyClosed)))

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse