# Arena dispatch

How ChatGPT converts an approved decision or bounded task into a GitHub Issue
Arena can execute.

The external prompt stays short. It owns boot order. The Issue owns the task
contract.

## Readiness

Confirm before dispatch:

- the objective is decided
- durable truth the task needs already exists in GitHub/repo
- accepted ADRs/policies are not being silently contradicted
- the task fits one execution/PR
- success can be verified
- each selected capability has an exact repo-relative path and a reason

If not, resolve or split first. Do not compress substantial feature meaning
into an Arena Issue. Do not send unresolved consequential decisions to Arena.

When planning depth is needed, select the minimum capability from
`.agents/CAPABILITIES.md`.

## Task compilation

Fill `.github/ISSUE_TEMPLATE/arena-task.md`. Do not reproduce that schema
here.

- One concrete objective.
- Authority and closed decisions Arena must not reopen.
- Execution names the exact vendored or local procedure paths, or none.
- Boundaries, acceptance, verification, and escalation are task-specific.
  Standing Arena policy is not restated in the Issue.

Do not repeat `/AGENTS.md` or `/.agents/arena/AGENTS.md` in the Issue. The
external prompt loads those first.

Write with direct imperatives, explicit delimiters, ordered steps when
sequence matters, and references to canonical files over copied context.

## Capability selection

For each task choose deliberately:

- deterministic repository scripts and checks
- only the exact catalog paths the task needs, or none — each with a reason

No skill is selected merely because it exists. Selected procedures remain
subordinate to project truth, policy, and the Issue.

## Canonical Arena prompt

Substitute the actual `<owner>/<repo>` and Issue number.

```text
Open `<owner>/<repo>`.

Your assigned task is Issue #N.

Read `/AGENTS.md` completely.

Then read `/.agents/arena/AGENTS.md` completely.

Then open and execute Issue #N exactly as written.

Do not work outside the Issue.

Open or update the PR with the required verification evidence when complete.
```

Keep the external prompt this small.

## After Arena returns

Review against the Issue, not against Arena's summary. Follow
`.agents/chatgpt/AGENTS.md` (Reviewing Arena). If the PR reveals a new
consequential decision, surface it to the human.
