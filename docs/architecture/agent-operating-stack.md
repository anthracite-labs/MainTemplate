# Agent Operating Stack

Status: **current accepted architecture**

This document is the durable repository record of this repository's agent
operating stack. Root `AGENTS.md` owns the normative policy and conflict
rules; this document records the accepted structural shape and rationale.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

Four participants, each with a distinct structural role: the human owns intent
and judgment, ChatGPT guides and compiles work, Arena executes bounded tasks,
and GitHub/repository is the durable system of record. Agents are replaceable;
repository truth is continuous.

## Authority domains

Authority is not one flat ladder. It is divided into distinct domains, each
answering a different question.

| Domain | Question it answers | Held by |
|---|---|---|
| Project truth | What is true or decided? | Accepted requirements, architecture, ADRs, canonical project docs |
| Agent operating policy | How may agents operate? | Root and role-specific `AGENTS.md` files |
| Task contract | What must Arena do now? | The assigned GitHub Issue |
| Task procedure/capability | How is the bounded task carried out? | Selected workflows and adopted skills |
| Evidence/reference | What verifies or informs the work? | Code, tests, config, research, runtime observation |

The domains constrain each other rather than forming a single ranking. The
Issue defines the current task within project truth and operating policy;
workflows and capabilities are subordinate procedures; evidence informs and
verifies work but does not silently override governing truth or policy.
Conflicts within a single domain are surfaced rather than guessed through.

## Responsibility boundaries

| Surface | Responsibility |
|---|---|
| `/AGENTS.md` | Repository constitution, authority model, map, role routing, capability rule |
| `/.agents/RESEARCH.md` | Shared, single canonical research/evidence standard used by both roles |
| `/.agents/chatgpt/AGENTS.md` | ChatGPT operating contract and planning-capability routing |
| `/.agents/chatgpt/ARENA-DISPATCH.md` | Arena Issue compiler and canonical external execution prompt |
| `/.agents/arena/AGENTS.md` | Arena standing execution policy |
| `/.agents/workflows/` | Reusable task procedures; `debug.md` is the sole debugging owner, `review.md` the sole review owner, `security.md` owns security routing |
| `/.agents/skills/README.md` | Canonical catalog, activation mechanics, and planning/execution routing for adopted capabilities |
| `/.agents/skills/PROVENANCE.md` | Exact upstream sources, licenses, adopted material, adaptations, deliberately excluded upstream capabilities |
| `/.agents/skills/security-audit/` | Cloudflare specialized deep-audit procedure when the security workflow/Issue selects it |
| `docs/` | Durable project truth and durable supporting evidence |
| GitHub Issue | One bounded task contract; map/spec/decision/ticket state where selected planning capability requires it |
| PR | Implementation result, verification evidence, separated review evidence |
| `scripts/` | Deterministic repo-owned procedures |
| `.gitattributes` | Path-aware Git content/whitespace policy used by verification |
| `.github/` | GitHub task/review/ownership/CI surfaces |

## Capability architecture

Root policy governs. Specialized skills execute beneath it. The catalog
(`/.agents/skills/README.md`) is the single list of adopted capabilities; it
contains no authority rules and activates nothing by itself. Activation
follows the three paths owned by root `/AGENTS.md` ("Capability rule"):
planning capabilities are deliberately selected by Human + ChatGPT before an
Arena Issue exists; execution capabilities are selected by the assigned Issue
by exact repo-relative path with the reason stated; universally required
procedures come from governing policy. The agent then reads the selected
capability as a subordinate procedure. No proprietary invocation adapter,
installer, second router, or runtime upstream dependency is required.

The catalog's role routing is intentionally not an authority ladder. For the
current adopted capability names, purposes, and planning/execution routing,
consult `/.agents/skills/README.md`; do not duplicate that mutable inventory in
standing policy or architecture documents.

Capabilities are a deliberate, finite surface: every capability directory
contains real content, and `scripts/repo-check` validates the exact current
surface. No placeholder/future capability directories exist. Adding or
removing one is a deliberate human + ChatGPT decision with catalog, provenance,
and deterministic-check updates in the same change.

### One owner per procedure

- Debugging is owned only by `/.agents/workflows/debug.md`, the six-phase tight
  feedback-loop procedure (feedback loop; reproduce/minimise; hypotheses;
  instrumentation; fix/regression; cleanup). There is no debugging skill.
- Review is owned only by `/.agents/workflows/review.md`, which keeps Spec/task
  fidelity, Engineering quality, and Risk/evidence independent. There is no
  duplicate review skill.
- Research is owned only by `/.agents/RESEARCH.md`; the research workflow adds
  task execution context but no second standard.
- Security routing (when/why security work is required) is owned by
  `/.agents/workflows/security.md`. Cloudflare `security-audit` owns its deep
  specialized procedure only when selected; the workflow does not duplicate it.
- `implement.md` remains the top-level bounded execution workflow; selected
  execution skills can be subordinate to it.

### Planning before execution

