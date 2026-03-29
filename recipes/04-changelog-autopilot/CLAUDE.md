# Changelog Autopilot — Project Memory

## Commit Convention
This recipe expects conventional commits. Map them as follows:
- `feat:` → Features section
- `fix:` → Bug Fixes section
- `perf:` → Performance section
- `refactor:` → Internal Changes section
- `docs:` → Documentation section
- `chore:`, `ci:`, `build:` → skip (don't appear in user-facing changelog)
- `BREAKING CHANGE:` footer → Breaking Changes section (always at top)

## Changelog Format
```
## [VERSION] — YYYY-MM-DD

### Breaking Changes
### Features
### Bug Fixes
### Performance
### Documentation
```

## Versioning Rules
- Breaking change → bump MAJOR
- New feature → bump MINOR
- Fix/perf only → bump PATCH
- If no version tag exists, default to `v0.1.0`

## Output Files
- `CHANGELOG.md` — append new version block at top (never overwrite history)
- `RELEASE_NOTES.md` — current release only, human-friendly narrative prose
- When run via git hook: auto-stage both files, do not auto-commit

## Hook Behavior
- `post-commit` hook runs after every commit
- Only triggers changelog update when commit message starts with `feat:`, `fix:`, `perf:`, or `BREAKING CHANGE`
- Skips merge commits and revert commits
