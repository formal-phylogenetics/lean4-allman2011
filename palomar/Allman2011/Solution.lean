module

public import Allman2011.Bridge
public import Allman2011.Model
public import Allman2011.FourTaxa.Formulas
public import Allman2011.FourTaxa.Proposition3
public import Allman2011.Identifiability.Theorem9
public import Allman2011.Identifiability.Corollary10
public import Allman2011.Nonbinary.Proposition11

/-!
# Solution: the Challenge's theorems, proved from the library

Each theorem of the Challenge, `palomar/Allman2011/Challenge.lean`, is restated word for word, with
the same name, in the namespace `Allman2011Challenge`, and proved from the library. The definitions
it uses are those of `Allman2011.Defs`, of which the Challenge holds a word-for-word copy. The
library states the paper's results with the definitions of `Phylogenetics`; `Allman2011.Bridge`
translates between the two (`SpeciesTree.toRoot`, `SpeciesTree.ofRoot`). The Solution is the entry
point of the library.
-/

@[expose] public section

namespace Allman2011Challenge

open Finset Real

variable {X : Type*} [Fintype X] [DecidableEq X]

/-- The unrooted gene tree probabilities are nonnegative. -/
theorem unrootedDist_nonneg {L : Type*} [Fintype L] [DecidableEq L] (σ : SpeciesTree X)
    (s : L → X) (T : Finset (Finset L)) : 0 ≤ σ.unrootedDist s T := by
  rw [← σ.unrootedDist_toRoot]
  exact Allman2011.unrootedDist_nonneg σ.toRoot s T

/-- The unrooted gene tree probabilities sum to `1`. -/
theorem unrootedDist_sum {L : Type*} [Fintype L] [DecidableEq L] (σ : SpeciesTree X)
    (s : L → X) : ∑ T, σ.unrootedDist s T = 1 := by
  rw [← σ.unrootedDist_toRoot]
  exact Allman2011.unrootedDist_sum σ.toRoot s

