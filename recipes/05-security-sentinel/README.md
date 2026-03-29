# 🔒 Security Sentinel

**Every file write triggers OWASP + dependency + secrets scanning. Zero-config security layer.**

## Architecture

```
┌──────────────────────────────────────────┐
│  Claude Code writes a file               │
│         │                                │
│  ┌──────▼──────┐                         │
│  │ PostToolUse │  ← Hook fires on Write  │
│  │   Hook      │                         │
│  └──────┬──────┘                         │
│         │                                │
│    ┌────┼────────────┐                   │
│    │    │            │                   │
│  ┌─▼──┐ ┌──▼────┐ ┌──▼──────┐          │
│  │Sec │ │Secrets│ │Dependency│          │
│  │Scan│ │Scan   │ │Audit     │          │
│  └─┬──┘ └──┬────┘ └──┬──────┘          │
│    │       │          │                  │
│    └───────┼──────────┘                  │
│            │                             │
│     ┌──────▼──────┐                      │
│     │  BLOCK or   │                      │
│     │  WARN       │                      │
│     └─────────────┘                      │
└──────────────────────────────────────────┘
```

## Install

```bash
./install.sh security-sentinel /path/to/your-project
```

## Usage

```
# Automatic — runs on every file write via hooks
# Or manually:
/security-scan

# Scan specific file:
/security-scan src/api/auth.py
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/security-scan.md` | Manual scan slash command |
| `agents/security-scanner-agent.md` | OWASP + code security agent (read-only) |
| `agents/secrets-agent.md` | Secret/credential detection agent |
| `hooks/scan-on-write.sh` | PostToolUse hook for auto-scanning |
| `CLAUDE.md` | Security standards and severity definitions |
