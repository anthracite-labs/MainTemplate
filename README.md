# MainTemplate

MainTemplate is a repository-native agent operating template: a minimal,
durable stack for running a project with a human owner, a guiding AI
(ChatGPT), and an executing AI (Arena), with the GitHub repository itself as
the permanent system of record.

## Operating model

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

- The **Human** owns intent, strategy, product decisions, and final judgment.
- **ChatGPT** researches, challenges assumptions, and compiles bounded
  execution Issues.
- **Arena** executes those Issues and returns verified evidence in pull
  requests.
- **GitHub** (this repository) is where project truth lives: files, Issues,
  PRs, branches, history, and accepted docs.

## Where to read next

- [`AGENTS.md`](AGENTS.md) — the repository operating map: source-of-truth
  rule, authority precedence, role routing, progressive disclosure,
  verification, and escalation. Start there for any operating question.
- [Issue #1](https://github.com/anthracite-labs/MainTemplate/issues/1) — the
  locked V1 build guide that the initial operating stack is being constructed
  from.

## Build status

The operating stack is being built incrementally through bounded Issues/PRs,
one phase at a time, tracked against Issue #1. Deeper role instructions
(`.agents/`), workflows, skills, docs namespaces, deterministic scripts, and
evals arrive as their phases land; `AGENTS.md` distinguishes what exists today
from what is planned.

Speculative dependencies, frameworks, and placeholder layers are intentionally
absent — capabilities are added only when a demonstrated need justifies them.
