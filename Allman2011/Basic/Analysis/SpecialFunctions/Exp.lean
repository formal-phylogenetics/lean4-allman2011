module

public import Mathlib.Analysis.SpecialFunctions.Exp

/-! # Recovering an argument of the exponential from an affine relation -/

@[expose] public section

namespace Real

/-- A real number `x` is determined by an affine relation `v = A * exp (-x) ^ n + B` with `A ≠ 0`
and `n ≠ 0`. -/
theorem eq_of_mul_exp_neg_pow_add_eq {x y A B v : ℝ} {n : ℕ} (hn : n ≠ 0) (hA : A ≠ 0)
    (hx : v = A * exp (-x) ^ n + B) (hy : v = A * exp (-y) ^ n + B) : x = y := by
  have h1 : exp (-x) ^ n = exp (-y) ^ n := mul_left_cancel₀ hA (by linarith)
  have h2 := Real.exp_injective ((pow_left_inj₀ (exp_pos _).le (exp_pos _).le hn).1 h1)
  linarith

end Real
