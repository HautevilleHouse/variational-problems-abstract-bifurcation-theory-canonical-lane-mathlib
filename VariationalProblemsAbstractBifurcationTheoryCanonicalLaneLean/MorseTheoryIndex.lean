import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure MorseIndexPackage where
  functional : Type u → ℝ
  criticalPoint : Type u
  hessian : Type u → Type u
  morseIndex : ℕ
  nondegenerateCriticalPoint : Prop
  palaisSmaleCondition : Prop

structure MorseIndexEvidence (M : MorseIndexPackage) where
  nondegenerateCriticalPointClosed : M.nondegenerateCriticalPoint
  palaisSmaleConditionClosed : M.palaisSmaleCondition

def MorseIndexClosed (M : MorseIndexPackage) : Prop :=
  M.nondegenerateCriticalPoint ∧ M.palaisSmaleCondition

theorem morse_index_closed_from_evidence (M : MorseIndexPackage)
    (E : MorseIndexEvidence M) : MorseIndexClosed M := by
  exact And.intro E.nondegenerateCriticalPointClosed E.palaisSmaleConditionClosed

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse