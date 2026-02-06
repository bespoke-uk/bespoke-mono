# Routes Overview

This document provides a comprehensive overview of all routes across the Bespoke CMS monorepo, including API endpoints, admin routes, and frontend routes.

**Related Documentation:**
- [CLAUDE.md](CLAUDE.md) - Quick reference
- [PACKAGE_STANDARDS.md](PACKAGE_STANDARDS.md) - Architecture standards
- [MONOREPO_ANALYSIS.md](MONOREPO_ANALYSIS.md) - Complete package analysis

---

## Overview

| Metric | Count |
|--------|-------|
| Total Route Files | 73 |
| API Endpoints | 30+ |
| Admin Sections | 20+ packages |
| Frontend Routes | 10+ packages |
| Auth Routes | 15+ |

---

## Route Configuration Pattern

All packages define route prefixes in `config/{package}.php`:

```php
'routes' => ['admin', 'api', 'frontend'],

'route_prefixes' => [
    'admin' => 'contacts',
    'api' => 'contacts',
    'frontend' => 'contacts',
],
```

Routes are loaded from `routes/{type}.php` during `PackageServiceProvider` boot.

---

## API Endpoints

All API routes use UUID-based resource binding: `{model:uuid}`

### CMS API

#### Pages (`/api/v1/pages`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/pages` | index | pages.index |
| POST | `/api/v1/pages` | store | pages.create |
| GET | `/api/v1/pages/{page:uuid}` | show | pages.read |
| PATCH | `/api/v1/pages/{page:uuid}` | update | pages.update |
| DELETE | `/api/v1/pages/{page:uuid}` | destroy | pages.delete |

#### Posts (`/api/v1/posts`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/posts` | index | posts.index |
| POST | `/api/v1/posts` | store | posts.create |
| GET | `/api/v1/posts/{post:uuid}` | show | posts.read |
| PATCH | `/api/v1/posts/{post:uuid}` | update | posts.update |
| DELETE | `/api/v1/posts/{post:uuid}` | destroy | posts.delete |

#### Post Categories (`/api/v1/post-categories`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/post-categories` | index | post-categories.index |
| POST | `/api/v1/post-categories` | store | post-categories.create |
| GET | `/api/v1/post-categories/{postCategory:uuid}` | show | post-categories.read |
| PATCH | `/api/v1/post-categories/{postCategory:uuid}` | update | post-categories.update |
| DELETE | `/api/v1/post-categories/{postCategory:uuid}` | destroy | post-categories.delete |

### Core API

#### Users (`/api/v1/users`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/users` | index | users.index |
| POST | `/api/v1/users` | store | users.create |
| GET | `/api/v1/users/{user:uuid}` | show | users.read |
| PATCH | `/api/v1/users/{user:uuid}` | update | users.update |
| DELETE | `/api/v1/users/{user:uuid}` | destroy | users.delete |

**Note:** User routes include `->withTrashed()` for soft-deleted records.

#### Employees (`/api/v1/employees`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/employees` | index | employees.index |
| POST | `/api/v1/employees` | store | employees.create |
| GET | `/api/v1/employees/{employee:uuid}` | show | employees.read |
| PATCH | `/api/v1/employees/{employee:uuid}` | update | employees.update |
| DELETE | `/api/v1/employees/{employee:uuid}` | destroy | employees.delete |

### CRM API

#### Contacts (`/api/v1/contacts`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/contacts` | index | contacts.index |
| POST | `/api/v1/contacts` | store | contacts.create |
| GET | `/api/v1/contacts/{contact:uuid}` | show | contacts.read |
| PATCH | `/api/v1/contacts/{contact:uuid}` | update | contacts.update |
| DELETE | `/api/v1/contacts/{contact:uuid}` | destroy | contacts.delete |

#### Customers (`/api/v1/customers`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/customers` | index | customers.index |
| POST | `/api/v1/customers` | store | customers.create |
| GET | `/api/v1/customers/{customer:uuid}` | show | customers.read |
| PATCH | `/api/v1/customers/{customer:uuid}` | update | customers.update |
| DELETE | `/api/v1/customers/{customer:uuid}` | destroy | customers.delete |

