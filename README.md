# MainTemplate

MainTemplate is a repository-native operating template for a human owner,
ChatGPT as technical guide, Arena as execution operator, and GitHub as the
durable project record.

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

## Start here

- `AGENTS.md` — repository constitution, authority model, map, and routing.
- `.agents/chatgpt/AGENTS.md` — how ChatGPT works with the human.
- `.agents/arena/AGENTS.md` — how Arena executes assigned work.
- `.agents/skills/README.md` — governed catalog of optional adopted
  capabilities.
- `docs/architecture/agent-operating-stack.md` — current V1 architecture.

## Operating loop

1. Human + ChatGPT think, research, and decide.
2. Large/ambiguous work uses selected planning capabilities before dispatch:
   `wayfinder` → `to-spec` when substantial feature synthesis is justified →
   `to-tickets` when decomposition is needed.
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

## Design principles

- repo truth over conversational memory;
- progressive disclosure over giant prompts;
- deterministic verification over self-asserted completion;
- task-specific capability selection over always-on tool stacks;
- smallest coherent mechanism first;
- no external memory or framework owns canonical project truth;
- MainTemplate governs; specialized skills execute beneath it.

The governed optional capability surface is `.agents/skills/`. Every current
capability was deliberately adopted, has self-contained source material, and is
inactive unless selected by a GitHub Issue or governing policy. Provenance,
exact source SHAs, MIT notices, adaptations, and deliberately excluded upstream
skills are in `.agents/skills/PROVENANCE.md`.
