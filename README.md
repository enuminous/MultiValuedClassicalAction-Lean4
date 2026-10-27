# Multi-Valued Classical Action — Lean 4

<!-- ENUMINOUS-UNIFIED-NAV:START -->
## Repository navigation

**eNuminous network:** [All public repositories](https://github.com/enuminous/EFMW/blob/main/REPOSITORY_NAVIGATION.md) · [EFMW](https://github.com/enuminous/EFMW) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [Frozen Lean](https://github.com/enuminous/Monolithic-102-Zoo-Lean4) · [Zoo](https://github.com/enuminous/Tortoise) · [Papers](https://github.com/enuminous/papers) · [Quantum geometry](https://github.com/enuminous/Base888-Quantum-Geometry)

**This project:** [Repository home](https://github.com/enuminous/MultiValuedClassicalAction-Lean4) · [Subject index](https://github.com/enuminous/EFMW/blob/main/REPOSITORY_NAVIGATION.md#lean-proofs-and-independent-audits)

<details open>
<summary><strong>On this page</strong></summary>

- [Status](#status)
- [Flat repository](#flat-repository)
- [Formalized objects](#formalized-objects)
- [Epistemic boundary](#epistemic-boundary)
- [Suggested benchmark sequence](#suggested-benchmark-sequence)
- [Build](#build)
- [Source provenance](#source-provenance)


</details>

**Related repositories:** [Aristotle-eNuminous](https://github.com/enuminous/Aristotle-eNuminous) · [Monolithic_Zoo_Run](https://github.com/enuminous/Monolithic_Zoo_Run) · [Aristotle-Ramtastic-Audit](https://github.com/enuminous/Aristotle-Ramtastic-Audit) · [Einsteinian-156-Aristotle](https://github.com/enuminous/Einsteinian-156-Aristotle) · [Monolithic_102_EFMW](https://github.com/enuminous/Monolithic_102_EFMW) · [EFMW](https://github.com/enuminous/EFMW)

> **Evidence boundary:** A link between projects is navigation, not an assertion of proven equivalence, experimental validation, or shared authorship. See each repository’s own status and review notes.
<!-- ENUMINOUS-UNIFIED-NAV:END -->


A **flat-stack** Lean 4 repository formalizing the logical skeleton of Matthew Chenoweth Wright's *Multi-Valued Classical Action and Quantum Interference* research program.

## Status

**Formal scaffold / research specification — not a proof of quantum mechanics from classical mechanics.**

The source paper proposes that constrained systems may admit multiple action branches, with phase factors tied to action and amplitude/compression factors tied to trajectory density. The coherent branch sum is then used to construct an interference density.

This repository deliberately separates that proposal into explicit objects and proof obligations so that future work cannot silently assume the quantum result it is intended to derive.

## Flat repository

```text
MultiValuedClassicalAction_Lean4/
├── MultiValuedClassicalAction.lean
├── README.md
├── lakefile.toml
└── lean-toolchain
```

## Formalized objects

- `Branch` — branch identifier, classical action `S_n`, amplitude.
- `ConstrainedSystem` — finite admissible branch family and nonzero `ħ`.
- `PhaseMap` — abstract placeholder for the proposed `exp(iS/ħ)` relation.
- `CompressionMap` — branch weighting/compression map.
- `coherentSum` — coherent sum over branches.
- `candidateDensity` — squared magnitude of the coherent sum.
- `WeightNormalized` — explicit normalization assumption.
- `GeometricBranchDerivation` — obligation that geometry really produces the branches.
- `CompressionDerivation` — obligation that weights come from geometry/density rather than fitting.
- `PhaseAdequacy` — obligation connecting action and phase.
- `ReconstructionCertificate` — bounded certificate collecting those obligations.
- `AntiCircularity` — explicit no-target-leakage condition.
- `QuantumReconstructionProgram` — benchmark obligations for interference, tunneling, bound states, scattering, spin, entanglement, Bell correlations, contextuality, Born rule, measurement, and relativistic extension.

## Epistemic boundary

This repo **does not formalize as established facts** the source manuscript's stronger claims that probabilistic quantum mechanics has been eliminated, that the proposed construction is empirically validated at 12.86 sigma, or that a complete equivalence with quantum mechanics has been proved. Those require derivations and empirical/statistical evidence beyond the supplied manuscript.

The central formal research question is:

> Can quantum mechanics be reconstructed from constrained, multi-valued action dynamics without inserting the target quantum amplitudes or probabilities by hand?

## Suggested benchmark sequence

`interference → oscillator/bound states → tunneling → scattering → spin → entanglement/Bell → contextuality → Born rule/measurement → relativistic theory`

At every stage, test anti-circularity: **does the action construction independently generate the quantum structure, or has the desired quantum structure entered as an assumption?**

## Build

Install Lean via `elan`, then from the repository root:

```bash
lake build
```

## Source provenance

Based on the user-supplied manuscript *Multi-Valued Classical Action and Quantum Interference*, originally attributed there to Matthew Chenoweth Wright and dated January 19, 2025. The manuscript itself discusses prior work by Winfried Lohmiller and Jean-Jacques Slotine; this repository makes no independent priority determination.
