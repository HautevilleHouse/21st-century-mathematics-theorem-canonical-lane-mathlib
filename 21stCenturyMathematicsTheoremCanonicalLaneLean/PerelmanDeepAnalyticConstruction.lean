import PoincareConjectureCanonicalLaneLean.PerelmanFoundationalTheoremInhabitants

/-!
# Perelman Deep Analytic Construction

This module refines the foundational inhabitants into a deeper analytic
construction interface. The construction names the Ricci-flow, curvature,
entropy, noncollapsing, singularity, surgery, geometrization, and endpoint
ingredients that feed the already checked Perelman route.

The module is intentionally term-level: each analytic construction supplies
Lean inhabitants for its named analytic components and maps them into the
foundational theorem inhabitants used by the route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureTensorConstruction where
  metricCompatibility : Prop
  torsionFreeConnection : Prop
  curvatureCommutatorFormula : Prop
  skewSymmetryDerived : Prop
  pairSymmetryDerived : Prop
  firstBianchiDerived : Prop
  ricciTraceDerived : Prop
  scalarTraceDerived : Prop
  curvatureEvolutionDerived : Prop
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  metricCompatibilityTerm : metricCompatibility
  torsionFreeConnectionTerm : torsionFreeConnection
  curvatureCommutatorFormulaTerm : curvatureCommutatorFormula
  skewSymmetryDerivedTerm : skewSymmetryDerived
  pairSymmetryDerivedTerm : pairSymmetryDerived
  firstBianchiDerivedTerm : firstBianchiDerived
  ricciTraceDerivedTerm : ricciTraceDerived
  scalarTraceDerivedTerm : scalarTraceDerived
  curvatureEvolutionDerivedTerm : curvatureEvolutionDerived
  riemannTensorSymmetriesFromConstruction :
    metricCompatibility -> torsionFreeConnection -> curvatureCommutatorFormula ->
      skewSymmetryDerived -> pairSymmetryDerived -> riemannTensorSymmetries
  bianchiIdentitiesFromConstruction :
    curvatureCommutatorFormula -> firstBianchiDerived -> bianchiIdentities
  ricciContractionLawFromConstruction :
    curvatureCommutatorFormula -> ricciTraceDerived -> ricciContractionLaw
  scalarTraceLawFromConstruction :
    ricciTraceDerived -> scalarTraceDerived -> scalarTraceLaw
  curvatureEvolutionInputsFromConstruction :
    curvatureCommutatorFormula -> curvatureEvolutionDerived -> curvatureEvolutionInputs

def CurvatureTensorConstruction.toFoundational
    (C : CurvatureTensorConstruction) : CurvatureFoundationalInhabitants := {
  riemannTensorSymmetries := C.riemannTensorSymmetries
  bianchiIdentities := C.bianchiIdentities
  ricciContractionLaw := C.ricciContractionLaw
  scalarTraceLaw := C.scalarTraceLaw
  curvatureEvolutionInputs := C.curvatureEvolutionInputs
  riemannTensorSymmetriesTerm :=
    C.riemannTensorSymmetriesFromConstruction
      C.metricCompatibilityTerm
      C.torsionFreeConnectionTerm
      C.curvatureCommutatorFormulaTerm
      C.skewSymmetryDerivedTerm
      C.pairSymmetryDerivedTerm
  bianchiIdentitiesTerm :=
    C.bianchiIdentitiesFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.firstBianchiDerivedTerm
  ricciContractionLawTerm :=
    C.ricciContractionLawFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.ricciTraceDerivedTerm
  scalarTraceLawTerm :=
    C.scalarTraceLawFromConstruction
      C.ricciTraceDerivedTerm
      C.scalarTraceDerivedTerm
  curvatureEvolutionInputsTerm :=
    C.curvatureEvolutionInputsFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.curvatureEvolutionDerivedTerm
}

