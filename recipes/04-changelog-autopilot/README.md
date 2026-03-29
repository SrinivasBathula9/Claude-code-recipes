# 📝 Changelog Autopilot

**Git commits → auto-generated changelogs, release notes, and version badges.**

## Architecture

```
┌─────────────────┐
│  /changelog      │  ← Or triggered by PostToolUse hook on git commit
└────────┬────────┘
         │
┌────────▼────────┐
│  Parse commits  │  ← git log --oneline with conventional commit parsing
│  since last tag │
└────────┬────────┘
         │
┌────────▼────────┐
│  Categorize     │  ← feat / fix / breaking / docs / chore / perf
└────────┬────────┘
         │
┌────────▼────────────────┐
│  Generate:              │
│  - CHANGELOG.md update  │
│  - RELEASE_NOTES.md     │
│  - Version bump suggest │
└─────────────────────────┘
```

## Install

```bash
./install.sh changelog-autopilot /path/to/your-project
```

## Usage

```
# Generate changelog manually
/changelog

# Generate for a specific version
/changelog v2.1.0

# Auto-trigger: configure the PostToolUse hook for Bash(git commit)
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/changelog.md` | Slash command entry point |
| `hooks/post-commit-changelog.sh` | Auto-trigger on git commit |
| `CLAUDE.md` | Changelog format standards |
