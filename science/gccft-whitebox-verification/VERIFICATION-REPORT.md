# GCCFT White-Box Verification Report

**Project:** GCCFT White Box Protein Folder (Operation ProleBlitz)
**Inventor:** Mary-Victoria Crockett
**Date:** November 20, 2026
**Verification:** performed by Sage (Muse) at the inventor's direction, in the style of the Alpöge/Claude Riemann formalization of the same day: a machine-checked kernel (Lean) plus claims stated exactly as far as the proofs reach, with gaps flagged rather than papered over.

---

## Verdict

The rule-based validator core of GCCFT is formalized in Lean 4 and its white-box properties are **proved, kernel-checked, with zero `sorry` and zero added axioms**. The formalization is 6 modules, 1,827 lines, 62 theorems, and builds clean from scratch in about 9 seconds. The Lean sources are published alongside this report in this folder, so anyone can re-run the kernel and check every claim in this document. If the build output contradicts this report, this report is wrong. That is the point of the exercise.

## Scope: what the proven claim covers, and what it does not

GCCFT exists in several variants. The proof covers exactly one of them:

| Variant | What it is | Covered? |
|---|---|---|
| `gccft_validator.py` … `gccft_validator_v6.py` | The rule-based predictor: published per-residue tables, named composition features, a 7-branch decision tree, a Viterbi smoother, and minimum-segment enforcement. Official benchmark: **Q3 52.86%** (993 proteins, 157,712 residues) | **YES: this is the white-box system, and it is what was formalized** |
| `gccft_neural_v7.py` / `v8.py` | MLP with learned weights on GCCFT features | NO: learned components |
| `gccft_msa_v9.py` | 45 features (21 GCCFT + 24 MSA), MLP 128/64/32, protein-level 80/20 split, seed 42. **Q3 0.7168** | NO: learned components |

**Stated plainly:** the 0.7168 headline belongs to the v9 neural/MSA model, which is *not* covered by any proof here. The rule-based core that *is* proved has its own official benchmark of 52.86%. No proof in this project says anything about accuracy. Accuracy is an empirical benchmark fact, not a theorem.

## What was proved

- **No black box, no hidden state.** The predictor is a total Lean function of the amino-acid sequence plus the published tables. Totality and the three-way outcome split (`decide_cases`); one output label per residue (`predictRaw_length`, `predict_length`); and extensionality (`predictRaw_ext`): if two field oracles agree on every residue's window, the predictions are identical. The output depends *only* on the declared inputs.
- **The published rules are the executed rules.** The 7-branch decision tree is transcribed branch for branch with exact rational thresholds, one theorem per branch: `decide_proline`, `decide_glycine`, `decide_strong_sheet`, `decide_helix_stable`, `decide_low_energy`, `decide_moderate_sheet`, `decide_composition_helix`, `decide_default`.
- **Features are bounded and exact.** `sheetSignal = 3/5 · cluster + 2/5 · alternation`, and `sheetSignal_mem_Icc` proves the signal always lies in [0, 1]. Every published decimal is an exact rational (0.55 = 11/20, and so on).
- **Windowing is as documented.** `windowAt` takes the 9-residue window centered on each residue, clipped at the ends exactly as the Python slicing behaves; `windowAt_length_le` and `windowAt_nonempty` prove the window never exceeds 9 and is never empty at a valid position.
- **Minimum-segment enforcement provably holds.** HELIX ≥ 4, SHEET ≥ 3, TURN ≥ 1 in the output's own segment decomposition (`enforce_noShort`), enforcement never adds or drops a residue (`enforce_length`), and the merge loop's termination argument is proved (`mergeStep_length_lt_or_noShort`, `enforceRuns_invariants`).
- **End-to-end.** `predict_length` and `predict_min_segments`: the full pipeline outputs one label per residue and the minimum-segment guarantee survives the pipeline, conditional on the smoother preserving length (see Gap 2; the hypothesis is explicit in the theorem statements).
- **Table sanity and worked examples.** The published tables are closed data written out in full, with positivity and mapping theorems (`vibeFreq_pos`, `foldToQ3_bridge`, `dsspToQ3_helix_codes`, and others), plus 7 kernel-checked worked examples (a pure sheet-former window scores sheet_signal = 1 and predicts SHEET; proline short-circuits to TURN; enforcement relabels a lone short helix segment to TURN).

