# 🏛️ Governance Guardrails

**IMDA Model AI Governance Framework & NIST AI RMF compliance checks as Claude Code hooks.**

> **This is the only open-source implementation of AI governance frameworks as Claude Code workflows.** Built from real-world Government and BFSI deployments in Singapore.

## Why This Exists

Enterprises adopting AI coding assistants face a governance gap:
- Regulators want proof that AI-generated code meets governance standards
- Teams have no automated way to check governance compliance
- Manual reviews are slow and inconsistent

This recipe automates governance checks as part of your Claude Code workflow.

## Architecture

```
┌──────────────────────────────────────────────────┐
│  Any Claude Code action                           │
│         │                                         │
│  ┌──────▼──────────┐                              │
│  │ Governance Hook │  ← Fires on every output     │
│  └──────┬──────────┘                              │
│         │                                         │
│   ┌─────┼──────────────────┐                      │
│   │     │                  │                      │
│ ┌─▼───┐ ┌──▼──────────┐ ┌──▼─────────┐          │
│ │Data │ │Transparency │ │Fairness    │          │
│ │Gov  │ │& Explain.   │ │& Bias      │          │
│ │Agent│ │Agent        │ │Agent       │          │
│ └─┬───┘ └──┬──────────┘ └──┬─────────┘          │
│   │        │               │                     │
│   └────────┼───────────────┘                     │
│            │                                      │
│     ┌──────▼──────────┐                           │
│     │ Compliance      │                           │
│     │ Report          │                           │
│     └─────────────────┘                           │
└──────────────────────────────────────────────────┘
```

## Governance Frameworks Covered

### IMDA Model AI Governance Framework (Singapore)
- **Principle 1:** Internal governance & accountability
- **Principle 2:** Human oversight and control
- **Principle 3:** Operations management (data, models, third-party)
- **Principle 4:** Stakeholder engagement

### NIST AI Risk Management Framework
- **Govern:** Policies, roles, culture
- **Map:** Context, risk identification
- **Measure:** Analysis, metrics, monitoring
- **Manage:** Response, communication

## Install

```bash
./install.sh governance-guardrails /path/to/your-project
```

## Usage

```
# Run governance audit
/governance-audit

# Check specific principle
/governance-audit data-governance

# Generate compliance report
/governance-report
```

## Files

| File | Purpose |
|------|---------|
| `.claude/commands/governance-audit.md` | Governance check slash command |
| `.claude/commands/governance-report.md` | Generate compliance report |
| `agents/data-governance-agent.md` | Data handling compliance checker |
| `agents/transparency-agent.md` | Explainability and transparency checker |
| `agents/fairness-agent.md` | Bias and fairness assessment |
| `hooks/governance-check.sh` | Auto-trigger governance checks |
| `CLAUDE.md` | Governance standards and policies |
