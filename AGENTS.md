# AGENTS.md — MainTemplate Repository Constitution

This file is the root operating map for MainTemplate. It is deliberately short:
a constitution plus a map, not a handbook. Deeper instructions belong in their
own locations and are loaded only when a task requires them.

The locked V1 build guide is [Issue #1](https://github.com/anthracite-labs/MainTemplate/issues/1).

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

- **Human** — owns intent, strategy, product decisions, consequential
  architecture, priorities, and final judgment.
- **ChatGPT** — guides: researches, compares, challenges assumptions, compiles
  bounded Arena execution Issues, and reviews Arena results. ChatGPT is not
  canonical project memory.
- **Arena** — executes: performs the bounded implementation/debug/testing/
  review/security/documentation/Git work defined by its assigned GitHub Issue,
  verifies the result, and returns evidence in a pull request.
- **GitHub / repository** — the durable system of record. Issues, PRs,
  branches, Git history, and accepted docs/ADRs constitute project memory.

## Source of truth

- Project truth belongs in the GitHub repository: files, Issues, PRs, branches,
  Git history, and accepted ADRs/docs.
- AI conversations, model memory, session state, sandboxes, external vector
  stores, and proprietary memory services are **not** canonical. None of them
  may become a competing source of project truth.
- Any durable decision that a future agent will need must be encoded in the
  repository or in a GitHub Issue before execution relies on it.

## Authority / precedence

When sources conflict, apply this precedence (highest first), unless a later
human-approved ADR changes it:

1. human-approved product truth / requirements;
2. accepted ADRs and canonical architecture;
3. assigned GitHub Issue task contract;
4. root + role-specific agent instructions;
5. selected workflow;
6. selected skills/tools;
7. implementation evidence: code/tests/config;
8. research/reference material;
9. agent inference.

At conflict boundaries:

- An Issue does not silently override an accepted ADR.
- Consequential architecture changes require explicit human approval and
  durable recording before implementation.
- When sources at the same authority level conflict, stop and surface the
  conflict rather than inventing a reconciliation.

## Repository map

Currently existing:

- `AGENTS.md` — this file: constitution, authority, navigation, role routing.
- `README.md` — human-facing entry point.

Planned V1 surfaces (not yet created; each arrives through a later bounded
Issue — do not reference them as if they were available):

- `.agents/chatgpt/` — how ChatGPT works with the human: role rules
  (`AGENTS.md`), research/evidence standards (`RESEARCH.md`), and the Arena
  dispatch compiler (`ARENA-DISPATCH.md`).
- `.agents/arena/` — Arena execution behavior (`AGENTS.md`).
- `.agents/workflows/` — reusable procedures selected by an Issue: research,
  plan, implement, debug, review, security, recover.
- `.agents/skills/` — specialized reusable capabilities, active only when an
  Issue explicitly selects them.
- `docs/` — durable project truth: product, architecture, ADRs, engineering,
  research, plans, runbooks.
- `scripts/` — deterministic repo-owned procedures (`verify`, `repo-check`).
- `tools/` — approved third-party tool adapters only.
- `evals/` — evaluation of the agent operating system itself.
- `.github/` — Issue/PR templates, CODEOWNERS, and workflows for mechanical
  enforcement.

## Role routing

Intended routing once the role layers exist:

- **ChatGPT** is pointed to this root `AGENTS.md` first, then to
  `.agents/chatgpt/AGENTS.md`. External ChatGPT project instructions are
  pointers only; they do not duplicate operating rules.
- **Arena** is pointed by its assigned GitHub Issue to this root `AGENTS.md`,
  then to `.agents/arena/AGENTS.md`, then to the exact task-specific
  references named in that Issue.

Current state: the role-specific instruction files do not exist yet. Until
their phases are implemented, the assigned GitHub Issue plus this root
`AGENTS.md` are the complete available operating contract for an executing
agent.

## Progressive disclosure

Agents must:

- begin with the explicitly assigned sources — the Issue and the files it
  names, in the order it names them;
- load deeper references only when the task reveals a concrete need;
- not read the whole repository by default;
- not copy deeper procedures back into this root file — route to them instead.

## Verification principle

> Prefer deterministic verification over trusting prose or agent claims
> wherever practical.

Every task must define how its result is verified, and PRs must return
evidence against the assigned Issue. The stable verification entry point will
be `scripts/verify` — planned, not yet created. Until it exists, follow the
verification steps stated in the Issue.

## Escalation

Stop and surface the situation rather than inventing a resolution when facing:

- conflicting authoritative truth;
- missing product intent;
- consequential architecture choices not already decided;
- new security/trust boundaries;
- destructive or irreversible decisions.

Routine, reversible implementation details should be resolved autonomously —
do not escalate them unnecessarily.
