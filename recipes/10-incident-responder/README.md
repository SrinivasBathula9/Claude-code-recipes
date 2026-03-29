# 🚨 Incident Responder

**Paste error logs → get Root Cause Analysis, fix, and prevention plan. Your AI SRE partner.**

## Architecture

```
┌──────────────────────────────────────────────┐
│  /incident "paste error or describe issue"    │
│         │                                     │
│  ┌──────▼──────────┐                          │
│  │  Triage Agent   │  ← Classify severity     │
│  │                 │  ← Parse error patterns   │
│  └──────┬──────────┘                          │
│         │                                     │
│    ┌────┼──────────┐                          │
│    │    │          │                          │
│  ┌─▼──┐ ┌──▼────┐ ┌──▼──────┐               │
│  │RCA │ │Fix    │ │Prevent  │               │
│  │Agent│ │Agent  │ │Agent    │               │
│  └─┬──┘ └──┬────┘ └──┬──────┘               │
│    │       │          │                       │
│    └───────┼──────────┘                       │
│            │                                  │
│     ┌──────▼───────────┐                      │
│     │ Incident Report  │                      │
│     │ RCA + Fix + Plan │                      │
│     └──────────────────┘                      │
└──────────────────────────────────────────────┘
```

## What It Does

1. **Triage** — Classify severity (P0-P3), identify error type, parse stack traces
2. **Root Cause Analysis** — Trace the error through code, identify the root cause
3. **Fix** — Generate the specific code fix with explanation
4. **Prevention** — Recommend monitoring, tests, and architectural changes to prevent recurrence

## Install

```bash
./install.sh incident-responder /path/to/your-project
```

## Usage

```
# Paste an error
/incident TypeError: Cannot read property 'id' of undefined at UserService.getUser

# Describe an issue
/incident "API returning 500 errors intermittently on /api/orders endpoint"

# Paste a log block
/incident $(cat error.log | tail -50)
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/incident.md` | Slash command entry point |
| `agents/triage-agent.md` | Severity classification and error parsing |
| `agents/rca-agent.md` | Root cause analysis |
| `agents/fix-agent.md` | Code fix generator |
| `agents/prevention-agent.md` | Prevention recommendations |
| `CLAUDE.md` | Incident response standards |
