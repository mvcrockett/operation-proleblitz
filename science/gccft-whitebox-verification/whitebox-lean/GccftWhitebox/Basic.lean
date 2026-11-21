/-
  GCCFT white-box formalization — basic types and the published tables.

  Faithful to `gccft_validator_v6.py` (Victoria Crockett), the final
  rule-based validator. Every constant below is copied from that file or
  from `GCCFT_complete_framework.json` (SCFP v3), which carries the same
  calibrated frequency and weight tables.

  The point of this module for the white-box claim: the tables are TOTAL
  functions. Every amino acid, including the unknown residue X, has a
  published frequency, weight and fold. There is no lookup that can fail
  and no hidden default: the Python `VIBE_CODE.get(aa, VIBE_CODE['X'])`
  fallback is exactly the `AA.X` row of the table.
-/

namespace Gccft

/-- The 20 standard amino acids plus `X` (unknown residue).
    Exactly the 21 keys of the Python `VIBE_CODE` dict. -/
inductive AA where
  | A | C | D | E | F | G | H | I | K | L | M | N | P | Q | R | S | T | V | W | Y | X
  deriving DecidableEq, Repr, Inhabited

/-- GCCFT native fold labels (the `fold` field of `VIBE_CODE`). -/
inductive Fold where
  | helix | sheet | bridge | turn | unknown
  deriving DecidableEq, Repr, Inhabited

/-- Q3 labels: the predictor's output alphabet (`HELIX` / `SHEET` / `TURN`). -/
inductive Label where
  | helix | sheet | turn
  deriving DecidableEq, Repr, Inhabited

/-- Calibrated frequency per amino acid (`VIBE_CODE[aa]['freq']`, identical to
    `calibrated_frequencies` in the framework JSON). The Python values are
    decimal literals with four decimal places; here they are exact rationals,
    so the published table is reproduced with no rounding anywhere. -/
def vibeFreq : AA → Rat
  | .A => 17551 / 10000
  | .C => 26364 / 10000
  | .D => 18517 / 10000
  | .E => 17293 / 10000
  | .F => 21429 / 10000
  | .G => 16866 / 10000
  | .H => 17535 / 10000
  | .I => 17804 / 10000
  | .K => 20539 / 10000
  | .L => 15782 / 10000
  | .M => 19068 / 10000
  | .N => 12993 / 10000
  | .P => 13121 / 10000
  | .Q => 16545 / 10000
  | .R => 25475 / 10000
  | .S => 12705 / 10000
  | .T => 16381 / 10000
  | .V => 14057 / 10000
  | .W => 22548 / 10000
  | .Y => 18517 / 10000
  | .X => 15000 / 10000

/-- Symbolic weight per amino acid (`VIBE_CODE[aa]['weight']`, identical to
    `symbolic_weights` in the framework JSON). Exact rationals. -/
def vibeWeight : AA → Rat
  | .A => 1
  | .C => 13 / 10
  | .D => 11 / 10
  | .E => 11 / 10
  | .F => 12 / 10
  | .G => 8 / 10
  | .H => 12 / 10
  | .I => 11 / 10
  | .K => 12 / 10
  | .L => 11 / 10
  | .M => 1
  | .N => 1
  | .P => 9 / 10
  | .Q => 1
  | .R => 12 / 10
  | .S => 9 / 10
  | .T => 1
  | .V => 11 / 10
  | .W => 13 / 10
  | .Y => 12 / 10
  | .X => 1

