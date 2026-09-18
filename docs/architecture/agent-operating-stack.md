# MainTemplate Agent Operating Stack — V1

Status: **current accepted V1 architecture**

This document is the durable repository record for the MainTemplate agent
operating stack. Historical build decisions and implementation history remain
in GitHub Issues, PRs, and Git history.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

- Human owns intent, strategy, product decisions, consequential architecture,
  priorities, and final judgment.
- ChatGPT guides: research, comparison, challenge, capability selection, Arena
  task compilation, and review.
- Arena executes bounded work and returns verified evidence in a pull request.
- GitHub/repository is the durable system of record.

Agents are replaceable. Repository truth is continuous.

## Authority domains

Authority is not one flat ladder.

- **Project truth** defines what is true or decided: accepted requirements,
  architecture, ADRs, and other canonical project docs.
- **Agent operating policy** defines how agents may operate: root and
  role-specific `AGENTS.md` files.
- **Task contract** defines what Arena must do now: the assigned GitHub Issue,
  within project truth and operating policy.
- **Task procedure/capability** defines how the bounded task is carried out:
  selected workflows, skills, and tools.
- **Evidence/reference** verifies or informs work: code, tests, config, research,
  runtime observations, and agent inference.

An Issue does not silently override accepted project truth or operating policy.
Consequential architecture changes require explicit human approval and durable
recording.

## Responsibility boundaries

| Surface | Responsibility |
|---|---|
| `/AGENTS.md` | Repository constitution, authority model, map, role routing |
| `/.agents/chatgpt/AGENTS.md` | ChatGPT operating contract |
| `/.agents/chatgpt/RESEARCH.md` | External research/evidence standard |
| `/.agents/chatgpt/ARENA-DISPATCH.md` | Arena Issue compiler and canonical external execution prompt |
| `/.agents/arena/AGENTS.md` | Arena standing execution policy |
| `/.agents/workflows/` | Reusable task procedures |
| `/.agents/skills/` | Specialized reusable capability, created only when adopted |
| `docs/` | Durable project truth and durable supporting evidence |
| GitHub Issue | One bounded task contract |
| PR | Implementation result and verification evidence |
| `scripts/` | Deterministic repo-owned procedures |
| `.gitattributes` | Path-aware Git content/whitespace policy used by verification |
| `.github/` | GitHub task/review/ownership/CI surfaces |
| `evals/` | Evaluation methodology/fixtures for the agent operating system |
| `tools/` | Approved external tool adapters, only when adopted |

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
   any deliberately approved skills/tools.
6. Arena executes, verifies, inspects the final diff, and returns PR evidence.
7. Human + ChatGPT review the actual diff and evidence before merge.

The Issue owns task detail. The Arena role contract does not duplicate boot
navigation.

## Progressive disclosure

Agents load only what the task requires.

- Root instructions route rather than duplicate deeper procedures.
- Task-specific references live in the Issue.
- Workflows load only when selected.
- Skills/tools are not active merely because they exist.
- The repository should not be read wholesale by default.

## Verification

`scripts/verify` is the stable repository verification entry point.

`scripts/repo-check` enforces repository operating invariants. GitHub Actions
runs `scripts/verify` on pull requests and pushes to `main`.

Prefer deterministic verification over agent self-report wherever practical.

## State and recovery

V1 deliberately has no canonical `state.json` or `CURRENT.md`.

Operational state is recovered from:

- Issues;
- PRs;
- branches;
- Git history;
- accepted docs/ADRs;
- current implementation evidence.

Chat/model memory, sandboxes, external indexes, vector stores, and proprietary
memory services are not canonical project state.

Add dedicated state machinery only if measured use demonstrates a recovery
failure Git/GitHub cannot solve cleanly.

## Capability policy

Start with the smallest coherent mechanism.

A workflow, skill, or tool is active only when the task selects it or repository
policy makes it universally required.

Do not add frameworks, dependencies, memory systems, review systems, security
tools, or external services merely because they exist. New capabilities require
a concrete demonstrated gap, deliberate human + ChatGPT selection, and a
removal path.

## V1 completion state

The initial repository operating foundation is complete:

- root constitution and routing;
- ChatGPT operating/research/dispatch contracts;
- Arena operating contract;
- core workflows;
- GitHub Issue/PR/CODEOWNERS/CI surfaces;
- deterministic verification;
- docs namespace;
- eval methodology.

Future skills/tools are **demand-driven extensions**, not an unfinished V1
phase or completion gate.

External GitHub administration such as branch protection/rulesets is separate
from this repository architecture and should be tracked as operational work.
