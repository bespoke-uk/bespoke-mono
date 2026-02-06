# Project Configuration Examples

This document shows typical project configurations for the Bespoke CMS monorepo, helping developers understand how packages are composed for different use cases.

**Related Documentation:**
- [CLAUDE.md](../../CLAUDE.md) - Quick reference
- [package_standards.md](../standards/package_standards.md) - Architecture standards
- [monorepo_analysis.md](../registry/monorepo_analysis.md) - Complete package analysis

---

## Foundation Packages (Always Required)

These packages form the absolute foundation that all other packages depend on:

| Package | Purpose | Key Dependencies |
|---------|---------|------------------|
| `bespoke-uk/package-tools` | `PackageServiceProvider` base class | PHP ^8.2, Livewire ^2.12 |
| `bespoke-uk/module` | `AbstractModel`, imports/exports | package-tools, Maatwebsite Excel, DomPDF |

---

## Meta-Packages (Convenience Bundles)

Instead of installing individual packages, use these meta-packages:

| Meta-Package | Includes | Use Case |
|--------------|----------|----------|
| `bespoke-uk/core` | 18 packages | All core infrastructure |
| `bespoke-uk/cms` | 8 packages | Content management features |
| `bespoke-uk/default` | 8 packages | Frontend utilities |
| `bespoke-uk/blade` | 34 packages | All UI components |

---

## Project Configurations

### 1. Minimal API Project

For headless API-only applications with no UI:

```json
{
    "name": "client/api-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/auth": "^10.0",
        "bespoke-uk/user": "^10.0",
        "bespoke-uk/acl": "^10.0"
    }
}
```

**Provides:**
- User authentication (Sanctum-based)
- Role-based access control
- API token management

**Does NOT include:** UI components, CMS features, CRM

---

### 2. Basic CMS Project

For content-focused websites with pages and blog:

```json
{
    "name": "client/cms-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/core": "^10.0",
        "bespoke-uk/cms": "^10.0",
        "bespoke-uk/default": "^10.0",
        "bespoke-uk/blade-admin": "^10.0"
    }
}
```

**Provides:**
- Full authentication and user management
- Pages, posts, menus, enquiries, reviews
- SEO tools, redirects, cookie consent
- Admin dashboard UI

**Dependency Chain:**
```
bespoke-uk/cms (meta-package)
├── bespoke-uk/page
├── bespoke-uk/post
├── bespoke-uk/post-category
├── bespoke-uk/menu
├── bespoke-uk/menu-item
├── bespoke-uk/enquiry
├── bespoke-uk/review
└── bespoke-uk/social

bespoke-uk/default (meta-package)
├── bespoke-uk/seo
├── bespoke-uk/redirect
├── bespoke-uk/cookie
├── bespoke-uk/pwa
├── bespoke-uk/country
├── bespoke-uk/continent
├── bespoke-uk/cloudflare
└── bespoke-uk/referrer
```

---

### 3. CRM Project

For customer relationship management without CMS:

```json
{
    "name": "client/crm-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/core": "^10.0",
        "bespoke-uk/contact": "^10.0",
        "bespoke-uk/customer": "^10.0",
        "bespoke-uk/supplier": "^10.0",
        "bespoke-uk/address": "^10.0",
        "bespoke-uk/project": "^10.0",
        "bespoke-uk/task": "^10.0",
        "bespoke-uk/calendar": "^10.0",
        "bespoke-uk/calendar-event": "^10.0",
        "bespoke-uk/blade": "^10.0"
    }
}
```

**Provides:**
- Contact and customer management
- Supplier tracking
- Address management with geolocation
- Project and task tracking
- Calendar with event scheduling
- Full UI component library

**Key Relationships:**
```
Customer
├── Has Addresses (polymorphic)
├── Has Contacts (polymorphic)
├── Has Projects
├── Has Tasks
└── Has Calendar Events

Project
├── Belongs to Customer
├── Belongs to Contact
├── Has Tasks
└── Has Assignees (employees, ManyToMany)
```

---

### 4. Full Enterprise Project

For complete CMS + CRM installations:

```json
{
    "name": "client/enterprise-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/core": "^10.0",
        "bespoke-uk/cms": "^10.0",
        "bespoke-uk/default": "^10.0",
        "bespoke-uk/blade": "^10.0",
        "bespoke-uk/contact": "^10.0",
        "bespoke-uk/customer": "^10.0",
        "bespoke-uk/supplier": "^10.0",
        "bespoke-uk/address": "^10.0",
        "bespoke-uk/project": "^10.0",
        "bespoke-uk/task": "^10.0",
        "bespoke-uk/customer-package": "^10.0",
        "bespoke-uk/calendar": "^10.0",
        "bespoke-uk/calendar-event": "^10.0",
        "bespoke-uk/location": "^10.0"
    }
}
```

**Provides:** Everything from CMS + CRM configurations plus:
- Time tracking (customer packages)
- Google geolocation services
- Complete UI component library

---

### 5. API Integration Project

For projects integrating with external services:

```json
{
    "name": "client/integration-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/core": "^10.0",
        "bespoke-uk/contact": "^10.0",
        "bespoke-uk/customer": "^10.0",
        "bespoke-uk/harvest": "^10.0",
        "bespoke-uk/hubspot": "^10.0",
        "bespoke-uk/jira": "^10.0"
    }
}
```

**API Packages Available:**

| Package | Service | Auth Method | Key Features |
|---------|---------|-------------|--------------|
| `harvest` | Harvest + Forecast | API Token | 25+ resources, time tracking |
| `jira` | Atlassian Jira | Basic Auth | 35+ methods, JQL support |
| `magento` | Magento REST | API Token | 11 resources, product sync |
| `hubspot` | HubSpot CRM | API Token | Rate limiting, contact sync |
| `microsoft` | MS Graph | OAuth2 | Token refresh, calendar |
| `google-apis` | Google Services | OAuth2 | Gmail, Calendar, Drive |
| `openai` | OpenAI GPT | API Key | Content rewriting |
| `brevo` | Brevo/Sendinblue | API Key | Email marketing (WIP) |

---

### 6. Geographic/Location Project

For projects with geographic data requirements:

```json
{
    "name": "client/geographic-project",
    "require": {
        "php": "^8.2",
        "laravel/framework": "^11.0",
        "bespoke-uk/core": "^10.0",
        "bespoke-uk/default": "^10.0",
        "bespoke-uk/region": "^10.0",
        "bespoke-uk/county": "^10.0",
        "bespoke-uk/city": "^10.0",
        "bespoke-uk/location": "^10.0",
        "bespoke-uk/address": "^10.0"
    }
}
```

**Geographic Hierarchy:**
```
Continent
└── Country
    └── Region
        └── County
            └── City
                └── Address (polymorphic)
```

---

## Package Selection Guide

### By Feature Need

| Need | Packages |
|------|----------|
| User authentication | `auth`, `user` |
| Permissions/roles | `acl` |
| Content pages | `page` |
| Blog/news | `post`, `post-category` |
| Navigation | `menu`, `menu-item` |
| Contact forms | `enquiry` |
| Customer management | `customer`, `contact`, `address` |
| Project tracking | `project`, `task` |
| Time tracking | `customer-package` |
| Calendar/scheduling | `calendar`, `calendar-event` |
| File attachments | `document` |
| Image management | `image` |
| Notes/comments | `note` |
| SEO tools | `seo` |
| Admin dashboard | `blade-admin`, `dashboard` |

### By Complexity

| Complexity | Configuration |
|------------|---------------|
| **Simple** | `core` + `cms` |
| **Standard** | `core` + `cms` + `default` + `blade-admin` |
| **Advanced** | Above + CRM packages |
| **Enterprise** | All packages + API integrations |

---

## Configuration Tips

### 1. Always Publish Config Files

```bash
php artisan vendor:publish --tag="package-name-config"
```

### 2. Run Migrations in Order

Packages have interdependencies. Run migrations after all packages are installed:

```bash
php artisan migrate
```

### 3. Seed Geographic Data

For projects using location packages:

```bash
php artisan db:seed --class="Bespoke\\Country\\Database\\Seeders\\CountrySeeder"
php artisan db:seed --class="Bespoke\\Region\\Database\\Seeders\\RegionSeeder"
```

### 4. Configure Livewire Components

Livewire components are auto-registered via config. Customise in `config/{package}.php`:

```php
'livewire' => [
    'contact-data-table' => \App\Livewire\CustomContactDataTable::class,
],
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial documentation |
