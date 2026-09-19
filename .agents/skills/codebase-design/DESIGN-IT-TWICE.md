# Design It Twice

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

When the human wants to explore alternative interfaces for a chosen deepening
candidate, use this parallel-design pattern. Based on "Design It Twice"
(Ousterhout): your first idea is unlikely to be the best.

Uses the vocabulary in [SKILL.md](SKILL.md): **module**, **interface**,
**seam**, **adapter**, **leverage**.

Where the execution environment supports independent parallel contexts
(sub-agents), run the design passes in parallel so each starts from the same
brief without seeing the others' output. Where it does not, run the passes
sequentially, each from a fresh framing of the brief; independence of framing
is the point, parallelism is only an acceleration.

## Process

### 1. Frame the problem space

Before starting the design passes, write a human-facing explanation of the
problem space for the chosen candidate:

- The constraints any new interface would need to satisfy.
- The dependencies it would rely on, and which category they fall into (see
  [DEEPENING.md](DEEPENING.md)).
- A rough illustrative code sketch to ground the constraints — not a proposal,
  just a way to make the constraints concrete.

Show this to the human, then proceed to Step 2. The human reads and thinks
while the design passes work.

### 2. Run the design passes

Produce 3+ **radically different** interfaces for the deepened module, one per
pass. Each pass works from a separate technical brief (file paths, coupling
details, dependency category from [DEEPENING.md](DEEPENING.md), what sits
behind the seam) and a different design constraint:

- Pass 1: "Minimize the interface: aim for 1-3 entry points max. Maximise
  leverage per entry point."
- Pass 2: "Maximise flexibility: support many use cases and extension."
- Pass 3: "Optimise for the most common caller: make the default case trivial."
- Pass 4 (if applicable): "Design around ports & adapters for cross-seam
  dependencies."

Include both the [SKILL.md](SKILL.md) design vocabulary and the project's
domain language (its `CONTEXT.md` glossary, where the project has one) in each
brief so every pass names things consistently with the architecture language
and the project's domain language.

Each pass outputs:

1. Interface (types, methods, params, plus invariants, ordering, error modes)
2. Usage example showing how callers use it
3. What the implementation hides behind the seam
4. Dependency strategy and adapters (see [DEEPENING.md](DEEPENING.md))
5. Trade-offs: where leverage is high, where it's thin

### 3. Present and compare

Present designs sequentially so the human can absorb each one, then compare
them in prose. Contrast by **depth** (leverage at the interface), **locality**
(where change concentrates), and **seam placement**.

After comparing, give your own recommendation: which design you think is
strongest and why. If elements from different designs would combine well,
propose a hybrid. Be opinionated: the human wants a strong read, not a menu.
The choice itself is the human's — a consequential interface decision is
recorded durably before execution (root `/AGENTS.md` conflict rules).
