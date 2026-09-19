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

Root `AGENTS.md` ("Capability rule") owns general capability activation;
`.agents/skills/README.md` is the detailed catalog and role-routing surface.
A capability is active only through deliberate planning selection by Human +
ChatGPT, task selection in an assigned Arena Issue, or governing repository
policy. Existence alone never activates a capability.

## Bootstrap a generated repository

After creating a repository from this template, run once, deliberately:

    scripts/bootstrap-repository --check    # inspect; changes nothing
    scripts/bootstrap-repository            # apply

This configures:
- the owner token on the managed rules in `.github/CODEOWNERS` (advisory
  ownership and review routing);
- this repository's own `Protect main` ruleset (enforces pull requests,
  review-thread resolution, and the `verify` status check).

Run `scripts/bootstrap-repository --help` for ownership requirements,
permissions, and command options. `scripts/verify` fails on unbootstrapped
source-template owner residue until this runs.

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
