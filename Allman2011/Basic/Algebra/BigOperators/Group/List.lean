module

public import Mathlib.Algebra.BigOperators.Group.List.Basic
public import Mathlib.Basic.Real.Basic

/-! # Sums over a filtered list -/

@[expose] public section

namespace List

/-- The sum of `g` over the elements of `L` that satisfy `p` is the sum over `L` of `g` on them and
`0` elsewhere. -/
theorem sum_map_filter_eq_sum_map_ite {α : Type*} (L : List α) (p : α → Bool) (g : α → ℝ) :
    ((L.filter p).map g).sum = (L.map fun j => if p j = true then g j else 0).sum := by
  induction L with
  | nil => simp
  | cons a L ih => by_cases h : p a = true <;> simp [h, ih]

end List
