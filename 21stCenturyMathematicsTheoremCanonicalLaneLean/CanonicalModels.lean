import 21stCenturyMathematicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace 21stCenturyMathematicsTheoremCanonicalLaneLean

structure CanonicalModelsPackage where
  standardModelIdentified : Prop
  deformationRetract : Prop
  localStructureClosed : Prop
  globalStructureClosed : Prop

structure CanonicalModelsEvidence (P : CanonicalModelsPackage) where
  standardModelIdentifiedClosed : P.standardModelIdentified
  deformationRetractClosed : P.deformationRetract
  localStructureClosedClosed : P.localStructureClosed
  globalStructureClosedClosed : P.globalStructureClosed

def CanonicalModelsClosed (P : CanonicalModelsPackage) : Prop :=
  P.standardModelIdentified ∧ P.deformationRetract ∧
  P.localStructureClosed ∧ P.globalStructureClosed

theorem canonical_models_closed_from_evidence (P : CanonicalModelsPackage)
    (E : CanonicalModelsEvidence P) : CanonicalModelsClosed P := by
  exact And.intro E.standardModelIdentifiedClosed
    (And.intro E.deformationRetractClosed
      (And.intro E.localStructureClosedClosed E.globalStructureClosedClosed))

end 21stCenturyMathematicsTheoremCanonicalLaneLean
end HautevilleHouse