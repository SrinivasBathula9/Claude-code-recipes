# 🍽️ Recipe Cookbook

Quick reference: find the right recipe for your problem.

## By Problem

| I need to... | Recipe | Command |
|---|---|---|
| Review PRs automatically | [PR Guardian](recipes/01-pr-guardian/) | `/pr-review` |
| Onboard to a new codebase | [Codebase Onboarder](recipes/02-codebase-onboarder/) | `/onboard` |
| Safely refactor large modules | [Multi-Agent Refactor](recipes/03-multi-agent-refactor/) | `/refactor` |
| Auto-generate changelogs | [Changelog Autopilot](recipes/04-changelog-autopilot/) | `/changelog` |
| Scan for security issues | [Security Sentinel](recipes/05-security-sentinel/) | `/security-scan` |
| Comply with AI governance | [Governance Guardrails](recipes/06-governance-guardrails/) | `/governance-audit` |
| Track Claude Code costs | [Cost Tracker](recipes/07-cost-tracker/) | `/cost-report` |
| Generate project documentation | [Doc Generator](recipes/08-doc-generator/) | `/generate-docs` |
| Create a test suite from scratch | [Test Architect](recipes/09-test-architect/) | `/test-architect` |
| Debug and fix production errors | [Incident Responder](recipes/10-incident-responder/) | `/incident` |

## By Claude Code Feature

| Feature | Recipes That Use It |
|---------|-------------------|
| **Slash Commands** | All recipes |
| **Subagents** | PR Guardian, Multi-Agent Refactor, Doc Generator, Test Architect, Incident Responder |
| **Hooks** | Security Sentinel, Changelog Autopilot, Governance Guardrails, Cost Tracker |
| **CLAUDE.md Memory** | All recipes |
| **Read-Only Agents** | PR Guardian (security, perf), Multi-Agent Refactor (reviewer), Security Sentinel |
| **CI/CD Integration** | PR Guardian (GitHub Actions) |
| **Headless Mode** | PR Guardian (CI), Cost Tracker |

## By Difficulty

| Level | Recipes |
|-------|---------|
| ⭐ Beginner | Codebase Onboarder |
| ⭐⭐ Intermediate | PR Guardian, Changelog Autopilot, Security Sentinel, Cost Tracker, Doc Generator, Test Architect |
| ⭐⭐⭐ Advanced | Multi-Agent Refactor, Governance Guardrails, Incident Responder |

## Combine Recipes

Recipes work together! Some powerful combinations:

1. **Full CI Pipeline:** PR Guardian + Security Sentinel + Changelog Autopilot
2. **New Project Setup:** Codebase Onboarder + Doc Generator + Test Architect
3. **Enterprise Compliance:** Governance Guardrails + Security Sentinel + Cost Tracker
4. **Incident Workflow:** Incident Responder + Test Architect (generate tests for the bug)
5. **Safe Refactoring:** Multi-Agent Refactor + Security Sentinel + PR Guardian
