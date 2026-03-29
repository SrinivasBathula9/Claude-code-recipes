# 🗺️ Codebase Onboarder

**Point at any repo → get architecture docs, dependency map, and an onboarding guide in 60 seconds.**

## Architecture

```
┌──────────────────┐
│  /onboard        │  ← One slash command
└────────┬─────────┘
         │
┌────────▼─────────┐
│  Analyzer Agent   │
│  - File tree scan │
│  - Dependency map │
│  - Entry points   │
└────────┬─────────┘
         │
┌────────▼─────────┐
│  Writer Agent     │
│  - Architecture   │
│    diagram        │
│  - "Start here"   │
│    guide          │
│  - Key files map  │
└────────┬─────────┘
         │
┌────────▼─────────┐
│  Output:          │
│  ONBOARDING.md    │
└──────────────────┘
```

## What It Does

1. Scans the project structure (file tree, package files, config files)
2. Identifies the tech stack, frameworks, entry points, and key patterns
3. Generates a Mermaid architecture diagram
4. Creates an `ONBOARDING.md` with:
   - Project overview and purpose
   - Architecture diagram
   - Key files and what they do
   - How to run the project
   - Where to start reading code
   - Common patterns used in the codebase

## Install

```bash
./install.sh codebase-onboarder /path/to/your-project
```

## Usage

```
# In Claude Code
/onboard
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/onboard.md` | Slash command entry point |
| `agents/analyzer-agent.md` | Codebase structure analyzer |
| `agents/writer-agent.md` | Documentation writer |
| `CLAUDE.md` | Onboarding generation standards |
