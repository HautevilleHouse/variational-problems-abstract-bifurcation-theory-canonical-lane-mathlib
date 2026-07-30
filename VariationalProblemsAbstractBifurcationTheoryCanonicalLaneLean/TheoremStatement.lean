import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure BifurcationAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  bifurcationProblem : Prop
  conclusion : bifurcationProblem

def BifurcationWitnessClosed (O : BifurcationAdmittedObject) : Prop :=
  O.bifurcationProblem

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse
