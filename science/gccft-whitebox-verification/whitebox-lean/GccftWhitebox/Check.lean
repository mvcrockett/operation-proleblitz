/-
  GCCFT white-box formalization — sanity checks and axiom audit.

  The examples are executable checks: the formalized rules, evaluated by
  the Lean kernel on concrete inputs, must reproduce the behaviour the
  Python code's published rules dictate. They are proved by `decide`
  (kernel evaluation), which introduces no axioms.

  The `#print axioms` block at the end is the unfakeable part of the
  exercise: the kernel itself reports exactly which axioms each headline
  theorem depends on. A `sorry` anywhere would appear here as `sorryAx`.
-/

import GccftWhitebox.Predict

namespace Gccft

/-- Proline is TURN even in a maximally sheet-rich window (rule 1). -/
example : decide AA.P [AA.F, AA.F, AA.F, AA.F, AA.F] ⟨0, 0, 0⟩ = Label.turn := by
  decide

/-- A window of pure sheet-formers has sheet_signal = 1 > 0.55, so a
    sheet former in it is SHEET (rule 3), whatever the field does.
    (Proved through `decide_strong_sheet`: kernel `decide` cannot
    evaluate rational division, so the signal value is computed by
    `simp` on the concrete window and finished by `grind`.) -/
example : decide AA.F [AA.F, AA.F, AA.F, AA.F, AA.F] ⟨0, 0, 0⟩ = Label.sheet := by
  apply decide_strong_sheet
  · decide
  · intro h; exact (by decide : AA.F ≠ AA.G) h.1
  · have hsig : sheetSignal [AA.F, AA.F, AA.F, AA.F, AA.F] = 1 := by
      have hcl : sheetCluster [AA.F, AA.F, AA.F, AA.F, AA.F] = 1 := by
        show (5 : Rat) / 5 = 1
        grind
      have hal : strandAlt [AA.F, AA.F, AA.F, AA.F, AA.F] = 1 := by
        show (3 : Rat) / 3 = 1
        grind
      unfold sheetSignal
      rw [hcl, hal]
      grind
    rw [hsig]; grind

/-- Glycine in a sheet-poor window (sheet_signal = 0 < 0.4) is TURN (rule 2). -/
example : decide AA.G [AA.A, AA.A, AA.A] ⟨0, 0, 0⟩ = Label.turn := by
  apply decide_glycine
  have hsig : sheetSignal [AA.A, AA.A, AA.A] = 0 := by
    have hcl : sheetCluster [AA.A, AA.A, AA.A] = 0 := by
      show (0 : Rat) / 3 = 0
      grind
    have hal : strandAlt [AA.A, AA.A, AA.A] = 0 := by
      rfl
    unfold sheetSignal
    rw [hcl, hal]
    grind
  rw [hsig]; grind

/-- Enforcement: a 2-residue helix segment whose only neighbour is a turn
    is overwritten by it (segments H×2, T×1; H is short). -/
example : enforce [Label.helix, Label.helix, Label.turn]
    = [Label.turn, Label.turn, Label.turn] := by
  decide

/-- Enforcement: a 3-residue sheet segment (exactly the minimum) survives. -/
example : enforce [Label.sheet, Label.sheet, Label.sheet]
    = [Label.sheet, Label.sheet, Label.sheet] := by
  decide

/-- Enforcement: a lone 2-residue helix segment becomes TURN. -/
example : enforce [Label.helix, Label.helix] = [Label.turn, Label.turn] := by
  decide

/-- Enforcement: a 4-residue helix (exactly the minimum) survives. -/
example : enforce [Label.helix, Label.helix, Label.helix, Label.helix]
    = [Label.helix, Label.helix, Label.helix, Label.helix] := by
  decide

end Gccft

/-! ## Axiom audit (output appears in the build log) -/

#print axioms Gccft.decide_proline
#print axioms Gccft.decide_glycine
#print axioms Gccft.decide_strong_sheet
#print axioms Gccft.decide_helix_stable
#print axioms Gccft.decide_low_energy
#print axioms Gccft.decide_moderate_sheet
#print axioms Gccft.decide_composition_helix
#print axioms Gccft.decide_default
#print axioms Gccft.decide_cases
#print axioms Gccft.sheetSignal_mem_Icc
#print axioms Gccft.predictRaw_length
#print axioms Gccft.predictRaw_ext
#print axioms Gccft.predict_length
#print axioms Gccft.predict_min_segments
#print axioms Gccft.enforce_length
#print axioms Gccft.enforce_noShort
