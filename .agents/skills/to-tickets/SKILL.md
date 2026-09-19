# To Tickets

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

Break a spec, plan, or settled conversation into a set of **tickets**:
tracer-bullet vertical slices, each declaring the tickets that **block** it,
published as GitHub Issues.

A Human + ChatGPT planning capability. This fills the decomposition gap
between planning and dispatch: the operating model requires every Arena task
to be bounded enough for one execution/PR, and this capability is how large
settled work is cut into such bounds. GitHub Issues are the only tracker;
there is no local issue-tracker architecture and no secondary ticket store.

## Process

### 1. Gather context

Work from whatever is already settled: the spec Issue (from
[../to-spec/](../to-spec/SKILL.md)), a plan, or the conversation. If a
reference is given (Issue number or URL), read its full body and comments.

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so, to understand the current
state. Ticket titles and descriptions use the project's domain glossary
vocabulary (where one exists) and respect accepted ADRs in the area touched.

Do not invent a refactor merely because it would make later implementation
nicer. Consider an **enabling prefactor** only when it is genuinely necessary
to deliver the already-approved outcome safely. When ordinary implementation
can proceed safely without it, do not create a prefactor ticket.

### 3. Draft vertical slices

Break the work into **tracer bullet** tickets:

- Each slice cuts a narrow but COMPLETE path through every layer it touches
  (schema, API, UI, tests): vertical, NOT a horizontal slice of one layer.
  "Database ticket", "backend ticket", "frontend ticket", "tests ticket" are
  the wrong shape.
- A completed slice is independently demoable or verifiable where practical.
- Each slice is sized so one Arena execution unit fits one coherent PR, within
  one fresh context.

An enabling prefactor is an exception, not a default. Create a separate
prefactor ticket only when all of these are true:

- it is genuinely necessary for the already-approved outcome, not merely a
  cleaner future implementation;
- it is itself bounded and independently verifiable;
- it preserves existing behavior unless the approved task explicitly changes
  that behavior;
- it does not introduce consequential architecture without Human + ChatGPT
  approval and durable project truth.

If it qualifies, record why it gates the approved outcome and make it a real
blocking edge. Otherwise, do not add it.

Give each ticket its **blocking edges**: the other tickets that must complete
before it can start. A ticket with no blockers can start immediately. Record
genuine dependencies only — do not create artificial serial order.

**Wide refactors are the exception to vertical slicing.** A **wide refactor**
is one mechanical change (rename a column, retype a shared symbol) whose
**blast radius** fans across the whole codebase, so a single edit breaks
thousands of call sites at once and no vertical slice can land green. Don't
force it into a tracer bullet; sequence it as **expand → migrate → contract**.
First expand: add the new form beside the old so nothing breaks. Then migrate
the call sites over in batches sized by blast radius (per package, per
directory), each batch its own ticket blocked by the expand, keeping CI green
batch to batch because the old form still exists. Finally contract: delete the
old form once no caller remains, in a ticket blocked by every migrate batch.
When even the batches can't stay green alone, keep the sequence but let them
share an integration branch that all block a final integrate-and-verify ticket;
green is promised only there.

### 4. Confirm the breakdown with the human

Present the proposed breakdown as a numbered list. For each ticket, show:

- **Title**: short descriptive name;
- **Blocked by**: which other tickets (if any) must complete first;
- **What it delivers**: the end-to-end behaviour this ticket makes work.

Ask:

- Does the granularity feel right (too coarse / too fine)?
- Are the blocking edges correct: does each ticket depend only on tickets that
  genuinely gate it?
- Should any tickets be merged or split further?

Iterate until the human approves the breakdown.

### 5. Publish to GitHub

Publish one GitHub Issue per ticket, in dependency order (blockers first) so
each ticket's blocking edges can reference real Issue numbers. Use GitHub's
native sub-issue and dependency ("blocked by") relationships where available
and useful; otherwise record the edges in each Issue body under "Blocked by".
Where a parent spec/plan Issue exists, link every ticket to it; do not close or
modify the parent as a side effect.

Every executable ticket must be a **valid bounded Arena task contract**: write
it in the shape of `.github/ISSUE_TEMPLATE/arena-task.md` (objective,
authority, references, closed decisions, workflow selection, selected skills,
constraints, acceptance criteria, verification, escalation boundaries).
Decomposition does not weaken the dispatch standard — each ticket must still
pass the scope test in `../../chatgpt/ARENA-DISPATCH.md` before dispatch.

In ticket bodies, avoid speculative implementation paths or brittle step-by-step
code scripts that over-constrain execution or go stale fast. However, do provide
exact canonical reference paths (governing docs, ADRs, existing interfaces) and
known bounded surfaces/scope boundaries as required by the Arena task contract.
Exception: if a prototype produced a snippet that encodes a decision more
precisely than prose can (state machine, reducer, schema, type shape), inline
it and note briefly that it came from a prototype. Trim to the decision-rich
parts, not a working demo.

### 6. Work the frontier

Execution takes the **frontier**: any ticket whose blockers are all closed. For
a purely linear chain that means top to bottom; unblocked tickets can proceed
independently, in parallel sessions. Each dispatched ticket follows the normal
Arena loop: bounded Issue → execution → PR with evidence → human + ChatGPT
review.
