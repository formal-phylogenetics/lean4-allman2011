module

public import Mathlib.Data.Fintype.Fin
public import Mathlib.Tactic.FinCases

/-! # The elements of `Fin 5` -/

@[expose] public section

namespace Fin

/-- Every element of `Fin 5` is one of `0, 1, 2, 3, 4`. -/
theorem eq_zero_or_one_or_two_or_three_or_four (x : Fin 5) :
    x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
  fin_cases x <;> simp

end Fin
