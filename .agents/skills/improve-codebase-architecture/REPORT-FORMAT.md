# Report Format

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).
Replaces the upstream Tailwind/Mermaid-CDN HTML report with a portable format.

The architecture survey is rendered as **plain Markdown**: readable in a
terminal, in chat, and as a GitHub Issue comment, with no CDN, framework, or
rendering dependency. Diagrams are text: indented boxes, ASCII arrows, and
mass comparisons drawn with characters. A self-contained HTML file (inline CSS
only, no external requests) is acceptable only when the task explicitly asks
for one.

## Structure

```markdown
# Architecture survey: <repo/area> — <date>

Legend: [M] module · --→ calls · ~~> leaks across a seam · [==] deep module

## Candidates

<one section per candidate>

## Top recommendation

<one short section: which candidate, one sentence why, link to its section>
```

Header first, no introduction paragraph. Straight into the candidates.

## Candidate section

The diagrams carry the weight. Prose is sparse, plain, and uses the glossary
terms (from [../codebase-design/SKILL.md](../codebase-design/SKILL.md)) without
ceremony.

- **Title**: short, names the deepening (e.g. "Collapse the Order intake
  pipeline").
- **Strength**: `Strong` / `Worth exploring` / `Speculative`, plus the
  dependency category (`in-process`, `local-substitutable`, `ports & adapters`,
  `mock`).
- **Files**: monospaced list.
- **Before / After**: the centrepiece, side by side or stacked. See patterns
  below.
- **Problem**: one sentence. What hurts.
- **Solution**: one sentence. What changes.
- **Wins**: bullets, <=6 words each. e.g. "Tests hit one interface", "Pricing
  logic stops leaking", "Delete 4 shallow wrappers".
- **ADR callout** (if applicable): one line, clearly marked.

No paragraphs of explanation. If the diagram needs a paragraph to be
understood, redraw the diagram.

## Diagram patterns

Pick the pattern that fits the candidate. Mix them; don't make every diagram
look the same.

### Call graph (the workhorse)

```text
before:                          after:
OrderHandler                     [==================]
  --> OrderValidator             [== Order intake ===]
    --> OrderRepo                [==  (one deep      ]
      ~~> PricingClient  (leak)  [==   module)        ]
                                 [==================]
```

Mark leakage edges explicitly (`~~>` or `(leak)`); the point is often "look
where the seam is crossed."

### Mass comparison (interface vs implementation)

```text
before (shallow):                after (deep):
+----------------------+         +------+
| interface ~~~~~~~~~~ |         | intf |
+----------------------+         +------+
| implementation ~~~~~ |         |                    |
+----------------------+         | implementation     |
                                 |                    |
                                 +--------------------+
```

Interface surface area vs implementation volume, drawn to scale by eye.

### Cross-section (layered shallowness)

```text
before: 6 thin layers            after: 1 deep band
> handler        (passes thru)   >====================
> validator      (passes thru)   >= consolidated     =
> mapper         (passes thru)   >= order intake     =
> service        (thin logic)    >====================
> repo           (thin query)
> client         (thin call)
```

### Sequence (round-trip count)

```text
before: ui -> api -> svc -> repo -> svc -> api -> ui   (6 hops, 2 round-trips)
after:  ui -> orderIntake -> ui                        (1 round-trip)
```

## Tone

Plain English, concise, but the architectural nouns and verbs come straight
from the codebase-design glossary. Concision is not an excuse to drift.

**Use exactly:** module, interface, implementation, depth, deep, shallow, seam,
adapter, leverage, locality.

**Never substitute:** component, service, unit (for module) · API, signature
(for interface) · boundary (for seam) · layer, wrapper (for module, when you
mean module).

**Phrasings that fit the style:**

- "Order intake module is shallow: interface nearly matches the
  implementation."
- "Pricing leaks across the seam."
- "Deepen: one interface, one place to test."
- "Two adapters justify the seam: HTTP in prod, in-memory in tests."

**Wins bullets** name the gain in glossary terms: _"locality: bugs concentrate
in one module"_, _"leverage: one interface, N call sites"_, _"interface shrinks;
implementation absorbs the wrappers"_. Don't write _"easier to maintain"_ or
_"cleaner code"_, because those terms aren't in the glossary and don't earn
their place.

No hedging, no throat-clearing, no "it's worth noting that...". If a sentence
could be a bullet, make it a bullet. If a bullet could be cut, cut it. If a
term isn't in the codebase-design glossary, reach for one that is before
inventing a new one.
