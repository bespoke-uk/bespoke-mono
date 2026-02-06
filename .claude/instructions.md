# Claude Code Instructions for Bespoke CMS Monorepo

These instructions provide session-persistent context for working with this codebase.

## Quick Context

- **108 Laravel packages** organised into 9 categories
- All packages extend `bespoke-uk/package-tools` (fork of Spatie's laravel-package-tools)
- **Reference implementation:** `/crm/contact` - 100% standards compliant

## Available Skills

Use these slash commands for common operations:

| Command | Description |
|---------|-------------|
| `/audit <path>` | Audit package compliance (81-point scoring) |
| `/new-crud <category/name>` | Create new CRUD package from template |
| `/new-blade <component-name>` | Create new Blade component package |
| `/add-api <path>` | Add complete RESTful API to package |
| `/add-exports <path>` | Add import/export functionality |
| `/add-tests <path>` | Scaffold PHPUnit tests for a package |
| `/add-livewire <path> <name>` | Add Livewire component to package |
| `/add-event <path> <name>` | Add event and optional listener |
| `/fix-contracts <path>` | Generate missing contracts |
| `/upgrade-package <path>` | Upgrade package to current standards |
| `/add-migration <path> <desc>` | Create database migration |
| `/check-deps <path\|--all>` | Analyse package dependencies |
| `/test-packages <path\|category>` | Run tests across packages |
| `/sync-docs` | Review and update documentation after changes |

## Key Documentation

Read these files for comprehensive context (in `docs/` — see `docs/index.md` for full directory):

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Quick reference, package types, structure (root) |
| `docs/index.md` | Central entry point for all documentation |
| `docs/standards/package_standards.md` | Architecture standards (1200+ lines) |
| `docs/registry/monorepo_analysis.md` | Complete 108-package analysis |
| `docs/guides/project_examples.md` | Typical project configurations |
| `docs/registry/event_listeners.md` | Cross-package event communication |
| `docs/registry/database_schema.md` | All tables and relationships |
| `docs/registry/livewire_components.md` | Component registry (98 components) |
| `docs/registry/routes_overview.md` | API, admin, and frontend routes |
| `docs/guides/testing_guide.md` | Testing standards and patterns |
| `docs/standards/decisions.md` | Architectural decision records |
| `docs/guides/upgrade_checklist.md` | Package upgrade guide |
| `docs/guides/git_hooks.md` | Git hooks setup |
| `docs/guides/ci_cd_guide.md` | CI/CD integration guide |

**Library References** (in `docs/references/`):
- `bespoke_cheatsheet.md` - **Concise patterns cheat sheet** (read this first for real examples)
- `laravel_10_docs.md` - Laravel framework patterns (full)
- `laravel_livewire_v2_docs.md` - Livewire v2 component patterns (full)
- `tailwind.css_v3_docs.md` - Tailwind CSS utilities (full)

## Package Classification

### CRUD Packages (Full Compliance)
Manage database entities. Require:
- Full API endpoints (routes/api.php)
- Admin controllers and routes
- Imports/Exports
- 8-13+ contracts
- 20+ config sections

**Examples:** `contact`, `customer`, `page`, `post`, `user`, `employee`, `document`, `image`, `note`

### Utility Packages (Simplified)
Provide traits, components, wrappers. Do NOT require API, exports, or imports.

**Examples:** `activity`, `backup`, `captcha`, `chart`, `core`, `dashboard`, `editor`, `module`, `notification`, `security`, `two-factor`

### Complex System Packages (Custom Requirements)
Packages with specialised purposes that don't fit standard CRUD patterns.

**Examples:**
- `auth` - Security-sensitive, no bulk import/export (would expose sensitive data)
- Has 21+ contracts but different compliance requirements

## Architecture Patterns

### Contract-First Development
Every bound class needs an interface in `src/Contracts/`:

```php
// Contract
namespace Bespoke\Package\Contracts;
interface ContactController { }

// Implementation
namespace Bespoke\Package\Http\Controllers\Admin;
class ContactController implements ContactController { }
```

### Config-Driven Bindings
All implementations declared in config:

```php
// config/contact.php
'controllers' => [
    'admin' => ['contact' => ContactController::class],
    'api' => ['contact' => ApiContactController::class],
],
```

### ServiceProvider Binding Methods
Override in service provider:

```php
protected function registerControllerBindings(): void
{
    $this->app->bind(ContactControllerContract::class, function ($app) {
        return $app->make($app->config['contact.controllers.admin.contact']);
    });
}
```

## Common Commands

```bash
# Per-package
composer test              # Run tests
composer analyse           # PHPStan
composer format            # Laravel Pint

# Monorepo (from category directory)
./_pint.sh                 # Format all packages
./_update.sh               # Update all packages
```

## When Working on Packages

### CRITICAL: Always Deep Audit First

**Never rely on quick MCP audits alone.** Before suggesting or making changes to any package:

1. **Run a deep audit using the `package-auditor` agent** - NOT just `mcp__bespoke__audit_package`
2. The deep audit determines:
   - Correct package classification (CRUD vs Utility vs Complex System)
   - Actual missing components with specific file paths
   - Whether "missing" features are actually inappropriate for the package type
3. **Only then propose changes**

**Why this matters:**
- Quick audits can misclassify packages (e.g., `notification` appeared 0% CRUD compliant but is correctly a utility package)
- Some packages have custom requirements (e.g., `auth` is security-sensitive - no bulk import/export needed)
- Deep analysis prevents unnecessary work and incorrect suggestions

### Standard Workflow

1. **Read the package's CLAUDE.md first** (if it exists)
2. **Run deep audit with `package-auditor` agent** to understand true state
3. **Check if CRUD or Utility** - determines requirements
4. **Use `/crm/contact` as reference** for CRUD patterns
5. **Follow `docs/standards/package_standards.md`** for new implementations
6. **Run `composer format` and `composer analyse`** before commits

## File Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Contract | `src/Contracts/{Name}.php` | `Contracts/Contact.php` |
| Admin Contract | `src/Contracts/Admin/{Name}.php` | `Contracts/Admin/ContactController.php` |
| Admin Controller | `src/Http/Controllers/Admin/{Name}Controller.php` | |
| API Controller | `src/Http/Controllers/Api/{Name}Controller.php` | |
| API Request | `src/Http/Requests/Api/Store{Name}.php` | `StoreContact.php` |
| API Resource | `src/Http/Resources/{Name}Resource.php` | `ContactResource.php` |
| Import | `src/Imports/{Name}Import.php` | `ContactImport.php` |
| Export | `src/Exports/{Name}Export.php` | `ContactExport.php` |
| Event | `src/Events/{Name}{Action}.php` | `ContactCreated.php` |
| Listener | `src/Listeners/{Action}{Name}.php` | `RecordActivity.php` |
| Trait | `src/Traits/Has{Feature}.php` | `HasContacts.php` |

## Route Patterns

- **Admin:** `/admin/{resource}` with permission middleware `can:{resource}.{action}`
- **API:** `/api/v1/{resource}/{model:uuid}` with Sanctum abilities
- **Frontend:** `/{slug}` with optional caching middleware

## Active Hooks

The following hooks run automatically:

| Hook | Trigger | Effect |
|------|---------|--------|
| `session-context.sh` | Session start | Provides quick monorepo reference |
| `format-php.sh` | After Edit/Write PHP files | Runs Laravel Pint formatter |
| `validate-package-edit.sh` | Before Edit | Warns about common mistakes |
| `ensure-claude-md.sh` | After Write in packages | Reminds to create CLAUDE.md |
| `validate-commit.sh` | Pre-commit (manual) | Validates before git commits |

## MCP Server Tools

The bespoke MCP server provides these tools for package intelligence:

- `get_package_info <name>` - Detailed package information
- `list_packages [category] [type]` - List packages with filters
- `find_trait_usages <trait>` - Find where traits are used
- `get_model_relationships <model>` - Get model relationships
- `audit_package <name>` - Quick compliance audit
- `search_packages <query>` - Search across packages
- `get_test_coverage <name>` - Check test coverage for a package
- `compare_packages <pkg1> <pkg2>` - Compare two packages
- `get_package_health <name>` - Comprehensive health check

## After Completing Significant Work

**IMPORTANT:** After completing significant tasks, offer to run `/sync-docs` to update documentation.

Significant work includes:
- Creating new packages, agents, skills, or hooks
- Modifying package structure or architecture
- Adding new tooling or workflows
- Making changes that affect multiple packages

Example: "I've completed the changes. Would you like me to run `/sync-docs` to update the documentation?"

## Don't Forget

- Use `Contracts/` not `Interfaces/`
- API routes use `{model:uuid}` not `{model}` or `{id}`
- Config has nested structure: `controllers.admin`, `controllers.api`
- All models extend `AbstractModel` from `bespoke-uk/module`
- Events use past tense: `ContactCreated`, `ContactUpdated`
- Run `/audit <path>` to check package compliance before committing
- Run `/sync-docs` after significant changes to keep documentation current
