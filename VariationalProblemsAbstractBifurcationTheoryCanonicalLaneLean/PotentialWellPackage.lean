import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure PotentialWellPackage where
  energyFunctional : Type
  gradientFlow : Type
  criticalPoints : Type
  morseIndex : ℕ
  nondegeneracy : Prop
  wellStructure : Prop

structure PotentialWellEvidence (V : PotentialWellPackage) where
  nondegeneracyClosed : V.nondegeneracy
  wellStructureClosed : V.wellStructure

def PotentialWellClosed (V : PotentialWellPackage) : Prop :=
  V.nondegeneracy ∧ V.wellStructure

theorem potential_well_closed_from_evidence
    (V : PotentialWellPackage) (E : PotentialWellEvidence V) :
    PotentialWellClosed V := by
  exact And.intro E.nondegeneracyClosed E.wellStructureClosed

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse