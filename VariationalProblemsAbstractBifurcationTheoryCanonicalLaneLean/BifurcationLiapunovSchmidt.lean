import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure LiapunovSchmidtReductionPackage where
  kernelDimension : ℕ
  rangeSplitting : Prop
  bifurcationEquation : Prop
  reducedEquation : Prop
  implicitFunctionTheoremApplied : Prop

structure LiapunovSchmidtReductionEvidence
    (L : LiapunovSchmidtReductionPackage) where
  kernelDimensionClosed : L.kernelDimension = 1
  rangeSplittingClosed : L.rangeSplitting
  bifurcationEquationClosed : L.bifurcationEquation
  reducedEquationClosed : L.reducedEquation
  implicitFunctionTheoremAppliedClosed : L.implicitFunctionTheoremApplied

def LiapunovSchmidtReductionClosed (L : LiapunovSchmidtReductionPackage) : Prop :=
  L.kernelDimension = 1 ∧ L.rangeSplitting ∧ L.bifurcationEquation ∧
  L.reducedEquation ∧ L.implicitFunctionTheoremApplied

theorem liapunov_schmidt_reduction_closed_from_evidence
    (L : LiapunovSchmidtReductionPackage)
    (E : LiapunovSchmidtReductionEvidence L) :
    LiapunovSchmidtReductionClosed L := by
  exact And.intro E.kernelDimensionClosed
    (And.intro E.rangeSplittingClosed
      (And.intro E.bifurcationEquationClosed
        (And.intro E.reducedEquationClosed
          E.implicitFunctionTheoremAppliedClosed)))

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse