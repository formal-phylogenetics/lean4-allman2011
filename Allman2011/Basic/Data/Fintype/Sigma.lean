module

public import Mathlib.Data.Fintype.Sigma
public import Mathlib.Data.Fintype.Fin

/-! # The fibres of `Sigma.fst` -/

@[expose] public section

namespace Finset

variable {X : Type*} [Fintype X] [DecidableEq X]

/-- The fibre of `Sigma.fst` over `x` in `Σ x, Fin (n x)` has `n x` elements. -/
theorem card_filter_sigma_fst_eq (n : X → ℕ) (x : X) :
    #(univ.filter fun p : (Σ y, Fin (n y)) => p.1 = x) = n x := by
  have : (univ.filter fun p : (Σ y, Fin (n y)) => p.1 = x) =
      (univ : Finset (Fin (n x))).map ⟨Sigma.mk x, sigma_mk_injective⟩ := by
    ext ⟨y, i⟩
    simp only [mem_filter, mem_univ, true_and, mem_map, Function.Embedding.coeFn_mk]
    constructor
    · rintro rfl
      exact ⟨i, rfl⟩
    · rintro ⟨j, hj⟩
      exact (Sigma.mk.inj_iff.1 hj).1.symm
  rw [this, card_map, card_univ, Fintype.card_fin]

end Finset
