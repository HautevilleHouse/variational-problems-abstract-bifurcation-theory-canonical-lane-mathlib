import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean

structure LjusternikSchnirelmanCategoryPackage where
  topologicalSpace : Type u → Type v
  category : Type u → ℕ
  deformationLemma : Prop
  multiplicityEstimate : Prop

structure LjusternikSchnirelmanCategoryEvidence
    (L : LjusternikSchnirelmanCategoryPackage) where
  deformationLemmaClosed : L.deformationLemma
  multiplicityEstimateClosed : L.multiplicityEstimate

def LjusternikSchnirelmanCategoryClosed (L : LjusternikSchnirelmanCategoryPackage) : Prop :=
  L.deformationLemma ∧ L.multiplicityEstimate

theorem ljusternik_schnirelman_category_closed_from_evidence
    (L : LjusternikSchnirelmanCategoryPackage)
    (E : LjusternikSchnirelmanCategoryEvidence L) :
    LjusternikSchnirelmanCategoryClosed L := by
  exact And.intro E.deformationLemmaClosed E.multiplicityEstimateClosed

end VariationalProblemsAbstractBifurcationTheoryCanonicalLaneLean
end HautevilleHouse