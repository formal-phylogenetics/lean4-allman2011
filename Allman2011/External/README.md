# The results the paper cites

One directory per source, `Allman2011/External/<Source>/`, with modules
`Allman2011.External.<Source>.…`,
declarations in the namespace `External.<Source>`, and a [`README.md`](README.md) giving the source, the
statement, and how the paper uses it. Each result is stated in its source's terms and proved
(formalize-math-paper, Phase 5). These modules import Mathlib, [`Allman2011/Basic/`](../Basic) and the
libraries this repository requires, never the paper's library.

A source that another repository of the collection already formalizes (lean4-phylogenetics, a
hub's library, or the repository of a paper) is not formalized again: its statement here is
proved from that repository's theorem (lean4-phylogenetics, docs/CONVENTIONS.md, Sections 4
and 6). The three sources below are formalized in lean4-phylogenetics.

| Source | Directory | Theorems |
| --- | --- | --- |
| Tavaré 1984 | [`Tavare1984/`](Tavare1984) | [`External.Tavare1984.deathProb_eq_tavare`](Tavare1984/Formula.lean#L29) (equation (2)) |
| Steel 1992; Bandelt–Dress 1986, Semple–Steel 2003 | [`Steel1992/`](Steel1992) | [`External.Steel1992.mem_unroot_iff_quartets`](Steel1992/Quartets.lean#L41), [`External.Steel1992.exists_distinguishing_quartet`](Steel1992/Quartets.lean#L50) |
| Cayley 1857 | [`Cayley1857/`](Cayley1857) | [`External.Cayley1857.cayley_shapes`](Cayley1857/Shapes.lean#L25) |
