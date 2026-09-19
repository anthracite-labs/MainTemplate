# Arena Dispatch Compiler

This file defines how ChatGPT converts an approved human decision or bounded task
into a GitHub Issue that Arena can execute.

The external prompt to Arena should stay short. It owns the boot/navigation
sequence; the Issue carries the detailed execution contract.

## Core rule

> Specify intent, authority, context, constraints, expected evidence, and escalation boundaries. Arena owns execution inside those boundaries.

Never ask Arena to rediscover a decision already made.

Never hide an undecided consequential choice inside an implementation task.

## Before dispatch

Confirm:

- the objective is actually decided;
- durable project truth required by the task exists in GitHub/repo;
- accepted ADRs/policies are not being silently contradicted;
- the task is bounded enough for one execution/PR;
- the minimum relevant context is known;
- the primary workflow has been consciously selected, or deliberately set to
  None when no reusable workflow applies;
- the minimum capability set is known and each selected capability has an exact
  repo-relative path and task-specific reason;
- success can be verified.

If not, resolve the missing decision or split the task first. Do not compress
substantial feature meaning into an Arena Issue: when planning depth is needed
before dispatch, consult `.agents/skills/README.md` and deliberately select
the minimum planning capability whose documented trigger matches. Do not send
unresolved consequential product/architecture decisions to Arena.

## Issue construction

Use clear direct sections. Keep sections that do not apply short rather than
inventing content.

### Objective
One concrete outcome.

### Why / context
Only context needed to execute correctly.

### Authority
Identify any canonical product/architecture/ADR/policy sources that govern the
task.

### Task-specific references
List only the exact task-specific references Arena needs after opening the
Issue, in the order they should be loaded. If none, say none.

Do not repeat `/AGENTS.md` or `/.agents/arena/AGENTS.md` here; the external
Arena prompt loads those before the Issue.

Do not tell Arena to read the whole repository by default.

### Decisions already made
List closed decisions Arena must not reopen.

### Required workflow
Select one primary workflow when applicable. When no reusable workflow applies,
write None.

### Selected skills / tools
List only capabilities deliberately approved for this task. For each selected
skill, state the exact repo-relative path under `.agents/skills/`, what task
branch triggers it, and why the primary workflow alone is insufficient. If none:
say none. A skill's presence in the repository is not selection.

### Constraints
Hard boundaries that must remain true.

### Do not
Likely failure modes or prohibited scope expansion.

### Acceptance criteria
Observable completion conditions.

### Verification required
Exact deterministic checks/evidence expected.

### Expected result
Describe the final state, not the implementation narrative.

### Expected changed areas
Give a bounded surface when known.

### Out of scope
Prevent adjacent work from leaking into the task.

### Escalate only if
List genuine decision boundaries, conflicts, unavailable required capability,
destructive action, or new trust boundary.

### PR / completion evidence
State what Arena must report.

## Prompt-writing rules

When writing Arena instructions:

- use direct imperative language;
- use clear headings and explicit delimiters;
- use ordered steps when sequence matters;
- state expected output and completion criteria;
- state important negative constraints explicitly;
- prefer references to canonical files over copied context;
- include examples only when ambiguity justifies them;
- do not request private chain-of-thought;
- do not bury the objective under background prose.

## Canonical Arena execution prompt

Use this prompt shape for normal Arena dispatch. Substitute the actual
`<owner>/<repo>` of this repository and the assigned Issue number.

```text
Open `<owner>/<repo>`.

Your assigned task is Issue #N.

Read `/AGENTS.md` completely.

Then read `/.agents/arena/AGENTS.md` completely.

Then open and execute Issue #N exactly as written.

Do not work outside the Issue.

Open or update the PR with the required verification evidence when complete.
```

Keep the external prompt this small. Put task detail in the Issue rather than
duplicating it here.

The bounded manual acceptance test in
`docs/verification/arena-boot-acceptance.md` verifies that a fresh Arena
execution honors this authority sequence when confronted with conflicting
instructions.

## Capability selection

For each task, choose deliberately:

- the primary workflow, or None when no reusable workflow applies;
- deterministic repository scripts and checks;
- only the exact adopted capability paths the task needs, or None — each with
  a stated reason why the primary workflow alone is insufficient.

The catalog at `.agents/skills/README.md` is the sole current capability list
and role-routing reference. No skill is selected merely because it exists;
selected skills remain subordinate to project truth, policy, and the Issue.

## Scope test

Before creating the Issue, answer yes to each:

- Does Arena know the exact outcome?
- Does it know what is authoritative?
- Does the external prompt establish root policy → Arena policy → assigned Issue?
- Are closed decisions explicitly closed?
- Is the primary workflow selected, or explicitly None?
- Are specialized capabilities selected only when needed, by exact path and
  stated reason?
- Are constraints and out-of-scope boundaries explicit?
- Is success independently verifiable?
- Are escalation conditions real rather than routine?
- Can the task be reviewed as one coherent PR?

## After Arena returns

Review against the Issue, not against Arena's prose summary.

Check:

1. actual diff;
2. acceptance criteria;
3. deterministic verification;
4. architecture/policy compliance;
5. dependency/capability drift;
6. unrelated changes;
7. durable docs/ADR updates required by the task.

Apply `.agents/workflows/review.md` as three independent concerns: Spec/task
fidelity, Engineering quality, Risk/evidence. If the PR reveals a new
consequential decision, do not normalize it after the fact. Surface it to the
human.