/-- Native fold per amino acid (`VIBE_CODE[aa]['fold']`, identical to the
    `fold` column of the framework JSON's `vibe_code_table`). -/
def vibeFold : AA → Fold
  | .A => .helix
  | .C => .bridge
  | .D => .turn
  | .E => .helix
  | .F => .sheet
  | .G => .turn
  | .H => .turn
  | .I => .sheet
  | .K => .turn
  | .L => .helix
  | .M => .helix
  | .N => .turn
  | .P => .turn
  | .Q => .turn
  | .R => .helix
  | .S => .turn
  | .T => .sheet
  | .V => .sheet
  | .W => .sheet
  | .Y => .sheet
  | .X => .unknown

/-- Collapse-field weight per fold (`WEIGHTS_CF` in the validator). -/
def cfWeight : Fold → Rat
  | .helix   => 13 / 10
  | .sheet   => 12 / 10
  | .bridge  => 11 / 10
  | .turn    => 1
  | .unknown => 8 / 10

/-- GCCFT fold label → Q3 label (`GCCFT_TO_Q3` in the validator).
    Note `BRIDGE → SHEET` and `UNKNOWN → TURN`, exactly as published. -/
def foldToQ3 : Fold → Label
  | .helix   => .helix
  | .sheet   => .sheet
  | .bridge  => .sheet
  | .turn    => .turn
  | .unknown => .turn

/-- DSSP 8-class code → Q3 label (`DSSP_TO_Q3` in the validator, including
    its `.get(code, 'TURN')` default: every code not listed maps to TURN). -/
def dsspToQ3 : Char → Label
  | 'H' => .helix
  | 'G' => .helix
  | 'I' => .helix
  | 'E' => .sheet
  | 'B' => .sheet
  | _   => .turn

/-- Sheet-forming amino acids (`SHEET_AAS = frozenset('CFIVTWY')`). -/
def sheetAA : AA → Bool
  | .C | .F | .I | .V | .T | .W | .Y => true
  | _ => false

/-- Strong helix formers (`HELIX_AAS = frozenset('AELM')`).
    Note this set, used for `helix_frac`, is NOT the same as the set of
    amino acids whose vibe fold is HELIX (which also contains R). Both are
    published constants; the formalization keeps them separate, as the code does. -/
def helixAA : AA → Bool
  | .A | .E | .L | .M => true
  | _ => false

/-- Turn/coil formers (`TURN_AAS = frozenset('GDNPQS')`). -/
def turnAA : AA → Bool
  | .G | .D | .N | .P | .Q | .S => true
  | _ => false

/-! ## Sanity theorems on the published tables (all by `rfl` / `decide`) -/

/-- The unknown-residue row is the published fallback row. -/
theorem vibeFold_X : vibeFold AA.X = Fold.unknown := rfl

/-- `BRIDGE` scores as `SHEET`, as the validator's `GCCFT_TO_Q3` states. -/
theorem foldToQ3_bridge : foldToQ3 Fold.bridge = Label.sheet := rfl

/-- `UNKNOWN` scores as `TURN`, as the validator's `GCCFT_TO_Q3` states. -/
theorem foldToQ3_unknown : foldToQ3 Fold.unknown = Label.turn := rfl

/-- The DSSP map sends the three helix codes to HELIX. -/
theorem dsspToQ3_helix_codes :
    dsspToQ3 'H' = Label.helix ∧ dsspToQ3 'G' = Label.helix ∧
    dsspToQ3 'I' = Label.helix := ⟨rfl, rfl, rfl⟩

/-- The DSSP map sends the two sheet codes to SHEET. -/
theorem dsspToQ3_sheet_codes :
    dsspToQ3 'E' = Label.sheet ∧ dsspToQ3 'B' = Label.sheet := ⟨rfl, rfl⟩

/-- Every published frequency is strictly positive. (The collapse field
    divides by powers and takes `log` of frequencies, so positivity is a
    real precondition of the Python code, not decoration.) -/
theorem vibeFreq_pos : ∀ a : AA, 0 < vibeFreq a := by
  intro a; cases a <;> grind [vibeFreq]

/-- Every published symbolic weight is strictly positive. -/
theorem vibeWeight_pos : ∀ a : AA, 0 < vibeWeight a := by
  intro a; cases a <;> grind [vibeWeight]

/-- Every collapse-field fold weight is strictly positive. -/
theorem cfWeight_pos : ∀ f : Fold, 0 < cfWeight f := by
  intro f; cases f <;> grind [cfWeight]

end Gccft
