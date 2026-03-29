# Incident Responder — Project Memory

## 4-Agent Pipeline
1. **Triage Agent** — Classify severity, identify affected systems, estimate blast radius
2. **RCA Agent** — Trace to root cause (not just symptoms), produce timeline
3. **Fix Agent** — Produce minimal surgical fix + rollback procedure
4. **Prevention Agent** — Recommend systemic improvements to prevent recurrence

## Incident Severity Levels
- **SEV-1** — Production down, data loss, security breach → All-hands, fix within 1 hour
- **SEV-2** — Degraded performance, partial outage → Fix within 4 hours
- **SEV-3** — Non-critical feature broken → Fix within 24 hours
- **SEV-4** — Minor issue, workaround available → Fix in next sprint

## RCA Methodology
Use the **5 Whys** technique:
- Why did X fail? → Because Y
- Why did Y happen? → Because Z
- Continue until you reach a systemic/process root cause (not just "the code had a bug")

## Fix Agent Rules
- Minimal change principle: fix the specific bug, nothing else
- Every fix must have a paired rollback procedure
- If the fix requires a database migration: flag it — do not auto-generate migration
- Test the fix mentally against the error scenario before outputting it

## Agent Coordination
- Triage output → Severity + affected systems → passed to RCA Agent
- RCA output → Root cause + timeline → passed to Fix Agent AND Prevention Agent
- Fix + Prevention run in parallel after RCA completes
- Final output: `incident-report-YYYY-MM-DD-HH.md` saved to `docs/incidents/`

## Post-Incident Report Template
- **Summary** (3 sentences max)
- **Timeline** (what happened, when)
- **Root Cause** (5 Whys output)
- **Fix Applied** (with code diff)
- **Prevention Actions** (with owners and due dates)
