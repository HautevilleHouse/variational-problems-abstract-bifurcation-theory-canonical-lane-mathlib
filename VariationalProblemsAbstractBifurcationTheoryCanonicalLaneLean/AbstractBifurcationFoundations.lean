import canonicalLaneMathlib.AdmissibleClass

/-!
# Abstract Bifurcation Foundations Package
-/

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure AbstractBifurcationFoundations where
  banachSpaceSetting : Prop
  fredholmOperator : Prop
  implicitFunctionTheorem : Prop
  bifurcationBranching : Prop

structure AbstractBifurcationFoundationsEvidence (A : AbstractBifurcationFoundations) where
  banachSpaceSettingClosed : A.banachSpaceSetting
  fredholmOperatorClosed : A.fredholmOperator
  implicitFunctionTheoremClosed : A.implicitFunctionTheorem
  bifurcationBranchingClosed : A.bifurcationBranching

def AbstractBifurcationFoundationsClosed (A : AbstractBifurcationFoundations) : Prop :=
  A.banachSpaceSetting ∧ A.fredholmOperator ∧ A.implicitFunctionTheorem ∧ A.bifurcationBranching

theorem abstract_bifurcation_foundations_closed_from_evidence
    (A : AbstractBifurcationFoundations) (Ev : AbstractBifurcationFoundationsEvidence A) :
    AbstractBifurcationFoundationsClosed A := by
  exact And.intro Ev.banachSpaceSettingClosed
    (And.intro Ev.fredholmOperatorClosed
      (And.intro Ev.implicitFunctionTheoremClosed Ev.bifurcationBranchingClosed))

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse