# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is the **Bespoke CMS monorepo** containing **108 Laravel packages** organised into 9 categories by domain. All packages extend `bespoke-uk/package-tools` (a fork of Spatie's laravel-package-tools) which provides `PackageServiceProvider` as the base class.

**Namespace prefix:** `Bespoke\`
**PHP Version:** ^8.2
**Laravel Version:** 10.x, 11.x, 12.x

**Related Documentation:** (in `docs/` — see [index.md](docs/index.md) for full directory)

| Document | Purpose |
|----------|---------|
| **[index.md](docs/index.md)** | Central entry point for all documentation |
| **[package_standards.md](docs/standards/package_standards.md)** | Architecture standards and compliance requirements (~850 line index + 5 sub-documents) |
| **[monorepo_analysis.md](docs/registry/monorepo_analysis.md)** | Complete analysis of all 108 packages with status |
| **[project_examples.md](docs/guides/project_examples.md)** | Typical project configurations and package combinations |
| **[event_listeners.md](docs/registry/event_listeners.md)** | Cross-package event communication (88 events, 31 listeners) |
| **[database_schema.md](docs/registry/database_schema.md)** | All database tables, relationships, and migrations |
| **[livewire_components.md](docs/registry/livewire_components.md)** | Component registry (98 Livewire components) |
| **[routes_overview.md](docs/registry/routes_overview.md)** | API, admin, and frontend routes across all packages |
| **[testing_guide.md](docs/guides/testing_guide.md)** | Testing standards, patterns, and examples |
| **[decisions.md](docs/standards/decisions.md)** | Architectural decision records (ADRs) |
| **[upgrade_checklist.md](docs/guides/upgrade_checklist.md)** | Step-by-step package upgrade guide |
| **[git_hooks.md](docs/guides/git_hooks.md)** | Git hooks setup and configuration |
| **[ci_cd_guide.md](docs/guides/ci_cd_guide.md)** | CI/CD pipeline integration guide |
| **[interfaces_registry.md](docs/registry/interfaces_registry.md)** | Complete catalogue of ~304 interfaces and contracts |

**Library References:** (in `docs/references/`)

| Document | Purpose |
|----------|---------|
| `bespoke_cheatsheet.md` | **Concise patterns cheat sheet** — real examples from this monorepo (read this first) |
| `laravel_10_docs.md` | Laravel 10 framework reference (full) |
| `laravel_livewire_v2_docs.md` | Livewire v2 component patterns (full) |
| `tailwind.css_v3_docs.md` | Tailwind CSS utility classes (full) |

**Claude Code Tooling:**

| Location | Purpose |
|----------|---------|
| **[.claude/instructions.md](.claude/instructions.md)** | Session-persistent Claude Code instructions |
| **[.claude/memory.md](.claude/memory.md)** | Persistent preferences, decisions, and session notes |
| **[.claude/project-state.md](.claude/project-state.md)** | Current work-in-progress tracking |
| **[.claude/agents/](.claude/agents/)** | Custom agents (10 agents for various tasks) |
| **[.claude/skills/](.claude/skills/)** | Slash commands (14 skills available) |
| **[.claude/hooks/](.claude/hooks/)** | Automation hooks (formatting, validation) |
| **[.claude/mcp-server/](.claude/mcp-server/)** | MCP server for package intelligence (9 tools) |

**Reference Implementation:** `/crm/contact` - 100% standards compliant CRUD package

### Package Categories (108 total)

| Category | Count | Primary Purpose |
|----------|-------|-----------------|
| Template | 6 | Package scaffolding and framework base |
| API | 8 | Third-party API integrations (Harvest, Jira, Magento, etc.) |
| Blade | 34 | UI components (Tailwind CSS + Livewire) |
| CMS | 9 | Content management (pages, posts, menus) |
| Core | 20 | System functionality (auth, user, ACL, settings) |
| CRM | 15 | Customer relationship management |
| Default | 9 | Utilities (SEO, cookies, redirects, PWA) |
| Custom | 6 | Client-specific packages |
| E-commerce | 1 | Product management (scaffold only) |

## Package Types

Packages fall into two categories with different compliance requirements:

### CRUD Packages (Full Standards Compliance Required)
Packages that manage database entities with create, read, update, delete operations. These MUST follow full package_standards.md requirements including API, exports, and imports.

**Examples:** `crm/contact`, `crm/customer`, `core/user`, `core/employee`, `core/profile`, `core/document`, `core/image`, `core/note`

### Polymorphic Manager Packages (CRUD + Traits)

These packages provide both polymorphic relationship traits AND require full CRUD compliance for direct entity management:

- `core/document` - File/document attachment management + `HasDocuments` trait
- `core/image` - Image/media asset management + `HasImages` trait
- `core/note` - Note/comment attachment management + `HasNotes` trait

**Pattern:** Parent models use traits (`HasDocuments`, `HasImages`, `HasNotes`), but the packages also need full API for standalone management of these entities.

### Utility Packages (Simplified Standards)
Packages that provide traits, components, wrappers, or infrastructure. These do NOT require API endpoints, exports, or imports.

**Core utility packages:**
- `activity` - Activity logging traits (extends Spatie)
- `backup` - Backup configuration wrapper (wraps Spatie)
- `captcha` - CAPTCHA validation rules and facades
- `chart` - Chart Livewire components
- `core` - Meta/placeholder package
- `dashboard` - Dashboard landing page builder
- `editor` - WYSIWYG editor component wrapper
- `module` - Framework base classes (AbstractModel, AbstractImport, AbstractExport)
- `security` - Security middleware and helpers
- `two-factor` - 2FA authentication traits

**Utility package requirements:**
- ✅ Model contracts (if has models)
- ✅ Basic binding methods (registerModelBindings)
- ✅ Config file with relevant sections
- ❌ No API required
- ❌ No exports/imports required
- ❌ No Contracts/Admin/ or Contracts/Api/ subdirectories required

## Package Dependency Hierarchy

Understanding the dependency chain is critical for working with this monorepo:

```
Foundation Layer
└── bespoke-uk/package-tools (ALL packages extend this)
    └── bespoke-uk/module (most CRUD packages require this)
        ├── AbstractModel - Base model class
        ├── AbstractImport - Base import class
        └── AbstractExport - Base export class

Core Dependencies (commonly required)
├── bespoke-uk/acl (permissions - used by admin interfaces)
├── bespoke-uk/activity (logging - used by models with HasActivity)
├── bespoke-uk/auth (authentication - required for protected routes)
├── bespoke-uk/user (users - referenced by many packages)
└── bespoke-uk/employee (staff - referenced by assignment features)

CRM Dependencies (for customer-related features)
├── bespoke-uk/contact (polymorphic contacts)
├── bespoke-uk/customer (customer entities)
├── bespoke-uk/address (polymorphic addresses)
└── bespoke-uk/location (geolocation services)

UI Dependencies (for views and components)
├── bespoke-uk/blade (all UI components)
├── bespoke-uk/editor (WYSIWYG)
└── bespoke-uk/image (image management)
```

## Repository Structure

```
bespoke/
├── .claude/            # Claude Code customisations
│   ├── agents/         # Custom agents (package-auditor, crud-scaffolder, etc.)
│   ├── hooks/          # Automation hooks (format-php, validate-package-edit)
│   ├── mcp-server/     # MCP server for package intelligence
│   ├── skills/         # Slash commands (/audit, /new-crud, /add-api, etc.)
│   ├── instructions.md # Session-persistent instructions
│   └── settings.json   # Hook configuration
├── api/            # Third-party API integrations (8 packages)
│                   # brevo, google-apis, harvest, hubspot, jira, magento, microsoft, openai
├── blade/          # Blade UI component packages (34 packages)
│                   # blade-accordion, blade-button, blade-card, blade-form, etc.
├── cms/            # Content management packages (9 packages)
│                   # cms, page, post, menu, enquiry, etc.
├── core/           # Core functionality packages (20 packages)
│                   # auth, user, acl, module, notification, setting, etc.
├── crm/            # Customer relationship packages (15 packages)
│                   # contact, customer, project, task, calendar, etc.
├── custom/         # Client-specific packages (6 packages)
├── default/        # Default utilities (9 packages)
│                   # cloudflare, cookie, country, pwa, redirect, seo, etc.
├── docs/           # Documentation (see docs/index.md)
│   ├── standards/  # Architecture standards and compliance
│   ├── registry/   # Monorepo knowledge base (analysis, schemas, routes)
│   ├── guides/     # Development workflows (testing, upgrades, CI/CD)
│   └── references/ # External library docs (Laravel, Livewire, Tailwind)
├── ecommerce/      # E-commerce packages (1 package)
│                   # product
├── template/       # Package templates and tools
│   ├── package-tools/    # Base PackageServiceProvider and traits
│   ├── skeleton/         # Template for new packages
│   ├── skeleton-blade/   # Template for blade component packages
│   └── skeleton-crud/    # Template for CRUD packages
├── workbench/      # Laravel application for testing packages
└── scripts/        # Utility scripts
    └── generate-ai-context.sh  # Generates AI context docs for packages
