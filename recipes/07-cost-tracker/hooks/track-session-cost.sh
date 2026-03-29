#!/bin/bash
# track-session-cost.sh
# Hook: Stop (fires at end of every Claude Code session)
# Appends session cost data to .claude-costs.jsonl

COST_FILE=".claude-costs.jsonl"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
SESSION_ID="${CLAUDE_SESSION_ID:-$(date +%s)}"

# Capture session metadata
ENTRY=$(cat <<EOF
{"timestamp":"${TIMESTAMP}","session_id":"${SESSION_ID}","type":"session_end","note":"Cost data captured at session end. Run /cost-report for analysis."}
EOF
)

echo "$ENTRY" >> "$COST_FILE"
echo "💰 Session cost data saved to ${COST_FILE}"
echo "   Run /cost-report for analysis"
