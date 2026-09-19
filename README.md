# Repository operating model

A repository-native engineering harness.

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

## Start here

- `AGENTS.md` — constitution, authority, routing.
- `.agents/chatgpt/AGENTS.md` — ChatGPT with the human.
- `.agents/arena/AGENTS.md` — Arena execution.
- `.agents/CAPABILITIES.md` — adopted procedures and actors.
- `.agents/OPERATING-MODEL.md` — rationale.

## Operating loop

1. Human + ChatGPT think, research, and decide.
2. Planning depth uses a deliberately selected catalog capability.
3. Durable decisions are recorded in GitHub/repo.
4. ChatGPT creates a bounded GitHub Issue and dispatches Arena with the
   prompt in `.agents/chatgpt/ARENA-DISPATCH.md`.
5. Arena executes, verifies, and opens a PR with evidence.
6. Human + ChatGPT review the actual diff.
7. Merge updates the durable record.

## Bootstrap a generated repository

After creating a repository from this template, run once:

    scripts/bootstrap-repository --check
    scripts/bootstrap-repository

This configures advisory CODEOWNERS ownership and this repository's
`Protect main` ruleset. Run `scripts/bootstrap-repository --help` for
ownership rules and permissions.

Once `Protect main` is active, commit any local CODEOWNERS change on a
branch and open a pull request; do not push it to `main`. Then rerun
`--check`.

`scripts/verify` is source-tree health. It does not prove GitHub ruleset
state. `scripts/verify` fails on unbootstrapped source-template owner
residue until bootstrap runs.

## Design principles

- repo truth over conversational memory
- progressive disclosure over giant prompts
- deterministic verification over self-asserted completion
- selected capabilities over always-on stacks
- change our layer; never patch vendored upstream
