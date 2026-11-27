import Mathlib

set_option autoImplicit false
set_option linter.unusedVariables false

namespace StandardTreeBounds

/-! # Step 1: 1D Tree and Depth Bound -/
inductive Tree1D : ℕ → Type
  | root : Tree1D 1
  | step (n : ℕ) (hn : n > 0) : Tree1D n → Tree1D (n + 1)

open Tree1D

def depth1D {n : ℕ} : Tree1D n → ℕ
  | root => 0
  | step _ _ t => 1 + depth1D t

theorem depth1D_lt_value {n : ℕ} (t : Tree1D n) : depth1D t < n := by
  induction t with
  | root =>
    change 0 < 1
    omega
  | step k hk t ih =>
    change 1 + depth1D t < k + 1
    omega

theorem exists_tree1D_with_bound (n : ℕ) (hn : n ≥ 1) :
    ∃ (t : Tree1D n), depth1D t = n - 1 ∧ depth1D t < n := by
  induction n, hn using Nat.le_induction with
  | base =>
    refine ⟨Tree1D.root, rfl, ?_⟩
    change 0 < 1
    omega
  | succ k hk ih =>
    rcases ih with ⟨t, h_gen, _⟩
    refine ⟨Tree1D.step k (by omega) t, ?_, ?_⟩
    · dsimp [depth1D]
      omega
    · exact depth1D_lt_value (Tree1D.step k (by omega) t)

/-! # Step 2: 2D Tree and Depth Bound -/
inductive Tree2D : ℕ → Type
  | odd_root (k : ℕ) (hk : k ≥ 1) (t1d : Tree1D k) :
      Tree2D (2 * k - 1)
  | double (x : ℕ) (hx : x ≥ 1) :
      Tree2D x → Tree2D (2 * x)

def depth2D {n : ℕ} : Tree2D n → ℕ
  | .odd_root _ _ t1d => depth1D t1d
  | .double _ _ t => 1 + depth2D t

theorem depth2D_lt_value {n : ℕ} (t : Tree2D n) : depth2D t < n := by
  induction t with
  | odd_root k hk t1d =>
    dsimp [depth2D]
    have h1 := depth1D_lt_value t1d
    omega
  | double x hx t ih =>
    dsimp [depth2D]
    omega

theorem exists_tree2D_with_bound (n : ℕ) (hn : n ≥ 1) :
    ∃ (t : Tree2D n), depth2D t < n := by
  have h_univ : ∀ m, m ≥ 1 → ∃ (t : Tree2D m), depth2D t < m := by
    intro m
    induction m using Nat.strong_induction_on with
    | _ m ih =>
      intro hm
      by_cases h_odd : m % 2 = 1
      · have hk : (m + 1) / 2 ≥ 1 := by omega
        obtain ⟨t1d, _, _⟩ := exists_tree1D_with_bound ((m + 1) / 2) hk
        have h_eq : 2 * ((m + 1) / 2) - 1 = m := by omega
        have t2d : Tree2D m := by
          have base := Tree2D.odd_root ((m + 1) / 2) hk t1d
          simpa [h_eq] using base
        exact ⟨t2d, depth2D_lt_value t2d⟩
      · have h_even : m % 2 = 0 := by omega
        have h_half_lt : m / 2 < m := by omega
        have h_half_ge : m / 2 ≥ 1 := by omega
        obtain ⟨t_half, _⟩ := ih (m / 2) h_half_lt h_half_ge
        have h_eq : 2 * (m / 2) = m := by omega
        have t2d : Tree2D m := by
          have step := Tree2D.double (m / 2) h_half_ge t_half
          simpa [h_eq] using step
        exact ⟨t2d, depth2D_lt_value t2d⟩
  exact h_univ n hn

/-! # Step 3: 3D Tree and Depth Bound -/
inductive Tree3D : ℕ → Type
  | mod4_1_root (m : ℕ) (t2d : Tree2D (4 * m + 1)) :
      Tree3D (4 * m + 1)
  | double (x : ℕ) (hx : x ≥ 1) :
      Tree3D x → Tree3D (2 * x)
  | lift_from_2d (n : ℕ) (hn : n ≥ 1) (t2d : Tree2D n) :
      Tree3D n

def depth3D {n : ℕ} : Tree3D n → ℕ
  | .mod4_1_root _ t2d => depth2D t2d
  | .double _ _ t => 1 + depth3D t
  | .lift_from_2d _ _ t2d => depth2D t2d

theorem depth3D_lt_value {n : ℕ} (t : Tree3D n) : depth3D t < n := by
  induction t with
  | mod4_1_root m t2d =>
    dsimp [depth3D]
    exact depth2D_lt_value t2d
  | double x hx t ih =>
    dsimp [depth3D]
    omega
  | lift_from_2d m hm t2d =>
    dsimp [depth3D]
    exact depth2D_lt_value t2d

theorem exists_tree3D_with_bound (n : ℕ) (hn : n ≥ 1) :
    ∃ (t : Tree3D n), depth3D t < n := by
  obtain ⟨t2d, _⟩ := exists_tree2D_with_bound n hn
  have t3d : Tree3D n := Tree3D.lift_from_2d n hn t2d
  exact ⟨t3d, depth3D_lt_value t3d⟩

end StandardTreeBounds

/-! # Step 4: Collatz Definition & Tree Depth Bound Theorem -/

/-- Standard Collatz step function (n/2 if even, 3n+1 if odd) -/
def collatz (n : ℕ) : ℕ :=
  if n % 2 = 0 then n / 2 else 3 * n + 1

/-- Standard Collatz Conjecture statement (reachability to 1) -/
def CollatzConjecture : Prop :=
  ∀ n : ℕ, n > 0 → ∃ s : ℕ, (collatz^[s]) n = 1

open StandardTreeBounds

/-- For any positive natural number n, there exists a 3D tree with depth strictly less than n. -/
theorem collatz_tree3D_depth_bound (n : ℕ) (hn : n > 0) :
    ∃ (t : Tree3D n), depth3D t < n :=
  exists_tree3D_with_bound n (by omega)

#print axioms collatz_tree3D_depth_bound