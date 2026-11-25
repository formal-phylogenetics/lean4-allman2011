module

public import Phylogenetics.Coalescent.Tavare

/-!
# Tavaré's formula for the number of lineages in Kingman's coalescent

[S. Tavaré, *Line-of-descent and genealogical processes, and their applications in population
genetics models*, Theoret. Population Biol. 26 (1984) 119–164]

For `1 ≤ j ≤ i`, the probability that `i` lineages coalesce into `j` lineages within time `t` is
`g_ij(t) = ∑_{k=j}^{i} exp(-k(k-1)t/2) a_ijk` with
`a_ijk = (2k-1)(-1)^{k-j} / (j!(k-j)!(j+k-1)) ∏_{m=0}^{k-1} (j+m)(i-m)/(i+m)`;
this is the paper's equation (2). It is stated for `deathProb i j t`, the transition probability
of the pure death process on the number of lineages with rates `k.choose 2`, with Tavaré's
coefficient `tavareCoeff i j k = a_ijk`, and proved by lean4-phylogenetics
(`Phylogenetics.deathProb_eq_tavare`, in `Phylogenetics.Coalescent.Tavare`).
-/

@[expose] public section

namespace External.Tavare1984

open Finset Real Phylogenetics

/-- **Tavaré's formula** (equation (2) of the paper): for `1 ≤ j ≤ i`, the probability that the
pure death process with rates `k.choose 2` goes from `i` to `j` lineages within time `t` is
`∑_{k=j}^{i} exp(-(k choose 2) t) a_ijk`. -/
theorem deathProb_eq_tavare (i j : ℕ) (hj : 1 ≤ j) (hji : j ≤ i) (t : ℝ) :
    deathProb i j t = ∑ k ∈ Icc j i, exp (-(((k.choose 2 : ℕ) : ℝ) * t)) * tavareCoeff i j k :=
  Phylogenetics.deathProb_eq_tavare i j hj hji t

end External.Tavare1984
