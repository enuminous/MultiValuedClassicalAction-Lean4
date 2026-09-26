/-!
# Multi-Valued Classical Action: a minimal Lean 4 formalization

This file formalizes the logical skeleton of the research program described in
"Multi-Valued Classical Action and Quantum Interference" without claiming that
quantum mechanics has thereby been derived from classical mechanics.

The formalization separates:
* branch/action data,
* phase/amplitude data,
* coherent summation,
* normalization/probability assumptions,
* research obligations needed for a reconstruction claim.

No empirical validation, Bell result, Born-rule derivation, spin reconstruction,
or equivalence to quantum mechanics is asserted here.
-/

namespace MVCA

/-- Abstract real scalar type used for actions and nonnegative weights. -/
abbrev Scalar := Float

/-- A finite action branch. `action` represents S_n; `amplitude` represents A_n. -/
structure Branch where
  id : Nat
  action : Scalar
  amplitude : Scalar
  deriving Repr, DecidableEq

/-- A constrained system is represented by a finite family of admissible branches. -/
structure ConstrainedSystem where
  branches : List Branch
  hbar : Scalar
  hbar_ne_zero : hbar != 0.0
  deriving Repr

/-- A deliberately abstract complex amplitude.
    This keeps the core independent of a particular complex-number library. -/
structure ComplexAmp where
  re : Scalar
  im : Scalar
  deriving Repr, DecidableEq

namespace ComplexAmp

def zero : ComplexAmp := ⟨0.0, 0.0⟩

def add (a b : ComplexAmp) : ComplexAmp := ⟨a.re + b.re, a.im + b.im⟩

def normSq (z : ComplexAmp) : Scalar := z.re*z.re + z.im*z.im

end ComplexAmp

/-- A phase map is the formal placeholder for exp(i S / ħ).
    Its physical adequacy is an external proof obligation. -/
abbrev PhaseMap := Scalar → Scalar → ComplexAmp

/-- A branch-to-amplitude map. It may encode a proposed compression ratio. -/
abbrev CompressionMap := Branch → Scalar

/-- Coherent contribution of one branch. -/
def contribution (phase : PhaseMap) (compression : CompressionMap)
    (hbar : Scalar) (b : Branch) : ComplexAmp :=
  let p := phase b.action hbar
  let c := compression b
  ⟨c * b.amplitude * p.re, c * b.amplitude * p.im⟩

/-- Coherent sum over all admissible branches. -/
def coherentSum (phase : PhaseMap) (compression : CompressionMap)
    (sys : ConstrainedSystem) : ComplexAmp :=
  sys.branches.foldl
    (fun acc b => ComplexAmp.add acc (contribution phase compression sys.hbar b))
    ComplexAmp.zero

/-- Candidate observable density: squared magnitude of the coherent sum. -/
def candidateDensity (phase : PhaseMap) (compression : CompressionMap)
    (sys : ConstrainedSystem) : Scalar :=
  ComplexAmp.normSq (coherentSum phase compression sys)

/-- The source manuscript proposes normalized branch weights.
    Kept as an explicit assumption rather than silently derived. -/
def WeightNormalized (compression : CompressionMap) (sys : ConstrainedSystem) : Prop :=
  (sys.branches.map (fun b => let c := compression b; c*c)).foldl (· + ·) 0.0 == 1.0

/-- Research obligation: geometric constraints actually generate the asserted branch set. -/
structure GeometricBranchDerivation (sys : ConstrainedSystem) : Prop where
  branches_from_constraints : Prop
  proof_branches_from_constraints : branches_from_constraints

/-- Research obligation: compression/amplitude factors are derived from geometry/density,
    not fitted to the desired quantum answer. -/
structure CompressionDerivation (compression : CompressionMap)
    (sys : ConstrainedSystem) : Prop where
  geometry_determines_weights : Prop
  proof_geometry_determines_weights : geometry_determines_weights

/-- Research obligation: the phase map really implements the proposed action-phase relation. -/
structure PhaseAdequacy (phase : PhaseMap) (sys : ConstrainedSystem) : Prop where
  action_determines_phase : Prop
  proof_action_determines_phase : action_determines_phase

/-- A bounded reconstruction claim.  This intentionally does NOT say that quantum
    mechanics is false, probabilistic mechanics is eliminated, or nature is ontologically
    classical. -/
structure ReconstructionCertificate (phase : PhaseMap) (compression : CompressionMap)
    (sys : ConstrainedSystem) : Prop where
  geometry : GeometricBranchDerivation sys
  compressionDerived : CompressionDerivation compression sys
  phaseAdequate : PhaseAdequacy phase sys
  normalized : WeightNormalized compression sys

/-- The anti-circularity condition central to the research program:
    the target quantum distribution must not simply be supplied as an input to the
    compression/phase construction. -/
structure AntiCircularity : Prop where
  target_not_assumed : Prop
  proof_target_not_assumed : target_not_assumed

/-- Harder benchmark obligations identified for a full quantum reconstruction. -/
structure QuantumReconstructionProgram : Prop where
  interference : Prop
  tunneling : Prop
  boundStates : Prop
  scattering : Prop
  spin : Prop
  entanglement : Prop
  bellCorrelations : Prop
  contextuality : Prop
  bornRule : Prop
  measurement : Prop
  relativisticExtension : Prop

  interference_ok : interference
  tunneling_ok : tunneling
  boundStates_ok : boundStates
  scattering_ok : scattering
  spin_ok : spin
  entanglement_ok : entanglement
  bellCorrelations_ok : bellCorrelations
  contextuality_ok : contextuality
  bornRule_ok : bornRule
  measurement_ok : measurement
  relativisticExtension_ok : relativisticExtension

/-- Logical sanity check: a reconstruction certificate only certifies the assumptions
    explicitly contained in it. -/
theorem certificate_has_normalization
    (phase : PhaseMap) (compression : CompressionMap) (sys : ConstrainedSystem)
    (h : ReconstructionCertificate phase compression sys) :
    WeightNormalized compression sys := h.normalized

/-- Anti-circularity remains a separate obligation; it cannot be obtained merely from
    a reconstruction certificate. This theorem makes the intended dependency explicit. -/
theorem reconstruction_with_anticircularity
    (phase : PhaseMap) (compression : CompressionMap) (sys : ConstrainedSystem)
    (hR : ReconstructionCertificate phase compression sys)
    (hA : AntiCircularity) :
    ReconstructionCertificate phase compression sys ∧ AntiCircularity := ⟨hR, hA⟩

end MVCA
