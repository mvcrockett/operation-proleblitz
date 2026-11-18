# The White Box Protein Folder

**GCCFT: an interpretable protein secondary structure predictor, built in the open**

By Victoria Crockett, with Claude (Anthropic) as collaborator. Released November 2026 as part of Operation ProleBlitz. Code under GPL-3.0-or-later, writings under CC BY-SA 4.0.

## What this is, in plain language

Proteins are chains of amino acids, and before a chain folds into its working 3D shape, stretches of it form local patterns: helices, sheets, and the turns and coils in between. Predicting which pattern each amino acid belongs to, from the sequence alone, is called secondary structure prediction. It is one of the oldest problems in computational biology, and the standard score is called Q3: the percentage of amino acids tagged correctly as helix, sheet, or turn.

The White Box Protein Folder is a secondary structure predictor built on a deliberate bet: that a predictor can stay readable and still post a real score. The big modern systems learn their features inside enormous neural networks, where no human can say why a given amino acid got its tag. This one works the other way. Every number it feeds its small classifier is a named quantity a person can define, compute by hand in principle, and argue about. The features come from a piece of mathematics the author calls Gray-Crockett Collapse Field Theory, which treats the amino acid sequence as a signal and reads it with a harmonic field, plus standard evolutionary features taken from multiple sequence alignments. A small neural network, three layers of 128, 64, and 32 units, turns those 45 numbers per amino acid into a prediction, and a Viterbi smoothing pass tidies the result.

The author built this on a home computer and free or cheap cloud notebooks. Her own account puts the compute cost at roughly 900 dollars all in, against the 10,000 to 100,000 dollars of compute and infrastructure that the black box route usually stands on. That cost figure is her account, stated here as she gives it. It is not an audited number, and nothing else in this document depends on it.

The verified headline result: **Q3 0.7168, or 71.68 percent**, on a held out test set of 199 proteins, 23,099 of 32,225 amino acids tagged correctly. The full configuration is in the results table below, and every number in that table was re-checked against the project's own benchmark files before this release.

## The verified results

The main result, exactly as recorded in the project's benchmark file (gccft_msa_benchmark.json):

| Item | Value |
|---|---|
| Method | GCCFT features (21) plus MSA features (24), MLP classifier, Viterbi smoother |
| Q3 accuracy | 0.7168 (71.68 percent) |
| Correct | 23,099 of 32,225 test residues |
| Dataset | 993 proteins scored, split at the protein level, 794 train and 199 test |
| Features | 45 per residue |
| Classifier | MLP with hidden layers 128, 64, 32 |
| Split seed | 42 |
| Ground truth | DSSP assignments from PDB structures, computed with Bio.PDB |

Earlier versions, same dataset and same split, from their own benchmark files:

| Version | Features | Q3 |
|---|---|---|
| v7, GCCFT features plus MLP | 13 | 0.6779 (21,845 correct) |
| v8, v7 features plus FFT waveform features | 21 | 0.6740 (21,720 correct) |
| Physics only sliding window scorer, no neural network | n/a | 0.5286 (83,367 correct of 157,712 scored) |

The physics only scorer is worth a closer look, because it shows where the project started and where its weak class sits. Its per class recall, recomputed from its full per-residue output file for this release: helix 0.5608, sheet 0.2469, turn 0.6702. Sheets are the hard class for the physics features alone, by a wide margin. The v9 benchmark file did not record a per class breakdown, so this document does not invent one. Computing it is part of the follow up work described below.

Reference values, recorded inside the project's benchmark files for context. These are literature reference points the project stored for comparison. They are **not** head to head runs on this test set, and this document does not present them as such:

| Reference | Q3 |
|---|---|
| Random guessing | 0.333 |
| Chou-Fasman | 0.56 |
| PSIPRED | 0.77 |
| AlphaFold2 | 0.90 |

Read honestly, the table says this: the white box folder at 71.68 percent sits well above the classical methods and the project's own physics only scorer, below PSIPRED, and far below AlphaFold2. That is the result, neither inflated nor hidden.

## How it works

**The GCCFT feature stream (21 numbers per residue).** Each amino acid carries an assigned collapse frequency and weight, a table of 20 values calibrated against real protein contact data (see the correction note below for the full history of that table). Around each residue, the method builds a harmonic collapse field from the frequencies in a window of the sequence, evaluated at the critical parameter sigma equals 0.5, and reads off quantities such as field magnitude, local coherence, and waveform shape. Version 8 added eight numbers from a Fourier transform of the frequency signal. Every one of these features has a name and a definition in the code.

**The MSA feature stream (24 numbers per residue).** A multiple sequence alignment gathers related proteins from other species, and positions that evolution has conserved tend to matter. For each residue the method fetches an alignment from the ColabFold MMseqs2 server and computes named quantities such as conservation (the fraction of aligned sequences with the same amino acid at that position), gap fraction, the Shannon entropy of the amino acid distribution at that position, and the effective number of sequences. These are the same kind of evolutionary features that standard predictors use.

