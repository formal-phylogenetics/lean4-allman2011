module

public meta import Lean.Elab.Command
public meta import Lean.DocString
-- One `import all` line per module of the libraries, so that proofs are visible to the dependency
-- traversal (the module system hides them from a plain `import`): every module of `Allman2011/`
-- (`Basic/`, `External/` and the paper's library) and the paper's Solution in `palomar/`, but not the
-- Challenge, which holds a copy of the Challenge's definitions under the same names; then every
-- module of `Phylogenetics`, which this repository requires (lean4-phylogenetics,
-- docs/CONVENTIONS.md, Section 3). Generate the lines with
--   { find Allman2011 -name '*.lean'; cd palomar && find . -name Solution.lean; } |
--     sed 's#^\./##; s/\.lean$//; s#/#.#g; s/^/import all /' | sort
--   (cd .lake/packages/Phylogenetics && find Phylogenetics -name '*.lean') |
--     sed 's/\.lean$//; s#/#.#g; s/^/import all /' | sort
import all Allman2011.AppendixA
import all Allman2011.AppendixC.Ac1Classes
import all Allman2011.AppendixC.FiveTaxa
import all Allman2011.AppendixC.Shapes
import all Allman2011.AppendixC.StarOneSplit
import all Allman2011.AppendixC.Tables
import all Allman2011.AppendixC.TwoSplits
import all Allman2011.Basic.Algebra.BigOperators.Group.List
import all Allman2011.Basic.Analysis.SpecialFunctions.Exp
import all Allman2011.Basic.Data.Fin.Basic
import all Allman2011.Basic.Data.Finset.Basic
import all Allman2011.Basic.Data.Fintype.Sigma
import all Allman2011.Basic.Data.Nat.Bitwise
import all Allman2011.Basic.Order.Interval.Finset.Nat
import all Allman2011.Bridge
import all Allman2011.Defs
import all Allman2011.Discussion
import all Allman2011.External.Cayley1857.Shapes
import all Allman2011.External.Steel1992.Quartets
import all Allman2011.External.Tavare1984.Formula
import all Allman2011.FiveTaxa.Balanced
import all Allman2011.FiveTaxa.Basic
import all Allman2011.FiveTaxa.Caterpillar
import all Allman2011.FiveTaxa.Explanations
import all Allman2011.FiveTaxa.Lemma4
import all Allman2011.FiveTaxa.Pseudocaterpillar
import all Allman2011.FourTaxa.Analysis
import all Allman2011.FourTaxa.Formulas
import all Allman2011.FourTaxa.Proposition3
import all Allman2011.Identifiability.Corollary10
import all Allman2011.Identifiability.Corollary6
import all Allman2011.Identifiability.FiveTaxa.Binary
import all Allman2011.Identifiability.FiveTaxa.Classes
import all Allman2011.Identifiability.FiveTaxa.Common
import all Allman2011.Identifiability.Lemma5
import all Allman2011.Identifiability.Proposition8
import all Allman2011.Identifiability.Quartets
import all Allman2011.Identifiability.Theorem9
import all Allman2011.Introduction.Equation1
import all Allman2011.Introduction.Proposition1
import all Allman2011.Model
import all Allman2011.Nonbinary.FourTaxa
import all Allman2011.Nonbinary.Limits
import all Allman2011.Nonbinary.Proposition11
import all Allman2011.Nonbinary.Theorem9
import all Allman2011.Nonbinary.Triples
import all Allman2011.Nonbinary.Unrooted
import all Allman2011.Rootings.Proofs
import all Allman2011.Rootings.Statements
import all Allman2011.Rootings.Support
import all Allman2011.Solution
import all Phylogenetics.Coalescent.Absorption
import all Phylogenetics.Coalescent.BinaryForest
import all Phylogenetics.Coalescent.Defs
import all Phylogenetics.Coalescent.Factorization
import all Phylogenetics.Coalescent.Forest
import all Phylogenetics.Coalescent.Lump
import all Phylogenetics.Coalescent.Outcome
import all Phylogenetics.Coalescent.PMF
import all Phylogenetics.Coalescent.Relabel
import all Phylogenetics.Coalescent.Tavare
import all Phylogenetics.Coalescent.Trace
import all Phylogenetics.Computation.Caterpillar5
import all Phylogenetics.Computation.Codes
import all Phylogenetics.Computation.Engine
import all Phylogenetics.Computation.FiveTaxa
import all Phylogenetics.Computation.FourTaxa
import all Phylogenetics.Computation.ThreeTaxa
import all Phylogenetics.Computation.Toolkit
import all Phylogenetics.ForMathlib.Analysis.MatrixExponential
import all Phylogenetics.ForMathlib.MeasureTheory.HaarPreimage
import all Phylogenetics.Graph.Basic
import all Phylogenetics.Graph.Blobs
import all Phylogenetics.Graph.BridgeCutLaminar
import all Phylogenetics.Graph.Connectivity
import all Phylogenetics.Graph.CutUniqueness
import all Phylogenetics.Graph.Defs
import all Phylogenetics.Graph.Degree
import all Phylogenetics.Graph.Tree
import all Phylogenetics.Hierarchy.Basic
import all Phylogenetics.Hierarchy.Counts
import all Phylogenetics.Hierarchy.Defs
import all Phylogenetics.Hierarchy.Quartets
import all Phylogenetics.Hierarchy.RootLocation
import all Phylogenetics.Hierarchy.SpeciesTree
import all Phylogenetics.MSC.Basic
import all Phylogenetics.MSC.Classify
import all Phylogenetics.MSC.Contract
import all Phylogenetics.MSC.Defs
import all Phylogenetics.MSC.History
import all Phylogenetics.MSC.Marginal
import all Phylogenetics.MSC.MultiSample
import all Phylogenetics.MSC.Relabel
import all Phylogenetics.MSC.Shapes
import all Phylogenetics.MSC.Small
import all Phylogenetics.NMSC.Analytic
import all Phylogenetics.NMSC.Basic
import all Phylogenetics.NMSC.Defs
import all Phylogenetics.NMSC.DisplayedTreeModel
import all Phylogenetics.NMSC.Exchangeability
import all Phylogenetics.NMSC.Factor
import all Phylogenetics.NMSC.Glue
import all Phylogenetics.NMSC.History
import all Phylogenetics.NMSC.Induced
import all Phylogenetics.NMSC.InducedAbove
import all Phylogenetics.NMSC.InducedParams
import all Phylogenetics.NMSC.InducedRestrict
import all Phylogenetics.NMSC.InducedSuppress
import all Phylogenetics.NMSC.Inheritance
import all Phylogenetics.NMSC.Level1.Arms
import all Phylogenetics.NMSC.Level1.Basic
import all Phylogenetics.NMSC.Level1.Consistency
import all Phylogenetics.NMSC.Level1.Context
import all Phylogenetics.NMSC.Level1.Cycle
import all Phylogenetics.NMSC.Level1.Defs
import all Phylogenetics.NMSC.Level1.Displays
import all Phylogenetics.NMSC.Level1.GeneTrees
import all Phylogenetics.NMSC.Level1.General
import all Phylogenetics.NMSC.Level1.MetricCycle.Basic
import all Phylogenetics.NMSC.Level1.MetricCycle.Instance
import all Phylogenetics.NMSC.Level1.MetricCycle.RationalLengths
import all Phylogenetics.NMSC.Level1.MetricCycle.Realization
import all Phylogenetics.NMSC.Level1.MetricCycle.Reflection
import all Phylogenetics.NMSC.Level1.Process
import all Phylogenetics.NMSC.Level1.Sampling
import all Phylogenetics.NMSC.Level1.Symmetry
import all Phylogenetics.NMSC.Marginal
import all Phylogenetics.NMSC.SpeciesTree
import all Phylogenetics.NMSC.Symmetry
import all Phylogenetics.NMSC.TreeCF
import all Phylogenetics.NMSC.Witness
import all Phylogenetics.Network.AncestralRestriction
import all Phylogenetics.Network.Basic
import all Phylogenetics.Network.CutHierarchy
import all Phylogenetics.Network.Cuts
import all Phylogenetics.Network.Defs
import all Phylogenetics.Network.DeletedArcs
import all Phylogenetics.Network.Induced
import all Phylogenetics.Network.InducedMetric
import all Phylogenetics.Network.Level1.CyclicOrder
import all Phylogenetics.Network.Level1.Defs
import all Phylogenetics.Network.Level1.Digraph.Basic
import all Phylogenetics.Network.Level1.Digraph.Complete
import all Phylogenetics.Network.Level1.Digraph.CompleteCycle
import all Phylogenetics.Network.Level1.Digraph.CompleteDesc
import all Phylogenetics.Network.Level1.Digraph.CompleteEmbed
import all Phylogenetics.Network.Level1.Digraph.Correspondence
import all Phylogenetics.Network.Level1.Digraph.CycleHybrid
import all Phylogenetics.Network.Level1.Digraph.Defs
import all Phylogenetics.Network.Level1.Digraph.Invariance
import all Phylogenetics.Network.Level1.Digraph.Invariant
import all Phylogenetics.Network.Level1.Digraph.InvariantCycle
import all Phylogenetics.Network.Level1.Digraph.InvariantSide
import all Phylogenetics.Network.Level1.Digraph.InvariantTree
import all Phylogenetics.Network.Level1.Digraph.OfNet
import all Phylogenetics.Network.Level1.Digraph.Sound
import all Phylogenetics.Network.Level1.LevelOne
import all Phylogenetics.Network.Level1.ToRootedNetwork
import all Phylogenetics.Network.OfHierarchy
import all Phylogenetics.Network.PendantCuts
import all Phylogenetics.Network.Quartets
import all Phylogenetics.Network.Semidirected
import all Phylogenetics.Network.TreeOfBlobs
import all Phylogenetics.Tree.AstralDP
import all Phylogenetics.Tree.Defs
import all Phylogenetics.Tree.Detach
import all Phylogenetics.Tree.FourPoint
import all Phylogenetics.Tree.GeneTree.AnchorNode
import all Phylogenetics.Tree.GeneTree.Annotate
import all Phylogenetics.Tree.GeneTree.Basic
import all Phylogenetics.Tree.Metric
import all Phylogenetics.Tree.NeighborJoining
import all Phylogenetics.Tree.Splice
import all Phylogenetics.Tree.Splits
import all Phylogenetics.Tree.SplitsEquivalence
import all Phylogenetics.Tree.XTree

/-!
# Axiom and dependency audit

Run with `lake env lean scripts/Audit.lean` after `lake build`.

For every numbered result of the paper, this prints the axioms it depends on and the results from
prior work (`Allman2011/External/`) that it uses, whether proved there or, in a conditional formalization,
assumed as hypotheses of its statement. It then checks every declaration of the library and the
theorems that Palomar's comparator checks. The run fails if any of them depends on an axiom other
than Lean's standard `propext`, `Classical.choice` and `Quot.sound` (a `sorry` shows up as the
axiom `sorryAx`). Its table of results is the source of the report's dependency table.

