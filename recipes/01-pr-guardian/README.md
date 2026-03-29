# 🛡️ PR Guardian

**Multi-agent PR review that auto-comments on GitHub with actionable feedback.**

## Architecture

```
┌────────────────┐
│  /pr-review    │  ← You run this slash command
└───────┬────────┘
        │
┌───────▼────────┐
│  Coordinator   │  ← Reads CLAUDE.md for team standards
└───────┬────────┘
        │
   ┌────┼─────────────┐
   │    │              │
┌──▼──┐ ┌──▼──────┐ ┌──▼──────────┐
│Code │ │Security │ │Performance  │
│Agent│ │Agent    │ │Agent        │
│     │ │(read-  │ │(read-only)  │
│     │ │ only)  │ │             │
└──┬──┘ └──┬─────┘ └──┬──────────┘
   │       │           │
   └───────┼───────────┘
           │
    ┌──────▼───────┐
    │ Merge report │  ← Consolidated review
    │ + GH comment │  ← Posted via GitHub CLI
    └──────────────┘
```

## What It Does

1. Fetches the current PR diff (via `gh` CLI or MCP)
2. Delegates to **3 specialized agents** in parallel:
   - **Code Quality Agent** — style, patterns, DRY, naming
   - **Security Agent** (read-only) — OWASP top 10, secrets, injection
   - **Performance Agent** (read-only) — N+1 queries, memory leaks, complexity
3. Merges findings into a single structured review
4. Posts inline comments on the PR via GitHub CLI
5. Blocks merge if critical issues found (via CI)

## Install

```bash
# From repo root
./install.sh pr-guardian /path/to/your-project

# Or manually
cp -r .claude /path/to/your-project/
cp CLAUDE.md /path/to/your-project/
cp agents/*.md /path/to/your-project/.claude/agents/
```

## Usage

```
# In Claude Code
/pr-review

# Or with a specific PR number
/pr-review #42
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/pr-review.md` | Slash command entry point |
| `agents/code-quality-agent.md` | Code standards reviewer |
| `agents/security-agent.md` | Security vulnerability scanner |
| `agents/performance-agent.md` | Performance issue detector |
| `hooks/post-review.sh` | Posts comments to GitHub |
| `CLAUDE.md` | Team coding standards memory |
| `.github/workflows/pr-guardian.yml` | CI integration |
| `validate.sh` | Verify installation |

## Validate

```bash
./validate.sh /path/to/your-project
```
