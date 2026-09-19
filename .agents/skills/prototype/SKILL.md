# Prototype

Adapted from mattpocock/skills (MIT) — see [../PROVENANCE.md](../PROVENANCE.md).

A prototype is **throwaway code that answers a question**. The question decides
the shape. Use it for questions that are materially easier to answer with a
runnable/visible artifact than through prose alone.

Primarily a Human + ChatGPT planning capability for resolving design decisions.
Arena builds a prototype only when the bounded Issue explicitly asks for one.

## Pick a branch

Identify which question is being answered, from the task, the surrounding code,
or by asking when the human is reachable:

- **"Does this logic / state model feel right?"** → [LOGIC.md](LOGIC.md). Build
  a single shareable HTML file (free-play buttons plus tabbed guided
  walkthroughs) that pushes the state machine through cases that are hard to
  reason about on paper, and that a non-developer can drive.
- **"What should this look like?"** → [UI.md](UI.md). Generate several radically
  different UI variations on a single route, switchable via a URL search param
  and a floating bottom bar.

The two branches produce very different artifacts, so getting this wrong wastes
the whole prototype. If the question is genuinely ambiguous and the human isn't
reachable, default to whichever branch better matches the surrounding code (a
backend module → logic; a page or component → UI) and state the assumption at
the top of the prototype.

## Rules that apply to both

1. **Throwaway from day one, and clearly marked as such.** Locate the prototype
   code close to where it will actually be used (next to the module or page
   it's prototyping for) so context is obvious, but name it so a casual reader
   can see it's a prototype, not production. For throwaway UI routes, obey
   whatever routing convention the project already uses; don't invent a new
   top-level structure.
2. **Trivial to run.** A UI prototype starts from one command in the project's
   task runner. A logic demo is a single HTML file the user double-clicks.
   Either way, no thinking required to start it — and no CDN or network
   dependencies: a prototype that needs the internet to render is not trivial
   to run.
3. **No persistence by default.** State lives in memory. Persistence is the
   thing the prototype is _checking_, not something it should depend on. If the
   question explicitly involves a database, hit a scratch DB or a local file
   with a clear "PROTOTYPE, wipe me" name.
4. **Skip the polish.** No tests, no error handling beyond what makes the
   prototype _runnable_, no abstractions. The point is to learn something fast.
5. **Surface the state.** After every action (logic) or on every variant switch
   (UI), print or render the full relevant state so the user can see what
   changed.
6. **Record the answer, then delete the artifact.** This repository's
   retention policy — prototypes are temporary by default; this replaces the
   upstream "commit to a throwaway branch" default:
   - fold any validated decision into the real project decisions (canonical
     docs/ADRs, the spec, or the Issue, per the durable-decision rule);
   - record the **question, the evidence, and the conclusion** in the relevant
     GitHub Issue or accepted project truth — the answer is the durable output,
     not the code;
   - **delete temporary prototype code before completion.** Do not create
     permanent `prototype/*` branches by default.
   - Retain the prototype artifact itself only when it is necessary durable
     evidence (e.g. a captured interaction that a decision cites) **and** the
     human/ChatGPT task contract explicitly selects that outcome, stating where
     the artifact lives.
