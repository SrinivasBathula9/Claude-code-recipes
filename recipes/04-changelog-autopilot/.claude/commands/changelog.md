# /changelog — Auto-Generate Changelog & Release Notes

Parse git commits and generate a structured changelog.

## Arguments
`$ARGUMENTS` — Optional version tag (e.g., `v2.1.0`). If omitted, generates for unreleased changes.

## Instructions

1. **Get the last tag:**
   ```bash
   LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
   ```

2. **Get commits since last tag:**
   ```bash
   if [ -n "$LAST_TAG" ]; then
     git log ${LAST_TAG}..HEAD --oneline --no-merges
   else
     git log --oneline --no-merges -50
   fi
   ```

3. **Parse commits using Conventional Commits format:**
   - `feat:` → ✨ New Features
   - `fix:` → 🐛 Bug Fixes
   - `perf:` → ⚡ Performance
   - `docs:` → 📖 Documentation
   - `refactor:` → ♻️ Refactoring
   - `test:` → 🧪 Tests
   - `chore:` → 🔧 Maintenance
   - `BREAKING CHANGE:` or `!:` → 💥 Breaking Changes

4. **Determine version bump:**
   - Has `BREAKING CHANGE` → MAJOR
   - Has `feat` → MINOR
   - Only `fix`/`chore`/`docs` → PATCH

5. **Generate CHANGELOG.md update** (prepend to existing):

   ```markdown
   ## [VERSION] - YYYY-MM-DD

   ### 💥 Breaking Changes
   - description (#PR)

   ### ✨ New Features
   - description (#PR)

   ### 🐛 Bug Fixes
   - description (#PR)

   ### ⚡ Performance
   - description (#PR)

   ### 📖 Documentation
   - description (#PR)
   ```

6. **Generate RELEASE_NOTES.md** (overwrite):
   - Human-readable summary of what changed and why
   - Migration guide for breaking changes
   - Highlights for notable features

7. **Suggest version bump** to the user.