#### Suppliers (`/api/v1/suppliers`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/suppliers` | index | suppliers.index |
| POST | `/api/v1/suppliers` | store | suppliers.create |
| GET | `/api/v1/suppliers/{supplier:uuid}` | show | suppliers.read |
| PATCH | `/api/v1/suppliers/{supplier:uuid}` | update | suppliers.update |
| DELETE | `/api/v1/suppliers/{supplier:uuid}` | destroy | suppliers.delete |

#### Addresses (`/api/v1/addresses`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/addresses` | index | address.read |
| POST | `/api/v1/addresses` | store | address.create |
| GET | `/api/v1/addresses/{address:uuid}` | show | address.read |
| PATCH | `/api/v1/addresses/{address:uuid}` | update | address.update |
| DELETE | `/api/v1/addresses/{address:uuid}` | destroy | address.delete |

#### Projects (`/api/v1/projects`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/projects` | index | project.read |
| POST | `/api/v1/projects` | store | project.create |
| GET | `/api/v1/projects/{project:uuid}` | show | project.read |
| PATCH | `/api/v1/projects/{project:uuid}` | update | project.update |
| DELETE | `/api/v1/projects/{project:uuid}` | destroy | project.delete |

#### Tasks (`/api/v1/tasks`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/tasks` | index | task.read |
| POST | `/api/v1/tasks` | store | task.create |
| GET | `/api/v1/tasks/{task:uuid}` | show | task.read |
| PATCH | `/api/v1/tasks/{task:uuid}` | update | task.update |
| DELETE | `/api/v1/tasks/{task:uuid}` | destroy | task.delete |

#### Customer Packages (`/api/v1/customer-packages`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/customer-packages` | index | customer_package.read |
| POST | `/api/v1/customer-packages` | store | customer_package.create |
| GET | `/api/v1/customer-packages/{customer_package:uuid}` | show | customer_package.read |
| PATCH | `/api/v1/customer-packages/{customer_package:uuid}` | update | customer_package.update |
| DELETE | `/api/v1/customer-packages/{customer_package:uuid}` | destroy | customer_package.delete |

### CRM Geographic API

#### Regions (`/api/v1/regions`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/regions` | index | region.read |
| POST | `/api/v1/regions` | store | region.create |
| GET | `/api/v1/regions/{region:uuid}` | show | region.read |
| PATCH | `/api/v1/regions/{region:uuid}` | update | region.update |
| DELETE | `/api/v1/regions/{region:uuid}` | destroy | region.delete |

#### Counties (`/api/v1/counties`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/counties` | index | county.read |
| POST | `/api/v1/counties` | store | county.create |
| GET | `/api/v1/counties/{county:uuid}` | show | county.read |
| PATCH | `/api/v1/counties/{county:uuid}` | update | county.update |
| DELETE | `/api/v1/counties/{county:uuid}` | destroy | county.delete |

#### Cities (`/api/v1/cities`)

| Method | URI | Action | Permission |
|--------|-----|--------|------------|
| GET | `/api/v1/cities` | index | city.read |
| POST | `/api/v1/cities` | store | city.create |
| GET | `/api/v1/cities/{city:uuid}` | show | city.read |
| PATCH | `/api/v1/cities/{city:uuid}` | update | city.update |
| DELETE | `/api/v1/cities/{city:uuid}` | destroy | city.delete |

### API Authentication

| Method | URI | Action | Middleware |
|--------|-----|--------|------------|
| POST | `/api/v1/login` | login | api |
| DELETE | `/api/v1/logout` | logout | api, auth:sanctum |

---

## Admin Routes

### Standard CRUD Pattern

Most packages follow this pattern:

```php
Route::prefix('admin/{resource}')->middleware(['web', 'auth'])->group(function () {
    Route::get('/', 'index')->middleware('can:{resource}.index');
    Route::get('/create', 'create')->middleware('can:{resource}.create');
    Route::post('/store', 'store')->middleware('can:{resource}.create');
    Route::get('/{id}', 'show')->middleware('can:{resource}.read');
    Route::get('/{id}/edit', 'edit')->middleware('can:{resource}.update');
    Route::post('/{id}/update', 'update')->middleware('can:{resource}.update');
    Route::delete('/{id}/delete', 'destroy')->middleware('can:{resource}.delete');
});
```

