# /test-architect — Generate Test Strategy & Test Cases

Analyze the codebase and generate a comprehensive test suite.

## Arguments
`$ARGUMENTS` — Optional: file path, `unit`, `integration`, or `all` (default).

## Instructions

1. **Detect test framework and existing tests:**
   ```bash
   # Check for test frameworks
   grep -r "pytest\|unittest\|jest\|mocha\|vitest\|go test\|cargo test" package.json requirements.txt Cargo.toml go.mod 2>/dev/null

   # Find existing tests
   find . -type f \( -name '*test*' -o -name '*spec*' \) -not -path '*/node_modules/*' -not -path '*/.git/*' | head -20

   # Count existing test files
   find . -type f \( -name '*test*' -o -name '*spec*' \) -not -path '*/node_modules/*' | wc -l
   ```

2. **Delegate to Test Analyzer Agent** (`test-analyzer-agent`):
   - Map all functions/methods with cyclomatic complexity
   - Identify untested code paths
   - Rank modules by risk (complexity × impact)
   - Output: prioritized test plan

3. **Delegate to Unit Test Agent** (`unit-test-agent`):
   - Generate unit tests for top-priority functions
   - Follow existing project conventions
   - Include edge cases: null, empty, boundary, error paths
   - Mock external dependencies

4. **Delegate to Integration Test Agent** (`integration-test-agent`):
   - Generate integration tests for API endpoints
   - Test database operations end-to-end
   - Test authentication flows
   - Test error handling across boundaries

5. **Output:**
   - Create test files in the correct project directories
   - Generate `TEST_STRATEGY.md` with the test plan
   - Report expected coverage improvement

   ```markdown
   ## 🧪 Test Architect Report

   ### Current State
   - Test files: X
   - Estimated coverage: X%

   ### Generated
   - Unit tests: X files, Y test cases
   - Integration tests: X files, Y test cases
   - Expected coverage after: X%

   ### Priority Matrix
   | Module | Risk | Complexity | Tests Added |
   |--------|------|-----------|------------|
   | auth.py | HIGH | 8 | 12 cases |
   ```
