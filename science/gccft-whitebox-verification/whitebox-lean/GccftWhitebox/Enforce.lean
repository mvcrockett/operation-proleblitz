/-
  GCCFT white-box formalization — minimum segment length enforcement.

  `_enforce_min_lengths` in `gccft_validator_v6.py` repeatedly finds the
  first segment shorter than its biological minimum (HELIX ≥ 4, SHEET ≥ 3,
  TURN ≥ 1), overwrites it with the label of its longer neighbour
  (previous neighbour wins ties; a lone segment becomes TURN), and
  restarts, until no short segment remains.

  This module formalizes that loop at the level of run-length encodings
  ("segments"), which is exactly the level the Python code itself works
  at (`_get_segments`). The bridge between label lists and segment lists
  is proved, not assumed:

    * `expand_runsOf : expand (runsOf l) = l` — segments lose no information;
    * `runsOf_expand : Normalized r → runsOf (expand r) = r` — and neither
      does expansion, for well-formed segment lists.

  Proved here:
    * the merge step preserves the total residue count (`sumCounts`);
    * the merge step never increases the segment count, and either
      strictly decreases it or leaves a list with no short segment;
    * the fuel-bounded loop therefore ends with NO short segment
      (`enforceRuns_noShort`), preserving the residue count;
    * the full enforcement on label lists preserves length
      (`enforce_length`) and its output has no short segment
      (`enforce_noShort`).
-/

import GccftWhitebox.Basic

namespace Gccft

/-- Minimum segment lengths (`_MIN_LEN` in the validator):
    HELIX ≥ 4, SHEET ≥ 3, TURN ≥ 1. -/
def minLen : Label → Nat
  | .helix => 4
  | .sheet => 3
  | .turn => 1

/-- A run-length encoding of a label list: (label, count) pairs,
    the formal counterpart of the validator's `_get_segments` output. -/
abbrev Runs := List (Label × Nat)

/-- Expand a run-length encoding back to a label list. -/
def expand : Runs → List Label
  | [] => []
  | (s, n) :: rest => List.replicate n s ++ expand rest

/-- Run-length encode a label list. -/
def runsOf : List Label → Runs
  | [] => []
  | x :: xs =>
    match runsOf xs with
    | [] => [(x, 1)]
    | (y, n) :: rest => if x = y then (y, n + 1) :: rest else (x, 1) :: (y, n) :: rest

/-- Total residue count of a run-length encoding. -/
def sumCounts : Runs → Nat
  | [] => 0
  | (_, n) :: rest => n + sumCounts rest

/-- No segment is shorter than its minimum length. -/
def NoShort (r : Runs) : Prop := ∀ y ∈ r, minLen y.1 ≤ y.2

/-- Every count is at least 1 (segments are nonempty). -/
def PosCounts (r : Runs) : Prop := ∀ y ∈ r, 1 ≤ y.2

/-- Well-formed segment list: positive counts and adjacent labels differ. -/
inductive Normalized : Runs → Prop where
  | nil : Normalized []
  | single : 1 ≤ n → Normalized [(s, n)]
  | cons : 1 ≤ n → s ≠ t → Normalized ((t, m) :: rest) →
      Normalized ((s, n) :: (t, m) :: rest)

/-! ## The list ↔ segments bridge -/

