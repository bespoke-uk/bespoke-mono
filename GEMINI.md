# GEMINI.md

This document provides a comprehensive overview of the Bespoke CMS monorepo, intended to serve as instructional context for future AI interactions. It synthesizes information from `CLAUDE.md` and `docs/PACKAGE_STANDARDS.md`.

## Project Overview

This is a **Bespoke CMS monorepo** comprising **108 Laravel packages** organized into 9 categories by domain. All packages extend `bespoke-uk/package-tools` (a fork of Spatie's laravel-package-tools), using `PackageServiceProvider` as the base class.

*   **Namespace Prefix:** `Bespoke\`
*   **PHP Version:** ^8.2
*   **Laravel Version:** 10.x, 11.x, 12.x
*   **Reference Implementation:** The `/crm/contact` package is the 100% standards-compliant reference for CRUD packages.
*   **Core Principles:**
    *   **Contract-First Development:** Every implementation class *must* have a corresponding interface (contract), located in `src/Contracts/`.
    *   **Config-Driven Bindings:** All concrete implementations are declared in the package config file and bound via the ServiceProvider.
    *   **ServiceProvider Binding Methods:** All bindings are registered using dedicated `register*Bindings()` methods.
    *   **Package Extensibility:** Packages are designed to be easily extended and overridden by Laravel applications through config changes.
    *   **No Concrete Implementations:** Code *must* reference contracts, never concrete classes, to enable extensibility.

## Architecture and Standards

The monorepo enforces strict architectural standards, primarily categorized by package type:

### Package Classification

1.  **CRUD Packages (Full Compliance Required):** Manage database entities with full create, read, update, delete operations. These require the full directory structure, 8-13+ contracts, comprehensive binding methods, a complete config file, API endpoints, import/export functionality, and actions/events.
    *   *Examples:* `crm/contact`, `core/user`, `cms/page`.
2.  **Utility Packages (Simplified Compliance):** Provide infrastructure, traits, components, or wrappers. These do *not* require API endpoints, exports, or imports. They have basic ServiceProviders and minimal config files.
    *   *Examples:* `core/activity`, `core/backup`, `blade/blade`.
3.  **Polymorphic Manager Packages:** A special case of CRUD packages that provide both polymorphic relationship traits (e.g., `HasDocuments`) and require full CRUD compliance.

### Directory Structure

Packages follow a required directory structure, including:
*   `config/`: Package configuration.
*   `database/`: Factories and migrations.
*   `resources/`: Language files, schema files (`.tsv`), and views (admin, exports).
*   `routes/`: `admin.php` and `api.php`.
*   `src/`: Core logic, including `PackageServiceProvider.php`, `Actions/`, `Commands/`, `Contracts/`, `Events/`, `Exports/`, `Http/` (Controllers, Requests, Resources), `Imports/`, `Models/`, `Rules/`, `Traits/`.
*   `tests/`: PHPUnit tests.

### ServiceProvider Implementation

All packages extend `Bespoke\PackageTools\PackageServiceProvider`. Key methods include:
*   `configurePackage(Package $package)`: Defines package name, commands, config, migrations, routes, translations, views, and install command.
*   `register*Bindings()` methods: Overridden to bind contracts to concrete implementations (e.g., `registerModelBindings()`, `registerControllerBindings()`, `registerActionBindings()`, `registerImportBindings()`, `registerExportBindings()`, `registerRequestBindings()`, `registerResourceBindings()`, `registerRouteModelBindings()`, `registerRuleBindings()`, etc.).
*   Lifecycle Hooks: `registeringPackage()`, `packageRegistered()`, `bootingPackage()`, `packageBooted()`.

### Contract Requirements

*   Every class registered via a binding method *must* have a contract in `src/Contracts/`.
*   Admin and API controllers, requests, resources, and actions all have dedicated contract interfaces.
*   **Important:** The directory `src/Interfaces/` is deprecated; `src/Contracts/` must be used.
*   Model contracts are typically marker interfaces, while others define public method signatures.

### Config File Structure

CRUD packages require 20+ sections in their `config/package-name.php` file, covering aliases, actions, controllers (nested by `admin`/`api`), export/import settings, listeners, Livewire components, models, requests (nested by `admin`/`api`), resources, routes, route prefixes, and validation rules.

## Building and Running

### Per-Package Commands (run from within a package directory)

*   `composer test`: Run PHPUnit tests.
*   `composer test:parallel`: Run tests in parallel (paratest).
*   `composer test:coverage`: Run tests with coverage report.
*   `composer analyse`: PHPStan static analysis.
*   `composer format`: Format code with Laravel Pint.
*   `composer build`: Build package workbench.
*   `composer start`: Serve with testbench.

### Monorepo Scripts (run from category directory or repository root)

*   `./_pint.sh`: Run Pint formatter on all child packages (from category directory).
*   `./_update.sh`: Run `composer update` on all child packages (from category directory).
*   `./_remove_vendor.sh`: Remove `vendor/` and `build/` directories from all packages (from category directory or repository root).
*   `scripts/generate-ai-context.sh -d ./core`: Generate AI context docs for packages.

## Development Conventions and Best Practices

*   **Code Style:** `declare(strict_types=1)` in all PHP files, PSR-12, 4-space indentation, 120 character max line length, return types always specified, trailing commas in arrays.
*   **Naming Conventions:** Strict patterns for packages, namespaces, controllers, contracts, actions, traits, events, etc. (e.g., `Has{Feature}` for traits, `CreateContact` for actions).
*   **Testing:** Uses Orchestra Testbench; detailed testing standards are in `docs/TESTING_GUIDE.md`.
*   **Key Pitfalls to Avoid:**
    *   Using `Interfaces/` instead of `Contracts/`.
    *   Missing API functionality, exports, or imports in CRUD packages.
    *   Not implementing required `register*Bindings()` methods in ServiceProviders.
    *   Incomplete or incorrectly structured config files.
    *   Using concrete classes directly instead of contracts (breaks extensibility).
    *   Misclassifying utility packages as CRUD packages and enforcing full compliance.
    *   Empty contract interfaces or service classes not implementing their contracts.
    *   Renaming classes/interfaces without updating cross-package references.
    *   API controllers using concrete classes for type-hints or return types.
    *   Forgetting to bind both Admin and API components in the ServiceProvider.
*   **Pre-Commit Verification:** A detailed checklist exists in `docs/PACKAGE_STANDARDS.md` (Section 12) for verifying compliance before committing changes to CRUD packages.

## Tooling (Claude Code Specific, but relevant for understanding automation)

The monorepo includes custom tooling within the `.claude/` directory, used by Claude Code:

*   **Custom Skills (Slash Commands):** E.g., `/audit`, `/new-crud`, `/add-api`, `/fix-contracts`, `/upgrade-package`.
*   **Custom Agents:** Specialized agents like `package-auditor`, `crud-scaffolder`, `api-scaffolder`, `contract-generator`, `code-style-enforcer`.
*   **Hooks:** Automation scripts triggered by events, such as `format-php.sh` (runs Laravel Pint) and `validate-package-edit.sh`.
*   **MCP Server:** Provides package intelligence tools like `get_package_info`, `list_packages`, `audit_package`.

This `GEMINI.md` provides a foundational understanding of the Bespoke CMS monorepo, its architectural principles, and operational guidelines.
