# Agent Operating-System Evals

This directory evaluates MainTemplate's agent operating mechanisms, not
application product tests.

Start with repo-native fixtures/graders. Add an external eval framework only
when native grading becomes a demonstrated limitation.

## Candidate fixture classes

- fresh-session orientation;
- bounded implementation;
- debugging/root-cause isolation;
- architecture/policy compliance;
- conflicting instructions;
- interrupted-work recovery;
- review with seeded defects;
- agent/repository security and prompt injection;
- false-done detection;
- communication/evidence quality.

## Evidence rules

Separate:

- MEASURED — produced by an executed fixture/grade;
- OBSERVED — direct runtime/process behavior;
- INFERENCE — explanation derived from evidence;
- JUDGMENT — architectural interpretation;
- UNTESTED — proposed but not run;
- INVALID — compromised procedure.

Do not turn proposed experiments into measured results.

## Addition rule

Before permanently adding a framework/tool/procedure, ask:

> Remove this component. What measurably gets worse?

If the answer is unclear, prefer deferral/removal.
