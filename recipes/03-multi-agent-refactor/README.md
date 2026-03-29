# 🔄 Multi-Agent Refactor

**4-agent orchestration: Plan → Execute → Review → Test. The production-grade refactoring workflow.**

> This recipe implements the **Coordination Pattern** — a multi-agent orchestration approach that minimizes the "Coordination Tax" (overhead from agent-to-agent handoffs) through structured handoff protocols.

## Architecture

```
┌──────────────────────────────────────────────────────────┐
│                    /refactor                               │
│                        │                                   │
│                ┌───────▼────────┐                          │
│                │   Planner      │  Phase 1: PLAN           │
│                │   Agent        │  - Analyze scope          │
│                │                │  - Create step-by-step    │
│                │                │  - Identify risks         │
│                └───────┬────────┘                          │
│                        │                                   │
│                ┌───────▼────────┐                          │
│                │   Executor     │  Phase 2: EXECUTE         │
│                │   Agent        │  - Apply changes          │
│                │                │  - One file at a time     │
│                │                │  - Checkpoint after each  │
│                └───────┬────────┘                          │
│                        │                                   │
│                ┌───────▼────────┐                          │
│                │   Reviewer     │  Phase 3: REVIEW          │
│                │   Agent        │  - Verify changes         │
│                │   (read-only)  │  - Check for regressions  │
│                │                │  - Validate patterns      │
│                └───────┬────────┘                          │
│                        │                                   │
│                ┌───────▼────────┐                          │
│                │   Tester       │  Phase 4: TEST            │
│                │   Agent        │  - Run existing tests     │
│                │                │  - Generate new tests     │
│                │                │  - Coverage report        │
│                └───────┬────────┘                          │
│                        │                                   │
│                ┌───────▼────────┐                          │
│                │   Final Report │                          │
│                │   + Commit     │                          │
│                └────────────────┘                          │
└──────────────────────────────────────────────────────────┘
```

## The Coordination Tax Problem

In production multi-agent systems, the biggest failures come from **coordination overhead**:

| Failure Mode | Symptom | This Recipe's Fix |
|---|---|---|
| Context loss between agents | Agent 2 doesn't know what Agent 1 decided | Structured handoff document |
| Conflicting changes | Agents step on each other's edits | Sequential execution + checkpoints |
| Scope creep | Agents refactor more than asked | Strict scope definition in Planner |
| No rollback | Bad refactor breaks everything | Git checkpoint after each step |
| Missing tests | Refactored code has no test coverage | Dedicated Test Agent phase |

## Install

```bash
./install.sh multi-agent-refactor /path/to/your-project
```

## Usage

```
# Refactor a specific module
/refactor Extract the auth logic from UserController into a dedicated AuthService

# Refactor with constraints
/refactor Convert callbacks to async/await in src/api/ — don't change public interfaces
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/refactor.md` | Slash command with orchestration logic |
| `agents/planner-agent.md` | Scope analysis and step planning |
| `agents/executor-agent.md` | Code modification execution |
| `agents/reviewer-agent.md` | Post-refactor review (read-only) |
| `agents/tester-agent.md` | Test execution and generation |
| `CLAUDE.md` | Refactoring standards and handoff protocol |
