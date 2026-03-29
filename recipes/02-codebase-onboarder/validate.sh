#!/bin/bash
# validate.sh — Verify Codebase Onboarder recipe installation
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

echo "🔍 Validating Codebase Onboarder in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/onboard.md"
check ".claude/agents/analyzer-agent.md"
check ".claude/agents/writer-agent.md"

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ Recipe is ready!"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