**The combination.** The two streams are joined into one vector of 45 numbers per residue. That vector, nothing more exotic, is what the classifier sees. A standard scaler and the MLP follow, and a Viterbi pass with a minimum segment length smooths the predicted labels so that one residue blips do not break up helices and sheets.

**The dataset.** 1,000 protein IDs were collected from the RCSB Protein Data Bank. 997 parsed into the dataset (158,068 residues). 993 appear in the benchmarks. The four that dropped out between dataset and benchmark are named in the project reconciliation, and one of the four is now explained in the new work section below. Ground truth labels come from DSSP.

**One limitation, stated plainly.** The train and test split is a random split at the protein level. It is not clustered by sequence similarity, so a relative of a test protein can appear in training. Benchmarks in this field score lower under similarity clustered splits, and this project's numbers should be read with that in mind. A clustered split run is on the next experiments list, to be reported as its own line when it exists.

## Version history

| Version | What changed | Q3 |
|---|---|---|
| v1 to v6 | Sliding window physics scorer against DSSP ground truth, refined over six rounds, Viterbi smoother added at v6 | 47.5 to 52.9 percent across versions |
| v7 | Neural layer added: 13 GCCFT features into an MLP | 67.79 percent |
| v8 | Eight FFT waveform features added | 67.4 percent, a tie with v7 in practice |
| v9 | 24 MSA evolutionary features added, 45 total | 71.68 percent |

Two side results from the same period, labeled for exactly what they are. They are reported in the session transcripts and were not re-derived from data files for this release:

- A physics only contact predictor, built in a separate session, reached 7.48 percent Precision at L with 4.68 times lift over random. Contact prediction is a different and harder task than secondary structure tagging, and low absolute numbers are normal there.
- A test of features derived from the Riemann zeta zeros found a statistically strong class separation (F 114.88, p below 0.000001) that added exactly 0.0 points of accuracy on top of the existing features. Both halves of that sentence matter. The signal is real as a statistic, and it bought nothing as a feature.

## Two corrections, printed openly

This release corrects two things in the project's earlier writeup. The corrections are part of the release, not footnotes to be embarrassed by.

**The phenylalanine and tryptophan values.** The earlier writeup's prose lists the collapse frequencies F 1.188 and W 1.232. Those numbers came from a later, larger calibration run in the project's second session, and they were never put into the code. Every model that produced a verified number, v7, v8, and v9, ran with the earlier calibrated values **F 2.1429 and W 2.2548**, which are what every code file and the framework document contain. The verified results above belong to those values. The 1.188 and 1.232 pair is a genuine calibration variant that has never been benchmarked, and testing it properly is on the experiments list.

**Where the v9 code was.** The earlier writeup said the v9 code was never saved and could not be recovered. The fuller record, assembled from the session transcripts for this release, is this. The v9 script was written in the project's main benchmark session in March 2026 and offered as a download that never reached the project Drive folder. It was then rewritten inside the Colab notebook, and that notebook copy is the one that ran and produced the 71.68 percent result. Only the trained model and the benchmark results were saved back to Drive at the time. A later session in July 2026, working with tools that could not read raw code files in Drive, concluded the code was lost. It was not lost. The complete script text was preserved in the session transcript, and the copy of gccft_msa_v9.py in the project archive today was compared line by line against that transcript copy for this release: all 829 lines match. The step that placed the file into Drive is not documented in any session, and this document does not guess it. What matters for anyone checking the work is that the code in the archive is the code from the session, verified by direct comparison.

## What is not claimed

- This is **not an AlphaFold rival in capability**. AlphaFold predicts full 3D structure and sits near 90 percent on the reference scale above. This folder predicts three state secondary structure tags only. The project's own early session title said rival. The results do not, and neither does this document.
- It is **not yet shown that the GCCFT features add anything on top of the MSA features**. The honest suspicion, stated inside the project record itself, is that the MSA features carry most of the accuracy, as they do in every standard predictor. The experiment that decides this, a three way ablation of GCCFT only against MSA only against both together, was designed and built in July 2026 and has only ever run as a smoke test against an empty alignment cache. Its result does not exist yet. Until it does, the claim of this release is interpretability at a respectable score, not a proven new signal.
- The 71.68 percent comes from a random protein level split, not a similarity clustered one, as noted above.
- A dihedral angle predictor was built in the same period and has **never been run** on real proteins. No angle accuracy numbers exist. A related analysis design (a hemostatic bypass patch study) likewise exists as a design only, with no results.
- An ESM-2 hybrid was planned and its first step ran (ESM-2 contact maps for three proteins). The hybrid comparison never ran and no hybrid score exists.

## Open items and next experiments

In the order the project record itself sets:

