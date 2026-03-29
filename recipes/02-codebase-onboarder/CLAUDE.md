# Codebase Onboarder — Project Memory

## Workflow Overview
This recipe uses a 2-agent pipeline:
1. **Analyzer Agent** — Maps architecture, entry points, data flows, dependencies
2. **Writer Agent** — Converts analysis into a human-friendly `ONBOARDING.md`

## Output Standards
- Final output is always `ONBOARDING.md` committed at the repo root
- Diagrams must use Mermaid syntax (not ASCII) — they render on GitHub
- Every section must include copy-paste-ready commands
- "Getting started in 5 minutes" section is mandatory

## Analyzer Scope Rules
- Always identify: entry points, config files, environment variables required
- Always map: external services the codebase depends on
- Always note: test commands, build commands, deploy commands
- Flag: undocumented env vars, missing README sections, broken setup instructions

## Writer Tone Rules
- Write for a developer who is joining the team TODAY
- Assume they know their language but not this codebase
- Never use "simply" or "just" — these are condescending
- Include a "Common Pitfalls" section based on what the Analyzer flags as confusing

## Agent Coordination
- Analyzer output → structured JSON-like document (not prose)
- Writer receives Analyzer output as context before generating ONBOARDING.md
- If Analyzer cannot determine something, Writer marks it as `[TODO: confirm with team]`
