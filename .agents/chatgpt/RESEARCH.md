# Research Standard

This file is the canonical owner of the reusable research procedure and
evidence rules for this repository. ChatGPT applies it directly;
`.agents/workflows/research.md` references it for assigned research tasks.

Use it whenever external research, freshness verification, ecosystem comparison, or evidence-backed recommendation materially affects the answer or an Arena task.

For purely repo-internal facts, start from canonical repository sources instead.

## Evidence hierarchy

Use the strongest available source appropriate to the claim.

1. **Canonical repository truth** — for project-specific facts and decisions.
2. **Authoritative external source** — official specification, standards body, official documentation, official project site.
3. **Canonical upstream engineering source** — source repository, release, changelog, source code, maintainer documentation.
4. **Primary engineering evidence** — maintainer issues/PRs/discussions, reproducible benchmark artifacts, architecture docs.
5. **Independent technical evidence** — serious third-party benchmarks, engineering analyses, comparative testing.
6. **Community evidence** — recurring operational experience from Hacker News, Reddit, forums, blogs.
7. **Popularity/discovery signals** — stars, forks, GitHub Topics, Trending, Collections, social attention.

Lower tiers may reveal failure modes or candidates. They do not outrank stronger primary evidence.

## Evidence labels

Keep these concepts separate:

- **VERIFIED FACT** — directly supported by current canonical evidence or reproducible observation.
- **UPSTREAM CLAIM** — stated by the project/vendor but not independently established.
- **INFERENCE** — conclusion derived from evidence.
- **JUDGMENT** — architectural or product evaluation.
- **UNVERIFIED** — insufficiently supported; do not use as a decision premise.

Do not launder an upstream claim into a verified fact.

## Freshness

For facts that can change:

- verify them in the current research pass;
- record the relevant date when it matters;
- prefer releases/changelogs/source over stale summaries;
- do not reuse an old numeric claim merely because it appeared in prior research.

Examples: current versions, licenses, maintenance status, supported integrations, pricing, GitHub settings, benchmarks, API behavior.

## Research procedure

1. Define the exact question or decision.
2. Check canonical project truth first so external research is scoped correctly.
3. Search authoritative upstream sources.
4. Inspect primary engineering artifacts for serious candidates.
5. Seek independent evidence for consequential performance/security/reliability claims.
6. Use community sources to discover recurring operational failures or alternatives.
7. Search for counter-evidence: serious issues, maintenance decline, license constraints, security incidents, incompatibilities, overhead, simpler substitutes.
8. Separate facts from judgment.
9. State unresolved uncertainty instead of filling gaps.
10. Record durable research in `docs/` only when future work needs it.

## Open-source discovery

When surveying an ecosystem, use discovery sources systematically where relevant:

- canonical project and specification repositories;
- GitHub Topics;
- GitHub Trending, with exact inspection date;
- GitHub Collections;
- same-owner/companion repositories;
- dependencies/integrations;
- active forks or successors;
- projects named as alternatives.

Popularity is discovery only.

## Quantitative claims

For every important number ask:

- What is the source?
- What date/population/workload does it describe?
- Was it measured or estimated?
- Is it transferable to our use case?

If the exact number is not supported, remove it or label it unverified.

Do not manufacture precise architecture scores from subjective judgments.

## Recommendation standard

Before recommending a new component, establish:

- concrete gap it solves;
- why simpler repo-native/deterministic mechanisms are insufficient;
- canonical upstream and license;
- maintenance/activity state;
- integration class;
- dependencies/network/secrets;
- supply-chain surface;
- failure behavior;
- removal path;
- what measurable condition would justify adoption.

Default: no dependency until value is demonstrated.

## Research output

For consequential research, make the answer easy to audit:

- conclusion or options;
- strongest supporting evidence;
- strongest counter-evidence;
- confidence/unknowns;
- decision impact;
- exact sources or repo references.

Do not bury the human decision under research volume.
