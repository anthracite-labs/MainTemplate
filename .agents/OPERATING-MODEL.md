# Operating-model rationale

Why this repository is shaped as it is. Not policy. Policy is `/AGENTS.md`.

> Human thinks. ChatGPT guides. Arena executes. GitHub remembers.

## Three layers

```text
OUR OPERATING MODEL
    ↓ selects/routes

IMMUTABLE UPSTREAM PROCEDURES
    ↓ guide the selected work

GITHUB / REPOSITORY
    ↓ records task, evidence and result
```

Our files own actor boundaries, project truth, task authority, capability
selection, GitHub/Arena integration, and merge judgment.

Vendored files under `.agents/vendor/` own the procedures they define. They
are byte-identical to pinned upstream revisions. When integration needs
change, change ours. When upstream needs change, bump the pin.

## Why GitHub is the tracker

GitHub already stores Issues, PRs, review, and history. A second tracker,
memory service, or `state.json` would become a competing mutable copy.
`docs/agents/issue-tracker.md` exists so vendored skills that expect a
tracker configuration can find GitHub there.

## Why capabilities are selected, not always-on

Standing context is the routing layer. Selected procedures are progressive
disclosure. A catalog entry is not permission to load every skill.

## Why review is composed

Matt `code-review` owns Spec and Standards. `.agents/workflows/review.md`
adds only the Risk/evidence pass this operating model needs. Merge authority
stays Human + ChatGPT.

## Why bootstrap is separate from verify

`scripts/verify` is source-tree health. `scripts/bootstrap-repository --check`
is GitHub-settings health. One passing does not imply the other.
