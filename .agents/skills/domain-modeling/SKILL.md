# Domain Modeling

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Actively build and sharpen the project's domain model as you design. This is
the *active* discipline: challenging terms, inventing edge-case scenarios, and
writing the glossary and decisions down the moment they crystallise. (Merely
*reading* a glossary for vocabulary is not this capability: that's a one-line
habit any procedure can do. This is for when you're changing the model, not
just consuming it.)

Primarily a Human + ChatGPT planning/guidance capability. Arena uses its
vocabulary only when the assigned Issue selects it.

## Where the surfaces live

The `CONTEXT.md` / `CONTEXT-MAP.md` / ADR surfaces belong to the project
being modeled — the repository this operating model governs — and are created
lazily, only when real content requires them. A repository may deliberately
have no `CONTEXT.md`, no `CONTEXT-MAP.md`, and no `docs/adr/` tree, and
adopting this capability does not change that: never pre-populate empty
scaffolding. `docs/README.md` owns the truth discipline; ADRs follow that same
discipline.

Create files lazily: only when you have something to write. If no `CONTEXT.md`
exists in the project being modeled, create one when the first term is
resolved. If no `docs/adr/` exists, create it when the first ADR is needed.
Empty scaffolding is prohibited.

Most projects have a single context:

```
/
├── CONTEXT.md
├── docs/
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

If a `CONTEXT-MAP.md` exists at the root, the project has multiple contexts.
The map points to where each one lives:

```
/
├── CONTEXT-MAP.md
├── docs/
│   └── adr/                          ← system-wide decisions
├── src/
│   ├── ordering/
│   │   ├── CONTEXT.md
│   │   └── docs/adr/                 ← context-specific decisions
│   └── billing/
│       ├── CONTEXT.md
│       └── docs/adr/
```

## During the session

### Challenge against the glossary

When the human uses a term that conflicts with the existing language in
`CONTEXT.md`, call it out immediately. "Your glossary defines 'cancellation' as
X, but you seem to mean Y. Which is it?"

### Sharpen fuzzy language

When the human uses vague or overloaded terms, propose a precise canonical
term. "You're saying 'account': do you mean the Customer or the User? Those are
different things."

### Discuss concrete scenarios

When domain relationships are being discussed, stress-test them with specific
scenarios. Invent scenarios that probe edge cases and force precision about the
boundaries between concepts.

### Cross-reference with code

When the human states how something works, check whether the code agrees. If
you find a contradiction, surface it: "Your code cancels entire Orders, but you
just said partial cancellation is possible. Which is right?" Statements about
behavior are claims; code is evidence.

### Update CONTEXT.md inline

When a term is resolved, update `CONTEXT.md` right there. Don't batch these up:
capture them as they happen. Use the format in
[CONTEXT-FORMAT.md](CONTEXT-FORMAT.md).

`CONTEXT.md` should be totally devoid of implementation details. Do not treat
it as a spec, a scratch pad, or a repository for implementation decisions. It
is a glossary and nothing else.

### Offer ADRs sparingly

Only offer to create an ADR when all three are true:

1. **Hard to reverse**: the cost of changing your mind later is meaningful.
2. **Surprising without context**: a future reader will wonder "why did they do
   it this way?"
3. **The result of a real trade-off**: there were genuine alternatives and you
   picked one for specific reasons.

If any of the three is missing, skip the ADR. Use the format in
[ADR-FORMAT.md](ADR-FORMAT.md).

## Durable truth

A resolved term or decision becomes project truth through the canonical
destination (glossary, ADR, architecture doc, Issue), per the ChatGPT
durable-decision rule (`../../chatgpt/AGENTS.md`). This capability sharpens the
model; the repository records it.
