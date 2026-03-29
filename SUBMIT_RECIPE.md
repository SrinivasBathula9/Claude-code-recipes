# 🍳 Submit a Recipe

Want to share your Claude Code workflow with the community? Follow this template!

## Recipe Template

Create a folder under `recipes/` with this structure:

```
recipes/XX-your-recipe-name/
├── README.md              # Required
├── install.sh             # Optional (root install.sh handles most cases)
├── validate.sh            # Required
├── CLAUDE.md              # Required
├── .claude/
│   └── commands/
│       └── your-command.md  # Required (at least one)
├── agents/                # Recommended
│   └── your-agent.md
└── hooks/                 # Optional
    └── your-hook.sh
```

## README Template

```markdown
# [Emoji] Recipe Name

**One-sentence description of what this recipe does.**

## Architecture

\`\`\`
[Mermaid or ASCII diagram showing the workflow]
\`\`\`

## What It Does

[3-5 bullet points]

## Install

\`\`\`bash
./install.sh recipe-name /path/to/your-project
\`\`\`

## Usage

\`\`\`
/your-command
\`\`\`

## Files

| File | Purpose |
|------|---------|
| ... | ... |
```

## Checklist Before Submitting

- [ ] Recipe has a clear, single purpose
- [ ] README includes architecture diagram
- [ ] All agents have defined roles and output formats
- [ ] validate.sh checks all required files exist
- [ ] No hardcoded paths or credentials
- [ ] Tested with Claude Code 2.1+
- [ ] MIT license compatible

## Submit

1. Fork this repo
2. Create your recipe following the template above
3. Open a PR with the title: `feat: add [recipe-name] recipe`
4. Describe what problem your recipe solves

We'll review, provide feedback, and merge! Your name will appear in the contributors section.
