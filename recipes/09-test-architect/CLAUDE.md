# Test Architect — Project Memory

## 3-Agent Pipeline
1. **Analyzer Agent** — Reads code, identifies untested paths, generates test strategy
2. **Unit Test Agent** — Generates unit tests for individual functions/classes
3. **Integration Test Agent** — Generates tests for component interactions and API flows

## Coverage Targets
- Minimum acceptable: 70% line coverage
- Target: 85% line coverage
- Critical paths (auth, payments, data mutations): 100% coverage required
- The Analyzer must flag any critical path below 100% as CRITICAL

## Test File Placement Convention
Detect and match the project's existing convention:
- `tests/` directory at root → place tests there
- `__tests__/` alongside source → mirror source tree
- `*.test.ts` / `*.spec.ts` alongside source → same directory as source

## Framework Detection Priority
Check in this order: existing test files → `package.json` scripts → `pyproject.toml` → infer from dependencies
- Never assume a framework — always detect from the project
- If no test framework exists, recommend one and explain why

## Agent Handoff Protocol
- Analyzer produces: `test-strategy.md` listing files, coverage gaps, priority order
- Unit/Integration agents receive: specific file list from Analyzer (not "all files")
- Generated tests must be syntactically valid — include a note if a test requires a dependency to be installed

## Quality Bar
- Generated tests must PASS when source code is correct (not just syntactically valid)
- Every test must have a descriptive name explaining what it tests and what the expected outcome is
- No `expect(true).toBe(true)` placeholder tests — real assertions only
