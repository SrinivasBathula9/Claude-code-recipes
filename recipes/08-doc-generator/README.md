# 📖 Doc Generator

**Auto-generate API docs, Architecture Decision Records (ADRs), and runbooks from your code.**

## Architecture

```
┌──────────────────┐
│  /generate-docs  │
└────────┬─────────┘
         │
┌────────▼─────────┐
│  Code Analyzer   │  ← Scans functions, classes, routes
└────────┬─────────┘
         │
    ┌────┼────────────┐
    │    │             │
┌───▼──┐ ┌──▼──────┐ ┌──▼────────┐
│ API  │ │  ADR    │ │ Runbook   │
│ Docs │ │ Writer  │ │ Writer    │
│Agent │ │ Agent   │ │ Agent     │
└───┬──┘ └──┬──────┘ └──┬────────┘
    │       │            │
    ▼       ▼            ▼
 API.md  docs/adr/   RUNBOOK.md
```

## What It Generates

1. **API Documentation** — Every endpoint with method, params, request/response examples, auth requirements
2. **ADRs** — Architecture Decision Records for significant design choices found in the code
3. **Runbooks** — Operational runbooks for deployment, monitoring, incident response

## Install

```bash
./install.sh doc-generator /path/to/your-project
```

## Usage

```
# Generate all docs
/generate-docs

# Generate specific type
/generate-docs api
/generate-docs adr
/generate-docs runbook
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/generate-docs.md` | Slash command entry point |
| `agents/api-doc-agent.md` | API documentation generator |
| `agents/adr-agent.md` | Architecture Decision Record writer |
| `agents/runbook-agent.md` | Operational runbook writer |
| `CLAUDE.md` | Documentation standards |
