# Test-Driven Development

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

TDD is the red → green loop. This capability is the reference that makes that
loop produce tests worth keeping: what a good test is, where tests go, the
anti-patterns, and the rules of the loop. Every section applies on every cycle:
consult them before and during the loop, not after.

An optional, Issue-selected Arena execution capability. TDD is not mandatory
for every task; the assigned Issue decides whether this loop governs the work.

When exploring the codebase, read the project's domain glossary (`CONTEXT.md`,
where the project has one) so test names and interface vocabulary match the
project's domain language, and respect ADRs in the area you're touching.

## What a good test is

Tests verify behavior through public interfaces, not implementation details.
Code can change entirely; tests shouldn't. A good test reads like a
specification: "user can checkout with valid cart" tells you exactly what
capability exists, and it survives refactors because it doesn't care about
internal structure.

See [tests.md](tests.md) for examples and [mocking.md](mocking.md) for mocking
guidelines.

## Seams: where tests go

A **seam** is the public boundary you test at: the interface where you observe
behavior without reaching inside. Tests live at seams, never against internals.

**Test at decided seams.** Before writing any test, write down the seams under
test. Where the seams come from:

1. The assigned Issue or an accepted spec/architecture decision already names
   them — use them as decided; they are closed decisions, not open questions.
2. The seam is an ordinary reversible implementation choice within the task's
   scope — choose it autonomously using the guidance below and record the
   choice where the work is evidenced (PR description or commit message).
3. The test seam implies a consequential architecture decision (a new module
   boundary, a new port/adapter, a cross-context interface, anything hard to
   reverse) — that is an escalation boundary under root `/AGENTS.md`, not a
   test decision: surface it rather than choosing it.

Arena does not interrupt execution for routine seam confirmation in cases 1
and 2. You can't test everything, so decided seams are how testing effort lands
on the critical paths and complex logic instead of every edge case.

Ask of each seam: "What's the public interface, and does testing here observe
real behavior?" Prefer existing seams to new ones and the highest seam that
still isolates the behavior under test.

When the shape of that interface is itself in question (how deep the module is,
where the seam belongs, what the interface should expose), read
[../codebase-design/SKILL.md](../codebase-design/SKILL.md) for the vocabulary.
It is the shared source of the module, interface, depth, seam, adapter,
leverage and locality terms, and it is a reference to consult, not a session to
run.

## Anti-patterns

- **Implementation-coupled**: mocks internal collaborators, tests private
  methods, or verifies through a side channel (querying the database instead of
  using the interface). The tell: the test breaks when you refactor but
  behavior hasn't changed.
- **Tautological**: the assertion recomputes the expected value the way the
  code does (`expect(add(a, b)).toBe(a + b)`, a snapshot derived by hand the
  same way, a constant asserted equal to itself), so it passes by construction
  and can never disagree with the code. Expected values must come from an
  independent source of truth: a known-good literal, a worked example, the
  spec.
- **Horizontal slicing**: writing all tests first, then all implementation.
  Bulk tests verify _imagined_ behavior: you test the _shape_ of things rather
  than user-facing behavior, the tests go insensitive to real changes, and you
  commit to test structure before understanding the implementation. Work in
  **vertical slices** instead: one test → one implementation → repeat, each
  test a **tracer bullet** that responds to what the last cycle taught you.

## Rules of the loop

- **Red before green.** Write the failing test first, watch it fail for the
  right reason, then only enough code to pass it. Don't anticipate future tests
  or add speculative features.
- **One slice at a time.** One seam, one test, one minimal implementation per
  cycle.
- **Refactoring is not part of the loop.** It belongs to the review stage
  (`/.agents/workflows/review.md`), not the red → green implementation cycle.
