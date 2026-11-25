module

public import Phylogenetics.MSC.Shapes

/-!
# Rooted tree shapes on three, four and five taxa

[A. Cayley, *On the theory of the analytical forms called trees*, Philos. Mag. 13 (1857)
172–176], cited in Section 5 of the paper: there are two unlabelled rooted shapes on three taxa,
five on four taxa and twelve on five taxa, binary or not. In the representation by hierarchies,
every hierarchy on `Fin n` is a relabelling of exactly one of the representatives listed by
lean4-phylogenetics (`Phylogenetics.shapes3`, `Phylogenetics.shapes4`, `Phylogenetics.shapes5`:
on five taxa the balanced tree, the caterpillar, the pseudocaterpillar and `P₁, …, P₉` of
Table 6), which proves it (`Phylogenetics.cayley_shapes`, in `Phylogenetics.MSC.Shapes`).
-/

@[expose] public section

namespace External.Cayley1857

open Finset Phylogenetics

/-- Every hierarchy on `Fin n` (`n = 3, 4, 5`) is a relabelling of exactly one of the listed
shapes: two on three taxa, five on four taxa, twelve on five taxa. -/
theorem cayley_shapes :
    (∀ H : Finset (Finset (Fin 3)), IsHierarchy H →
      ∃! k, k ∈ Icc 1 2 ∧ ∃ π : Fin 3 ≃ Fin 3, H = relabelFamily π (shapes3 k)) ∧
    (∀ H : Finset (Finset (Fin 4)), IsHierarchy H →
      ∃! k, k ∈ Icc 1 5 ∧ ∃ π : Fin 4 ≃ Fin 4, H = relabelFamily π (shapes4 k)) ∧
    (∀ H : Finset (Finset (Fin 5)), IsHierarchy H →
      ∃! k, k ∈ Icc 1 12 ∧ ∃ π : Fin 5 ≃ Fin 5, H = relabelFamily π (shapes5 k)) :=
  Phylogenetics.cayley_shapes

end External.Cayley1857