structure RicciFlowWithSurgeryConstruction where
  smoothInitialMetric : Prop
  deTurckGaugeFixed : Prop
  linearizationComputed : Prop
  stronglyParabolicOperator : Prop
  deTurckVectorFieldConstructed : Prop
  pullbackEquationComputed : Prop
  uniquenessEstimate : Prop
  cutoffScaleChosen : Prop
  standardCapGeometryBuilt : Prop
  postSurgeryCurvatureEstimate : Prop
  noncollapsingTransferAcrossSurgery : Prop
  inductionAcrossSurgeryTimes : Prop
  hamiltonDeTurckGaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  cutoffParametersChosen : Prop
  standardCapInserted : Prop
  postSurgeryCurvatureControlled : Prop
  noncollapsingPreservedThroughSurgery : Prop
  surgeryInductionContinues : Prop
  smoothInitialMetricTerm : smoothInitialMetric
  deTurckGaugeFixedTerm : deTurckGaugeFixed
  linearizationComputedTerm : linearizationComputed
  stronglyParabolicOperatorTerm : stronglyParabolicOperator
  deTurckVectorFieldConstructedTerm : deTurckVectorFieldConstructed
  pullbackEquationComputedTerm : pullbackEquationComputed
  uniquenessEstimateTerm : uniquenessEstimate
  cutoffScaleChosenTerm : cutoffScaleChosen
  standardCapGeometryBuiltTerm : standardCapGeometryBuilt
  postSurgeryCurvatureEstimateTerm : postSurgeryCurvatureEstimate
  noncollapsingTransferAcrossSurgeryTerm : noncollapsingTransferAcrossSurgery
  inductionAcrossSurgeryTimesTerm : inductionAcrossSurgeryTimes
  gaugeChoiceFromConstruction :
    smoothInitialMetric -> deTurckGaugeFixed -> hamiltonDeTurckGaugeChoice
  parabolicReductionFromConstruction :
    linearizationComputed -> stronglyParabolicOperator -> stronglyParabolicReduction
  deTurckVectorFieldFromConstruction :
    deTurckVectorFieldConstructed -> deTurckVectorField
  pullbackRecoversFromConstruction :
    pullbackEquationComputed -> deTurckVectorField -> pullbackRecoversRicciFlow
  uniquenessFromConstruction :
    uniquenessEstimate -> pullbackRecoversRicciFlow -> uniquenessCompatibility
  cutoffFromConstruction :
    cutoffScaleChosen -> cutoffParametersChosen
  capInsertedFromConstruction :
    standardCapGeometryBuilt -> cutoffParametersChosen -> standardCapInserted
  postSurgeryFromConstruction :
    postSurgeryCurvatureEstimate -> standardCapInserted -> postSurgeryCurvatureControlled
  noncollapsingTransferFromConstruction :
    noncollapsingTransferAcrossSurgery -> postSurgeryCurvatureControlled -> noncollapsingPreservedThroughSurgery
  inductionFromConstruction :
    inductionAcrossSurgeryTimes -> noncollapsingPreservedThroughSurgery -> surgeryInductionContinues

def RicciFlowWithSurgeryConstruction.toFoundational
    (R : RicciFlowWithSurgeryConstruction) : RicciFlowSurgeryFoundationalInhabitants :=
  let dtf := R.deTurckVectorFieldFromConstruction R.deTurckVectorFieldConstructedTerm
  let prf := R.pullbackRecoversFromConstruction R.pullbackEquationComputedTerm dtf
  let uf := R.uniquenessFromConstruction R.uniquenessEstimateTerm prf
  let cpf := R.cutoffFromConstruction R.cutoffScaleChosenTerm
  let capf := R.capInsertedFromConstruction R.standardCapGeometryBuiltTerm cpf
  let psf := R.postSurgeryFromConstruction R.postSurgeryCurvatureEstimateTerm capf
  let nctf := R.noncollapsingTransferFromConstruction R.noncollapsingTransferAcrossSurgeryTerm psf
  let indf := R.inductionFromConstruction R.inductionAcrossSurgeryTimesTerm nctf
  {
    hamiltonDeTurckGaugeChoice := R.hamiltonDeTurckGaugeChoice
    stronglyParabolicReduction := R.stronglyParabolicReduction
    deTurckVectorField := R.deTurckVectorField
    pullbackRecoversRicciFlow := R.pullbackRecoversRicciFlow
    uniquenessCompatibility := R.uniquenessCompatibility
    cutoffParametersChosen := R.cutoffParametersChosen
    standardCapInserted := R.standardCapInserted
    postSurgeryCurvatureControlled := R.postSurgeryCurvatureControlled
    noncollapsingPreservedThroughSurgery := R.noncollapsingPreservedThroughSurgery
    surgeryInductionContinues := R.surgeryInductionContinues
    hamiltonDeTurckGaugeChoiceTerm :=
      R.gaugeChoiceFromConstruction R.smoothInitialMetricTerm R.deTurckGaugeFixedTerm
    stronglyParabolicReductionTerm :=
      R.parabolicReductionFromConstruction R.linearizationComputedTerm R.stronglyParabolicOperatorTerm
    deTurckVectorFieldTerm := dtf
    pullbackRecoversRicciFlowTerm := prf
    uniquenessCompatibilityTerm := uf
    cutoffParametersChosenTerm := cpf
    standardCapInsertedTerm := capf
    postSurgeryCurvatureControlledTerm := psf
    noncollapsingPreservedThroughSurgeryTerm := nctf
    surgeryInductionContinuesTerm := indf
  }

