#!/bin/bash
# validate.sh — Verify PR Guardian recipe is correctly installed
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

echo "🔍 Validating PR Guardian installation in: $TARGET"
echo ""

check "CLAUDE.md"
check ".claude/commands/pr-review.md"
check ".claude/agents/code-quality-agent.md"
check ".claude/agents/security-agent.md"
check ".claude/agents/performance-agent.md"

echo ""
# Check for gh CLI
if command -v gh &>/dev/null; then
    echo "  ✅ GitHub CLI (gh) is installed"
else
    echo "  ⚠️  GitHub CLI (gh) not found — PR commenting will be skipped"
fi

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ PR Guardian is ready! Run: /pr-review"
else
    echo "❌ $ERRORS file(s) missing. Re-run install.sh"
    exit 1
fi
