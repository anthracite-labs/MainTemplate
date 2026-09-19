# Implementation Workflow

Use for a bounded code/config/documentation change whose intent is already
decided. This remains the repository's top-level bounded execution procedure;
adopted capabilities do not replace it.

## Procedure

1. Read the Issue and authoritative references. Read only the workflows and
   capabilities the Issue explicitly selects; a capability existing in
   `.agents/skills/` is not active by default.
2. Inspect current behavior before editing.
3. Extract explicit domain/edge semantics: boundaries, ordering, nullability,
   dates/timezones, rounding, precedence, compatibility, error behavior.
4. Identify the smallest coherent change surface.
5. Where the Issue selected a capability and it is relevant, apply it as a
   subordinate procedure at its exact repo-relative path, reading its
   `SKILL.md` first.
6. Implement without unrelated refactoring.
7. Add or update tests for changed behavior and important edge cases.
8. Update durable docs/ADR only when project truth changed.
9. Run the Issue-required checks and `scripts/verify` when available.
10. Inspect the complete diff.
11. Confirm every acceptance criterion before claiming completion.

## Rules

- Do not reopen closed architecture decisions.
- Do not load every skill, add dependencies/tools, or invent a new capability
  because it exists or looks useful; select the minimum procedure the Issue
  authorizes.
- Do not change tests merely to bless incorrect behavior.
- Preserve behavior outside task scope unless the Issue says otherwise.
- If a selected capability conflicts with accepted project truth, role policy,
  or the Issue, those higher-authority sources win; surface the conflict.
