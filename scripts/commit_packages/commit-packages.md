# Commit Packages Script

Instructions for Claude Code when batch committing changes across multiple packages.

## Overview

The `commit-packages.sh` script automates staging and committing changes across all packages listed in `./scripts/package-list.txt`. It intelligently detects the type of changes and generates appropriate commit messages.

## Quick Start

```bash
# Preview what would be committed (recommended first step)
./scripts/commit-packages/commit-packages.sh --dry-run

# Commit all changes with auto-detected messages
./scripts/commit-packages/commit-packages.sh

# Commit all changes with a custom message
./scripts/commit-packages/commit-packages.sh -m "Your commit message here"

# Verbose output showing all file changes
./scripts/commit-packages/commit-packages.sh -v
```

## Options

| Flag | Description |
|------|-------------|
| `-d, --dry-run` | Preview changes without committing |
| `-m, --message` | Use a custom commit message for all packages |
| `-v, --verbose` | Show detailed output including file changes |
| `-h, --help` | Display help information |

## Auto-Detected Commit Messages

The script analyses changed files and generates appropriate messages:

| Changed Files | Commit Message |
|---------------|----------------|
| New `CHANGELOG.md` | Add CHANGELOG.md with version history |
| Modified `CHANGELOG.md` only | Update CHANGELOG.md with version history and changelog format |
| `CLAUDE.md`, `ARCHITECTURE.md`, `.cursorrules`, `copilot-instructions.md` | Add AI context documentation |
| `composer.json` only | Update composer.json dependencies |
| `migrations/` | Update database migrations |
| `src/` + `tests/` | Update source code and tests |
| `src/` only | Update source code |
| `tests/` only | Update tests |
| `config/` | Update package configuration |
| `rector.php`, `phpstan*` | Update code quality tooling configuration |
| `README.md` | Update README documentation |
| Other | Update package files |

## When to Use This Script

Use this script when:
- Making bulk documentation updates (CHANGELOG, README, AI context files)
- Updating dependencies across packages
- Applying code quality tool configurations
- Any batch changes that affect multiple packages similarly

## Claude Code Instructions

When asked to commit changes across packages:

1. **First, check what needs committing:**
   ```bash
   ./scripts/commit-packages/commit-packages.sh --dry-run
   ```

2. **If all changes are similar** (e.g., all CHANGELOG updates), run without custom message:
   ```bash
   ./scripts/commit-packages/commit-packages.sh
   ```

3. **If changes are varied but related** (e.g., a specific feature rollout), use a custom message:
   ```bash
   ./scripts/commit-packages/commit-packages.sh -m "Add feature X across all packages"
   ```

4. **Verify commits succeeded** by checking a few packages:
   ```bash
   cd /Users/stuart/Packages/bespoke/api/brevo && git log -1 --oneline
   ```

## Notes

- All commits include the co-author attribution: `Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>`
- The script only processes packages listed in `package-list.txt`
- Packages without changes are automatically skipped
- Each package is treated as a separate git repository
