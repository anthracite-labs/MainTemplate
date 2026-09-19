# Repository Operating Model

A repository-native operating template for a human owner, ChatGPT as technical
guide, Arena as execution operator, and GitHub as the durable project record.

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

## Start here

- `AGENTS.md` — repository constitution, authority model, map, and routing.
- `.agents/chatgpt/AGENTS.md` — how ChatGPT works with the human.
- `.agents/arena/AGENTS.md` — how Arena executes assigned work.
- `.agents/skills/README.md` — the sole detailed catalog of adopted
  capabilities: names, purposes, role routing, and activation.
- `docs/architecture/agent-operating-stack.md` — the current accepted
  operating-stack architecture.

## Operating loop

1. Human + ChatGPT think, research, and decide.
2. Work needing planning depth uses deliberately selected planning
   capabilities before any Arena Issue exists: consult
   `.agents/skills/README.md` and select the minimum capability whose
   documented trigger matches.
3. Durable decisions are encoded in GitHub/repo.
4. ChatGPT creates a bounded GitHub Issue for Arena.
5. ChatGPT dispatches Arena with the canonical prompt in
   `.agents/chatgpt/ARENA-DISPATCH.md`.
6. The Issue selects only the task-specific references/workflow/capabilities
   required for that task.
7. Arena executes, runs verification, and opens/updates a PR with evidence.
8. Human + ChatGPT review the actual diff and evidence across Spec/task
   fidelity, Engineering quality, and Risk/evidence.
9. Merge updates the durable project record.

External ChatGPT project instructions should only point to repo-owned ChatGPT
instructions. External Arena prompts should stay short and use the canonical
prompt defined in `.agents/chatgpt/ARENA-DISPATCH.md`.

## Capability activation

Root `AGENTS.md` owns the activation rule; exactly three paths activate a
capability, and existence alone never does:

- **Planning selection** — before any Arena Issue exists, Human + ChatGPT
  deliberately select a planning/guidance capability from the catalog.
- **Execution selection** — the assigned Issue names the exact repo-relative
  capability path and why it applies.
- **Policy-required procedure** — governing policy makes a procedure
  universally required (`scripts/verify` is the current example; it is a
  script, not a skill).

## Bootstrap a generated repository

After creating a repository from this template, run once, deliberately:

    scripts/bootstrap-repository --check    # inspect; changes nothing
    scripts/bootstrap-repository            # apply

It manages exactly two things. First, the owner token on the six managed rules
in `.github/CODEOWNERS`: the default owner is the repository owner when GitHub
reports it as a user; organization-owned repositories must pass an explicit
`--owner USER` or `--owner ORG/TEAM` (a bare organization name cannot own
code). Every requested owner is validated against GitHub before anything
changes; unverifiable owners are refused, never guessed. Custom rules and
comments are preserved. Second, this repository's own `Protect main` ruleset:
deletion and non-fast-forward blocked, a pull request required with
review-thread resolution, the `verify` status check required, and
merge/squash/rebase allowed, with no bypass actors. An existing
repository-owned ruleset of that name is converged, never duplicated;
inherited organization/enterprise rulesets are outside its authority and are
reported if they also govern `main`. Ruleset writes require repository
administration: the script probes that read-only before any mutation and
fails without changing anything when it is missing; `--check` is read-only.
There is no bootstrap state file — the managed rules in CODEOWNERS plus
explicit arguments are the durable inputs, and `--check` reads actual GitHub
state. `scripts/verify` fails on unbootstrapped source-template owner
residue; that is deliberate.

## Design principles

- repo truth over conversational memory;
- progressive disclosure over giant prompts;
- deterministic verification over self-asserted completion;
- task-specific capability selection over always-on tool stacks;
- smallest coherent mechanism first;
- no external memory or framework owns canonical project truth;
- root policy governs; specialized skills execute beneath it.

The governed optional capability surface is `.agents/skills/`. Provenance,
exact source SHAs, MIT notices, adaptations, and deliberately excluded
upstream skills are recorded in `.agents/skills/PROVENANCE.md`.
