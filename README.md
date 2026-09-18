# MainTemplate

MainTemplate is a repository-native operating template for a human owner,
ChatGPT as technical guide, Arena as execution operator, and GitHub as the
durable project record.

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

## Start here

- AGENTS.md — repository constitution, authority model, map, and routing.
- .agents/chatgpt/AGENTS.md — how ChatGPT works with the human.
- .agents/arena/AGENTS.md — how Arena executes assigned work.
- Issue #1 — V1 build guide and architecture record.

## Operating loop

1. Human + ChatGPT think, research, and decide.
2. Durable decisions are encoded in GitHub/repo.
3. ChatGPT creates a bounded GitHub Issue for Arena.
4. The external Arena prompt directs Arena to read /AGENTS.md, then
   /.agents/arena/AGENTS.md, then the assigned Issue.
5. The Issue selects only the task-specific references/workflow/skills/tools
   required for that task.
6. Arena executes, runs verification, and opens/updates a PR with evidence.
7. Human + ChatGPT review the actual diff and evidence.
8. Merge updates the durable project record.

External ChatGPT project instructions should only point to repo-owned ChatGPT
instructions. External Arena prompts should stay short and own only the boot
sequence: root policy, Arena policy, then the assigned Issue.

## Design principles

- repo truth over conversational memory;
- progressive disclosure over giant prompts;
- deterministic verification over self-asserted completion;
- task-specific capability selection over always-on tool stacks;
- smallest coherent mechanism first;
- no external memory or framework owns canonical project truth.

Specialized skills and external tools are not bundled by default. They are added
only when the human + ChatGPT decide a demonstrated task need justifies them.
