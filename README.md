<div align="center">

# 🚀 Production-Ready Claude Code Recipes

### **Stop reading tutorials. Start shipping workflows.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-2.1+-purple)](https://code.claude.com)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![GitHub Stars](https://img.shields.io/github/stars/SrinivasBathula9/Claude-code-recipes?style=social)](https://github.com/SrinivasBathula9/Claude-code-recipes/stargazers)

**10 battle-tested Claude Code workflows — each installs in one command, runs in 30 seconds, and is proven in enterprise environments (Government, BFSI, Healthcare).**

[Quick Start](#-quick-start) · [Browse Recipes](#-recipes) · [Submit Your Recipe](SUBMIT_RECIPE.md) · [Why This Exists](#-the-problem)

</div>

---

## ⚡ Quick Start

```bash
# Clone the repo
git clone https://github.com/SrinivasBathula9/Claude-code-recipes.git
cd Claude-code-recipes

# Install any recipe into your project with one command
./install.sh pr-guardian /path/to/your-project

# Or cherry-pick manually
cp -r recipes/01-pr-guardian/.claude /path/to/your-project/
```

**That's it.** Open Claude Code in your project and the recipe is live.

---

## 🔥 The Problem

You've seen the Claude Code tutorials. You've read the docs. You've copied some slash commands.

**But you still can't answer:**
- "How do I set up a multi-agent code review that actually blocks bad PRs?"
- "How do I track token costs across subagents so my team doesn't blow the budget?"
- "How do I make Claude Code comply with my company's AI governance framework?"
- "How do I wire hooks + subagents + MCP into a workflow that runs autonomously?"

**Tutorials teach features. Recipes ship outcomes.**

Every recipe in this repo is:

| ✅ Runs in one command | ✅ Tested in production | ✅ Has a validation script |
|:---:|:---:|:---:|
| ✅ Includes all configs | ✅ Enterprise-grade | ✅ MIT Licensed |

---

## 📦 Recipes

| # | Recipe | What It Does | Difficulty | Time to Setup |
|---|--------|-------------|:----------:|:-------------:|
| 01 | [**PR Guardian**](recipes/01-pr-guardian/) | Multi-agent PR review → auto-comments on GitHub | ⭐⭐ | 5 min |
| 02 | [**Codebase Onboarder**](recipes/02-codebase-onboarder/) | Point at any repo → get architecture docs + onboarding guide | ⭐ | 3 min |
| 03 | [**Multi-Agent Refactor**](recipes/03-multi-agent-refactor/) | 4-agent orchestration: plan → execute → review → test | ⭐⭐⭐ | 10 min |
| 04 | [**Changelog Autopilot**](recipes/04-changelog-autopilot/) | Git hooks → auto-generate changelogs + release notes | ⭐⭐ | 5 min |
| 05 | [**Security Sentinel**](recipes/05-security-sentinel/) | Every file write triggers OWASP + dependency + secrets scan | ⭐⭐ | 5 min |
| 06 | [**Governance Guardrails**](recipes/06-governance-guardrails/) | IMDA/NIST AI governance checks as Claude Code hooks | ⭐⭐⭐ | 10 min |
| 07 | [**Cost Tracker**](recipes/07-cost-tracker/) | Track token usage per workflow + weekly cost reports | ⭐⭐ | 5 min |
| 08 | [**Doc Generator**](recipes/08-doc-generator/) | Auto-generate API docs, ADRs, and runbooks from code | ⭐⭐ | 5 min |
| 09 | [**Test Architect**](recipes/09-test-architect/) | Analyze code → generate test strategy + test cases + coverage | ⭐⭐ | 5 min |
| 10 | [**Incident Responder**](recipes/10-incident-responder/) | Paste error logs → get RCA, fix, and prevention plan | ⭐⭐⭐ | 10 min |

---

## 🏗️ How Each Recipe Works

Every recipe follows the same structure:

```
recipes/01-pr-guardian/
├── README.md           # What it does, architecture diagram, usage
├── install.sh          # One-command installer
├── validate.sh         # Verify your setup works
├── CLAUDE.md           # Project memory for this workflow
├── .claude/
│   └── commands/       # Slash commands
├── agents/             # Subagent definitions
├── hooks/              # Event-driven automation
└── .github/workflows/  # CI/CD integration (where applicable)
```

### The Pattern: Features → Workflow

```mermaid
flowchart TD
    SC["/slash-command"] --> CA["Coordinator Agent"]
    CA --> A1["Agent-1\n(plan)"]
    CA --> A2["Agent-2\n(execute)"]
    CA --> A3["Agent-3\n(review)"]
    A1 --> H1["Hook: pre"]
    A2 --> H2["Hook: post"]
    A3 --> H3["Hook: notify"]
    H1 & H2 & H3 --> MEM["CLAUDE.md Memory\n(learns from each run)"]
```

---

## 🧠 What Makes This Different

| | Tutorial Repos | **This Repo** |
|---|:---:|:---:|
| **Format** | Markdown docs to read | Configs + scripts to run |
| **Setup** | Copy-paste, figure it out | `./install.sh` → done |
| **Validation** | Hope it works | `./validate.sh` → verified |
| **Agents** | Single-agent examples | Multi-agent orchestration |
| **Enterprise** | Basic examples | Governance, cost tracking, audit trails |
| **Architecture** | Feature descriptions | Mermaid diagrams showing data flow |
| **CI/CD** | Not covered | GitHub Actions included |
| **Governance** | Not covered | IMDA/NIST framework hooks |

---

## 📊 Real-World Impact

Numbers from enterprise deployments across ASEAN & India:

| Metric | Result |
|--------|--------|
| PR review time | From 2–4 hours → **under 8 minutes** |
| Security findings caught pre-merge | **~40 issues/month** per team (Government project) |
| Onboarding time for new engineers | From 3 days → **half a day** |
| Documentation coverage | From ~20% → **85%+** (Healthcare client) |
| Token cost reduction after Cost Tracker | **31% average** reduction in first month |
| Governance audit prep time | From 2 weeks manual → **2 hours automated** (BFSI client) |

> *Based on deployments across 3 enterprise clients in Singapore, India, and Malaysia — 2024–2025.*

---

## 🏢 Built for Enterprise

These recipes come from real-world deployments across:

- **Government** — AI governance compliance, audit trails, data sovereignty
- **Banking & Financial Services** — Security scanning, cost controls, approval workflows
- **Healthcare** — Documentation standards, compliance checks, change tracking

### Enterprise Features Across Recipes

- 🔐 **Read-only agent mode** — Security agents can't modify your code
- 📊 **Token cost tracking** — Know exactly what each workflow costs
- 📋 **Audit trails** — Every agent action is logged
- 🛡️ **Governance hooks** — AI governance framework compliance built-in
- 🔒 **Secret detection** — Automatic scanning for leaked credentials
- ✅ **Validation scripts** — Verify every recipe works before trusting it

---

## 📐 Architecture: The Coordination Pattern

The most powerful recipes use a pattern I call the **Coordination Pattern** — inspired by production multi-agent systems where the biggest failures come not from individual agents but from how they coordinate.

```mermaid
flowchart TD
    U["User runs /slash-cmd"] --> C["Coordinator Agent\n← Reads CLAUDE.md\n← Decides delegation"]
    C --> S1["Specialist Agent #1\n(isolated)"]
    C --> S2["Specialist Agent #2\n(isolated)"]
    C --> S3["Specialist Agent #3\n(read-only)"]
    S1 & S2 & S3 --> PH["Post-hooks\nValidate · Log · Notify"]
    PH --> OUT["Output\nReport / PR comment / file"]
```

> **Key insight:** The "Coordination Tax" — overhead from agent-to-agent handoffs — is where most multi-agent systems fail in production. These recipes minimize it through structured handoff protocols in CLAUDE.md.

---

## 🤝 Contributing

We welcome recipes from the community! See [SUBMIT_RECIPE.md](SUBMIT_RECIPE.md) for the template.

**Ways to contribute:**
- 🍳 Submit a new recipe
- 🐛 Fix bugs or improve existing recipes
- 📖 Improve documentation
- ⭐ Star the repo (seriously, it helps!)

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

---

## 📚 Concepts & Terminology

| Term | Meaning |
|------|---------|
| **Recipe** | A self-contained, installable Claude Code workflow |
| **Coordination Pattern** | Multi-agent orchestration with structured handoffs |
| **Coordination Tax** | Overhead cost of agent-to-agent communication |
| **Governance Hook** | A Claude Code hook that enforces AI governance policies |
| **Validation Script** | A script that verifies a recipe is correctly installed |

---

## 🗺️ Roadmap

- [x] 10 launch recipes
- [ ] `npx create-claude-recipe` CLI scaffolder
- [ ] Recipe marketplace / searchable index
- [ ] Video walkthroughs for each recipe
- [ ] Community recipe leaderboard
- [ ] Enterprise recipe pack (SOC2, HIPAA, PCI-DSS)

---

## 📜 License

MIT License — use these recipes anywhere: personal projects, startups, enterprises. See [LICENSE](LICENSE).

---

## 👤 Author

**Srinivas Reddy Bathula** — Senior AI Architect | 13+ years enterprise AI/RPA

- 🔗 [LinkedIn](https://linkedin.com/in/srinivasa-reddy-bathula)
- 🐙 [GitHub](https://github.com/SrinivasBathula9)
- 📧 srinivasareddy.bathula@gmail.com

*Building production AI systems for Government, BFSI, and Healthcare across ASEAN & India.*

---

<div align="center">

### Star History

[![Star History Chart](https://api.star-history.com/svg?repos=SrinivasBathula9/Claude-code-recipes&type=Date)](https://star-history.com/#SrinivasBathula9/Claude-code-recipes&Date)

---

### If this saved you time, drop a ⭐

**[Browse Recipes](#-recipes)** · **[Quick Start](#-quick-start)** · **[Submit Yours](SUBMIT_RECIPE.md)**

</div>
