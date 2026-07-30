import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure VariationalBifurcationAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  functional : space → ℝ
  parameter : Type v
  parameterTopology : TopologicalSpace parameter
  bifurcationPoint : parameter
  bifurcationBranch : Prop
  conclusion : bifurcationBranch

def VariationalBifurcationWitnessClosed (O : VariationalBifurcationAdmittedObject) : Prop :=
  O.bifurcationBranch

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse