# /governance-audit — AI Governance Compliance Check

Run an AI governance compliance audit against IMDA and NIST frameworks.

## Arguments
`$ARGUMENTS` — Optional focus area: `data-governance`, `transparency`, `fairness`, or `all` (default).

## Instructions

1. **Scan the project for AI/ML components:**
   ```bash
   # Find AI-related code
   grep -rn -l -iE '(model|predict|inference|embedding|llm|openai|anthropic|bedrock|vertex)' --include='*.{py,js,ts,java}' | head -20
   
   # Find data processing
   grep -rn -l -iE '(dataframe|dataset|csv|parquet|training|preprocessing)' --include='*.{py,js,ts,java}' | head -20
   ```

2. **Delegate to governance agents based on $ARGUMENTS:**

   **Data Governance Agent** (`data-governance-agent`):
   - Check PII handling and anonymization
   - Verify data retention policies are coded
   - Check consent mechanisms for data collection
   - Verify data lineage tracking
   - Check for data sovereignty compliance

   **Transparency Agent** (`transparency-agent`):
   - Check for model documentation (model cards)
   - Verify logging of AI decisions
   - Check for explainability mechanisms
   - Verify human-readable output formatting
   - Check disclosure requirements

   **Fairness Agent** (`fairness-agent`):
   - Check for bias in training data references
   - Verify fairness metrics are tracked
   - Check for protected attribute handling
   - Verify testing across demographic groups

3. **Generate compliance report:**

   ```markdown
   ## 🏛️ AI Governance Audit Report
   
   **Framework:** IMDA Model AI Governance + NIST AI RMF
   **Date:** [timestamp]
   **Project:** [project name]
   
   ### Compliance Summary
   | Principle | Status | Score |
   |-----------|--------|-------|
   | Data Governance | ✅/⚠️/❌ | X/10 |
   | Transparency | ✅/⚠️/❌ | X/10 |
   | Fairness | ✅/⚠️/❌ | X/10 |
   | Human Oversight | ✅/⚠️/❌ | X/10 |
   
   ### Findings
   [Detailed findings per principle]
   
   ### Recommendations
   [Prioritized action items]
   
   ### Evidence
   [File references supporting findings]
   ```
