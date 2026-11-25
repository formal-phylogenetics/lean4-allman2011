module

public import Mathlib.Order.Interval.Finset.Nat

/-! # Intervals of natural numbers as lists -/

@[expose] public section

namespace Nat

/-- `j ∈ [1, N]` if and only if `j` is in the list `[1, …, N]`. -/
theorem mem_Icc_one_iff_mem_range' {j N : ℕ} : j ∈ Finset.Icc 1 N ↔ j ∈ List.range' 1 N := by
  rw [Finset.mem_Icc, List.mem_range'_1]
  omega

end Nat