It also writes the *route* of every numbered result to `.lake/route_deps.tsv`: the other
numbered results that its proof uses, found by following the proof through the library's helper
lemmas and stopping at numbered results, together with the TeX label that the result's docstring
names in backticks. `route_check.py` (in the skill's `scripts/`) compares these routes with the
results that the paper's proofs cite.

The library's modules are imported with `import all`, which makes the proofs of their theorems
available: the module system does not export them otherwise. The traversal tests membership in a
precomputed set of the library's constants; looking up each constant's module instead
(`Environment.getModuleIdxFor?`) makes the interpreted script take minutes.

The libraries are this repository's modules and those of `Phylogenetics`, which it requires: the
audit reads that library's proofs as well, so that one run covers every axiom that a result depends
on. Several numbered results of the paper are formalized there (the counts of Section 1) and are
listed under their names in `Phylogenetics`. The cited results are listed both as this repository
states them in `Allman2011/External/` and as lean4-phylogenetics proves them, since the library's
helper lemmas reach the latter. Keep one `import all` line per module of the libraries, each on its
own line: a module that is missing is still imported through the others, but without its proofs,
and the audit then misses the axioms and the routes inside them. CI checks the list.
-/

open Lean Elab Command

namespace Audit

/-- The results from prior work, with a short label: the theorems proved in `External/` or, when
general, in `Basic/`, and, in a conditional formalization, the propositions assumed as hypotheses.
The traversal stops at them. -/
meta def externalResults : List (String × Name) :=
  [("Tavaré 1984 (number of lineages)", ``External.Tavare1984.deathProb_eq_tavare),
   ("Tavaré 1984 (number of lineages), in lean4-phylogenetics", ``Phylogenetics.deathProb_eq_tavare),
   ("Steel 1992; Bandelt–Dress 1986 (splits from quartets)",
     ``External.Steel1992.mem_unroot_iff_quartets),
   ("Steel 1992; Bandelt–Dress 1986 (splits from quartets), in lean4-phylogenetics",
     ``Phylogenetics.mem_unroot_iff_quartets),
   ("Steel 1992, Prop. 6 (distinguishing quartets)",
     ``External.Steel1992.exists_distinguishing_quartet),
   ("Steel 1992, Prop. 6 (distinguishing quartets), in lean4-phylogenetics",
     ``Phylogenetics.exists_distinguishing_quartet),
   ("Cayley 1857 (rooted shapes)", ``External.Cayley1857.cayley_shapes),
   ("Cayley 1857 (rooted shapes), in lean4-phylogenetics", ``Phylogenetics.cayley_shapes)]

/-- The numbered results of the paper, in the order of the paper. -/
meta def paperResults : List (String × Name) :=
  [("Eq (1)", ``Allman2011.equation1),
   ("Eq (1), converse", ``Allman2011.equation1_iff),
   ("Sec 1, triple branch length", ``Allman2011.introduction_tripleLength),
   ("Prop 1", ``Allman2011.proposition1),
   ("Cor 2", ``Allman2011.corollary2),
   ("Sec 1, (2n-3)!! rooted trees", ``Phylogenetics.section1_card_rooted),
   ("Sec 1, 2n-3 rootings", ``Phylogenetics.section1_card_rootings),
   ("Sec 1, (2n-5)!! unrooted trees", ``Phylogenetics.section1_card_unrooted),
   ("Sec 1, distribution (nonnegative)", ``Allman2011.unrootedDist_nonneg),
   ("Sec 1, distribution (sum 1)", ``Allman2011.unrootedDist_sum),
   ("Sec 1, nonbinary gene trees have probability 0", ``Allman2011.rootedDist_support),
   ("Sec 2, pendant lengths do not matter", ``Allman2011.rootedDist_eq_of_sameRootedMetricTree),
   ("Eq (2)", ``Allman2011.equation2),
   ("Eq (2), g sums to 1", ``Allman2011.coalescenceProb_sum),
   ("Eq (2), g_i1 limit", ``Allman2011.tendsto_coalescenceProb_one),
   ("Eq (2), g_ii limit", ``Allman2011.tendsto_coalescenceProb_self),
   ("Eq (2), g_ii", ``Allman2011.coalescenceProb_self),
   ("Sec 3, example 1", ``Allman2011.section3_example1),
   ("Sec 3, example 2", ``Allman2011.section3_example2),
   ("Eq (3)", ``Allman2011.equation3),
   ("Sec 3, polynomials", ``Allman2011.section3_polynomial),
   ("Sec 4.1, balanced", ``Allman2011.fourTaxa_balanced),
   ("Sec 4.1, caterpillar", ``Allman2011.fourTaxa_caterpillar),
   ("Sec 4.1, recovery", ``Allman2011.fourTaxa_recovery),
   ("Sec 4.1, five trees", ``Allman2011.fourTaxa_sameDistribution),
   ("Sec 4.1, labelled shapes", ``Allman2011.fourTaxa_card_shapes),
   ("Prop 3", ``Allman2011.proposition3),
   ("Lemma 4", ``Allman2011.lemma4),
   ("Lemma 4, six taxa", ``Allman2011.lemma4_six),
   ("Table 1", ``Allman2011.table1),
   ("Sec 4.2.1, classes", ``Allman2011.balanced_classes),
   ("Eq (4)", ``Allman2011.equation4),
   ("Eq (4), exhaustive", ``Allman2011.equation4_exhaustive),
   ("Sec 4.2.1, extreme classes", ``Allman2011.balanced_extremeClasses),
   ("Sec 4.2.1, degenerate", ``Allman2011.balanced_degenerate),
   ("Table 2", ``Allman2011.table2),
   ("Sec 4.2.2, marginalization", ``Allman2011.caterpillar_marginalization),
   ("Sec 4.2.2, classes", ``Allman2011.caterpillar_classes),
   ("Eq (5)", ``Allman2011.equation5),
   ("Eq (5), exhaustive", ``Allman2011.equation5_exhaustive),
   ("Sec 4.2.2, extreme classes", ``Allman2011.caterpillar_extremeClasses),
   ("Table 3", ``Allman2011.table3),
   ("Sec 4.2.3, classes", ``Allman2011.pseudocaterpillar_classes),
   ("Eq (6)", ``Allman2011.equation6),
   ("Eq (6), exhaustive", ``Allman2011.equation6_exhaustive),
   ("Sec 4.2.3, least class", ``Allman2011.pseudocaterpillar_minClass),
   ("Lemma 5", ``Allman2011.lemma5),
   ("Lemma 5, rooted", ``Allman2011.lemma5_rooted),
   ("Cor 6", ``Allman2011.corollary6),
   ("Prop 7", ``Allman2011.proposition7),
   ("Prop 8", ``Allman2011.proposition8),
   ("Eq (7)", ``Allman2011.equation7),
   ("Eq (8)", ``Allman2011.equation8),
   ("Eq (9)", ``Allman2011.equation9),
   ("Thm 9", ``Allman2011.theorem9),
   ("Thm 9, four taxa", ``Allman2011.theorem9_four),
   ("Cor 10", ``Allman2011.corollary10),
   ("Sec 5, three taxa", ``Allman2011.section5_threeTaxa),
   ("Sec 5, triples", ``Allman2011.section5_triples),
   ("Sec 5, Prop 1", ``Allman2011.section5_proposition1),
   ("Sec 5, Cor 2", ``Allman2011.section5_corollary2),
   ("Sec 5, four taxa", ``Allman2011.section5_fourTaxa),
   ("Sec 5, limits", ``Allman2011.section5_limit),
   ("Prop 11 (Prop 3)", ``Allman2011.proposition11_proposition3),
   ("Prop 11 (Cor 6)", ``Allman2011.proposition11_corollary6),
   ("Prop 11 (Prop 7)", ``Allman2011.proposition11_proposition7),
   ("Prop 11 (Prop 8)", ``Allman2011.proposition11_proposition8),
   ("Prop 11 (Thm 9)", ``Allman2011.proposition11_theorem9),
   ("Prop 11 (Thm 9, four taxa)", ``Allman2011.proposition11_theorem9_four),
   ("Prop 11 (Cor 10)", ``Allman2011.proposition11_corollary10),
   ("Sec 6, split probabilities", ``Allman2011.discussion_splits),
   ("Table 4", ``Allman2011.table4),
   ("Table 5", ``Allman2011.table5),
   ("Eqs (11)", ``Allman2011.equation11),
   ("Eqs (12)", ``Allman2011.equation12),
   ("Eqs (13)", ``Allman2011.equation13),
   ("Table 6", ``Allman2011.table6),
   ("Table 7", ``Allman2011.table7),
   ("Table 7, classes", ``Allman2011.table7_classes),
   ("App C, least classes", ``Allman2011.appendixC_leastClass),
   ("App C, degenerate", ``Allman2011.appendixC_degenerate)]

/-- The theorems that Palomar's comparator checks (`theorem_names` of
`palomar/Allman2011/comparator.json`), as the Solution restates them. -/
meta def solutionResults : List Name :=
  [``Allman2011Challenge.unrootedDist_nonneg,
   ``Allman2011Challenge.unrootedDist_sum,
   ``Allman2011Challenge.fourTaxa_balanced,
   ``Allman2011Challenge.fourTaxa_caterpillar,
   ``Allman2011Challenge.theorem9,
   ``Allman2011Challenge.theorem9_four,
   ``Allman2011Challenge.proposition3,
   ``Allman2011Challenge.corollary10,
   ``Allman2011Challenge.proposition11_theorem9,
   ``Allman2011Challenge.proposition11_theorem9_four,
   ``Allman2011Challenge.proposition11_corollary10]

