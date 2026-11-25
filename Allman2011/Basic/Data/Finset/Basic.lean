module

public import Mathlib.Data.Fintype.Basic
public import Mathlib.Data.Finset.Card

/-! # Traces of finite sets on a subset, complements and small sets -/

@[expose] public section

namespace Finset

variable {X : Type*} [DecidableEq X]

/-- Some element of `S` lies in `A` if and only if `A` meets `S`. -/
theorem exists_subtype_mem_iff_inter_nonempty (S A : Finset X) :
    (∃ l : S, (Function.Embedding.subtype (· ∈ S)) l ∈ A) ↔ (A ∩ S).Nonempty := by
  simp only [Function.Embedding.coe_subtype]
  constructor
  · rintro ⟨l, hl⟩
    exact ⟨l, mem_inter.2 ⟨hl, l.2⟩⟩
  · rintro ⟨x, hx⟩
    rw [mem_inter] at hx
    exact ⟨⟨x, hx.2⟩, hx.1⟩

/-- The elements of `S` that lie in `A` form the trace of `A` on `S`. -/
theorem filter_subtype_mem_eq_subtype (S A : Finset X) :
    (univ.filter fun l : S => (Function.Embedding.subtype (· ∈ S)) l ∈ A) =
      A.subtype (· ∈ S) := by
  ext l
  rw [mem_filter, mem_subtype, Function.Embedding.coe_subtype]
  exact and_iff_right (mem_univ l)

/-- Two sets with the same trace on `S` contain the same elements of `S`. -/
theorem mem_iff_of_subtype_eq {S A C : Finset X}
    (h : C.subtype (· ∈ S) = A.subtype (· ∈ S)) {x : X} (hx : x ∈ S) : x ∈ C ↔ x ∈ A := by
  have h1 : (⟨x, hx⟩ : S) ∈ C.subtype (· ∈ S) ↔ (⟨x, hx⟩ : S) ∈ A.subtype (· ∈ S) := by
    rw [h]
  simpa only [mem_subtype] using h1

/-- On a set `S = {x, y, z}` of three elements, the trace of `A` is `{x, y}` exactly when `A`
contains `x` and `y` but not `z`. -/
theorem subtype_eq_pair_iff {S A : Finset X} {x y z : X}
    (hS : ∀ w ∈ S, w = x ∨ w = y ∨ w = z) (hx : x ∈ S) (hy : y ∈ S) (hz : z ∈ S) (hxz : x ≠ z)
    (hyz : y ≠ z) :
    A.subtype (· ∈ S) = {⟨x, hx⟩, ⟨y, hy⟩} ↔ x ∈ A ∧ y ∈ A ∧ z ∉ A := by
  constructor
  · intro h
    have hx' : (⟨x, hx⟩ : S) ∈ A.subtype (· ∈ S) := by
      rw [h]
      exact mem_insert_self _ _
    have hy' : (⟨y, hy⟩ : S) ∈ A.subtype (· ∈ S) := by
      rw [h]
      exact mem_insert_of_mem (mem_singleton_self _)
    refine ⟨mem_subtype.1 hx', mem_subtype.1 hy', fun hzA => ?_⟩
    have hz' : (⟨z, hz⟩ : S) ∈ A.subtype (· ∈ S) := mem_subtype.2 hzA
    rw [h, mem_insert, mem_singleton, Subtype.mk.injEq, Subtype.mk.injEq] at hz'
    rcases hz' with h1 | h1
    exacts [hxz h1.symm, hyz h1.symm]
  · rintro ⟨hxA, hyA, hzA⟩
    ext ⟨w, hw⟩
    rw [mem_subtype, mem_insert, mem_singleton, Subtype.mk.injEq, Subtype.mk.injEq]
    rcases hS w hw with rfl | rfl | rfl
    · simp [hxA]
    · simp [hyA]
    · simp [hzA, hxz.symm, hyz.symm]

/-- Four distinct elements form a set of four elements. -/
theorem card_eq_four_of_ne {a a' b b' : X} (haa : a ≠ a') (hab : a ≠ b) (hab' : a ≠ b')
    (ha'b : a' ≠ b) (ha'b' : a' ≠ b') (hbb : b ≠ b') : #({a, a', b, b'} : Finset X) = 4 := by
  rw [card_insert_of_notMem, card_insert_of_notMem, card_pair hbb]
  · simp [ha'b, ha'b']
  · simp [haa, hab, hab']

/-- The complement of the image of `A` under an equivalence is the image of the complement. -/
theorem compl_map_equiv [Fintype X] {Y : Type*} [Fintype Y] [DecidableEq Y] (e : X ≃ Y)
    (A : Finset X) : (A.map e.toEmbedding)ᶜ = Aᶜ.map e.toEmbedding := by
  ext y
  simp [Finset.mem_map_equiv]

end Finset
