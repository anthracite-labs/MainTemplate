# Issue tracker

Issues and specs for this repository live as GitHub Issues. Use the `gh`
CLI. This file is MainTemplate tracker configuration so vendored skills that
expect `docs/agents/issue-tracker.md` can find GitHub here.

Infer the repo from `git remote`; `gh` does this inside a clone.

## Conventions

- Create: `gh issue create --title "..." --body "..."`
- Read: `gh issue view <number> --comments`
- List: `gh issue list --state open --json number,title,body,labels,assignees`
- Comment: `gh issue comment <number> --body "..."`
- Label: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- Close: `gh issue close <number> --comment "..."`

GitHub shares one number space across issues and PRs. Resolve a bare `#N`
with `gh pr view N`, then `gh issue view N`.

## Pull requests as a triage surface

**PRs as a request surface: no.**

## When a skill says "publish to the issue tracker"

Create a GitHub issue. Labels: `docs/agents/triage-labels.md`.

`ready-for-agent` marks tracker readiness. Arena still executes only a
bounded Issue compiled by `.agents/chatgpt/ARENA-DISPATCH.md`.

## When a skill says "fetch the relevant ticket"

Run `gh issue view <number> --comments`.

## Wayfinding operations

Used by wayfinder. The map is a single issue; tickets are child issues.

- **Map**: one issue labelled `wayfinder:map`.
  `gh issue create --label wayfinder:map`.
- **Child ticket**: GitHub sub-issue of the map. Where sub-issues are
  unavailable, add the child to a task list in the map body and put
  `Part of #<map>` at the top of the child. Labels: `wayfinder:<type>`
  (`research` / `prototype` / `grilling` / `task`). Claim by assigning the
  driving session.
- **Blocking**: GitHub native issue dependencies.
  `gh api --method POST repos/<owner>/<repo>/issues/<child>/dependencies/blocked_by -F issue_id=<blocker-db-id>`
  where `<blocker-db-id>` is `gh api repos/<owner>/<repo>/issues/<n> --jq .id`,
  not the `#number`. Fallback: `Blocked by: #<n>` at the top of the child
  body. Unblocked when every blocker is closed.
- **Frontier query**: the map's open children with no open blocker and no
  assignee; first in map order wins.
- **Claim**: `gh issue edit <n> --add-assignee @me`, first write of the
  session.
- **Resolve**: comment the answer, close the issue, append a context pointer
  to the map's Decisions-so-far.

Create a missing `wayfinder:*` or `ready-for-agent` label on first use with
`gh label create`.