```

## Commands

### Per-Package Commands (run from within a package directory)

```bash
composer test              # Run PHPUnit tests
composer test:parallel     # Run tests in parallel (paratest)
composer test:coverage     # Run tests with coverage report
composer analyse           # PHPStan static analysis
composer format            # Format code with Laravel Pint
composer build             # Build package workbench
composer start             # Serve with testbench
```

### Monorepo Scripts

From within a category directory (e.g., `core/`, `blade/`):

```bash
./_pint.sh          # Run Pint formatter on all child packages
./_update.sh        # Run composer update on all child packages
./_remove_vendor.sh # Remove vendor/build directories from all packages
```

From repository root:

```bash
./_remove_vendor.sh                    # Clean all vendor directories
scripts/generate-ai-context.sh -d ./core  # Generate AI docs for packages
```

## Package Architecture (package-tools)

All packages extend `bespoke-uk/package-tools`. Key concepts:

### Service Provider Pattern

```php
class MyServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void
    {
        $package
            ->name('my-package')
            ->hasConfigFile()
            ->hasMigrations()
            ->hasViews()
            ->hasRoutes(['web', 'api']);
    }
}
```

### Trait Organization

| Location | Prefix | Purpose | Used By |
|----------|--------|---------|---------|
| `src/Traits/` | `Has*` | Define what resources exist | `Package` |
| `src/Concerns/` | `Registers*` | Register resources with Laravel | `PackageServiceProvider` |

### Lifecycle Hooks

Override in your service provider:
- `registeringPackage()` / `packageRegistered()` - Around `register()`
- `bootingPackage()` / `packageBooted()` - Around `boot()`

### Binding Hooks (14 methods)

Override these in your service provider to register dependencies:

```php
protected function registerActionBindings(): void      // Business logic actions
protected function registerControllerBindings(): void  // Admin and API controllers
protected function registerDataBindings(): void        // Data transfer objects
protected function registerEnumBindings(): void        // Enumeration types
protected function registerExportBindings(): void      // Export handlers
protected function registerFactoryBindings(): void     // Non-model factories
protected function registerImportBindings(): void      // Import handlers
protected function registerModelBindings(): void       // Eloquent models
protected function registerParserBindings(): void      // File parsers
protected function registerRequestBindings(): void     // Form requests
protected function registerResourceBindings(): void    // API resources
protected function registerResponseBindings(): void    // Response objects
protected function registerRouteModelBindings(): void  // Route parameters
protected function registerRuleBindings(): void        // Validation rules
protected function registerServiceBindings(): void     // Service layer
```

**Pattern:** All bindings use config-driven implementation:
```php
protected function registerModelBindings(): void
{
    $this->app->bind(ContactContract::class, function ($app) {
        return $app->make($app->config['contact.models.contact']);
    });
}
```

See [serviceprovider.md](docs/standards/serviceprovider.md) for complete examples.

### Config-Based Registration

Packages auto-register from config file keys:
- `aliases` - Class aliases
- `middlewares` - Middleware aliases
- `listeners` - Event→listener mappings
- `livewire` - Livewire component registrations
- `models`, `controllers`, `requests`, `responses` - Class bindings

## Standard Package Structure

### CRUD Package Structure (Full)

```
package-name/
├── config/
│   └── package-name.php          # All config (22 sections)
├── database/
│   ├── factories/                # Model factories
│   └── migrations/               # Database migrations
├── resources/
│   ├── lang/en/                  # Translation files
│   ├── schema/                   # Import schema files (.tsv)
│   └── views/
│       ├── admin/                # Admin views
│       └── exports/              # Export templates
├── routes/
│   ├── admin.php                 # Admin routes
│   └── api.php                   # RESTful API routes
├── src/
│   ├── PackageServiceProvider.php
│   ├── Actions/                  # Business logic (CreateModel, etc.)
│   ├── Contracts/                # ALL interfaces (NOT Interfaces/)
│   │   └── Admin/                # Admin-specific contracts
│   ├── Events/                   # Domain events (ModelCreated, etc.)
│   ├── Exports/                  # Export handlers
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Admin/            # Admin controllers
│   │   │   └── Api/              # API controllers
│   │   ├── Requests/
│   │   │   ├── Admin/            # Admin form requests
│   │   │   └── Api/              # StoreModel, UpdateModel
│   │   └── Resources/            # API resources
│   ├── Imports/                  # Import handlers
│   ├── Models/                   # Eloquent models
│   └── Traits/                   # Relationship traits (Has*)
├── tests/
├── composer.json
├── phpstan.neon.dist
├── phpunit.xml.dist
└── pint.json
```

### Utility Package Structure (Simplified)

```
package-name/
├── config/
│   └── package-name.php          # Minimal config sections
├── resources/
│   └── views/                    # Views (if needed)
├── routes/
│   └── admin.php                 # Admin routes only (if needed)
├── src/
│   ├── PackageServiceProvider.php
│   ├── Contracts/                # Model contracts only
│   ├── Models/                   # Models (if any)
│   └── Traits/                   # Composable traits (Has*)
├── tests/
├── composer.json
├── phpstan.neon.dist
├── phpunit.xml.dist
└── pint.json
```

See [package_standards.md](docs/standards/package_standards.md) Section 3 for full directory requirements.

## Contract-First Development

**Every class registered via a binding method MUST have a corresponding contract (interface).**

| Contract Type | Location | Example |
|---------------|----------|---------|
| Model | `src/Contracts/` | `Contracts\Contact` |
| Admin Controller | `src/Contracts/Admin/` | `Contracts\Admin\ContactController` |
| Admin Request | `src/Contracts/Admin/` | `Contracts\Admin\UpdateContact` |
| Action | `src/Contracts/` | `Contracts\CreateContact` |
| Import | `src/Contracts/` | `Contracts\ContactImport` |
| Export | `src/Contracts/` | `Contracts\ContactExport` |
| Rule | `src/Contracts/` | `Contracts\UniqueContactEmail` |

**Minimum contracts per CRUD package:** 8-13

**Important:** Use `Contracts/` directory, NOT `Interfaces/`.

See [contracts.md](docs/standards/contracts.md) for contract examples.

## Required Package Functionality

### CRUD Packages (Full Requirements)

| Component | Files Required |
|-----------|----------------|
| **API Controllers** | `src/Http/Controllers/Api/ModelController.php` |
| **API Requests** | `src/Http/Requests/Api/StoreModel.php`, `UpdateModel.php` |
| **API Resources** | `src/Http/Resources/ModelResource.php`, `ModelCollection.php` |
| **API Routes** | `routes/api.php` with RESTful endpoints using `{model:uuid}` |
| **Imports** | `src/Imports/ModelImport.php` + contract + schema file |
| **Exports** | `src/Exports/ModelExport.php` + contract + blade view |
| **Actions** | `src/Actions/CreateModel.php`, `UpdateModel.php`, `DeleteModel.php` + contracts |
| **Events** | `src/Events/ModelCreated.php`, `ModelUpdated.php`, `ModelDeleted.php` |

### Utility Packages (Minimal Requirements)

| Component | Files Required |
|-----------|----------------|
| **ServiceProvider** | `src/PackageServiceProvider.php` with `configurePackage()` |
| **Config** | `config/package-name.php` with relevant sections |
| **Model Contract** | `src/Contracts/Model.php` (if package has models) |
| **Traits** | `src/Traits/Has*.php` for composable functionality |

## Code Style

- `declare(strict_types=1)` in all PHP files
- PSR-12 with 4-space indentation
- 120 character max line length
- Return types always specified
- Trailing commas in arrays
- Controllers implement contracts (interfaces)
- Models extend `AbstractModel` with `HasUUID` trait

## Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Package | `bespoke-uk/{name}` | `bespoke-uk/auth` |
| Namespace | `Bespoke\{Name}` | `Bespoke\Auth` |
| Controller | `{Feature}Controller` | `LoginController` |
| Contract | Same as impl, in `Contracts/` | `Contracts\LoginController` |
| Action | `{Action}{Model}` | `CreateContact` |
| Trait | `Has{Feature}` | `HasAuthLogs`, `HasContacts` |
| Event | Past tense | `LoggedIn`, `ContactCreated` |
| Listener | Action description | `StoreLoginDetails` |
| Admin Request | `{Action}{Model}` | `UpdateContact` |
| API Request | `Store{Model}`, `Update{Model}` | `StoreContact`, `UpdateContact` |
| API Resource | `{Model}Resource`, `{Model}Collection` | `ContactResource` |
| Import | `{Model}Import` | `ContactImport` |
| Export | `{Model}Export` | `ContactExport` |

## Per-Package Documentation

Each package has its own documentation:
- `CLAUDE.md` - Claude Code guidance
- `.cursorrules` - Cursor AI instructions
- `ARCHITECTURE.md` - Detailed architecture and diagrams
- `.github/copilot-instructions.md` - GitHub Copilot context

## Key Packages

| Package | Purpose |
|---------|---------|
| `template/package-tools` | Base `PackageServiceProvider` and all traits |
| `core/module` | Module system foundation, AbstractModel, AbstractImport, AbstractExport |
| `core/auth` | Authentication (web, API, 2FA, magic links) - 21 contracts, complex |
| `core/user` | User model and management |
| `core/acl` | Access control lists / permissions - 10 contracts |
| `blade/blade` | Base blade component package (bundles all 33 blade-* packages) |
| **`crm/contact`** | **Reference implementation - 100% standards compliant** |

## Package Completeness Levels

| Level | Count | Examples | Notes |
|-------|-------|----------|-------|
| **100% Reference** | 1 | `crm/contact` | Gold standard for CRUD packages |
| **95-99% Complete** | ~50 | `cms/page`, `cms/post`, `crm/customer`, `crm/address`, `crm/project`, `crm/task`, `default/country`, `core/document`, `core/image`, `core/note` | Production-ready |
| **70-94% Functional** | ~25 | `core/employee`, `default/cloudflare` | Missing some features |
| **50-69% Partial** | ~12 | `core/user`, `core/profile`, `api/google-apis` | Significant gaps |
| **<50% Scaffold/WIP** | ~5 | `ecommerce/product`, `api/brevo` | Needs implementation |

### Priority Packages Needing Work

1. **`core/user`** (55%) - Needs exports/imports, expand contracts
2. **`core/employee`** (70%) - Add missing binding methods
3. **`core/profile`** (45%) - Add API endpoints
4. **`ecommerce/product`** (25%) - Scaffold only, needs full implementation

See [monorepo_analysis.md](docs/registry/monorepo_analysis.md) for complete package-by-package analysis.

## Config File Structure

CRUD packages require 22 config sections. Key sections:

```php
return [
    'aliases' => [],           // Class aliases
    'actions' => [],           // Action class bindings
    'controllers' => [         // Nested by context
        'admin' => [],
        'api' => [],
    ],
    'export' => [],            // Export handler binding
    'import' => [              // Import handler + schema_file
        'model' => ModelImport::class,
        'schema_file' => __DIR__.'/../resources/schema/models.tsv',
    ],
    'models' => [],            // Model bindings
    'requests' => [            // Nested by context
        'admin' => [],
        'api' => [],
    ],
    'routes' => ['admin', 'api'],
    'route_prefixes' => [],
    // ... 12 more sections
];
```

See [serviceprovider.md](docs/standards/serviceprovider.md) for complete config reference.

## Testing

Uses Orchestra Testbench for package testing:

```bash
# Run single test file
composer test -- --filter=LoginTest

