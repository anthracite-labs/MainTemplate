# Debug Workflow

Use when the primary task is finding and fixing an observed failure.

## Procedure

1. Reproduce the failure or establish the strongest available failing evidence.
2. Separate symptom from suspected cause.
3. Inspect the smallest relevant execution path.
4. Form a falsifiable root-cause hypothesis.
5. Test the hypothesis before broad edits.
6. Fix the root cause with the smallest coherent change.
7. Add/update a regression test when practical.
8. Run targeted checks, then the required full verification.
9. Inspect the final diff for workaround residue or unrelated changes.

## Rules

- Do not shotgun-edit multiple possible causes.
- Do not suppress errors/checks as a substitute for fixing the defect.
- If reproduction is impossible, say what evidence is missing and avoid pretending certainty.
