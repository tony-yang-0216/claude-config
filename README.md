# Claude Config

A centralized configuration management repository for [Claude Code](https://claude.com/claude-code) — Anthropic's official CLI tool. Manage global rules, permissions, and reusable slash commands across multiple projects and devices.

## Why This Repo?

- **Unified Standards**: Define coding style, naming conventions, and error handling rules once
- **Reusable Commands**: Pre-built slash commands for code review, test generation, PR descriptions, and more
- **Security Controls**: Permission management to protect sensitive files and prevent dangerous operations
- **Multi-device Sync**: Git-based configuration that works across Mac/Linux/Windows

## Repository Structure

```
claude-config/
├── global-config/                 # Cross-project configurations (~/.claude/)
│   ├── CLAUDE.md                 # Global engineering rules
│   ├── settings.json             # Model preferences & global permissions
│   └── commands/                 # Global slash commands
│       ├── explain.md            # Code review analysis
│       ├── gentest.md            # Unit test generation
│       ├── commit.md             # Standardized git commits
│       └── init-repo.md          # New project initialization
│
└── project-config/                # Project-specific configurations (.claude/)
    ├── settings.json             # Project permissions (allow/deny/ask)
    └── commands/                 # Project-specific slash commands
        ├── pr-desc.md            # PR description generator
        ├── onboard.md            # Project onboarding guide
        ├── bug.md                # Bug diagnosis & RCA
        ├── task.md               # Task analysis & planning
        └── review.md             # Senior code review
```

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/tony-yang-0216/claude-config.git
cd claude-config
```

### 2. Apply Global Configuration

Copy global configs to your Claude Code home directory:

```bash
# Create ~/.claude if not exists
mkdir -p ~/.claude/commands

# Copy global configuration
cp global-config/CLAUDE.md ~/.claude/
cp global-config/settings.json ~/.claude/
cp global-config/commands/*.md ~/.claude/commands/
```

### 3. Apply Project Configuration

For each project, copy project-level configs:

```bash
# In your project root
mkdir -p .claude/commands

cp /path/to/claude-config/project-config/settings.json .claude/
cp /path/to/claude-config/project-config/commands/*.md .claude/commands/
```

## Available Slash Commands

### Global Commands (Available Everywhere)

| Command | Description |
|---------|-------------|
| `/explain` | Analyze code following Google Engineering Practices |
| `/gentest` | Generate pytest unit tests with AAA pattern |
| `/commit` | Create standardized git commits (Conventional Commits) |
| `/init-repo` | Initialize CLAUDE.md and ARCHITECTURE.md for new projects |

### Project Commands (Project-Specific)

| Command | Description |
|---------|-------------|
| `/pr-desc` | Generate PR description from branch diff |
| `/onboard` | Three-phase project onboarding workflow |
| `/bug` | Diagnose bugs with root cause analysis |
| `/task` | Analyze requirements and create implementation plan |
| `/review` | Senior-level code review on staged changes |

## Configuration Details

### Global Settings (`global-config/settings.json`)

```json
{
  "preferences": {
    "defaultModel": "sonnet",
    "theme": "dark"
  },
  "permissions": {
    "deny": [
      "Read(~/.ssh/**)",
      "Read(~/.aws/**)",
      "Read(~/.kube/**)"
    ]
  }
}
```

### Project Settings (`project-config/settings.json`)

Permission levels:
- **allow**: Operations permitted without asking
- **deny**: Operations always blocked
- **ask**: Operations requiring user confirmation

```json
{
  "permissions": {
    "allow": ["Read", "Grep", "Bash(npm run lint)"],
    "deny": ["Read(.env*)", "Bash(rm -rf *)"],
    "ask": ["WebFetch", "Bash(npm install)"]
  }
}
```

## Customization

### Add a New Global Command

Create a markdown file in `global-config/commands/`:

```bash
# global-config/commands/my-command.md
echo "Your prompt template here" > global-config/commands/my-command.md
```

### Add a Project-Specific Command

Create a markdown file in `project-config/commands/`:

```bash
# project-config/commands/deploy.md
echo "Deployment workflow prompt" > project-config/commands/deploy.md
```

### Modify Global Rules

Edit `global-config/CLAUDE.md` to adjust:
- Response language and style
- Coding conventions (naming, async handling)
- Execution rules (auto-approve vs. confirmation required)
- Tech stack context

## Tech Stack Context (Default)

The default configuration is optimized for:

| Category | Technologies |
|----------|--------------|
| Backend | FastAPI, Django, Redis |
| Infrastructure | EKS, Kubernetes, Helm, Prometheus |
| Authentication | Auth0, Keycloak |
| Tooling | Azure, MS Teams, Notion |

Modify `global-config/CLAUDE.md` to match your tech stack.

## Security Notes

The default configuration denies access to:
- SSH keys (`~/.ssh/**`)
- AWS credentials (`~/.aws/**`)
- Kubernetes configs (`~/.kube/**`)
- Docker configs (`~/.docker/**`)
- GPG keys (`~/.gnupg/**`)
- Environment files (`.env*`, `secrets/`)

## License

MIT License - see [LICENSE](LICENSE) for details.

## Contributing

1. Fork this repository
2. Create a feature branch
3. Add or modify commands/configurations
4. Submit a pull request

---

**Maintained by**: Tony Yang
**Claude Code**: https://claude.com/claude-code
