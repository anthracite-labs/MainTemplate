# Independent review supplement

Compose with the exact vendored procedure:

`.agents/vendor/mattpocock/skills/engineering/code-review/SKILL.md`

That procedure owns Spec and Standards. This file adds one
MainTemplate-only axis. Do not rebuild the vendored review.

## Risk / evidence

After the vendored review returns, independently answer: is the result safe,
verifiable, and honestly evidenced?

Check:

- edge and failure behavior
- trust, security, and destructive behavior
- verification quality: what the checks actually prove
- missing or misleading evidence
- documentation drift
- policy and capability/dependency drift
- unrelated changes

Report this axis separately. Do not merge it into Spec or Standards.

Merge approval remains Human + ChatGPT judgment under `/AGENTS.md`.
Individual findings are not automatic merge blockers.
