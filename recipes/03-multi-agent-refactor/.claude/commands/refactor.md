# /refactor — Multi-Agent Refactoring Orchestrator

Orchestrate a 4-phase refactoring workflow with specialized agents.

## Arguments
`$ARGUMENTS` — Description of the refactoring task (e.g., "Extract auth logic into AuthService")

## Instructions

### Phase 1: PLAN (Planner Agent)

Delegate to `planner-agent` with this prompt:
> "Analyze the codebase and create a refactoring plan for: $ARGUMENTS"

The Planner must output a **Handoff Document** with:
- Scope: exactly which files and functions will change
- Steps: ordered list of atomic changes
- Risks: what could break
- Constraints: what must NOT change (public interfaces, tests, configs)
- Rollback: how to undo each step

**WAIT for the plan. Review it. If the scope is too large, ask the Planner to break it down.**

### Phase 2: EXECUTE (Executor Agent)

Delegate to `executor-agent` with the Handoff Document.

Rules:
- Execute ONE step at a time
- After each step, create a git checkpoint: `git add -A && git commit -m "refactor: step N - description"`
- Never modify files outside the scope defined in the Handoff Document
- If a step fails, STOP and report — do not proceed

### Phase 3: REVIEW (Reviewer Agent — READ-ONLY)

Delegate to `reviewer-agent`:
- Verify all changes match the plan
- Check for regressions (broken imports, missing references)
- Validate that public interfaces are unchanged
- Check naming consistency

If the Reviewer finds issues, send findings back to the Executor for fixes.

### Phase 4: TEST (Tester Agent)

Delegate to `tester-agent`:
- Run existing test suite: detect regressions
- Generate new tests for refactored code
- Report coverage delta (before vs after)

### Final Output

```markdown
## 🔄 Refactoring Report

### Task
$ARGUMENTS

### Changes Made
| Step | File | Change | Status |
|------|------|--------|--------|
| 1    | ...  | ...    | ✅     |

### Test Results
- Tests passed: X/Y
- Coverage before: Z%
- Coverage after: Z%
- New tests added: N

### Review Status
- [x] All changes match plan
- [x] No regressions detected
- [x] Public interfaces preserved
- [x] Naming consistent

### Rollback
To undo: `git revert HEAD~N` (N = number of steps)
```
