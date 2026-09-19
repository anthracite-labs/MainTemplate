# Debug Workflow

Use when the primary task is finding and fixing an observed failure. This is
the repository's one canonical debugging procedure; there is deliberately no
separate debugging skill. It is adapted from the stronger diagnosing-bugs
mechanism recorded in `.agents/skills/PROVENANCE.md`.

When exploring a generated project, read its domain glossary (`CONTEXT.md`, if
it exists) and accepted ADRs relevant to the failure. Redact secrets from every
shown command, output, trace, fixture, and captured artifact: use
`<REDACTED>`, build loops against environment variables, and quote only the
lines carrying the signal.

## Phase 1 — Build a tight feedback loop

**Before theorizing, establish the strongest practical observable signal for
the exact reported failure.** Prefer one reproducible command, test, or harness
that drives the actual symptom. Treat the loop as the debugging product: it is
specific to the symptom, deterministic where practical, fast, and
agent-runnable where practical.

Construct one, roughly in this order:

1. failing test at a seam that reaches the bug (unit, integration, e2e);
2. HTTP/curl reproduction against a running development server;
3. CLI invocation with a fixture input, diffing stdout against a known-good
   snapshot;
4. headless-browser script that drives the UI and asserts DOM, console, or
   network behavior;
5. replayed captured trace (real request/payload/event log replayed through an
   isolated code path);
6. throwaway harness that starts the minimum system subset with controlled
   dependencies;
7. property/fuzz loop when the symptom is intermittent/wrong output;
8. bisection harness when the failure appeared between known commits, datasets,
   or versions;
9. differential loop comparing the same input across old/new versions or two
   configurations;
10. structured human-in-loop fallback when a human action is genuinely
    unavoidable: copy and edit `hitl-loop.template.sh`, then capture only
    redacted observations from the human.

Tighten any loop you get:

- make it faster (cache setup, skip unrelated initialization, narrow scope);
- make its signal sharper (assert the exact symptom, not merely "didn't
  crash");
- make it deterministic (pin time, seed randomness, isolate filesystem, freeze
  network);
- for flaky failures, raise reproduction rate through repetition, stress,
  timing windows, or controlled sleeps until it is useful to debug.

**Completion criterion:** name one command/script/test you have already run,
show its redacted result, and explain how it can go red on this exact symptom
and green after a fix. A 30-second flaky loop is barely better than no loop; a
fast deterministic loop is tight.

### When a red-capable reproduction genuinely cannot be produced

MainTemplate does not make execution impossible in this case. Establish the
**strongest available failing evidence** instead. Say exactly:

- what evidence is missing;
- every reproduction/loop attempt and result;
- why the available evidence cannot prove the suspected cause;
- the confidence reduction and what would raise confidence;
- the safe next evidence or human-in-loop step.

Do not pretend the cause is proven. Do not move into speculative code reading
as if it were a substitute for a loop. A fix based on incomplete evidence must
remain explicitly conditional and re-run the original evidence path when it
becomes available.

## Phase 2 — Reproduce and minimise

Run the loop and watch the actual user-reported failure occur. Confirm it is the
same symptom, reproducible across multiple runs (or at a high enough rate for a
non-deterministic failure), and capture the exact error/wrong output/timing.

Then shrink it until every remaining element is **load-bearing**: cut inputs,
callers, config, data, and steps one at a time; rerun after every cut; keep only
what still produces the failure. The minimal reproducer shrinks the hypothesis
space and becomes the cleanest regression evidence.

## Phase 3 — Hypotheses

Generate **3–5 ranked, falsifiable hypotheses** before testing any one of them.
Single-hypothesis generation anchors on the first plausible explanation.

Each hypothesis states a prediction:

> If `<X>` is the cause, then changing/observing `<Y>` will make the bug
> disappear, worsen, or produce `<Z>`.

Discard or sharpen a hypothesis that cannot predict an observable result. When
the human is available, show the ranked list before probing — their domain
knowledge can re-rank it — but do not block routine investigation on their
availability.

## Phase 4 — Instrumentation

Probe hypotheses one variable at a time. Each probe maps to a prediction from
Phase 3.

Prefer a debugger/REPL inspection where available; otherwise add targeted logs
at boundaries that distinguish hypotheses. Never "log everything and grep."
Every temporary debug log gets a unique prefix (for example `[DEBUG-a4f2]`) so
cleanup is a deterministic search. For performance regressions, measure first
(timing harness, profiler, query plan, baseline) rather than using logs as the
primary probe.

Instrumentation is temporary, easy to locate, and easy to remove. Do not let
it become a permanent behavior change or leak secrets.

## Phase 5 — Fix and regression coverage

Fix the demonstrated root cause with the smallest coherent change.

When a correct test seam exists:

1. turn the minimal reproducer into a failing regression test at that seam;
2. prove it fails before the fix;
3. apply the fix;
4. prove the regression test passes;
5. rerun the original full (un-minimised) Phase 1 reproducer.

A correct seam exercises the real bug pattern as it occurs at the call site. A
test at an artificially shallow seam gives false confidence. If no valid test
seam exists, **do not write a misleading test**: surface the architecture
limitation, document why the available seams cannot represent the bug, and
state the evidence that replaces regression coverage. A missing correct seam
may itself be a consequential architecture concern; root escalation rules
apply.

## Phase 6 — Cleanup and evidence

Before completion, confirm and report:

- the original failure no longer reproduces (rerun the Phase 1 loop);
- regression evidence passes, or the missing valid seam is documented;
- every uniquely tagged temporary instrumentation point is removed;
- throwaway harnesses, prototype code, traces, and debugging artifacts are
  removed unless the Issue explicitly says one is deliberate durable evidence;
- the correct hypothesis/root cause, fix, and evidence map to the assigned
  Issue's acceptance criteria;
- targeted checks and the required full verification (`scripts/verify` when
  applicable) pass;
- the complete diff contains no workaround residue or unrelated changes.

A fix is not complete because the code looks plausible. It is complete when the
actual failure signal, regression evidence, and cleanup support the Issue.
