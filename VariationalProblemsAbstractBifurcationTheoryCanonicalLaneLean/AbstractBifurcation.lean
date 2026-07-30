import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure AbstractBifurcationPackage where
  potential : Type u → Type v
  gradientMap : (potential X) → (X → X)
  linearizationAtCriticalPoint : Prop
  kernelStructure : Prop
  bifurcationEquation : Prop

def AbstractBifurcationClosed (A : AbstractBifurcationPackage) : Prop :=
  A.linearizationAtCriticalPoint ∧ A.kernelStructure ∧ A.bifurcationEquation

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse