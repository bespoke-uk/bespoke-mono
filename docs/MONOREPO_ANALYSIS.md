# Bespoke CMS Monorepo - Comprehensive Analysis

**Purpose:** Complete analysis of all 108 packages in the Bespoke CMS monorepo
**Created:** 2026-02-04
**Last Updated:** 2026-02-06
**Status:** Complete

---

## How to Use This Document

This document provides deep context about every package in the monorepo. Use it to:

1. **Understand package relationships** - See dependency graphs and cross-package references
2. **Determine package type** - Identify if a package is CRUD, Utility, or API integration
3. **Check completeness status** - Know what functionality exists vs what needs building
4. **Find reference implementations** - Use `crm/contact` as the gold standard for CRUD packages

**Related Documentation:**
- **[PACKAGE_STANDARDS.md](PACKAGE_STANDARDS.md)** - Architecture standards and compliance requirements
- **[CLAUDE.md](CLAUDE.md)** - Quick reference for working with the codebase

---

## Executive Summary

The Bespoke CMS monorepo contains **108 Laravel packages** organised into 9 categories. All packages extend `bespoke-uk/package-tools` (a fork of Spatie's laravel-package-tools) which provides `PackageServiceProvider` as the base class.

### Key Statistics

| Category | Count | Primary Purpose |
|----------|-------|-----------------|
| Template | 6 | Package scaffolding and framework base |
| API | 8 | Third-party API integrations |
| Blade | 34 | UI components (Tailwind/Livewire) |
| CMS | 9 | Content management (pages, posts, menus) |
| Core | 20 | System functionality (auth, user, ACL) |
| CRM | 15 | Customer relationship management |
| Default | 9 | Utilities (SEO, cookies, redirects) |
| Custom | 6 | Client-specific packages |
| E-commerce | 1 | Product management (scaffold) |

---

## 1. Template Packages (6)

Foundation packages that all other packages build upon.

### 1.1 package-tools (FOUNDATION)
**The core of the entire ecosystem.** All 100+ packages extend this.

- **Namespace:** `Bespoke\PackageTools`
- **Purpose:** Enhanced fork of Spatie's laravel-package-tools
- **Key Classes:**
  - `PackageServiceProvider` - Base for all service providers
  - `Package` - Configuration object with fluent API
- **Traits (14):** Has* traits for configuration
- **Concerns (22):** Registers* concerns for registration
- **Status:** Complete, production-ready

### 1.2 laravel-package-tools (Reference)
- Original Spatie package (reference implementation)
- Status: Complete (external dependency)

### 1.3 skeleton (General Template)
- Interactive CLI wizard for new packages
- Placeholder substitution system
- Status: Complete template

### 1.4 skeleton-blade (UI Template)
- Specialised for Blade component packages
- Configured for views and components
- Status: Complete template

### 1.5 skeleton-crud (Domain Template)
- Full CRUD package template
- Models, controllers, routes, events
- Requires `bespoke-uk/module`
- Status: Complete template

### 1.6 skeleton-alias (Meta-package Template)
- For creating package aggregators
- No PHP code, just composer.json
- Status: Complete template

---

## 2. API Packages (8)

Third-party service integrations.

| Package | External Service | Status | Key Features |
|---------|------------------|--------|--------------|
| **harvest** | Harvest + Forecast | Mature | 25+ resources, filters, scheduling |
| **jira** | Atlassian Jira | Mature | 35+ methods, JQL support |
| **magento** | Magento REST | Mature | 11 resources, parsers, DTOs |
| **hubspot** | HubSpot CRM | Functional | Rate limiting, contact sync |
| **microsoft** | MS Graph OAuth2 | Functional | Token management, refresh |
| **google-apis** | Google OAuth2 | Partial | Gmail, Calendar, Drive |
| **openai** | OpenAI GPT | Minimal | Content rewriting helper |
| **brevo** | Brevo/Sendinblue | WIP | Scaffold only |

### Authentication Methods
- **OAuth2:** google-apis, microsoft
- **API Token:** harvest, hubspot, magento
- **Basic Auth:** jira
- **API Key:** openai, brevo

---

## 3. Blade Packages (34)

UI component library built on Tailwind CSS with Livewire integration.

### Hierarchy

**Meta Package:**
- `blade` - Bundles all 33 component packages

**Core UI (5):**
- `blade-icon` - 100+ SVG icons
- `blade-button` - Button variants
- `blade-link` - Link components
- `blade-badge` - Badge/status indicators
- `blade-alert` - Alert messages

**Layout & Structure (4):**
- `blade-card` - Card containers
- `blade-grid` - 12-column CSS grid
- `blade-list` - List components
- `blade-table` - Table components

**Navigation (4):**
- `blade-dropdown` - Dropdown menus
- `blade-tab` - Tab navigation
- `blade-aside` - Sidebar navigation
- `blade-pagination` - Pagination controls

**Forms (2):**
- `blade-form` - Complete form inputs
- `blade-auto-complete` - Autocomplete (Livewire)

**Interactive (4):**
- `blade-accordion` - Collapsible sections
- `blade-modal` - Modal dialogs
- `blade-step` - Step indicators
- `blade-loading` - Loading spinners

**Data Display (3):**
- `blade-feed` - Activity feeds
- `blade-progress` - Progress indicators
- `blade-data-table` - Data tables (Livewire)

**Page Layouts (6):**
- `blade-admin` - Admin dashboard (27 components)
- `blade-frontend` - Frontend layout (39 components)
- `blade-account` - Account pages (23 components)
- `blade-auth` - Auth pages
- `blade-error` - Error pages
- `blade-widget` - Dashboard widgets

**Document Templates (2):**
- `blade-mail` - Email templates
- `blade-pdf` - PDF templates

**Utilities (3):**
- `blade-flag` - 270+ country flags
- `blade-meta` - SEO meta tags
- `blade-map` - Google Maps (Livewire)

---

## 4. CMS Packages (9)

Content management system.

| Package | Model | API | Exports | Imports | Status |
|---------|-------|-----|---------|---------|--------|
| **cms** | None (meta) | - | - | - | Complete |
| **page** | Page | Yes | No | No | 98% |
| **post** | Post | Yes | No | No | 98% |
| **post-category** | PostCategory | Yes | No | No | 95% |
| **menu** | Menu | No | No | No | 95% |
| **menu-item** | MenuItem | No | No | No | 90% |
| **enquiry** | Enquiry | No | No | No | 95% |
| **review** | Review | No | Yes | Yes | 98% |
| **social** | None (utility) | - | - | - | 100% |

### Key Relationships
```
Page ←→ MenuItem (polymorphic)
Post ←→ MenuItem (polymorphic)
Post ←→ PostCategory (many-to-many)
Menu ←→ MenuItem (parent-child)
MenuItem ←→ MenuItem (nested via parent_id)
```

### Notable Features
- **Menu:** Forever cache with intelligent invalidation
- **Review:** Only CMS package with import/export
- **Social:** Lightweight sharing URL helpers

---

## 5. Core Packages (20)

System functionality and utilities.

### CRUD Packages (Full Standards Required)

| Package | Model | API | Exports | Imports | Status |
|---------|-------|-----|---------|---------|--------|
| **employee** | Employee | Yes | Yes | Yes | 70% |
| **user** | User | Yes | No | No | 55% |
| **profile** | Profile | No | No | No | 45% |
| **document** | Document | Yes | Yes | Yes | 90% |
| **image** | Image | Yes | Yes | Yes | 90% |
| **note** | Note | Yes | Yes | Yes | 90% |

### Complex System Packages

| Package | Purpose | Contracts | Bindings |
|---------|---------|-----------|----------|
| **auth** | Authentication (web, API, 2FA, magic links) | 21 | 4 |
| **acl** | Roles and permissions | 10 | 6 |
| **setting** | Application settings | 4 | 4 |
| **notification** | Database notifications | 0 | 1 |

### Utility Packages (No API Required)

| Package | Purpose | Type |
|---------|---------|------|
| **activity** | Activity logging | Trait provider (Spatie) |
| **backup** | Backup configuration | Wrapper (Spatie) |
| **captcha** | CAPTCHA validation | Validation utility |
| **chart** | Chart components | Livewire components |
| **core** | Meta package | Placeholder |
| **dashboard** | Dashboard builder | Landing page |
| **editor** | WYSIWYG editor | Component wrapper |
| **module** | Framework base | AbstractModel, AbstractImport, AbstractExport |
| **security** | Security middleware | Middleware/helpers |
| **two-factor** | 2FA authentication | Authentication traits |

---

## 6. CRM Packages (15)

Customer relationship management.

### Core Entities

| Package | Model | API | Exports | Imports | Contracts | Status |
|---------|-------|-----|---------|---------|-----------|--------|
| **contact** | Contact | Yes | Yes | Yes | 13 | **100% (Reference)** |
| **customer** | Customer | Yes | No | Yes | 10 | 95% |
| **supplier** | Supplier | Yes | No | Yes | 10 | 95% |

### Work Management

| Package | Model | API | Exports | Imports | Contracts | Status |
|---------|-------|-----|---------|---------|-----------|--------|
| **project** | Project | Yes | Yes | Yes | 17 | 98% |
| **task** | Task | Yes | Yes | Yes | 13 | 98% |
| **customer-package** | CustomerPackage, CustomerPackageTime | Yes | Yes | Yes | 18 | 98% |

### Geographic Hierarchy

| Package | Model | API | Exports | Imports | Contracts | Status |
|---------|-------|-----|---------|---------|-----------|--------|
| **region** | Region | Yes | Yes | Yes | 16 | 98% |
| **county** | County | Yes | Yes | Yes | 14 | 98% |
| **city** | City | Yes | Yes | Yes | 14 | 98% |

### Supporting Packages

| Package | Purpose | Contracts | Status |
|---------|---------|-----------|--------|
| **address** | Polymorphic address management | 16 | 98% |
| **location** | Google geolocation services (utility) | 2 | 95% |
| **calendar** | Multi-view calendar system (utility) | 2 | 85% |
| **calendar-event** | Calendar event management (utility) | 2 | 90% |
| **date** | UK bank holidays, working days (utility) | 0 | 100% |
| **email-template** | Email preview utility | 0 | 100% |

### Key Relationships
```
Customer (core entity)
├── Has Addresses (polymorphic)
├── Has Contacts (polymorphic)
├── Has Projects
├── Has Tasks
└── Has CustomerPackages

Project
├── BelongsTo Customer
├── BelongsTo Contact
├── HasMany Tasks
└── MorphToMany Assignees (employees)

Geographic Hierarchy
Country → Region → County → City
```

---

## 7. Default Packages (9)

Default utilities and infrastructure.

| Package | Type | CRUD | Models | Status | Key Features |
|---------|------|------|--------|--------|--------------|
| **default** | Meta-package | - | - | 100% | Bundles all 8 packages |
| **continent** | CRUD | Yes | Yes | 98% | Geography, images, SEO, full Actions layer |
| **country** | CRUD | Yes | Yes | 98% | ISO codes, geolocation, full Actions layer |
| **redirect** | CRUD | Yes | Yes | 95% | 301 redirects, middleware, full Actions layer |
| **cloudflare** | Utility | No | No | 93% | Cache purging, zones |
| **cookie** | Utility | No | No | 93% | GDPR consent (Livewire) |
| **pwa** | Utility | No | No | 100% | Service worker, manifest |
| **referrer** | Utility | No | No | 90% | Traffic source detection |
| **seo** | Utility | No | No | 90% | Slugs, meta, sitemaps |

---

## 8. Custom Packages (6)

Client-specific packages.

| Package | Type | Status | Purpose |
|---------|------|--------|---------|
| **case-study** | CRUD | Complete | Case studies with categories, images, SEO |
| **case-study-category** | CRUD | Complete | Case study categorisation |
| **area** | Frontend | Complete | Geographic area pages |
| **screenshot** | Utility | Complete | Browsershot screenshots |
| **tests** | Testing | Complete | Test fixtures and assertions |
| **wysiwyg-editor** | NPM/TS | WIP | Frontend rich text editor |

---

## 9. E-commerce Packages (1)

| Package | Status | Description |
|---------|--------|-------------|
| **product** | 25% Scaffold | Foundation only - model, config, routes defined but no implementation |

---

## Package Dependency Graph

```
Foundation Layer
└── bespoke-uk/package-tools (required by ALL packages)
    └── bespoke-uk/module (required by most CRUD packages)
        ├── AbstractModel
        ├── AbstractImport
        └── AbstractExport

Core Dependencies
├── bespoke-uk/acl (permissions)
├── bespoke-uk/activity (logging)
├── bespoke-uk/auth (authentication)
├── bespoke-uk/user (users)
└── bespoke-uk/employee (staff)

CRM Dependencies
├── bespoke-uk/contact (polymorphic contacts)
├── bespoke-uk/customer (customers)
├── bespoke-uk/address (addresses)
└── bespoke-uk/location (geolocation)

UI Dependencies
├── bespoke-uk/blade (all UI components)
├── bespoke-uk/editor (WYSIWYG)
└── bespoke-uk/image (images)

Utility Dependencies
├── bespoke-uk/seo (SEO)
├── bespoke-uk/enums (enumerations)
└── bespoke-uk/traits (shared traits)
```

---

## Package Classification Summary

### By Type

| Classification | Count | Examples |
|----------------|-------|----------|
| CRUD Packages | ~25 | contact, customer, page, post, document, image, note |
| Utility Packages | ~35 | activity, seo, cookie, security |
| UI Components | 34 | blade-* packages |
| API Integrations | 8 | harvest, jira, magento |
| Meta Packages | 5 | cms, blade, default |
| Templates | 4 | skeleton-* packages |
| Incomplete/WIP | 2 | brevo, product |

### By Completeness

| Level | Count | Examples |
|-------|-------|----------|
| 100% Reference | 1 | contact |
| 95-99% Complete | ~50 | page, post, customer, country, document, image, note, address, city, county, region, project, task, customer-package |
| 70-94% Functional | ~25 | employee, cloudflare |
| 50-69% Partial | ~12 | user, profile, google-apis |
| <50% Scaffold/WIP | ~5 | product, brevo |

---

## Reference Implementation

The **`/crm/contact`** package is the reference implementation for PACKAGE_STANDARDS.md compliance:

- **Contracts:** 13 (with Admin subdirectory)
- **Binding Methods:** 7 implemented
- **API:** Full RESTful endpoints
- **Exports:** ContactExport with blade view
- **Imports:** ContactImport with schema file
- **Config:** 22 sections with nested structure
- **Livewire:** 7 components

All other CRUD packages should follow this pattern.

---

## Notes

### Packages Not Requiring API
The following core utility packages are correctly simplified and do NOT need API endpoints:
- activity, backup, captcha, chart, core, dashboard, editor, module, security, two-factor

### Packages Needing Improvement
Based on PACKAGE_STANDARDS.md analysis:
1. **employee** - Add missing binding methods, expand contracts
2. **user** - Add exports/imports, expand contracts
3. **profile** - Add API endpoints
4. **product** - Scaffold only, needs full implementation

### Recently Upgraded CRM Packages (2026-02-06)
The following 7 CRM packages were upgraded to full CRUD compliance:
- **address** (16 contracts) - Added API layer, actions, full contract coverage
- **city** (14 contracts) - Added API layer, actions, import contract, admin contracts
- **county** (14 contracts) - Added API layer, actions, import contract, admin contracts
- **region** (16 contracts) - Added API layer, actions, import contract, admin contracts
- **customer-package** (18 contracts) - Added API layer, CRUD actions, import, admin contracts
- **project** (17 contracts) - Added API layer, CRUD actions, import, admin contracts (preserved 4 existing actions)
- **task** (13 contracts) - Added API layer, CRUD actions, import, export contract, admin contracts

### Polymorphic Manager Packages (CRUD Compliant)
The following packages provide polymorphic relationships (any model can have these attached) and have full CRUD compliance for direct management:
- **document** - File/document attachment management (90% complete)
- **image** - Image/media asset management (90% complete)
- **note** - Note/comment attachment management (90% complete)

These packages provide both:
- Traits for parent models (`HasDocuments`, `HasImages`, `HasNotes`)
- Full API for direct document/image/note management (API routes, controllers, resources, exports, imports)

### Special Packages
- **module** - Provides AbstractModel, AbstractImport, AbstractExport base classes
- **date** - Pure service (Carbon extension for UK bank holidays)
- **email-template** - Admin utility for email preview only

---

## Key Insights for AI Context

### Architecture Patterns

1. **Contract-First Development**
   - Every class bound via `register*Bindings()` MUST have a contract (interface)
   - Contracts live in `src/Contracts/` (NOT `src/Interfaces/`)
   - Admin-specific contracts in `src/Contracts/Admin/`

2. **Config-Driven Bindings**
   - All implementations declared in package config file
   - ServiceProvider reads config to bind contracts to implementations
   - Allows runtime swapping of implementations

3. **Nested Config Structure**
   - `controllers.admin` and `controllers.api` (not flat)
   - `requests.admin` and `requests.api` (not flat)
   - Enables context-specific bindings

4. **UUID Route Binding**
   - All API routes use `{model:uuid}` not `{model}` or `{id}`
   - Provides security and portability

### Common Traits Pattern

Models compose functionality via traits:

```
AbstractModel (from bespoke-uk/module)
├── HasUUID - UUID primary key support
├── HasActivity - Spatie activity logging
├── HasStatus - Active/inactive status
├── SoftDeletes - Laravel soft deletes
└── Domain-specific traits (HasEmail, HasFirstName, etc.)
```

### Relationship Traits Pattern

Packages provide traits for polymorphic relationships:

```
HasContacts - MorphMany contacts (from bespoke-uk/contact)
HasDocuments - MorphMany documents (from bespoke-uk/document)
HasImages - MorphMany images (from bespoke-uk/image)
HasNotes - MorphMany notes (from bespoke-uk/note)
HasAddresses - MorphMany addresses (from bespoke-uk/address)
```

### ServiceProvider Binding Methods

The 14 binding methods (all packages should implement relevant ones):

| Method | Purpose | CRUD Required |
|--------|---------|---------------|
| `registerActionBindings()` | Business logic actions | Yes |
| `registerControllerBindings()` | Admin + API controllers | Yes |
| `registerDataBindings()` | Data transfer objects | Optional |
| `registerEnumBindings()` | Enumeration types | Optional |
| `registerExportBindings()` | Export handlers | Yes |
| `registerFactoryBindings()` | Non-model factories | Optional |
| `registerImportBindings()` | Import handlers | Yes |
| `registerModelBindings()` | Eloquent models | Yes |
| `registerParserBindings()` | File parsers | Optional |
| `registerRequestBindings()` | Form requests | Yes |
| `registerResourceBindings()` | API resources | Yes |
| `registerResponseBindings()` | Response objects | Optional |
| `registerRouteModelBindings()` | Route parameters | Yes |
| `registerRuleBindings()` | Validation rules | Optional |
| `registerServiceBindings()` | Service layer | Optional |

### File Count Expectations

For a fully compliant CRUD package like `crm/contact`:

| Directory | Minimum Files |
|-----------|---------------|
| `src/Contracts/` | 8-13 contracts |
| `src/Contracts/Admin/` | 2-4 admin contracts |
| `src/Http/Controllers/Admin/` | 1+ controllers |
| `src/Http/Controllers/Api/` | 1+ controllers |
| `src/Http/Requests/Admin/` | 1-3 requests |
| `src/Http/Requests/Api/` | 2 requests (Store, Update) |
| `src/Http/Resources/` | 1-2 resources |
| `src/Actions/` | 1+ actions |
| `src/Events/` | 1+ events |
| `src/Exports/` | 1 export handler |
| `src/Imports/` | 1 import handler |
| `resources/schema/` | 1 TSV schema file |
| `resources/views/exports/` | 1 export blade view |

### Quick Commands for Package Auditing

```bash
# Count contracts in a package
find src/Contracts -name "*.php" | wc -l

# Check binding methods implemented
grep -n "protected function register.*Bindings" src/*ServiceProvider.php

# Verify API routes exist
test -f routes/api.php && echo "✓ API routes" || echo "✗ Missing"

# Check for old Interfaces directory (should be Contracts)
test -d src/Interfaces && echo "⚠ Rename to Contracts/" || echo "✓ OK"

# List all config sections
grep -E "^    '[a-z_]+'" config/*.php
```

---

## Claude Code Tooling

Custom tooling available for working with this monorepo:

### Skills (Slash Commands)

| Command | Description |
|---------|-------------|
| `/audit <path>` | Audit package against PACKAGE_STANDARDS.md |
| `/new-crud <category/name>` | Scaffold new CRUD package |
| `/add-api <path>` | Add RESTful API to existing package |
| `/add-exports <path>` | Add import/export functionality |
| `/fix-contracts <path>` | Generate missing contracts |
| `/sync-docs` | Review and update documentation |

### Custom Agents

| Agent | Purpose |
|-------|---------|
| `package-auditor` | 81-point compliance scoring |
| `crud-scaffolder` | Creates packages from skeleton-crud |
| `api-scaffolder` | Adds API controllers, requests, resources, routes |
| `contract-generator` | Generates contract interfaces |
| `code-style-enforcer` | Runs Laravel Pint and Rector across packages |
| `docs-reviewer` | Reviews and updates documentation |
| `test-scaffolder` | Creates PHPUnit test files for packages |
| `dependency-analyzer` | Analyses cross-package dependencies |
| `migration-scaffolder` | Creates database migrations following conventions |
| `laravel-simplifier` | Simplifies and refines PHP/Laravel code for clarity |

### MCP Server Tools

The bespoke MCP server (`.claude/mcp-server/`) provides 9 tools:

- `get_package_info` - Detailed package information
- `list_packages` - List packages with category/type filters
- `find_trait_usages` - Find where traits are used
- `get_model_relationships` - Model relationship analysis
- `audit_package` - Quick compliance audit
- `search_packages` - Search by name, model, trait, component
- `get_test_coverage` - Check test coverage for a package
- `compare_packages` - Compare two packages for consistency
- `get_package_health` - Comprehensive health check

### Hooks

| Hook | Event | Action |
|------|-------|--------|
| `session-context.sh` | SessionStart | Injects monorepo context |
| `format-php.sh` | PostToolUse (Edit/Write) | Runs Laravel Pint |
| `validate-package-edit.sh` | PreToolUse (Edit) | Validates edits |
| `ensure-claude-md.sh` | PostToolUse (Write) | Reminds to create CLAUDE.md |
| `validate-commit.sh` | Pre-commit (manual) | Validates before git commits |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial comprehensive analysis |
| 1.1 | 2026-02-04 | Reclassified document, image, note as CRUD packages |
| 1.2 | 2026-02-04 | Added AI context section, key insights, patterns |
| 1.3 | 2026-02-04 | Added Claude Code tooling section (skills, agents, MCP server, hooks) |
| 1.4 | 2026-02-04 | Added /sync-docs skill and docs-reviewer agent for automatic documentation updates |
| 1.5 | 2026-02-04 | Updated document, image, note to 90% complete (full CRUD added); corrected package counts (108 total, 34 blade) |
| 1.6 | 2026-02-05 | All core packages migrated from Interfaces/ to Contracts/; added resource contracts to document, image, note, employee |
| 1.7 | 2026-02-05 | Added Actions layer to continent (98%), country (98%), redirect (95%). Utility packages audited: pwa (100%), cloudflare (93%), cookie (93%), referrer (90%), seo (90%). |
| 1.8 | 2026-02-06 | Added laravel-simplifier agent to documentation (10 agents total) |
| 1.9 | 2026-02-06 | 7 CRM CRUD packages upgraded to full compliance: address (16), city (14), county (14), region (16), customer-package (18), project (17), task (13). Each now has full API layer, contracts, actions, imports. ~108 new contracts added across CRM category. |
