# Security Sentinel — Project Memory

## Threat Model
Scans for OWASP Top 10 + secrets + dependency vulnerabilities:
- **A01 Broken Access Control** — Missing auth checks, IDOR patterns
- **A02 Cryptographic Failures** — Hardcoded secrets, weak hashing (MD5/SHA1)
- **A03 Injection** — SQL injection, command injection, SSTI
- **A06 Vulnerable Components** — Known CVEs in dependencies
- **A09 Logging Failures** — Sensitive data in logs, missing audit trails

## Severity Levels
- **🔴 CRITICAL** — Active exploit risk, exposed secrets, auth bypass → Block commit immediately
- **🟡 HIGH** — Known CVE dependency, injection vector, missing input validation
- **🟠 MEDIUM** — Security misconfiguration, verbose errors, missing rate limiting
- **🟢 LOW** — Minor hardening improvements, informational findings

## Agent Roles
- `security-scanner-agent` — code patterns, logic vulnerabilities, OWASP checks
- `secrets-agent` — credential leaks, API tokens, private keys, connection strings
- Both agents are **READ-ONLY** — they NEVER modify files under any circumstances

## False Positive Protocol
- Placeholders like `YOUR_API_KEY`, `xxx`, `<token>` → mark LOW/informational
- Test files with example credentials → mark LOW with note "verify not a real credential"
- Never suppress CRITICAL — always surface it even if potentially a false positive

## Output Format Per Finding
1. File path + line number
2. Severity (CRITICAL / HIGH / MEDIUM / LOW)
3. Vulnerability type (OWASP category or "Secret: API Key" etc.)
4. Exact vulnerable code snippet
5. Remediation — specific fix, not generic advice
