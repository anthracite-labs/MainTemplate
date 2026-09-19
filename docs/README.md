# Project Documentation

docs/ stores durable project truth and durable supporting evidence.

Create subdirectories/files only when real project content requires them. Do
not pre-populate empty documentation trees.

## Current structure

- `architecture/agent-operating-stack.md` — the current accepted operating-
  stack architecture.
- `verification/arena-boot-acceptance.md` — manual acceptance test verifying
  the Arena boot authority precedence sequence.

## Truth discipline

- One canonical representation per mutable fact.
- Derived summaries should be generated where practical, not independently edited.
- GitHub Issues/PRs/Git history record execution state/history.
- Code/tests/config are implementation evidence, not a substitute for explicit
  product/architecture decisions when those decisions matter.
- Chat/model memory is never canonical.

Use ADRs for consequential decisions whose rationale and supersession path must
survive individual tasks.