theorem runsOf_eq_nil {l : List Label} : runsOf l = [] → l = [] := by
  cases l with
  | nil => intro _; rfl
  | cons x xs =>
    intro h
    cases h' : runsOf xs with
    | nil => simp [runsOf, h'] at h
    | cons y rest =>
      obtain ⟨t, n⟩ := y
      by_cases hxy : x = t
      · have h1 : runsOf (x :: xs) = (t, n + 1) :: rest := by
          simp [runsOf, h', hxy]
        rw [h1] at h; simp at h
      · have h1 : runsOf (x :: xs) = (x, 1) :: (t, n) :: rest := by
          simp [runsOf, h', hxy]
        rw [h1] at h; simp at h

theorem expand_runsOf : ∀ l : List Label, expand (runsOf l) = l := by
  intro l
  induction l with
  | nil => rfl
  | cons x xs ih =>
    cases h : runsOf xs with
    | nil =>
      have hx : xs = [] := runsOf_eq_nil h
      subst hx; rfl
    | cons y rest =>
      obtain ⟨t, n⟩ := y
      have h2 : List.replicate n t ++ expand rest = xs := by
        have hih := ih
        rw [h] at hih
        exact hih
      by_cases hxy : x = t
      · subst hxy
        have h1 : runsOf (x :: xs) = (x, n + 1) :: rest := by simp [runsOf, h]
        rw [h1]
        show List.replicate (n + 1) x ++ expand rest = x :: xs
        rw [List.replicate_succ]
        show x :: (List.replicate n x ++ expand rest) = x :: xs
        rw [h2]
      · have h1 : runsOf (x :: xs) = (x, 1) :: (t, n) :: rest := by
          simp [runsOf, h, hxy]
        rw [h1]
        show x :: (List.replicate n t ++ expand rest) = x :: xs
        rw [h2]

theorem length_expand (r : Runs) : (expand r).length = sumCounts r := by
  induction r with
  | nil => rfl
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    simp [expand, sumCounts, List.length_append, ih]

theorem sumCounts_runsOf (l : List Label) : sumCounts (runsOf l) = l.length := by
  rw [← length_expand, expand_runsOf]

theorem posCounts_runsOf : ∀ l : List Label, PosCounts (runsOf l) := by
  intro l
  induction l with
  | nil => intro y hy; cases hy
  | cons x xs ih =>
    cases h : runsOf xs with
    | nil =>
      have h1 : runsOf (x :: xs) = [(x, 1)] := by simp [runsOf, h]
      rw [h1]
      intro y hy
      simp at hy
      obtain rfl : y = (x, 1) := hy
      exact Nat.le_refl 1
    | cons y rest =>
      obtain ⟨t, n⟩ := y
      by_cases hxy : x = t
      · subst hxy
        have h1 : runsOf (x :: xs) = (x, n + 1) :: rest := by simp [runsOf, h]
        rw [h1]
        intro z hz
        simp only [List.mem_cons] at hz
        rcases hz with rfl | hz
        · show 1 ≤ n + 1; omega
        · exact ih z (by rw [h]; exact List.mem_cons_of_mem _ hz)
      · have h1 : runsOf (x :: xs) = (x, 1) :: (t, n) :: rest := by
          simp [runsOf, h, hxy]
        rw [h1]
        intro z hz
        simp only [List.mem_cons] at hz
        rcases hz with rfl | rfl | hz
        · exact Nat.le_refl 1
        · exact ih (t, n) (by rw [h]; exact List.mem_cons_self)
        · exact ih z (by rw [h]; exact List.mem_cons_of_mem _ hz)

theorem normalized_runsOf : ∀ l : List Label, Normalized (runsOf l) := by
  intro l
  induction l with
  | nil => exact Normalized.nil
  | cons x xs ih =>
    cases h : runsOf xs with
    | nil =>
      have h1 : runsOf (x :: xs) = [(x, 1)] := by simp [runsOf, h]
      rw [h1]; exact Normalized.single (Nat.le_refl 1)
    | cons y rest =>
      obtain ⟨t, n⟩ := y
      by_cases hxy : x = t
      · subst hxy
        have h1 : runsOf (x :: xs) = (x, n + 1) :: rest := by simp [runsOf, h]
        rw [h1]
        cases rest with
        | nil => exact Normalized.single (by omega)
        | cons z rest' =>
          obtain ⟨u, k⟩ := z
          have hN : Normalized ((x, n) :: (u, k) :: rest') := by
            have hih := ih
            rwa [h] at hih
          cases hN with
          | cons hn hne ht => exact Normalized.cons (by omega) hne ht
      · have h1 : runsOf (x :: xs) = (x, 1) :: (t, n) :: rest := by
          simp [runsOf, h, hxy]
        rw [h1]
        have hN : Normalized ((t, n) :: rest) := by
          have hih := ih
          rwa [h] at hih
        exact Normalized.cons (Nat.le_refl 1) hxy hN

theorem norm_head_pos : ∀ {s : Label} {n : Nat} {r : Runs},
    Normalized ((s, n) :: r) → 1 ≤ n := by
  intro s n r h
  cases r with
  | nil => cases h with | single hn => exact hn
  | cons y ys => cases h with | cons hn _ _ => exact hn

theorem norm_posCounts : ∀ {r : Runs}, Normalized r → PosCounts r := by
  intro r
  induction r with
  | nil => intro _ y hy; cases hy
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    intro hr
    cases rest with
    | nil =>
      have hn : 1 ≤ n := by cases hr with | single hn => exact hn
      intro z hz
      simp at hz
      obtain rfl : z = (s, n) := hz
      exact hn
    | cons z rest' =>
      obtain ⟨t, m⟩ := z
      have hn : 1 ≤ n := by cases hr with | cons hn _ _ => exact hn
      have ht : Normalized ((t, m) :: rest') := by
        cases hr with | cons _ _ ht => exact ht
      have ih' := ih ht
      intro w hw
      simp only [List.mem_cons] at hw
      have hm : 1 ≤ m := norm_head_pos ht
      rcases hw with rfl | rfl | hw
      · exact hn
      · exact hm
      · exact ih' w (List.mem_cons_of_mem _ hw)

theorem norm_cons_tail : ∀ {x : Label × Nat} {r : Runs},
    Normalized (x :: r) → Normalized r := by
  intro x r h
  cases r with
  | nil => exact Normalized.nil
  | cons y ys => cases h with | cons _ _ ht => exact ht

theorem runsOf_replicate_append : ∀ (n : Nat) (s : Label) (l : List Label),
    1 ≤ n → (∀ t m rest, runsOf l = (t, m) :: rest → t ≠ s) →
    runsOf (List.replicate n s ++ l) = (s, n) :: runsOf l := by
  intro n
  induction n with
  | zero => intro s l h; omega
  | succ n ih =>
    intro s l hn hne
    cases n with
    | zero =>
      show runsOf (List.replicate 1 s ++ l) = (s, 1) :: runsOf l
      have hr : List.replicate 1 s ++ l = s :: l := rfl
      rw [hr]
      cases h : runsOf l with
      | nil => simp [runsOf, h]
      | cons y rest =>
        obtain ⟨t, m⟩ := y
        have hts : t ≠ s := hne t m rest h
        simp [runsOf, h, Ne.symm hts]
    | succ n =>
      have hr : List.replicate (n + 2) s ++ l
          = s :: (List.replicate (n + 1) s ++ l) := rfl
      rw [hr]
      have ih' := ih s l (by omega) hne
      simp [runsOf, ih']

theorem runsOf_expand : ∀ {r : Runs}, Normalized r → runsOf (expand r) = r := by
  intro r
  induction r with
  | nil => intro _; rfl
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    intro hr
    cases rest with
    | nil =>
      have hn : 1 ≤ n := by cases hr with | single hn => exact hn
      show runsOf (expand [(s, n)]) = [(s, n)]
      simp only [expand, List.append_nil]
      have hrep : ∀ k, 1 ≤ k → runsOf (List.replicate k s) = [(s, k)] := by
        intro k
        induction k with
        | zero => intro hk; omega
        | succ k ihk =>
          intro hk
          cases k with
          | zero => rfl
          | succ k =>
            have hr2 : List.replicate (k + 2) s
                = s :: List.replicate (k + 1) s := rfl
            rw [hr2]
            have ih' := ihk (by omega)
            simp [runsOf, ih']
      exact hrep n hn
    | cons z rest' =>
      obtain ⟨t, m⟩ := z
      have hn : 1 ≤ n := norm_head_pos hr
      have hne : s ≠ t := by cases hr with | cons _ hne _ => exact hne
      have hN : Normalized ((t, m) :: rest') := norm_cons_tail hr
      have ih' : runsOf (expand ((t, m) :: rest')) = (t, m) :: rest' := ih hN
      show runsOf (List.replicate n s ++ expand ((t, m) :: rest'))
          = (s, n) :: (t, m) :: rest'
      rw [runsOf_replicate_append n s _ hn]
      · rw [ih']
      · intro t' m' rest'' h'
        rw [ih'] at h'
        have ht' : t' = t := by
          have h2 := congrArg (fun l : Runs => l.head?) h'
          simp only [List.head?_cons, Option.some.injEq, Prod.mk.injEq] at h2
          exact h2.1.symm
        intro hts
        exact hne (hts.symm.trans ht')

/-! ## The merge step -/

/-- Find the first short segment. On success returns
    `(revBefore, shortRun, after)` where `revBefore` is the list of
    (non-short) segments before it, in reverse order, so the previous
    neighbour is its head — mirroring how the Python loop scans segments
    left to right and restarts after each merge. -/
def findShort : Runs → Runs → Option (Runs × (Label × Nat) × Runs)
  | acc, [] => none
  | acc, (s, n) :: rest =>
    if n < minLen s then some (acc, (s, n), rest)
    else findShort ((s, n) :: acc) rest

theorem findShort_spec : ∀ (acc r : Runs), (∀ y ∈ acc, minLen y.1 ≤ y.2) →
    match findShort acc r with
    | none => ∀ y ∈ r, minLen y.1 ≤ y.2
    | some (b, x, a) =>
        b.reverse ++ x :: a = acc.reverse ++ r ∧
        (∀ y ∈ b, minLen y.1 ≤ y.2) ∧ x.2 < minLen x.1 := by
  intro acc r
  induction r generalizing acc with
  | nil => intro _; exact fun y hy => by simp at hy
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    intro hacc
    by_cases hshort : n < minLen s
    · have hfind : findShort acc ((s, n) :: rest) = some (acc, (s, n), rest) := by
        simp [findShort, hshort]
      rw [hfind]
      exact ⟨by simp, hacc, hshort⟩
    · have hfind : findShort acc ((s, n) :: rest)
          = findShort ((s, n) :: acc) rest := by
        simp [findShort, hshort]
      rw [hfind]
      have hacc' : ∀ y ∈ (s, n) :: acc, minLen y.1 ≤ y.2 := by
        intro z hz
        simp at hz
        rcases hz with rfl | hz
        · exact Nat.le_of_not_lt hshort
        · exact hacc z hz
      have ih' := ih _ hacc'
      match hm : findShort ((s, n) :: acc) rest with
      | none =>
        rw [hm] at ih'
        intro z hz
        simp at hz
        rcases hz with rfl | hz
        · exact Nat.le_of_not_lt hshort
        · exact ih' z hz
      | some (b, x, a) =>
        rw [hm] at ih'
        obtain ⟨hdec, hb, hx⟩ := ih'
        refine ⟨?_, hb, hx⟩
        have hrev : ((s, n) :: acc).reverse = acc.reverse ++ [(s, n)] :=
          List.reverse_cons
        rw [hrev] at hdec
        rw [hdec, List.append_assoc, List.cons_append, List.nil_append]

/-- One merge step of `_enforce_min_lengths`: overwrite the first short
    segment with its longer neighbour's label (previous wins ties, a lone
    segment becomes TURN), merging with same-label neighbours — exactly
    the effect of the Python step, which recomputes segments afterwards. -/
def mergeStep (r : Runs) : Runs :=
  match findShort [] r with
  | none => r
  | some (b, (s, n), a) =>
    match b, a with
    | [], [] => [(Label.turn, n)]
    | [], (t, m) :: rest => (t, n + m) :: rest
    | (pl, pn) :: b', [] => b'.reverse ++ [(pl, pn + n)]
    | (pl, pn) :: b', (t, m) :: rest =>
      if m ≤ pn then
        if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ rest
        else b'.reverse ++ [(pl, pn + n), (t, m)] ++ rest
      else
        if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ rest
        else b'.reverse ++ [(pl, pn), (t, n + m)] ++ rest

theorem sumCounts_append (l₁ l₂ : Runs) :
    sumCounts (l₁ ++ l₂) = sumCounts l₁ + sumCounts l₂ := by
  induction l₁ with
  | nil => simp [sumCounts]
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    simp [sumCounts, List.cons_append, ih, Nat.add_assoc]

theorem sumCounts_reverse (r : Runs) : sumCounts r.reverse = sumCounts r := by
  induction r with
  | nil => rfl
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    rw [List.reverse_cons, sumCounts_append, ih]
    simp [sumCounts, Nat.add_comm]


/-- Decomposition facts for a successful `findShort`: the segment list is
    exactly `b.reverse ++ short :: after`, the prefix segments are all
    non-short, the found segment is short, and the length and residue
    count decompose accordingly. -/
theorem findShort_decomp {r b a : Runs} {s : Label} {n : Nat}
    (h : findShort [] r = some (b, (s, n), a)) :
    b.reverse ++ (s, n) :: a = r ∧ (∀ y ∈ b, minLen y.1 ≤ y.2) ∧ n < minLen s ∧
    b.length + 1 + a.length = r.length ∧
    sumCounts r = sumCounts b + n + sumCounts a := by
  have spec := findShort_spec [] r (fun y hy => by simp at hy)
  rw [h] at spec
  obtain ⟨hdec, hb, hx⟩ := spec
  simp only [List.reverse_nil, List.nil_append] at hdec
  refine ⟨hdec, hb, hx, ?_, ?_⟩
  · have hlen := congrArg List.length hdec
    simp only [List.length_append, List.length_reverse, List.length_cons] at hlen
    omega
  · have hsum := congrArg sumCounts hdec
    rw [sumCounts_append, sumCounts_reverse] at hsum
    simp only [sumCounts] at hsum
    omega

/-- The merge step preserves the total residue count. -/
theorem mergeStep_sumCounts (r : Runs) : sumCounts (mergeStep r) = sumCounts r := by
  unfold mergeStep
  cases h : findShort [] r with
  | none => rfl
  | some res =>
    obtain ⟨b, ⟨s, n⟩, a⟩ := res
    obtain ⟨hdec, -, -, -, hsum⟩ := findShort_decomp h
    cases b with
    | nil =>
      cases a with
      | nil => simp [sumCounts] at hsum ⊢; omega
      | cons y a' =>
        obtain ⟨t, m⟩ := y
        simp [sumCounts] at hsum ⊢; omega
    | cons y b' =>
      obtain ⟨pl, pn⟩ := y
      cases a with
      | nil =>
        rw [sumCounts_append, sumCounts_reverse]
        simp [sumCounts] at hsum ⊢; omega
      | cons z a' =>
        obtain ⟨t, m⟩ := z
        by_cases hle : m ≤ pn
        · by_cases heq : t = pl
          · simp [sumCounts, sumCounts_append, sumCounts_reverse, hle, heq] at hsum ⊢
            omega
          · simp [sumCounts, sumCounts_append, sumCounts_reverse, hle, heq] at hsum ⊢
            omega
        · by_cases heq : pl = t
          · simp [sumCounts, sumCounts_append, sumCounts_reverse, hle, heq] at hsum ⊢
            omega
          · simp [sumCounts, sumCounts_append, sumCounts_reverse, hle, heq] at hsum ⊢
            omega

/-- The merge step never increases the segment count. -/
theorem mergeStep_length_le (r : Runs) : (mergeStep r).length ≤ r.length := by
  unfold mergeStep
  cases h : findShort [] r with
  | none => exact Nat.le_refl _
  | some res =>
    obtain ⟨b, ⟨s, n⟩, a⟩ := res
    obtain ⟨-, -, -, hlen, -⟩ := findShort_decomp h
    cases b with
    | nil =>
      cases a with
      | nil => simp at hlen ⊢; omega
      | cons y a' =>
        obtain ⟨t, m⟩ := y
        simp at hlen ⊢; omega
    | cons y b' =>
      obtain ⟨pl, pn⟩ := y
      cases a with
      | nil =>
        simp [List.length_append, List.length_reverse] at hlen ⊢; omega
      | cons z a' =>
        obtain ⟨t, m⟩ := z
        by_cases hle : m ≤ pn
        · by_cases heq : t = pl
          · simp only [hle, heq]
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
          · simp only [hle, heq]
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
        · by_cases heq : pl = t
          · simp only [hle, heq]
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
          · simp only [hle, heq]
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega

/-- The merge step either strictly decreases the segment count, or its
    output already has no short segment (the lone-segment case, where the
    segment becomes TURN). This is the termination argument for the loop,
    and it mirrors the Python: each pass merges one short segment into a
    neighbour, or finishes. -/
theorem mergeStep_length_lt_or_noShort (r : Runs) (hpos : PosCounts r) :
    (mergeStep r).length < r.length ∨ NoShort (mergeStep r) := by
  unfold mergeStep
  cases h : findShort [] r with
  | none =>
    refine Or.inr ?_
    have spec := findShort_spec [] r (fun y hy => by simp at hy)
    rw [h] at spec
    exact spec
  | some res =>
    obtain ⟨b, ⟨s, n⟩, a⟩ := res
    obtain ⟨hdec, -, -, hlen, -⟩ := findShort_decomp h
    have hn : 1 ≤ n := hpos (s, n) (by rw [← hdec]; simp)
    cases b with
    | nil =>
      cases a with
      | nil =>
        refine Or.inr ?_
        intro y hy
        simp at hy
        obtain rfl : y = (Label.turn, n) := hy
        show minLen Label.turn ≤ n
        exact hn
      | cons y a' =>
        obtain ⟨t, m⟩ := y
        refine Or.inl ?_
        simp at hlen ⊢; omega
    | cons y b' =>
      obtain ⟨pl, pn⟩ := y
      cases a with
      | nil =>
        refine Or.inl ?_
        simp [List.length_append, List.length_reverse] at hlen ⊢; omega
      | cons z a' =>
        obtain ⟨t, m⟩ := z
        by_cases hle : m ≤ pn
        · by_cases heq : t = pl
          · simp only [hle, heq]
            refine Or.inl ?_
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
          · simp only [hle, heq]
            refine Or.inl ?_
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
        · by_cases heq : pl = t
          · simp only [hle, heq]
            refine Or.inl ?_
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega
          · simp only [hle, heq]
            refine Or.inl ?_
            simp [List.length_append, List.length_reverse] at hlen ⊢; omega

/-- The merge step preserves positivity of counts. -/
theorem mergeStep_posCounts (r : Runs) (hpos : PosCounts r) :
    PosCounts (mergeStep r) := by
  unfold mergeStep
  cases h : findShort [] r with
  | none => exact hpos
  | some res =>
    obtain ⟨b, ⟨s, n⟩, a⟩ := res
    obtain ⟨hdec, -, -, -, -⟩ := findShort_decomp h
    have hn : 1 ≤ n := hpos (s, n) (by rw [← hdec]; simp)
    have hmem : ∀ y ∈ b, 1 ≤ y.2 := fun y hy =>
      hpos y (by rw [← hdec]; exact List.mem_append_left _ (List.mem_reverse.mpr hy))
    have hmemA : ∀ y ∈ a, 1 ≤ y.2 := fun y hy =>
      hpos y (by rw [← hdec]; exact List.mem_append_right _ (List.mem_cons_of_mem _ hy))
    cases b with
    | nil =>
      cases a with
      | nil =>
        intro y hy
        simp at hy
        obtain rfl : y = (Label.turn, n) := hy
        exact hn
      | cons y a' =>
        obtain ⟨t, m⟩ := y
        have hm : 1 ≤ m := hmemA (t, m) (List.mem_cons_self)
        intro z hz
        simp at hz
        rcases hz with rfl | hz
        · show 1 ≤ n + m; omega
        · exact hmemA z (List.mem_cons_of_mem _ hz)
    | cons y b' =>
      obtain ⟨pl, pn⟩ := y
      have hpn : 1 ≤ pn := hmem (pl, pn) (List.mem_cons_self)
      have hmemB : ∀ z ∈ b', 1 ≤ z.2 := fun z hz => hmem z (List.mem_cons_of_mem _ hz)
      cases a with
      | nil =>
        intro z hz
        simp only [List.mem_append, List.mem_reverse, List.mem_cons] at hz
        rcases hz with hz | rfl | hz
        · exact hmemB z hz
        · show 1 ≤ pn + n; omega
        · cases hz
      | cons w a' =>
        obtain ⟨t, m⟩ := w
        have hm : 1 ≤ m := hmemA (t, m) (List.mem_cons_self)
        have hmemA' : ∀ z ∈ a', 1 ≤ z.2 :=
          fun z hz => hmemA z (List.mem_cons_of_mem _ hz)
        by_cases hle : m ≤ pn
        · by_cases heq : t = pl
          · show PosCounts (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_left hle, ite_eq_left heq]
            intro z hz
            simp only [List.mem_append, List.mem_reverse, List.mem_cons, List.mem_singleton] at hz
            rcases hz with (hz | rfl | hz) | hz
            · exact hmemB z hz
            · show 1 ≤ pn + n + m; omega
            · cases hz
            · exact hmemA' z hz
          · show PosCounts (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_left hle, ite_eq_right heq]
            intro z hz
            simp only [List.mem_append, List.mem_reverse, List.mem_cons, List.mem_singleton] at hz
            rcases hz with (hz | rfl | rfl | hz) | hz
            · exact hmemB z hz
            · show 1 ≤ pn + n; omega
            · exact hm
            · cases hz
            · exact hmemA' z hz
        · by_cases heq : pl = t
          · show PosCounts (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_right hle, ite_eq_left heq]
            intro z hz
            simp only [List.mem_append, List.mem_reverse, List.mem_cons, List.mem_singleton] at hz
            rcases hz with (hz | rfl | hz) | hz
            · exact hmemB z hz
            · show 1 ≤ pn + n + m; omega
            · cases hz
            · exact hmemA' z hz
          · show PosCounts (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_right hle, ite_eq_right heq]
            intro z hz
            simp only [List.mem_append, List.mem_reverse, List.mem_cons, List.mem_singleton] at hz
            rcases hz with (hz | rfl | rfl | hz) | hz
            · exact hmemB z hz
            · exact hpn
            · show 1 ≤ n + m; omega
            · cases hz
            · exact hmemA' z hz

/-! ## Normalized segment lists: append API -/

/-- Label of the first segment, if any. -/
def headLabel : Runs → Option Label
  | [] => none
  | (s, _) :: _ => some s

/-- Label of the last segment, if any. -/
def lastLabel : Runs → Option Label
  | [] => none
  | [(s, _)] => some s
  | _ :: rest => lastLabel rest

theorem reverse_ne_nil {l : List α} (h : l ≠ []) : l.reverse ≠ [] := by
  cases l with
  | nil => exact absurd rfl h
  | cons x xs => simp [List.reverse_cons]

theorem lastLabel_append_singleton : ∀ (l : Runs) (s : Label) (n : Nat),
    lastLabel (l ++ [(s, n)]) = some s := by
  intro l
  induction l with
  | nil => intro s n; simp [lastLabel]
  | cons y rest ih =>
    obtain ⟨t, m⟩ := y
    intro s n
    cases rest with
    | nil => simp [lastLabel]
    | cons z rest' =>
      obtain ⟨u, k⟩ := z
      exact ih s n

theorem lastLabel_append_pair : ∀ (l : Runs) (x y : Label × Nat),
    lastLabel (l ++ [x, y]) = some y.1 := by
  intro l
  induction l with
  | nil => intro x y; simp [lastLabel]
  | cons z rest ih =>
    intro x y
    cases rest with
    | nil => simp [lastLabel]
    | cons w rest' => exact ih x y

theorem norm_append_left : ∀ {l₁ l₂ : Runs},
    Normalized (l₁ ++ l₂) → Normalized l₁ := by
  intro l₁
  induction l₁ with
  | nil => intro _ _; exact Normalized.nil
  | cons x xs ih =>
    obtain ⟨s, n⟩ := x
    intro l₂ h
    cases xs with
    | nil =>
      cases l₂ with
      | nil =>
        have h' : Normalized [(s, n)] := h
        cases h' with | single hn => exact Normalized.single hn
      | cons y ys =>
        obtain ⟨t, m⟩ := y
        have h' : Normalized ((s, n) :: (t, m) :: ys) := h
        have hn : 1 ≤ n := by cases h' with | cons hn _ _ => exact hn
        exact Normalized.single hn
    | cons y ys =>
      obtain ⟨t, m⟩ := y
      have h' : Normalized ((s, n) :: (t, m) :: (ys ++ l₂)) := h
      cases h' with
      | cons hn hne htail => exact Normalized.cons hn hne (ih htail)

theorem norm_append_right : ∀ {l₁ l₂ : Runs},
    Normalized (l₁ ++ l₂) → Normalized l₂ := by
  intro l₁
  induction l₁ with
  | nil => intro _ h; exact h
  | cons x xs ih =>
    obtain ⟨s, n⟩ := x
    intro l₂ h
    cases xs with
    | nil =>
      cases l₂ with
      | nil => exact Normalized.nil
      | cons y ys =>
        obtain ⟨t, m⟩ := y
        have h' : Normalized ((s, n) :: (t, m) :: ys) := h
        cases h' with | cons _ _ ht => exact ht
    | cons y ys =>
      obtain ⟨t, m⟩ := y
      have h' : Normalized ((s, n) :: (t, m) :: (ys ++ l₂)) := h
      have ht : Normalized ((t, m) :: (ys ++ l₂)) := by
        cases h' with | cons _ _ ht => exact ht
      exact ih ht

theorem norm_append_boundary : ∀ {l₁ l₂ : Runs},
    Normalized (l₁ ++ l₂) → l₁ ≠ [] → l₂ ≠ [] →
    lastLabel l₁ ≠ headLabel l₂ := by
  intro l₁
  induction l₁ with
  | nil => intro _ _ h1; exact absurd rfl h1
  | cons x xs ih =>
    obtain ⟨s, n⟩ := x
    intro l₂ h _ h2
    cases xs with
    | nil =>
      cases l₂ with
      | nil => exact absurd rfl h2
      | cons y ys =>
        obtain ⟨t, m⟩ := y
        have h' : Normalized ((s, n) :: (t, m) :: ys) := h
        have hne : s ≠ t := by cases h' with | cons _ hne _ => exact hne
        show lastLabel [(s, n)] ≠ headLabel ((t, m) :: ys)
        intro hh
        apply hne
        have e1 : lastLabel [(s, n)] = some s := by simp only [lastLabel]
        have e2 : headLabel ((t, m) :: ys) = some t := rfl
        rw [e1, e2] at hh
        exact Option.some.inj hh
    | cons y ys =>
      obtain ⟨t, m⟩ := y
      have h' : Normalized ((s, n) :: (t, m) :: (ys ++ l₂)) := h
      have ht : Normalized ((t, m) :: (ys ++ l₂)) := by
        cases h' with | cons _ _ ht => exact ht
      have ih' := ih ht (by simp) h2
      have hl : lastLabel ((s, n) :: (t, m) :: ys) = lastLabel ((t, m) :: ys) := by
        simp only [lastLabel]
      rwa [hl]

theorem norm_append : ∀ {l₁ l₂ : Runs},
    Normalized l₁ → Normalized l₂ →
    (l₁ = [] ∨ l₂ = [] ∨ lastLabel l₁ ≠ headLabel l₂) →
    Normalized (l₁ ++ l₂) := by
  intro l₁
  induction l₁ with
  | nil => intro _ _ h2 _; exact h2
  | cons x xs ih =>
    obtain ⟨s, n⟩ := x
    intro l₂ h1 h2 hB
    cases xs with
    | nil =>
      cases l₂ with
      | nil => simpa using h1
      | cons y ys =>
        obtain ⟨t, m⟩ := y
        have hn : 1 ≤ n := by cases h1 with | single hn => exact hn
        have hne : s ≠ t := by
          rcases hB with h | h | h
          · simp at h
          · simp at h
          · intro hst
            apply h
            have e1 : lastLabel [(s, n)] = some s := by simp only [lastLabel]
            have e2 : headLabel ((t, m) :: ys) = some t := rfl
            rw [e1, e2, hst]
        exact Normalized.cons hn hne h2
    | cons y ys =>
      obtain ⟨t, m⟩ := y
      have hn : 1 ≤ n := by cases h1 with | cons hn _ _ => exact hn
      have hne : s ≠ t := by cases h1 with | cons _ hne _ => exact hne
      have htail : Normalized ((t, m) :: ys) := by
        cases h1 with | cons _ _ ht => exact ht
      have hB' : (t, m) :: ys = [] ∨ l₂ = [] ∨
          lastLabel ((t, m) :: ys) ≠ headLabel l₂ := by
        rcases hB with h | h | h
        · simp at h
        · exact Or.inr (Or.inl h)
        · refine Or.inr (Or.inr ?_)
          have hl : lastLabel ((s, n) :: (t, m) :: ys)
              = lastLabel ((t, m) :: ys) := by simp only [lastLabel]
          rwa [hl] at h
      exact Normalized.cons hn hne (ih htail h2 hB')

/-! ## The merge step preserves well-formedness -/

/-- The merge step preserves `Normalized`: merging a short segment into a
    neighbour cannot create equal adjacent labels or non-positive counts,
    because the merged segment takes a neighbour's label and the cases
    where both neighbours share that label merge all three at once —
    exactly what recomputing the segments (as the Python does) yields. -/
theorem mergeStep_normalized (r : Runs) (hN : Normalized r) :
    Normalized (mergeStep r) := by
  unfold mergeStep
  cases h : findShort [] r with
  | none => exact hN
  | some res =>
    obtain ⟨b, ⟨s, n⟩, a⟩ := res
    obtain ⟨hdec, -, -, -, -⟩ := findShort_decomp h
    have hN' : Normalized (b.reverse ++ (s, n) :: a) := by
      rw [hdec]; exact hN
    have hNB : Normalized (b.reverse) := norm_append_left hN'
    have hNsa : Normalized ((s, n) :: a) := norm_append_right hN'
    have hNa : Normalized a := norm_cons_tail hNsa
    have hpos : PosCounts r := norm_posCounts hN
    have hn : 1 ≤ n := hpos (s, n) (by
      rw [← hdec]; exact List.mem_append_right _ (List.mem_cons_self))
    cases b with
    | nil =>
      cases a with
      | nil => exact Normalized.single hn
      | cons y a' =>
        obtain ⟨t, m⟩ := y
        have hm : 1 ≤ m := norm_head_pos hNa
        cases a' with
        | nil => exact Normalized.single (by omega)
        | cons z a'' =>
          obtain ⟨u, k⟩ := z
          have htu : t ≠ u := by cases hNa with | cons _ hne _ => exact hne
          exact Normalized.cons (by omega) htu (norm_cons_tail hNa)
    | cons y b' =>
      obtain ⟨pl, pn⟩ := y
      have hpn : 1 ≤ pn := hpos (pl, pn) (by
        rw [← hdec]
        exact List.mem_append_left _ (List.mem_reverse.mpr (List.mem_cons_self)))
      have hNB2 : Normalized (b'.reverse ++ [(pl, pn)]) := by
        have hNB' := hNB
        rwa [List.reverse_cons] at hNB'
      have hNb'rev : Normalized (b'.reverse) := norm_append_left hNB2
      have hBndPrev : b'.reverse = [] ∨
          lastLabel (b'.reverse) ≠ headLabel [(pl, pn + n)] := by
        by_cases hb' : b' = []
        · exact Or.inl (by rw [hb']; rfl)
        · refine Or.inr ?_
          have hne := norm_append_boundary hNB2 (reverse_ne_nil hb') (by simp)
          have e : headLabel [(pl, pn)] = some pl := rfl
          have e2 : headLabel [(pl, pn + n)] = some pl := rfl
          rw [e] at hne
          rw [e2]
          exact hne
      cases a with
      | nil =>
        exact norm_append (l₁ := b'.reverse) (l₂ := [(pl, pn + n)])
          hNb'rev (Normalized.single (by omega)) (by
            rcases hBndPrev with h | h
            · exact Or.inl h
            · exact Or.inr (Or.inr h))
      | cons w a' =>
        obtain ⟨t, m⟩ := w
        have hm : 1 ≤ m := norm_head_pos hNa
        have hNa' : Normalized a' := norm_cons_tail hNa
        by_cases hle : m ≤ pn
        · by_cases heq : t = pl
          · show Normalized (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_left hle, ite_eq_left heq]
            have hBnd : (b'.reverse ++ [(pl, pn + n + m)]) = [] ∨ a' = [] ∨
                lastLabel (b'.reverse ++ [(pl, pn + n + m)]) ≠ headLabel a' := by
              cases a' with
              | nil => exact Or.inr (Or.inl rfl)
              | cons z a'' =>
                obtain ⟨u, k⟩ := z
                have htu : pl ≠ u := by
                  have hne : t ≠ u := by
                    cases hNa with | cons _ hne _ => exact hne
                  intro hpu
                  exact hne (heq.trans hpu)
                refine Or.inr (Or.inr ?_)
                have hl : lastLabel (b'.reverse ++ [(pl, pn + n + m)]) = some pl :=
                  lastLabel_append_singleton _ _ _
                rw [hl]
                intro hh
                apply htu
                have e2 : headLabel ((u, k) :: a'') = some u := rfl
                rw [e2] at hh
                exact Option.some.inj hh
            have hX : Normalized (b'.reverse ++ [(pl, pn + n + m)]) :=
              norm_append (l₁ := b'.reverse) (l₂ := [(pl, pn + n + m)])
                hNb'rev (Normalized.single (by omega)) (by
                  rcases hBndPrev with h | h
                  · exact Or.inl h
                  · exact Or.inr (Or.inr h))
            exact norm_append (l₁ := b'.reverse ++ [(pl, pn + n + m)])
              (l₂ := a') hX hNa' hBnd
          · show Normalized (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_left hle, ite_eq_right heq]
            have hmid : Normalized ((pl, pn + n) :: [(t, m)]) :=
              Normalized.cons (by omega) (Ne.symm heq) (Normalized.single hm)
            have hX : Normalized (b'.reverse ++ [(pl, pn + n), (t, m)]) :=
              norm_append (l₁ := b'.reverse) (l₂ := [(pl, pn + n), (t, m)])
                hNb'rev hmid (by
                  rcases hBndPrev with h | h
                  · exact Or.inl h
                  · exact Or.inr (Or.inr h))
            have hBnd : (b'.reverse ++ [(pl, pn + n), (t, m)]) = [] ∨ a' = [] ∨
                lastLabel (b'.reverse ++ [(pl, pn + n), (t, m)]) ≠ headLabel a' := by
              cases a' with
              | nil => exact Or.inr (Or.inl rfl)
              | cons z a'' =>
                obtain ⟨u, k⟩ := z
                have htu : t ≠ u := by cases hNa with | cons _ hne _ => exact hne
                refine Or.inr (Or.inr ?_)
                have hl : lastLabel (b'.reverse ++ [(pl, pn + n), (t, m)])
                    = some t := lastLabel_append_pair _ _ _
                rw [hl]
                intro hh
                apply htu
                have e2 : headLabel ((u, k) :: a'') = some u := rfl
                rw [e2] at hh
                exact Option.some.inj hh
            exact norm_append (l₁ := b'.reverse ++ [(pl, pn + n), (t, m)])
              (l₂ := a') hX hNa' hBnd
        · by_cases heq : pl = t
          · show Normalized (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_right hle, ite_eq_left heq]
            have hBnd : (b'.reverse ++ [(t, pn + n + m)]) = [] ∨ a' = [] ∨
                lastLabel (b'.reverse ++ [(t, pn + n + m)]) ≠ headLabel a' := by
              cases a' with
              | nil => exact Or.inr (Or.inl rfl)
              | cons z a'' =>
                obtain ⟨u, k⟩ := z
                have htu : t ≠ u := by cases hNa with | cons _ hne _ => exact hne
                refine Or.inr (Or.inr ?_)
                have hl : lastLabel (b'.reverse ++ [(t, pn + n + m)]) = some t :=
                  lastLabel_append_singleton _ _ _
                rw [hl]
                intro hh
                apply htu
                have e2 : headLabel ((u, k) :: a'') = some u := rfl
                rw [e2] at hh
                exact Option.some.inj hh
            have hX : Normalized (b'.reverse ++ [(t, pn + n + m)]) :=
              norm_append (l₁ := b'.reverse) (l₂ := [(t, pn + n + m)])
                hNb'rev (Normalized.single (by omega)) (by
                  rcases hBndPrev with h | h
                  · exact Or.inl h
                  · refine Or.inr (Or.inr ?_)
                    have e : headLabel [(pl, pn + n)] = some pl := rfl
                    rw [e, heq] at h
                    exact h)
            exact norm_append (l₁ := b'.reverse ++ [(t, pn + n + m)])
              (l₂ := a') hX hNa' hBnd
          · show Normalized (if m ≤ pn then
              if t = pl then b'.reverse ++ [(pl, pn + n + m)] ++ a'
              else b'.reverse ++ [(pl, pn + n), (t, m)] ++ a'
            else if pl = t then b'.reverse ++ [(t, pn + n + m)] ++ a'
            else b'.reverse ++ [(pl, pn), (t, n + m)] ++ a')
            rw [ite_eq_right hle, ite_eq_right heq]
            have hmid : Normalized ((pl, pn) :: [(t, n + m)]) :=
              Normalized.cons hpn heq (Normalized.single (by omega))
            have hX : Normalized (b'.reverse ++ [(pl, pn), (t, n + m)]) :=
              norm_append (l₁ := b'.reverse) (l₂ := [(pl, pn), (t, n + m)])
                hNb'rev hmid (by
                  rcases hBndPrev with h | h
                  · exact Or.inl h
                  · exact Or.inr (Or.inr h))
            have hBnd : (b'.reverse ++ [(pl, pn), (t, n + m)]) = [] ∨ a' = [] ∨
                lastLabel (b'.reverse ++ [(pl, pn), (t, n + m)]) ≠ headLabel a' := by
              cases a' with
              | nil => exact Or.inr (Or.inl rfl)
              | cons z a'' =>
                obtain ⟨u, k⟩ := z
                have htu : t ≠ u := by cases hNa with | cons _ hne _ => exact hne
                refine Or.inr (Or.inr ?_)
                have hl : lastLabel (b'.reverse ++ [(pl, pn), (t, n + m)])
                    = some t := lastLabel_append_pair _ _ _
                rw [hl]
                intro hh
                apply htu
                have e2 : headLabel ((u, k) :: a'') = some u := rfl
                rw [e2] at hh
                exact Option.some.inj hh
            exact norm_append (l₁ := b'.reverse ++ [(pl, pn), (t, n + m)])
              (l₂ := a') hX hNa' hBnd

/-! ## The enforcement loop -/

/-- The enforcement loop, fuel-bounded: apply `mergeStep` until no short
    segment remains. Fuel `segments + 1` always suffices (proved below),
    which is the formal content of "the Python `while changed` loop
    terminates". -/
def enforceRuns : Nat → Runs → Runs
  | 0, r => r
  | fuel + 1, r => if findShort [] r = none then r else enforceRuns fuel (mergeStep r)

theorem enforceRuns_of_noShort {r : Runs} (h : findShort [] r = none) (fuel : Nat) :
    enforceRuns fuel r = r := by
  cases fuel with
  | zero => rfl
  | succ k => simp [enforceRuns, h]

theorem findShort_eq_none_of_noShort {r : Runs} (h : NoShort r) :
    findShort [] r = none := by
  cases hfs : findShort [] r with
  | none => rfl
  | some res =>
    obtain ⟨b, x, a⟩ := res
    have spec := findShort_spec [] r (fun y hy => by simp at hy)
    rw [hfs] at spec
    obtain ⟨hdec, -, hx⟩ := spec
    have hmem : x ∈ b.reverse ++ x :: a :=
      List.mem_append_right _ (List.mem_cons_self)
    rw [hdec] at hmem
    simp only [List.reverse_nil, List.nil_append] at hmem
    exact absurd (h x hmem) (Nat.not_le.mpr hx)

/-- The loop's invariants, in one induction: with fuel at least the
    segment count, enforcement ends with no short segment, and it
    preserves positivity, well-formedness, and the residue count. -/
theorem enforceRuns_invariants : ∀ (fuel : Nat) (r : Runs),
    PosCounts r → Normalized r → r.length ≤ fuel →
    NoShort (enforceRuns fuel r) ∧ PosCounts (enforceRuns fuel r) ∧
    Normalized (enforceRuns fuel r) ∧
    sumCounts (enforceRuns fuel r) = sumCounts r := by
  intro fuel
  induction fuel with
  | zero =>
    intro r hpos hN hlen
    have hr : r = [] := by
      cases r with
      | nil => rfl
      | cons x xs => simp at hlen
    subst hr
    exact ⟨fun y hy => absurd hy List.not_mem_nil,
      fun y hy => absurd hy List.not_mem_nil, Normalized.nil, rfl⟩
  | succ k ih =>
    intro r hpos hN hlen
    by_cases h : findShort [] r = none
    · have hstep : enforceRuns (k + 1) r = r := by simp [enforceRuns, h]
      rw [hstep]
      have spec := findShort_spec [] r (fun y hy => by simp at hy)
      rw [h] at spec
      exact ⟨spec, hpos, hN, rfl⟩
    · have hstep : enforceRuns (k + 1) r = enforceRuns k (mergeStep r) := by
        simp [enforceRuns, h]
      rw [hstep]
      have hpos' := mergeStep_posCounts r hpos
      have hN' := mergeStep_normalized r hN
      rcases mergeStep_length_lt_or_noShort r hpos with hlt | hns
      · have hlen' : (mergeStep r).length ≤ k := by omega
        obtain ⟨a1, a2, a3, a4⟩ := ih (mergeStep r) hpos' hN' hlen'
        exact ⟨a1, a2, a3, by rw [a4, mergeStep_sumCounts]⟩
      · have hnone : findShort [] (mergeStep r) = none :=
          findShort_eq_none_of_noShort hns
        rw [enforceRuns_of_noShort hnone]
        exact ⟨hns, hpos', hN', mergeStep_sumCounts r⟩

/-- Segment count never exceeds residue count (counts are positive). -/
theorem length_le_sumCounts (r : Runs) (hpos : PosCounts r) :
    r.length ≤ sumCounts r := by
  induction r with
  | nil => exact Nat.zero_le _
  | cons y rest ih =>
    obtain ⟨s, n⟩ := y
    have hn : 1 ≤ n := hpos (s, n) (List.mem_cons_self)
    have ih' := ih (fun z hz => hpos z (List.mem_cons_of_mem _ hz))
    simp only [List.length_cons, sumCounts]
    omega

/-- Full enforcement on label lists: the formal counterpart of
    `_enforce_min_lengths`, with fuel `length + 1`, which always suffices
    because the segment count is at most the residue count. -/
def enforce (l : List Label) : List Label :=
  expand (enforceRuns (l.length + 1) (runsOf l))

/-- Enforcement preserves the number of residues. -/
theorem enforce_length (l : List Label) : (enforce l).length = l.length := by
  unfold enforce
  rw [length_expand]
  have hlen : (runsOf l).length ≤ l.length + 1 := by
    have h1 := length_le_sumCounts _ (posCounts_runsOf l)
    rw [sumCounts_runsOf] at h1
    omega
  obtain ⟨-, -, -, hsum⟩ := enforceRuns_invariants (l.length + 1) (runsOf l)
    (posCounts_runsOf l) (normalized_runsOf l) hlen
  rw [hsum, sumCounts_runsOf]

/-- Enforcement delivers its documented guarantee: in the output, every
    maximal HELIX segment has length at least 4 and every maximal SHEET
    segment has length at least 3 (TURN's minimum is 1, so it is
    unconstrained). Stated via `runsOf`, the segment decomposition of
    the output list itself. -/
theorem enforce_noShort (l : List Label) : NoShort (runsOf (enforce l)) := by
  unfold enforce
  have hlen : (runsOf l).length ≤ l.length + 1 := by
    have h1 := length_le_sumCounts _ (posCounts_runsOf l)
    rw [sumCounts_runsOf] at h1
    omega
  obtain ⟨hns, -, hN, -⟩ := enforceRuns_invariants (l.length + 1) (runsOf l)
    (posCounts_runsOf l) (normalized_runsOf l) hlen
  rwa [runsOf_expand hN]

end Gccft
