import canonicalLaneMathlib.AdmissibleClass

/-!
# Bifurcation Equivariant Setting Package
-/

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure EquivariantBifurcationPackage where
  groupAction : Type u
  symmetryBroken : Prop
  isotropySubgroup : Prop
  bifurcationEquationEquivariant : Prop

structure EquivariantBifurcationEvidence (E : EquivariantBifurcationPackage) where
  symmetryBrokenClosed : E.symmetryBroken
  isotropySubgroupClosed : E.isotropySubgroup
  bifurcationEquationEquivariantClosed : E.bifurcationEquationEquivariant

def EquivariantBifurcationClosed (E : EquivariantBifurcationPackage) : Prop :=
  E.symmetryBroken ∧ E.isotropySubgroup ∧ E.bifurcationEquationEquivariant

theorem equivariant_bifurcation_closed_from_evidence
    (E : EquivariantBifurcationPackage) (Ev : EquivariantBifurcationEvidence E) :
    EquivariantBifurcationClosed E := by
  exact And.intro Ev.symmetryBrokenClosed
    (And.intro Ev.isotropySubgroupClosed Ev.bifurcationEquationEquivariantClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse