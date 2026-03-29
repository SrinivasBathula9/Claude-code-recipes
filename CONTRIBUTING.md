# Contributing to Production-Ready Claude Code Recipes

Thank you for your interest in contributing! This guide will help you get started.

## Ways to Contribute

### 🍳 Submit a New Recipe
The best contribution! See [SUBMIT_RECIPE.md](SUBMIT_RECIPE.md) for the template.

### 🐛 Fix Bugs
Found a broken script, wrong path, or typo? Open a PR!

### 📖 Improve Documentation
Better explanations, more examples, clearer architecture diagrams — always welcome.

### ⭐ Star the Repo
Seriously, it helps with discoverability.

## Development Setup

```bash
git clone https://github.com/SrinivasBathula9/prod-ready-claude-code-recipes.git
cd prod-ready-claude-code-recipes
```

## Recipe Standards

Every recipe MUST have:
1. **README.md** — What it does, architecture diagram (Mermaid), install/usage instructions
2. **install.sh** — One-command installer (or use the root `install.sh`)
3. **validate.sh** — Script to verify correct installation
4. **CLAUDE.md** — Project memory for the workflow
5. **At least one slash command** in `.claude/commands/`

Every recipe SHOULD have:
- Architecture diagram (Mermaid) in the README
- At least one subagent in `agents/`
- Real-world use case described
- Expected output format documented

## Commit Convention

Use [Conventional Commits](https://www.conventionalcommits.org/):
- `feat: add new recipe for X`
- `fix: correct path in install.sh`
- `docs: improve PR Guardian README`
- `chore: update .gitignore`

## Pull Request Process

1. Fork the repository
2. Create a branch: `feat/recipe-name` or `fix/description`
3. Make your changes
4. Run `./install.sh` to verify recipes list correctly
5. Submit a PR with a clear description

## Code of Conduct

Be respectful, constructive, and inclusive. We're all here to learn and build.
