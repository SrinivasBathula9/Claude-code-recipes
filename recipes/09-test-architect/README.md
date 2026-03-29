# 🧪 Test Architect

**Analyze code → generate test strategy, test cases, and coverage plan. From zero tests to comprehensive suite.**

## Architecture

```
┌──────────────────┐
│  /test-architect │
└────────┬─────────┘
         │
┌────────▼─────────┐
│  Analyzer Agent  │  ← Maps code complexity, dependencies, risk areas
└────────┬─────────┘
         │
    ┌────┼──────────┐
    │    │           │
┌───▼──┐ ┌──▼─────┐ ┌──▼────────┐
│Unit  │ │Integr. │ │E2E Test   │
│Test  │ │Test    │ │Generator  │
│Gen   │ │Gen     │ │           │
└───┬──┘ └──┬─────┘ └──┬────────┘
    │       │           │
    ▼       ▼           ▼
 tests/   tests/     tests/
 unit/    integration/ e2e/
```

## What It Does

1. Analyzes your codebase for testable components
2. Identifies high-risk areas (complex logic, external integrations, data transformations)
3. Generates a test strategy document
4. Creates test files with actual test cases
5. Reports expected coverage improvement

## Install

```bash
./install.sh test-architect /path/to/your-project
```

## Usage

```
# Full test suite generation
/test-architect

# Specific module
/test-architect src/api/auth.py

# Specific test type
/test-architect unit
/test-architect integration
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/test-architect.md` | Slash command entry point |
| `agents/test-analyzer-agent.md` | Code complexity and risk analyzer |
| `agents/unit-test-agent.md` | Unit test generator |
| `agents/integration-test-agent.md` | Integration test generator |
| `CLAUDE.md` | Testing standards and conventions |
