# Security Workflow

Use when the Issue explicitly requires security-sensitive review or
implementation. This workflow owns **when and why** security work is required;
it does not duplicate the specialized deep-audit procedure.

## Select depth deliberately

- For normal security-sensitive implementation/review, use this workflow's
  focused procedure below and only the stack-specific tools the Issue selects.
- For a **full codebase audit, pen test, comprehensive/end-to-end security
  review, or requested audit report artifacts**, the Issue must additionally
  select `.agents/skills/security-audit/SKILL.md`. That capability owns the
  specialized deep-audit procedure: reconnaissance, coverage ledger, hunting,
  candidate validation, structured findings, independent record verification,
  and reporting. Read its `SKILL.md` first and load the companions it selects.
- For a focused security question/vulnerability investigation, selecting the
  security-audit capability uses its guidance mode only; it does not
  automatically create audit artifacts or run all six phases.

A selected deep audit remains subordinate to root policy, accepted project
truth, and the Issue. It does not authorize a change outside the assigned task.

## Focused procedure

1. Identify assets, trust boundaries, entry points, principals, privileges, and
   secrets relevant to the task.
2. Check repository/agent instruction boundaries and prompt-injection exposure.
3. Check secret handling and accidental credential disclosure.
4. Check shell/process/file operations for destructive or unsafe behavior.
5. Check dependency provenance and newly introduced supply-chain surface.
6. Check GitHub permissions/workflow changes for privilege expansion.
7. Check input validation/authentication/authorization concerns applicable to
   the actual stack.
8. Run only security tools explicitly selected by the Issue.
9. Distinguish a verified vulnerability from a hardening suggestion; report
   evidence and residual risk.

## Deep-audit execution safety

When `.agents/skills/security-audit/` is selected, its `SKILL.md` owns the
exact universal execution-safety contract for target-controlled execution —
sandbox isolation, environment sanitization, write isolation, and resource
limits. Read and satisfy that contract exactly; full target-controlled
execution is permitted only where every control it requires can actually be
enforced in the real environment.

If any required control cannot be enforced, **do not claim a full dynamic
audit occurred**. Use the capability's permitted source/guidance path, retain
unresolved candidates as `needs_validation` with the exact missing
controls/facts stated and a safe validation plan. The capability's
independent-validation rule applies: the discovering agent is never the sole
verifier of its own finding.

## Rules

- Do not install a security suite merely because this workflow is active.
- Do not treat model review as a substitute for deterministic scanners/tests
  where those are stronger.
- New trust boundaries or credential requirements require escalation.
- Never contact deployed endpoints, provider APIs, shared infrastructure, or
  other users' data unless an explicit higher-authority task and safe
  environment authorizes it; the deep-audit capability does not weaken this.
