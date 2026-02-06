---
name: check-deps
description: Analyse package dependencies and find potential issues
argument-hint: "<package-path|--all>"
user-invocable: true
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
context: fork
agent: dependency-analyzer
---

Analyse dependencies for the specified package or the entire monorepo.

**Arguments:** $ARGUMENTS

## Usage

```bash
# Analyse single package
/check-deps crm/contact

# Analyse entire monorepo
/check-deps --all

# Find what depends on a package
/check-deps --reverse core/user
```

## Analysis Types

### Single Package Analysis
- Direct dependencies (bespoke-uk/* packages)
- External dependencies
- Dev dependencies
- Dependency versions

### Reverse Dependency Analysis
Find all packages that depend on the specified package.

### Full Monorepo Analysis
- Circular dependency detection
- Version consistency across packages
- Dependency hierarchy validation
- Unused dependency detection

## What It Checks

1. **Circular Dependencies**
   - A → B → C → A patterns
   - Reports full cycle path

2. **Version Inconsistencies**
   - Same package required with different versions
   - Incompatible constraint conflicts

3. **Hierarchy Violations**
   - CRM depending on CMS (usually wrong)
   - Blade packages with model dependencies
   - Core packages depending on feature packages

4. **Missing Dependencies**
   - Uses namespace but doesn't require package
   - CRUD packages missing bespoke-uk/module

## Output

Reports include:
- Dependency graph summary
- Issues found with severity
- Recommendations for fixes
- Comparison to standard hierarchy
