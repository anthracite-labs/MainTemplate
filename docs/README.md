# Project Documentation

docs/ stores durable project truth and durable supporting evidence.

Create subdirectories/files only when real project content requires them. Do
not pre-populate empty documentation trees.

Typical namespaces:

- product/ — accepted product intent, requirements, behavior.
- architecture/ — current accepted architecture.
- adr/ — consequential architecture/operating decisions; supersede explicitly.
- engineering/ — durable project engineering standards.
- research/ — research future decisions/work need to recover.
- plans/ — execution intent; plans are not proof of completion.
- runbooks/ — operational procedures for the project/system.

## Truth discipline

- One canonical representation per mutable fact.
- Derived summaries should be generated where practical, not independently edited.
- GitHub Issues/PRs/Git history record execution state/history.
- Code/tests/config are implementation evidence, not a substitute for explicit
  product/architecture decisions when those decisions matter.
- Chat/model memory is never canonical.

Use ADRs for consequential decisions whose rationale and supersession path must
survive individual tasks.