/-- Lean's standard axioms. -/
meta def standardAxioms : List Name := [``propext, ``Classical.choice, ``Quot.sound]

/-- Whether `m` is a module of the libraries: under the root `Allman2011` (`Basic/`, `External/`,
the paper's library and the Solution), but not the Challenge; or a module of `Phylogenetics`, which
this repository requires, so that one run covers every axiom that a result depends on. -/
meta def isLibraryModule (m : Name) : Bool :=
  ((`Allman2011).isPrefixOf m && m != `Allman2011.Challenge) || (`Phylogenetics).isPrefixOf m

/-- The constants declared in the library. -/
meta def libraryConstants (env : Environment) : NameSet := Id.run do
  let mut s : NameSet := {}
  for m in env.header.moduleNames, d in env.header.moduleData do
    if isLibraryModule m then
      for c in d.constNames do
        s := s.insert c
  return s

/-- The constants used by the type and the value of `c`. -/
meta def usedConstants (env : Environment) (c : Name) : Array Name :=
  match env.find? c with
  | some (.thmInfo t) => t.type.getUsedConstants ++ t.value.getUsedConstants
  | some (.defnInfo d) => d.type.getUsedConstants ++ d.value.getUsedConstants
  | some (.opaqueInfo o) => o.type.getUsedConstants ++ o.value.getUsedConstants
  | some (.inductInfo i) => i.type.getUsedConstants ++ i.ctors.toArray
  | some ci => ci.type.getUsedConstants
  | none => #[]

/-- The external results reached from `root` through constants of the library, without looking
inside the proofs of the external results themselves. `deps` caches the constants of the library
that each constant uses, across calls. -/
meta def externalUses (env : Environment) (library : NameSet) (deps : NameMap (Array Name))
    (root : Name) :
    List Name × NameMap (Array Name) := Id.run do
  let externals := externalResults.map (·.2)
  let mut deps := deps
  let mut visited : NameSet := {}
  let mut stack : List Name := [root]
  let mut found : NameSet := {}
  while true do
    match stack with
    | [] => break
    | c :: rest =>
      stack := rest
      if visited.contains c then continue
      visited := visited.insert c
      if c != root && externals.contains c then
        found := found.insert c
        continue
      let ds := match deps.find? c with
        | some ds => ds
        | none => (usedConstants env c).filter library.contains
      deps := deps.insert c ds
      for d in ds do
        if !visited.contains d then stack := d :: stack
  return (externalResults.filterMap fun (_, n) => if found.contains n then some n else none, deps)

/-- Where `#audit` writes the routes, relative to the project root (`.lake/` is not committed). -/
meta def routeFile : System.FilePath := ".lake/route_deps.tsv"

/-- The numbered results that the proof of `root` uses: those reached from it through constants
of the library, without looking inside the proofs of numbered results themselves. -/
meta def resultUses (env : Environment) (library results : NameSet) (root : Name) :
    Array Name := Id.run do
  let mut visited : NameSet := {}
  let mut stack : List Name := (usedConstants env root).toList
  let mut found : Array Name := #[]
  while true do
    match stack with
    | [] => break
    | c :: rest =>
      stack := rest
      if visited.contains c || c == root then continue
      visited := visited.insert c
      if results.contains c then
        found := found.push c
        continue
      if !library.contains c then continue
      for d in usedConstants env c do
        if !visited.contains d then stack := d :: stack
  return found

/-- The code spans of the docstring of `c` that contain no space or comma: the candidates for its
TeX label. -/
meta def docLabels (env : Environment) (c : Name) : IO (Array String) := do
  let some doc ← findDocString? env c | return #[]
  let mut out : Array String := #[]
  let mut inside := false
  for part in doc.splitOn "`" do
    if inside && !part.isEmpty && !part.any (fun ch => ch.isWhitespace || ch == ',') then
      out := out.push part
    inside := !inside
  return out

elab "#audit" : command => do
  let env ← getEnv
  let mut bad : Array Name := #[]
  let library := libraryConstants env
  let mut deps : NameMap (Array Name) := {}
  let mut rows : Array String := #["| Result | Lean | Results from prior work used | Axioms |",
    "| --- | --- | --- | --- |"]
  for (label, n) in paperResults do
    let axs ← liftCoreM <| collectAxioms n
    if axs.any (!standardAxioms.contains ·) then bad := bad.push n
    let (uses, deps') := externalUses env library deps n
    deps := deps'
    let usesStr := if uses.isEmpty then "–" else ", ".intercalate (uses.map fun u => s!"`{u}`")
    let axStr := ", ".intercalate (axs.toList.map toString)
    rows := rows.push s!"| {label} | `{n}` | {usesStr} | {axStr} |"
  for n in solutionResults ++ externalResults.map (·.2) do
    let axs ← liftCoreM <| collectAxioms n
    if axs.any (!standardAxioms.contains ·) then bad := bad.push n
  -- Every declaration of the library, including private and auxiliary ones.
  for c in library do
    let axs ← liftCoreM <| collectAxioms c
    if axs.any (!standardAxioms.contains ·) then bad := bad.push c
  -- The routes: for each numbered result, its docstring's labels and the results it uses.
  let results : NameSet := paperResults.foldl (fun s p => s.insert p.2) {}
  let mut routes : Array String := #[]
  for (label, n) in paperResults do
    let labels ← docLabels env n
    let uses := resultUses env library results n
    routes := routes.push (s!"{label}\t{n}\t{",".intercalate labels.toList}\t" ++
      ",".intercalate (uses.map toString).toList)
  IO.FS.createDirAll ".lake"
  IO.FS.writeFile routeFile ("\n".intercalate routes.toList ++ "\n")
  logInfo ("\n".intercalate rows.toList ++
    s!"\n\nChecked {library.size} declarations of the library: " ++
    (if bad.isEmpty then "all use only the standard axioms." else "see the error."))
  unless bad.isEmpty do
    throwError m!"non-standard axioms used by: {bad}"

end Audit

#audit
