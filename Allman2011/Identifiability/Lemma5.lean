module

public import Mathlib
public import Phylogenetics.MSC.Marginal
public import Allman2011.Basic.Data.Finset.Basic

/-!
# Lemma 5: marginalization

The distribution of the gene trees induced on a subset `S` of the taxa is the distribution under
the induced species tree `σ⁺(S)`: for unrooted gene trees (Lemma 5) and, as the paper remarks, for
rooted gene trees.

The proof combines pruning the species tree (`SpeciesTree.rootedDist_restrict`: the coalescent
of the lineages of `S` on `σ` is the coalescent on `σ(S)`) with dropping the lineages outside `S`
(`SpeciesTree.rootedDist_comp_embedding`, `SpeciesTree.unrootedDist_comp_embedding`, along the
inclusion `S ↪ X`, for which `restrictForest` is `restrictClusters S` and `restrictUnrooted` is
`restrictSplits S`).

`unrootedDist_restrict_eq`: equal unrooted gene tree distributions give equal distributions on
every induced subtree.
-/

@[expose] public section

namespace Allman2011

open Phylogenetics

open Finset

variable {X : Type*} [Fintype X] [DecidableEq X]

omit [Fintype X] in
/-- Restricting along the inclusion `S ↪ X` is restricting the clusters to `S`. -/
private theorem lemma5_restrictForest_subtype (S : Finset X) (G : Finset (Finset X)) :
    restrictForest (Function.Embedding.subtype (· ∈ S)) G = restrictClusters S G := by
  unfold restrictForest restrictClusters
  rw [filter_congr fun A _ => Finset.exists_subtype_mem_iff_inter_nonempty S A]
  exact image_congr fun A _ => Finset.filter_subtype_mem_eq_subtype S A

/-- Restricting an unrooted tree along the inclusion `S ↪ X` is the induced unrooted tree. -/
private theorem lemma5_restrictUnrooted_subtype (S : Finset X) (T : Finset (Finset X)) :
    restrictUnrooted (Function.Embedding.subtype (· ∈ S)) T = restrictSplits S T := by
  unfold restrictUnrooted restrictSplits
  have h : ∀ A : Finset X, (∃ l : S, (Function.Embedding.subtype (· ∈ S)) l ∉ A) ↔
      (Aᶜ ∩ S).Nonempty := by
    intro A
    rw [← Finset.exists_subtype_mem_iff_inter_nonempty S Aᶜ]
    simp only [mem_compl]
  rw [filter_congr fun A _ => and_congr (Finset.exists_subtype_mem_iff_inter_nonempty S A) (h A)]
  exact image_congr fun A _ => Finset.filter_subtype_mem_eq_subtype S A

/-- **Lemma 5** (`lem:margin`). If `S ⊆ X` and `T' ∈ 𝒯_S`, then
`ℙ_{σ⁺(S)}(T') = ∑_{T ∈ 𝒯_X, T(S) = T'} ℙ_{σ⁺}(T)`. -/
theorem lemma5 (σ : SpeciesTree X) (S : Finset X) (hS : S.Nonempty) (T' : Finset (Finset S)) :
    (σ.restrict S hS).unrootedDist id T' =
      ∑ T, if restrictSplits S T = T' then σ.unrootedDist id T else 0 := by
  have h1 : (σ.restrict S hS).unrootedDist id T' =
      σ.unrootedDist (id ∘ Function.Embedding.subtype (· ∈ S)) T' := by
    unfold SpeciesTree.unrootedDist
    simp_rw [σ.rootedDist_restrict S hS id]
    rfl
  rw [h1, σ.unrootedDist_comp_embedding id (Function.Embedding.subtype (· ∈ S)) T']
  simp_rw [lemma5_restrictUnrooted_subtype]

/-- **Lemma 5** (`lem:margin`), for rooted gene trees, as the paper remarks before the lemma. -/
theorem lemma5_rooted (σ : SpeciesTree X) (S : Finset X) (hS : S.Nonempty)
    (G' : Finset (Finset S)) :
    (σ.restrict S hS).rootedDist id G' =
      ∑ G, if restrictClusters S G = G' then σ.rootedDist id G else 0 := by
  rw [σ.rootedDist_restrict S hS id G']
  have h := σ.rootedDist_comp_embedding id (Function.Embedding.subtype (· ∈ S)) G'
  simp_rw [lemma5_restrictForest_subtype] at h
  exact h

/-- Equal unrooted gene tree distributions give equal distributions on every induced subtree
(Lemma 5). -/
theorem unrootedDist_restrict_eq {σ σ' : SpeciesTree X}
    (h : σ.unrootedDist id = σ'.unrootedDist id) (S : Finset X) (hS : S.Nonempty) :
    (σ.restrict S hS).unrootedDist id = (σ'.restrict S hS).unrootedDist id := by
  funext T'
  rw [lemma5, lemma5, h]

end Allman2011
