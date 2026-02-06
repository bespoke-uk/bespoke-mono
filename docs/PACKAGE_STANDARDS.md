# PACKAGE STANDARDS

This document codifies the architectural standards for all packages in the Bespoke CMS monorepo. These standards are based on the `bespoke-uk/contact` package implementation and the `bespoke-uk/package-tools` framework.

**Version:** 1.9
**Reference Implementation:** `/crm/contact`
**Last Updated:** 2026-02-06

---

## Table of Contents

1. [Package Classification](#1-package-classification)
2. [Architecture Overview](#2-architecture-overview)
3. [Required Directory Structure](#3-required-directory-structure)
4. [Contract Requirements](#4-contract-requirements) → [standards/CONTRACTS.md](standards/CONTRACTS.md)
5. [ServiceProvider Implementation](#5-serviceprovider-implementation) → [standards/SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md)
6. [Complete Config File Reference](#6-complete-config-file-reference) → [standards/SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md)
7. [Code Examples for Each Component](#7-code-examples-for-each-component) → [standards/CODE_EXAMPLES.md](standards/CODE_EXAMPLES.md)
8. [Binding Pattern Reference Table](#8-binding-pattern-reference-table)
9. [Audit Checklist](#9-audit-checklist) → [standards/AUDIT_CHECKLIST.md](standards/AUDIT_CHECKLIST.md)
10. [Common Pitfalls](#10-common-pitfalls) → [standards/COMMON_PITFALLS.md](standards/COMMON_PITFALLS.md)
11. [Quick Reference](#11-quick-reference)

### Detailed Sub-Documents

| Document | Contents | Lines |
|----------|----------|-------|
| [standards/CONTRACTS.md](standards/CONTRACTS.md) | Contract requirements, examples, naming conventions | ~280 |
| [standards/SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md) | ServiceProvider template, binding methods, config file reference | ~650 |
| [standards/CODE_EXAMPLES.md](standards/CODE_EXAMPLES.md) | Admin, API, actions, imports, exports, models, traits | ~1240 |
| [standards/AUDIT_CHECKLIST.md](standards/AUDIT_CHECKLIST.md) | 88-point audit checklist, pre-commit verification | ~370 |
| [standards/COMMON_PITFALLS.md](standards/COMMON_PITFALLS.md) | 22 common pitfalls with solutions | ~660 |

---

## 1. Package Classification

**IMPORTANT:** Not all packages require full standards compliance. Packages are classified into two types with different requirements.

### 1.1 CRUD Packages (Full Compliance Required)

CRUD packages manage database entities with create, read, update, and delete operations. These packages MUST follow all standards in this document.

**Characteristics:**
- Has one or more Eloquent models representing business entities
- Requires admin interface for data management
- Requires API endpoints for programmatic access
- Needs import/export functionality for bulk data operations
- Represents a "module" in the CMS

**Requirements:**
- ✅ Full directory structure (Section 3)
- ✅ 8-13+ contracts ([CONTRACTS.md](standards/CONTRACTS.md))
- ✅ All relevant binding methods ([SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md))
- ✅ Complete config file with 20+ sections ([SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md))
- ✅ API controllers, requests, resources, and routes
- ✅ Import handlers with schema files
- ✅ Export handlers with blade views
- ✅ Actions and events

**Examples of CRUD packages:**
- `crm/contact` - Reference implementation
- `crm/customer`, `crm/project`, `crm/task`
- `core/user`, `core/employee`, `core/profile`
- `cms/page`, `cms/post`, `cms/menu`

### 1.2 Utility Packages (Simplified Compliance)

Utility packages provide infrastructure, traits, components, or wrappers. These packages do NOT require API endpoints, exports, or imports.

**Characteristics:**
- Provides reusable traits for other packages
- Wraps third-party libraries
- Provides Livewire/Blade components
- Provides middleware, validation rules, or helpers
- Does not manage standalone business entities

**Requirements:**
- ✅ Basic ServiceProvider with `configurePackage()`
- ✅ Config file with relevant sections only
- ✅ Model contracts (if has models)
- ✅ `registerModelBindings()` (if has models)
- ❌ No API required
- ❌ No exports/imports required
- ❌ No `Contracts/Admin/` or `Contracts/Api/` subdirectories required
- ❌ No nested config structure required

**Core utility packages:**

| Package | Purpose | Type |
|---------|---------|------|
| `core/activity` | Activity logging traits | Trait provider (extends Spatie) |
| `core/backup` | Backup configuration | Wrapper (wraps Spatie) |
| `core/captcha` | CAPTCHA validation | Validation utility |
| `core/chart` | Chart components | Livewire components |
| `core/core` | Meta package | Placeholder |
| `core/dashboard` | Dashboard builder | Landing page |
| `core/editor` | WYSIWYG editor | Component wrapper |
| `core/module` | Framework base | Abstract classes (AbstractModel, AbstractImport, AbstractExport) |
| `core/security` | Security helpers | Middleware/helpers |
| `core/two-factor` | 2FA authentication | Authentication traits |

### 1.3 Polymorphic Manager Packages (Special Case)

Some packages provide **both** polymorphic relationship traits AND require full CRUD compliance. These packages:
- Provide traits for parent models (e.g., `HasDocuments`, `HasImages`, `HasNotes`)
- Also require full API for direct management of the entities themselves

**Polymorphic manager packages with CRUD compliance:**

| Package | Model | Trait Provided | Status |
|---------|-------|----------------|--------|
| `core/document` | Document | `HasDocuments` | 90% (API, exports, imports complete) |
| `core/image` | Image | `HasImages` | 90% (API, exports, imports complete) |
| `core/note` | Note | `HasNotes` | 90% (API, exports, imports complete) |

**Why these have CRUD compliance:**
1. Users may need to manage documents/images/notes directly (not just through parent entities)
2. External systems may need API access to these resources
3. Bulk import/export of media assets is a common requirement

**Pattern:** These packages must implement both:
- Relationship traits in `src/Traits/` (e.g., `HasDocuments`)
- Full API stack (controllers, requests, resources, routes)

### 1.5 Determining Package Type

Ask these questions to classify a package:

1. **Does it manage a database entity that users create/edit/delete?**
   - Yes → CRUD package
   - No → Utility package

2. **Would external systems need API access to this data?**
   - Yes → CRUD package (needs API)
   - No → Utility package

3. **Would users need to bulk import/export this data?**
   - Yes → CRUD package (needs imports/exports)
   - No → Utility package

4. **Is the primary purpose to provide traits/components for other packages?**
   - Yes → Utility package
   - No → Likely CRUD package

### 1.6 Compliance Summary

| Requirement | CRUD Package | Utility Package |
|-------------|--------------|-----------------|
| ServiceProvider | Full (7+ binding methods) | Basic (1-2 binding methods) |
| Config sections | 20+ | 5-10 |
| Contracts | 8-13+ | 1-3 (models only) |
| API (routes, controllers, resources) | Required | Not required |
| Exports | Required | Not required |
| Imports | Required | Not required |
| Actions | Required | Optional |
| Events | Required | Optional |
| Contracts/Admin/ subdirectory | Required | Not required |
| Contracts/Api/ subdirectory | Required | Not required |
| Nested config (controllers.admin/api) | Required | Not required |
| composer.json standards (Section 3.3) | Required | Required |
| PHPUnit tests (not Pest) | Required | Required |
| Migration stubs (no datetime prefix) | Required | Required (if has migrations) |
| Audit checklist score target | 70%+ (62/88) | N/A |

---

## 2. Architecture Overview

### 2.1 PackageTools Binding System

All Bespoke packages extend `Bespoke\PackageTools\PackageServiceProvider`, which provides a contract-first, config-driven dependency injection pattern.

**Core Principles:**

1. **Contract-First Development** - Every implementation class MUST have a corresponding interface (contract)
2. **Config-Driven Bindings** - All concrete implementations are declared in the package config file
3. **ServiceProvider Binding Methods** - All bindings are registered using dedicated `register*Bindings()` methods
4. **Separation of Concerns** - Admin and API functionality are separated into different namespaces
5. **No Concrete Implementations** - Code MUST reference contracts, never concrete classes (enables extensibility)
6. **Package Extensibility** - Packages are designed to be extended by Laravel applications via config overrides

### 2.2 Service Provider Lifecycle

```
register()
├─ registeringPackage()           [Hook: Override in your provider]
├─ registerPaths()                 [PackageTools: Sets up paths]
├─ configurePackage()              [Required: Override in your provider]
├─ registerConfigs()               [PackageTools: Publishes config]
├─ registerAliases()               [PackageTools: From config.aliases]
├─ registerBindings()              [PackageTools: Calls all binding methods]
│  ├─ registerActionBindings()    [Override if needed]
│  ├─ registerControllerBindings() [Override if needed]
│  ├─ registerDataBindings()      [Override if needed]
│  ├─ registerEnumBindings()      [Override if needed]
│  ├─ registerFactoryBindings()   [Override if needed]
│  ├─ registerImportBindings()    [Override if needed]
│  ├─ registerModelBindings()     [Override if needed]
│  ├─ registerParserBindings()    [Override if needed]
│  ├─ registerRequestBindings()   [Override if needed]
│  ├─ registerResourceBindings()  [Override if needed]
│  ├─ registerResponseBindings()  [Override if needed]
│  ├─ registerRouteModelBindings() [Override if needed]
│  ├─ registerServiceBindings()   [Override if needed]
│  └─ registerRuleBindings()      [Override if needed]
└─ packageRegistered()             [Hook: Override in your provider]

boot()
├─ bootingPackage()                [Hook: Override in your provider]
├─ bootAssets()                    [PackageTools: From config]
├─ bootBladeComponents()           [PackageTools: From config.components]
├─ bootCommands()                  [PackageTools: From config.commands]
├─ bootConsoleCommands()           [PackageTools: From hasCommands()]
├─ bootConfigs()                   [PackageTools: Publishes config]
├─ bootInertia()                   [PackageTools: If using Inertia]
├─ bootListeners()                 [PackageTools: From config.listeners]
├─ bootLivewireComponents()        [PackageTools: From config.livewire]
├─ bootMigrations()                [PackageTools: From config.migrations]
├─ bootMiddleware()                [PackageTools: From config.middlewares]
├─ bootProviders()                 [PackageTools: Additional providers]
├─ bootRoutes()                    [PackageTools: From config.routes]
├─ bootTranslations()              [PackageTools: If hasTranslations()]
├─ bootViews()                     [PackageTools: If hasViews()]
├─ bootViewComponents()            [PackageTools: View components]
├─ bootViewComposers()             [PackageTools: View composers]
├─ bootViewSharedData()            [PackageTools: Shared view data]
└─ packageBooted()                 [Hook: Override in your provider]
```

### 2.3 Contract-First Development Approach

Every class that is registered via a binding method MUST have a contract (interface). **ALL controllers** (Admin, API, and any auxiliary controllers) MUST implement a contract interface.

**Why This Matters - Package Extensibility:**

Bespoke packages are designed to be extended by Laravel applications. When an application needs to customise behaviour, they:
1. Create a custom implementation that extends or replaces the package class
2. Update the package config to point to their custom class
3. The container automatically uses their implementation

This ONLY works if all code references contracts, not concrete classes.

> For detailed contract examples and extensibility patterns, see [SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md) and [CONTRACTS.md](standards/CONTRACTS.md).

### 2.4 Config-Driven Dependency Injection Pattern

All concrete implementations are declared in the config file and bound in the ServiceProvider:

```php
// config/contact.php
'controllers' => [
    'admin' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
    ],
],

// ContactServiceProvider.php
protected function registerControllerBindings(): void
{
    $this->app->bind(ContactControllerContract::class, function ($app) {
        return $app->make($app->config['contact.controllers.admin.contact']);
    });
}
```

> For complete ServiceProvider template and all binding method patterns, see [SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md).

---

## 3. Required Directory Structure

### 3.1 Complete Directory Tree

```
package-name/
├── config/
│   └── package-name.php          ⚠️  REQUIRED - Package configuration
├── database/
│   ├── factories/                ⚠️  REQUIRED - Model factories
│   │   └── ModelFactory.php
│   ├── migrations/               ⚠️  REQUIRED - Database migrations (stub files)
│   │   └── create_table.php.stub
│   └── seeders/                  📋 OPTIONAL - Database seeders
├── resources/
│   ├── lang/                     ⚠️  REQUIRED - Translation files
│   │   └── en/
│   ├── schema/                   ⚠️  REQUIRED - Import schema files
│   │   └── entities.tsv
│   └── views/                    ⚠️  REQUIRED - Blade views
│       ├── admin/
│       ├── exports/              ⚠️  REQUIRED - Export views
│       └── livewire/
├── routes/
│   ├── admin.php                 ⚠️  REQUIRED - Admin routes
│   └── api.php                   ⚠️  REQUIRED - API routes
├── src/
│   ├── PackageServiceProvider.php ⚠️  REQUIRED - Service provider
│   ├── Actions/                  ⚠️  REQUIRED - Business logic actions
│   │   └── CreateModel.php
│   ├── Commands/                 📋 OPTIONAL - Artisan commands
│   │   └── ImportCommand.php
│   ├── Contracts/                ⚠️  REQUIRED - All interfaces
│   │   ├── Admin/                ⚠️  REQUIRED - Admin contracts
│   │   │   ├── ModelController.php
│   │   │   ├── UpdateModel.php
│   │   │   └── ...
│   │   ├── Api/                  📋 OPTIONAL - API contracts (if separate)
│   │   ├── Model.php             ⚠️  REQUIRED - Model contract
│   │   ├── ModelImport.php       ⚠️  REQUIRED - Import contract
│   │   ├── ModelExport.php       ⚠️  REQUIRED - Export contract
│   │   ├── CreateModel.php       ⚠️  REQUIRED - Action contracts
│   │   └── CustomRule.php        📋 OPTIONAL - Rule contracts
│   ├── Events/                   ⚠️  REQUIRED - Domain events
│   │   ├── ModelCreated.php
│   │   └── ModelUpdated.php
│   ├── Exports/                  ⚠️  REQUIRED - Export handlers
│   │   └── ModelExport.php
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Admin/            ⚠️  REQUIRED - Admin controllers
│   │   │   │   └── ModelController.php
│   │   │   └── Api/              ⚠️  REQUIRED - API controllers
│   │   │       └── ModelController.php
│   │   ├── Requests/
│   │   │   ├── Admin/            ⚠️  REQUIRED - Admin form requests
│   │   │   │   ├── UpdateModel.php
│   │   │   │   └── ...
│   │   │   └── Api/              ⚠️  REQUIRED - API requests
│   │   │       ├── StoreModel.php
│   │   │       └── UpdateModel.php
│   │   └── Resources/            ⚠️  REQUIRED - API resources
│   │       ├── ModelResource.php
│   │       └── ModelCollection.php
│   ├── Imports/                  ⚠️  REQUIRED - Import handlers
│   │   └── ModelImport.php
│   ├── Interfaces/               📋 OPTIONAL - Legacy interfaces (use Contracts/)
│   ├── Listeners/                📋 OPTIONAL - Event listeners
│   ├── Livewire/                 📋 OPTIONAL - Livewire components
│   │   └── Admin/
│   ├── Models/                   ⚠️  REQUIRED - Eloquent models
│   │   └── Model.php
│   ├── Rules/                    📋 OPTIONAL - Validation rules
│   │   └── CustomRule.php
│   └── Traits/                   📋 OPTIONAL - Model traits
│       ├── HasModel.php
│       └── HasModels.php
├── tests/                        ⚠️  REQUIRED - PHPUnit tests (NOT Pest)
│   ├── ExampleTest.php
│   └── TestCase.php
├── ARCHITECTURE.md               📋 OPTIONAL - Architecture documentation
├── CLAUDE.md                     ⚠️  REQUIRED - Claude Code guidance
├── CHANGELOG.md                  📋 OPTIONAL - Version changelog
├── composer.json                 ⚠️  REQUIRED - Composer config
├── phpstan.neon.dist             ⚠️  REQUIRED - PHPStan config
├── phpunit.xml.dist              ⚠️  REQUIRED - PHPUnit config
├── pint.json                     ⚠️  REQUIRED - Pint formatting config
└── README.md                     📋 OPTIONAL - Package documentation
```

**Legend:**
- ⚠️  REQUIRED - Must be present in all CRUD packages
- 📋 OPTIONAL - Include if functionality exists

### 3.2 Directory Purpose Explanations

| Directory | Purpose | When Required |
|-----------|---------|---------------|
| `src/Actions/` | Business logic encapsulation, reusable operations | All packages with create/update logic |
| `src/Commands/` | Artisan CLI commands | Packages with import/export or maintenance tasks |
| `src/Contracts/` | All interface definitions (contracts) | All packages - REQUIRED |
| `src/Contracts/Admin/` | Admin-specific contracts (controllers, requests) | All packages with admin UI |
| `src/Events/` | Domain events (ModelCreated, ModelUpdated, etc.) | All packages with state changes |
| `src/Exports/` | Export handlers (Excel, CSV, etc.) | All packages - REQUIRED |
| `src/Http/Controllers/Admin/` | Admin panel controllers | All packages with admin UI |
| `src/Http/Controllers/Api/` | RESTful API controllers | All packages - REQUIRED |
| `src/Http/Requests/Admin/` | Admin form validation | All packages with admin forms |
| `src/Http/Requests/Api/` | API request validation (Store, Update) | All packages with API |
| `src/Http/Resources/` | API response transformers | All packages with API |
| `src/Imports/` | Import handlers (Excel, CSV, TSV) | All packages - REQUIRED |
| `src/Livewire/` | Livewire components | Packages using Livewire |
| `src/Models/` | Eloquent models | All packages - REQUIRED |
| `src/Rules/` | Custom validation rules | Packages with complex validation |
| `src/Traits/` | Relationship traits (HasModel, HasModels) | Packages with polymorphic relationships |
| `resources/schema/` | Import schema files (.tsv) | All packages with imports |
| `resources/views/exports/` | Export blade templates | All packages with exports |
| `routes/admin.php` | Admin panel routes | All packages with admin UI |
| `routes/api.php` | RESTful API routes | All packages - REQUIRED |

### 3.3 composer.json Requirements

**Applies to:** All packages except those in the `workbench/` directory.

Every package MUST have a `composer.json` file that follows these conventions. Use `/crm/contact/composer.json` as the reference implementation.

#### 3.3.1 Required Dependencies (`require`)

```json
{
    "require": {
        "php": "^8.2",
        "bespoke-uk/package-tools": "^10.0"
    }
}
```

All packages MUST require `php ^8.2` and `bespoke-uk/package-tools ^10.0`. Additional package-specific dependencies (e.g., `bespoke-uk/module`) should be added as needed.

#### 3.3.2 Required Dev Dependencies (`require-dev`)

```json
{
    "require-dev": {
        "laravel/pint": "^1.14",
        "larastan/larastan": "^2.7.0|^3.0",
        "nunomaduro/collision": "^8.1.1||^7.10.0",
        "orchestra/testbench": "^8.0|^9.0|^10.0",
        "phpstan/phpstan": "^1.10.57 || ^2.0.2",
        "phpstan/extension-installer": "^1.3",
        "phpstan/phpstan-deprecation-rules": "^1.1",
        "phpstan/phpstan-phpunit": "^1.3",
        "phpunit/phpunit": "^9.3 || ^10.1 || ^11.0.10",
        "rector/rector": "^1.2",
        "driftingly/rector-laravel": "^1.2",
        "webmozart/assert": "^2.1"
    }
}
```

**All dev dependencies listed above are mandatory.** This ensures consistent tooling across all packages for formatting, static analysis, testing, and refactoring.

#### 3.3.3 Required Scripts (`scripts`)

```json
{
    "scripts": {
        "analyse": "vendor/bin/phpstan analyse --memory-limit=256M",
        "format": "vendor/bin/pint",
        "test": "vendor/bin/phpunit --no-coverage",
        "test:parallel": "paratest",
        "test:coverage": [
            "Composer\\Config::disableProcessTimeout",
            "XDEBUG_MODE=coverage vendor/bin/phpunit"
        ],
        "clear": "@php vendor/bin/testbench package:purge-{package-name} --ansi",
        "prepare": "@php vendor/bin/testbench package:discover --ansi",
        "build": [
            "@composer run prepare",
            "@php vendor/bin/testbench workbench:build --ansi"
        ],
        "start": [
            "Composer\\Config::disableProcessTimeout",
            "@composer run build",
            "@php vendor/bin/testbench serve"
        ],
        "post-autoload-dump": "@composer run prepare"
    }
}
```

**Important:** The `clear` script MUST use the actual package name. For example:
- `bespoke-uk/contact` → `package:purge-contact`
- `bespoke-uk/country` → `package:purge-country`
- `bespoke-uk/blade-button` → `package:purge-blade-button`

#### 3.3.4 Required Config (`config`)

```json
{
    "config": {
        "sort-packages": true,
        "allow-plugins": {
            "pestphp/pest-plugin": true,
            "phpstan/extension-installer": true
        }
    }
}
```

`sort-packages` ensures dependencies are kept in alphabetical order. The `allow-plugins` section permits PHPStan's extension installer and the Pest plugin (included for compatibility, even though packages use PHPUnit).

### 3.4 Testing Requirements

**All packages use PHPUnit, NOT Pest.** If Pest test files are found in the `tests/` directory (e.g., `Pest.php`, files using `test()` or `it()` syntax), they MUST be removed and replaced with PHPUnit equivalents.

Use `/crm/contact/tests/` as the reference implementation. Every package MUST have at minimum:

#### TestCase.php

```php
<?php

declare(strict_types=1);

namespace Bespoke\{Package}\Tests;

use Bespoke\{Package}\{Package}ServiceProvider;
use Bespoke\PackageTools\Actions\RunMigrations;
use Bespoke\PackageTools\Helpers\Testing;
use Illuminate\Database\Eloquent\Factories\Factory;
use Livewire\LivewireServiceProvider;
use Orchestra\Testbench\TestCase as Orchestra;

class TestCase extends Orchestra
{
    protected function setUp(): void
    {
        parent::setUp();

        Factory::guessFactoryNamesUsing(
            fn (string $modelName) => 'Bespoke\\{Package}\\Database\\Factories\\'.class_basename($modelName).'Factory'
        );
        // Run migrations if we're running package tests
        if ($this->app->runningUnitTests() && Testing::fromPackage(basePath: __DIR__)) {
            RunMigrations::fromPackageStubs(package: '{package-name}', basePath: __DIR__);
        }
    }

    protected function getPackageProviders($app): array
    {
        return [
            {Package}ServiceProvider::class,
            LivewireServiceProvider::class,
        ];
    }

    public function getEnvironmentSetUp($app): void
    {
        config()->set('database.default', 'testing');
    }
}
```

**Replace** `{Package}` with the PascalCase package name (e.g., `Contact`, `Country`) and `{package-name}` with the kebab-case package name (e.g., `contact`, `country`).

#### ExampleTest.php

```php
<?php

declare(strict_types=1);

namespace Bespoke\{Package}\Tests;

class ExampleTest extends TestCase
{
    /** @test */
    public function it_can_test(): void
    {
        $this->assertTrue(true);
    }
}
```

**Identifying Pest files to remove:**
- `tests/Pest.php` — Pest configuration file
- Any test file using `test('...')`, `it('...')`, `uses()`, `expect()`, or `beforeEach()` function syntax
- `tests/ArchTest.php` or similar Pest-specific test files

### 3.5 Migration Naming Convention

Database migrations are published as **stub files** and MUST NOT have a datetime prefix. They use the `.php.stub` extension.

```
# ❌ WRONG - Datetime prefix (Laravel default for app migrations)
database/migrations/2024_01_15_000000_create_contacts_table.php

# ✅ CORRECT - No datetime prefix, .php.stub extension
database/migrations/create_contacts_table.php.stub
```

**Why:** Package migrations are stubs that get published to the consuming Laravel application. The application assigns timestamps at publish time. Including a datetime prefix in the package causes ordering conflicts and prevents re-publishing.

**Reference:** See `/crm/contact/database/migrations/` which contains `create_contacts_table.php.stub`.

The migration filename (without extension) is also used in the config `migrations` array:

```php
'migrations' => [
    'create_contacts_table',
],
```

---

## 4. Contract Requirements

> **Full documentation:** [standards/CONTRACTS.md](standards/CONTRACTS.md)

Every CRUD package MUST have at minimum 10-15 contracts. Contracts are located in `src/Contracts/` (NOT `src/Interfaces/`).

**Required contract types:**

| Contract Type | Location | Required |
|---------------|----------|----------|
| Model | `src/Contracts/` | ✅ Always |
| Admin Controller | `src/Contracts/Admin/` | ✅ If admin UI |
| Admin Requests | `src/Contracts/Admin/` | ✅ If admin forms |
| API Controller | `src/Contracts/Api/` | ✅ If API |
| API Requests | `src/Contracts/Api/` | ✅ If API |
| API Resources | `src/Contracts/Api/` | ✅ If API |
| Actions | `src/Contracts/` | ✅ If actions exist |
| Import | `src/Contracts/` | ✅ Always |
| Export | `src/Contracts/` | ✅ Always |
| Validation Rules | `src/Contracts/` | 📋 If custom rules |

See [CONTRACTS.md](standards/CONTRACTS.md) for complete examples of each contract type, naming conventions, and the marker interface pattern.

---

## 5. ServiceProvider Implementation

> **Full documentation:** [standards/SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md)

The ServiceProvider is the heart of every package. It extends `PackageServiceProvider` and configures the package through `configurePackage()` and binding methods.

**Key topics covered in the sub-document:**
- Complete ServiceProvider template with all 14 binding methods
- `configurePackage()` pattern
- Each binding method with full implementation example
- Lifecycle hooks (`registeringPackage`, `packageRegistered`, `bootingPackage`, `packageBooted`)

See [SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md) for the complete reference.

---

## 6. Complete Config File Reference

> **Full documentation:** [standards/SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md) (Section 6)

CRUD packages require 20+ config sections. The config file uses nested structure for `controllers`, `requests`, and `resources`.

**Required sections (in order):**
`aliases`, `actions`, `casts`, `commands`, `components`, `controllers`, `defaults`, `export`, `fillable`, `import`, `listeners`, `livewire`, `loggable`, `middlewares`, `migrations`, `models`, `module`, `requests`, `resources`, `responses`, `routes`, `route_prefixes`, `rules`

See [SERVICEPROVIDER.md](standards/SERVICEPROVIDER.md) for the complete config file template with all sections.

---

## 7. Code Examples for Each Component

> **Full documentation:** [standards/CODE_EXAMPLES.md](standards/CODE_EXAMPLES.md)

Complete implementation examples for every component type:

| Component | Section |
|-----------|---------|
| Admin Controllers | 7.1 |
| API Controllers, Requests, Resources, Routes | 7.2 |
| Actions (Polymorphic + Standalone CRUD) | 7.3 |
| Import Handlers | 7.4 |
| Export Handlers | 7.5 |
| Models | 7.6 |
| Relationship Traits | 7.7 |

See [CODE_EXAMPLES.md](standards/CODE_EXAMPLES.md) for all examples.

---

## 8. Binding Pattern Reference Table

| Binding Method | Config Key Pattern | Contract Namespace | Implementation Namespace | Usage Context |
|----------------|-------------------|-------------------|-------------------------|---------------|
| `registerActionBindings()` | `actions.action_name` | `Contracts\ActionName` | `Actions\ActionName` | Business logic, reusable operations |
| `registerControllerBindings()` | `controllers.admin.name`<br>`controllers.api.name` | `Contracts\Admin\NameController`<br>`Contracts\Api\NameController` | `Http\Controllers\Admin\NameController`<br>`Http\Controllers\Api\NameController` | Web/API controllers |
| `registerDataBindings()` | `data.data_name` | `Contracts\DataName` | `Data\DataName` | Data transfer objects |
| `registerEnumBindings()` | `enums.enum_name` | `Contracts\EnumName` | `Enums\EnumName` | Enumeration types |
| `registerExportBindings()` | `export.entity` | `Contracts\EntityExport` | `Exports\EntityExport` | Export handlers |
| `registerFactoryBindings()` | `factories.factory_name` | `Contracts\FactoryName` | `Factories\FactoryName` | Non-model factories |
| `registerImportBindings()` | `import.entity` | `Contracts\EntityImport` | `Imports\EntityImport` | Import handlers |
| `registerModelBindings()` | `models.model_name` | `Contracts\ModelName` | `Models\ModelName` | Eloquent models |
| `registerParserBindings()` | `parsers.parser_name` | `Contracts\ParserName` | `Parsers\ParserName` | File parsers |
| `registerRequestBindings()` | `requests.admin.name`<br>`requests.api.name` | `Contracts\Admin\Name`<br>`Contracts\Api\StoreName`<br>`Contracts\Api\UpdateName` | `Http\Requests\Admin\Name`<br>`Http\Requests\Api\StoreName`<br>`Http\Requests\Api\UpdateName` | Form validation |
| `registerResourceBindings()` | `resources.name`<br>`resources.name_collection` | `Contracts\Api\NameResource`<br>`Contracts\Api\NameCollection` | `Http\Resources\NameResource`<br>`Http\Resources\NameCollection` | API transformers |
| `registerResponseBindings()` | `responses.response_name` | `Contracts\ResponseName` | `Http\Responses\ResponseName` | Response objects |
| `registerRouteModelBindings()` | `models.model_name` | (Uses model contract) | (Uses model class) | Route parameters |
| `registerRuleBindings()` | `rules.rule_name` | `Contracts\RuleName` | `Rules\RuleName` | Custom validation |
| `registerServiceBindings()` | `services.service_name` | `Contracts\ServiceName` | `Services\ServiceName` | Service layer |

**Important:** API requests AND resources both require contracts in `Contracts/Api/`. Use container resolution (`app(Contract::class, ['resource' => $model])`) to instantiate resources.

---

## 9. Audit Checklist

> **Full documentation:** [standards/AUDIT_CHECKLIST.md](standards/AUDIT_CHECKLIST.md)

**IMPORTANT:** The checklist applies to **CRUD packages only**. Utility packages do not need to meet these requirements.

The audit checklist covers 88 points across 7 categories:

| Category | Points | Focus |
|----------|--------|-------|
| Directory Structure | /29 | Required dirs, composer.json, tests, migrations |
| Contracts | /10 | Required contract files and naming |
| Binding Methods | /10 | ServiceProvider binding implementations |
| Config File | /10 | Required sections and nested structure |
| Implementation Classes | /14 | Controllers, requests, resources, actions |
| Routes | /8 | Admin and API route files |
| Events & Listeners | /7 | Domain events |
| **Total** | **/88** | Grade: A (80%+), B (70-79%), C (60-69%) |

The sub-document also includes pre-commit verification commands, contract-implementation alignment checks, and lessons learned from previous audits.

See [AUDIT_CHECKLIST.md](standards/AUDIT_CHECKLIST.md) for the complete checklist.

---

## 10. Common Pitfalls

> **Full documentation:** [standards/COMMON_PITFALLS.md](standards/COMMON_PITFALLS.md)

22 documented pitfalls with code examples and solutions:

| # | Pitfall | Severity |
|---|---------|----------|
| 1 | Using `Interfaces/` instead of `Contracts/` | High |
| 2 | Missing API functionality entirely | High |
| 3 | No export/import functionality | High |
| 4 | Missing binding methods in ServiceProvider | High |
| 5 | Flat config structure | Medium |
| 6 | API routes using IDs instead of UUIDs | Medium |
| 7 | Missing API request contracts | High |
| 8 | Actions without contracts | Medium |
| 9 | Forcing CRUD patterns on utility packages | Medium |
| 10-22 | See sub-document for full list | Various |

See [COMMON_PITFALLS.md](standards/COMMON_PITFALLS.md) for all pitfalls with detailed explanations and solutions.

---

## 11. Quick Reference

### 11.1 Minimum Viable CRUD Package Checklist

**Must Have (100% required):**

1. **Config file** (`config/package-name.php`) with 15+ sections
2. **ServiceProvider** with 5+ binding methods
3. **Model** with contract
4. **Admin Controller** with contract and CRUD methods
5. **Admin Routes** (`routes/admin.php`)
6. **API Controller** with RESTful methods (index, store, show, update, destroy)
7. **API Requests** (StoreModel, UpdateModel)
8. **API Resources** (ModelResource, ModelCollection)
9. **API Routes** (`routes/api.php`) with UUID binding
10. **Import Handler** with contract and schema file
11. **Export Handler** with contract and blade view
12. **Action Classes** with contracts (CreateModel minimum)
13. **Events** (ModelCreated minimum)
14. **Migrations** as `.php.stub` files (no datetime prefix), with ordered config
15. **Tests** directory with PHPUnit `TestCase.php` and `ExampleTest.php` (not Pest)
16. **composer.json** with standard require, require-dev, scripts, and config sections (Section 3.3)

### 11.2 File Count Expectations

| Package Complexity | Minimum Files | Typical Files | Example Package |
|-------------------|---------------|---------------|-----------------|
| Simple (single model, basic CRUD) | 25-30 | 35-40 | Not shown |
| Standard (single model, full features) | 40-50 | 55-65 | `/crm/contact` |
| Complex (multiple models, relationships) | 60-80 | 80-100+ | `/core/auth` |

**Contact Package File Count:** ~65 files

### 11.3 Key Files for Copy/Paste Starting Point

When creating a new package, use these files from `/crm/contact` as templates:

1. **ServiceProvider:** `src/ContactServiceProvider.php` - Complete binding example
2. **Config:** `config/contact.php` - All 22 sections
3. **Model:** `src/Models/Contact.php` - Trait composition pattern
4. **Admin Controller:** `src/Http/Controllers/Admin/ContactController.php` - CRUD methods
5. **API Controller:** `src/Http/Controllers/Api/ContactController.php` - RESTful methods
6. **API StoreRequest:** `src/Http/Requests/Api/StoreContact.php` - Validation pattern
7. **API Resource:** `src/Http/Resources/ContactResource.php` - Transformation pattern
8. **Import:** `src/Imports/ContactImport.php` - Import logic
9. **Export:** `src/Exports/ContactExport.php` - Export logic
10. **Action:** `src/Actions/CreateContact.php` - Business logic pattern
11. **Admin Routes:** `routes/admin.php` - Route patterns
12. **API Routes:** `routes/api.php` - RESTful route patterns

### 11.4 Links to Exemplary Packages

| Package | Path | Reason |
|---------|------|--------|
| **Contact** | `/crm/contact` | Reference implementation - 100% compliant |
| **Auth** | `/core/auth` | Complex multi-controller package |
| **User** | `/core/user` | Core package with extensive relationships |
| **Module** | `/core/module` | Base abstracts (AbstractModel, AbstractImport, etc.) |
| **Package Tools** | `/template/package-tools` | Framework package |

### 11.5 Quick Commands

```bash
# Audit package structure
find src/ -type d | sort

# Count contracts
find src/Contracts -name "*.php" | wc -l

# Check binding methods in ServiceProvider
grep -n "protected function register.*Bindings" src/*ServiceProvider.php

# List all config sections
grep -E "^\s+/\*\*" config/*.php

# Verify API routes exist
test -f routes/api.php && echo "✓ API routes exist" || echo "✗ Missing API routes"

# Check for Interfaces vs Contracts
test -d src/Interfaces && echo "⚠ Using old Interfaces/ directory" || echo "✓ Using Contracts/"

# Check for Pest test files
test -f tests/Pest.php && echo "⚠ Pest.php found - replace with PHPUnit" || echo "✓ No Pest files"

# Check migration naming (should NOT have datetime prefix)
ls database/migrations/ 2>/dev/null | grep -E "^[0-9]{4}_" && echo "⚠ Migrations have datetime prefix" || echo "✓ Migration naming correct"

# Verify PHPUnit TestCase exists
test -f tests/TestCase.php && echo "✓ TestCase.php exists" || echo "✗ Missing tests/TestCase.php"
```

---

## Appendix A: Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.9 | 2026-02-06 | **Document reorganisation:** Split into concise index + 5 focused sub-documents in `docs/standards/`. No content changes — all information preserved. Sub-documents: CONTRACTS.md, SERVICEPROVIDER.md, CODE_EXAMPLES.md, AUDIT_CHECKLIST.md, COMMON_PITFALLS.md. |
| 1.8 | 2026-02-06 | **Composer & testing standards:** Added Section 3.3 (composer.json Requirements) defining mandatory require, require-dev, scripts, and config sections for all packages. Added Section 3.4 (Testing Requirements) mandating PHPUnit over Pest with reference TestCase and ExampleTest examples. Added Section 3.5 (Migration Naming Convention) requiring `.php.stub` extension and no datetime prefix. Updated directory tree to reflect correct migration naming and test file structure. |
| 1.7 | 2026-02-05 | **Actions layer standardisation:** Expanded Section 7.3 with standalone CRUD action patterns (Create/Update/Delete). Added complete examples for action contracts, ServiceProvider registration, and config. Added note on import alias conflicts. Fixed `ContactsInterface` → `Contracts\Contacts` reference. Updated default packages (continent, country, redirect) now have full Actions layer. See ADR-012 in DECISIONS.md. |
| 1.6 | 2026-02-04 | **Service contracts:** Added pitfalls 10.20-10.21 (Empty Contract Interfaces, Service Classes Not Implementing Contracts) with detection commands. Updated Section 12.6 lessons learned with default package audit findings. |
| 1.5 | 2026-02-04 | **Extensibility focus:** Added core principles 5-6 (No Concrete Implementations, Package Extensibility). Expanded Section 2.3 with extensibility example. Added pitfall 10.18 (Using Concrete Implementations Instead of Contracts). Updated verification commands and pre-commit checklist. |
| 1.4 | 2026-02-04 | **Major update:** API resources now require contracts. Added resource contract requirements, `registerResourceBindings()`, pitfall 10.17 (API controllers using concrete classes), updated audit checklists. |
| 1.3 | 2026-02-04 | Added Section 12 (Pre-Commit Verification Checklist), added pitfalls 10.14-10.17 based on core package audit findings |
| 1.2 | 2026-02-04 | Added polymorphic manager packages section, expanded binding examples |
| 1.1 | 2026-02-04 | Added Section 1 (Package Classification) distinguishing CRUD vs Utility packages |
| 1.0 | 2026-02-04 | Initial release based on Contact package analysis |

---

## Appendix B: Related Documentation

- **CLAUDE.md** - Claude Code guidance (repository root)
- **Package Tools CLAUDE.md** - `/template/package-tools/CLAUDE.md`
- **Package Tools ARCHITECTURE.md** - `/template/package-tools/ARCHITECTURE.md`
- **Contact Package CLAUDE.md** - `/crm/contact/CLAUDE.md`

---

**End of Document**
