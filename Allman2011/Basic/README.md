# General mathematics

Lemmas that say nothing about phylogenetics, filed by field as Mathlib files them
(`Combinatorics/`, `Probability/`, … in `Allman2011/Basic/`) and named as Mathlib would name
them, so that they can be contributed to Mathlib. They import only Mathlib.

Before adding one, search Mathlib and lean4-phylogenetics (`Phylogenetics/ForMathlib/`): a lemma
that a second repository of the collection needs moves up the tree, to the lowest hub above both
(lean4-phylogenetics, docs/CONVENTIONS.md, Section 4).

| File | Lemmas | Where it could go |
| --- | --- | --- |
| [`Algebra/BigOperators/Group/List.lean`](Algebra/BigOperators/Group/List.lean) | [`List.sum_map_filter_eq_sum_map_ite`](Algebra/BigOperators/Group/List.lean#L14) | `Mathlib/Algebra/BigOperators/Group/List/Basic.lean` |
| [`Analysis/SpecialFunctions/Exp.lean`](Analysis/SpecialFunctions/Exp.lean) | [`Real.eq_of_mul_exp_neg_pow_add_eq`](Analysis/SpecialFunctions/Exp.lean#L13) | `Mathlib/Analysis/SpecialFunctions/Exp.lean` |
| [`Data/Fin/Basic.lean`](Data/Fin/Basic.lean) | [`Fin.eq_zero_or_one_or_two_or_three_or_four`](Data/Fin/Basic.lean#L13) | `Mathlib/Data/Fin/Basic.lean`, or `fin_cases` at each use |
| [`Data/Finset/Basic.lean`](Data/Finset/Basic.lean) | [`Finset.exists_subtype_mem_iff_inter_nonempty`](Data/Finset/Basic.lean#L15), [`Finset.filter_subtype_mem_eq_subtype`](Data/Finset/Basic.lean#L26), [`Finset.mem_iff_of_subtype_eq`](Data/Finset/Basic.lean#L34), [`Finset.subtype_eq_pair_iff`](Data/Finset/Basic.lean#L42), [`Finset.card_eq_four_of_ne`](Data/Finset/Basic.lean#L68), [`Finset.compl_map_equiv`](Data/Finset/Basic.lean#L75) | `Mathlib/Data/Finset/` (`Card.lean`, `Image.lean`), `Mathlib/Data/Fintype/Basic.lean` |
| [`Data/Fintype/Sigma.lean`](Data/Fintype/Sigma.lean) | [`Finset.card_filter_sigma_fst_eq`](Data/Fintype/Sigma.lean#L15) | `Mathlib/Data/Fintype/Sigma.lean` |
| [`Data/Nat/Bitwise.lean`](Data/Nat/Bitwise.lean) | [`Nat.lor_xor_cancel_left_of_land_eq_zero`](Data/Nat/Bitwise.lean#L12) | `Mathlib/Data/Nat/Bitwise.lean` |
| [`Order/Interval/Finset/Nat.lean`](Order/Interval/Finset/Nat.lean) | [`Nat.mem_Icc_one_iff_mem_range'`](Order/Interval/Finset/Nat.lean#L12) | `Mathlib/Order/Interval/Finset/Nat.lean` |
