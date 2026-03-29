# /security-scan — Security Vulnerability Scanner

Run a comprehensive security scan on the codebase or a specific file.

## Arguments
`$ARGUMENTS` — Optional file path. If omitted, scans recently changed files.

## Instructions

1. **Determine scope:**
   - If `$ARGUMENTS` is a file path, scan that file
   - If empty, get recently changed files: `git diff --name-only HEAD~5`

2. **Delegate to Security Scanner Agent** (`security-scanner-agent`) — READ-ONLY:
   - OWASP Top 10 vulnerability check
   - Input validation and sanitization
   - Authentication and authorization patterns
   - Error handling and information leakage
   - SQL injection, XSS, CSRF, SSRF

3. **Delegate to Secrets Agent** (`secrets-agent`) — READ-ONLY:
   - Scan for hardcoded API keys, tokens, passwords
   - Check for AWS keys, GCP credentials, Azure tokens
   - Look for private keys, certificates
   - Verify `.gitignore` covers sensitive files
   - Check `.env.example` doesn't contain real values

4. **Check dependencies** (if package files exist):
   ```bash
   # Python
   pip audit 2>/dev/null || echo "pip-audit not installed"
   
   # Node.js
   npm audit --json 2>/dev/null || echo "npm audit not available"
   ```

5. **Output security report:**

   ```markdown
   ## 🔒 Security Sentinel Report
   
   **Scan date:** [timestamp]
   **Files scanned:** [count]
   **Verdict:** SECURE / ISSUES FOUND
   
   ### 🔴 Critical (must fix before merge)
   ...
   
   ### 🟡 Warnings (fix soon)
   ...
   
   ### 🟢 Info (best practices)
   ...
   
   ### 🔑 Secrets Scan
   - Status: CLEAN / DETECTED
   - [details if detected]
   
   ### 📦 Dependency Audit
   - Vulnerable packages: [count]
   - [details]
   ```
