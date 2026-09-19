# Adopted Capabilities Catalog

This directory is the repository's governed capability surface. It is the
single canonical catalog of adopted skills: names, purposes, and role routing
live here and nowhere else. Root `/AGENTS.md` owns the capability rule and the
authority model; nothing in this directory overrides root policy, role policy,
accepted project truth, or the assigned Issue.

Provenance, exact upstream revisions, licenses, and material adaptations are
recorded once in [PROVENANCE.md](PROVENANCE.md).

## Activation model

A capability is a subordinate procedure, active only when:

- the assigned GitHub Issue selects it by repo-relative path (e.g.
  `.agents/skills/tdd/SKILL.md` under "Selected skills / tools"), or
- governing policy makes it universally required (none currently are).

A capability existing here does not make it active for any task. Do not load
capabilities "because they are there". Read a selected capability's `SKILL.md`
first; load its support files only when its procedure reaches them (progressive
disclosure). Where one capability depends on another, the reference is an
explicit repo-relative path, and the referenced capability is read directly —
there is no installer, router, or proprietary invocation tool.

Every subdirectory here contains an actually adopted capability. Empty
placeholder directories are prohibited and rejected by `scripts/repo-check`.
Adding or removing a capability requires a deliberate human + ChatGPT decision,
a provenance update, and a `scripts/repo-check` update in the same change.

## Role routing

Routing, not authority: the classification says which role a capability
primarily serves. The authority model in `/AGENTS.md` is unchanged.

### Human + ChatGPT planning/guidance capabilities

Used by ChatGPT with the human to think, decide, and compile bounded work.
Arena does not select these for itself.

| Capability | Purpose |
|---|---|
| [grilling](grilling/SKILL.md) | Structured interrogation of a plan/decision: decision tree, frontier rounds, facts found by the agent, consequential decisions made by the human; done only when the frontier is genuinely empty. Selected deliberately — not for ordinary small questions. |
| [domain-modeling](domain-modeling/SKILL.md) | Build/sharpen precise shared vocabulary; challenge ambiguous terms; concrete edge-case scenarios; cross-check claims against code; lazy `CONTEXT.md` and sparing ADRs in generated projects. |
| [wayfinder](wayfinder/SKILL.md) | Chart large, ambiguous work as a durable GitHub map of decision tickets; work the decision frontier until the route to implementation is clear. |
| [to-spec](to-spec/SKILL.md) | Synthesize a substantial feature spec (GitHub Issue) from settled discussion: problem, outcome, meaningful user stories, decisions, seams, testing, out of scope. |
| [to-tickets](to-tickets/SKILL.md) | Decompose a spec/plan into tracer-bullet vertical-slice GitHub Issues with real blocking edges; each executable ticket is a valid bounded Arena task contract. |
| [prototype](prototype/SKILL.md) | Throwaway logic/UI prototypes that answer a specific design question; conclusions recorded durably, artifacts deleted by default. Also usable by Arena when a bounded Issue explicitly asks Arena to build one. |
| [improve-codebase-architecture](improve-codebase-architecture/SKILL.md) | Survey change hotspots and shallow modules; propose deepening candidates in a portable report; never silently refactor. |
| [writing-for-agents](writing-for-agents/SKILL.md) | Craft for AGENTS files, skills, and agent-facing docs: context pointers, progressive disclosure, completion criteria, pruning stale/no-op instructions and sediment. |

### Arena execution capabilities (only when the Issue selects them)

| Capability | Purpose |
|---|---|
| [tdd](tdd/SKILL.md) | Red → green loop with vertical slices, behavior tested through public interfaces, anti-patterns (implementation-coupled, tautological, horizontal slicing). |
| [codebase-design](codebase-design/SKILL.md) | Deep-module design vocabulary and procedure: module, interface, seam, adapter, depth, leverage, locality, deletion test. Accepted project architecture/ADRs win on conflict. |
| [resolving-merge-conflicts](resolving-merge-conflicts/SKILL.md) | Intent-based conflict resolution: recover both sides' intent, resolve hunk-by-hunk, verify, finish; abort/escalate when intent cannot be recovered within authority. |
| [security-audit](security-audit/SKILL.md) | Cloudflare's full deep security-audit procedure: reconnaissance, coverage-led hunting, adversarial validation, structured findings, independent verification, target-neutral reporting. Selected via `.agents/workflows/security.md` routing when full audit depth is required. |

### Canonical workflows are not skills

Debugging and review have one canonical owner each in `.agents/workflows/`
(`debug.md`, `review.md`), which were rebuilt from stronger upstream mechanisms
(see [PROVENANCE.md](PROVENANCE.md)). There is deliberately no `debugging` or
`code-review` skill directory: a workflow plus a duplicated skill would create
two competing owners. Research is owned solely by `.agents/RESEARCH.md`.
