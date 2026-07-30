import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean.BifurcationBranchPackage

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure LyapunovSchmidtReductionPackage {V : PotentialWellPackage} (B : BifurcationBranchPackage V) where
  kernelProjection : Type
  rangeProjection : Type
  reducedEquation : Prop
  bifurcationEquation : Prop
  solvabilityCondition : Prop

structure LyapunovSchmidtReductionEvidence {V : PotentialWellPackage} {B : BifurcationBranchPackage V}
    (L : LyapunovSchmidtReductionPackage B) where
  kernelProjectionClosed : True
  rangeProjectionClosed : True
  reducedEquationClosed : L.reducedEquation
  bifurcationEquationClosed : L.bifurcationEquation
  solvabilityConditionClosed : L.solvabilityCondition

def LyapunovSchmidtReductionClosed {V : PotentialWellPackage} {B : BifurcationBranchPackage V}
    (L : LyapunovSchmidtReductionPackage B) : Prop :=
  L.reducedEquation ∧ L.bifurcationEquation ∧ L.solvabilityCondition

theorem lyapunov_schmidt_reduction_closed_from_evidence
    {V : PotentialWellPackage} {B : BifurcationBranchPackage V}
    (L : LyapunovSchmidtReductionPackage B) (E : LyapunovSchmidtReductionEvidence L) :
    LyapunovSchmidtReductionClosed L := by
  exact And.intro E.reducedEquationClosed
    (And.intro E.bifurcationEquationClosed E.solvabilityConditionClosed)

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse