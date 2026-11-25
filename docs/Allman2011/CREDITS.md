# Credits

How this formalization was made, from the run log and the session transcripts.

## Who

- Author and maintainer: The-Anh Vu-Le, who asked for the formalization of the paper.
- Formalization: Claude Opus 5.5 (`claude-opus-5-5`, Anthropic) in Claude Code: a main session with
  sub-agents in the first round, one agent working for a coordinating session in the second.
- Procedure: the skill [`formalize-math-paper`](https://github.com/vltanh/formalize-math-paper).
- Review: no person has reviewed the proofs. Independent agents (Claude Opus 5.5) reviewed the
  statements against the TeX source before any proof was written, checked the audit's findings
  against the TeX source, and compared the formal proofs with the paper's.

## The formalization (2026-10-03)

From the paper's arXiv source, a request naming the paper, and one later message asking to
continue. Claude Code 2.1.288, the skill at version 1.4.0, Lean and Mathlib `v4.35.0-rc3`.

How it was made:

- The model, its infrastructure and the paper's results were written by the main session and by
  sub-agents; the statements were reviewed against the TeX source by a sub-agent before any proof
  was written.
- The skill was updated to version 1.4.0 during the run; its rule that every proof follow the
  paper's own argument led to a second phase, in which the proofs of Propositions 3, 7, 8 and 11,
  Corollaries 6 and 10, Theorem 9, Lemma 4 and Tables 1–3 were rewritten along the paper's
  arguments and compared with them by independent readers.
- The audit of the paper was written by the main session, and its findings were checked against
  the TeX source by an independent reader.

Figures, from 2026-10-03 13:25 to 19:51 (UTC−5), the commit that completes the audit report:

- elapsed time: 6.4 hours;
- sub-agents: 32, at most 7 at a time, 2 of them resumed for follow-up work: 1 reviewed the
  statements, 28 wrote proofs (the model and its infrastructure, the paper's results, then the
  rewrite along the paper's arguments), and 3 read independently (one checked the audit's findings
  against the TeX source, two compared the formal proofs with the paper's); their total working
  time was 14.6 hours;
- the sub-agents made 2,084 model calls and 2,287 tool calls, with 5.10 M output tokens, 13.08 M
  input tokens (uncached input and cache writes) and 470 M cache reads; the main session made 492
  model calls and 502 tool calls, with 1.02 M output tokens, 2.10 M input tokens and 268 M cache
  reads.

## Into the collection of lean4-phylogenetics (2026-11-24)

The maintainer asked to bring the repository into the collection of formalizations rooted at
[lean4-phylogenetics](https://github.com/vltanh/lean4-phylogenetics), so that other repositories
can require it and use its theorems on that library's types.

How it was made, by one agent (Claude Opus 5.5) working for a coordinating session:

- The repository requires lean4-phylogenetics, which holds the general parts of the first round
  (species trees, hierarchies, Kingman's coalescent, the multispecies coalescent, the verified
  evaluator of small gene tree distributions, and the three cited results). Every declaration of
  which lean4-phylogenetics has a copy with the same statement was removed, and the library uses
  that copy; the paper's results are stated on its types. The Challenge keeps its definitions in
  Mathlib's vocabulary, and [`Allman2011.Bridge`](../../Allman2011/Bridge.lean) proves that they agree with lean4-phylogenetics's.
- The names and the layout follow the collection's conventions: the package and namespace
  [`Allman2011`](../../Allman2011), the Challenge's theorems in `Allman2011Challenge`, the cited results in
  `External.<Source>`, general mathematics in [`Allman2011/Basic/`](../../Allman2011/Basic), the Palomar files in
  [`palomar/Allman2011/`](../../palomar/Allman2011) and the documents in `docs/Allman2011/`.
- Checks: the build, the axiom audit, the route check, Comparator, the copy of the Challenge's
  definitions, the links and the tables; and a comparison of every statement with the first
  round's, which differ only in names and in the types and definitions of lean4-phylogenetics.

The figures of this round are not recorded here.
