# Project documentation

`docs/` stores durable project truth and supporting evidence.

Create subdirectories only when real project content requires them.

`docs/agents/` is agent-configuration for vendored skills (GitHub as the
issue tracker). It is not product architecture.

## Truth discipline

- One canonical representation per mutable fact.
- GitHub Issues/PRs/Git history record execution state.
- Code/tests/config are implementation evidence, not a substitute for
  explicit product or architecture decisions.
- Chat/model memory is never canonical.
