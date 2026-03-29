#!/bin/bash
# post-commit-changelog.sh
# Hook: PostToolUse → Bash (when command contains "git commit")
# Auto-generates changelog entry after each commit

COMMIT_MSG=$(git log -1 --pretty=%B 2>/dev/null)

if [[ -z "$COMMIT_MSG" ]]; then
    exit 0
fi

# Parse conventional commit prefix
PREFIX=$(echo "$COMMIT_MSG" | grep -oP '^(feat|fix|perf|docs|refactor|test|chore|build|ci)' || echo "")

if [[ -n "$PREFIX" ]]; then
    echo "📝 Commit detected: [$PREFIX] $COMMIT_MSG"
    echo "💡 Run /changelog to generate updated changelog"
fi
