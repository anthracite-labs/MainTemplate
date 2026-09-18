# Recovery Workflow

Use when work is interrupted, the execution context is fresh, or the current task state is unclear.

Git/GitHub are the recovery substrate. Do not depend on chat/model memory.

## Procedure

1. Read the assigned/open Issue that defines the work.
2. Read root and Arena operating instructions.
3. Inspect the current branch and working tree.
4. Inspect related PR state and discussion.
5. Inspect recent commits relevant to the Issue.
6. Read linked plan/ADR/canonical docs.
7. Compare intended acceptance criteria with current repository state.
8. Reconstruct:
   - completed work;
   - remaining work;
   - blockers;
   - last verified evidence;
   - next safe action.
9. If sources conflict, apply the root authority-domain rules and surface unresolved same-domain conflict.
10. Resume only after the reconstruction is evidence-backed.

## Rules

- Do not invent state from stale prose.
- Plans express intent; code/PR evidence shows implementation state.
- A missing update is not proof that work did not happen.
- Do not create a new canonical state file as part of recovery unless explicitly approved.
