# Review Workflow

Use for an independent review of a proposed change.

## Review order

1. Read the assigned Issue and acceptance criteria.
2. Read governing architecture/ADR/policy references.
3. Inspect the actual diff.
4. Inspect tests and deterministic verification evidence.
5. Check behavior/correctness before style.
6. Check architecture/policy compliance and scope.
7. Check failure handling, edge cases, security/trust boundaries, and documentation drift.
8. Report only actionable findings.

## Finding standard

For each finding include:

- severity/impact;
- exact location;
- concrete failure mode;
- why existing evidence does not cover it;
- smallest credible correction when useful.

Avoid speculative style noise.

Individual review findings do not automatically become deterministic blockers.
Merge approval still follows the operating model and the ChatGPT/human review
contract (`../chatgpt/AGENTS.md`, Reviewing Arena).
