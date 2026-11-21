/-
  GCCFT white-box formalization — the per-residue predictor pipeline.

  `predict_residue_ss` in `gccft_validator_v6.py` works in three stages:

    1. For each residue i, take the 9-residue window centred at i
       (clipped at the sequence ends), compute the window's features,
       and classify with the decision tree (`decide`).
    2. Smooth the raw labels with a Viterbi HMM pass (`viterbi_smooth`).
    3. Enforce minimum segment lengths (`_enforce_min_lengths`).

  This module formalizes stage 1 exactly, and states the pipeline-level
  theorems for stages 1–3 in terms of two declared components: the field
  oracle (stage 1's transcendental feature computation, a named gap) and
  the smoother (stage 2, a named gap, entering only through its length
  preservation). Stage 3 is formalized in full in `Enforce.lean`.

  The white-box content proved here:
    * the raw predictor is a TOTAL function of the sequence and the
      declared oracle — defined on every input, including the empty
      sequence and sequences containing unknown residues;
    * it returns exactly one label per residue (length preservation);
    * it depends on nothing else: two oracles that agree on every window
      give identical predictions (no hidden state, no side channel).
-/

import GccftWhitebox.Decide
import GccftWhitebox.Enforce

namespace Gccft

/-- The 9-residue window centred at position `i`, clipped at the ends:
    `sequence[max(0, i-4) : min(n, i+5)]` in the Python code. -/
def windowAt (s : List AA) (i : Nat) : List AA :=
  (s.drop (i - 4)).take (min s.length (i + 5) - (i - 4))

/-- The window has at most 9 residues. -/
theorem windowAt_length_le (s : List AA) (i : Nat) :
    (windowAt s i).length ≤ 9 := by
  unfold windowAt
  rw [List.length_take]
  omega

/-- The window at a valid position is nonempty: it always contains the
    residue being classified. (This is why the Python oscillator set,
    built from the window, is never empty in the real predictor.) -/
theorem windowAt_nonempty (s : List AA) (i : Nat) (hi : i < s.length) :
    windowAt s i ≠ [] := by
  intro hempty
  have hlen : (windowAt s i).length = 0 := by rw [hempty]; rfl
  unfold windowAt at hlen
  rw [List.length_take, List.length_drop] at hlen
  omega

/-- The raw per-residue predictor (stage 1). `fieldOf` is the declared
    field oracle: it assigns to each window the collapse-field features
    the Python code computes from it. The predictor is a function of the
    sequence and this oracle ONLY. -/
def predictRaw (fieldOf : List AA → FieldFeatures) (s : List AA) : List Label :=
  (List.range s.length).map fun i =>
    decide ((s[i]?).getD AA.X) (windowAt s i) (fieldOf (windowAt s i))

/-- One label per residue: the raw prediction has the same length as
    the input sequence, for every sequence and every oracle. -/
theorem predictRaw_length (fieldOf : List AA → FieldFeatures) (s : List AA) :
    (predictRaw fieldOf s).length = s.length := by
  simp [predictRaw]

/-- The empty sequence gets the empty prediction. -/
theorem predictRaw_nil (fieldOf : List AA → FieldFeatures) :
    predictRaw fieldOf [] = [] := by
  simp [predictRaw]

/-- No hidden state: if two field oracles agree on every window, the
    predictions are identical. The output depends only on the declared
    inputs (sequence + oracle values), never on anything else. -/
theorem predictRaw_ext (f g : List AA → FieldFeatures) (s : List AA)
    (h : ∀ w, f w = g w) :
    predictRaw f s = predictRaw g s := by
  simp [predictRaw, h]

/-- The full pipeline: raw prediction, then a smoother, then minimum
    length enforcement. The smoother enters abstractly; the Python
    Viterbi pass is one such smoother (its internals are a named gap),
    and the only property the pipeline theorems need from it is that
    it preserves length, which the Python code does by construction
    (it returns one state per input position). -/
def predict (fieldOf : List AA → FieldFeatures)
    (smooth : List Label → List Label) (s : List AA) : List Label :=
  enforce (smooth (predictRaw fieldOf s))

/-- Pipeline length preservation: given a length-preserving smoother,
    the full pipeline returns exactly one label per residue. -/
theorem predict_length (fieldOf : List AA → FieldFeatures)
    (smooth : List Label → List Label)
    (hsmooth : ∀ l, (smooth l).length = l.length) (s : List AA) :
    (predict fieldOf smooth s).length = s.length := by
  unfold predict
  rw [enforce_length, hsmooth, predictRaw_length]

/-- Pipeline segment invariant: given any smoother at all, every maximal
    HELIX segment of the output has length ≥ 4 and every maximal SHEET
    segment has length ≥ 3 — the biological minimum segment lengths the
    validator's `_enforce_min_lengths` exists to enforce. -/
theorem predict_min_segments (fieldOf : List AA → FieldFeatures)
    (smooth : List Label → List Label) (s : List AA) :
    NoShort (runsOf (predict fieldOf smooth s)) :=
  enforce_noShort _

end Gccft
