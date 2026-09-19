# Adopted Capability Provenance

Single canonical third-party provenance record for material under
`.agents/skills/`. This file is the durable attribution and adaptation record
required by the adoption decision (Issue #20). Individual skill files carry at
most a one-line pointer here instead of duplicated attribution prose.

Adopted content is self-contained: nothing in this repository requires runtime
network access to the upstream repositories.

## Upstream sources at exact reviewed revisions

No newer upstream revision is adopted in this pass; adopting one requires a
fresh deliberate decision.

| Upstream repository | Reviewed commit | License |
|---|---|---|
| `mattpocock/skills` | `c55ee46073ed923f86ce59a5eb3b6d895095d1b7` | MIT (Copyright (c) 2026 Matt Pocock) |
| `cloudflare/security-audit-skill` | `c1c8a8c1471069fb0e188eeaff69b8e8db6564a8` | MIT (Copyright (c) 2025-2026 Cloudflare, Inc.) |

## What was adopted, and how

### From `mattpocock/skills` (adapted)

Each capability below was adapted, not copied verbatim. Material adaptations
shared by all of them:

- Skill-tool / plugin invocation (`Call the Skill tool with "X"`,
  `disable-model-invocation` frontmatter, router skills) replaced by
  MainTemplate's repo-native capability model: the assigned Issue or governing
  policy selects a capability by its repo-relative path; the agent reads the
  capability as a subordinate procedure.
- References to Matt's own operating infrastructure
  (`/setup-matt-pocock-skills`, `docs/agents/issue-tracker.md`, `.scratch/`
  local trackers, `ready-for-agent` triage labels, `CONTEXT.md` as an assumed
  repo file) replaced by MainTemplate equivalents: GitHub Issues, the Arena
  task contract in `.github/ISSUE_TEMPLATE/arena-task.md`, and
  `.agents/RESEARCH.md` as the single canonical research standard.
- Role/authority rules are never copied into skills; root `AGENTS.md` remains
  the sole owner of the authority model.

| Adopted capability | Upstream path(s) | Material MainTemplate adaptations |
|---|---|---|
| `.agents/skills/writing-for-agents/` | `skills/productivity/writing-for-agents/{SKILL.md,SKILL-MECHANICS.md}` | SKILL-MECHANICS rewritten from Claude-plugin invocation mechanics to MainTemplate skill mechanics (directory shape, selection, catalog, provenance). Subordinate to `/AGENTS.md`. |
| `.agents/skills/grilling/` | `skills/productivity/grilling/SKILL.md` | Explicitly a selected Human+ChatGPT capability, never universal; sub-agent dispatch made environment-neutral. |
| `.agents/skills/domain-modeling/` | `skills/engineering/domain-modeling/{SKILL.md,CONTEXT-FORMAT.md,ADR-FORMAT.md}` | Scoped to generated projects: `CONTEXT.md`/`CONTEXT-MAP.md`/ADR surfaces are created lazily there, never as empty placeholders in MainTemplate itself. ADR three-part criterion preserved. |
| `.agents/skills/codebase-design/` | `skills/engineering/codebase-design/{SKILL.md,DEEPENING.md,DESIGN-IT-TWICE.md}` | Design vocabulary/procedure only; accepted project architecture/ADRs win on conflict. Parallel sub-agents made environment-neutral. |
| `.agents/skills/tdd/` | `skills/engineering/tdd/{SKILL.md,tests.md,mocking.md}` | Seam-confirmation rule adapted: no execution interruption for seams already decided by the Issue/spec or ordinary reversible choices; escalate only for consequential architecture seams. Optional/selectable capability. |
| `.agents/skills/to-spec/` | `skills/engineering/to-spec/SKILL.md` | Publishes as a GitHub feature-spec Issue; user-story bar changed from "extremely extensive" to "every story distinguishing meaningful behavior, an important boundary, or an important edge case"; references canonical truth instead of duplicating ADRs/docs. |
| `.agents/skills/to-tickets/` | `skills/engineering/to-tickets/SKILL.md` | GitHub Issues only; each executable ticket must be a valid bounded Arena task contract; native GitHub sub-issue/blocking mechanisms; local-file tracker removed. Expand→migrate→contract wide-refactor strategy preserved. |
| `.agents/skills/wayfinder/` | `skills/engineering/wayfinder/SKILL.md` | Map and decision tickets are GitHub Issues; research tickets follow `.agents/RESEARCH.md`; labels treated as optional GitHub-native conveniences; handoff flow ends at bounded Arena Issues. Planning-side only; not a project-management authority. |
| `.agents/skills/prototype/` | `skills/engineering/prototype/{SKILL.md,LOGIC.md,UI.md}` | Retention inverted: prototypes are temporary by default; conclusions are recorded in the Issue/accepted project truth; prototype code is deleted before completion unless the task contract explicitly requires retention; no permanent `prototype/*` branches by default; no CDN dependencies. |
| `.agents/skills/improve-codebase-architecture/` | `skills/engineering/improve-codebase-architecture/{SKILL.md,HTML-REPORT.md}` | HTML-REPORT.md replaced by REPORT-FORMAT.md: portable Markdown report is the default; self-contained HTML without CDN dependencies only on request. Exploration proposes candidates; consequential architecture remains human-approved and durably recorded before Arena executes. |
| `.agents/skills/resolving-merge-conflicts/` | `skills/engineering/resolving-merge-conflicts/SKILL.md` | "Never `--abort`" replaced: abort/escalate when resolution would require inventing product intent, silently choosing between conflicting accepted architecture, making a consequential decision not authorized by the Issue, or unauthorized destructive history behavior. Routine conflicts still completed autonomously. |
| `.agents/workflows/debug.md` (replacement, not a skill) | `skills/engineering/diagnosing-bugs/{SKILL.md,scripts/hitl-loop.template.sh}` | Six-phase diagnosis procedure refactored into MainTemplate's canonical debug workflow; HITL template adopted as `.agents/workflows/hitl-loop.template.sh`. MainTemplate fallback retained: reproduce, or establish the strongest available failing evidence and record what is missing. |
| `.agents/workflows/review.md` (rebuild, not a skill) | `skills/engineering/code-review/SKILL.md` | Rebuilt as three independent review axes (spec fidelity / engineering quality / risk-evidence) with the Fowler smell baseline as overridable judgment heuristics; MainTemplate finding standard and merge-authority rules preserved. |

### From `cloudflare/security-audit-skill` (complete, unmodified)

`.agents/skills/security-audit/` contains the complete upstream
`skills/security-audit/` directory at the reviewed commit, copied verbatim and
byte-identical: `SKILL.md`; `RECONNAISSANCE.md`; `HUNTING.md`;
`ATTACK-CLASSES.md`; `VALIDATION-AND-REPORTING.md`; the ten attack-class
companions (`AI-AND-LLM.md`, `CLIENT-SIDE.md`, `CLOUD-AND-DEPLOYMENT.md`,
`DATA-ISOLATION-AND-LIFECYCLE.md`, `DESKTOP-MOBILE-AND-LOCAL-IPC.md`,
`MEMORY-SAFETY-AND-BINARY.md`, `PROTOCOLS-RPC-AND-MESSAGING.md`,
`RESOURCE-EXHAUSTION-AND-AVAILABILITY.md`, `SUPPLY-CHAIN-AND-RELEASE.md`,
`WEB-PROTOCOL-AND-AUTH.md`); `report-schema.json`;
`validate-coverage-ledger.cjs` + `validate-coverage-ledger.test.cjs`;
`validate-findings.cjs` + `validate-findings.test.cjs`.

The upstream skill is already agent-neutral, so no content changes were made.
The upstream repository-root `LICENSE` is included inside the skill directory
so the MIT notice travels with the copy. The upstream `README.md`
(installation via `skills.sh`) was intentionally not copied: MainTemplate
activates capabilities by Issue/policy selection, not by installer.

Ownership boundary: `.agents/workflows/security.md` owns when and why security
work happens; this skill owns the specialized deep-audit procedure only when
selected. Its execution-safety rules are unmodified: target-controlled
execution requires the full OS-enforced sandbox controls it lists, and where
they cannot be enforced the run stays in source/guidance mode with unresolved
candidates kept as `needs_validation`.

## Deliberately not adopted (this pass)

From `mattpocock/skills`: `ask-matt`, `setup-matt-pocock-skills`, `implement`,
`research`, `triage`, `wizard`, `grill-me`, `grill-with-docs`, `handoff`,
`teach`, `to-questionnaire`, `wait-what`, all `skills/misc/` repo-specific
skills, all `skills/misc/git-guardrails-claude-code/` Claude-specific
guardrails, and everything under `skills/in-progress/`. Reasons: redundant
with a stronger MainTemplate owner (implement, research), tied to Matt's own
operating system (ask-matt, setup, triage labels), too project-specific,
premature for a generic template, or explicitly upstream in-progress. This is
not a judgment that each is weak.

## License texts

Both upstream sources are MIT-licensed. The full permission notices are
reproduced below as required.

### MIT License — mattpocock/skills

```text
MIT License

Copyright (c) 2026 Matt Pocock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### MIT License — cloudflare/security-audit-skill

```text
MIT License

Copyright (c) 2025-2026 Cloudflare, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
