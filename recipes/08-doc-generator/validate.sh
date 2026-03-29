#!/bin/bash
# validate.sh — Verify Doc Generator recipe installation
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

echo "🔍 Validating Doc Generator in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/generate-docs.md"
check ".claude/agents/adr-agent.md"
check ".claude/agents/api-doc-agent.md"
check ".claude/agents/runbook-agent.md"

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ Recipe is ready!"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
