import TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean

def ConstrainedCenturyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_century_endgame (A : AdmissibleClass) :
    ConstrainedCenturyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end TwentyFirstCenturyMathematicsTheoremCanonicalLaneLean
end HautevilleHouse