---
name: sync-docs
description: Review and update monorepo documentation to reflect recent changes
user-invocable: true
allowed-tools:
  - Read
  - Glob
  - Grep
  - Edit
  - Bash
context: fork
agent: docs-reviewer
---

# Sync Documentation

Review all monorepo documentation files and update them to reflect the current state of the codebase.

## What This Skill Does

1. **Analyses recent changes** - Checks git status and recently modified files
2. **Reviews documentation** - Reads CLAUDE.md, docs/registry/monorepo_analysis.md, and other docs
3. **Identifies discrepancies** - Compares documentation against actual codebase
4. **Updates as needed** - Edits documentation to fix inaccuracies

## Documentation Files Reviewed

- `CLAUDE.md` - Main reference guide
- `docs/registry/monorepo_analysis.md` - Package analysis
- `docs/standards/package_standards.md` - Architecture standards
- `.claude/instructions.md` - Session instructions
- `docs/guides/project_examples.md` - Project configurations
- `docs/registry/event_listeners.md` - Event mappings
- `docs/registry/database_schema.md` - Database structure
- `docs/registry/livewire_components.md` - Component registry
- `docs/registry/routes_overview.md` - Route documentation

## Usage

Run after completing significant work:
- Creating new packages
- Adding agents, skills, or hooks
- Modifying package structure
- Updating tooling or workflows

The agent will automatically determine what needs updating based on the current state of the codebase.
