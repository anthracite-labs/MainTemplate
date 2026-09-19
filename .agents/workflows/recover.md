# Recovery

Use when work is interrupted, the execution context is fresh, or current
task state is unclear. GitHub is the recovery substrate.

## Procedure

1. Use the assigned or open Issue as the task anchor.
2. Inspect the current branch and working tree.
3. Inspect related PR state and discussion.
4. Inspect recent commits relevant to the Issue.
5. Re-read linked references as needed.
6. Compare acceptance criteria with current repository state.
7. Reconstruct completed work, remaining work, blockers, last verified
   evidence, and the next safe action.
8. If sources conflict, apply `/AGENTS.md` and surface unresolved
   same-domain conflict.
9. Resume only after the reconstruction is evidence-backed.

Plans express intent. Code and PR evidence show implementation state. A
missing update is not proof that work did not happen. Do not create a new
canonical state file as part of recovery.
