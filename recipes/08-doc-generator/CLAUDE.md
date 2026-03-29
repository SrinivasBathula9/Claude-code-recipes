# Doc Generator — Project Memory

## Three Document Types
This recipe generates three distinct document types via specialized agents:

| Agent | Output | Audience | Format |
|-------|--------|----------|--------|
| `api-doc-agent` | `docs/api/` | External developers | OpenAPI 3.0 + Markdown |
| `adr-agent` | `docs/adr/NNN-title.md` | Internal team | MADR format |
| `runbook-agent` | `docs/runbooks/` | SRE / On-call | Step-by-step with commands |

## ADR Numbering
- ADRs are numbered sequentially: `001`, `002`, `003`...
- Check existing `docs/adr/` directory for the next available number
- ADR status options: `Proposed` | `Accepted` | `Deprecated` | `Superseded by ADR-NNN`

## API Doc Standards
- Every endpoint must document: method, path, auth required, request body, response codes, example
- Mark deprecated endpoints with `deprecated: true` in OpenAPI
- Rate limits must be documented if they exist

## Runbook Standards
- Every runbook must have: Purpose, Prerequisites, Steps (numbered), Rollback procedure, Escalation contacts
- Steps must use exact commands — no "run the deploy script", always show the actual command
- Include expected output so the operator knows if a step succeeded

## Agent Coordination
- Agents run independently — each takes the codebase as input
- `/generate-docs all` runs all three agents sequentially
- `/generate-docs api|adr|runbook` runs only the specified agent
- Never overwrite existing ADRs — create new ones or update status only