structure EntropyConstruction where
  entropyFunctionalExists : Prop
  reducedLengthExists : Prop
  reducedVolumeExists : Prop
  entropyMonotonicity : Prop
  logSobolevInequality : Prop
  entropyDissipationEstimate : Prop
  entropySurgeryCompatibility : Prop
  entropyFunctionalExistsTerm : entropyFunctionalExists
  reducedLengthExistsTerm : reducedLengthExists
  reducedVolumeExistsTerm : reducedVolumeExists
  entropyMonotonicityTerm : entropyMonotonicity
  logSobolevInequalityTerm : logSobolevInequality
  entropyDissipationEstimateTerm : entropyDissipationEstimate
  entropySurgeryCompatibilityTerm : entropySurgeryCompatibility
  monotonicityFromFunctionals :
    entropyFunctionalExists -> reducedLengthExists -> reducedVolumeExists -> entropyMonotonicity
  logSobolevFromFunctional :
    entropyFunctionalExists -> logSobolevInequality
  dissipationFromMonotonicity :
    entropyMonotonicity -> entropyDissipationEstimate
  surgeryCompatibilityFromReducedVolume :
    reducedVolumeExists -> entropySurgeryCompatibility

def EntropyConstruction.toFoundational
    (E : EntropyConstruction) : EntropyFoundationalInhabitants :=
  let mon := E.monotonicityFromFunctionals E.entropyFunctionalExistsTerm E.reducedLengthExistsTerm E.reducedVolumeExistsTerm
  let dis := E.dissipationFromMonotonicity mon
  let sc := E.surgeryCompatibilityFromReducedVolume E.reducedVolumeExistsTerm
  {
    entropyMonotonicity := E.entropyMonotonicity
    logSobolevInequality := E.logSobolevInequality
    entropyDissipationEstimate := E.entropyDissipationEstimate
    entropySurgeryCompatibility := E.entropySurgeryCompatibility
    entropyMonotonicityTerm := mon
    logSobolevInequalityTerm := E.logSobolevFromFunctional E.entropyFunctionalExistsTerm
    entropyDissipationEstimateTerm := dis
    entropySurgeryCompatibilityTerm := sc
  }

structure NoncollapsingConstruction where
  localNoncollapsing : Prop
  volumeLowerBound : Prop
  curvatureScaleDefined : Prop
  kappaNoncollapsing : Prop
  localNoncollapsingTerm : localNoncollapsing
  volumeLowerBoundTerm : volumeLowerBound
  curvatureScaleDefinedTerm : curvatureScaleDefined
  kappaNoncollapsingTerm : kappaNoncollapsing
  kappaFromLocalVolume :
    localNoncollapsing -> volumeLowerBound -> kappaNoncollapsing

def NoncollapsingConstruction.toFoundational
    (N : NoncollapsingConstruction) : NoncollapsingFoundationalInhabitants :=
  {
    kappaNoncollapsing := N.kappaNoncollapsing
    kappaNoncollapsingTerm :=
      N.kappaFromLocalVolume N.localNoncollapsingTerm N.volumeLowerBoundTerm
  }

structure SingularityConstruction where
  singularityModelsClassified : Prop
  ancientSolutionsAnalyzed : Prop
  gradientShrinkingSolitons : Prop
  canonicalNeighborhoods : Prop
  singularityModelsClassifiedTerm : singularityModelsClassified
  ancientSolutionsAnalyzedTerm : ancientSolutionsAnalyzed
  gradientShrinkingSolitonsTerm : gradientShrinkingSolitons
  canonicalNeighborhoodsTerm : canonicalNeighborhoods
  solitonsFromAncient :
    ancientSolutionsAnalyzed -> gradientShrinkingSolitons
  neighborhoodsFromModels :
    singularityModelsClassified -> canonicalNeighborhoods

