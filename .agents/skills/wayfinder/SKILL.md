# Wayfinder

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Chart a huge chunk of work — more than one agent session can hold, wrapped in
fog — as a shared map of **decision tickets** on GitHub, and resolve them one
at a time until the way to the destination is clear.

A Human + ChatGPT planning capability for large, ambiguous work where the route
is not yet sufficiently decided. It is not a project-management authority and
not an ordinary Arena implementation procedure: GitHub remains the durable
system of record, and unresolved consequential product/architecture decisions
are never sent directly to Arena. When the route is clear, the preferred flow
is: wayfinder → [../to-spec/](../to-spec/SKILL.md) (when a substantial feature
spec is justified) → [../to-tickets/](../to-tickets/SKILL.md) (when
decomposition is required) → bounded Arena Issues → execution.

The destination varies per effort, and naming it is the first act of charting:
it shapes every ticket. It might be a spec to hand off, a decision to lock
before planning starts, or a change made in place like a data-structure
migration.

## Plan, don't do

Wayfinder is **planning** by default: each ticket resolves a decision, and the
map is done when the way is clear, with nothing left to decide before someone
goes and does the thing. The pull to just do the work is usually the signal
you've reached the edge of the map and it's time to hand off. An effort can
override this in its **Notes**, carrying execution into the map itself, but
absent that, produce decisions, not deliverables. Execution that the map does
authorize still flows through bounded Arena Issues.

## Refer by name

