import PoincareConjectureCanonicalLaneLean.PerelmanAnalyticProof

/-!
# Perelman Analytic Evidence Terms

This module exposes the proof terms carried by each analytic certificate. The
route is term-level: every analytic field has a named Lean term, and those terms
project into the Perelman route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) where
  riemannTensorSymmetries : C.riemannTensorSymmetries
  bianchiIdentities : C.bianchiIdentities
  ricciContractionLaw : C.ricciContractionLaw
  scalarTraceLaw : C.scalarTraceLaw
  curvatureEvolutionInputs : C.curvatureEvolutionInputs
  curvatureClosed : RiemannianCurvatureClosed G

def CurvatureAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : CurvatureAnalyticEvidenceTerms C := by
  {
    riemannTensorSymmetries := C.riemannTensorSymmetriesClosed
    bianchiIdentities := C.bianchiIdentitiesClosed
    ricciContractionLaw := C.ricciContractionLawClosed
    scalarTraceLaw := C.scalarTraceLawClosed
    curvatureEvolutionInputs := C.curvatureEvolutionInputsClosed
    curvatureClosed := riemannian_curvature_closed_from_evidence G C.curvatureEvidence
  }

structure HamiltonDeTurckEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) where
  gaugeChoice : H.gaugeChoice
  stronglyParabolicReduction : H.stronglyParabolicReduction
  deTurckVectorField : H.deTurckVectorField
  pullbackRecoversRicciFlow : H.pullbackRecoversRicciFlow
  uniquenessCompatibility : H.uniquenessCompatibility
  flowClosed : RicciFlowPDEClosed F

def HamiltonDeTurckCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckEvidenceTerms H := by
  {
    gaugeChoice := H.gaugeChoiceClosed
    stronglyParabolicReduction := H.stronglyParabolicReductionClosed
    deTurckVectorField := H.deTurckVectorFieldClosed
    pullbackRecoversRicciFlow := H.pullbackRecoversRicciFlowClosed
    uniquenessCompatibility := H.uniquenessCompatibilityClosed
    flowClosed := ricci_flow_pde_closed_from_evidence F H.flowEvidence
  }

structure ShortTimeEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) where
  parabolicRegularity : C.parabolicRegularity
  localExistenceInterval : C.localExistenceInterval
  uniquenessOnOverlap : C.uniquenessOnOverlap
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : ShortTimeEvidenceTerms C := by
  {
    parabolicRegularity := C.parabolicRegularityClosed
    localExistenceInterval := C.localExistenceIntervalClosed
    uniquenessOnOverlap := C.uniquenessOnOverlapClosed
    continuationCriterion := C.continuationCriterionClosed
    shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
  }

structure EntropyEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) where
  conjugateHeatEquation : C.conjugateHeatEquation
  wFunctionalDefined : C.wFunctionalDefined
  muFunctionalDefined : C.muFunctionalDefined
  entropyMonotonicityFormula : C.entropyMonotonicityFormula
  reducedVolumeMonotonicity : C.reducedVolumeMonotonicity
  entropyClosed : PerelmanEntropyClosed E

def EntropyAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) :
    EntropyEvidenceTerms C := by
  {
    conjugateHeatEquation := C.conjugateHeatEquationClosed
    wFunctionalDefined := C.wFunctionalDefinedClosed
    muFunctionalDefined := C.muFunctionalDefinedClosed
    entropyMonotonicityFormula := C.entropyMonotonicityFormulaClosed
    reducedVolumeMonotonicity := C.reducedVolumeMonotonicityClosed
    entropyClosed := perelman_entropy_closed_from_evidence E C.entropyEvidence
  }

structure NoncollapsingEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) where
  noLocalCollapsing : C.noLocalCollapsing
  scaleInvariantVolumeLowerBound : C.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility : C.curvatureScaleCompatibility
  ancientSolutionCompactnessInput : C.ancientSolutionCompactnessInput
  noncollapsingClosed : NoncollapsingClosed N

def NoncollapsingAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : NoncollapsingEvidenceTerms C := by
  {
    noLocalCollapsing := C.noLocalCollapsingClosed
    scaleInvariantVolumeLowerBound := C.scaleInvariantVolumeLowerBoundClosed
    curvatureScaleCompatibility := C.curvatureScaleCompatibilityClosed
    ancientSolutionCompactnessInput := C.ancientSolutionCompactnessInputClosed
    noncollapsingClosed := noncollapsing_closed_from_evidence N C.noncollapsingEvidence
  }

structure CanonicalNeighborhoodEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {C : CanonicalNeighborhoodPackage N} (C' : CanonicalNeighborhoodAnalyticCertificate C) where
  scalarCurvatureScale : C'.scalarCurvatureScale
  localVolumeBounded : C'.localVolumeBounded
  canonicalNeighborhoodModel : C'.canonicalNeighborhoodModel
  pinchingControlled : C'.pinchingControlled
  canonicalNeighborhoodClosed : CanonicalNeighborhoodClosed C

def CanonicalNeighborhoodAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {C : CanonicalNeighborhoodPackage N} (C' : CanonicalNeighborhoodAnalyticCertificate C) :
    CanonicalNeighborhoodEvidenceTerms C' := by
  {
    scalarCurvatureScale := C'.scalarCurvatureScaleClosed
    localVolumeBounded := C'.localVolumeBoundedClosed
    canonicalNeighborhoodModel := C'.canonicalNeighborhoodModelClosed
    pinchingControlled := C'.pinchingControlledClosed
    canonicalNeighborhoodClosed := canonical_neighborhood_closed_from_evidence C C'.canonicalNeighborhoodEvidence
  }

structure SurgeryEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {C : CanonicalNeighborhoodPackage N} {Sur : SurgeryPackage C}
    (C' : SurgeryAnalyticCertificate Sur) where
  surgeryTimeSet : C'.surgeryTimeSet
  neckGeometry : C'.neckGeometry
  surgeryProcedure : C'.surgeryProcedure
  volumeReductionLowerBound : C'.volumeReductionLowerBound
  afterSurgeryCurvatureBounded : C'.afterSurgeryCurvatureBounded
  surgeryClosed : SurgeryClosed Sur

def SurgeryAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {C : CanonicalNeighborhoodPackage N} {Sur : SurgeryPackage C}
    (C' : SurgeryAnalyticCertificate Sur) : SurgeryEvidenceTerms C' := by
  {
    surgeryTimeSet := C'.surgeryTimeSetClosed
    neckGeometry := C'.neckGeometryClosed
    surgeryProcedure := C'.surgeryProcedureClosed
    volumeReductionLowerBound := C'.volumeReductionLowerBoundClosed
    afterSurgeryCurvatureBounded := C'.afterSurgeryCurvatureBoundedClosed
    surgeryClosed := surgery_closed_from_evidence Sur C'.surgeryEvidence
  }

structure AncientSolutionEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {A : AncientSolutionPackage N} (C : AncientSolutionAnalyticCertificate A) where
  ancientCompleteness : C.ancientCompleteness
  scalarCurvatureNonnegative : C.scalarCurvatureNonnegative
  eternalSelfsimilarModel : C.eternalSelfsimilarModel
  gradientSolitionStructure : C.gradientSolitionStructure
  ancientSolutionClosed : AncientSolutionClosed A

def AncientSolutionAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {A : AncientSolutionPackage N} (C : AncientSolutionAnalyticCertificate A) :
    AncientSolutionEvidenceTerms C := by
  {
    ancientCompleteness := C.ancientCompletenessClosed
    scalarCurvatureNonnegative := C.scalarCurvatureNonnegativeClosed
    eternalSelfsimilarModel := C.eternalSelfsimilarModelClosed
    gradientSolitionStructure := C.gradientSolitionStructureClosed
    ancientSolutionClosed := ancient_solution_closed_from_evidence A C.ancientSolutionEvidence
  }

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse