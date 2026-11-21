/-
  GCCFT white-box formalization — window features.

  Faithful to the sequence-composition features of `predict_residue_ss`
  in `gccft_validator_v6.py`:

    * `_sheet_cluster_score(seq)`  = fraction of sheet-forming AAs
    * `_strand_alternation_score(seq)` = fraction of i, i+2 positions
      where both residues are sheet-forming (0 for windows shorter than 4)
    * `sheet_signal = 0.6 * cluster + 0.4 * alternation`
    * `helix_frac`, `turn_frac` = fractions of HELIX_AAS / TURN_AAS

  All arithmetic is exact rational arithmetic. The Python floats 0.6 and
  0.4 are the rationals 3/5 and 2/5; the fractions are counts over window
  length, exactly as in the code.

  NOT formalized here: the collapse-field quantities E0, dE/dσ and the
  field variance. Those are computed in Python from complex exponentials
  and a 200-point trapezoid integral (transcendental, floating point).
  In this formalization they enter the decision function as declared
  rational inputs (see `Decide.lean`), so everything proved about the
  classifier is proved *given* the field features, with the field
  computation itself an explicit, named gap.
-/

import GccftWhitebox.Basic

namespace Gccft

/-- Number of residues of the window satisfying `p`
    (the numerator of every composition fraction in the validator). -/
def countP (p : AA → Bool) (w : List AA) : Nat :=
  (w.filter p).length

/-- Fraction of residues satisfying `p`; 0 on the empty window, matching
    the Python guard `... if seq else 0.0` in `_sheet_cluster_score`.
    (In the actual predictor the window always contains the residue being
    classified, so it is never empty; the guard is kept for fidelity.) -/
def frac (p : AA → Bool) (w : List AA) : Rat :=
  if w.length = 0 then 0 else (countP p w : Rat) / (w.length : Rat)

/-- `_sheet_cluster_score`: fraction of sheet-forming residues. -/
def sheetCluster (w : List AA) : Rat := frac sheetAA w

/-- `helix_frac`: fraction of strong helix formers (AELM). -/
def helixFrac (w : List AA) : Rat := frac helixAA w

/-- `turn_frac`: fraction of turn formers (GDNPQS). (Computed by the
    validator but not used by the v6 decision tree; formalized for
    completeness of the published feature set.) -/
def turnFrac (w : List AA) : Rat := frac turnAA w

/-- Number of i, i+2 sheet pairs: pairs `(w[i], w[i+2])` with both
    sheet-forming. `w.zip (w.drop 2)` is exactly the list of such pairs. -/
def altHits (w : List AA) : Nat :=
  ((w.zip (w.drop 2)).filter (fun pr => sheetAA pr.1 && sheetAA pr.2)).length

/-- `_strand_alternation_score`: `hits / (len - 2)`, and 0 for windows
    shorter than 4 residues, exactly as the Python guard states. -/
def strandAlt (w : List AA) : Rat :=
  if w.length < 4 then 0 else (altHits w : Rat) / ((w.length - 2 : Nat) : Rat)

/-- `sheet_signal = 0.6 * sc + 0.4 * sa`. -/
def sheetSignal (w : List AA) : Rat :=
  (3 / 5) * sheetCluster w + (2 / 5) * strandAlt w

/-! ## Structural facts about the features -/

/-- The count never exceeds the window length. -/
theorem countP_le (p : AA → Bool) (w : List AA) : countP p w ≤ w.length :=
  List.length_filter_le _ _

/-- Alternation hits never exceed the number of i, i+2 pairs. -/
theorem altHits_le (w : List AA) : altHits w ≤ w.length - 2 := by
  unfold altHits
  have h1 := List.length_filter_le (fun pr => sheetAA pr.1 && sheetAA pr.2)
    (w.zip (w.drop 2))
  rw [List.length_zip, List.length_drop] at h1
  omega

/-- Every composition fraction lies in [0, 1]. -/
theorem frac_mem_Icc (p : AA → Bool) (w : List AA) :
    0 ≤ frac p w ∧ frac p w ≤ 1 := by
  unfold frac
  by_cases h : w.length = 0
  · rw [ite_eq_left h]; exact ⟨Rat.le_refl, by grind⟩
  · rw [ite_eq_right h]
    have hlen : (0 : Rat) < (w.length : Rat) := by
      exact_mod_cast Nat.pos_of_ne_zero h
    have hcount : (countP p w : Rat) ≤ (w.length : Rat) := by
      exact_mod_cast countP_le p w
    have hnn : (0 : Rat) ≤ (countP p w : Rat) := by
      exact_mod_cast Nat.zero_le _
    constructor
    · exact Rat.not_lt.mp (by
        rw [Rat.div_lt_iff hlen]; simpa using (Rat.not_lt.mpr hnn))
    · exact Rat.not_lt.mp (by
        rw [Rat.lt_div_iff hlen]; simpa using (Rat.not_lt.mpr hcount))

/-- The strand alternation score lies in [0, 1]. -/
theorem strandAlt_mem_Icc (w : List AA) : 0 ≤ strandAlt w ∧ strandAlt w ≤ 1 := by
  unfold strandAlt
  by_cases h : w.length < 4
  · rw [ite_eq_left h]; exact ⟨Rat.le_refl, by grind⟩
  · rw [ite_eq_right h]
    have h2 : (0 : Rat) < ((w.length - 2 : Nat) : Rat) := by
      exact_mod_cast (by omega : 0 < w.length - 2)
    have hle : (altHits w : Rat) ≤ ((w.length - 2 : Nat) : Rat) := by
      exact_mod_cast altHits_le w
    have hnn : (0 : Rat) ≤ (altHits w : Rat) := by
      exact_mod_cast Nat.zero_le _
    constructor
    · exact Rat.not_lt.mp (by
        rw [Rat.div_lt_iff h2]; simpa using (Rat.not_lt.mpr hnn))
    · exact Rat.not_lt.mp (by
        rw [Rat.lt_div_iff h2]; simpa using (Rat.not_lt.mpr hle))

/-- The combined sheet signal lies in [0, 1]: it is a convex combination
    (weights 3/5 and 2/5) of two quantities in [0, 1]. -/
theorem sheetSignal_mem_Icc (w : List AA) :
    0 ≤ sheetSignal w ∧ sheetSignal w ≤ 1 := by
  obtain ⟨hc0, hc1⟩ := frac_mem_Icc sheetAA w
  obtain ⟨ha0, ha1⟩ := strandAlt_mem_Icc w
  have hc0' : 0 ≤ sheetCluster w := hc0
  have hc1' : sheetCluster w ≤ 1 := hc1
  unfold sheetSignal
  constructor
  · grind
  · grind

end Gccft
