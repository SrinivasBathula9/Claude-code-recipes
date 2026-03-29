#!/bin/bash
# validate.sh — Verify Governance Guardrails recipe installation
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

echo "🔍 Validating Governance Guardrails in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/governance-audit.md"
check ".claude/agents/data-governance-agent.md"
check ".claude/agents/fairness-agent.md"
check ".claude/agents/transparency-agent.md"

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ Recipe is ready!"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
