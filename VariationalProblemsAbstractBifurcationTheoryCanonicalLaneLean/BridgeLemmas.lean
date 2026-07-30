import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BifurcationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse