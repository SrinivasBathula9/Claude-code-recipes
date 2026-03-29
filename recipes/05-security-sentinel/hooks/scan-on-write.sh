#!/bin/bash
# scan-on-write.sh
# Hook: PostToolUse → Write
# Quick secret scan on every file write

FILE="$1"

if [[ -z "$FILE" ]]; then
    exit 0
fi

# Quick check for common secret patterns
SECRETS_FOUND=$(grep -c -iE '(AKIA[0-9A-Z]{16}|password\s*[:=]\s*["\x27][^\s"]{8,}|BEGIN\s+(RSA\s+)?PRIVATE\s+KEY)' "$FILE" 2>/dev/null || echo "0")

if [[ "$SECRETS_FOUND" -gt 0 ]]; then
    echo "🚨 SECURITY ALERT: Potential secrets detected in $FILE"
    echo "   Run /security-scan $FILE for full analysis"
    echo "   ⚠️  DO NOT commit this file until secrets are removed"
    exit 1
fi

exit 0
