# Resolving Merge Conflicts

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Use when an assigned task requires resolving an in-progress Git merge or rebase
conflict. This is an optional Arena execution capability: select it only when
the Issue authorizes conflict resolution or the conflict arises while carrying
out the assigned bounded task.

Resolve by recovering **intent**, never by choosing a side based on line order.
Root `/AGENTS.md`, accepted project truth, and the assigned Issue remain the
authority boundaries for every resolution.

## Procedure

1. **See the current state.** Inspect merge/rebase state, conflict paths,
   current branch/history, and the exact unresolved hunks. Establish whether
   Git is waiting for a merge commit, rebase continuation, or another action.

2. **Find both primary sources.** Understand deeply why each change was made
   and what its original intent was. Read the conflicting commits and their
   diffs; inspect linked PRs and originating GitHub Issues; read canonical
   project docs/ADRs relevant to the hunk. Treat current lines as evidence, not
   their own explanation.

3. **Classify authority before editing.** For each hunk, state:
   - intent on the current side;
   - intent on the incoming side;
   - the merge/rebase's stated goal and the accepted project truth that governs
     it;
   - whether both intents are compatible.

4. **Resolve hunk by hunk.** Preserve both intents when compatible. When
   incompatible but one clearly matches the merge's authorized goal and
   accepted project truth, choose it and record the trade-off in the merge
   commit or PR evidence. Do not invent new product behavior to make code
   compile. Keep the smallest coherent resolution; do not use a conflict as
   cover for unrelated refactoring.

5. **Verify the resulting integration.** Discover and run the project checks
   required by the Issue (typically typecheck, tests, format) and
   `scripts/verify` when the repository has it. Fix only breakage created by
   the integration. Inspect the complete diff, including all resolved paths.

6. **Finish the operation when justified.** Stage the resolved files and
   complete the merge, or continue the rebase until all commits are rebased.
   Report the recovered intent, resolution choices, and verification evidence
   in the PR/Issue.

## Abort / escalate boundary

Routine resolvable conflicts should be completed autonomously. Abort the
merge/rebase and escalate rather than silently choosing when resolution would
require any of these:

- inventing missing product intent;
- choosing between conflicting accepted architecture or project truth;
- making a consequential decision not authorized by the Issue;
- destructive history behavior not authorized by policy.

After aborting, preserve evidence: report the conflicted paths, both source
commits/Issues, the incompatible intents, and the precise decision needed. Do
not discard or overwrite either side merely to clear the conflict.
