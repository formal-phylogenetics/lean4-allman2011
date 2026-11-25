module

public import Allman2011.Defs
public import Phylogenetics.MSC.Defs

/-!
# The Challenge's definitions agree with those of lean4-phylogenetics

The Challenge states its theorems with the definitions of `Allman2011.Defs`, in the namespace
`Allman2011Challenge`, which import only Mathlib. The library states the paper's results with the
definitions of `Phylogenetics`, which have the same text. This module proves that the two agree,
so that the Solution can apply the library's theorems to the Challenge's statements.

* `SpeciesTree.toRoot`, `SpeciesTree.ofRoot`: the species tree of `Phylogenetics` with the same
  clusters and lengths, and back; `toRoot_ofRoot`, `ofRoot_toRoot`.
* `forestDist_eq`: the two multispecies coalescents agree; hence `SpeciesTree.rootedDist_toRoot`,
  `SpeciesTree.unrootedDist_toRoot`.
* `SpeciesTree.isBinary_toRoot`, `SpeciesTree.sameRootedMetricTree_toRoot`,
  `SpeciesTree.sameUnrootedMetricTree_toRoot`: the properties and relations of species trees
  agree.
-/

@[expose] public section

namespace Allman2011Challenge

open Finset

variable {X : Type*} [Fintype X] [DecidableEq X] {L : Type*} [Fintype L] [DecidableEq L]

theorem childClusters_eq (H : Finset (Finset X)) (A : Finset X) :
    childClusters H A = Phylogenetics.childClusters H A := rfl

omit [Fintype X] in
theorem sampledForest_eq (s : L → X) (A : Finset X) :
    sampledForest s A = Phylogenetics.sampledForest s A := rfl

theorem populationKernel_eq (len : Finset X → ℝ) (A : Finset X) :
    (populationKernel len A : Matrix (Finset (Finset L)) (Finset (Finset L)) ℝ) =
      Phylogenetics.populationKernel len A := rfl

theorem unroot_eq (G : Finset (Finset L)) : unroot G = Phylogenetics.unroot G := rfl

/-- The multispecies coalescent of the Challenge is that of `Phylogenetics`. -/
theorem forestDist_eq (H : Finset (Finset X)) (len : Finset X → ℝ) (s : L → X) (A : Finset X)
    (G : Finset (Finset L)) : forestDist H len s A G = Phylogenetics.forestDist H len s A G := by
  induction h : #A using Nat.strong_induction_on generalizing A G with
  | _ n ih =>
    rw [forestDist, Phylogenetics.forestDist]
    refine sum_congr rfl fun f _ => ?_
    congr 1
    refine prod_congr rfl fun B _ => ih #B.1 ?_ B.1 (f B) rfl
    exact h ▸ card_lt_card (mem_filter.1 B.2).2.1

namespace SpeciesTree

/-- The species tree of `Phylogenetics` with the same clusters and lengths. -/
def toRoot (σ : SpeciesTree X) : Phylogenetics.SpeciesTree X where
  clusters := σ.clusters
  univ_mem := σ.univ_mem
  singleton_mem := σ.singleton_mem
  nonempty_of_mem := σ.nonempty_of_mem
  laminar := σ.laminar
  length := σ.length
  length_pos := σ.length_pos

/-- The species tree of the Challenge with the same clusters and lengths as a species tree of
`Phylogenetics`. -/
def ofRoot (σ : Phylogenetics.SpeciesTree X) : SpeciesTree X where
  clusters := σ.clusters
  univ_mem := σ.univ_mem
  singleton_mem := σ.singleton_mem
  nonempty_of_mem := σ.nonempty_of_mem
  laminar := σ.laminar
  length := σ.length
  length_pos := σ.length_pos

@[simp] theorem toRoot_clusters (σ : SpeciesTree X) : σ.toRoot.clusters = σ.clusters := rfl

@[simp] theorem toRoot_length (σ : SpeciesTree X) : σ.toRoot.length = σ.length := rfl

@[simp] theorem ofRoot_clusters (σ : Phylogenetics.SpeciesTree X) :
    (ofRoot σ).clusters = σ.clusters := rfl

@[simp] theorem ofRoot_length (σ : Phylogenetics.SpeciesTree X) : (ofRoot σ).length = σ.length :=
  rfl

@[simp] theorem toRoot_ofRoot (σ : Phylogenetics.SpeciesTree X) : (ofRoot σ).toRoot = σ := rfl

@[simp] theorem ofRoot_toRoot (σ : SpeciesTree X) : ofRoot σ.toRoot = σ := rfl

theorem isBinary_toRoot (σ : SpeciesTree X) : σ.toRoot.IsBinary ↔ σ.IsBinary := Iff.rfl

theorem rootedDist_toRoot (σ : SpeciesTree X) (s : L → X) :
    σ.toRoot.rootedDist s = σ.rootedDist s :=
  funext fun G => (forestDist_eq σ.clusters σ.length s univ G).symm

theorem unrootedDist_toRoot (σ : SpeciesTree X) (s : L → X) :
    σ.toRoot.unrootedDist s = σ.unrootedDist s := by
  funext T
  change (∑ G, if Phylogenetics.unroot G = T then σ.toRoot.rootedDist s G else 0) =
    ∑ G, if unroot G = T then σ.rootedDist s G else 0
  rw [rootedDist_toRoot]
  rfl

theorem unrootedLength_toRoot (σ : SpeciesTree X) :
    σ.toRoot.unrootedLength = σ.unrootedLength := rfl

theorem sameRootedMetricTree_toRoot (σ σ' : SpeciesTree X) :
    σ.toRoot.SameRootedMetricTree σ'.toRoot ↔ σ.SameRootedMetricTree σ' := Iff.rfl

theorem sameUnrootedMetricTree_toRoot (σ σ' : SpeciesTree X) :
    σ.toRoot.SameUnrootedMetricTree σ'.toRoot ↔ σ.SameUnrootedMetricTree σ' := Iff.rfl

end SpeciesTree

end Allman2011Challenge
