/-
  GCCFT white-box formalization — the classification decision tree.

  This is `predict_residue_ss`'s per-residue decision procedure from
  `gccft_validator_v6.py`, transcribed branch for branch, in the exact
  priority order the code (and its docstring) publishes:

    1. Proline → always TURN (helix breaker)
    2. Glycine with sheet_signal < 0.4 → TURN
    3. sheet_signal > 0.55 → SHEET
    4. helix_frac > 0.4 AND variance < 0.025 AND E0 > 0.15 → HELIX
    5. E0 < 0.12 → TURN (low field energy = disordered)
    6. sheet_signal > 0.35 AND |dE| > 0.03 → SHEET
    7. helix_frac > sheet_signal AND helix_frac > 0.3 → HELIX
    8. Default → TURN

  Every threshold is an exact rational (0.55 = 11/20, 0.025 = 1/40, ...).
  The Python code compares IEEE floats; the decimals it names are these
  rationals, and the comparisons below are the exact versions of them.

  The collapse-field quantities E0, dE, variance are declared inputs
  (`FieldFeatures`): in the Python code they are computed from the window
  by a transcendental floating-point computation that is NOT formalized
  here (see the report's gap list). Everything about *how the published
  rules turn features into a label* is formalized and proved.
-/

import GccftWhitebox.Features

namespace Gccft

/-- The collapse-field features of a window, as declared rational inputs.
    `E0`: field energy at σ = 0.5. `dE`: dE/dσ at σ = 0.5 (central
    difference, ±0.05). `variance`: variance of |F(σ)| over the field axis. -/
structure FieldFeatures where
  E0 : Rat
  dE : Rat
  variance : Rat
  deriving Repr, DecidableEq

/-- The per-residue decision function. A total function of exactly three
    declared inputs: the residue, its window, and the window's field
    features. There is no other input: no global state, no randomness,
    no learned parameters anywhere in this function. -/
def decide (aa : AA) (w : List AA) (ff : FieldFeatures) : Label :=
  if aa = AA.P then .turn
  else if aa = AA.G ∧ sheetSignal w < 2 / 5 then .turn
  else if sheetSignal w > 11 / 20 then .sheet
  else if helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20 then .helix
  else if ff.E0 < 3 / 25 then .turn
  else if sheetSignal w > 7 / 20 ∧ Rat.abs ff.dE > 3 / 100 then .sheet
  else if helixFrac w > sheetSignal w ∧ helixFrac w > 3 / 10 then .helix
  else .turn

/-! ## The priority theorems: each published rule, proved.

    Each theorem says: if the branches above this one do not fire and
    this one's condition holds, the output is this branch's label.
    Together with `decide_default` they pin down the function completely:
    the decision tree has no behaviour beyond the published list. -/

/-- Rule 1: proline is always TURN, regardless of window or field. -/
theorem decide_proline (w : List AA) (ff : FieldFeatures) :
    decide AA.P w ff = Label.turn := by
  simp [decide]

/-- Rule 2: glycine in a non-sheet-rich window (sheet_signal < 0.4) is TURN. -/
theorem decide_glycine (w : List AA) (ff : FieldFeatures)
    (h : sheetSignal w < 2 / 5) :
    decide AA.G w ff = Label.turn := by
  unfold decide
  rw [ite_eq_right (by decide : ¬ (AA.G = AA.P)), ite_eq_left ⟨rfl, h⟩]

/-- Rule 3: a strong sheet signal (sheet_signal > 0.55) is SHEET. -/
theorem decide_strong_sheet (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (h : sheetSignal w > 11 / 20) :
    decide aa w ff = Label.sheet := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_left h]

/-- Rule 4: helix-rich window, stable field, high energy → HELIX. -/
theorem decide_helix_stable (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (hS : ¬ sheetSignal w > 11 / 20)
    (h : helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20) :
    decide aa w ff = Label.helix := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_right hS, ite_eq_left h]

/-- Rule 5: low field energy (E0 < 0.12) → TURN. -/
theorem decide_low_energy (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (hS : ¬ sheetSignal w > 11 / 20)
    (hH : ¬ (helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20))
    (h : ff.E0 < 3 / 25) :
    decide aa w ff = Label.turn := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_right hS, ite_eq_right hH, ite_eq_left h]

/-- Rule 6: moderate sheet signal confirmed by an oscillating gradient
    (sheet_signal > 0.35 and |dE| > 0.03) → SHEET. -/
theorem decide_moderate_sheet (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (hS : ¬ sheetSignal w > 11 / 20)
    (hH : ¬ (helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20))
    (hE : ¬ ff.E0 < 3 / 25)
    (h : sheetSignal w > 7 / 20 ∧ Rat.abs ff.dE > 3 / 100) :
    decide aa w ff = Label.sheet := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_right hS, ite_eq_right hH, ite_eq_right hE, ite_eq_left h]

/-- Rule 7: helix composition majority (helix_frac > sheet_signal and
    helix_frac > 0.3) → HELIX. -/
theorem decide_composition_helix (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (hS : ¬ sheetSignal w > 11 / 20)
    (hH : ¬ (helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20))
    (hE : ¬ ff.E0 < 3 / 25)
    (hM : ¬ (sheetSignal w > 7 / 20 ∧ Rat.abs ff.dE > 3 / 100))
    (h : helixFrac w > sheetSignal w ∧ helixFrac w > 3 / 10) :
    decide aa w ff = Label.helix := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_right hS, ite_eq_right hH, ite_eq_right hE, ite_eq_right hM, ite_eq_left h]

/-- Rule 8 (default): if no rule fires, the output is TURN. -/
theorem decide_default (aa : AA) (w : List AA) (ff : FieldFeatures)
    (hP : aa ≠ AA.P) (hG : ¬ (aa = AA.G ∧ sheetSignal w < 2 / 5))
    (hS : ¬ sheetSignal w > 11 / 20)
    (hH : ¬ (helixFrac w > 2 / 5 ∧ ff.variance < 1 / 40 ∧ ff.E0 > 3 / 20))
    (hE : ¬ ff.E0 < 3 / 25)
    (hM : ¬ (sheetSignal w > 7 / 20 ∧ Rat.abs ff.dE > 3 / 100))
    (hC : ¬ (helixFrac w > sheetSignal w ∧ helixFrac w > 3 / 10)) :
    decide aa w ff = Label.turn := by
  unfold decide
  rw [ite_eq_right hP, ite_eq_right hG, ite_eq_right hS, ite_eq_right hH, ite_eq_right hE, ite_eq_right hM, ite_eq_right hC]

/-- Totality with a three-way case split: for every residue, window and
    field input, `decide` returns one of the three Q3 labels, and the
    priority theorems above determine which. (In Lean this is the
    statement that the published tree is a *complete* specification:
    there is no fourth outcome and no undefined case.) -/
theorem decide_cases (aa : AA) (w : List AA) (ff : FieldFeatures) :
    decide aa w ff = Label.helix ∨ decide aa w ff = Label.sheet ∨
    decide aa w ff = Label.turn := by
  cases h : decide aa w ff with
  | helix => exact Or.inl rfl
  | sheet => exact Or.inr (Or.inl rfl)
  | turn => exact Or.inr (Or.inr rfl)

end Gccft
