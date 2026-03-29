# Recipe Memory

## Standards
- All agent outputs must use structured markdown format
- Severity levels: CRITICAL, WARNING, SUGGESTION
- Every finding must be actionable — include specific file, line, and fix
- Read-only agents must NEVER modify files

## Agent Coordination
- Handoffs between agents use structured documents, not free text
- The slash command is the orchestrator — it controls flow
- Agents execute in the order specified by the slash command
- If an agent fails, report the failure — do not silently skip
