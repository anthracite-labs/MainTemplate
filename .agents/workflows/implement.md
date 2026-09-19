# Implementation Workflow

Use for a bounded code/config/documentation change whose intent is already
decided. This remains MainTemplate's top-level bounded execution procedure; it
is not replaced by an imported wrapper.

## Procedure

1. Read the Issue and authoritative references. Read only the workflows and
   capabilities the Issue explicitly selects; a capability existing in
   `.agents/skills/` is not active by default.
2. Inspect current behavior before editing.
3. Extract explicit domain/edge semantics: boundaries, ordering, nullability,
   dates/timezones, rounding, precedence, compatibility, error behavior.
4. Identify the smallest coherent change surface.
5. Where selected and relevant, apply the subordinate capability:
   - `.agents/skills/tdd/SKILL.md` for an intentional red → green loop;
   - `.agents/skills/codebase-design/SKILL.md` for module/interface/seam
     design;
   - other exact Issue-selected capability paths only.
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
