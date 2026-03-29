#!/bin/bash
# validate.sh — Verify Security Sentinel recipe installation
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

echo "🔍 Validating Security Sentinel in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/security-scan.md"
check ".claude/agents/secrets-agent.md"
check ".claude/agents/security-scanner-agent.md"

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ Recipe is ready!"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
