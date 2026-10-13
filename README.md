# Multi-Valued Classical Action — Lean 4

<!-- ENUMINOUS-NETWORK:START -->
**eNuminous network:** [All repositories](https://enuminous.github.io/EFMW/repositories.html) · [EFMW](https://enuminous.github.io/EFMW/) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [165 triplets](https://enuminous.github.io/FieldSpace/) · [Zoo](https://enuminous.github.io/Tortoise/) · [Lean](https://enuminous.github.io/Aristotle-102-Monolithic-Lean/) · [Engine](https://enuminous.github.io/Archimedes-Engine/) · [Papers](https://enuminous.github.io/medium/papers-essays-index.html) · [Audit](https://github.com/enuminous/EFMW_Post156_Zoo_Audit/blob/main/portfolio/INTERLOCK_AUDIT.md)

[Repository](https://github.com/enuminous/MultiValuedClassicalAction-Lean4) · This repository is linked through its source; GitHub Pages is not enabled.

<details>
<summary>Recent repositories (9)</summary>

- [Oroboros](https://github.com/enuminous/Oroboros) · [README](https://github.com/enuminous/Oroboros/blob/main/README.md) · [Page](https://enuminous.github.io/Oroboros/)
- [P-NP](https://github.com/enuminous/P-NP) · [README](https://github.com/enuminous/P-NP/blob/main/README.md) · [Page](https://enuminous.github.io/P-NP/)
- [Research-Program](https://github.com/enuminous/Research-Program) · [README](https://github.com/enuminous/Research-Program/blob/main/README.md) · [Page](https://enuminous.github.io/Research-Program/)
- [I-Have-Guts](https://github.com/enuminous/I-Have-Guts) · [README](https://github.com/enuminous/I-Have-Guts/blob/main/README.md) · [Page](https://enuminous.github.io/I-Have-Guts/)
- [Wrights-Law](https://github.com/enuminous/Wrights-Law) · [README](https://github.com/enuminous/Wrights-Law/blob/main/README.md) · [Page](https://enuminous.github.io/Wrights-Law/)
- [Aristotle-eNuminous](https://github.com/enuminous/Aristotle-eNuminous) · [README](https://github.com/enuminous/Aristotle-eNuminous/blob/main/README.md) · [Page](https://enuminous.github.io/Aristotle-eNuminous/)
- [Multiverse-Simulator](https://github.com/enuminous/Multiverse-Simulator) · [README](https://github.com/enuminous/Multiverse-Simulator/blob/main/README.md) · [Page](https://enuminous.github.io/Multiverse-Simulator/)
- [accelerando-8192](https://github.com/enuminous/accelerando-8192) · [README](https://github.com/enuminous/accelerando-8192/blob/main/README.md) · [Page source](https://github.com/enuminous/accelerando-8192/blob/main/docs/index.html)
- [Codex-888](https://github.com/enuminous/Codex-888) · [README](https://github.com/enuminous/Codex-888/blob/main/README.md) · [Page](https://enuminous.github.io/Codex-888/)

</details>
<!-- ENUMINOUS-NETWORK:END -->

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
