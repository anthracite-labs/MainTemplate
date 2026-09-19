# Improve Codebase Architecture

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Survey a codebase for **deepening opportunities**: refactors that turn shallow
modules into deep ones, plus the friction and change hotspots that motivate
them. Present candidates; let Human + ChatGPT choose what is worth pursuing.
The aim is testability, locality, leverage, and navigability.

A Human + ChatGPT exploration capability. It **identifies and explores
candidates; it never changes architecture automatically**. Consequential
architecture remains human-approved and durably recorded (ADR/architecture doc)
before Arena executes it through bounded Issues.

This survey is _informed_ by the project's domain model and built on a shared
design vocabulary:

- Read [../codebase-design/SKILL.md](../codebase-design/SKILL.md) for the
  architecture vocabulary (**module**, **interface**, **depth**, **seam**,
  **adapter**, **leverage**, **locality**) and its principles (the deletion
  test, "the interface is the test surface", "one adapter = hypothetical seam,
  two = real"). Use these terms exactly in every suggestion; don't drift into
  "component," "service," "API," or "boundary."
- The project's domain glossary (`CONTEXT.md`, where the project has one) gives
  names to good seams; accepted ADRs record decisions this survey must not
  re-litigate.

## Process

### 1. Explore

**Scope before you scan: YAGNI.** Deepening a module pays off by making future
changes to it easier, so put extra weight on the parts of the codebase that
have recently changed. Decide *where* to look before you look:

- If the human named a direction (a module, a subsystem, a pain point), take
  it, and skip the inference below.
- Otherwise, inspect real change hotspots and friction: walk back a good
  stretch of the commit history (`git log --oneline`, plus per-path churn where
  useful) to find the files and areas that keep coming up, and let those paths
  pull your attention first. If the changes are scattered with no clear hot
  spot, widen the net.

Read the project's domain glossary and any ADRs in the area you're touching
first.

Then walk the codebase — in an independent context where the environment
supports delegation, otherwise in a fresh dedicated pass. Don't follow rigid
heuristics; explore organically and note where you experience friction:

- Where does understanding one concept require bouncing between many small
  modules?
- Where are modules **shallow**, with an interface nearly as complex as the
  implementation?
- Where have pure functions been extracted just for testability, but the real
  bugs hide in how they're called (no **locality**)?
- Where do tightly-coupled modules leak across their seams?
- Which parts of the codebase are untested, or hard to test through their
  current interface?

Apply the **deletion test** to anything you suspect is shallow: would deleting
it concentrate complexity, or just move it? A "yes, concentrates" is the signal
you want.

### 2. Present candidates as a portable report

Write the report in the format defined by [REPORT-FORMAT.md](REPORT-FORMAT.md):
plain Markdown with text before/after structure diagrams — portable, reviewable
in chat or as a GitHub Issue comment, with no CDN, framework, or rendering
dependency. Deliver it where the human will read it (chat response or an Issue
comment); write files only to a temporary location outside the repository
unless the task explicitly asks for a committed report.

For each candidate, the report gives:

- **Files**: which files/modules are involved;
- **Problem**: why the current architecture is causing friction;
- **Solution**: plain-English description of what would change;
- **Benefits**: in terms of locality and leverage, and how tests would improve;
- **Before / After structure**: side by side, understandable without a
  rendering engine;
- **Recommendation strength**: one of `Strong`, `Worth exploring`,
  `Speculative`.

End with a **Top recommendation**: which candidate you'd tackle first and why.

**Use the project's domain glossary for domain names and the codebase-design
vocabulary for architecture.** If the glossary defines "Order," talk about "the
Order intake module," not "the FooBarHandler," and not "the Order service."

**ADR conflicts**: if a candidate contradicts an existing ADR, only surface it
when the friction is real enough to warrant revisiting the ADR, and mark it
clearly (e.g. _"contradicts ADR-0007, but worth reopening because..."_). Don't
list every theoretical refactor an ADR forbids. Reopening an accepted ADR is a
consequential decision: human-approved and durably recorded before execution.

Do NOT propose interfaces yet. After presenting the report, ask the human:
"Which of these would you like to explore?"

### 3. Exploration loop

Once the human picks a candidate, apply [../grilling/](../grilling/SKILL.md) to
walk the decision tree with them: constraints, dependencies, the shape of the
deepened module, what sits behind the seam, what tests survive.

Side effects happen inline as decisions crystallize; apply
[../domain-modeling/](../domain-modeling/SKILL.md) to keep the domain model
current as you go:

- **Naming a deepened module after a concept not in the glossary?** Add the
  term, creating the project's `CONTEXT.md` lazily if the project has decided
  to keep one and the first real term is now resolved.
- **Sharpening a fuzzy term during the conversation?** Record it right there.
- **Human rejects the candidate with a load-bearing reason?** Offer an ADR,
  framed as: _"Want me to record this as an ADR so future architecture surveys
  don't re-suggest it?"_ Only offer when the reason would actually be needed by
  a future explorer; skip ephemeral reasons ("not worth it right now") and
  self-evident ones.
- **Want to explore alternative interfaces for the deepened module?** Use
  [../codebase-design/DESIGN-IT-TWICE.md](../codebase-design/DESIGN-IT-TWICE.md).

### 4. Hand off to execution

A chosen candidate becomes durable project truth (ADR/architecture update,
human-approved) and then bounded Arena work: a single coherent candidate goes
to one Arena Issue; a large candidate is decomposed via
[../to-tickets/](../to-tickets/SKILL.md), where the wide-refactor
expand → migrate → contract strategy applies to mechanical cross-cutting
changes. The survey itself merges nothing and refactors nothing.
