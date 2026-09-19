# Provenance

Which upstream repositories are adopted, why, and how they are pinned.
Machine inventory: `.agents/vendor/UPSTREAM.lock`.

Vendored files are unmodified copies of the pinned revisions. This file does
not describe rewritten upstream behavior.

## Adopted sources

| Repository | Pinned commit | License | Vendor root |
|---|---|---|---|
| `mattpocock/skills` | `c55ee46073ed923f86ce59a5eb3b6d895095d1b7` | MIT — `.agents/vendor/mattpocock/LICENSE` | `.agents/vendor/mattpocock/` |
| `cloudflare/security-audit-skill` | `c1c8a8c1471069fb0e188eeaff69b8e8db6564a8` | MIT — `.agents/vendor/cloudflare/LICENSE` | `.agents/vendor/cloudflare/` |

Do not float to `main`. Do not edit files under a vendor root.

## Why each capability is selected

| Capability | Why |
|---|---|
| writing-for-agents | Editing standard for our agent-facing documents |
| grilling | Structured interrogation of consequential decisions |
| domain-modeling | Shared vocabulary and sparing ADRs |
| codebase-design | Deep-module design vocabulary |
| tdd | Test-first behavior at public seams |
| to-spec | Feature-spec synthesis onto the tracker |
| to-tickets | Tracer-bullet decomposition with blocking edges |
| wayfinder | Decision-map planning for large ambiguous work |
| prototype | Cheap artifacts that answer a design question |
| improve-codebase-architecture | Deepening candidates without silent refactor |
| resolving-merge-conflicts | Intent-based conflict resolution |
| diagnosing-bugs | Tight-loop diagnosis of observed failures |
| code-review | Independent Spec and Standards review |
| security-audit | Coverage-led deep security audit |

Routing, actors, and integration notes: `.agents/CAPABILITIES.md`.

## Deliberate exclusions

From `mattpocock/skills`: `ask-matt`, `setup-matt-pocock-skills`, `implement`,
`research`, `triage`, `wizard`, `grill-me`, `grill-with-docs`, `handoff`,
`teach`, `to-questionnaire`, `wait-what`, all `skills/misc/`, all
`skills/in-progress/`, and repository-root docs/plugin packaging.

Reasons: redundant with a stronger owner here (`implement`, `research`),
tied to Matt's installer/triage operating system, too project-specific, or
explicitly in-progress. This is not a judgment that each is weak.

From `cloudflare/security-audit-skill`: the repository-root `README.md`
(installer instructions). The skill directory and root `LICENSE` are
vendored.

## License attribution

Both sources are MIT. Exact license texts are the vendored `LICENSE` files
named above. Do not duplicate those texts here.

## Update policy

1. Human + ChatGPT review the candidate upstream revision.
2. Replace the vendored bytes from that revision.
3. Regenerate `.agents/vendor/UPSTREAM.lock`.
4. Update this file's pin table.
5. Adjust `.agents/CAPABILITIES.md` only if selection or integration changed.
6. Prove byte identity with `scripts/repo-check` before merge.

Never mix a local patch into a vendor file.
