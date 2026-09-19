# AGENTS.md — Repository Constitution

This file is the root operating map for this repository: a constitution plus a
map, not a handbook. Load deeper instructions only when a task requires them.

The current accepted operating architecture is
`docs/architecture/agent-operating-stack.md`.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

- Human owns intent, strategy, product decisions, consequential architecture,
  priorities, and final judgment.
- ChatGPT guides: research, comparison, challenge, capability selection,
  Arena task compilation, and review.
- Arena executes bounded work defined by its assigned GitHub Issue and returns
  verified evidence in a pull request.
- GitHub / repository is the durable system of record.

ChatGPT and Arena are replaceable. Repository truth is continuous.

## Source of truth

- Durable project truth belongs in GitHub/repository.
- AI conversations, model memory, session state, sandboxes, external indexes,
  vector stores, and proprietary memory services are not canonical.
- Any durable decision future work depends on must be encoded in the repository
  or a GitHub Issue before execution relies on it.
- Do not maintain multiple canonical copies of the same mutable fact.

## Authority domains and conflict rules

Authority is not one flat ladder.

- Project truth: human-approved requirements, accepted ADRs, canonical
  architecture, and other accepted project docs define what is true/decided.
- Agent operating policy: this file and role-specific AGENTS.md files define how
  agents are allowed to operate.
- Task contract: the assigned GitHub Issue defines what Arena must do now,
  within project truth and operating policy.
- Task procedure/capability: selected workflows, skills, and tools define how
  the bounded task is carried out.
- Evidence/reference: code/tests/config, research, and agent inference verify or
  inform work; they do not silently override higher-authority truth or policy.

Conflict rules:

- An Issue does not override accepted project truth or operating policy merely
  by contradicting it.
- Intentional changes to product truth, architecture, or operating policy must
  identify the human-approved change and update the canonical source.
- Consequential architecture changes require explicit human approval and
  durable recording.
- Conflicts within the same authority domain must be surfaced, not guessed
  through.
- Workflow/skill/tool instructions never override project truth, operating
  policy, or the task contract.

## Repository map

### Agent operating layer

- `.agents/RESEARCH.md` — shared canonical research/evidence standard.
- `.agents/chatgpt/AGENTS.md` — ChatGPT's role with the human.
- `.agents/chatgpt/ARENA-DISPATCH.md` — Arena Issue/prompt compiler.
- `.agents/arena/AGENTS.md` — Arena execution contract.
- `.agents/workflows/` — reusable task procedures: research, plan, implement,
  debug, review, security, recover. `debug.md` and `review.md` are each their
  one canonical procedure; no duplicate skill owns either.
- `.agents/skills/README.md` — canonical catalog and role routing for adopted,
  optional specialized capabilities; `PROVENANCE.md` records their third-party
  sources/licenses/adaptations.

### Durable project truth

- `docs/architecture/agent-operating-stack.md` — the current accepted
  operating-stack architecture.
- `docs/` — other project truth/supporting evidence; create real subdirectories
  only when real content requires them.
- Issues/PRs/branches/Git history — task state, execution history, review
  evidence.

### Deterministic/enforcement layer

- `.gitattributes` — path-aware Git content/whitespace policy used by verification.
- `scripts/verify` — stable verification entry point.
- `scripts/repo-check` — repository operating-invariant checks.
- `.github/ISSUE_TEMPLATE/arena-task.md` — standard Arena task contract.
- `.github/PULL_REQUEST_TEMPLATE.md` — evidence-oriented PR template.
- `.github/CODEOWNERS` — advisory ownership and review routing for sensitive operating surfaces.
- `.github/workflows/verify.yml` — repository verification in CI.

## Role routing

- ChatGPT project bootstrap: external project instructions should only point to
  `/AGENTS.md` and then `/.agents/chatgpt/AGENTS.md`.
- Arena bootstrap: use the canonical execution prompt defined in
  `.agents/chatgpt/ARENA-DISPATCH.md`. It loads standing operating policy before
  the assigned Issue; the Issue contains only task-specific
  references/workflow/capabilities.

External bootstrap instructions are navigation pointers, not duplicated policy.

## Progressive disclosure

Agents must:

- begin with explicitly assigned sources;
- load deeper references only when relevant;
- avoid reading the whole repository by default;
- avoid copying deeper procedures into root instructions;
- avoid loading unused skills/tools.

After boot policy is loaded, the assigned Issue tells Arena which task-specific
references/workflow/capabilities are active and what result/evidence is expected.

## Verification principle

> Prefer deterministic verification over trusting prose or agent claims wherever practical.

For repository changes, run `scripts/verify` unless the Issue explicitly defines
a stronger/specialized verification path. PRs must map evidence to acceptance
criteria.

## Escalation

Stop and surface rather than invent resolution for:

- conflicting authoritative truth;
- missing product intent;
- consequential architecture not already decided;
- new security/trust boundaries;
- destructive or irreversible decisions;
- a required capability that cannot operate.

Routine reversible implementation details should be resolved autonomously.

## Capability rule

Activation has exactly three paths; this section owns the general rule and
`.agents/skills/README.md` owns the detailed catalog: names, purposes, and
role routing.

- **Planning selection** — before an Arena execution Issue exists, Human +
  ChatGPT may deliberately select a planning/guidance capability from the
  catalog to think, decide, map, specify, or compile work. Selection is
  deliberate and uses the minimum capability needed, at its exact
  repo-relative path. The capability remains subordinate to root and ChatGPT
  policy; it may produce durable decisions, specs, maps, or Arena Issues. No
  Issue is required for this path.
- **Execution selection** — Arena execution capabilities are active only when
  the assigned bounded Issue names the exact repo-relative path and why the
  capability applies. Arena never self-activates a capability because it
  exists.
- **Policy-required procedure** — governing policy may make a procedure
  universally required. `scripts/verify` is the current example; it is a
  repository script, not a skill.

A capability's mere existence never activates it, and no capability may
override root policy, role policy, accepted project truth, or the Issue.
Role files point to these rules and the catalog; they never invent competing
activation systems.

Adding/removing a capability requires a deliberate human + ChatGPT decision,
actual adopted content (never placeholders), an update to the catalog and
provenance record, and deterministic repository checks. Do not independently
adopt frameworks, dependencies, memory systems, review systems, or security
tools merely because they exist.

## State/memory

This repository has no dedicated canonical `state.json` or `CURRENT.md`.

Recover operational state from Issues, PRs, branches, Git history, accepted
docs/ADRs, and current implementation evidence. Add dedicated state machinery
only if measured usage demonstrates a real recovery failure that Git/GitHub
cannot solve cleanly.
