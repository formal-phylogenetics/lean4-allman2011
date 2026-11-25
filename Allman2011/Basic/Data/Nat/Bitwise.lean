module

public import Mathlib.Data.Nat.Bitwise

/-! # Bitwise operations on natural numbers -/

@[expose] public section

namespace Nat

/-- If `c` and `d` have no bit in common, removing the bits of `c` from `c ||| d` leaves `d`. -/
theorem lor_xor_cancel_left_of_land_eq_zero {c d : ℕ} (h : c &&& d = 0) : (c ||| d) ^^^ c = d := by
  apply Nat.eq_of_testBit_eq
  intro i
  have hi := congrArg (fun x => x.testBit i) h
  simp only [Nat.testBit_and, Nat.zero_testBit] at hi
  simp only [Nat.testBit_xor, Nat.testBit_or]
  cases hc : c.testBit i <;> cases hd : d.testBit i <;> simp_all

end Nat
