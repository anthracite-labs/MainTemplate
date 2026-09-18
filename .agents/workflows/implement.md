# Implementation Workflow

Use for a bounded code/config/documentation change whose intent is already decided.

## Procedure

1. Read the Issue and authoritative references.
2. Inspect current behavior before editing.
3. Extract explicit domain/edge semantics: boundaries, ordering, nullability, dates/timezones, rounding, precedence, compatibility, error behavior.
4. Identify the smallest coherent change surface.
5. Implement without unrelated refactoring.
6. Add or update tests for changed behavior and important edge cases.
7. Update durable docs/ADR only when project truth changed.
8. Run the Issue-required checks and `scripts/verify` when available.
9. Inspect the complete diff.
10. Confirm every acceptance criterion before claiming completion.

## Rules

- Do not reopen closed architecture decisions.
- Do not add dependencies/tools unless explicitly selected.
- Do not change tests merely to bless incorrect behavior.
- Preserve behavior outside task scope unless the Issue says otherwise.
