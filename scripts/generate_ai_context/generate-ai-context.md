# AI Context Generation Guide

This document describes the process for generating AI context files for Bespoke packages.

## Files to Create/Update for Each Package

Each package should have the following AI context files:

| File | Purpose | Required |
|------|---------|----------|
| `CLAUDE.md` | Claude Code guidance - quick reference, commands, architecture summary | Yes |
| `ARCHITECTURE.md` | Detailed architecture with diagrams, class relationships, database schema | Yes (except meta-packages) |
| `.cursorrules` | Cursor AI instructions - project structure, patterns, conventions | Yes |
| `.github/copilot-instructions.md` | GitHub Copilot code templates and patterns | Yes |
| `README.md` | User-facing documentation - installation, usage, configuration | Yes (update if incomplete) |

## File Content Guidelines

### CLAUDE.md
- Start with standard header:
  ```markdown
  # CLAUDE.md

  This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.
  ```
- Overview section (package name, namespace, what it extends)
- Commands section (composer scripts)
- Architecture summary (service provider bindings, key patterns)
- Key files table
- Brief usage examples if helpful

### ARCHITECTURE.md
- Directory structure tree
- Class diagrams (ASCII art)
- Database schema
- Request flow diagrams
- Extension points
- Related packages

### .cursorrules
- Project overview
- Project structure tree
- Architecture patterns specific to the package
- Coding conventions
- Common tasks
- Testing commands
- Key files reference

### .github/copilot-instructions.md
- Project overview
- Key classes diagram
- Code style templates (full code examples for common patterns)
- Configuration examples
- Database schema
- Usage examples

### README.md
- Package description
- Installation instructions
- Basic usage
- Configuration options
- Requirements/dependencies

## Progress Tracking

### Completed Packages

#### core/ (20 packages) - FULLY COMPLETE
All packages have complete AI context files.

#### default/ (9 packages) - FULLY COMPLETE
All packages have complete AI context files.

#### cms/ (9 packages) - FULLY COMPLETE
All packages have complete AI context files.

#### crm/ (15 packages) - FULLY COMPLETE
All packages have complete AI context files.

#### blade/ (34 packages) - FULLY COMPLETE
All packages have complete AI context files.

#### ecommerce/ (1 package) - FULLY COMPLETE
All packages have complete AI context files.

#### template/ (1 package) - ALREADY HAS DOCS
- package-tools (manually created, comprehensive)

### Partially Complete

#### api/ (8 packages) - 7/8 COMPLETE
All complete except:
- `jira` - Has CLAUDE.md only, missing ARCHITECTURE.md, .cursorrules, .github/copilot-instructions.md

#### custom/ (6 packages) - 5/6 COMPLETE
All complete except:
- `wysiwyg-editor` - Missing all AI context files

## Process for Each Package

1. **Read existing files**
   - `composer.json` - package name, namespace, dependencies
   - `src/*ServiceProvider.php` - bindings and configuration
   - `config/*.php` - configuration structure
   - `src/Models/*.php` - model traits and relationships
   - Existing README.md, .cursorrules if present

2. **Create/Update files in order**
   1. `.cursorrules`
   2. `.github/copilot-instructions.md` (create `.github/` directory first)
   3. `CLAUDE.md`
   4. `ARCHITECTURE.md` (skip for meta-packages)
   5. `README.md` (update if incomplete)

3. **Verify completeness**
   - All 5 files exist (or 4 for meta-packages)
   - Content is accurate to the package
   - Code examples are syntactically correct

## Package Type Patterns

### Standard CRUD Package (e.g., contact, customer, project)
- Has models, controllers (Admin/Api), requests, resources
- Uses PackageServiceProvider with 14 binding hooks
- Has actions (Create/Update/Delete), events, imports, exports
- All interfaces in `src/Contracts/` (NOT `src/Interfaces/`)
- Contract subdirectories: `Contracts/Admin/` for admin requests/controllers, root for everything else
- Minimum 8-13 contracts per CRUD package
- Full set of AI context files needed
- Reference: `crm/contact` for gold-standard patterns

### Utility Package (e.g., activity, backup, notification, chart)
- Provides traits (`Has*`), components, wrappers, or infrastructure
- Uses PackageServiceProvider with minimal binding hooks
- Does NOT require API endpoints, exports, or imports
- Model contracts in `src/Contracts/` if package has models
- Simpler AI context files

### Blade Component Package (e.g., blade-button, blade-card)
- Simple structure: ServiceProvider + Component classes + views
- No models, controllers, or database
- Simpler AI context files

### Meta-Package (e.g., core/core, cms/cms)
- Only composer.json with dependencies
- No source code
- Skip ARCHITECTURE.md
- Simple CLAUDE.md and .cursorrules

## README.md Template

```markdown
# Package Name

Brief description of what the package does.

## Installation

```bash
composer require bespoke-uk/package-name
```

## Configuration

Publish the configuration file:

```bash
php artisan vendor:publish --tag="package-name-config"
```

## Usage

Basic usage examples...

## Requirements

- PHP ^8.2
- Laravel 10.x, 11.x, or 12.x

## Dependencies

- bespoke-uk/package-tools ^10.0
- (other dependencies)

## Testing

```bash
composer test
```

## License

MIT
```

## Commands Reference

Per-package commands:
```bash
composer test              # Run PHPUnit tests
composer test:parallel     # Run tests in parallel
composer test:coverage     # Run tests with coverage
composer analyse           # PHPStan static analysis
composer format            # Format with Laravel Pint
composer build             # Build workbench
composer start             # Serve with testbench
```
