# /incident — AI Incident Responder

Analyze an error, perform root cause analysis, generate a fix, and create a prevention plan.

## Arguments
`$ARGUMENTS` — Error message, stack trace, or incident description.

## Instructions

1. **Triage — Delegate to Triage Agent** (`triage-agent`):
   - Parse the error message and stack trace
   - Classify severity: P0 (service down), P1 (major feature broken), P2 (degraded), P3 (minor)
   - Identify error category: runtime, config, dependency, infra, data, auth
   - Extract: file, line, function, error type

2. **Root Cause Analysis — Delegate to RCA Agent** (`rca-agent`):
   - Read the file and surrounding context where the error occurs
   - Trace the call chain backward to find the root cause
   - Check recent changes: `git log --oneline -10 -- [file]`
   - Identify: was this a code change, config change, data issue, or environmental?
   - Produce a causal chain: A caused B which caused C (the error)

3. **Fix — Delegate to Fix Agent** (`fix-agent`):
   - Generate the minimal code fix
   - Explain what the fix does and why
   - Include a test that would catch this error
   - Ensure the fix doesn't introduce new issues

4. **Prevention — Delegate to Prevention Agent** (`prevention-agent`):
   - What monitoring would catch this earlier?
   - What test would prevent this from deploying?
   - What architectural change would eliminate this class of error?
   - What runbook entry should be added?

5. **Generate Incident Report:**

   ```markdown
   ## 🚨 Incident Report

   ### Summary
   **Severity:** P[0-3]
   **Category:** [runtime/config/dependency/infra/data/auth]
   **Error:** [one-line description]

   ### Root Cause Analysis
   **Root Cause:** [one sentence]
   **Causal Chain:**
   1. [Root cause]
   2. → [Intermediate effect]
   3. → [Observed error]

   **Trigger:** [What changed to cause this now?]

   ### Fix
   **File:** [path]
   **Change:**
   \`\`\`diff
   - [old code]
   + [new code]
   \`\`\`
   **Explanation:** [why this fixes it]

   ### Prevention Plan
   | Action | Type | Priority | Owner |
   |--------|------|----------|-------|
   | Add test for [case] | Test | HIGH | Dev |
   | Add monitoring for [metric] | Monitor | MEDIUM | SRE |
   | Refactor [component] | Architecture | LOW | Team |

   ### Timeline
   - **Detected:** [when]
   - **Triaged:** [when]
   - **Fixed:** [when]
   - **Verified:** [when]
   ```
