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

Authority is not one flat ladder. It is divided into distinct domains, each
answering a different question. Root `AGENTS.md` owns the normative authority
and conflict rules; this section records only the structural shape those rules
govern.

| Domain | Question it answers | Held by |
|---|---|---|
| Project truth | What is true or decided? | Accepted requirements, architecture, ADRs, canonical project docs |
| Agent operating policy | How may agents operate? | Root and role-specific `AGENTS.md` files |
| Task contract | What must Arena do now? | The assigned GitHub Issue |
| Task procedure/capability | How is the bounded task carried out? | Selected workflows and any adopted capabilities |
| Evidence/reference | What verifies or informs the work? | Code, tests, config, research, runtime observation |

The domains constrain each other rather than forming a single ranking. The
Issue defines the current task within project truth and operating policy;
workflows and capabilities are subordinate procedures; evidence informs and
verifies work but does not silently override governing truth or policy.
Conflicts within a single domain are surfaced rather than guessed through.

Root `AGENTS.md` states the binding form of these rules.

## Responsibility boundaries

| Surface | Responsibility |
|---|---|
| `/AGENTS.md` | Repository constitution, authority model, map, role routing |
| `/.agents/RESEARCH.md` | Shared canonical research/evidence standard used by both roles |
| `/.agents/chatgpt/AGENTS.md` | ChatGPT operating contract |
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
delegates repository operating invariants to `scripts/repo-check`, then runs
content checks over the current committed `HEAD` tree and over the
submit-ready worktree/index state when that differs from `HEAD`. GitHub Actions
runs `scripts/verify` on pull requests and pushes to `main`.

## Accepted architectural decisions

These record what was chosen and why. Root and role policy govern any future
change to them.

**No canonical state store.** V1 has no `state.json` or `CURRENT.md`.
Operational state is reconstructed from Issues, PRs, branches, Git history,
accepted docs/ADRs, and current implementation evidence, because GitHub already
stores that state durably and a second store would become a competing mutable
copy. `scripts/repo-check` enforces the absence of both files. Root policy
governs any future adoption of state machinery.

**Smallest coherent mechanism.** The stack ships only surfaces with a
demonstrated current use, which is why no skills, tool adapters, or eval
machinery exist in V1. The repository map therefore describes the actual
filesystem rather than reserved names. Root policy governs any future
capability adoption.

**Deterministic verification over self-report.** Completion is evidenced by a
repo-owned script any participant can rerun. `scripts/verify` is the single
entry point, which keeps local execution and CI on the same check.

**One canonical owner per mutable rule.** Operating policy lives in `AGENTS.md`
files; reusable procedure lives in shared standards and workflows; task detail
lives in the Issue; this document records structure and rationale. The external
Arena execution prompt is owned solely by `/.agents/chatgpt/ARENA-DISPATCH.md`.

External GitHub administration such as branch protection/rulesets is separate
from this repository architecture and is tracked as operational work.