### CMS Admin Routes

| Package | Prefix | Routes |
|---------|--------|--------|
| page | `/admin/pages` | Standard CRUD |
| post | `/admin/posts` | Standard CRUD |
| post-category | `/admin/post-categories` | Standard CRUD |
| menu | `/admin/menus` | Standard CRUD |
| menu-item | `/admin/menu-items` | Standard CRUD |
| enquiry | `/admin/enquiries` | Standard CRUD |
| review | `/admin/reviews` | Standard CRUD |

### Core Admin Routes

| Package | Prefix | Routes |
|---------|--------|--------|
| user | `/admin/users` | Standard CRUD |
| employee | `/admin/employees` | Standard CRUD |
| acl | `/admin/roles` | Standard CRUD |
| dashboard | `/admin/dashboard` | index |
| setting | `/admin/settings` | Multiple sections |

#### Settings Routes (Special)

```
GET  /admin/settings                      index
GET  /admin/settings/client               client settings
GET  /admin/settings/module               module settings
GET  /admin/settings/system               system settings
GET  /admin/settings/theme                theme settings
POST /admin/settings/clear-cache          clear application cache
POST /admin/settings/optimise-cache       optimise cache
```

**Middleware:** All settings routes require `password.confirm`.

#### Two-Factor Admin Routes

```
POST   /admin/two-factor/enable    enable 2FA
POST   /admin/two-factor/confirm   confirm 2FA setup
DELETE /admin/two-factor/disable   disable 2FA
```

**Middleware:** All 2FA routes require `password.confirm`.

#### Editor Routes

```
POST /admin/editor/ai/generate    AI text/image generation
POST /admin/editor/ai/store       save AI-generated image
POST /admin/editor/image/store    upload editor image
```

### CRM Admin Routes

| Package | Prefix | Routes |
|---------|--------|--------|
| contact | `/admin/contacts` | Standard CRUD + marketing, activity |
| customer | `/admin/customers` | Standard CRUD + addresses, contacts, images, documents, notes, marketing |
| supplier | `/admin/suppliers` | Standard CRUD + addresses, contacts |
| project | `/admin/projects` | Standard CRUD |
| task | `/admin/tasks` | Standard CRUD |
| calendar | `/admin/calendars` | Standard CRUD |
| calendar-event | `/admin/calendar-events` | Standard CRUD |
| address | `/admin/addresses` | Standard CRUD |
| region | `/admin/regions` | Standard CRUD |
| county | `/admin/counties` | Standard CRUD |
| city | `/admin/cities` | Standard CRUD |
| customer-package | `/admin/customer-packages` | Standard CRUD |

#### Customer Nested Routes

```
GET /admin/customers/{customer}/addresses    addresses tab
GET /admin/customers/{customer}/contacts     contacts tab
GET /admin/customers/{customer}/images       images tab
GET /admin/customers/{customer}/documents    documents tab
GET /admin/customers/{customer}/notes        notes tab
GET /admin/customers/{customer}/marketing    marketing section
```

### Default Admin Routes

| Package | Prefix | Routes |
|---------|--------|--------|
| continent | `/admin/continents` | Standard CRUD |
| country | `/admin/countries` | Standard CRUD |
| redirect | `/admin/redirects` | Standard CRUD |

---

## Authentication Routes

### Web Auth (Public)

```
GET/POST  /register                    User registration
GET/POST  /login                       User login
ANY       /logout                      User logout
GET/POST  /forgot-password             Password reset request
GET/POST  /reset-password/{token}      Password reset
GET/POST  /email/verification          Email verification
GET       /verify-email/{id}/{hash}    Email verification link
GET       /auth-link/{authToken}       Magic link authentication
GET/POST  /confirm-password            Password confirmation
```

### Two-Factor Auth (Guest)

```
GET/POST  /two-factor                  One-time code entry
GET/POST  /recovery-code               Recovery code entry
```

**Middleware:** `throttle:6,1` (rate limited)

---

## Frontend Routes

### CMS Frontend

#### Pages