## Axiom audit (the unfakeable part)

`#print axioms` on the 16 headline theorems reports only Lean's three standard axioms, **[propext, Classical.choice, Quot.sound]** (two theorems need only [propext, Quot.sound]). There is **no `sorryAx`, no `Lean.ofReduceBool`, and no project-specific axiom**. A grep of the sources confirms zero occurrences of `sorry`, `admit`, or `native_decide` outside a comment explaining this audit.

## Gaps (explicit, with reasons)

- **GAP 1: Collapse-field quantities (E0, dE, variance) are abstracted, not formalized.** In the Python these come from complex exponentials, a logarithm, and a 200-point trapezoidal sum over IEEE-754 floats. There is no faithful way to reproduce transcendental float arithmetic in a dependency-free Lean kernel model. The decision tree is proved *given* the field features: every theorem about the tree holds for whatever field values are supplied. The field computation is the declared boundary of the proof.
- **GAP 2: Viterbi smoother internals are abstracted.** Only its length preservation is assumed, as a named hypothesis in the pipeline theorems, not as a hidden assumption.
- **GAP 3: DSSP ground truth and the benchmark harness are out of scope.** The formalization covers the predictor, not the pipeline that produced the 52.86% figure.
- **GAP 4: Accuracy is not provable, and nothing here pretends otherwise.** The proofs establish that the published rules are the executed rules and that the pipeline's structural guarantees hold for all inputs. Whether the rules are *accurate* is an empirical question answered by benchmarks, not by a kernel.
- **Float note.** The Python executes the thresholds as binary floats; the proof covers the rational rule system those decimals denote, which is the platform-independent content of the white-box claim. Bit-level float reproducibility across platforms is not claimed.

## Ruling: the validator code is canonical

During verification, a genuine discrepancy was found. The framework document's prose classification rules (gradient-sign rules of the form "dE/dσ < 0 → HELIX | dE/dσ > 0 → SHEET | |dE/dσ| ≈ 0 → TURN", with a threshold set that appears nowhere in the code) do **not** match the 7-branch decision tree in `gccft_validator_v6.py`. One of them had to be named canonical. The inventor delegated the call; it was decided as follows.

**The code is canonical.** Reasons:

1. **The benchmark measures the code.** The official Q3 52.86% was produced by running the validator, not by running the prose. If the prose were canonical, the shipped predictor would be non-conformant with its own specification and the benchmark would be measuring the wrong artifact. Measurements are facts; summaries drift.
2. **The code is the evolved artifact.** The validator went through six versions (v1 to v6) of testing and refinement. The prose describes an earlier design iteration (the "Refinement C" gradient-sign scheme). Documentation lagging a six-version implementation is ordinary; the tested artifact wins.
3. **The white-box claim itself settles it.** The claim is "the published rules are the rules that run." For that claim to be provable, the rules that run define the standard, and the publication gets corrected to match them, not the reverse.

**Consequence:** the framework document's prose classification rules are superseded by the validator's 7-branch tree as of this report, and the prose should be corrected to describe the tree. The original framework files are left untouched; this report is the record of the ruling. The inventor can reverse this ruling at any time, in which case the formalization would be redone against the prose rules and the code treated as divergent.

## Reproduce the verification

Toolchain: elan with **Lean 4.36.0** / Lake 5.0.0 (pinned in `lean-toolchain`). No dependencies, in particular no Mathlib; all mathematics is built from Lean core with exact rationals.

```bash
cd science/gccft-whitebox-verification/whitebox-lean
lake build
```

Expected: `Build completed successfully`, with the axiom-audit lines printed as `info:` messages during the `GccftWhitebox.Check` step. A clean build takes about 9 seconds on a modest machine.

## Files in this folder

- `VERIFICATION-REPORT.md`: this report.
- `whitebox-lean/`: the complete Lean 4 project (`GccftWhitebox` library: `Basic`, `Features`, `Decide`, `Enforce`, `Predict`, `Check`), published so the kernel's verdict can be re-run by anyone.

*Released under Operation ProleBlitz's open-source doctrine (CC BY-SA unless otherwise noted): inventions that alleviate suffering belong to everyone.*
