# Reproducible Lean verification

Use the committed toolchain and dependency manifest. The workflow restores
applicable caches, builds the configured library, and audits every safe
declaration defined in the project modules listed in `Audit.lean`, including
private declarations. The permitted axioms are `propext`, `Classical.choice`, and `Quot.sound`.

```sh
lake build
lake env lean -DwarningAsError=true Audit.lean
python3 scripts/test_axiom_audit.py
```

The rejection controls inject a public axiom, private axiom and placeholder proof
and require the audit to fail for the intended reason.
Native proof evaluation is also rejected.

The successful job summary records the exact commit and workflow run. Source
declarations and hypotheses determine the mathematical scope; a successful
build does not validate a broader empirical or scientific interpretation.

## Type corrections exposed by compilation

The original `Prop`-valued records attempted to store propositions as data,
which Lean rejects. The research obligations are now explicit proposition
parameters, and their evidence remains in `Prop`. The larger program separates
its proposition-data record from its proof record. The two existing projection
results now quantify those obligations explicitly; none is discharged or
claimed as a physical derivation. Unsupported `DecidableEq` derivation for
Float-containing records was removed; Float Boolean comparison is not silently
substituted for propositional equality.
