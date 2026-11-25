# Allman et al. 2011: identifying the rooted species tree from unrooted gene trees, in Lean

[![CI](https://github.com/vltanh/lean4-allman2011/actions/workflows/lean_action_ci.yml/badge.svg)](https://github.com/vltanh/lean4-allman2011/actions/workflows/lean_action_ci.yml)

A Lean 4 formalization of Elizabeth S. Allman, James H. Degnan and John A. Rhodes (2011),
"Identifying the rooted species tree from the distribution of unrooted gene trees under the
coalescent", [J. Math. Biol. 62 (2011) 833-862](https://doi.org/10.1007/s00285-010-0355-7),
[arXiv:0912.4472v2](https://arxiv.org/abs/0912.4472v2). Under the multispecies coalescent, gene
trees evolve inside a species tree: lineages coalesce by Kingman's coalescent within each ancestral
population. The paper shows that the distribution of *unrooted* topological gene trees, with one
lineage sampled per taxon, determines the rooted species tree and its internal branch lengths when
there are at least five taxa (Theorem 9), while for four taxa it determines only the unrooted
species tree (Proposition 3); with several lineages from some taxa, fewer taxa suffice and pendant
lengths are determined too (Corollary 10); and all of this holds for nonbinary species trees
(Proposition 11).

The formalization is unconditional: every result of the paper is proved, by the paper's
arguments, together with the results it cites.

This paper belongs to the hub [lean4-phylo-species-tree](https://github.com/vltanh/lean4-phylo-species-tree),
on species tree estimation, in the collection rooted at [lean4-phylogenetics](https://github.com/vltanh/lean4-phylogenetics).
Its theorems are stated on the types of lean4-phylogenetics, which holds the model (species trees,
Kingman's coalescent, the multispecies coalescent) and the general results, so that other
repositories of the collection can use them.

## Status

| Part of the paper | Status |
| --- | --- |
| Section 1: equation (1), Proposition 1, Corollary 2, the counts of trees | Proved; the counts are in lean4-phylogenetics |
| Sections 2–3: the model, equations (2) and (3), the worked examples, polynomiality | Proved |
| Section 4.1: four taxa, Proposition 3 | Proved |
| Section 4.2: Lemma 4, Tables 1–3, the inequalities (4)–(6) and that there are no others | Proved |
| Section 4.3: Lemma 5, Corollary 6, Propositions 7 and 8, equations (7)–(9), Theorem 9, Corollary 10 | Proved |
| Section 5: nonbinary species trees, Proposition 11 | Proved |
| Section 6: the comparison of two split probabilities | Proved, in its corrected direction (E5) |
| Appendices A–C: Tables 4–7, equations (11)–(13) | Proved |
| Remarks without a mathematical statement, listed in the report's Section 9 | Not formalized |

## Main results

The library states them on the species trees of lean4-phylogenetics, `Phylogenetics.SpeciesTree`,
in the namespace [`Allman2011`](Allman2011). The Challenge restates the theorems marked ✓ with its own copy of
the definitions in Mathlib's vocabulary, in the namespace `Allman2011Challenge`.

| Paper | Lean | Challenge | Statement |
| --- | --- | --- | --- |
| Theorem 9 | [`Allman2011.theorem9`](Allman2011/Identifiability/Theorem9.lean#L205) | ✓ | For binary species trees on at least five taxa, equal distributions of unrooted gene trees imply the same rooted topology and the same internal branch lengths. |
| Theorem 9, four taxa | [`Allman2011.theorem9_four`](Allman2011/Identifiability/Theorem9.lean#L245) | ✓ | Two binary species trees on four taxa give the same distribution if and only if they have the same unrooted metric tree. |
| Proposition 3 | [`Allman2011.proposition3`](Allman2011/FourTaxa/Proposition3.lean#L171) | ✓ | On four taxa the unrooted metric species tree is determined, and the rooted one is not. |
| Corollary 10 | [`Allman2011.corollary10`](Allman2011/Identifiability/Corollary10.lean#L154) | ✓ | With `ℓ_x ≥ 1` lineages from each taxon `x`, if `\|X\| ≥ 4` and some `ℓ_x ≥ 2`, or `\|X\| = 3` and two of them are, the distribution determines the rooted species tree, its internal lengths, and the pendant length of every taxon with `ℓ_x ≥ 2`. |
| Proposition 11 | [`Allman2011.proposition11_theorem9`](Allman2011/Nonbinary/Proposition11.lean#L82), [`Allman2011.proposition11_theorem9_four`](Allman2011/Nonbinary/Proposition11.lean#L54), [`Allman2011.proposition11_corollary10`](Allman2011/Nonbinary/Proposition11.lean#L87) | ✓ | The same results for species trees that need not be binary; also [`Allman2011.proposition11_proposition3`](Allman2011/Nonbinary/Proposition11.lean#L66) and the versions of Corollary 6 and Propositions 7, 8. |
| Section 4.1 | [`Allman2011.fourTaxa_balanced`](Allman2011/FourTaxa/Formulas.lean#L81), [`Allman2011.fourTaxa_caterpillar`](Allman2011/FourTaxa/Formulas.lean#L97) | ✓ | For `((a,b):x,(c,d):y)` the gene tree `AB\|CD` has probability `1 − (2/3)e^{−(x+y)}` and the other two `(1/3)e^{−(x+y)}`; for `(((a,b):x,c):y,d)`, `1 − (2/3)e^{−x}` and `(1/3)e^{−x}`. |
| Sections 4.1 and 5 | [`Allman2011.n4_unrootedDist_of_mem`](Allman2011/Nonbinary/FourTaxa.lean#L186), [`Allman2011.n4_unrootedDist_of_ne`](Allman2011/Nonbinary/FourTaxa.lean#L198) | | On four taxa, for any species tree with an internal edge `A \| Aᶜ` of length `t`, the quartet tree with that split has probability `1 − (2/3)e^{−t}` and the other two `(1/3)e^{−t}`. |
| Section 1 | [`Allman2011.unrootedDist_nonneg`](Allman2011/Model.lean#L55), [`Allman2011.unrootedDist_sum`](Allman2011/Model.lean#L60) | ✓ | The unrooted gene tree probabilities form a probability distribution. |

The report lists every result with its Lean name ([`docs/Allman2011/REPORT.md`](docs/Allman2011/REPORT.md),
Section 8).

## What the audit found

| Finding | |
| --- | --- |
| E5 | The Discussion states an inequality between two split probabilities the wrong way round. |
| E1 | That the inequalities (4)–(6) are the only ones rests on numerical examples that the paper does not give; the claims hold. |
| E4 | The root-location argument of Theorem 9 uses a quartet that distinguishes the edge, which exists only for internal edges; pendant edges need another choice of five taxa. |
| E3, E6 | Lemma 5 is stated without proof; Proposition 11 has a sketched proof. Both hold. |
| E2, E7 | A wrong population named in an explanation; twelve Newick strings with unbalanced parentheses and a few misspellings. |

No result, formula or table of the paper is wrong, and no hypothesis is missing; three are
redundant. Every proof follows the paper's, with one departure forced by E4 (the report's
Section 7).

## Trust

- `lake build` succeeds with no `sorry` outside the Challenge, no `axiom` and no `native_decide`.
- [`scripts/Audit.lean`](scripts/Audit.lean) checks that every declaration of this repository and
  of lean4-phylogenetics, every result of the paper and every theorem compared by Comparator
  depends only on [`propext`](https://leanprover-community.github.io/mathlib4_docs/Init/Core.html#propext), [`Classical.choice`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#Classical.choice) and [`Quot.sound`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#Quot.sound): `lake env lean scripts/Audit.lean`.
- [`scripts/route_check.py`](scripts/route_check.py) checks in CI that every formal proof of a
  numbered result uses the results that the paper's proof cites
  ([`docs/Allman2011/paper_routes.tsv`](docs/Allman2011/paper_routes.tsv), with two reviewed
  differences in [`docs/Allman2011/route_differences.tsv`](docs/Allman2011/route_differences.tsv)).
- AI agents reviewed the statements against the TeX source before the proofs were written, checked
  the audit's findings, and compared the formal proofs with the paper's. No person has reviewed the
  formalization.

## Dependencies

- [lean4-phylogenetics](https://github.com/vltanh/lean4-phylogenetics) (`Phylogenetics`), at the
  collection's pinned commit: species trees and hierarchies, Kingman's coalescent and Tavaré's
  formula, the multispecies coalescent with its marginalization, relabelling and limits, the small
  named trees, the verified evaluator of the gene tree distributions of small species trees, the
  reconstruction of trees from quartets, and the counts of trees and shapes.
- Mathlib.

## Palomar

[`palomar/Allman2011/`](palomar/Allman2011) holds the submission:
[`Challenge.lean`](palomar/Allman2011/Challenge.lean) (the statements, with `sorry`, and the
definitions they use, copied from [`Allman2011/Defs.lean`](Allman2011/Defs.lean) by
[`scripts/sync_challenge_defs.py`](scripts/sync_challenge_defs.py)),
[`Solution.lean`](palomar/Allman2011/Solution.lean) (the same statements, proved through
[`Allman2011/Bridge.lean`](Allman2011/Bridge.lean), which proves that these definitions agree with
those of lean4-phylogenetics), [`comparator.json`](palomar/Allman2011/comparator.json) and
[`formalization.yaml`](palomar/Allman2011/formalization.yaml). To check the pair locally, in a
bubblewrap sandbox:

```sh
lake env lake comparator --config palomar/Allman2011/comparator.json
```

## Building

```sh
lake exe cache get    # download Mathlib's build outputs
lake build            # the library, the Challenge and the Solution
lake build Phylogenetics && lake env lean scripts/Audit.lean    # the axiom and dependency audit
```

Lean and Mathlib `v4.37.0-rc1` ([`lean-toolchain`](lean-toolchain),
[`lake-manifest.json`](lake-manifest.json)).

Two Lean files are generated, by the scripts in [`scripts/`](scripts):
[`Allman2011/AppendixA.lean`](Allman2011/AppendixA.lean) (Tables 4 and 5, from the paper's TeX
source: `python3 scripts/gen_appendixA.py PAPER.tex > Allman2011/AppendixA.lean`) and
[`Allman2011/Rootings/Statements.lean`](Allman2011/Rootings/Statements.lean) (the distributions of
all rootings of the 4- and 5-taxon unrooted trees, computed exactly by an independent
implementation of the model, [`scripts/msc_model.py`](scripts/msc_model.py), which needs `sympy`:
`python3 scripts/gen_rootings.py > Allman2011/Rootings/Statements.lean`).

After editing the code, rerun the audit, the route check (`python3 scripts/route_check.py check
docs/Allman2011/paper_routes.tsv --accept docs/Allman2011/route_differences.tsv`), the links
(`python3 scripts/linkify_docs.py`) and the tables (`python3 scripts/check_md_tables.py`), as
[CI](.github/workflows/lean_action_ci.yml) does.

## Layout

| Path | Content |
| --- | --- |
| [`Allman2011/Basic/`](Allman2011/Basic) | General mathematics, in Mathlib's namespaces |
| [`Allman2011/External/`](Allman2011/External) | The results the paper cites (Tavaré 1984, Steel 1992, Cayley 1857), stated in `External.<Source>` and proved from lean4-phylogenetics |
| [`Allman2011/Defs.lean`](Allman2011/Defs.lean), [`Allman2011/Bridge.lean`](Allman2011/Bridge.lean) | The Challenge's definitions, and their agreement with lean4-phylogenetics's |
| [`Allman2011/Introduction/`](Allman2011/Introduction) | Section 1: equation (1), Proposition 1, Corollary 2 |
| [`Allman2011/Model.lean`](Allman2011/Model.lean) | Sections 2 and 3: the distributions, equations (2) and (3), the worked examples, polynomiality |
| [`Allman2011/FourTaxa/`](Allman2011/FourTaxa) | Section 4.1: the four-taxon formulas and Proposition 3 |
| [`Allman2011/FiveTaxa/`](Allman2011/FiveTaxa) | Section 4.2 and Appendix B: Lemma 4, Tables 1–3, the inequalities (4)–(6), equations (11)–(13) |
| [`Allman2011/Identifiability/`](Allman2011/Identifiability) | Section 4.3: Lemma 5, Corollary 6, Propositions 7 and 8, Theorem 9, Corollary 10 |
| [`Allman2011/Nonbinary/`](Allman2011/Nonbinary) | Section 5: nonbinary trees as limits, rooted triples, four taxa, Proposition 11 |
| [`Allman2011/Discussion.lean`](Allman2011/Discussion.lean) | Section 6 |
| [`Allman2011/AppendixA.lean`](Allman2011/AppendixA.lean), [`Allman2011/AppendixC/`](Allman2011/AppendixC) | Appendices A and C: Tables 4–7, the five-taxon case of Proposition 11 |
| [`Allman2011/Rootings/`](Allman2011/Rootings) | The distributions of all rootings of the 4- and 5-taxon unrooted trees (generated statements and their proofs), which Sections 4–6 and the appendices use |
| [`palomar/Allman2011/`](palomar/Allman2011) | The Palomar submission |
| [`docs/Allman2011/`](docs/Allman2011) | The [report](docs/Allman2011/REPORT.md), the [credits](docs/Allman2011/CREDITS.md), the routes of the paper's proofs |
| [`scripts/`](scripts) | The audit, the route check, the generators and the documentation tools |

## Related work

The question goes back to the probabilities of rooted gene trees under the multispecies coalescent
(Pamilo–Nei 1988; Degnan–Salter 2005) and the identifiability of species trees from rooted triples
(Degnan et al. 2009). The four-taxon result is used to prove the statistical consistency of
quartet-based methods such as ASTRAL (Mirarab et al. 2014). We found no earlier formalization of
this paper; the Lean library [SauersML/Descent](https://github.com/SauersML/Descent) formalizes parts
of coalescent theory, without the multispecies coalescent or unrooted gene trees, and was not used.

## Credits

- Maintainer: The-Anh Vu-Le, who requested and supervised the formalization.
- Formalization: Claude Opus 5.5 (`claude-opus-5-5`, Anthropic) in Claude Code, following the
  [formalize-math-paper](https://github.com/vltanh/formalize-math-paper) procedure, made the
  formalization and the audit on 2026-10-03 and moved the repository into the collection of
  lean4-phylogenetics on 2026-11-24. [`docs/Allman2011/CREDITS.md`](docs/Allman2011/CREDITS.md)
  gives the details and the figures.
- Review: no person has reviewed the proofs; Lean's kernel checks them. AI agents reviewed the
  statements against the TeX source before the proofs were written, checked the audit's findings,
  and compared the formal proofs with the paper's.

## License

Apache-2.0: [LICENSE](LICENSE).
