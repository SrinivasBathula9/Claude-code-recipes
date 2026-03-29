# Multi-Agent Refactor — Project Memory

## Orchestration Protocol
This project uses a 4-phase refactoring workflow:
1. **PLAN** → Planner Agent creates a Handoff Document
2. **EXECUTE** → Executor Agent follows the plan step-by-step with git checkpoints
3. **REVIEW** → Reviewer Agent validates changes (read-only)
4. **TEST** → Tester Agent runs and generates tests

## Handoff Protocol
- Every agent-to-agent handoff uses a structured document (not free text)
- The Planner's Handoff Document is the single source of truth
- No agent may deviate from the plan without explicit user approval
- If the Reviewer finds issues, they go back to the Executor (not the Planner)

## Git Discipline
- Commit after EVERY step: `git add -A && git commit -m "refactor: step N - description"`
- Never squash during refactoring — keep granular history for rollback
- Tag the start: `git tag refactor-start-[timestamp]`

## Scope Rules
- The Planner defines scope. The Executor follows it. The Reviewer enforces it.
- "While you're at it" changes are FORBIDDEN
- If new scope is needed, pause and ask the user
