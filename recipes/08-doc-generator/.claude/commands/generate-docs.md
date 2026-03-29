# /generate-docs — Auto-Generate Project Documentation

Analyze the codebase and generate comprehensive documentation.

## Arguments
`$ARGUMENTS` — Optional: `api`, `adr`, `runbook`, or `all` (default).

## Instructions

1. **Scan the codebase for documentable components:**
   ```bash
   # Find API routes/endpoints
   grep -rn -iE '(@app\.(get|post|put|delete|patch)|router\.(get|post|put|delete|patch)|@(Get|Post|Put|Delete)Mapping|app\.(get|post|put|delete))' --include='*.{py,js,ts,java,go}' | head -50

   # Find classes and main functions
   grep -rn -E '(^class |^def |^function |^export (default )?(function|class)|^pub fn )' --include='*.{py,js,ts,java,go,rs}' | head -50

   # Find config and env files
   find . -name '*.env*' -o -name 'docker-compose*' -o -name 'Dockerfile' -o -name '*.yml' -o -name '*.yaml' | grep -v node_modules | grep -v .git | head -20
   ```

2. **Delegate based on $ARGUMENTS:**

   **API Doc Agent** (`api-doc-agent`):
   - Document every API endpoint
   - Include method, path, params, headers, auth
   - Generate request/response examples
   - Note rate limits if configured
   - Output: `docs/API.md`

   **ADR Agent** (`adr-agent`):
   - Identify architectural decisions from code patterns
   - Framework choice, database selection, auth strategy, deployment model
   - Write ADRs in standard format (Title, Status, Context, Decision, Consequences)
   - Output: `docs/adr/NNNN-title.md`

   **Runbook Agent** (`runbook-agent`):
   - Generate deployment runbook from Dockerfile/docker-compose/CI configs
   - Create monitoring runbook from logging/metrics code
   - Create incident response runbook
   - Output: `docs/RUNBOOK.md`

3. **Create docs/ directory structure:**
   ```
   docs/
   ├── API.md
   ├── RUNBOOK.md
   └── adr/
       ├── 0001-framework-choice.md
       └── 0002-database-selection.md
   ```
