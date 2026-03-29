# /pr-review — Multi-Agent PR Review

Review the current PR using a team of specialized agents.

## Instructions

1. **Get the PR diff:**
   ```bash
   gh pr diff --name-only
   gh pr diff
   ```

2. **Delegate to agents in this order:**

   a. **Code Quality Agent** (`code-quality-agent`):
      - Review for style, patterns, DRY violations, naming conventions
      - Check against standards in CLAUDE.md
      - Flag any missing docstrings, tests, or type annotations

   b. **Security Agent** (`security-agent`) — READ-ONLY:
      - Scan for OWASP top 10 vulnerabilities
      - Check for hardcoded secrets, API keys, tokens
      - Review authentication and authorization logic
      - Check for SQL injection, XSS, CSRF

   c. **Performance Agent** (`performance-agent`) — READ-ONLY:
      - Identify N+1 queries, unnecessary loops
      - Check for memory leaks and resource management
      - Review algorithmic complexity
      - Flag missing pagination, caching opportunities

3. **Merge all findings** into a single review report with this format:

   ```
   ## 🛡️ PR Guardian Review

   ### Summary
   - Critical: X | Warnings: Y | Suggestions: Z
   - Recommendation: APPROVE / REQUEST CHANGES / BLOCK

   ### 🔴 Critical Issues
   ...

   ### 🟡 Warnings
   ...

   ### 🟢 Suggestions
   ...
   ```

4. **If `gh` CLI is available**, post the review as a PR comment:
   ```bash
   gh pr comment --body "$(cat review.md)"
   ```

## Arguments
- `$ARGUMENTS` — Optional PR number (e.g., `#42`). If omitted, uses current branch PR.
