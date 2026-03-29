# Cost Tracker — Project Memory

## Pricing Reference (Claude API — update when pricing changes)
| Model | Input (per 1M tokens) | Output (per 1M tokens) |
|-------|----------------------|------------------------|
| claude-opus-4-6 | $15.00 | $75.00 |
| claude-sonnet-4-6 | $3.00 | $15.00 |
| claude-haiku-4-5 | $0.80 | $4.00 |

## Cost Log Format
Sessions are logged to `.claude/cost-log.jsonl` — one JSON object per line:
```json
{"date":"2025-01-15","session":"pr-review","model":"claude-sonnet-4-6","input_tokens":12400,"output_tokens":3200,"cost_usd":0.0852}
```

## Budget Thresholds
- Daily budget alert: $5.00
- Weekly budget alert: $25.00
- Single session alert: $2.00
- If a session exceeds single-session threshold, log a WARNING in the report

## Report Sections (weekly)
1. **Total spend this week** vs last week (% change)
2. **Spend by workflow** (which recipes cost the most)
3. **Spend by model** (are you using the right model for each task?)
4. **Top 5 most expensive sessions** with context
5. **Optimization recommendations** — specific suggestions to reduce cost

## Hook Behavior
- `track-session-cost.sh` runs on Claude Code session stop
- Reads token usage from Claude Code session metadata
- Appends to `.claude/cost-log.jsonl` (creates file if not exists)
- Sends desktop notification if session cost exceeds threshold
