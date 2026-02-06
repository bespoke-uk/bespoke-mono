# PACKAGE STANDARDS

This document codifies the architectural standards for all packages in the Bespoke CMS monorepo. These standards are based on the `bespoke-uk/contact` package implementation and the `bespoke-uk/package-tools` framework.

**Version:** 1.8
**Reference Implementation:** `/crm/contact`
**Last Updated:** 2026-02-06

---

## Table of Contents

1. [Package Classification](#1-package-classification)
2. [Architecture Overview](#2-architecture-overview)
3. [Required Directory Structure](#3-required-directory-structure)
4. [Contract Requirements](#4-contract-requirements)
5. [ServiceProvider Implementation](#5-serviceprovider-implementation)
6. [Complete Config File Reference](#6-complete-config-file-reference)
7. [Code Examples for Each Component](#7-code-examples-for-each-component)
8. [Binding Pattern Reference Table](#8-binding-pattern-reference-table)
9. [Audit Checklist](#9-audit-checklist)
10. [Common Pitfalls](#10-common-pitfalls)
11. [Quick Reference](#11-quick-reference)
12. [Pre-Commit Verification Checklist](#12-pre-commit-verification-checklist)

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
- ✅ 8-13+ contracts (Section 4)
- ✅ All relevant binding methods (Section 5)
- ✅ Complete config file with 20+ sections (Section 6)
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

This ONLY works if all code references contracts, not concrete classes. If any code imports a concrete class directly, the application cannot override that behaviour.

```php
// ❌ WRONG - No contract (cannot be extended by applications)
class ContactController extends AbstractController
{
    // Implementation
}

// ✅ CORRECT - Contract defined (application can swap implementation via config)
interface ContactController  // Contract in src/Contracts/Admin/
{
    public function index(): Factory|View|Application;
    public function show(Contact $contact): Factory|View|Application;
    // ... other methods
}

class ContactController extends AbstractController implements ContactControllerContract
{
    // Implementation
}
```

**Extensibility Example:**

```php
// In the Laravel application that uses the package:

// 1. Create custom controller extending the package controller
namespace App\Http\Controllers\Admin;

use Bespoke\Contact\Http\Controllers\Admin\ContactController as BaseController;

class ContactController extends BaseController
{
    public function index(): Factory|View|Application
    {
        // Custom behaviour
    }
}

// 2. Override in config/contact.php
'controllers' => [
    'admin' => [
        'contact' => \App\Http\Controllers\Admin\ContactController::class,
    ],
],

// 3. All code using the contract will now use the custom implementation
```

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

### 4.1 Comprehensive List of Required Contracts

Every CRUD package MUST have at minimum the following contracts:

| Contract Type | Location | Example | Required |
|---------------|----------|---------|----------|
| Model | `src/Contracts/` | `Contact.php` | ✅ Always |
| Admin Controller | `src/Contracts/Admin/` | `ContactController.php` | ✅ If admin UI |
| Admin Requests | `src/Contracts/Admin/` | `UpdateContact.php` | ✅ If admin forms |
| API Controller | `src/Contracts/Api/` | `ContactController.php` | ✅ If API |
| API Store Request | `src/Contracts/Api/` | `StoreContact.php` | ✅ If API |
| API Update Request | `src/Contracts/Api/` | `UpdateContact.php` | ✅ If API |
| API Resource | `src/Contracts/Api/` | `ContactResource.php` | ✅ If API |
| API Collection | `src/Contracts/Api/` | `ContactCollection.php` | ✅ If API |
| Actions | `src/Contracts/` | `CreateContact.php` | ✅ If actions exist |
| Import | `src/Contracts/` | `ContactImport.php` | ✅ Always |
| Export | `src/Contracts/` | `ContactExport.php` | ✅ Always |
| Validation Rules | `src/Contracts/` | `UniqueContactEmail.php` | 📋 If custom rules |

**Minimum Contract Count for CRUD Package:** 10-15 contracts

### 4.2 Contract Examples

#### 3.2.1 Model Contract (Marker Interface)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts;

/**
 * Contact Model Contract
 *
 * This is a marker interface that allows type-hinting against the
 * configured Contact model implementation.
 */
interface Contact
{
    // Marker interface - no methods required
    // Allows: app(Contact::class) to return configured model
}
```

**Location:** `src/Contracts/Contact.php`
**Purpose:** Enables dependency injection and model swapping

#### 3.2.2 Admin Controller Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts\Admin;

use Bespoke\Contact\Contracts\Contact;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

interface ContactController
{
    /**
     * Display a listing of contacts
     */
    public function index(): Factory|View|Application;

    /**
     * Show the form for creating a new contact
     */
    public function create(): RedirectResponse;

    /**
     * Display the specified contact
     */
    public function show(Contact $contact): Factory|View|Application;

    /**
     * Show the form for editing the specified contact
     */
    public function edit(Contact $contact): Factory|View|Application;

    /**
     * Update the specified contact in storage
     */
    public function update(UpdateContact $request, Contact $contact): RedirectResponse;

    /**
     * Remove the specified contact from storage
     */
    public function destroy(Contact $contact): RedirectResponse;
}
```

**Location:** `src/Contracts/Admin/ContactController.php`
**Methods:** Standard CRUD operations (index, create, show, edit, update, destroy)

#### 3.2.3 Admin Request Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts\Admin;

/**
 * Update Contact Form Request Contract
 */
interface UpdateContact
{
    // Marker interface for form request binding
    // Allows: app(UpdateContact::class) to return configured request class
}
```

**Location:** `src/Contracts/Admin/UpdateContact.php`
**Purpose:** Binds form request validation classes

#### 3.2.4 Action Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts;

use Bespoke\Contact\Interfaces\ContactsInterface;

/**
 * Create Contact Action Contract
 */
interface CreateContact
{
    /**
     * Create a contact for the given entity
     *
     * @param ContactsInterface $entity The entity to create contact for
     * @param array $data Contact data
     * @return Contact The created contact
     */
    public static function forEntity(ContactsInterface $entity, array $data = []): Contact;
}
```

**Location:** `src/Contracts/CreateContact.php`
**Methods:** Static action methods with clear signatures

#### 3.2.5 Import Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts;

/**
 * Contact Import Contract
 */
interface ContactImport
{
    /**
     * Import contacts from collection
     *
     * @param \Illuminate\Support\Collection $rows
     */
    public function collection(\Illuminate\Support\Collection $rows): void;

    /**
     * Update or create contact from row data
     *
     * @param array $row
     * @return Contact
     */
    public function updateOrCreateContact(array $row): Contact;
}
```

**Location:** `src/Contracts/ContactImport.php`
**Methods:** Collection processing and entity creation

#### 3.2.6 Export Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts;

use Illuminate\Contracts\View\View;

/**
 * Contact Export Contract
 */
interface ContactExport
{
    /**
     * Return the export view
     *
     * @return View
     */
    public function view(): View;

    /**
     * Apply styles to the export worksheet
     *
     * @param \PhpOffice\PhpSpreadsheet\Worksheet\Worksheet $sheet
     * @return array
     */
    public function styles(\PhpOffice\PhpSpreadsheet\Worksheet\Worksheet $sheet): array;
}
```

**Location:** `src/Contracts/ContactExport.php`
**Methods:** View rendering and worksheet styling

#### 3.2.7 Validation Rule Contract

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Contracts;

/**
 * Unique Contact Email Validation Rule Contract
 */
interface UniqueContactEmail
{
    /**
     * Determine if the validation rule passes
     *
     * @param string $attribute
     * @param mixed $value
     * @return bool
     */
    public function passes(string $attribute, mixed $value): bool;

    /**
     * Get the validation error message
     *
     * @return string
     */
    public function message(): string;
}
```

**Location:** `src/Contracts/UniqueContactEmail.php`
**Methods:** Validation logic (passes, message)

### 4.3 Namespace Conventions

| Contract Type | Namespace Pattern | Example |
|---------------|-------------------|---------|
| Model | `Bespoke\{Package}\Contracts` | `Bespoke\Contact\Contracts\Contact` |
| Admin Controller | `Bespoke\{Package}\Contracts\Admin` | `Bespoke\Contact\Contracts\Admin\ContactController` |
| Admin Request | `Bespoke\{Package}\Contracts\Admin` | `Bespoke\Contact\Contracts\Admin\UpdateContact` |
| API Controller | `Bespoke\{Package}\Contracts\Api` | `Bespoke\Contact\Contracts\Api\ContactController` |
| API Request | `Bespoke\{Package}\Contracts\Api` | `Bespoke\Contact\Contracts\Api\StoreContact` |
| API Resource | `Bespoke\{Package}\Contracts\Api` | `Bespoke\Contact\Contracts\Api\ContactResource` |
| API Collection | `Bespoke\{Package}\Contracts\Api` | `Bespoke\Contact\Contracts\Api\ContactCollection` |
| Action | `Bespoke\{Package}\Contracts` | `Bespoke\Contact\Contracts\CreateContact` |
| Import/Export | `Bespoke\{Package}\Contracts` | `Bespoke\Contact\Contracts\ContactImport` |
| Rule | `Bespoke\{Package}\Contracts` | `Bespoke\Contact\Contracts\UniqueContactEmail` |

**Important:** Do NOT use `Interfaces/` directory. Use `Contracts/` for all interfaces.

---

## 5. ServiceProvider Implementation

### 5.1 Complete ServiceProvider Template

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact;

use Bespoke\Contact\Contracts\Admin\ActivityController as ActivityControllerContract;
use Bespoke\Contact\Contracts\Admin\ContactController as ContactControllerContract;
use Bespoke\Contact\Contracts\Admin\MarketingController as MarketingControllerContract;
use Bespoke\Contact\Contracts\Admin\UpdateContact as UpdateContactContract;
use Bespoke\Contact\Contracts\Admin\UpdateMarketing as UpdateMarketingContract;
use Bespoke\Contact\Contracts\Api\ContactCollection as ContactCollectionContract;
use Bespoke\Contact\Contracts\Api\ContactController as ApiContactControllerContract;
use Bespoke\Contact\Contracts\Api\ContactResource as ContactResourceContract;
use Bespoke\Contact\Contracts\Api\StoreContact as ApiStoreContactContract;
use Bespoke\Contact\Contracts\Api\UpdateContact as ApiUpdateContactContract;
use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Contracts\ContactImport as ContactImportContract;
use Bespoke\Contact\Contracts\CreateContact as CreateContactContract;
use Bespoke\Contact\Contracts\UniqueContactEmail as UniqueContactEmailContract;
use Bespoke\PackageTools\Commands\InstallCommand;
use Bespoke\PackageTools\Package;
use Bespoke\PackageTools\PackageServiceProvider;

class ContactServiceProvider extends PackageServiceProvider
{
    /**
     * Configure the package
     */
    public function configurePackage(Package $package): void
    {
        $package
            ->name('contact')
            ->hasCommands($this->fromConfig('contact.commands'))
            ->hasConfigFile()
            ->hasMigrations($this->fromConfig('contact.migrations'))
            ->hasRoutes($this->fromConfig('contact.routes'))
            ->hasTranslations()
            ->hasViews()
            ->hasInstallCommand(function (InstallCommand $command) {
                $command
                    ->askToExtend()
                    ->askToMigrate();
            });
    }

    /**
     * Register action bindings
     */
    protected function registerActionBindings(): void
    {
        $this->app->bind(CreateContactContract::class, function ($app) {
            return $app->make($app->config['contact.actions.create_contact']);
        });
    }

    /**
     * Register controller bindings
     */
    protected function registerControllerBindings(): void
    {
        // Admin controllers
        $this->app->bind(ActivityControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.activity']);
        });
        $this->app->bind(ContactControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.contact']);
        });
        $this->app->bind(MarketingControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.marketing']);
        });
        // API controllers
        $this->app->bind(ApiContactControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.api.contact']);
        });
    }

    /**
     * Register import bindings
     */
    protected function registerImportBindings(): void
    {
        $this->app->bind(ContactImportContract::class, function ($app) {
            return $app->make($app->config['contact.import.contact']);
        });
    }

    /**
     * Register export bindings
     */
    protected function registerExportBindings(): void
    {
        $this->app->bind(ContactExportContract::class, function ($app) {
            return $app->make($app->config['contact.export.contact']);
        });
    }

    /**
     * Register model bindings
     */
    protected function registerModelBindings(): void
    {
        $this->app->bind(ContactContract::class, function ($app) {
            return $app->make($app->config['contact.models.contact']);
        });
    }

    /**
     * Register request bindings
     */
    protected function registerRequestBindings(): void
    {
        // Admin requests
        $this->app->bind(UpdateContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.admin.update_contact']);
        });
        $this->app->bind(UpdateMarketingContract::class, function ($app) {
            return $app->make($app->config['contact.requests.admin.update_marketing']);
        });
        // API requests
        $this->app->bind(ApiStoreContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.api.store_contact']);
        });
        $this->app->bind(ApiUpdateContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.api.update_contact']);
        });
    }

    /**
     * Register resource bindings (API resources)
     */
    protected function registerResourceBindings(): void
    {
        $this->app->bind(ContactResourceContract::class, function ($app) {
            return $app->make($app->config['contact.resources.contact']);
        });
        $this->app->bind(ContactCollectionContract::class, function ($app) {
            return $app->make($app->config['contact.resources.contact_collection']);
        });
    }

    /**
     * Register route model bindings
     */
    protected function registerRouteModelBindings(): void
    {
        // Bind the model to the route parameter
        $this->app['router']->model('contact', config('contact.models.contact'));
    }

    /**
     * Register validation rule bindings
     */
    protected function registerRuleBindings(): void
    {
        $this->app->bind(UniqueContactEmailContract::class, function ($app) {
            return $app->make($app->config['contact.rules.unique_contact_email']);
        });
    }
}
```

### 5.2 All 14 Binding Method Signatures

```php
/**
 * Register action class bindings (business logic)
 * Config key: actions.*
 */
protected function registerActionBindings(): void {}

/**
 * Register controller bindings (admin and API)
 * Config key: controllers.admin.*, controllers.api.*
 */
protected function registerControllerBindings(): void {}

/**
 * Register data object bindings (DTOs)
 * Config key: data.*
 */
protected function registerDataBindings(): void {}

/**
 * Register enum bindings
 * Config key: enums.*
 */
protected function registerEnumBindings(): void {}

/**
 * Register factory bindings (non-model factories)
 * Config key: factories.*
 */
protected function registerFactoryBindings(): void {}

/**
 * Register export handler bindings
 * Config key: export.*
 */
protected function registerExportBindings(): void {}

/**
 * Register import handler bindings
 * Config key: import.*
 */
protected function registerImportBindings(): void {}

/**
 * Register model bindings
 * Config key: models.*
 */
protected function registerModelBindings(): void {}

/**
 * Register parser bindings (file parsers, etc.)
 * Config key: parsers.*
 */
protected function registerParserBindings(): void {}

/**
 * Register form request bindings
 * Config key: requests.admin.*, requests.api.*
 */
protected function registerRequestBindings(): void {}

/**
 * Register API resource bindings
 * Config key: resources.*
 */
protected function registerResourceBindings(): void {}

/**
 * Register response object bindings
 * Config key: responses.*
 */
protected function registerResponseBindings(): void {}

/**
 * Register route model bindings (route parameters)
 * Uses: Router::model()
 */
protected function registerRouteModelBindings(): void {}

/**
 * Register validation rule bindings
 * Config key: rules.* (object rules only)
 */
protected function registerRuleBindings(): void {}

/**
 * Register service bindings (repositories, services)
 * Config key: services.*
 */
protected function registerServiceBindings(): void {}
```

### 5.3 Lifecycle Hook Usage

```php
/**
 * Called at the start of register() method
 * Use for: Pre-registration setup
 */
protected function registeringPackage(): void
{
    // Example: Register additional config files
}

/**
 * Called at the end of register() method
 * Use for: Post-registration tasks
 */
protected function packageRegistered(): void
{
    // Example: Merge additional config
}

/**
 * Called at the start of boot() method
 * Use for: Pre-boot setup
 */
protected function bootingPackage(): void
{
    // Example: Register observers
}

/**
 * Called at the end of boot() method
 * Use for: Post-boot tasks
 */
protected function packageBooted(): void
{
    // Example: Publish additional assets
}
```

### 5.4 configurePackage() Method Pattern

```php
public function configurePackage(Package $package): void
{
    $package
        ->name('contact')                                          // Package name (required)
        ->hasCommands($this->fromConfig('contact.commands'))      // Artisan commands
        ->hasConfigFile()                                         // config/contact.php
        ->hasMigrations($this->fromConfig('contact.migrations'))  // Ordered migrations
        ->hasRoutes($this->fromConfig('contact.routes'))          // Route files
        ->hasTranslations()                                       // resources/lang
        ->hasViews()                                              // resources/views
        ->hasInstallCommand(function (InstallCommand $command) {
            $command
                ->askToExtend()                                   // Prompt to extend models
                ->askToMigrate();                                 // Prompt to run migrations
        });
}
```

---

## 6. Complete Config File Reference

### 6.1 All 20+ Config Sections

```php
<?php

declare(strict_types=1);

return [
    /**
     * Aliases
     *
     * Class aliases for global access
     * Format: 'AliasName' => Alias::class
     */
    'aliases' => [
        'Contact' => \Bespoke\Contact\Contracts\Contact::class,
    ],

    /**
     * Actions
     *
     * Business logic action classes
     * Format: 'action_name' => Action::class
     */
    'actions' => [
        'create_contact' => \Bespoke\Contact\Actions\CreateContact::class,
    ],

    /**
     * Casts
     *
     * Model attribute casts
     * Single model: 'field_name' => Cast::class
     * Multi-model: 'model_name' => ['field_name' => Cast::class]
     */
    'casts' => [],

    /**
     * Commands
     *
     * Artisan console commands
     * Format: Command::class
     */
    'commands' => [
        \Bespoke\Contact\Commands\ImportContacts::class,
    ],

    /**
     * Blade Components
     *
     * Blade component registrations
     * Format: Component::class => 'component-alias'
     */
    'components' => [],

    /**
     * Controllers
     *
     * Controller class bindings (separated by context)
     * Format: 'admin' => ['controller_name' => Controller::class]
     *         'api' => ['controller_name' => Controller::class]
     */
    'controllers' => [
        'admin' => [
            'activity' => \Bespoke\Contact\Http\Controllers\Admin\ActivityController::class,
            'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
            'marketing' => \Bespoke\Contact\Http\Controllers\Admin\MarketingController::class,
        ],
        'api' => [
            'contact' => \Bespoke\Contact\Http\Controllers\Api\ContactController::class,
        ],
    ],

    /**
     * Defaults
     *
     * Default values for database migrations/fields
     */
    'defaults' => [
        'phone_prefix' => '+44',
        'mobile_prefix' => '+44',
        'status' => 'pending',
    ],

    /**
     * Export
     *
     * Export handler class binding
     * Format: 'entity' => Export::class
     */
    'export' => [
        'contact' => \Bespoke\Contact\Exports\ContactExport::class,
    ],

    /**
     * Fillable
     *
     * Mass-assignable model attributes
     * Single model: ['field_name']
     * Multi-model: 'model_name' => ['field_name']
     */
    'fillable' => [],

    /**
     * Import
     *
     * Import handler and schema file location
     * Required keys: handler class, schema_file path
     */
    'import' => [
        'contact' => \Bespoke\Contact\Imports\ContactImport::class,
        'schema_file' => file_exists(resource_path('schema').'/contacts.tsv')
            ? resource_path('schema').'/contacts.tsv'
            : __DIR__.'/../resources/schema/contacts.tsv',
    ],

    /**
     * Listeners
     *
     * Event to listener mappings
     * Format: Event::class => [Listener::class]
     */
    'listeners' => [],

    /**
     * Livewire Components
     *
     * Livewire component registrations
     * Format: Component::class => 'component-alias'
     */
    'livewire' => [
        \Bespoke\Contact\Livewire\Admin\ContactAutoComplete::class => 'admin.contact-auto-complete',
        \Bespoke\Contact\Livewire\Admin\ContactBuilder::class => 'admin.contact-builder',
        \Bespoke\Contact\Livewire\Admin\ContactCredentials::class => 'admin.contact-credentials',
        \Bespoke\Contact\Livewire\Admin\ContactDetails::class => 'admin.contact-details',
        \Bespoke\Contact\Livewire\Admin\ContactDataTable::class => 'admin.contact-data-table',
        \Bespoke\Contact\Livewire\Admin\ContactModal::class => 'admin.contact-modal',
        \Bespoke\Contact\Livewire\Admin\ContactModalButton::class => 'admin.contact-modal-button',
    ],

    /**
     * Loggable Fields (Activity Log)
     *
     * Fields to track in activity log
     * Single model: ['field_name']
     * Multi-model: 'model_name' => ['field_name']
     */
    'loggable' => [
        'first_name',
        'last_name',
        'email',
        'phone',
        'phone_prefix',
        'mobile',
        'mobile_prefix',
        'accepted_terms',
        'marketing_emails',
        'notification_emails',
        'notification_sms',
        'status',
    ],

    /**
     * Middlewares
     *
     * Middleware alias registrations
     * Format: 'middleware_name' => Middleware::class
     */
    'middlewares' => [],

    /**
     * Migrations
     *
     * Migration files in publish/run order
     * Format: ['migration_file_name'] (without .php extension)
     */
    'migrations' => [
        'create_contacts_table',
    ],

    /**
     * Models
     *
     * Model class bindings
     * Format: 'model_name' => Model::class
     */
    'models' => [
        'contact' => \Bespoke\Contact\Models\Contact::class,
    ],

    /**
     * Module Details
     *
     * Module system metadata
     */
    'module' => [
        'name' => 'Contact',
        'key' => 'contact',
        'group' => null,
        'icon' => 'contact',
        'status' => 'active',
        'is_visible' => 1,
    ],

    /**
     * Requests (Form Requests)
     *
     * Form request validation classes (separated by context)
     * Format: 'admin' => ['request_name' => Request::class]
     *         'api' => ['request_name' => Request::class]
     */
    'requests' => [
        'admin' => [
            'update_contact' => \Bespoke\Contact\Http\Requests\Admin\UpdateContact::class,
            'update_marketing' => \Bespoke\Contact\Http\Requests\Admin\UpdateMarketing::class,
        ],
        'api' => [
            'store_contact' => \Bespoke\Contact\Http\Requests\Api\StoreContact::class,
            'update_contact' => \Bespoke\Contact\Http\Requests\Api\UpdateContact::class,
        ],
    ],

    /**
     * Resources
     *
     * API resource classes for JSON transformations
     * Format: 'resource_name' => Resource::class
     */
    'resources' => [
        'contact' => \Bespoke\Contact\Http\Resources\ContactResource::class,
        'contact_collection' => \Bespoke\Contact\Http\Resources\ContactCollection::class,
    ],

    /**
     * Responses
     *
     * Response object bindings
     * Format: 'response_name' => Response::class
     */
    'responses' => [],

    /**
     * Route Files
     *
     * Route files to load
     * Available: ['api', 'admin', 'account', 'frontend', 'custom']
     */
    'routes' => [
        'admin',
        'api',
    ],

    /**
     * Route Prefixes
     *
     * URL prefixes for route groups
     */
    'route_prefixes' => [
        'api' => 'contacts',
        'admin' => 'contacts',
    ],

    /**
     * Rules
     *
     * Custom validation rules and field constraints
     * Object rules: 'rule_name' => Rule::class
     * Field rules: 'field_name' => ['constraint' => value]
     */
    'rules' => [
        'unique_contact_email' => \Bespoke\Contact\Rules\UniqueContactEmail::class,
        'first_name' => [
            'max' => 150,
        ],
        'last_name' => [
            'max' => 150,
        ],
        'email' => [
            'max' => 50,
        ],
        'phone' => [
            'max' => 20,
        ],
        'phone_prefix' => [
            'max' => 10,
        ],
        'mobile' => [
            'max' => 20,
        ],
        'mobile_prefix' => [
            'max' => 10,
        ],
    ],
];
```

### 6.2 Nested Structure for Controllers and Requests

Controllers and requests MUST be organised by context:

```php
'controllers' => [
    'admin' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
    ],
    'api' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Api\ContactController::class,
    ],
],

'requests' => [
    'admin' => [
        'update_contact' => \Bespoke\Contact\Http\Requests\Admin\UpdateContact::class,
    ],
    'api' => [
        'store_contact' => \Bespoke\Contact\Http\Requests\Api\StoreContact::class,
        'update_contact' => \Bespoke\Contact\Http\Requests\Api\UpdateContact::class,
    ],
],
```

---

## 7. Code Examples for Each Component

### 7.1 Admin Components

#### Admin Controller with CRUD Methods

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Controllers\Admin;

use Bespoke\Contact\Contracts\Admin\ContactController as ContactControllerContract;
use Bespoke\Contact\Contracts\Admin\UpdateContact;
use Bespoke\Contact\Contracts\Contact;
use Bespoke\Module\Http\Controllers\AbstractController;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

class ContactController extends AbstractController implements ContactControllerContract
{
    /**
     * Display a listing of contacts
     */
    public function index(): Factory|View|Application
    {
        return view('contact::admin.index');
    }

    /**
     * Redirect to index (using modal for creation)
     */
    public function create(): RedirectResponse
    {
        return redirect()->route('admin.contact.index');
    }

    /**
     * Display the specified contact
     */
    public function show(Contact $contact): Factory|View|Application
    {
        return view('contact::admin.show', [
            'contact' => $contact,
        ]);
    }

    /**
     * Show the form for editing the specified contact
     */
    public function edit(Contact $contact): Factory|View|Application
    {
        return view('contact::admin.edit', [
            'contact' => $contact,
        ]);
    }

    /**
     * Update the specified contact in storage
     */
    public function update(UpdateContact $request, Contact $contact): RedirectResponse
    {
        $validated = $request->validated();

        $contact->fill($validated);
        $contact->save();

        return redirect()
            ->route('admin.contact.show', $contact)
            ->with('success', __('contact::messages.updated'));
    }

    /**
     * Remove the specified contact from storage
     */
    public function destroy(Contact $contact): RedirectResponse
    {
        $contact->delete();

        return redirect()
            ->route('admin.contact.index')
            ->with('success', __('contact::messages.deleted'));
    }
}
```

**File:** `src/Http/Controllers/Admin/ContactController.php`

#### Admin Form Request

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Requests\Admin;

use Bespoke\Contact\Contracts\Admin\UpdateContact as UpdateContactContract;
use Illuminate\Foundation\Http\FormRequest;

class UpdateContact extends FormRequest implements UpdateContactContract
{
    /**
     * Determine if the user is authorized to make this request
     */
    public function authorize(): bool
    {
        return true; // Use middleware for authorization
    }

    /**
     * Get the validation rules that apply to the request
     */
    public function rules(): array
    {
        return [
            'first_name' => 'required|string|max:150',
            'last_name' => 'required|string|max:150',
            'email' => 'required|email|max:50',
            'phone' => 'nullable|string|max:20',
            'phone_prefix' => 'nullable|string|max:10',
            'mobile' => 'nullable|string|max:20',
            'mobile_prefix' => 'nullable|string|max:10',
            'status' => 'required|string|in:pending,active,inactive',
            'accepted_terms' => 'sometimes|boolean',
            'marketing_emails' => 'sometimes|boolean',
            'notification_emails' => 'sometimes|boolean',
            'notification_sms' => 'sometimes|boolean',
            'marketing_sms' => 'sometimes|boolean',
        ];
    }
}
```

**File:** `src/Http/Requests/Admin/UpdateContact.php`

#### Admin Routes

```php
<?php

declare(strict_types=1);

use Bespoke\Contact\Http\Controllers\Admin\ActivityController;
use Bespoke\Contact\Http\Controllers\Admin\ContactController;
use Bespoke\Contact\Http\Controllers\Admin\MarketingController;
use Illuminate\Support\Facades\Route;

Route::middleware(config('module.admin.middleware', ['web', 'auth']))
    ->prefix(config('module.admin.prefix', 'admin'))
    ->as('admin.')
    ->group(function () {

        Route::as('contact.')
            ->prefix(config('contact.route_prefixes.admin', 'contacts'))
            ->group(function () {

                // Resource routes
                Route::get('/', [ContactController::class, 'index'])
                    ->name('index')
                    ->middleware('permission:contact.read');

                Route::get('create', [ContactController::class, 'create'])
                    ->name('create')
                    ->middleware('permission:contact.create');

                Route::get('{contact}', [ContactController::class, 'show'])
                    ->name('show')
                    ->middleware('permission:contact.read')
                    ->withTrashed();

                Route::get('{contact}/edit', [ContactController::class, 'edit'])
                    ->name('edit')
                    ->middleware('permission:contact.update')
                    ->withTrashed();

                Route::patch('{contact}', [ContactController::class, 'update'])
                    ->name('update')
                    ->middleware('permission:contact.update')
                    ->withTrashed();

                Route::delete('{contact}', [ContactController::class, 'destroy'])
                    ->name('destroy')
                    ->middleware('permission:contact.delete');

                // Additional routes
                Route::get('{contact}/activity', [ActivityController::class, 'index'])
                    ->name('activity')
                    ->middleware('permission:contact.read');

                Route::get('{contact}/marketing', [MarketingController::class, 'edit'])
                    ->name('marketing.edit')
                    ->middleware('permission:contact.update');

                Route::patch('{contact}/marketing', [MarketingController::class, 'update'])
                    ->name('marketing.update')
                    ->middleware('permission:contact.update');
            });
    });
```

**File:** `routes/admin.php`

### 7.2 API Components

#### RESTful API Controller (Contract-Based)

**Important:** API controllers MUST use contracts for type-hints (requests) and return types (resources). Use container resolution with `app()` to instantiate resources.

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Controllers\Api;

use Bespoke\Contact\Contracts\Api\ContactCollection as ContactCollectionContract;
use Bespoke\Contact\Contracts\Api\ContactController as ContactControllerContract;
use Bespoke\Contact\Contracts\Api\ContactResource as ContactResourceContract;
use Bespoke\Contact\Contracts\Api\StoreContact as StoreContactContract;
use Bespoke\Contact\Contracts\Api\UpdateContact as UpdateContactContract;
use Bespoke\Contact\Contracts\Contact;
use Bespoke\Module\Http\Controllers\AbstractController;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class ContactController extends AbstractController implements ContactControllerContract
{
    /**
     * Display a listing of contacts
     */
    public function index(): ContactCollectionContract
    {
        return app(ContactCollectionContract::class, [
            'resource' => app(Contact::class)::query()
                ->active()
                ->paginate(),
        ]);
    }

    /**
     * Store a newly created contact in storage
     */
    public function store(StoreContactContract $request): JsonResponse
    {
        $validated = $request->validated('data.attributes');

        // Create the contact
        $contact = app(Contact::class);
        $contact->fill($validated);
        $contact->timestamps = false;
        $contact->save();

        return app(ContactResourceContract::class, ['resource' => $contact])
            ->response()
            ->header('Location', route('admin.contact.show', $contact));
    }

    /**
     * Display the specified contact
     */
    public function show(Contact $contact): ContactResourceContract
    {
        return app(ContactResourceContract::class, ['resource' => $contact]);
    }

    /**
     * Update the specified contact in storage
     */
    public function update(UpdateContactContract $request, Contact $contact): ContactResourceContract
    {
        $validated = $request->validated('data.attributes');

        // Update the contact
        $contact->fill($validated);
        $contact->timestamps = false;
        $contact->save();

        return app(ContactResourceContract::class, ['resource' => $contact]);
    }

    /**
     * Remove the specified contact from storage
     */
    public function destroy(Contact $contact): Application|ResponseFactory|Response
    {
        $contact->delete();

        return response(null, 204);
    }
}
```

**File:** `src/Http/Controllers/Api/ContactController.php`

**Key Patterns:**
1. Import contracts, not concrete classes
2. Use `implements ContactControllerContract`
3. Type-hint request contracts: `StoreContactContract $request`
4. Return resource contracts: `ContactResourceContract`
5. Instantiate resources via container: `app(ContactResourceContract::class, ['resource' => $model])`

#### API Store Request (with Contract)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Requests\Api;

use Bespoke\Contact\Contracts\Api\StoreContact as StoreContactContract;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreContact extends FormRequest implements StoreContactContract
{
    /**
     * Get the validation rules that apply to the request
     */
    public function rules(): array
    {
        return [
            // Standard JSON:API structure
            'data' => 'required|array',
            'data.type' => 'required|in:contact',
            'data.attributes' => 'required|array',

            // Individual fields
            'data.attributes.first_name' => 'required|string|max:100',
            'data.attributes.last_name' => 'required|string|max:100',

            'data.attributes.avatar' => 'sometimes|nullable',
            'data.attributes.phone' => 'nullable|numeric|max_digits:20',
            'data.attributes.phone_prefix' => 'nullable|max:10',
            'data.attributes.mobile' => 'nullable|numeric|max_digits:20',
            'data.attributes.mobile_prefix' => 'nullable|max:10',

            'data.attributes.email' => [
                'required', 'string', 'max:100',
                Rule::unique('contacts', 'email')->whereNull('deleted_at'),
                Rule::unique('users', 'email')->whereNull('deleted_at'),
            ],
            'data.attributes.status' => 'sometimes|required|string|max:10',

            // Marketing preferences
            'data.attributes.accepted_terms' => 'sometimes|required|boolean',
            'data.attributes.notification_emails' => 'sometimes|required|boolean',
            'data.attributes.notification_sms' => 'sometimes|required|boolean',
            'data.attributes.marketing_emails' => 'sometimes|required|boolean',
            'data.attributes.marketing_sms' => 'sometimes|required|boolean',

            // Audit fields
            'data.attributes.created_at' => 'sometimes|required|string|date_format:Y-m-d H:i:s',
            'data.attributes.created_by' => 'sometimes|required|integer|max_digits:4',
            'data.attributes.updated_at' => 'sometimes|required|string|date_format:Y-m-d H:i:s',
            'data.attributes.updated_by' => 'sometimes|required|integer|max_digits:4',
            'data.attributes.archived_at' => 'sometimes|nullable|string|date_format:Y-m-d H:i:s',
            'data.attributes.archived_by' => 'sometimes|required|integer|max_digits:4',
            'data.attributes.deleted_at' => 'sometimes|nullable|string|date_format:Y-m-d H:i:s',
            'data.attributes.deleted_by' => 'sometimes|required|integer|max_digits:4',
        ];
    }
}
```

**File:** `src/Http/Requests/Api/StoreContact.php`

#### API Update Request (with Contract)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Requests\Api;

use Bespoke\Contact\Contracts\Api\UpdateContact as UpdateContactContract;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateContact extends FormRequest implements UpdateContactContract
{
    /**
     * Get the validation rules that apply to the request
     */
    public function rules(): array
    {
        return [
            // Standard JSON:API structure
            'data' => 'required|array',
            'data.type' => 'required|in:contact',
            'data.attributes' => 'required|array',

            // Individual fields (all optional for updates)
            'data.attributes.first_name' => 'sometimes|required|string|max:100',
            'data.attributes.last_name' => 'sometimes|required|string|max:100',

            'data.attributes.avatar' => 'sometimes|nullable',
            'data.attributes.phone' => 'sometimes|nullable|numeric|max_digits:20',
            'data.attributes.phone_prefix' => 'sometimes|nullable|max:10',
            'data.attributes.mobile' => 'sometimes|nullable|numeric|max_digits:20',
            'data.attributes.mobile_prefix' => 'sometimes|nullable|max:10',

            'data.attributes.email' => [
                'sometimes', 'required', 'string', 'max:100',
                Rule::unique('contacts', 'email')
                    ->ignore($this->route('contact')->id)
                    ->whereNull('deleted_at'),
                Rule::unique('users', 'email')
                    ->ignore($this->route('contact')->id)
                    ->whereNull('deleted_at'),
            ],
            'data.attributes.status' => 'sometimes|required|string|max:10',

            // Marketing preferences
            'data.attributes.accepted_terms' => 'sometimes|required|boolean',
            'data.attributes.notification_emails' => 'sometimes|required|boolean',
            'data.attributes.notification_sms' => 'sometimes|required|boolean',
            'data.attributes.marketing_emails' => 'sometimes|required|boolean',
            'data.attributes.marketing_sms' => 'sometimes|required|boolean',

            // Audit fields
            'data.attributes.updated_at' => 'sometimes|required|string|date_format:Y-m-d H:i:s',
            'data.attributes.updated_by' => 'sometimes|required|integer|max_digits:4',
        ];
    }
}
```

**File:** `src/Http/Requests/Api/UpdateContact.php`

#### API Resource Transformer (with Contract)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Resources;

use Bespoke\Contact\Contracts\Api\ContactResource as ContactResourceContract;
use Illuminate\Http\Resources\Json\JsonResource;

class ContactResource extends JsonResource implements ContactResourceContract
{
    /**
     * Transform the resource into an array
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request): array
    {
        return [
            'id' => (string) $this->uuid,
            'type' => 'contact',
            'attributes' => [

                // Individual Fields
                'first_name' => $this->first_name,
                'last_name' => $this->last_name,

                'phone' => $this->phone,
                'phone_prefix' => $this->phone_prefix,
                'mobile' => $this->mobile,
                'mobile_prefix' => $this->mobile_prefix,

                'email' => $this->email,
                'status' => $this->status?->value,

                // Marketing
                'notification_emails' => $this->notification_emails,
                'notification_sms' => $this->notification_sms,
                'marketing_emails' => $this->marketing_emails,
                'marketing_sms' => $this->marketing_sms,

                // Audit fields
                'created_at' => $this->created_at,
                'created_by' => $this->created_by,
                'updated_at' => $this->updated_at,
                'updated_by' => $this->updated_by,
                'archived_at' => $this->archived_at,
                'archived_by' => $this->archived_by,
                'deleted_at' => $this->deleted_at,
                'deleted_by' => $this->deleted_by,
            ],
        ];
    }
}
```

**File:** `src/Http/Resources/ContactResource.php`

#### API Resource Collection (with Contract)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Http\Resources;

use Bespoke\Contact\Contracts\Api\ContactCollection as ContactCollectionContract;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ContactCollection extends ResourceCollection implements ContactCollectionContract
{
    /**
     * The resource that this resource collects
     *
     * @var string
     */
    public $collects = ContactResource::class;

    /**
     * Transform the resource collection into an array
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request): array
    {
        return [
            'data' => $this->collection,
        ];
    }
}
```

**File:** `src/Http/Resources/ContactCollection.php`

#### API Routes

```php
<?php

declare(strict_types=1);

use Bespoke\Contact\Http\Controllers\Api\ContactController;
use Illuminate\Support\Facades\Route;

Route::prefix(config('module.api.prefix', 'api').'/'.config('module.api.version', 'v1'))
    ->middleware(config('module.api.middleware', ['api', 'auth:sanctum']))
    ->as('api.')
    ->group(function () {

        Route::as('contact.')
            ->prefix(config('contact.route_prefixes.api', 'contacts'))
            ->group(function () {
                Route::get('/', [ContactController::class, 'index'])
                    ->name('index')
                    ->middleware('ability:contact.read');

                Route::post('/', [ContactController::class, 'store'])
                    ->name('store')
                    ->middleware('ability:contact.create');

                // Use {contact:uuid} for UUID route binding
                Route::get('{contact:uuid}', [ContactController::class, 'show'])
                    ->name('show')
                    ->middleware('ability:contact.read')
                    ->withTrashed();

                Route::patch('{contact:uuid}', [ContactController::class, 'update'])
                    ->name('update')
                    ->middleware('ability:contact.update')
                    ->withTrashed();

                Route::delete('{contact:uuid}', [ContactController::class, 'destroy'])
                    ->name('destroy')
                    ->middleware('ability:contact.delete');
            });

    });
```

**File:** `routes/api.php`

**Important:** API routes use `{contact:uuid}` for UUID-based route binding.

### 7.3 Actions

#### CreateModel Action with Static Method Pattern

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Actions;

use Bespoke\Contact\Contracts\Contact;
use Bespoke\Contact\Contracts\Contacts;
use Bespoke\Contact\Contracts\CreateContact as CreateContactContract;
use Bespoke\Contact\Events\ContactCreated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;

class CreateContact implements CreateContactContract
{
    /**
     * Create a contact for the given entity
     */
    public static function forEntity(Contacts $entity, array $data = []): Contact
    {
        $data = self::handleArgs($data, $entity);

        // Add it to the contact list
        Schema::disableForeignKeyConstraints();
        $contact = $entity->contacts()->create($data);
        Schema::enableForeignKeyConstraints();

        // Fire the event for anyone who is listening
        event(new ContactCreated($contact));

        return $contact;
    }

    /**
     * Handle and prepare arguments
     */
    protected static function handleArgs(array $data, $entity): array
    {
        $data = self::handlePhone($data, $entity);
        $data = self::handlePhonePrefix($data, $entity);
        $data = self::handleEmail($data, $entity);
        $data = self::handleStatus($data, $entity);

        return self::handleCreatedBy($data);
    }

    /**
     * Handle phone number
     */
    protected static function handlePhone(array $data, $entity): array
    {
        if (empty($data['phone']) && ! empty($entity->phone)) {
            $data['phone'] = $entity->phone;
        }

        return $data;
    }

    /**
     * Handle phone prefix
     */
    protected static function handlePhonePrefix(array $data, $entity): array
    {
        if (empty($data['phone_prefix'])) {
            $data['phone_prefix'] = ! empty($entity->phone_prefix)
                ? $entity->phone_prefix
                : config('contact.defaults.phone_prefix');
        }

        return $data;
    }

    /**
     * Handle email address
     */
    protected static function handleEmail(array $data, $entity): array
    {
        if (empty($data['email']) && ! empty($entity->email)) {
            $data['email'] = $entity->email;
        }

        return $data;
    }

    /**
     * Handle status
     */
    protected static function handleStatus(array $data, $entity): array
    {
        if (empty($data['status'])) {
            $data['status'] = ! empty($entity->status)
                ? $entity->status->value
                : config('contact.defaults.status');
        }

        return $data;
    }

    /**
     * Handle created_by field
     */
    protected static function handleCreatedBy(array $data): array
    {
        if (empty($data['created_by'])) {
            $data['created_by'] = Auth::user() ? Auth::user()->id : 1;
        }

        return $data;
    }
}
```

**File:** `src/Actions/CreateContact.php`

**Pattern:** Static methods, data transformation chain, event dispatching

#### Standalone CRUD Actions (Simpler Pattern)

For packages that manage standalone entities (not polymorphic), use this simpler pattern:

**CreateModel Action:**

```php
<?php

declare(strict_types=1);

namespace Bespoke\Country\Actions;

use Bespoke\Country\Contracts\Country;
use Bespoke\Country\Contracts\CreateCountry as CreateCountryContract;
use Bespoke\Country\Events\CountryCreated;
use Illuminate\Support\Facades\Auth;

class CreateCountry implements CreateCountryContract
{
    public static function execute(array $data): Country
    {
        $data = self::prepareData($data);

        $country = app(Country::class)::create($data);

        event(new CountryCreated($country));

        return $country;
    }

    protected static function prepareData(array $data): array
    {
        if (empty($data['status'])) {
            $data['status'] = config('country.defaults.status', 'active');
        }

        if (empty($data['created_by'])) {
            $data['created_by'] = Auth::id() ?? 1;
        }

        return $data;
    }
}
```

**UpdateModel Action:**

```php
<?php

declare(strict_types=1);

namespace Bespoke\Country\Actions;

use Bespoke\Country\Contracts\Country;
use Bespoke\Country\Contracts\UpdateCountry as UpdateCountryContract;
use Bespoke\Country\Events\CountryUpdated;
use Illuminate\Support\Facades\Auth;

class UpdateCountry implements UpdateCountryContract
{
    public static function execute(Country $country, array $data): Country
    {
        $data = self::prepareData($data);

        $country->update($data);

        event(new CountryUpdated($country));

        return $country;
    }

    protected static function prepareData(array $data): array
    {
        if (empty($data['updated_by'])) {
            $data['updated_by'] = Auth::id() ?? 1;
        }

        return $data;
    }
}
```

**DeleteModel Action:**

```php
<?php

declare(strict_types=1);

namespace Bespoke\Country\Actions;

use Bespoke\Country\Contracts\Country;
use Bespoke\Country\Contracts\DeleteCountry as DeleteCountryContract;
use Bespoke\Country\Events\CountryDeleted;

class DeleteCountry implements DeleteCountryContract
{
    public static function execute(Country $country): bool
    {
        event(new CountryDeleted($country));

        return $country->delete();
    }
}
```

**Action Contracts:**

```php
<?php
// src/Contracts/CreateCountry.php
declare(strict_types=1);

namespace Bespoke\Country\Contracts;

interface CreateCountry
{
    public static function execute(array $data): Country;
}

// src/Contracts/UpdateCountry.php
interface UpdateCountry
{
    public static function execute(Country $country, array $data): Country;
}

// src/Contracts/DeleteCountry.php
interface DeleteCountry
{
    public static function execute(Country $country): bool;
}
```

**ServiceProvider Registration:**

```php
protected function registerActionBindings(): void
{
    $this->app->bind(CreateCountryContract::class, function ($app) {
        return $app->make($app->config['country.actions.create_country']);
    });
    $this->app->bind(UpdateCountryContract::class, function ($app) {
        return $app->make($app->config['country.actions.update_country']);
    });
    $this->app->bind(DeleteCountryContract::class, function ($app) {
        return $app->make($app->config['country.actions.delete_country']);
    });
}
```

**Config Registration:**

```php
'actions' => [
    'create_country' => \Bespoke\Country\Actions\CreateCountry::class,
    'update_country' => \Bespoke\Country\Actions\UpdateCountry::class,
    'delete_country' => \Bespoke\Country\Actions\DeleteCountry::class,
],
```

**Note on Import Aliases:** When a package has both Admin request contracts and Action contracts with similar names (e.g., `UpdateCountry`), use different aliases to avoid conflicts:

```php
// Admin requests - prefix with Admin
use Bespoke\Country\Contracts\Admin\UpdateCountry as AdminUpdateCountryContract;

// Action contracts - no prefix
use Bespoke\Country\Contracts\UpdateCountry as UpdateCountryContract;
```

### 7.4 Imports

#### Import Class Extending AbstractImport

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Imports;

use Bespoke\Contact\Contracts\Contact;
use Bespoke\Contact\Contracts\ContactImport as ContactImportContract;
use Bespoke\Module\Imports\AbstractImport;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ContactImport extends AbstractImport implements ContactImportContract, ToCollection, WithHeadingRow
{
    /**
     * Process the imported collection
     */
    public function collection(Collection $rows): void
    {
        foreach ($rows as $row) {
            console_print('Checking contact: '.$row['email']);
            $this->updateOrCreateContact($row);
        }
    }

    /**
     * Update or create contact from row data
     */
    public function updateOrCreateContact($row): Contact
    {
        $contact = app(Contact::class)->firstOrCreate([
            'email' => $this->formatEmail($row['email']),
        ]);

        $contact->first_name = $this->formatName($row['first_name']);
        $contact->last_name = $this->formatName($row['last_name']);
        $contact->phone = $this->formatPhone($row['phone']);
        $contact->phone_prefix = $this->formatPhonePrefix();
        $contact->mobile = $this->formatMobile($row['mobile']);
        $contact->mobile_prefix = $this->formatMobilePrefix();
        $contact->status = $this->formatStatus($row['status']);

        // Audit
        $contact->timestamps = false;
        $contact->imported_at = $this->formatImportedAt();
        $contact->created_at = $this->formatCreatedAt($row['created_at']);
        $contact->created_by = $this->formatCreatedBy();
        $contact->updated_at = $this->formatUpdatedAt($row['updated_at']);
        $contact->updated_by = $this->formatUpdatedBy();
        $contact->save();

        return $contact;
    }
}
```

**File:** `src/Imports/ContactImport.php`

**Extends:** `Bespoke\Module\Imports\AbstractImport`
**Implements:** `ToCollection`, `WithHeadingRow`

#### Schema File Structure

```tsv
first_name	last_name	email	phone	mobile	status	created_at	updated_at
John	Doe	john.doe@example.com	07700900000	07700900001	active	2024-01-01 00:00:00	2024-01-01 00:00:00
Jane	Smith	jane.smith@example.com	07700900002	07700900003	active	2024-01-02 00:00:00	2024-01-02 00:00:00
```

**File:** `resources/schema/contacts.tsv`
**Format:** Tab-separated values (TSV)

### 7.5 Exports

#### Export Class Extending AbstractExport

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Exports;

use Bespoke\Contact\Contracts\ContactExport as ContactExportContract;
use Bespoke\Module\Exports\AbstractExport;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class ContactExport extends AbstractExport implements ContactExportContract, FromView, WithStyles
{
    protected Collection $rows;

    /**
     * Constructor
     */
    public function __construct(Collection $rows)
    {
        $this->rows = $rows;
    }

    /**
     * Apply styles to the worksheet
     */
    public function styles(Worksheet $sheet): array
    {
        return [
            1 => ['font' => ['bold' => true]], // Style the first row as bold text
        ];
    }

    /**
     * Return the export view
     */
    public function view(): View
    {
        return view('contact::exports.contacts', [
            'rows' => $this->rows,
        ]);
    }
}
```

**File:** `src/Exports/ContactExport.php`

**Extends:** `Bespoke\Module\Exports\AbstractExport`
**Implements:** `FromView`, `WithStyles`

#### Export View Template

```blade
<table>
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Mobile</th>
            <th>Status</th>
            <th>Created At</th>
            <th>Updated At</th>
        </tr>
    </thead>
    <tbody>
        @foreach($rows as $row)
            <tr>
                <td>{{ $row->first_name }}</td>
                <td>{{ $row->last_name }}</td>
                <td>{{ $row->email }}</td>
                <td>{{ $row->phone_prefix }} {{ $row->phone }}</td>
                <td>{{ $row->mobile_prefix }} {{ $row->mobile }}</td>
                <td>{{ $row->status?->value }}</td>
                <td>{{ $row->created_at }}</td>
                <td>{{ $row->updated_at }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
```

**File:** `resources/views/exports/contacts.blade.php`

### 7.6 Models

#### Model Extending AbstractModel

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Models;

use Bespoke\Activity\Traits\HasActivity;
use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Database\Factories\ContactFactory;
use Bespoke\Module\Models\AbstractModel;
use Bespoke\Module\Traits\Contact\HasAcceptedTerms;
use Bespoke\Module\Traits\Contact\HasAvatar;
use Bespoke\Module\Traits\Contact\HasEmail;
use Bespoke\Module\Traits\Contact\HasFirstName;
use Bespoke\Module\Traits\Contact\HasFullName;
use Bespoke\Module\Traits\Contact\HasLastName;
use Bespoke\Module\Traits\Contact\HasMarketingEmails;
use Bespoke\Module\Traits\Contact\HasMarketingSms;
use Bespoke\Module\Traits\Contact\HasMobile;
use Bespoke\Module\Traits\Contact\HasNotificationEmails;
use Bespoke\Module\Traits\Contact\HasNotificationSms;
use Bespoke\Module\Traits\Contact\HasPhone;
use Bespoke\Module\Traits\HasStatus;
use Bespoke\Module\Traits\HasUUID;
use Bespoke\User\Interfaces\Profileable;
use Bespoke\User\Traits\HasProfileableUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\LogOptions;

class Contact extends AbstractModel implements ContactContract, Profileable
{
    use HasAcceptedTerms;
    use HasActivity;
    use HasAvatar;
    use HasEmail;
    use HasFactory;
    use HasFirstName;
    use HasFullName;
    use HasLastName;
    use HasMarketingEmails;
    use HasMarketingSms;
    use HasMobile;
    use HasNotificationEmails;
    use HasNotificationSms;
    use HasPhone;
    use HasProfileableUser;
    use HasStatus;
    use HasUUID;
    use SoftDeletes;

    /** @var array<string> */
    protected $fillable = [];

    /** @var array<string> */
    protected $casts = [];

    /**
     * Get activity log options
     */
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->useLogName('contact')
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->logOnly(config('contact.loggable'));
    }

    /**
     * Create a new factory instance for the model
     */
    protected static function newFactory(): ContactFactory
    {
        return ContactFactory::new();
    }
}
```

**File:** `src/Models/Contact.php`

**Extends:** `Bespoke\Module\Models\AbstractModel`
**Implements:** Model contract, additional interfaces
**Traits:** Extensive trait composition for reusable functionality

#### Relationship Traits

##### HasContact (BelongsTo Single Contact)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Traits;

use Bespoke\Contact\Contracts\Contact;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

trait HasContact
{
    /**
     * Get the contact
     */
    public function contact(): BelongsTo
    {
        return $this->belongsTo(config('contact.models.contact'));
    }

    /**
     * Check if the model has a contact
     */
    public function hasContact(): bool
    {
        return $this->contact()->exists();
    }

    /**
     * Get the contact or create one
     */
    public function getOrCreateContact(array $attributes = []): Contact
    {
        if ($this->hasContact()) {
            return $this->contact;
        }

        return $this->contact()->create($attributes);
    }
}
```

**File:** `src/Traits/HasContact.php`

##### HasContacts (MorphMany Contacts)

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Traits;

use Illuminate\Database\Eloquent\Relations\MorphMany;

trait HasContacts
{
    /**
     * Get all contacts for the model
     */
    public function contacts(): MorphMany
    {
        return $this->morphMany(
            config('contact.models.contact'),
            'contactable'
        );
    }

    /**
     * Check if the model has contacts
     */
    public function hasContacts(): bool
    {
        return $this->contacts()->exists();
    }

    /**
     * Get the primary contact
     */
    public function primaryContact(): ?Contact
    {
        return $this->contacts()->first();
    }
}
```

**File:** `src/Traits/HasContacts.php`

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

**IMPORTANT:** This checklist applies to **CRUD packages only**. Utility packages (see Section 1.2) do not need to meet these requirements.

Use this checklist to audit CRUD packages for compliance with standards.

### 9.1 Directory Structure Checklist (15 items)

- [ ] `config/package-name.php` exists
- [ ] `database/factories/` directory exists
- [ ] `database/migrations/` directory exists
- [ ] `resources/lang/en/` directory exists
- [ ] `resources/schema/` directory exists with .tsv files
- [ ] `resources/views/admin/` directory exists
- [ ] `resources/views/exports/` directory exists
- [ ] `routes/admin.php` exists
- [ ] `routes/api.php` exists
- [ ] `src/Actions/` directory exists
- [ ] `src/Contracts/` directory exists (NOT `Interfaces/`)
- [ ] `src/Contracts/Admin/` directory exists
- [ ] `src/Events/` directory exists
- [ ] `src/Exports/` directory exists
- [ ] `src/Http/Controllers/Admin/` directory exists
- [ ] `src/Http/Controllers/Api/` directory exists
- [ ] `src/Http/Requests/Admin/` directory exists
- [ ] `src/Http/Requests/Api/` directory exists (with StoreModel.php, UpdateModel.php)
- [ ] `src/Http/Resources/` directory exists (with ModelResource.php, ModelCollection.php)
- [ ] `src/Imports/` directory exists
- [ ] `src/Models/` directory exists
- [ ] `tests/` directory exists with PHPUnit `TestCase.php` and `ExampleTest.php`
- [ ] `composer.json` has correct `require` (php ^8.2, package-tools ^10.0)
- [ ] `composer.json` has all required `require-dev` dependencies
- [ ] `composer.json` has all required `scripts` (analyse, format, test, etc.)
- [ ] `composer.json` has correct `config` (sort-packages, allow-plugins)
- [ ] Database migrations use `.php.stub` extension (no datetime prefix)
- [ ] No Pest test files in `tests/` directory

**Score:** ___/29

### 9.2 Contract Count Checklist (12+ minimum)

- [ ] Model contract (`Contracts/Model.php`)
- [ ] Admin controller contract (`Contracts/Admin/ModelController.php`)
- [ ] Admin request contracts (`Contracts/Admin/UpdateModel.php`, etc.)
- [ ] API controller contract (`Contracts/Api/ModelController.php`)
- [ ] API request contracts (`Contracts/Api/StoreModel.php`, `Contracts/Api/UpdateModel.php`)
- [ ] API resource contract (`Contracts/Api/ModelResource.php`)
- [ ] API collection contract (`Contracts/Api/ModelCollection.php`)
- [ ] Action contracts (`Contracts/CreateModel.php`, etc.)
- [ ] Import contract (`Contracts/ModelImport.php`)
- [ ] Export contract (`Contracts/ModelExport.php`)
- [ ] Validation rule contracts (if custom rules exist)
- [ ] Additional controller contracts (Activity, Marketing, etc.)

**Count:** ___/12 minimum (Contact package should have 15+)

### 9.3 ServiceProvider Binding Methods (8+ minimum)

- [ ] `registerActionBindings()` implemented
- [ ] `registerControllerBindings()` implemented (includes BOTH Admin AND API)
- [ ] `registerExportBindings()` implemented
- [ ] `registerImportBindings()` implemented
- [ ] `registerModelBindings()` implemented
- [ ] `registerRequestBindings()` implemented (includes BOTH Admin AND API)
- [ ] `registerResourceBindings()` implemented (for API resources)
- [ ] `registerRouteModelBindings()` implemented
- [ ] `registerRuleBindings()` implemented (if rules exist)
- [ ] `configurePackage()` method complete

**Score:** ___/10

### 9.4 Config File Sections (23 sections)

- [ ] `aliases`
- [ ] `actions`
- [ ] `casts`
- [ ] `commands`
- [ ] `components`
- [ ] `controllers` (with `admin` and `api` nested keys)
- [ ] `defaults`
- [ ] `export`
- [ ] `fillable`
- [ ] `import` (with `schema_file` key)
- [ ] `listeners`
- [ ] `livewire`
- [ ] `loggable`
- [ ] `middlewares`
- [ ] `migrations`
- [ ] `models`
- [ ] `module`
- [ ] `requests` (with `admin` and `api` nested keys)
- [ ] `resources` (with `model` and `model_collection` keys)
- [ ] `responses`
- [ ] `routes`
- [ ] `route_prefixes`
- [ ] `rules`

**Score:** ___/23

### 9.5 Implementation Classes (10+ items)

- [ ] Model class exists and implements contract
- [ ] Admin controller(s) exist and implement contracts
- [ ] API controller exists with full RESTful methods (index, store, show, update, destroy)
- [ ] Admin request classes exist and implement contracts
- [ ] API StoreModel request exists
- [ ] API UpdateModel request exists
- [ ] API ModelResource exists
- [ ] API ModelCollection exists
- [ ] Import handler exists and implements contract
- [ ] Export handler exists and implements contract
- [ ] Export blade view exists (`resources/views/exports/`)
- [ ] Action classes exist and implement contracts
- [ ] Event classes exist (ModelCreated, etc.)

**Score:** ___/13

### 9.6 Route Files

- [ ] `routes/admin.php` has resourceful routes
- [ ] `routes/api.php` has RESTful routes
- [ ] API routes use `{model:uuid}` pattern
- [ ] Routes use config-based prefixes
- [ ] Routes have permission middleware

**Score:** ___/5

### 9.7 Overall Completeness Score

**Total Score:** ___/88

**Grade:**
- **90-100% (80-88 points):** Excellent - Fully compliant
- **80-89% (71-79 points):** Good - Minor gaps
- **70-79% (62-70 points):** Fair - Needs improvement
- **Below 70% (<62 points):** Poor - Major refactoring required

### 9.8 Priority Classification

| Priority | Criteria | Action Required |
|----------|----------|-----------------|
| **High** | Missing API functionality entirely | Add full API stack (controller, requests, resources, routes) |
| **High** | Missing Contracts directory | Create contracts for all implementations |
| **High** | Missing Exports functionality | Add export handler, contract, config, view |
| **High** | Missing Imports functionality | Add import handler, contract, config, schema |
| **Medium** | Incomplete config file (<15 sections) | Add missing config sections |
| **Medium** | Missing binding methods in ServiceProvider | Implement required `register*Bindings()` methods |
| **Medium** | Using `Interfaces/` instead of `Contracts/` | Rename directory and update namespaces |
| **Low** | Missing optional functionality (Livewire, Events) | Add if business logic requires |
| **Low** | Incomplete documentation | Add CLAUDE.md, ARCHITECTURE.md |

---

## 10. Common Pitfalls

### 10.1 Empty `Interfaces/` Directory

**Problem:** Using old `Interfaces/` directory instead of `Contracts/`

```
src/
├── Interfaces/          ❌ WRONG - Old pattern
└── Contracts/           ✅ CORRECT - Current standard
```

**Solution:** Rename `Interfaces/` to `Contracts/` and update all namespaces.

### 10.2 Missing API Functionality Entirely (CRUD Packages Only)

**Problem:** Package only has Admin controllers, no API endpoints

**Missing:**
- `src/Http/Controllers/Api/`
- `src/Http/Requests/Api/`
- `src/Http/Resources/`
- `routes/api.php`

**Solution:** Implement full API stack following Section 6.2 examples.

### 10.3 No Export Functionality (CRUD Packages Only)

**Problem:** Package has imports but no exports

**Missing:**
- `src/Exports/ModelExport.php`
- `src/Contracts/ModelExport.php`
- `resources/views/exports/models.blade.php`
- Config key: `export.model`

**Solution:** Add export handler following Section 6.5 examples.

### 10.4 Missing Binding Methods in ServiceProvider

**Problem:** ServiceProvider doesn't override any `register*Bindings()` methods

```php
// ❌ WRONG - No bindings
class CityServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void
    {
        // Only package configuration
    }
}

// ✅ CORRECT - Implements bindings
class ContactServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void { }

    protected function registerModelBindings(): void { }
    protected function registerControllerBindings(): void { }
    protected function registerActionBindings(): void { }
    // ... other bindings
}
```

**Solution:** Implement all relevant binding methods from Section 4.

### 10.5 Incomplete Config File

**Problem:** Config file missing critical sections

**Commonly Missing:**
- `export` section
- `import.schema_file` key
- `controllers.api` nested key
- `requests.api` nested key
- `route_prefixes`
- `loggable`

**Solution:** Use complete config template from Section 5.1.

### 10.6 No Contracts for Implementations

**Problem:** Implementation classes exist but no contracts defined

```php
// ❌ WRONG - No contract
class ContactController extends AbstractController
{
    // Implementation
}

// ✅ CORRECT - Has contract
interface ContactController { }

class ContactController extends AbstractController implements ContactControllerContract
{
    // Implementation
}
```

**Solution:** Create contracts for ALL bound classes (Section 3).

### 10.7 Using Old Spatie PackageServiceProvider

**Problem:** Extending Spatie's PackageServiceProvider instead of Bespoke's

```php
// ❌ WRONG
use Spatie\LaravelPackageTools\PackageServiceProvider;

class MyServiceProvider extends PackageServiceProvider
{
    // Old pattern
}

// ✅ CORRECT
use Bespoke\PackageTools\PackageServiceProvider;

class MyServiceProvider extends PackageServiceProvider
{
    // Bespoke pattern with binding methods
}
```

**Solution:** Change parent class and implement binding methods.

### 10.8 Mixing Admin and API in Same Directory

**Problem:** Controllers not separated by context

```
src/Http/Controllers/
├── ContactController.php       ❌ WRONG - Which context?
├── ActivityController.php      ❌ WRONG - Ambiguous
```

**Solution:** Always separate by context:

```
src/Http/Controllers/
├── Admin/
│   ├── ContactController.php   ✅ CORRECT - Admin context
│   └── ActivityController.php  ✅ CORRECT - Admin context
└── Api/
    └── ContactController.php   ✅ CORRECT - API context
```

### 10.9 Not Implementing Declared Contracts

**Problem:** Contract exists but implementation doesn't implement it

```php
// Contract declared
interface ContactController { }

// ❌ WRONG - Doesn't implement contract
class ContactController extends AbstractController
{
    // No implements clause
}

// ✅ CORRECT - Implements contract
class ContactController extends AbstractController implements ContactControllerContract
{
    // Implementation
}
```

**Solution:** Add `implements ContractName` to all bound classes.

### 10.10 Missing api.php Route File (CRUD Packages Only)

**Problem:** Only `routes/admin.php` exists, no API routes

**Solution:** Create `routes/api.php` with RESTful routes (Section 6.2, API Routes).

### 10.11 Not Using UUID Route Binding for API

**Problem:** API routes use auto-increment IDs instead of UUIDs

```php
// ❌ WRONG - Uses ID
Route::get('{contact}', [ContactController::class, 'show']);

// ✅ CORRECT - Uses UUID
Route::get('{contact:uuid}', [ContactController::class, 'show']);
```

**Solution:** Use `{model:uuid}` pattern in all API routes.

### 10.12 Config Values Not Using Nested Structure

**Problem:** Controllers and requests not nested by context

```php
// ❌ WRONG - Flat structure
'controllers' => [
    'contact' => ContactController::class,
    'api_contact' => ApiContactController::class,
],

// ✅ CORRECT - Nested by context
'controllers' => [
    'admin' => [
        'contact' => AdminContactController::class,
    ],
    'api' => [
        'contact' => ApiContactController::class,
    ],
],
```

**Solution:** Use nested arrays for `controllers` and `requests`.

### 10.13 Forcing CRUD Patterns on Utility Packages

**Problem:** Applying full CRUD standards to utility packages that don't need them

```
// ❌ WRONG - Trying to add API to a trait-provider package
core/activity/
├── src/Http/Controllers/Api/     # NOT NEEDED
├── src/Http/Resources/           # NOT NEEDED
├── src/Exports/                   # NOT NEEDED
├── src/Imports/                   # NOT NEEDED
└── routes/api.php                 # NOT NEEDED
```

**Utility packages don't need:**
- API controllers, requests, or resources
- Export handlers or views
- Import handlers or schema files
- `Contracts/Admin/` or `Contracts/Api/` subdirectories
- Nested config structure

**Solution:** Check Section 1 to classify the package before applying standards. Only CRUD packages require full compliance.

**Core utility packages (leave as-is):**
- `core/activity`, `core/backup`, `core/captcha`, `core/chart`
- `core/core`, `core/dashboard`, `core/editor`, `core/module`
- `core/security`, `core/two-factor`

### 10.14 ServiceProvider Only Binding Admin Controllers (Not API)

**Problem:** `registerControllerBindings()` only binds Admin controllers, forgetting API controllers

```php
// ❌ WRONG - Only Admin controller bound
protected function registerControllerBindings(): void
{
    $this->app->bind(AdminUserControllerContract::class, function ($app) {
        return $app->make($app->config['user.controllers.admin.user']);
    });
    // API controller binding MISSING!
}

// ✅ CORRECT - Both Admin and API controllers bound
protected function registerControllerBindings(): void
{
    $this->app->bind(AdminUserControllerContract::class, function ($app) {
        return $app->make($app->config['user.controllers.admin.user']);
    });
    $this->app->bind(ApiUserControllerContract::class, function ($app) {
        return $app->make($app->config['user.controllers.api.user']);
    });
}
```

**Solution:** Always bind BOTH Admin and API controllers. Check config file has `controllers.api` entries.

### 10.15 ServiceProvider Only Binding Admin Requests (Not API)

**Problem:** `registerRequestBindings()` only binds Admin requests, forgetting API requests

```php
// ❌ WRONG - Only Admin requests bound
protected function registerRequestBindings(): void
{
    $this->app->bind(StoreUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.admin.store_user']);
    });
    $this->app->bind(UpdateUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.admin.update_user']);
    });
    // API request bindings MISSING!
}

// ✅ CORRECT - Both Admin and API requests bound
protected function registerRequestBindings(): void
{
    // Admin requests
    $this->app->bind(StoreUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.admin.store_user']);
    });
    $this->app->bind(UpdateUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.admin.update_user']);
    });
    // API requests
    $this->app->bind(ApiStoreUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.api.store_user']);
    });
    $this->app->bind(ApiUpdateUserContract::class, function ($app) {
        return $app->make($app->config['user.requests.api.update_user']);
    });
}
```

**Solution:** Always bind BOTH Admin and API requests. Check config file has `requests.api` entries.

### 10.16 Contract Exists But Implementation Doesn't Have `implements` Clause

**Problem:** Contract interface exists, implementation class exists, but class doesn't implement the interface

```php
// Contract exists at src/Contracts/Api/UserController.php
interface UserController {}

// ❌ WRONG - Implementation doesn't implement contract
// src/Http/Controllers/Api/UserController.php
class UserController extends AbstractController
{
    // Missing: implements UserControllerContract
}

// ✅ CORRECT - Implementation explicitly implements contract
use Bespoke\User\Contracts\Api\UserController as UserControllerContract;

class UserController extends AbstractController implements UserControllerContract
{
    // Now properly linked to contract
}
```

**Why this matters:**
- Laravel's container binding requires the contract connection
- Type-hinting in tests and other classes won't work
- The binding in ServiceProvider will fail silently

**Solution:** After creating contracts, immediately update implementation classes to add `implements ContractName`.

### 10.17 API Controller Using Concrete Classes Instead of Contracts

**Problem:** API controller uses concrete implementations instead of contracts for type-hints and return types

```php
// ❌ WRONG - Using concrete implementations
use Bespoke\Contact\Http\Requests\Api\StoreContact;
use Bespoke\Contact\Http\Resources\ContactResource;

class ContactController extends AbstractController
{
    public function store(StoreContact $request): JsonResponse  // Concrete type-hint
    {
        return (new ContactResource($contact))  // Direct instantiation
            ->response();
    }

    public function show(Contact $contact): ContactResource  // Concrete return type
    {
        return new ContactResource($contact);  // Direct instantiation
    }
}

// ✅ CORRECT - Using contracts throughout
use Bespoke\Contact\Contracts\Api\ContactResource as ContactResourceContract;
use Bespoke\Contact\Contracts\Api\StoreContact as StoreContactContract;

class ContactController extends AbstractController implements ContactControllerContract
{
    public function store(StoreContactContract $request): JsonResponse  // Contract type-hint
    {
        return app(ContactResourceContract::class, ['resource' => $contact])  // Container resolution
            ->response();
    }

    public function show(Contact $contact): ContactResourceContract  // Contract return type
    {
        return app(ContactResourceContract::class, ['resource' => $contact]);  // Container resolution
    }
}
```

**Solution:**
1. Create contracts for all API requests in `Contracts/Api/` (StoreModel, UpdateModel)
2. Create contracts for all API resources in `Contracts/Api/` (ModelResource, ModelCollection)
3. Have implementations `implements` their contracts
4. Use contracts for type-hints and return types in controllers
5. Use `app(Contract::class, ['resource' => $model])` for resource instantiation
6. Add `registerResourceBindings()` to ServiceProvider
7. Add `resources` section to config file

### 10.18 Using Concrete Implementations Instead of Contracts

**Problem:** Code imports and uses concrete classes directly instead of contracts, breaking package extensibility

```php
// ❌ WRONG - Importing concrete model class
use Bespoke\User\Models\User;

class OnlineUser
{
    protected function updateOnlineState(User $user): void  // Concrete type-hint
    {
        // If application overrides User model, this still uses package version
    }
}

// ❌ WRONG - Importing concrete controller in another controller
use Bespoke\Contact\Http\Controllers\Admin\ContactController;

class CustomerController
{
    public function __construct(ContactController $contactController)  // Concrete!
    {
        // Cannot be overridden by application
    }
}

// ✅ CORRECT - Always use contracts
use Bespoke\User\Contracts\User;

class OnlineUser
{
    protected function updateOnlineState(User $user): void  // Contract type-hint
    {
        // Application's custom User model will be used if configured
    }
}

// ✅ CORRECT - Inject via contract
use Bespoke\Contact\Contracts\Admin\ContactController as ContactControllerContract;

class CustomerController
{
    public function __construct(ContactControllerContract $contactController)
    {
        // Application can override via config
    }
}
```

**Why this breaks extensibility:**

When a Laravel application wants to customise package behaviour:
1. They create a custom class (e.g., `App\Models\User extends Bespoke\User\Models\User`)
2. They update the config: `'models' => ['user' => App\Models\User::class]`
3. **Expected:** All code uses their custom class
4. **Actual (if concrete used):** Code with concrete imports still uses the package class

**Solution:**
- **NEVER** import from `Models\`, `Http\Controllers\`, `Http\Requests\`, `Http\Resources\`, `Actions\`, etc.
- **ALWAYS** import from `Contracts\` namespace
- Use `app(Contract::class)` to instantiate, not `new ConcreteClass()`

**Quick check for violations:**
```bash
# Find concrete imports (should return nothing in well-structured packages)
grep -r "use Bespoke\\\\.*\\\\Models\\\\" src/ --include="*.php" | grep -v "^src/Models/"
grep -r "use Bespoke\\\\.*\\\\Http\\\\Controllers\\\\" src/ --include="*.php" | grep -v "^src/Http/Controllers/"
grep -r "use Bespoke\\\\.*\\\\Actions\\\\" src/ --include="*.php" | grep -v "^src/Actions/"
```

### 10.19 Misclassifying Utility Packages as CRUD

**Problem:** Treating a package without its own model as a CRUD package

**Examples of utility packages often misclassified:**
- `core/profile` - Provides profile editing UI for User profiles (Employee/Contact), has no Profile model
- `core/core` - Meta-package that bundles dependencies, has no code at all
- `core/dashboard` - Landing page builder, no database entities

**How to identify a utility package:**
1. Check `src/Models/` - if empty or only has `.gitkeep`, likely utility
2. Check `config/package.php` - if `models` section is empty, likely utility
3. Ask: "Does this package CREATE/STORE its own data, or does it MANAGE data from other packages?"

**Solution:** Before auditing, classify the package using Section 1. Apply CRUD standards only to CRUD packages.

### 10.20 Empty Contract Interfaces

**Problem:** Contract interface exists but defines no method signatures, making it a marker interface with no enforcement value

```php
// ❌ WRONG - Empty contract provides no guarantees
// src/Contracts/CloudFlare.php
interface CloudFlare {}

// ❌ WRONG - Service "implements" empty contract
// src/Services/CloudFlare.php
class CloudFlare implements CloudFlareContract
{
    public function hasValidCredentials(): bool { /* ... */ }
    public function clearCache(string $zoneId): bool { /* ... */ }
}
// Problem: No compile-time guarantee these methods exist

// ✅ CORRECT - Contract defines all public method signatures
// src/Contracts/CloudFlare.php
interface CloudFlare
{
    public function hasValidCredentials(): bool;

    public function getAllAccounts(): ?array;

    public function getAllZones(): ?array;

    public function getZoneId(): ?string;

    public function clearCache(string $zoneId): bool;
}

// ✅ CORRECT - Service implements contract with defined methods
// src/Services/CloudFlare.php
use Bespoke\CloudFlare\Contracts\CloudFlare as CloudFlareContract;

class CloudFlare implements CloudFlareContract
{
    public function hasValidCredentials(): bool { /* ... */ }
    public function getAllAccounts(): ?array { /* ... */ }
    public function getAllZones(): ?array { /* ... */ }
    public function getZoneId(): ?string { /* ... */ }
    public function clearCache(string $zoneId): bool { /* ... */ }
}
```

**Why empty contracts are problematic:**
- No compile-time enforcement of method signatures
- Applications overriding the class might miss required methods
- IDE autocompletion doesn't work when type-hinting the contract
- Contract doesn't document the expected API surface

**Solution:**
1. Extract all public method signatures from the implementation class
2. Add them to the contract interface with proper type hints
3. Include any required imports in the contract (e.g., `use Illuminate\Http\Request`)

**Quick check for empty contracts:**
```bash
# Find potentially empty contracts (single-line interface declarations)
grep -r "^interface.*{}$" src/Contracts/ --include="*.php"

# Find contracts with only marker content (opening brace on next line, immediate close)
grep -A1 "^interface" src/Contracts/*.php | grep -B1 "^}"
```

### 10.21 Service Classes Not Implementing Contracts

**Problem:** Service class exists and corresponding contract exists, but the class doesn't have `implements ContractInterface`

This is a variant of pitfall 10.16 that specifically affects service classes.

```php
// Contract exists at src/Contracts/Referrer.php
interface Referrer
{
    public function get(): string;
    public function put(string $referer): void;
}

// ❌ WRONG - Service doesn't implement its contract
// src/Services/Referrer.php
class Referrer
{
    public function get(): string { /* ... */ }
    public function put(string $referer): void { /* ... */ }
}

// ✅ CORRECT - Service explicitly implements contract
use Bespoke\Referrer\Contracts\Referrer as ReferrerContract;

class Referrer implements ReferrerContract
{
    public function get(): string { /* ... */ }
    public function put(string $referer): void { /* ... */ }
}
```

**Why this matters:**
- ServiceProvider binds the contract: `$this->app->bind(ReferrerContract::class, ...)`
- If service doesn't implement contract, container resolution works but type safety is lost
- IDE and static analysis can't verify the binding is valid

**How to verify:**
```bash
# Check if services implement their contracts
for contract in src/Contracts/*.php; do
    name=$(basename "$contract" .php)
    impl="src/Services/${name}.php"
    if [ -f "$impl" ]; then
        grep -q "implements.*${name}" "$impl" || echo "Missing: $impl should implement $name"
    fi
done
```

### 10.22 Renaming Classes/Interfaces Without Updating Cross-Package References

**Problem:** Renaming a class, interface, or contract in one package breaks other packages that reference it

This is particularly problematic with:
- Trait interfaces (e.g., `SeoInterface`, `ImagesInterface`, `ContactsInterface`)
- Model contracts used by other packages
- Shared enums or value objects

```php
// Package A: default/seo - RENAMED interface
// Old: src/Interfaces/SeoInterface.php
// New: src/Contracts/Seo.php

// Package B: cms/page - BROKEN reference (not updated)
use Bespoke\Seo\Interfaces\SeoInterface;  // ❌ BROKEN - namespace no longer exists

class Page extends AbstractModel implements SeoInterface  // ❌ BROKEN
{
    // ...
}
```

**Why this matters:**
- Monorepo has 108 packages with extensive cross-package dependencies
- Trait interfaces are implemented by many models across different packages
- A single rename can break 10+ packages silently
- Errors only surface at runtime or during static analysis

**Solution:** ALWAYS search the entire monorepo before and after renaming:

```bash
# Before renaming: Find all references to understand impact
grep -r "Bespoke\\Seo\\Interfaces\\SeoInterface" --include="*.php" .

# After renaming: Update ALL references in other packages
# Search for the OLD namespace to ensure nothing was missed
grep -r "Bespoke\\Seo\\Interfaces" --include="*.php" .

# Verify with PHPStan across affected packages
for pkg in cms/page cms/post crm/city default/country; do
    (cd "$pkg" && composer analyse)
done
```

**Checklist when renaming:**

1. **Search first** - Find all usages across the monorepo before making changes
2. **Document the mapping** - Old namespace → New namespace
3. **Update all packages** - Edit every file that references the old name
4. **Run static analysis** - `composer analyse` in all affected packages
5. **Update documentation** - CLAUDE.md, README.md, ARCHITECTURE.md files may reference old names

**Common renames that affect many packages:**

| Old Pattern | New Pattern | Packages Affected |
|-------------|-------------|-------------------|
| `Interfaces/SeoInterface` | `Contracts/Seo` | page, post, country, city, county, region, etc. |
| `Interfaces/ImagesInterface` | `Contracts/Images` | All models with HasImages trait |
| `Interfaces/ContactsInterface` | `Contracts/Contacts` | customer, supplier, project, etc. |

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

## 12. Pre-Commit Verification Checklist

**Use this checklist before committing changes to any CRUD package.** This prevents the common issues discovered during package audits.

### 12.1 Quick Verification Commands

Run these commands from the package root to verify compliance:

```bash
# 1. Check all implementations have 'implements' clause
echo "=== Checking Controllers implement contracts ==="
grep -L "implements.*Contract" src/Http/Controllers/Admin/*.php 2>/dev/null && echo "⚠ Missing implements clause"
grep -L "implements.*Contract" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ Missing implements clause"

echo "=== Checking Requests implement contracts ==="
grep -L "implements.*Contract" src/Http/Requests/Admin/*.php 2>/dev/null && echo "⚠ Missing implements clause"
grep -L "implements.*Contract" src/Http/Requests/Api/*.php 2>/dev/null && echo "⚠ Missing implements clause"

echo "=== Checking Resources implement contracts ==="
grep -L "implements.*Contract" src/Http/Resources/*.php 2>/dev/null && echo "⚠ Missing implements clause"

# 2. Check ServiceProvider has API bindings
echo "=== Checking ServiceProvider API bindings ==="
grep -q "controllers.api" src/*ServiceProvider.php && echo "✓ API controller binding exists" || echo "✗ Missing API controller binding"
grep -q "requests.api" src/*ServiceProvider.php && echo "✓ API request binding exists" || echo "✗ Missing API request binding"
grep -q "resources\." src/*ServiceProvider.php && echo "✓ Resource binding exists" || echo "✗ Missing resource binding"

# 3. Check config has API sections
echo "=== Checking config API sections ==="
grep -q "'api' =>" config/*.php && echo "✓ Config has API sections" || echo "✗ Missing API sections in config"
grep -q "'resources' =>" config/*.php && echo "✓ Config has resources section" || echo "✗ Missing resources section in config"

# 4. Verify API routes exist
echo "=== Checking API routes ==="
test -f routes/api.php && echo "✓ API routes file exists" || echo "✗ Missing routes/api.php"

# 5. Check API controller uses contracts (not concrete classes)
echo "=== Checking API controller uses contracts ==="
grep -q "use.*Http\\\\Resources\\\\" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ API controller importing concrete resource classes" || echo "✓ No concrete resource imports"
grep -q "use.*Http\\\\Requests\\\\Api\\\\" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ API controller importing concrete request classes" || echo "✓ No concrete request imports"

# 6. Check for ANY concrete implementations being imported (package extensibility)
echo "=== Checking for concrete implementation imports (breaks extensibility) ==="
grep -r "use.*\\\\Models\\\\" src/ --include="*.php" | grep -v "^src/Models/" | grep -v "Eloquent\\\\Model" && echo "⚠ Found concrete Model imports outside Models/" || echo "✓ No concrete Model imports"
grep -r "use.*\\\\Actions\\\\" src/ --include="*.php" | grep -v "^src/Actions/" && echo "⚠ Found concrete Action imports outside Actions/" || echo "✓ No concrete Action imports"
grep -r "use.*\\\\Http\\\\Controllers\\\\" src/ --include="*.php" | grep -v "^src/Http/Controllers/" | grep -v "AbstractController" && echo "⚠ Found concrete Controller imports" || echo "✓ No concrete Controller imports"
```

```bash
# 7. Check composer.json has required dependencies
echo "=== Checking composer.json ==="
grep -q '"php": "\\^8.2"' composer.json && echo "✓ PHP ^8.2 required" || echo "✗ Missing php ^8.2 requirement"
grep -q '"bespoke-uk/package-tools": "\\^10.0"' composer.json && echo "✓ package-tools ^10.0 required" || echo "✗ Missing package-tools requirement"
grep -q '"phpunit/phpunit"' composer.json && echo "✓ PHPUnit in require-dev" || echo "✗ Missing PHPUnit"
grep -q '"larastan/larastan"' composer.json && echo "✓ Larastan in require-dev" || echo "✗ Missing Larastan"

# 8. Check for Pest files (should not exist)
echo "=== Checking for Pest files ==="
test -f tests/Pest.php && echo "✗ Pest.php found - must replace with PHPUnit" || echo "✓ No Pest.php"
grep -rl "^test(" tests/ --include="*.php" 2>/dev/null && echo "✗ Pest test syntax found" || echo "✓ No Pest syntax"

# 9. Check migration naming
echo "=== Checking migration naming ==="
ls database/migrations/ 2>/dev/null | grep -E "^[0-9]{4}_" && echo "✗ Migrations have datetime prefix - remove it" || echo "✓ No datetime prefix"
ls database/migrations/*.php.stub 2>/dev/null > /dev/null 2>&1 && echo "✓ Migrations use .php.stub extension" || echo "⚠ Check migration file extensions"
```

### 12.2 Contract-Implementation Alignment Checklist

For every contract in `src/Contracts/`, verify the implementation:

| Contract Location | Implementation Must Have |
|-------------------|-------------------------|
| `Contracts/Model.php` | Model class with `implements ModelContract` |
| `Contracts/Admin/ModelController.php` | Admin controller with `implements ModelControllerContract` |
| `Contracts/Admin/StoreModel.php` | Admin request with `implements StoreModelContract` |
| `Contracts/Admin/UpdateModel.php` | Admin request with `implements UpdateModelContract` |
| `Contracts/Api/ModelController.php` | API controller with `implements ModelControllerContract` |
| `Contracts/Api/StoreModel.php` | API request with `implements StoreModelContract` |
| `Contracts/Api/UpdateModel.php` | API request with `implements UpdateModelContract` |
| `Contracts/Api/ModelResource.php` | API resource with `implements ModelResourceContract` |
| `Contracts/Api/ModelCollection.php` | API collection with `implements ModelCollectionContract` |
| `Contracts/CreateModel.php` | Action with `implements CreateModelContract` |
| `Contracts/ModelImport.php` | Import handler with `implements ModelImportContract` |
| `Contracts/ModelExport.php` | Export handler with `implements ModelExportContract` |

### 12.3 ServiceProvider Binding Verification

For CRUD packages, verify `registerControllerBindings()` includes:

```php
// ✅ MUST have Admin controller binding
$this->app->bind(AdminModelControllerContract::class, ...);

// ✅ MUST have API controller binding
$this->app->bind(ApiModelControllerContract::class, ...);
```

For CRUD packages, verify `registerRequestBindings()` includes:

```php
// ✅ MUST have Admin request bindings
$this->app->bind(AdminStoreModelContract::class, ...);
$this->app->bind(AdminUpdateModelContract::class, ...);

// ✅ MUST have API request bindings
$this->app->bind(ApiStoreModelContract::class, ...);
$this->app->bind(ApiUpdateModelContract::class, ...);
```

For CRUD packages, verify `registerResourceBindings()` includes:

```php
// ✅ MUST have API resource bindings
$this->app->bind(ModelResourceContract::class, function ($app) {
    return $app->make($app->config['package.resources.model']);
});
$this->app->bind(ModelCollectionContract::class, function ($app) {
    return $app->make($app->config['package.resources.model_collection']);
});
```

### 12.4 Config File Verification

Verify config has nested structure for controllers, requests, and resources:

```php
// ✅ CORRECT structure
'controllers' => [
    'admin' => [
        'model' => \Package\Http\Controllers\Admin\ModelController::class,
    ],
    'api' => [
        'model' => \Package\Http\Controllers\Api\ModelController::class,
    ],
],
'requests' => [
    'admin' => [
        'store_model' => \Package\Http\Requests\Admin\StoreModel::class,
        'update_model' => \Package\Http\Requests\Admin\UpdateModel::class,
    ],
    'api' => [
        'store_model' => \Package\Http\Requests\Api\StoreModel::class,
        'update_model' => \Package\Http\Requests\Api\UpdateModel::class,
    ],
],
'resources' => [
    'model' => \Package\Http\Resources\ModelResource::class,
    'model_collection' => \Package\Http\Resources\ModelCollection::class,
],
```

### 12.5 Pre-Commit Checklist Summary

Before committing changes to a CRUD package, verify:

- [ ] **Package Classification**: Confirmed this is a CRUD package (not utility)
- [ ] **Contracts Exist**: All bound classes have corresponding contracts
- [ ] **ALL Controllers Have Contracts**: Every controller (Admin, API, auxiliary) implements a contract
- [ ] **Implements Clauses**: All implementations have `implements ContractName`
- [ ] **No Concrete Imports**: No code imports from `Models\`, `Actions\`, `Http\Controllers\` directly (use `Contracts\`)
- [ ] **API Contracts**: `Contracts/Api/` has controller, request, AND resource contracts
- [ ] **API Controller Binding**: ServiceProvider binds API controller contract
- [ ] **API Request Bindings**: ServiceProvider binds API request contracts
- [ ] **API Resource Bindings**: ServiceProvider has `registerResourceBindings()` method
- [ ] **API Controller Uses Contracts**: Controller type-hints contracts, not concrete classes
- [ ] **Resource Instantiation**: Uses `app(ResourceContract::class, ['resource' => $model])`
- [ ] **Config Structure**: Config has `controllers.api`, `requests.api`, and `resources` sections
- [ ] **Routes File**: `routes/api.php` exists with RESTful endpoints
- [ ] **UUID Binding**: API routes use `{model:uuid}` pattern
- [ ] **composer.json**: Has correct `require`, `require-dev`, `scripts`, and `config` sections (Section 3.3)
- [ ] **PHPUnit Tests**: Tests use PHPUnit (not Pest), with `TestCase.php` and `ExampleTest.php` (Section 3.4)
- [ ] **Migration Naming**: Migrations use `.php.stub` extension with no datetime prefix (Section 3.5)

### 12.6 Common Audit Failures (Lessons Learned)

These issues were discovered during the February 2026 core and default package audits:

| Package | Issue Found | Root Cause |
|---------|-------------|------------|
| `core/user` | API controller not bound | `registerControllerBindings()` only had Admin |
| `core/user` | API resources using concrete classes | Controller imported `Http\Resources\` instead of contracts |
| `core/document` | API request contracts not bound | `registerRequestBindings()` only had Admin |
| `core/image` | API controller not bound | Same pattern - Admin only |
| `core/note` | API request contracts not bound | Same pattern - Admin only |
| `core/profile` | Flagged for missing CRUD features | Misclassified - it's a utility package |
| `core/core` | Flagged for missing ServiceProvider | Misclassified - it's a meta-package |
| `default/seo` | Using `Interfaces/` directory | Should be `Contracts/` per naming convention |
| `default/cloudflare` | Empty contract interface | `interface CloudFlare {}` with no method signatures |
| `default/cloudflare` | Service not implementing contract | `CloudFlare` service missing `implements CloudFlareContract` |
| `default/referrer` | Empty contract interface | `interface Referrer {}` with no method signatures |
| `default/referrer` | Service not implementing contract | `Referrer` service missing `implements ReferrerContract` |
| `default/continent` | Missing export functionality | CRUD package without export handler |
| `default/country` | Missing export functionality | CRUD package without export handler |
| `default/redirect` | Missing export functionality | CRUD package without export handler |

**Pattern:** When adding API functionality, developers often:
1. Create the API controller ✓
2. Create the API routes ✓
3. Create the API contracts (controller, requests) ✓
4. **FORGET** to create resource contracts ✗
5. **FORGET** to add ServiceProvider bindings ✗
6. **FORGET** to make implementations `implements` the contracts ✗
7. **FORGET** to use contract type-hints in controllers ✗
8. **Use** `new ResourceClass($model)` instead of `app(Contract::class, ['resource' => $model])` ✗

**Pattern:** When creating service contracts, developers often:
1. Create the contract file ✓
2. Register the binding in ServiceProvider ✓
3. **FORGET** to add method signatures to the contract (leaving it empty) ✗
4. **FORGET** to add `implements ContractName` to the service class ✗

---

## Appendix A: Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.8 | 2026-02-06 | **Composer & testing standards:** Added Section 3.3 (composer.json Requirements) defining mandatory require, require-dev, scripts, and config sections for all packages. Added Section 3.4 (Testing Requirements) mandating PHPUnit over Pest with reference TestCase and ExampleTest examples. Added Section 3.5 (Migration Naming Convention) requiring `.php.stub` extension and no datetime prefix. Updated directory tree to reflect correct migration naming and test file structure. |
| 1.7 | 2026-02-05 | **Actions layer standardisation:** Expanded Section 7.3 with standalone CRUD action patterns (Create/Update/Delete). Added complete examples for action contracts, ServiceProvider registration, and config. Added note on import alias conflicts. Fixed `ContactsInterface` → `Contracts\Contacts` reference. Updated default packages (continent, country, redirect) now have full Actions layer. See ADR-012 in DECISIONS.md. |
| 1.6 | 2026-02-04 | **Service contracts:** Added pitfalls 10.20 (Empty Contract Interfaces) and 10.21 (Service Classes Not Implementing Contracts) with detection commands. Updated Section 12.6 lessons learned with default package audit findings (cloudflare, referrer, seo, continent, country, redirect). Added service contract patterns to common mistakes. |
| 1.5 | 2026-02-04 | **Extensibility focus:** Added core principles 5-6 (No Concrete Implementations, Package Extensibility). Expanded Section 2.3 with extensibility example showing how applications override package classes. Added pitfall 10.18 (Using Concrete Implementations Instead of Contracts) with bash commands to detect violations. Updated verification commands and pre-commit checklist to catch concrete imports. |
| 1.4 | 2026-02-04 | **Major update:** API resources now require contracts. Added resource contract requirements to Section 4, updated API controller example in Section 7.2 to use contracts and container resolution, added `resources` config section, added `registerResourceBindings()` to ServiceProvider template, added pitfall 10.17 (API controllers using concrete classes), updated audit checklists to include resources |
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
