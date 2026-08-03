import TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : CenturyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CenturyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean
end HautevilleHouse