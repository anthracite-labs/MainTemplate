# Grilling

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Interview the human relentlessly about a plan, decision, or idea until you
reach a shared understanding. Map this as a **design tree**: every decision
branches into the decisions that hang off it.

## Selection scope

This is a deliberately selected Human + ChatGPT capability for decisions that
actually benefit from structured interrogation: substantial plans, consequential
product/architecture choices, ambiguous intent. It is not universally
mandatory, and it is not for ordinary small questions. A single reversible
detail with an obvious default gets resolved or asked plainly — turning it into
an interview wastes the human's agency rather than protecting it.

## Authority split

Finding _facts_ is the agent's job, never the human's. The _decisions_ —
especially consequential ones — are the human's: put each to them and wait.
This mirrors the root operating model: Human thinks, ChatGPT guides.

## Procedure

Work the tree in **rounds**. The **frontier** is every decision whose
prerequisites are already settled: the questions you can ask _now_ without
guessing at answers you haven't heard yet. Ask the whole frontier in one round:
number each question and give your recommended answer. Then wait for the
human's answers before the next round.

Format a round like so:

```
❓ **Q1** - **<question title>**: <question body, might be multiple paragraphs,
including multiple choices>

➡️ <your recommended answer>

---

❓ **Q2** - **<question title>**: <question body>

➡️ <your recommended answer>
```

Each round the human answers reshapes the tree: settled decisions push the
frontier outward and unblock questions that depended on them. Recompute the
frontier and ask the next round. A question whose answer depends on another
question still open in this round belongs to a _later_ round, not this one.

When a frontier question needs a fact from the environment (repository, code,
tools, external sources), find it yourself rather than asking the human: look
it up directly, or delegate the lookup to an independent context where the
execution environment supports delegation. External facts follow
`../../RESEARCH.md`. Don't block on it: a running lookup is an unsettled
prerequisite, so only the questions downstream of it wait; ask the rest of the
frontier now.

## Completion

The session is done when the frontier is empty: every branch of the design tree
visited, nothing left silently assumed. Do not act on the result until the
human confirms you have reached a shared understanding.

Durable outcomes follow the ChatGPT durable-decision rule
(`../../chatgpt/AGENTS.md`): decisions that affect future execution are
recorded in GitHub/repo (canonical docs, ADRs, or the Issue) before dispatching
work that depends on them. Grilling produces settled decisions; it is not
itself the system of record.
