# /cost-report — Token Usage & Cost Analysis

Analyze Claude Code token usage and generate a cost report.

## Arguments
`$ARGUMENTS` — Optional: `7d` (last 7 days), `30d` (last 30 days), `agents` (per-agent breakdown), or `all` (default).

## Instructions

1. **Read cost log file:**
   ```bash
   cat .claude-costs.jsonl 2>/dev/null || echo "No cost data yet. The cost tracker hook must run first."
   ```

2. **If no cost log exists**, analyze the current session instead:
   - Count approximate tokens from conversation history
   - Identify which subagents were used
   - Estimate cost based on Claude model pricing

3. **Calculate metrics:**
   - **Total tokens** (input + output) per session
   - **Per-agent breakdown** if subagents were used
   - **Coordination Tax Ratio** = orchestration tokens / total tokens
   - **Cost estimate** based on current Claude API pricing
   - **Trend** compared to previous period

4. **Generate report:**

   ```markdown
   ## 💰 Claude Code Cost Report
   
   **Period:** [date range]
   **Total sessions:** [count]
   
   ### Summary
   | Metric | Value |
   |--------|-------|
   | Total tokens | X |
   | Estimated cost | $X.XX |
   | Avg tokens/session | X |
   | Coordination Tax Ratio | X% |
   
   ### Per-Agent Breakdown
   | Agent | Tokens | % of Total | Cost |
   |-------|--------|-----------|------|
   | Main | X | X% | $X.XX |
   | Agent 1 | X | X% | $X.XX |
   | Agent 2 | X | X% | $X.XX |
   
   ### Coordination Tax Analysis
   - CTR: X% → [EFFICIENT / MODERATE / HIGH OVERHEAD]
   - Recommendation: [optimization suggestion]
   
   ### Trend
   - vs last period: [+/-X%]
   - Projected monthly cost: $X.XX
   ```