Conventional bounded work goes directly to an Arena Issue. For larger work,
Human + ChatGPT deliberately select planning capabilities from the catalog
(`/.agents/skills/README.md`) only when their additional structure is earned:

```text
large ambiguous route
  → wayfinder (durable GitHub map + decision frontier)
  → to-spec (durable feature spec when synthesis is justified)
  → to-tickets (bounded vertical slices when decomposition is needed)
  → bounded Arena Issues
  → execution + PR evidence
```

Wayfinder represents unresolved consequential questions as decision tickets and
stops when the route is clear. `to-tickets` produces tracer-bullet vertical
slices and records real blocking edges. GitHub remains the only durable
tracker; there is no secondary local issue tracker. Prototypes answer a
specific design question and are temporary by default; their conclusion, not
their code, becomes durable truth unless a task explicitly retains the
artifact. Architecture survey work proposes candidates only; human-approved
durable architecture precedes Arena execution.

## Dispatch and execution

The exact external Arena execution prompt is owned by
`/.agents/chatgpt/ARENA-DISPATCH.md` and should not be copied into other
standing policy files.

Conceptually:

1. ChatGPT and the human establish the bounded task and any consequential
   decisions.
2. Durable decisions needed for execution are recorded in GitHub/repository.
3. For work not yet bounded/decided, ChatGPT selects a planning capability;
   unresolved consequential decisions are never sent to Arena.
4. ChatGPT creates the detailed Arena Issue.
5. The external Arena prompt loads standing operating policy before the assigned
   Issue.
6. The Issue selects task-specific references, a workflow when applicable, and
   only deliberately approved capabilities.
7. Arena executes, verifies, inspects the final diff, and returns PR evidence.
8. Human + ChatGPT review the actual diff and evidence before merge.

The Issue owns task detail. The Arena role contract does not duplicate boot
navigation. The manual acceptance test in
`docs/verification/arena-boot-acceptance.md` establishes whether a fresh Arena
execution honors this authority sequence when given conflicting instructions.

## Progressive disclosure

The instruction set is structured as a routing tree rather than a single prompt:
root constitution routes to role policy, role policy routes to the task contract,
and the task contract names the references/procedures that apply. The capability
catalog is an index, not an always-loaded bundle; selected skills disclose their
support files only as their procedures reach them. Normative loading rules are
owned by root and role `AGENTS.md`.

## Verification

`scripts/verify` is the single stable repository verification entry point. It
delegates repository operating invariants to `scripts/repo-check`, runs the
vendored Cloudflare validator tests when Node is available, then runs content
checks over the current committed `HEAD` tree and over the submit-ready
worktree/index state when that differs from `HEAD`. GitHub Actions runs
`scripts/verify` on pull requests and pushes to `main`.

A full selected Cloudflare audit has additional deterministic validators in its
own capability (`validate-findings.cjs`, `validate-coverage-ledger.cjs`) and
requires its execution-safety controls. If the environment cannot actually
enforce the required sandbox isolation, its run remains source/guidance mode;
claims stay `needs_validation` with an exact safe validation plan.

## Accepted architectural decisions

**No canonical state store.** This repository has no `state.json` or
`CURRENT.md`. Operational state is reconstructed from Issues, PRs, branches,
Git history, accepted docs/ADRs, and current implementation evidence, because
GitHub already stores that state durably and a second store would become a
competing mutable copy. `scripts/repo-check` enforces the absence of both
files.

**Selective governed capability surface.** The capability surface under
`/.agents/skills/` is finite and deliberate: every capability directory
contains real adopted content with exact upstream provenance and MIT notices,
and `scripts/repo-check` validates the exact current surface. This operating
model retains ownership of roles, authority conflicts, project truth, durable
GitHub state, boot sequence, bounded Issue contract, capability selection,
escalation, verification, and final human + ChatGPT judgment; adopted skills
execute beneath it. The catalog and provenance record are the canonical
current surface; imports are self-contained, not runtime dependencies.

**Deterministic verification over self-report.** Completion is evidenced by a
repo-owned script any participant can rerun. `scripts/verify` is the single
entry point, which keeps local execution and CI on the same check.

**Advisory ownership and review routing.** `.github/CODEOWNERS` identifies
ownership and routes pull request reviews for sensitive operating surfaces.
The accepted repository ruleset deliberately requires zero approving reviews
and leaves code-owner review disabled (`require_code_owner_review: false`),
preserving the operating model where Human + ChatGPT review before merge.
CODEOWNERS provides advisory review routing rather than mandatory merge-blocking
approval; any change to merge authority is consequential architecture requiring
explicit human approval.

**One canonical owner per mutable rule.** Operating policy lives in `AGENTS.md`
files; reusable procedure lives in shared standards and workflows; task detail
lives in the Issue; this document records structure and rationale. The external
Arena execution prompt is owned solely by `/.agents/chatgpt/ARENA-DISPATCH.md`.

GitHub-side configuration such as branch protection/rulesets is
repository-specific, not repository architecture:
`scripts/bootstrap-repository` establishes and verifies it deliberately in a
repository created from this template.
