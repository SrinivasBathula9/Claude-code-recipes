# Governance Guardrails — Project Memory

## Compliance Frameworks
This recipe audits against two frameworks simultaneously:
- **IMDA AI Governance Framework v2** (Singapore) — Accountability, human oversight, explainability
- **NIST AI RMF 1.0** — Govern, Map, Measure, Manage functions

## Agent Roles
- `data-governance-agent` — Data lineage, consent, retention, cross-border transfer compliance
- `fairness-agent` — Bias detection in training data, model outputs, and demographic disparities
- `transparency-agent` — Explainability of AI decisions, disclosure requirements, documentation gaps
- All agents are **READ-ONLY** — audit only, never modify source files

## Severity Classification
- **🔴 NON-COMPLIANT** — Violates a mandatory control → Must fix before production deployment
- **🟡 PARTIAL** — Control partially implemented → Remediation plan required within 30 days
- **🟢 COMPLIANT** — Control satisfied — document evidence
- **⚪ NOT APPLICABLE** — Control doesn't apply to this system type

## Audit Trail Requirements
- Every audit run must produce a timestamped report: `governance-audit-YYYY-MM-DD.md`
- Reports accumulate — never overwrite previous audits
- Each finding must reference the specific IMDA/NIST control ID (e.g., `NIST-GOVERN-1.1`)

## Report Audience
- `/governance-audit` → Technical team (detailed findings, code references)
- `/governance-report` → Auditors/regulators (formal language, evidence summaries, sign-off sections)
