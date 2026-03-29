# 💰 Cost Tracker

**Track token usage per workflow, per subagent, with weekly cost reports. Know your Coordination Tax.**

## Architecture

```
┌──────────────────────────────────┐
│  Every Claude Code session       │
│         │                        │
│  ┌──────▼──────┐                 │
│  │ Stop Hook   │  ← Fires at    │
│  │             │    session end  │
│  └──────┬──────┘                 │
│         │                        │
│  ┌──────▼──────────────┐         │
│  │ Parse session stats │         │
│  │ - Total tokens      │         │
│  │ - Per-agent tokens  │         │
│  │ - Duration          │         │
│  │ - Tool calls        │         │
│  └──────┬──────────────┘         │
│         │                        │
│  ┌──────▼──────────────┐         │
│  │ Append to           │         │
│  │ .claude-costs.jsonl │         │
│  └──────┬──────────────┘         │
│         │                        │
│  ┌──────▼──────────────┐         │
│  │ /cost-report        │         │
│  │ Weekly summary      │         │
│  └─────────────────────┘         │
└──────────────────────────────────┘
```

## Key Metric: Coordination Tax Ratio

```
Coordination Tax = (Orchestration Tokens) / (Total Tokens)

Low CTR (< 20%)  = Efficient multi-agent workflow
High CTR (> 40%) = Too much overhead — simplify your agent chain
```

## Install

```bash
./install.sh cost-tracker /path/to/your-project
```

## Usage

```
# View cost report
/cost-report

# View costs for last 7 days
/cost-report 7d

# View per-agent breakdown
/cost-report agents
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/cost-report.md` | Cost analysis slash command |
| `hooks/track-session-cost.sh` | Session end hook to log costs |
| `scripts/cost-analyzer.py` | Python script to parse and report |
| `CLAUDE.md` | Cost tracking standards |
