# Security routing

When and why security work is required. Not a copy of the deep-audit
procedure.

## Select depth

- Normal security-sensitive implementation or review: use the focused
  procedure below and only the tools the Issue selects.
- Full codebase audit, pen test, comprehensive review, or requested audit
  artifacts: the Issue must also select
  `.agents/vendor/cloudflare/skills/security-audit/SKILL.md`. That file owns
  reconnaissance, hunting, validation, reporting, and execution safety.
- A focused security question uses that skill in guidance mode only.

A selected audit remains subordinate to root policy, project truth, and the
Issue.

## Focused procedure

1. Identify assets, trust boundaries, entry points, principals, privileges,
   and secrets relevant to the task.
2. Check instruction boundaries and prompt-injection exposure.
3. Check secret handling.
4. Check shell/process/file operations for unsafe behavior.
5. Check newly introduced supply-chain surface.
6. Check GitHub permission or workflow changes for privilege expansion.
7. Check input validation, authentication, and authorization on the actual
   stack.
8. Run only security tools the Issue selects.
9. Distinguish a verified vulnerability from a hardening suggestion.

## Execution safety

When the vendored security-audit skill is selected, its `SKILL.md` owns the
sandbox contract. If any required control cannot be enforced, do not claim a
full dynamic audit. Stay on the skill's source/guidance path and keep
unresolved candidates as `needs_validation`.

Do not install a security suite merely because this workflow is active. New
trust boundaries require escalation. Never contact deployed endpoints or
other users' data unless a higher-authority task and safe environment
authorize it.