def SingularityConstruction.toFoundational
    (S : SingularityConstruction) : SingularityFoundationalInhabitants :=
  {
    gradientShrinkingSolitons := S.gradientShrinkingSolitons
    canonicalNeighborhoods := S.canonicalNeighborhoods
    gradientShrinkingSolitonsTerm :=
      S.solitonsFromAncient S.ancientSolutionsAnalyzedTerm
    canonicalNeighborhoodsTerm :=
      S.neighborhoodsFromModels S.singularityModelsClassifiedTerm
  }

structure SurgeryConstruction where
  surgeryParametersChosen : Prop
  surgeryPerformed : Prop
  curvatureControlAfterSurgery : Prop
  topologyChangeControlled : Prop
  surgeryParametersChosenTerm : surgeryParametersChosen
  surgeryPerformedTerm : surgeryPerformed
  curvatureControlAfterSurgeryTerm : curvatureControlAfterSurgery
  topologyChangeControlledTerm : topologyChangeControlled
  controlFromPerformed :
    surgeryPerformed -> curvatureControlAfterSurgery
  topologyFromParameters :
    surgeryParametersChosen -> surgeryPerformed -> topologyChangeControlled

def SurgeryConstruction.toFoundational
    (S : SurgeryConstruction) : SurgeryFoundationalInhabitants :=
  let ctrl := S.controlFromPerformed S.surgeryPerformedTerm
  let topo := S.topologyFromParameters S.surgeryParametersChosenTerm S.surgeryPerformedTerm
  {
    curvatureControlAfterSurgery := S.curvatureControlAfterSurgery
    topologyChangeControlled := S.topologyChangeControlled
    curvatureControlAfterSurgeryTerm := ctrl
    topologyChangeControlledTerm := topo
  }

structure GeometrizationConstruction where
  primeDecomposition : Prop
  geometricDecomposition : Prop
  seifertFiberedParts : Prop
  hyperbolicParts : Prop
  primeDecompositionTerm : primeDecomposition
  geometricDecompositionTerm : geometricDecomposition
  seifertFiberedPartsTerm : seifertFiberedParts
  hyperbolicPartsTerm : hyperbolicParts
  decompositionFromPrime :
    primeDecomposition -> geometricDecomposition
  seifertFromDecomposition :
    geometricDecomposition -> seifertFiberedParts
  hyperbolicFromDecomposition :
    geometricDecomposition -> hyperbolicParts

def GeometrizationConstruction.toFoundational
    (G : GeometrizationConstruction) : GeometrizationFoundationalInhabitants :=
  let geom := G.decompositionFromPrime G.primeDecompositionTerm
  {
    geometricDecomposition := G.geometricDecomposition
    seifertFiberedParts := G.seifertFiberedParts
    hyperbolicParts := G.hyperbolicParts
    geometricDecompositionTerm := geom
    seifertFiberedPartsTerm := G.seifertFromDecomposition geom
    hyperbolicPartsTerm := G.hyperbolicFromDecomposition geom
  }

structure EndpointConstruction where
  extinctionTime : Prop
  finalTimeAnalysis : Prop
  topologicalConclusion : Prop
  extinctionTimeTerm : extinctionTime
  finalTimeAnalysisTerm : finalTimeAnalysis
  topologicalConclusionTerm : topologicalConclusion
  conclusionFromAnalysis :
    finalTimeAnalysis -> topologicalConclusion

def EndpointConstruction.toFoundational
    (E : EndpointConstruction) : EndpointFoundationalInhabitants :=
  {
    topologicalConclusion := E.topologicalConclusion
    topologicalConclusionTerm := E.conclusionFromAnalysis E.finalTimeAnalysisTerm
  }

structure PerelmanDeepAnalyticConstruction where
  curvature : CurvatureTensorConstruction
  ricciFlow : RicciFlowWithSurgeryConstruction
  entropy : EntropyConstruction
  noncollapsing : NoncollapsingConstruction
  singularity : SingularityConstruction
  surgery : SurgeryConstruction
  geometrization : GeometrizationConstruction
  endpoint : EndpointConstruction

def PerelmanDeepAnalyticConstruction.toFoundational
    (P : PerelmanDeepAnalyticConstruction) : PerelmanFoundationalInhabitants :=
  {
    curvature := P.curvature.toFoundational
    ricciFlow := P.ricciFlow.toFoundational
    entropy := P.entropy.toFoundational
    noncollapsing := P.noncollapsing.toFoundational
    singularity := P.singularity.toFoundational
    surgery := P.surgery.toFoundational
    geometrization := P.geometrization.toFoundational
    endpoint := P.endpoint.toFoundational
  }

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse