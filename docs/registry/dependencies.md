# Package Dependencies

This document maps all package dependencies in the Bespoke CMS monorepo.

**Last Updated:** 2026-02-04

---

## Dependency Hierarchy

```
Foundation Layer (no Bespoke dependencies)
├── template/package-tools ─────────────────────────────────────┐
│   └── template/laravel-package-tools (reference only)         │
│                                                                │
├── core/module ◄───────────────────────────────────────────────┤
│   (extends package-tools, provides AbstractModel/Import/Export)│
│                                                                │
Core Services Layer                                              │
├── core/acl ◄── (permissions)                                   │
├── core/activity ◄── (logging)                                  │
├── core/auth ◄── (authentication)                               │
├── core/user ◄── (user management)                              │
├── core/employee ◄── (staff)                                    │
├── core/setting ◄── (configuration)                             │
│                                                                │
Feature Packages                                                 │
├── crm/* ◄── (customer relationship)                            │
├── cms/* ◄── (content management)                               │
├── default/* ◄── (utilities)                                    │
└── blade/* ◄── (UI components)                                  │
                                                                 │
Meta Packages (bundle others)                                    │
├── core/core ◄── (bundles all core packages)                    │
├── cms/cms ◄── (bundles all CMS packages)                       │
├── default/default ◄── (bundles all default packages)           │
└── blade/blade ◄── (bundles all blade packages)                 │
```

---

## Foundation Packages

These packages have no Bespoke dependencies:

| Package | Purpose |
|---------|---------|
| `template/package-tools` | Base PackageServiceProvider for all packages |
| `template/laravel-package-tools` | Original Spatie reference |
| `api/brevo` | Brevo API client |
| `api/hubspot` | HubSpot API client |
| `api/jira` | Jira API client |
| `api/microsoft` | Microsoft Graph API |
| `api/openai` | OpenAI API client |
| `crm/date` | Date utilities (UK bank holidays) |
| `custom/screenshot` | Browsershot wrapper |

---

## Package Dependencies by Category

### Template Packages

| Package | Dependencies |
|---------|--------------|
| `package-tools` | (none - foundation) |
| `laravel-package-tools` | (none - reference) |
| `skeleton` | package-tools |
| `skeleton-alias` | package-tools |
| `skeleton-blade` | package-tools |
| `skeleton-crud` | module, package-tools |

### Core Packages

| Package | Dependencies |
|---------|--------------|
| `module` | package-tools |
| `acl` | module, package-tools |
| `activity` | module, package-tools |
| `auth` | module, package-tools |
| `backup` | module, package-tools |
| `captcha` | package-tools |
| `chart` | module, package-tools |
| `core` | module, package-tools, acl, activity, auth, backup, captcha, chart, dashboard, document, editor, employee, image, note, notification, profile, security, setting, two-factor, user |
| `dashboard` | module, package-tools |
| `document` | module, package-tools |
| `editor` | module, package-tools |
| `employee` | module, package-tools |
| `image` | module, package-tools |
| `note` | module, package-tools |
| `notification` | module, package-tools |
| `profile` | module, package-tools |
| `security` | captcha, module, package-tools |
| `setting` | module, package-tools, cloudflare, referrer |
| `two-factor` | module, package-tools |
| `user` | module, package-tools |

### CMS Packages

| Package | Dependencies |
|---------|--------------|
| `cms` | package-tools, enquiry, menu, menu-item, page, post, post-category, review, social |
| `enquiry` | module, package-tools, captcha |
| `menu` | module, package-tools |
| `menu-item` | module, package-tools |
| `page` | module, package-tools |
| `post` | module, package-tools |
| `post-category` | module, package-tools |
| `review` | module, package-tools |
| `social` | setting |

### CRM Packages

| Package | Dependencies |
|---------|--------------|
| `address` | module, package-tools |
| `calendar` | acl, activity, blade, calendar-event, enums, module, seo, traits |
| `calendar-event` | acl, activity, blade, enums, image, module, traits |
| `city` | acl, activity, blade, county, enums, import, module, openai, seo |
| `contact` | module, package-tools |
| `county` | acl, activity, blade, enums, import, module, openai, region, seo |
| `customer` | module, package-tools |
| `customer-package` | acl, activity, blade, enums, module, traits |
| `date` | (none) |
| `email-template` | acl, activity, blade, enums, module, traits |
| `location` | module, package-tools |
| `project` | acl, activity, blade, calendar, enums, export, module, task, traits |
| `region` | acl, activity, blade, country, enums, import, module, openai, seo |
| `supplier` | module, package-tools |
| `task` | acl, activity, blade, document, enums, export, image, module, note, traits |

### Default Packages

| Package | Dependencies |
|---------|--------------|
| `cloudflare` | module, package-tools |
| `continent` | module, package-tools |
| `cookie` | module, package-tools |
| `country` | module, package-tools |
| `default` | package-tools, cloudflare, continent, cookie, country, pwa, redirect, referrer, seo |
| `pwa` | module, package-tools |
| `redirect` | module, package-tools |
| `referrer` | module, package-tools |
| `seo` | module, package-tools |

### API Packages

| Package | Dependencies |
|---------|--------------|
| `brevo` | (none) |
| `google-apis` | module |
| `harvest` | activity, enums |
| `hubspot` | (none) |
| `jira` | (none) |
| `magento` | module, package-tools, seo |
| `microsoft` | (none) |
| `openai` | (none) |

### Blade Packages

| Package | Dependencies |
|---------|--------------|
| `blade` | module, package-tools, + all 34 blade-* packages |
| `blade-*` (34 packages) | package-tools only |

### Custom Packages

| Package | Dependencies |
|---------|--------------|
| `area` | city, module |
| `case-study` | acl, activity, blade, case-study-category, editor, enums, image, module, seo, traits |
| `case-study-category` | acl, activity, blade, editor, enums, image, module, seo, traits |
| `screenshot` | (none) |
| `tests` | module, acl, employee, user, package-tools |

### E-commerce Packages

| Package | Dependencies |
|---------|--------------|
| `product` | acl, activity, blade, enums, module, package-tools, traits |

---

## Reverse Dependencies (What Depends On This)

### Most Depended Upon

| Package | Depended On By (count) |
|---------|------------------------|
| `package-tools` | 90+ packages |
| `module` | 70+ packages |
| `acl` | 15+ packages |
| `activity` | 15+ packages |
| `blade` | 12+ packages |
| `enums` | 12+ packages |
| `traits` | 10+ packages |
| `seo` | 8+ packages |
| `image` | 5+ packages |

### Core Package Reverse Dependencies

| Package | Depended On By |
|---------|----------------|
| `module` | All CRUD packages, most utility packages |
| `acl` | calendar, calendar-event, city, core, county, customer-package, email-template, product, project, region, task, tests, case-study, case-study-category |
| `activity` | calendar, calendar-event, city, core, county, customer-package, email-template, harvest, product, project, region, task, case-study, case-study-category |
| `auth` | core |
| `user` | core, tests |
| `employee` | core, tests |
| `captcha` | enquiry, security |
| `setting` | core, social |
| `document` | core, task |
| `image` | calendar-event, core, task, case-study, case-study-category |
| `note` | core, task |

### CRM Package Reverse Dependencies

| Package | Depended On By |
|---------|----------------|
| `calendar` | project |
| `calendar-event` | calendar |
| `city` | area |
| `contact` | (standalone - provides traits) |
| `county` | city |
| `customer` | (standalone - provides traits) |
| `region` | county |
| `task` | project |

### Default Package Reverse Dependencies

| Package | Depended On By |
|---------|----------------|
| `cloudflare` | default, setting |
| `country` | default, region |
| `referrer` | default, setting |
| `seo` | calendar, city, county, default, magento, region, case-study, case-study-category |

---

## Dependency Chains

### Geographic Hierarchy
```
country → region → county → city → area
```

### CRM Work Management
```
customer → project → task
                  ↘ calendar → calendar-event
```

### Core Meta Package
```
core (meta) requires:
├── acl, activity, auth, backup, captcha
├── chart, dashboard, document, editor
├── employee, image, note, notification
├── profile, security, setting
├── two-factor, user
└── module, package-tools
```

### CMS Meta Package
```
cms (meta) requires:
├── enquiry, menu, menu-item
├── page, post, post-category
├── review, social
└── package-tools
```

---

## Impact Analysis

### High Impact Packages (changes affect many others)

| Package | Impact Level | Reason |
|---------|--------------|--------|
| `package-tools` | **CRITICAL** | Foundation for ALL packages |
| `module` | **CRITICAL** | Base classes for most packages |
| `acl` | High | Permissions used by admin interfaces |
| `activity` | High | Logging used by most CRUD packages |
| `blade` | High | UI components for all admin views |
| `enums` | Medium | Shared enumerations |
| `traits` | Medium | Shared model traits |
| `seo` | Medium | SEO functionality |

### Safe to Modify (few or no dependents)

| Package | Dependents |
|---------|------------|
| `api/*` packages | Generally standalone |
| `crm/date` | None |
| `custom/screenshot` | None |
| `blade-*` individual packages | Only blade meta-package |

---

## Common Dependency Patterns

### Standard CRUD Package
```
my-package requires:
├── bespoke-uk/module (AbstractModel, AbstractImport, AbstractExport)
└── bespoke-uk/package-tools (PackageServiceProvider)
```

### Feature-Rich CRUD Package
```
my-package requires:
├── bespoke-uk/module
├── bespoke-uk/package-tools
├── bespoke-uk/acl (permissions)
├── bespoke-uk/activity (logging)
├── bespoke-uk/blade (UI components)
├── bespoke-uk/enums (shared enums)
└── bespoke-uk/traits (shared traits)
```

### Polymorphic Attachment User
```
my-package requires:
├── bespoke-uk/document (HasDocuments trait)
├── bespoke-uk/image (HasImages trait)
└── bespoke-uk/note (HasNotes trait)
```

---

## Quick Reference Commands

```bash
# Show what a package depends on
cat crm/contact/composer.json | jq '.require | keys | map(select(startswith("bespoke-uk/")))'

# Find all packages that depend on a specific package
grep -r '"bespoke-uk/acl"' */*/composer.json | cut -d: -f1

# Count dependencies for a package
cat core/core/composer.json | jq '[.require | keys | .[] | select(startswith("bespoke-uk/"))] | length'

# List packages with no Bespoke dependencies
for f in */*/composer.json; do
  deps=$(cat "$f" | jq -r '.require // {} | keys | map(select(startswith("bespoke-uk/"))) | length')
  if [ "$deps" = "0" ]; then echo "$f"; fi
done
```
