import canonicalLaneMathlib.AdmissibleClass

/-!
# Morse Index and Bifurcation Package
-/

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure MorseIndexBifurcationPackage where
  morseIndex : Prop
  bifurcationPointDetected : Prop
  indexJumpAtBifurcation : Prop
  variationalStructure : Prop

structure MorseIndexBifurcationEvidence (M : MorseIndexBifurcationPackage) where
  morseIndexClosed : M.morseIndex
  bifurcationPointDetectedClosed : M.bifurcationPointDetected
  indexJumpAtBifurcationClosed : M.indexJumpAtBifurcation
  variationalStructureClosed : M.variationalStructure

def MorseIndexBifurcationClosed (M : MorseIndexBifurcationPackage) : Prop :=
  M.morseIndex ∧ M.bifurcationPointDetected ∧ M.indexJumpAtBifurcation ∧ M.variationalStructure

theorem morse_index_bifurcation_closed_from_evidence
    (M : MorseIndexBifurcationPackage) (Ev : MorseIndexBifurcationEvidence M) :
    MorseIndexBifurcationClosed M := by
  exact And.intro Ev.morseIndexClosed
    (And.intro Ev.bifurcationPointDetectedClosed
      (And.intro Ev.indexJumpAtBifurcationClosed Ev.variationalStructureClosed))

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse