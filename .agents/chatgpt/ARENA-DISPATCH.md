# Arena Dispatch Compiler

This file defines how ChatGPT converts an approved human decision or bounded task into a GitHub Issue that Arena can execute.

The external prompt to Arena should stay short. The Issue carries the detailed execution contract.

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
- required workflow/skills/tools have been consciously selected;
- success can be verified.

If not, resolve the missing decision or split the task first.

## Issue construction

Use clear direct sections. Keep sections that do not apply short rather than inventing content.

### Objective
One concrete outcome.

### Why / context
Only context needed to execute correctly.

### Authority
Identify any canonical product/architecture/ADR/policy sources that govern the task.

### Read in this order
Always begin with:

1. `/AGENTS.md`
2. `/.agents/arena/AGENTS.md`

Then list exact task-specific references in the order Arena should load them.

Do not tell Arena to read the whole repository by default.

### Decisions already made
List closed decisions Arena must not reopen.

### Required workflow
Select one primary workflow when applicable.

### Selected skills / tools
List only capabilities deliberately approved for this task.
If none: say none.

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
List genuine decision boundaries, conflicts, unavailable required capability, destructive action, or new trust boundary.

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

The Issue should be detailed enough that the external Arena prompt can normally be:

> Open `owner/repo`. Read Issue #N and execute it exactly as written. Do not work outside its scope. Open/update the PR with required evidence when complete.

## Capability selection

For each task, choose deliberately:

- workflow;
- skill(s), if any;
- deterministic scripts/checks;
- approved external tools, if any.

A capability is not active just because it exists in the repo.

When a task does not need a specialized capability, do not load it.

## Scope test

Before creating the Issue, answer yes to each:

- Does Arena know the exact outcome?
- Does it know what is authoritative?
- Does it know exactly what to read first?
- Are closed decisions explicitly closed?
- Is the primary workflow selected?
- Are specialized capabilities selected only when needed?
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

If the PR reveals a new consequential decision, do not normalize it after the fact. Surface it to the human.
