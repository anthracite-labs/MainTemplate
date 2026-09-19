# To Spec

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Turn settled planning discussion into a durable feature spec, published as a
GitHub Issue. No interview: synthesis of what has already been discussed and
decided. Structured interrogation is [../grilling/](../grilling/SKILL.md)'s
job; this capability runs after the frontier of consequential decisions is
settled.

A Human + ChatGPT planning capability. Use it for substantial feature work
where a single Arena task contract would otherwise compress too much
product/design meaning. Do not use it for small bounded tasks — those go
straight to the Arena Issue contract (`.github/ISSUE_TEMPLATE/arena-task.md`)
via `../../chatgpt/ARENA-DISPATCH.md`.

## Process

1. Explore the repository to understand the current state, if you haven't
   already. Use the project's domain glossary vocabulary (where the project has
   one) throughout the spec, and respect accepted ADRs/architecture in the area
   the feature touches. Reference canonical truth instead of restating it: a
   spec never becomes a second mutable copy of an accepted ADR or doc.

2. Sketch the seams at which the feature will be tested. Existing seams are
   preferred to new ones; use the highest seam possible. If new seams are
   needed, propose them at the highest point you can — the fewer seams across
   the codebase, the better; the ideal number is one. Where seam vocabulary is
   needed, [../codebase-design/SKILL.md](../codebase-design/SKILL.md) owns it.
   Check with the human that these seams match their expectations: a new module
   boundary is consequential architecture, and consequential architecture is
   human-approved and durably recorded before Arena executes it.

3. Write the spec using the template below and publish it as a GitHub Issue
   (the durable system of record). The spec Issue is planning truth, not an
   Arena execution contract: it feeds either one compiled Arena Issue (small
   enough to execute as one bounded task) or
   [../to-tickets/](../to-tickets/SKILL.md) (decomposition required). Do not
   dispatch Arena against the spec Issue directly.

## Spec template

```markdown
# Feature spec: <name>

## Problem statement

The problem the user is facing, from the user's perspective.

## Intended outcome

The solution, from the user's perspective: what becomes true for them when this
ships.

## User stories

A numbered list covering every user story that distinguishes meaningful
behavior, an important boundary, or an important edge case. Format:

1. As an <actor>, I want <feature>, so that <benefit>

Stop when additional stories would only restate settled ones: the list exists
to distinguish behaviors, not to wallpaper the spec with repetition.

## Implementation decisions already made

Decisions closed during planning that execution must not reopen:

- modules built/modified and their interface changes;
- architectural decisions (link the ADR/doc that owns each, don't restate it);
- schema changes, API contracts, specific interactions;
- technical clarifications from the human.

No specific file paths or code snippets — they go stale fast. Exception: if a
prototype produced a snippet that encodes a decision more precisely than prose
can (state machine, reducer, schema, type shape), inline it within the relevant
decision and note briefly that it came from a prototype. Trim to the
decision-rich parts, not a working demo.

## Important contracts and seams

The contracts this feature commits to (API shapes, events, data ownership) and
the seams it will be tested at, per step 2.

## Testing decisions

- what makes a good test here (behavior through public interfaces, not
  implementation details — `../tdd/tests.md` owns the standard when selected);
- which modules/seams will be tested;
- prior art: similar existing tests in the codebase.

## Out of scope

What this spec deliberately does not cover.

## Unresolved decisions

Open decisions, if any, each with its owner and what unblocks it. If the list
is not empty, the affected parts are not ready for ticket compilation; consider
../grilling/ or ../wayfinder/ for them.
```