Every map and ticket is a GitHub Issue, so it has a **name**: its title. In
everything the human reads (narration, the map's Decisions-so-far), refer to it
by that name, never by a bare number. A wall of `#42, #43, #44` is illegible;
names read at a glance. The number and URL don't vanish: a name wraps its link,
but they ride _inside_ the name, never stand in for it.

## The map

The map is a single GitHub Issue, the canonical artifact; a `wayfinder:map`
label or `[Wayfinder]` title prefix marks it where the repository uses labels.
Its tickets are child Issues (GitHub sub-issues where available).

The map is an **index**, not a store. It lists the decisions made and points at
the tickets that hold their detail; a decision lives in exactly one place, its
ticket, so the map never restates it, only gists it and links.

### The map body

The whole map at low resolution, loaded once per session. Open tickets are
**not** listed: they are open child Issues, found by query.

```markdown
## Destination

<what reaching the end of this map looks like: the spec, decision, or change
this effort is finding its way to. One or two lines; every session orients to
it before choosing a ticket.>

## Notes

<domain; capabilities every session should consult; standing preferences for
this effort>

## Decisions so far

<!-- the index: one line per closed ticket, enough to judge relevance, then
zoom the link for the detail the ticket holds -->

- [<closed ticket title>](link): <one-line gist of the answer>

## Not yet specified

<!-- in-scope fog you can't ticket yet; graduates as the frontier advances -->

## Out of scope

<!-- work ruled beyond the destination; closed, never graduates -->
```

### Tickets

Each ticket is a **child Issue** of the map; its Issue number is its identity.
Its body is the question, sized to one agent session:

```markdown
## Question

<the decision or investigation this ticket resolves>
```

Mark each ticket's type (`research`, `prototype`, `grilling`, `task`) in its
title or a label, per [Ticket types](#ticket-types).

A session **claims** a ticket by assigning the Issue to the person/session
driving the map, **first**, before any work, so concurrent sessions skip it.
That assignee _is_ the claim: an open, unassigned ticket is unclaimed.

Blocking uses GitHub's **native** dependency relationship where available: it
renders the frontier in GitHub's own UI, so the human sees what's takeable
without opening the map. Where native blocking is unavailable, record a
"Blocked by" list of Issue links in the body. A ticket is **unblocked** when
every ticket blocking it is closed; the **frontier** is the open, unblocked,
unclaimed children — the edge of the known.

The answer isn't part of the body; it's recorded on resolution (see [Work
through the map](#work-through-the-map)). Assets created while resolving a
ticket are linked from the Issue, not pasted in.

## Ticket types

Every ticket is either **HITL** (human in the loop, worked _with_ a human who
speaks for themselves) or **AFK**, driven by the agent alone. A HITL ticket
only resolves through that live exchange; the agent never stands in for the
human's side of it (a grilling session that answers its own questions has
broken this).

- **Research** (AFK): surface a fact a decision waits on, from documentation,
  third-party sources, or the codebase. The canonical research procedure,
  evidence hierarchy, labels, and freshness rules are owned by
  `../../RESEARCH.md`; research tickets follow that standard, and where the
  environment supports delegation they may run in independent contexts in
  parallel. Use when knowledge outside the current working set is required.
- **Prototype** (HITL): raise the fidelity of the discussion by making a cheap,
  rough, concrete artifact to react to, per
  [../prototype/](../prototype/SKILL.md). The prototype's question, evidence,
  and conclusion are recorded on the ticket; the artifact itself is temporary
  by default. Use when "how should it look" or "how should it behave" is the
  key question.
- **Grilling** (HITL): conversation — the default case. Read and apply
  [../grilling/](../grilling/SKILL.md) together with
  [../domain-modeling/](../domain-modeling/SKILL.md) so vocabulary sharpens as
  decisions settle.
- **Task** (HITL or AFK): manual work that must happen before a _decision_ can
  be made: nothing to decide, prototype, or research, but the discussion is
  blocked until it's done. Signing up for a service so its API can be judged,
  provisioning access, moving data so its shape can be seen. The one type that
  _does_ rather than decides; it earns its place by unblocking a decision, not
  by delivering the destination. The agent drives it alone where it can (AFK);
  otherwise it hands the human a precise checklist (HITL). Resolved when the
  work is done; the answer records what was done and any resulting facts
  (credential location, new URLs, row counts) later tickets depend on.

## Fog of war

The map is _deliberately_ incomplete: don't chart what you can't yet see.
Beyond the live tickets lies the **fog of war**: the dim view of decisions and
investigations you can tell are coming but can't yet pin down, because they
hang on questions still open. Resolving a ticket clears the fog ahead of it,
graduating whatever's now specifiable into fresh tickets, one at a time, until
the way to the destination is clear and no tickets remain.

The map's **Not yet specified** section is where that dim view is written down:
the suspected question, the area to revisit later. It's the undiscovered
frontier _toward_ the destination: everything here is in scope, just not sharp
enough to ticket. Write as loosely or as fully as the view allows; it doubles
as a signpost for collaborators reading where the effort is headed.

**Fog or ticket?** The test is whether you can state the question precisely
now, _not_ whether you can answer it now.

- **Ticket when** the question is already sharp, even if it's blocked and you
  can't act on it yet.
- **Not yet specified when** you can't yet phrase it that sharply. Don't
  pre-slice the fog into ticket-sized pieces: it's coarser than a ticket, and
  one patch may graduate into several tickets, or none, once the frontier
  reaches it.

**Not yet specified** excludes what's already decided (Decisions so far),
what's already a live ticket, and what's out of scope (next).

## Out of scope

Fog only ever gathers _toward_ the destination. The destination fixes the
scope, so work beyond it is **out of scope**: it isn't fog, and it doesn't
belong in **Not yet specified**. It gets its own **Out of scope** section on
the map: work consciously ruled out of _this_ effort. Scope, not sharpness,
lands it here.

Out-of-scope work never graduates (the frontier stops at the destination), so
it returns only if the destination is redrawn, and then as a fresh effort, not
a resumption.

Ruling something out of scope is a scoping act, not a step on the route. When a
ticket that already exists turns out to sit past the destination (mis-scoped
while charting, or exposed by a resolution), **close it** (a closed ticket is
unambiguously off the frontier) and leave one line in the **Out of scope**
section: the gist plus why, linking the closed ticket. It stays out of
**Decisions so far**, which records the route actually walked; a scope boundary
isn't a step on it.

## Invocation

Two modes. Either way, **never resolve more than one ticket per session**, with
the exception of research tickets.

### Chart the map

Invoked with a loose idea.

1. **Name the destination.** Apply [../grilling/](../grilling/SKILL.md) and
   [../domain-modeling/](../domain-modeling/SKILL.md) to pin down what this map
   is finding its way to: the spec, decision, or change. The destination fixes
   the scope, so it's settled first.
2. **Map the frontier.** Grill again, **breadth-first** this time: fan out
   across the whole space rather than deep on any one thread, surfacing the
   open decisions and the first steps takeable now. **If this surfaces no
   fog** — the way to the destination is already clear, the whole journey small
   enough for one session — you don't need a map. Stop and ask the human how
   they'd like to proceed; ordinary dispatch
   (`../../chatgpt/ARENA-DISPATCH.md`) likely suffices.
3. **Create the map Issue**: Destination and Notes filled in, Decisions-so-far
   empty, the fog sketched into **Not yet specified**.
4. **Create the tickets you can specify now** as child Issues of the map, then
   wire blocking edges in a **second pass** (Issues need numbers before they
   can reference each other). Wiring sorts them into the frontier and the
   blocked; everything you can't yet specify stays in the fog.
5. **Fire the research.** For each `research` ticket just created, resolve it
   following `../../RESEARCH.md` — in parallel independent contexts where the
   environment supports delegation — recording findings in the ticket's
   resolution comment, and in `docs/` only when the research standard's
   durability rule requires it.
6. Stop: charting is one session's work; it hand-resolves nothing else.

### Work through the map

Invoked with a map (URL or number). A ticket is **optional**: without one, you
pick the next decision, not the human.

1. Load the **map**: the low-res view, not every ticket body.
2. Choose the ticket. If the human named one, use it. Otherwise take the first
   frontier ticket in order. **Claim it**: assign the Issue before any work.
3. Resolve it. **Zoom as needed**: fetch the full body of any related or closed
   ticket on demand; read and apply whichever capabilities the map's
   `## Notes` names. If in doubt, apply
   [../grilling/](../grilling/SKILL.md) and
   [../domain-modeling/](../domain-modeling/SKILL.md).
4. Record the resolution: post the answer as a **resolution comment**,
   **close** the Issue, and **append a context pointer** to the map's
   Decisions-so-far. Decisions that future execution depends on land in their
   canonical durable destination (accepted docs/ADRs, or the map ticket as the
   record) per the ChatGPT durable-decision rule
   (`../../chatgpt/AGENTS.md`).
5. Add newly-surfaced tickets (create-then-wire); graduate any fog the answer
   has made specifiable, clearing each graduated patch from **Not yet
   specified** so it lives only as its new ticket. If the answer reveals that a
   ticket sits beyond the destination, **rule it out of scope** rather than
   resolving it on the route. If the decision invalidates other parts of the
   map, update or delete those tickets.

Unblocked tickets may be worked in parallel sessions, so expect concurrent
edits on GitHub; the claim-by-assignment rule keeps sessions from colliding.

## Completion

The map is done when the frontier is empty and the fog has graduated or been
ruled out of scope: the route to the destination is sufficiently clear. Hand
off: compile a spec ([../to-spec/](../to-spec/SKILL.md)) when a substantial
feature spec is justified, decompose
([../to-tickets/](../to-tickets/SKILL.md)) when required, and dispatch bounded
Arena Issues. Close the map Issue with a final comment pointing at the
resulting spec/tickets.
