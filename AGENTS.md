# AGENTS.md — Repository constitution

Root operating map: constitution plus routing, not a handbook. Load deeper
files only when the task needs them. Rationale lives in
`.agents/OPERATING-MODEL.md`.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

- Human owns intent, strategy, product decisions, consequential architecture,
  priorities, and final judgment.
- ChatGPT guides: research, comparison, challenge, capability selection,
  Arena task compilation, and review.
- Arena executes the bounded GitHub Issue and returns verified PR evidence.
- GitHub / repository is the durable system of record.

Agents are replaceable. Repository truth is continuous.

## Truth

Durable project truth belongs in GitHub/repository. Conversations, model
memory, session state, sandboxes, external indexes, and proprietary memory
services are not canonical.

Record any durable decision future work depends on in the repository or a
GitHub Issue before execution relies on it. One mutable fact, one owner.

## Authority

| Domain | Answers | Held by |
|---|---|---|
| Project truth | What is true or decided? | Accepted requirements, ADRs, canonical docs |
| Policy | How may agents operate? | This file and role `AGENTS.md` files |
| Task | What must Arena do now? | Assigned GitHub Issue |
| Procedure | How is the work carried out? | Selected workflows and vendored capabilities |
| Evidence | What verifies or informs? | Code, tests, config, research |

- An Issue does not override project truth or policy merely by contradicting it.
- Intentional changes to truth, architecture, or policy must name the
  human-approved change and update the owning file.
- Consequential architecture requires explicit human approval and durable
  recording.
- Same-domain conflicts are surfaced, not guessed through.
- Procedures never override truth, policy, or the task.

## Map

### Operating layer

- `.agents/chatgpt/AGENTS.md` — ChatGPT with the human.
- `.agents/chatgpt/ARENA-DISPATCH.md` — Arena Issue and prompt compiler.
- `.agents/arena/AGENTS.md` — Arena execution.
- `.agents/CAPABILITIES.md` — catalog and routing.
- `.agents/vendor/` — immutable upstream procedures; `.agents/vendor/UPSTREAM.lock`
  is the inventory authority.
- `.agents/PROVENANCE.md` — why those procedures were adopted.
- `.agents/RESEARCH.md` — research and evidence standard.
- `.agents/workflows/` — local procedures upstream does not own.
- `.agents/OPERATING-MODEL.md` — rationale, not a second policy.

### Project truth

- `docs/` — project documentation. `docs/agents/` is tracker configuration
  for vendored skills, not product architecture.
- Issues, PRs, branches, and Git history — task, evidence, and result.

### Deterministic layer

- `scripts/verify` — source-tree health.
- `scripts/repo-check` — operating invariants, including vendor integrity.
- `scripts/bootstrap-repository` — GitHub settings. `--check` is GitHub
  health, not source health.
- `.github/ISSUE_TEMPLATE/arena-task.md` — Arena task contract.
- `.github/PULL_REQUEST_TEMPLATE.md` — execution evidence.
- `.github/CODEOWNERS` — advisory ownership and review routing.
- `.github/workflows/verify.yml` — CI entry for `scripts/verify`.

## Role routing

- ChatGPT boot: `/AGENTS.md`, then `/.agents/chatgpt/AGENTS.md`.
- Arena boot: the prompt in `.agents/chatgpt/ARENA-DISPATCH.md`. It loads
  root policy, then Arena policy, then the assigned Issue.

External bootstrap instructions are pointers, not duplicated policy.

## Progressive disclosure

Begin with assigned sources. Load deeper files only when relevant. Do not
copy procedures into root. Do not load unused capabilities.

## Verification

> Prefer deterministic verification over trusting prose or agent claims wherever practical.

Run `scripts/verify` unless the Issue names a stronger path. PRs map evidence
to acceptance. Source verification does not prove GitHub ruleset state.

## Escalation

Stop and surface:

- conflicting authoritative truth
- missing product intent
- undecided consequential architecture
- new security or trust boundaries
- destructive or irreversible decisions
- a required capability that cannot operate

Routine reversible implementation is resolved autonomously.

## Capability

Activation has exactly three paths. `.agents/CAPABILITIES.md` owns names,
paths, triggers, and actors.

1. **Planning selection** — Human + ChatGPT deliberately select a planning
   capability. No Issue is required.
2. **Execution selection** — the assigned Issue names the exact repo-relative
   path and why it applies. Arena never self-activates a capability.
3. **Policy-required procedure** — governing policy may require a procedure.
   `scripts/verify` is the current example; it is a script, not a skill.

Existence never activates. No capability overrides root policy, role policy,
project truth, or the Issue.

Vendored upstream content is authoritative for its procedure and is never
edited locally. Integration changes belong in our files. Upstream changes
require a deliberate pin bump recorded in `.agents/vendor/UPSTREAM.lock`.

Adding or removing a capability is a human + ChatGPT decision with catalog,
provenance, lock, and check updates. Do not independently adopt frameworks,
memory systems, or tools merely because they exist.

## State

No `state.json` or `CURRENT.md`. Recover from Issues, PRs, branches, Git
history, accepted docs/ADRs, and implementation evidence.
