#!/bin/bash
# validate.sh — Verify Multi Agent Refactor recipe installation
set -euo pipefail

TARGET="${1:-.}"
ERRORS=0

check() {
    if [[ -e "$TARGET/$1" ]]; then
        echo "  ✅ $1"
    else
        echo "  ❌ $1 — MISSING"
        ((ERRORS++))
    fi
}

echo "🔍 Validating Multi Agent Refactor in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/refactor.md"
check ".claude/agents/executor-agent.md"
check ".claude/agents/planner-agent.md"
check ".claude/agents/reviewer-agent.md"
check ".claude/agents/tester-agent.md"

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ Recipe is ready!"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
