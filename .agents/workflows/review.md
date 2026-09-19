# Review Workflow

Use for an independent review of a proposed change. This is the repository's
one canonical review procedure; there is deliberately no duplicate code-review
skill. It implements the independent-axis mechanism recorded in
`.agents/skills/PROVENANCE.md`, with this repository's risk and evidence
requirements.

## Establish the review set

1. Pin the fixed point: use the PR base/merge-base or the user-supplied commit,
   branch, or tag; verify it resolves and that the three-dot diff is non-empty.
2. Read the assigned GitHub Issue and its acceptance criteria. Identify its
   canonical project-truth references (architecture, ADRs, policies, specs).
3. Inspect the actual diff, commit list, tests, configuration, documentation,
   and deterministic evidence — not only the PR summary.
4. If the originating Issue/spec is unavailable, report that as a Spec/task
   fidelity evidence gap; do not invent a substitute.

## Run independent review axes

The axes are logically independent. A clean result on one can never hide a
failure on another; report them in separate sections and never collapse them
into one vague score.

Where the execution environment supports independent subagents/contexts,
prefer one isolated review context per axis, each given the same fixed point
and only the sources it needs. Independence prevents a plausible conclusion in
one axis from contaminating another. Where it does not, run each axis in a
separate deliberate pass, reset to the fixed question, and keep notes/results
separate until reporting.

### A. Spec / task fidelity

**Question:** Did the change implement exactly what the assigned Issue
required?

Check:

- missing or partial requirements;
- incorrect behavior;
- scope creep and unrelated changes;
- every acceptance criterion;
- closed decisions accidentally reopened;
- conflict with the task's explicitly authoritative project truth.

The Issue/spec is the comparison source. Quote the requirement for every
finding. A technically elegant change that implements the wrong thing fails
this axis.

### B. Engineering quality

**Question:** Is the implementation technically sound and consistent with
project standards?

Read documented repository standards first; repository-specific accepted
standards and architecture/ADRs override generic heuristics. Then inspect:

- documented coding/design standards;
- duplication;
- speculative abstraction and unnecessary complexity;
- poor seams/interfaces, depth, leverage, and locality where the task touches
  module design (the vocabulary lives in `.agents/skills/codebase-design/`);
- compatibility with accepted architecture;
- relevant code smells as judgment calls, not automatic violations.

Useful judgment heuristics (only where not already enforced by tooling and not
contradicted by repository standards): mysterious names, duplicated code,
feature envy, data clumps, primitive obsession, repeated switches, shotgun
surgery, divergent change, speculative generality, message chains, middle men,
and refused bequest. Label them as possible smells and explain the observed
cost; do not promote them to hard violations merely because a taxonomy names
them.

A change can faithfully implement the Issue and still fail this axis.

### C. Risk / evidence

**Question:** Is the result safe, verifiable, and honestly evidenced?

Check:

- edge and failure behavior;
- trust/security boundaries and destructive behavior;
- verification quality: targeted checks, deterministic checks, tests, and what
  they actually prove;
- missing or misleading evidence;
- documentation drift;
- architecture and policy compliance;
- dependency/capability drift;
- compatibility/regression risk;
- unrelated changes and unreviewed generated artifacts.

A change can be faithful and clean yet fail this axis because the evidence is
insufficient or it crosses an unaddressed trust boundary.

## Finding standard

Report only actionable findings. For each finding include:

- **impact** (severity/priority and who/what is affected);
- **exact location** (path plus line/hunk or precise structural reference);
- **concrete failure mode** (what actually goes wrong and under what input or
  state);
- **why existing evidence does not cover it**;
- **smallest credible correction**, when useful.

Separate findings under exactly these headings: `Spec / task fidelity`,
`Engineering quality`, and `Risk / evidence`. State a pass/no-findings result
for each axis independently, and state source/evidence gaps explicitly. Do not
rerank findings across axes into a single winner or numerical score. Avoid
speculative style noise.

Individual review findings do not automatically become deterministic blockers.
Merge approval remains Human + ChatGPT judgment under the operating model and
`../chatgpt/AGENTS.md` (Reviewing Arena).