1. Fill the MSA cache. The fetch script exists and is resumable. A two protein test first, then the full batch for the benchmark proteins.
2. Run the three arm ablation on the same split: GCCFT only, MSA only, combined, with a bootstrap confidence interval on the difference. This is the deciding experiment for what the GCCFT features are worth.
3. Reproduce the v9 benchmark from the archived code and dataset, and record the per class breakdown the original benchmark file left out.
4. Error analysis: where the remaining 28 percent goes, by class, by residue type, and by protein length.
5. Interpretable improvements, each with a name and a reason: seed ensembling, class weighting for the sheet class, wider sequence window context, a richer named MSA feature block, cross terms between the two streams, and the untested Phe and Trp calibration variant, fit on training data only.
6. A sequence similarity clustered split, reported as its own line alongside the headline split.
7. The dihedral baseline run, against the success bar the project set in advance (phi and psi error well below the random bars of about 90 and 100 degrees), then the hemostatic bypass analysis that was designed to follow it.
8. The ESM-2 hybrid comparison, as a labeled side experiment. Black box embeddings stay out of the headline model.

## New work: the November 2026 reproduction pass

This release comes with the start of a fresh round of work on the project, run in November 2026 against the archived code and dataset. What it has established so far, with each number read from the run outputs themselves:

- **The pipeline still runs.** A clean environment was built from the archived code (Python, scikit-learn, Biopython, and the DSSP tool the code calls), and the v7 predictor was re-run end to end on the archived dataset, unmodified. It scored **Q3 0.6799**, against 0.6779 in the original benchmark, a difference of two tenths of a point. The small gap is accounted for: DSSP succeeded on 995 proteins in the new environment against 993 in the original, so the split and test set differ slightly. Same code, same data, same protocol, and the score holds. That is what a reproduction is supposed to look like.
- **One of the four missing proteins is explained.** Of the four proteins that dropped out of the original benchmarks, 1C53 fails the DSSP step for an identified reason: its PDB file contains only alpha carbon atoms, and DSSP needs the full backbone to assign structure. The other three pass in the modern environment, and their original loss is not reproducible. The project reconciliation tells the whole story without dressing it up.
- **The alignment fetch works, and it is slow going.** The MSA fetch script, built in July 2026 and never tested, was run for the first time. Its two protein test passed, and the full batch fetch for the dataset is under way. The public ColabFold server processes each batch on its own schedule, minutes to tens of minutes per batch, which is the same wall the original project hit. The fetch is resumable and checkpoints every protein it completes.
- **Still staged, not yet run:** the v9 reproduction on the full alignment cache, the three arm ablation, and the improvement experiments (seed ensembling, class weighting, the untested Phe and Trp calibration, and the rest of the list above). Each is built and waiting on the cache. Their results will be published here when they exist, with the same rule this document follows: verified numbers, negative results included, nothing claimed early.

## An invitation to collaborators

This is open source because the point is that anyone can check it, run it, and make it better. The most useful things a collaborator can do, in order:

1. **Reproduce the benchmark.** The dataset and code are listed in the manifest below. If your run lands somewhere else, that is a finding, and we want to hear it.
2. **Run the ablation.** If the GCCFT features add points on top of MSA alone, that is the headline this project has not yet earned. If they do not, the interpretability claim stands on its own and the field learns something either way.
3. **Improve the features, white box style.** New features are welcome when each one arrives with a name, a definition, and a reason.

Corrections are welcome in the same spirit this document practices: in the open, with the numbers shown.

## Code release manifest

This release is the document. The code follows as a separate drop. The files below are verified present in the project archive, with checksums recorded in the project reconciliation, and are ready to publish in that drop:

| File | What it is |
|---|---|
| gccft_msa_v9.py | The v9 predictor, 45 features, provenance verified against the session transcript for this release |
| gccft_neural_v8.py | The v8 predictor, 21 features |
| gccft_neural_v7.py | The v7 predictor, 13 features, also the feature source for the ablation harness |
| gccft_validator.py, gccft_validator_v2.py through gccft_validator_v6.py | The sliding window physics scorer, versions 1 to 6 |
| gccft_ablation.py | The three arm ablation harness, complete and unrun beyond a smoke test |
| gccft_msa_fetch.py | The MSA cache filler, ColabFold MMseqs2 client |
| folding_dynamics_simulator.py | The early dynamics simulator from the first session |
| GCCFT_Dataset_Builder.ipynb | The dataset builder notebook |
| dataset.csv, dataset.json | The 997 protein dataset, 158,068 residues |
| Benchmark JSONs and the per-residue CSV | The recorded results for v7, v8, v9, and the physics scorer |
| GCCFT_complete_framework.json | The framework document, constants and feature definitions |
| Model files (gccft_msa_model.pkl, gccft_neural_model.pkl) | The trained models. Pickle format: only load files you trust, and these are published so the record is complete, not because loading them is required |

## License

Code: GPL-3.0-or-later. Writings, including this document: CC BY-SA 4.0. Take it, build on it, share it back.
