# Capabilities

Catalog and routing for adopted procedures. Root `/AGENTS.md` owns
activation and authority. This file does not reproduce procedures.

## Integration contract

Vendored upstream content is authoritative for its procedure and is never
edited locally. `/AGENTS.md` and role policy determine who may perform work
and what authority the procedure has. GitHub is this repository's durable
task/state system. If an upstream procedure assumes an unavailable
environment or conflicts with governing role/safety policy, adjust the
MainTemplate integration or surface the incompatibility; never patch the
vendor file.

Companion invocations such as "Call the Skill tool with …" mean: read that
companion at its exact vendored `SKILL.md` path when the catalog includes it.
The installer `/setup-matt-pocock-skills` is not used; tracker configuration
is `docs/agents/issue-tracker.md`.

## Catalog

| Capability | Path | Select when | Actor |
|---|---|---|---|
| writing-for-agents | `.agents/vendor/mattpocock/skills/productivity/writing-for-agents/SKILL.md` | Editing agent-facing docs we own | ChatGPT |
| grilling | `.agents/vendor/mattpocock/skills/productivity/grilling/SKILL.md` | Stress-testing a consequential plan or decision | ChatGPT |
| domain-modeling | `.agents/vendor/mattpocock/skills/engineering/domain-modeling/SKILL.md` | Sharpening shared vocabulary or recording an ADR | ChatGPT |
| codebase-design | `.agents/vendor/mattpocock/skills/engineering/codebase-design/SKILL.md` | Designing a module interface or seam | ChatGPT or Arena |
| tdd | `.agents/vendor/mattpocock/skills/engineering/tdd/SKILL.md` | Behavior should be built test-first | Arena |
| to-spec | `.agents/vendor/mattpocock/skills/engineering/to-spec/SKILL.md` | Synthesizing a feature spec onto GitHub | ChatGPT |
| to-tickets | `.agents/vendor/mattpocock/skills/engineering/to-tickets/SKILL.md` | Decomposing a spec into tracer-bullet tickets | ChatGPT |
| wayfinder | `.agents/vendor/mattpocock/skills/engineering/wayfinder/SKILL.md` | Charting large ambiguous work as a decision map | ChatGPT |
| prototype | `.agents/vendor/mattpocock/skills/engineering/prototype/SKILL.md` | Answering a design question with throwaway code | ChatGPT or Arena |
| improve-codebase-architecture | `.agents/vendor/mattpocock/skills/engineering/improve-codebase-architecture/SKILL.md` | Surveying deepening candidates; no silent refactor | ChatGPT |
| resolving-merge-conflicts | `.agents/vendor/mattpocock/skills/engineering/resolving-merge-conflicts/SKILL.md` | An in-progress merge/rebase has conflicts | Arena |
| diagnosing-bugs | `.agents/vendor/mattpocock/skills/engineering/diagnosing-bugs/SKILL.md` | Finding and fixing an observed failure | Arena |
| code-review | `.agents/vendor/mattpocock/skills/engineering/code-review/SKILL.md` | Independent review of a proposed change | ChatGPT |
| security-audit | `.agents/vendor/cloudflare/skills/security-audit/SKILL.md` | Full audit, pen test, or requested audit artifacts | Arena |

Read `SKILL.md` first. Load support files only when that procedure reaches
them.

## Local procedures

These are MainTemplate-owned. They are not forks of vendored skills.

| Procedure | Path | Use |
|---|---|---|
| Research standard | `.agents/RESEARCH.md` | External research and evidence labels |
| Independent review supplement | `.agents/workflows/review.md` | Risk/evidence pass after vendored code-review |
| Security routing | `.agents/workflows/security.md` | When/why security work is required |
| Recovery | `.agents/workflows/recover.md` | Reconstruct task state from GitHub |

## Compatibility

- **Tracker.** GitHub Issues. Labels and Wayfinding operations:
  `docs/agents/issue-tracker.md`. Triage vocabulary:
  `docs/agents/triage-labels.md`.
- **Wayfinder research tickets.** Matt's `research` skill is not adopted.
  Resolve those tickets with `.agents/RESEARCH.md`. If Notes carry execution
  into the map, compile bounded Arena Issues rather than executing in the
  planning session, except the documented ChatGPT direct-execution exception.
- **to-spec / to-tickets.** `ready-for-agent` marks tracker readiness.
  Arena still executes only a compiled Issue from
  `.agents/chatgpt/ARENA-DISPATCH.md`.
- **TDD.** The Issue must already name the seams under test.
- **diagnosing-bugs HITL.** Template:
  `.agents/vendor/mattpocock/skills/engineering/diagnosing-bugs/scripts/hitl-loop.template.sh`.
- **resolving-merge-conflicts.** Upstream says never `--abort`. If resolution
  would invent product intent or choose between conflicting accepted
  architecture, stop with the conflict in place and escalate.
- **writing-for-agents.** Editing standard for MainTemplate-authored files
  only. Do not edit the vendored copy while applying it.
- **improve-codebase-architecture.** Proposes candidates. Human-approved
  durable architecture precedes Arena execution.
- **security-audit.** Selected through `.agents/workflows/security.md`.
  Execution-safety rules stay in the vendored skill.