# Run specific test method
composer test -- --filter=test_user_can_login
```

## Package Auditing

Quick commands to audit package compliance:

```bash
# Count contracts
find src/Contracts -name "*.php" | wc -l    # Should be 8-13 minimum

# Check binding methods
grep -n "protected function register.*Bindings" src/*ServiceProvider.php

# Verify API routes exist
test -f routes/api.php && echo "✓ API routes" || echo "✗ Missing"

# Check for old Interfaces directory
test -d src/Interfaces && echo "⚠ Rename to Contracts/" || echo "✓ Using Contracts/"
```

See [audit_checklist.md](docs/standards/audit_checklist.md) for the complete 88-point audit checklist (CRUD packages only).

## Common Pitfalls

1. **Using `Interfaces/` instead of `Contracts/`** - Rename and update namespaces
2. **Missing API functionality entirely** - Add full API stack for CRUD packages only
3. **No export functionality** - Add export handler for CRUD packages only
4. **Missing binding methods** - Implement `register*Bindings()` for all bound classes
5. **Flat config structure** - Use nested structure for `controllers` and `requests`
6. **API routes using IDs** - Use `{model:uuid}` pattern instead
7. **Forcing CRUD patterns on utility packages** - Utility packages don't need API, exports, or imports

See [common_pitfalls.md](docs/standards/common_pitfalls.md) for 22 common pitfalls with solutions.

## Claude Code Customisations

This repository includes custom Claude Code tooling in `.claude/`:

### Custom Skills (Slash Commands)

| Skill | Usage | Description |
|-------|-------|-------------|
| `/audit` | `/audit <package-path>` | Audit package against package_standards.md (88-point scoring) |
| `/new-crud` | `/new-crud <category/name>` | Scaffold new CRUD package from skeleton-crud template |
| `/new-blade` | `/new-blade <component-name>` | Create new Blade component package |
| `/add-api` | `/add-api <package-path>` | Add complete RESTful API to existing package |
| `/add-exports` | `/add-exports <package-path>` | Add import/export functionality |
| `/add-tests` | `/add-tests <package-path>` | Scaffold PHPUnit tests for a package |
| `/add-livewire` | `/add-livewire <path> <name>` | Add Livewire component to package |
| `/add-event` | `/add-event <path> <name>` | Add event and optional listener |
| `/fix-contracts` | `/fix-contracts <package-path>` | Generate missing contracts for bound classes |
| `/upgrade-package` | `/upgrade-package <path>` | Upgrade package to current standards |
| `/add-migration` | `/add-migration <path> <desc>` | Create database migration for package |
| `/check-deps` | `/check-deps <path\|--all>` | Analyse package dependencies |
| `/test-packages` | `/test-packages <path\|category>` | Run tests across packages |
| `/sync-docs` | `/sync-docs` | Review and update documentation after changes |

### Custom Agents

Located in `.claude/agents/`:

| Agent | Purpose |
|-------|---------|
| `package-auditor` | Read-only analysis of package compliance |
| `crud-scaffolder` | Creates new packages from templates |
| `api-scaffolder` | Adds API functionality to packages |
| `contract-generator` | Generates missing contract interfaces |
| `code-style-enforcer` | Runs Pint and Rector across packages for code style |
| `docs-reviewer` | Reviews and updates documentation after changes |
| `test-scaffolder` | Creates PHPUnit test files for packages |
| `dependency-analyzer` | Analyses cross-package dependencies |
| `migration-scaffolder` | Creates database migrations following conventions |
| `laravel-simplifier` | Simplifies and refines PHP/Laravel code for clarity and maintainability |

### Hooks

Configured in `.claude/settings.json`:

| Hook | Trigger | Action |
|------|---------|--------|
| `session-context.sh` | Session start | Injects monorepo context |
| `format-php.sh` | After Edit/Write on PHP | Runs Laravel Pint formatter |
| `validate-package-edit.sh` | Before Edit | Warns about common mistakes |
| `ensure-claude-md.sh` | After Write in packages | Reminds to create CLAUDE.md |
| `validate-commit.sh` | Pre-commit (manual) | Validates before git commits |

### MCP Server

An MCP server provides package intelligence tools:

```bash
# Available tools (via .mcp.json)
get_package_info       # Detailed package information
list_packages          # List packages with filters
find_trait_usages      # Find trait usage across packages
get_model_relationships  # Get model relationships
audit_package          # Quick compliance audit
search_packages        # Search by name, model, trait, or component
get_test_coverage      # Check test coverage for a package
compare_packages       # Compare two packages for consistency
get_package_health     # Comprehensive health check
```

## Package Repository

All packages are hosted on Private Packagist (`repo.packagist.com/bespoke-uk`).
