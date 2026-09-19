# Skill Mechanics

The skill-specific branch of [writing-for-agents](SKILL.md): what changes when
the document is a capability under `.agents/skills/`. Everything else about
writing it is the universal reference in `SKILL.md`.

This replaces the upstream plugin mechanics (frontmatter, model-invocation
flags, router skills) with this repository's native capability model. See
[../PROVENANCE.md](../PROVENANCE.md).

## Directory shape

One capability per directory; the entry file is always `SKILL.md`; support
files are disclosed references beside it, loaded only when the procedure
reaches them:

```
.agents/skills/<capability>/
├── SKILL.md          ← entry: purpose line, procedure, in-file reference
├── <SUPPORT>.md      ← disclosed reference (e.g. DEEPENING.md, tests.md)
└── <script/template> ← only when the procedure genuinely runs it
```

Every directory contains an actually adopted capability. Empty placeholder
directories are prohibited; `scripts/repo-check` rejects them. A skill with one
live file keeps one file: split only when the cut earns it.

`SKILL.md` opens with a short identity block: title, a one-line purpose stating
what the capability is and when it is selected, and a provenance pointer when
the material is adopted. Capabilities written for this repository carry no
YAML frontmatter and no invocation flags: activation is not encoded in the
file, it is encoded in the selection. (Adopted upstream capabilities are kept
verbatim per [../PROVENANCE.md](../PROVENANCE.md) and may retain their
upstream packaging.)

## Invocation

Root `/AGENTS.md` ("Capability rule") owns activation; it has exactly three
paths, and a capability's existence alone never activates it:

- **Planning selection**: before any Arena Issue exists, Human + ChatGPT may
  deliberately select a planning/guidance capability from the catalog —
  minimum capability needed, exact capability path, subordinate to root and
  ChatGPT policy, able to produce durable decisions, specs, maps, or Arena
  Issues.
- **Issue-selected**: the assigned GitHub Issue names the capability by
  repo-relative path under its "Selected skills / tools" section. The Issue
  line is the capability's context pointer — the pointer-writing rules in
  `SKILL.md` apply to it in full. A path alone is a weak pointer; the Issue
  says in a clause why this capability, for this task.
- **Policy-required**: governing policy makes a procedure universally
  required. None currently are; `scripts/verify` is the only universally
  required procedure and it is a script, not a skill.

There is no model-invoked/user-invoked distinction and no description-based
autonomous firing. An agent never self-selects a capability that the Issue did
not select; "a capability existing in the repository does not make it active"
(`/.agents/arena/AGENTS.md`). The cost trade from the two loads still holds:
the catalog row in [../README.md](../README.md) is the always-available index
(context load for whoever reads the catalog), and the human + ChatGPT remain
the index for when selection matters (cognitive load, spent deliberately).

## Splitting by invocation

The invocation cut of splitting (the sequence cut lives in `SKILL.md`): give a
body of material its own capability directory when it needs independent reach —
several other capabilities reference it (as `codebase-design` is referenced by
`tdd` and `improve-codebase-architecture`), or Issues select it on its own. A
capability reached from others is referenced by explicit repo-relative path and
read directly; cross-capability references never assume a dispatcher.

Shared reference two capabilities both need lives in exactly one owner: either
one of them (referenced by the other) or a canonical non-skill surface when the
material is repository-wide policy or standard (`/AGENTS.md`,
`.agents/RESEARCH.md`, a workflow). Never copy the same meaning into both.

## The catalog is the only router

[../README.md](../README.md) is the single canonical catalog: one row per
capability, one purpose line, role routing (Human+ChatGPT planning vs Arena
execution). Do not create a second router, installer, or index — not in root
`AGENTS.md` (which points at the catalog, never restates it), not per-role.
When a capability is added or removed, the same change updates the catalog,
[../PROVENANCE.md](../PROVENANCE.md), and the `scripts/repo-check` required
surface.

## Subordination

A skill is a task procedure/capability in the authority-domain model: it never
restates or overrides root policy, role policy, accepted project truth, or the
assigned Issue, and it never carries its own authority or escalation rules —
those are owned by `/AGENTS.md` and the role contracts. A skill that needs a
boundary states the boundary as a pointer ("escalation is owned by
`/.agents/arena/AGENTS.md`"), not as copied policy.
