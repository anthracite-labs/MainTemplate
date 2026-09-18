# Security Workflow

Use when the Issue explicitly requires security-sensitive review or implementation.

This workflow covers agent/repository security by default. Application-specific scanners/tools are used only when selected for the known project stack.

## Procedure

1. Identify assets, trust boundaries, entry points, privileges, and secrets relevant to the task.
2. Check repository/agent instruction boundaries and prompt-injection exposure.
3. Check secret handling and accidental credential disclosure.
4. Check shell/process/file operations for destructive or unsafe behavior.
5. Check dependency provenance and newly introduced supply-chain surface.
6. Check GitHub permissions/workflow changes for privilege expansion.
7. Check input validation/authentication/authorization concerns applicable to the actual stack.
8. Run only the security tools explicitly selected by the Issue.
9. Distinguish verified vulnerability from hardening suggestion.
10. Return evidence and residual risk.

## Rules

- Do not install a security suite merely because this workflow is active.
- Do not treat model review as a substitute for deterministic scanners/tests where those are stronger.
- New trust boundaries or credential requirements require escalation.
