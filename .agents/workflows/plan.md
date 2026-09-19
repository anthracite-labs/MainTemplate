# Planning Workflow

Use for a bounded implementation plan when the solution direction is already
sufficiently decided. Do not use it to force unresolved consequential decisions
into an Arena task.

For planning that needs a selected specialized capability, route deliberately:

- large, ambiguous work whose route is not clear →
  `.agents/skills/wayfinder/SKILL.md`;
- substantial feature work whose product/design meaning would be compressed by
  one Arena contract → `.agents/skills/to-spec/SKILL.md`;
- settled work that needs decomposition into bounded PR-sized execution units
  → `.agents/skills/to-tickets/SKILL.md`;
- decisions needing structured interrogation →
  `.agents/skills/grilling/SKILL.md` (not ordinary small questions);
- domain vocabulary/edge semantics that are actively changing →
  `.agents/skills/domain-modeling/SKILL.md`;
- a question materially easier to answer with a runnable/visible artifact →
  `.agents/skills/prototype/SKILL.md`.

These are Human + ChatGPT planning capabilities. They route beneath the root
authority model; they do not create a second planning authority.

## Procedure

1. Read the authoritative task references.
2. Inspect the current code/docs surface affected by the task.
3. State the target outcome and non-goals.
4. Identify impacted components/files/interfaces.
5. Identify invariants and accepted architecture that constrain the change.
6. Identify risks, dependencies, migration/compatibility needs, and
   verification.
7. Break work into coherent execution steps.
8. Surface any consequential decision that is still unresolved.

## Output

A plan should be executable without rediscovering settled decisions. For work
that is not bounded enough for one Arena Issue/PR, do not pretend a long plan
is an executable task: use the selected planning capability to decide or
decompose it before dispatch.

Do not implement unless the Issue explicitly combines planning and execution.

## Verify

Ensure every plan step maps to the Issue acceptance criteria and no step
silently expands architecture or product scope.