```
GET /                                   Homepage (is_home_page = true)
GET /{slug}                            Page detail (fallback route)
```

**Middleware:** `cache.headers:public;max_age=60;etag`

#### Posts

```
GET /posts                             Post listing
GET /posts/{post:slug}                 Post detail
```

#### Post Categories

```
GET /post-categories                   Category listing
GET /post-categories/{postCategory:slug}  Category detail
```

### Forms & Interactions

#### Enquiry/Contact

```
GET  /{contact_prefix}                 Contact form page
POST /{contact_prefix}/store           Form submission
```

**Middleware:** `ProtectAgainstSpam` (honeypot protection)

#### Reviews

```
GET  /{review_prefix}                  Reviews listing
POST /{review_prefix}/store            Review submission
```

**Middleware:** `ProtectAgainstSpam` (honeypot protection)

### Utilities

#### Images

```
GET /{image_prefix}/{image:name}       Image with optional processing
```

**Query Parameters:**
- `preset` - Predefined size (thumb, small, medium, large)
- `w` - Width in pixels
- `h` - Height in pixels
- `q` - Quality (1-100)
- `mode` - Resize mode (crop, fit, stretch)

#### PWA

```
GET /manifest.json                     PWA manifest
GET /offline                           Offline fallback page
```

### Custom Frontend

#### Case Studies

```
GET /{case_study_prefix}                    Listing
GET /{case_study_prefix}/{caseStudy:slug}   Detail
```

#### Case Study Categories

```
GET /{category_prefix}                              Listing
GET /{category_prefix}/{caseStudyCategory:slug}     Detail
```

---

## Account Routes

User account area for authenticated users:

```
GET /account                           Account dashboard
GET /account/profile                   Profile view
GET /account/profile/edit              Edit form
POST /account/profile/update           Save changes
GET /account/notifications/{notification}  View notification
```

**Middleware:** `['web', 'auth']`

---

## Middleware Summary

### Standard Middleware Groups

| Context | Middleware |
|---------|------------|
| Admin | `['web', 'auth']` + `can:{action}` gates |
| API | `['api', 'auth:sanctum']` + `ability:{action}` |
| Frontend | `['web']` (public) |
| Account | `['web', 'auth']` |

### Special Middleware

| Middleware | Purpose | Used By |
|------------|---------|---------|
| `password.confirm` | Requires password re-entry | Settings, 2FA |
| `ProtectAgainstSpam` | Honeypot protection | Forms |
| `throttle:6,1` | Rate limiting | 2FA, email verification |
| `cache.headers` | HTTP caching | Frontend pages |
| `no_index` | Prevent search indexing | Auth routes |

---

## Route Model Binding

### UUID Binding

API routes use UUID binding for security:

```php
Route::get('/contacts/{contact:uuid}', 'show');
```

### Slug Binding

Frontend routes use slug binding for SEO:

```php
Route::get('/posts/{post:slug}', 'show');
```

### Soft Delete Binding

Some routes include trashed records:

```php
Route::get('/users/{user:uuid}', 'show')->withTrashed();
```

---

## Permission Model

### Admin Permissions (Laravel Gates)

```php
Route::get('/contacts', 'index')->middleware('can:contacts.index');
Route::post('/contacts/store', 'store')->middleware('can:contacts.create');
Route::get('/contacts/{id}', 'show')->middleware('can:contacts.read');
Route::post('/contacts/{id}/update', 'update')->middleware('can:contacts.update');
Route::delete('/contacts/{id}/delete', 'destroy')->middleware('can:contacts.delete');
```

### API Permissions (Sanctum Abilities)

```php
Route::get('/contacts', 'index')->middleware('ability:contacts.index');
Route::post('/contacts', 'store')->middleware('ability:contacts.create');
Route::get('/contacts/{contact:uuid}', 'show')->middleware('ability:contacts.read');
Route::patch('/contacts/{contact:uuid}', 'update')->middleware('ability:contacts.update');
Route::delete('/contacts/{contact:uuid}', 'destroy')->middleware('ability:contacts.delete');
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial documentation |
| 1.1 | 2026-02-06 | Added 7 CRM API endpoint sections: addresses, projects, tasks, customer-packages, regions, counties, cities |
