import TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CenturyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean
end HautevilleHouse