/-- Section 4.1, balanced species tree `((a,b):x,(c,d):y)` on `Fin 4`: the unrooted gene trees
`AB|CD`, `AC|BD`, `AD|BC` (each given by the sides of its splits, trivial ones included) have
probabilities `1 - (2/3)e^{-(x+y)}`, `(1/3)e^{-(x+y)}`, `(1/3)e^{-(x+y)}`. -/
theorem fourTaxa_balanced (σ : SpeciesTree (Fin 4))
    (hσ : σ.clusters = {univ, {0, 1}, {2, 3}, {0}, {1}, {2}, {3}}) :
    σ.unrootedDist id {{0, 1}, {2, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 - 2 / 3 * exp (-(σ.length {0, 1} + σ.length {2, 3})) ∧
    σ.unrootedDist id {{0, 2}, {1, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 / 3 * exp (-(σ.length {0, 1} + σ.length {2, 3})) ∧
    σ.unrootedDist id {{0, 3}, {1, 2}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 / 3 * exp (-(σ.length {0, 1} + σ.length {2, 3})) := by
  have h4 : (Phylogenetics.balanced4 : Finset (Finset (Fin 4))) =
      {univ, {0, 1}, {2, 3}, {0}, {1}, {2}, {3}} := by decide
  have t1 : Phylogenetics.treeOfClusters ({{0, 1}} : Finset (Finset (Fin 4))) =
      {{0, 1}, {2, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have t2 : Phylogenetics.treeOfClusters ({{0, 2}} : Finset (Finset (Fin 4))) =
      {{0, 2}, {1, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have t3 : Phylogenetics.treeOfClusters ({{0, 3}} : Finset (Finset (Fin 4))) =
      {{0, 3}, {1, 2}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have := Allman2011.fourTaxa_balanced σ.toRoot (hσ.trans h4.symm)
  rwa [t1, t2, t3, σ.unrootedDist_toRoot] at this

/-- Section 4.1, rooted caterpillar species tree `(((a,b):x,c):y,d)` on `Fin 4`: the unrooted gene
trees `AB|CD`, `AC|BD`, `AD|BC` have probabilities `1 - (2/3)e^{-x}`, `(1/3)e^{-x}`,
`(1/3)e^{-x}`. -/
theorem fourTaxa_caterpillar (σ : SpeciesTree (Fin 4))
    (hσ : σ.clusters = {univ, {0, 1}, {0, 1, 2}, {0}, {1}, {2}, {3}}) :
    σ.unrootedDist id {{0, 1}, {2, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 - 2 / 3 * exp (-σ.length {0, 1}) ∧
    σ.unrootedDist id {{0, 2}, {1, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 / 3 * exp (-σ.length {0, 1}) ∧
    σ.unrootedDist id {{0, 3}, {1, 2}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3},
        {0, 1, 2}} = 1 / 3 * exp (-σ.length {0, 1}) := by
  have h4 : (Phylogenetics.caterpillar4 : Finset (Finset (Fin 4))) =
      {univ, {0, 1}, {0, 1, 2}, {0}, {1}, {2}, {3}} := by decide
  have t1 : Phylogenetics.treeOfClusters ({{0, 1}} : Finset (Finset (Fin 4))) =
      {{0, 1}, {2, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have t2 : Phylogenetics.treeOfClusters ({{0, 2}} : Finset (Finset (Fin 4))) =
      {{0, 2}, {1, 3}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have t3 : Phylogenetics.treeOfClusters ({{0, 3}} : Finset (Finset (Fin 4))) =
      {{0, 3}, {1, 2}, {0}, {1}, {2}, {3}, {1, 2, 3}, {0, 2, 3}, {0, 1, 3}, {0, 1, 2}} := by decide
  have := Allman2011.fourTaxa_caterpillar σ.toRoot (hσ.trans h4.symm)
  rwa [t1, t2, t3, σ.unrootedDist_toRoot] at this

/-- **Theorem 9** (`thm:main`), `|X| ≥ 5`: the unrooted topological gene tree distribution arising from the
multispecies coalescent for samples of one lineage per taxon determines the binary metric species
tree. -/
theorem theorem9 (hX : 5 ≤ Fintype.card X) (σ σ' : SpeciesTree X) (hσ : σ.IsBinary)
    (hσ' : σ'.IsBinary) (h : σ.unrootedDist id = σ'.unrootedDist id) :
    σ.SameRootedMetricTree σ' :=
  (σ.sameRootedMetricTree_toRoot σ').1 <| Allman2011.theorem9 hX σ.toRoot σ'.toRoot hσ hσ' <| by
    rw [σ.unrootedDist_toRoot, σ'.unrootedDist_toRoot, h]

/-- **Theorem 9** (`thm:main`), `|X| = 4`: the unrooted gene tree distribution determines only the unrooted
metric species tree. -/
theorem theorem9_four (hX : Fintype.card X = 4) (σ σ' : SpeciesTree X) (hσ : σ.IsBinary)
    (hσ' : σ'.IsBinary) :
    σ.unrootedDist id = σ'.unrootedDist id ↔ σ.SameUnrootedMetricTree σ' := by
  rw [← σ.unrootedDist_toRoot, ← σ'.unrootedDist_toRoot, ← σ.sameUnrootedMetricTree_toRoot σ']
  exact Allman2011.theorem9_four hX σ.toRoot σ'.toRoot hσ hσ'

/-- **Proposition 3** (`prop:4taxa`). For `|X| = 4` taxa, `σ⁻` is identifiable from the unrooted gene tree
distribution, but `σ⁺` is not. -/
theorem proposition3 (hX : Fintype.card X = 4) :
    (∀ σ σ' : SpeciesTree X, σ.IsBinary → σ'.IsBinary →
        σ.unrootedDist id = σ'.unrootedDist id → σ.SameUnrootedMetricTree σ') ∧
      ∃ σ σ' : SpeciesTree X, σ.IsBinary ∧ σ'.IsBinary ∧
        σ.unrootedDist id = σ'.unrootedDist id ∧ ¬ σ.SameRootedMetricTree σ' := by
  obtain ⟨h1, σ₀, σ₀', hσ₀, hσ₀', hd, hne⟩ := Allman2011.proposition3 (X := X) hX
  refine ⟨fun σ σ' hσ hσ' h => (σ.sameUnrootedMetricTree_toRoot σ').1 <|
    h1 σ.toRoot σ'.toRoot hσ hσ' ?_, SpeciesTree.ofRoot σ₀, SpeciesTree.ofRoot σ₀', hσ₀, hσ₀', ?_,
    fun h => hne ?_⟩
  · rw [σ.unrootedDist_toRoot, σ'.unrootedDist_toRoot, h]
  · rw [← SpeciesTree.unrootedDist_toRoot, ← SpeciesTree.unrootedDist_toRoot,
      SpeciesTree.toRoot_ofRoot, SpeciesTree.toRoot_ofRoot, hd]
  · rw [← SpeciesTree.sameRootedMetricTree_toRoot, SpeciesTree.toRoot_ofRoot,
      SpeciesTree.toRoot_ofRoot] at h
    exact h

/-- **Corollary 10** (`cor:intra`). With `ℓ x > 0` lineages `(x, k)`, `k < ℓ x`, sampled from each taxon `x`, if
`|X| ≥ 4` and some `ℓ x ≥ 2`, or `|X| = 3` and two of the `ℓ x` are `≥ 2`, the unrooted gene tree
distribution determines the binary rooted species tree, its internal edge lengths, and the
pendant edge length of every taxon `x` with `ℓ x ≥ 2`. -/
theorem corollary10 (ℓ : X → ℕ) (hℓ : ∀ x, 0 < ℓ x)
    (hcond : (4 ≤ Fintype.card X ∧ ∃ x, 2 ≤ ℓ x) ∨
      (Fintype.card X = 3 ∧ ∃ x y, x ≠ y ∧ 2 ≤ ℓ x ∧ 2 ≤ ℓ y))
    (σ σ' : SpeciesTree X) (hσ : σ.IsBinary) (hσ' : σ'.IsBinary)
    (h : σ.unrootedDist (Sigma.fst : (Σ x, Fin (ℓ x)) → X) =
      σ'.unrootedDist (Sigma.fst : (Σ x, Fin (ℓ x)) → X)) :
    σ.SameRootedMetricTree σ' ∧ ∀ x, 2 ≤ ℓ x → σ.length {x} = σ'.length {x} :=
  Allman2011.corollary10 ℓ hℓ hcond σ.toRoot σ'.toRoot hσ hσ' <| by
    rw [σ.unrootedDist_toRoot, σ'.unrootedDist_toRoot, h]

/-- **Proposition 11** (`prop:nonbinary`), Theorem 9 for species trees that need not be binary,
`|X| ≥ 5`. -/
theorem proposition11_theorem9 (hX : 5 ≤ Fintype.card X) (σ σ' : SpeciesTree X)
    (h : σ.unrootedDist id = σ'.unrootedDist id) : σ.SameRootedMetricTree σ' :=
  (σ.sameRootedMetricTree_toRoot σ').1 <| Allman2011.proposition11_theorem9 hX σ.toRoot σ'.toRoot <|
    by rw [σ.unrootedDist_toRoot, σ'.unrootedDist_toRoot, h]

/-- **Proposition 11** (`prop:nonbinary`), Theorem 9 for species trees that need not be binary,
`|X| = 4`. -/
theorem proposition11_theorem9_four (hX : Fintype.card X = 4) (σ σ' : SpeciesTree X) :
    σ.unrootedDist id = σ'.unrootedDist id ↔ σ.SameUnrootedMetricTree σ' := by
  rw [← σ.unrootedDist_toRoot, ← σ'.unrootedDist_toRoot, ← σ.sameUnrootedMetricTree_toRoot σ']
  exact Allman2011.proposition11_theorem9_four hX σ.toRoot σ'.toRoot

/-- **Proposition 11** (`prop:nonbinary`), Corollary 10 for species trees that need not be
binary. -/
theorem proposition11_corollary10 (ℓ : X → ℕ) (hℓ : ∀ x, 0 < ℓ x)
    (hcond : (4 ≤ Fintype.card X ∧ ∃ x, 2 ≤ ℓ x) ∨
      (Fintype.card X = 3 ∧ ∃ x y, x ≠ y ∧ 2 ≤ ℓ x ∧ 2 ≤ ℓ y))
    (σ σ' : SpeciesTree X)
    (h : σ.unrootedDist (Sigma.fst : (Σ x, Fin (ℓ x)) → X) =
      σ'.unrootedDist (Sigma.fst : (Σ x, Fin (ℓ x)) → X)) :
    σ.SameRootedMetricTree σ' ∧ ∀ x, 2 ≤ ℓ x → σ.length {x} = σ'.length {x} :=
  Allman2011.proposition11_corollary10 ℓ hℓ hcond σ.toRoot σ'.toRoot <| by
    rw [σ.unrootedDist_toRoot, σ'.unrootedDist_toRoot, h]

end Allman2011Challenge
