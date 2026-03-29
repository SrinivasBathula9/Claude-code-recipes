# /onboard — Generate Codebase Onboarding Guide

Analyze the current project and generate a comprehensive onboarding guide.

## Instructions

1. **Scan the project structure:**
   ```bash
   find . -type f -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/venv/*' -not -path '*/__pycache__/*' | head -200
   ```

2. **Identify the tech stack:**
   - Check `package.json`, `requirements.txt`, `Cargo.toml`, `go.mod`, `pom.xml`, `Gemfile`
   - Identify frameworks (React, FastAPI, Django, Express, Spring, etc.)
   - Find config files (`.env.example`, `docker-compose.yml`, `Dockerfile`, CI configs)

3. **Delegate to Analyzer Agent** (`analyzer-agent`):
   - Map the directory structure to architectural layers
   - Identify entry points (main files, API routes, CLI entry)
   - Find key configuration files
   - Identify design patterns used

4. **Delegate to Writer Agent** (`writer-agent`):
   - Generate a Mermaid architecture diagram
   - Write the onboarding guide in clear, welcoming language
   - Include "start here" pointers for new developers

5. **Output:** Create `ONBOARDING.md` in the project root with:

   ```markdown
   # 🗺️ Project Onboarding Guide
   
   ## Overview
   [What this project does, in 2-3 sentences]
   
   ## Architecture
   [Mermaid diagram]
   
   ## Tech Stack
   [List with versions]
   
   ## Key Files
   [Table: file → what it does → when you'd change it]
   
   ## Getting Started
   [Step-by-step: clone, install, run, test]
   
   ## Where to Start Reading Code
   [Ordered list of files to read first]
   
   ## Common Patterns
   [Patterns used in this codebase with examples]
   ```
