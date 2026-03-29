# PR Guardian — Project Memory

## Team Standards
- All functions must have docstrings/JSDoc
- No hardcoded secrets or API keys
- Maximum cyclomatic complexity: 10
- Test coverage minimum: 80%
- No `any` types in TypeScript
- SQL queries must use parameterized statements
- All API endpoints must have input validation

## Review Severity Levels
- **🔴 CRITICAL** — Security vulnerabilities, data leaks, broken auth → Block merge
- **🟡 WARNING** — Performance issues, missing tests, code smells → Request changes
- **🟢 SUGGESTION** — Style improvements, refactoring opportunities → Comment only

## Review Format
Each finding must include:
1. File and line number
2. Severity level (CRITICAL / WARNING / SUGGESTION)
3. What's wrong (one sentence)
4. How to fix it (code example)
5. Why it matters (one sentence)

## Agent Delegation Rules
- Security Agent: ALWAYS runs in read-only mode (allowedTools: Read, Bash(read-only))
- Performance Agent: ALWAYS runs in read-only mode
- Code Quality Agent: Can suggest edits but never auto-applies them
- All agents operate on the PR diff only, not the full codebase
