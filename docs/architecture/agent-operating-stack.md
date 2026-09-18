# MainTemplate Agent Operating Stack — V1

Status: **current accepted V1 architecture**

This document is the durable repository record for the MainTemplate agent
operating stack. Historical build decisions and implementation history remain
in GitHub Issues, PRs, and Git history.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

Four participants, each with a distinct structural role: the human owns intent
and judgment, ChatGPT guides and compiles work, Arena executes bounded tasks,
and GitHub/repository is the durable system of record. Agents are replaceable;
repository truth is continuous.

## Authority domains

Authority is layered rather than flat. Root `AGENTS.md` owns the normative
authority and conflict rules; this section records the structural shape those
rules govern.

Ordered from most to least authoritative:

1. Project truth — accepted requirements, architecture, ADRs, canonical docs.
2. Agent operating policy — root and role-specific `AGENTS.md` files.
3. Task contract — the assigned GitHub Issue.
4. Task procedure/capability — selected workflows and any adopted capabilities.
5. Evidence/reference — code, tests, config, research, runtime observation.

A lower layer never silently overrides a higher one.

## Responsibility boundaries

| Surface | Responsibility |
|---|---|
| `/AGENTS.md` | Repository constitution, authority model, map, role routing |
| `/.agents/chatgpt/AGENTS.md` | ChatGPT operating contract |
| `/.agents/chatgpt/RESEARCH.md` | Canonical external research/evidence standard, referenced by the research workflow |
| `/.agents/chatgpt/ARENA-DISPATCH.md` | Arena Issue compiler and canonical external execution prompt |
| `/.agents/arena/AGENTS.md` | Arena standing execution policy |
| `/.agents/workflows/` | Reusable task procedures |
| `docs/` | Durable project truth and durable supporting evidence |
| GitHub Issue | One bounded task contract |
| PR | Implementation result and verification evidence |
| `scripts/` | Deterministic repo-owned procedures |
| `.gitattributes` | Path-aware Git content/whitespace policy used by verification |
| `.github/` | GitHub task/review/ownership/CI surfaces |

## Dispatch and execution

The exact external Arena execution prompt is owned by
`/.agents/chatgpt/ARENA-DISPATCH.md` and should not be copied into other
standing policy files.

Conceptually:

1. ChatGPT and the human establish the bounded task and any consequential
   decisions.
2. Durable decisions needed for execution are recorded in GitHub/repository.
3. ChatGPT creates the detailed Arena Issue.
4. The external Arena prompt loads standing operating policy before the assigned
   Issue.
5. The Issue selects task-specific references, a workflow when applicable, and
   any deliberately approved capabilities.
6. Arena executes, verifies, inspects the final diff, and returns PR evidence.
7. Human + ChatGPT review the actual diff and evidence before merge.

The Issue owns task detail. The Arena role contract does not duplicate boot
navigation.

## Progressive disclosure

The instruction set is structured as a routing tree rather than a single
prompt: root constitution routes to role policy, role policy routes to the task
contract, and the task contract names the references and procedures that apply.
Normative loading rules are owned by root and role `AGENTS.md`.

## Verification

`scripts/verify` is the single stable repository verification entry point. It
delegates repository operating invariants to `scripts/repo-check` and performs
content checks over both committed history and any current worktree/index
changes. GitHub Actions runs `scripts/verify` on pull requests and pushes to
`main`.

## Accepted architectural decisions

These are the durable decisions that shape the structure above.

**No canonical state store.** V1 deliberately has no `state.json` or
`CURRENT.md`. Operational state is reconstructed from Issues, PRs, branches,
Git history, accepted docs/ADRs, and current implementation evidence, because
GitHub already stores that state durably and a second store would become a
competing mutable copy. `scripts/repo-check` enforces the absence of both
files. Dedicated state machinery would require a measured recovery failure that
Git/GitHub cannot solve.

**Smallest coherent mechanism.** The stack ships only surfaces with a
demonstrated current use. Frameworks, dependencies, memory systems, external
services, specialized skills, and tool adapters are demand-driven extensions:
each requires a concrete gap, deliberate human + ChatGPT selection, and a
removal path. Directories are created when something real occupies them, never
in advance, so the repository map always describes the actual filesystem.

**Deterministic verification over self-report.** Completion is evidenced by a
repo-owned script that any participant can rerun, not by agent prose.

**One canonical owner per mutable rule.** Operating policy lives in `AGENTS.md`
files; this document describes structure and records decisions. Task detail
lives in the Issue. The external Arena execution prompt has exactly one owner.

External GitHub administration such as branch protection/rulesets is separate
from this repository architecture and is tracked as operational work.
