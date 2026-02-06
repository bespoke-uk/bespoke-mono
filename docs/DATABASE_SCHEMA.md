# Database Schema Overview

This document provides a comprehensive overview of all database tables across the Bespoke CMS monorepo, including relationships, foreign keys, and polymorphic targets.

**Related Documentation:**
- [CLAUDE.md](CLAUDE.md) - Quick reference
- [PACKAGE_STANDARDS.md](PACKAGE_STANDARDS.md) - Architecture standards
- [MONOREPO_ANALYSIS.md](MONOREPO_ANALYSIS.md) - Complete package analysis

---

## Schema Patterns

### Audit Fields Macro

Most tables use the `auditFields()` migration macro which adds:

```php
$table->timestamp('created_at')->nullable();
$table->unsignedBigInteger('created_by')->nullable();
$table->timestamp('updated_at')->nullable();
$table->unsignedBigInteger('updated_by')->nullable();
$table->timestamp('archived_at')->nullable();
$table->unsignedBigInteger('archived_by')->nullable();
$table->softDeletes(); // deleted_at
$table->unsignedBigInteger('deleted_by')->nullable();
```

### SEO Fields Macro

Content tables use `seoFields()` macro:

```php
$table->string('meta_title')->nullable();
$table->text('meta_description')->nullable();
$table->string('meta_canonical')->nullable();
$table->boolean('meta_index')->default(true);
```

### UUID Pattern

All tables include a `uuid` column for external/API references:

```php
$table->uuid('uuid')->unique()->index();
```

---

## Tables by Package

### CMS Packages

#### pages (`cms/page`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| reference | string | Nullable |
| name | string | |
| key | string | |
| slug | string | |
| content | longText | |
| is_home_page | tinyint | Default 0 |
| view_count | int | Default 0 |
| meta_* | various | SEO fields |
| *_at, *_by | various | Audit fields |

**Relationships:** None (standalone)

---

#### posts (`cms/post`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| user_id | bigint | FK → users (nullable) |
| date | date | |
| reference | string | |
| name | string | |
| key | string | |
| slug | string | |
| content | longText | |
| view_count | int | Default 0 |
| meta_* | various | SEO fields |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `user_id` → `users` (cascade update, cascade delete)

**Relationships:**
- BelongsToMany `post_categories` via `post_category_pivot`

---

#### post_categories (`cms/post-category`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| name | string | |
| key | string | |
| slug | string | |
| *_at, *_by | various | Audit fields |

---

#### post_category_pivot (`cms/post-category`)

| Column | Type | Notes |
|--------|------|-------|
| post_id | bigint | FK → posts |
| post_category_id | bigint | FK → post_categories |

**Primary Key:** (post_id, post_category_id)

---

#### menus (`cms/menu`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| reference | string | |
| name | string | |
| key | string | |
| status | string | |
| *_at, *_by | various | Audit fields |

**Relationships:**
- HasMany `menu_items`

---

#### menu_items (`cms/menu-item`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| menu_id | bigint | FK → menus |
| parent_id | bigint | FK → menu_items (self-referential) |
| entity_type | string | Polymorphic type |
| entity_id | bigint | Polymorphic ID |
| reference | string | |
| name | string | |
| key | string | |
| url | string | |
| class | string | CSS classes |
| type | string | |
| target | string | _self, _blank |
| sort_order | int | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `menu_id` → `menus` (cascade update, cascade delete)
- `parent_id` → `menu_items` (nullable, self-referential)

**Polymorphic:** `entity_type` + `entity_id` can reference Page, Post, or custom entities

---

#### enquiries (`cms/enquiry`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| user_id | bigint | FK → users (nullable) |
| reference | string | |
| name | string | |
| email | string | |
| phone_prefix | string | |
| phone | string | |
| website | string | |
| content | text | |
| source | string | |
| source_other | string | |
| status | string | |
| meta_* | various | SEO fields |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `user_id` → `users` (cascade update, null on delete)

---

#### reviews (`cms/review`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| user_id | bigint | FK → users (nullable) |
| name | string | |
| email | string | |
| phone_prefix | string | |
| phone | string | |
| summary | text | |
| content | text | |
| date | date | |
| rating | tinyint | 0-5 |
| recommend | tinyint | Boolean |
| status | string | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `user_id` → `users` (cascade update, null on delete)

---

### CRM Packages

#### customers (`crm/customer`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| parent_id | bigint | FK → customers (self-referential) |
| address_id | int | Indexed |
| contact_id | int | Indexed |
| name | string | |
| trading_name | string | |
| reference | string | |
| avatar | string | |
| email | string | |
| phone_prefix | string | |
| phone | string | |
| mobile_prefix | string | |
| mobile | string | |
| website | string | |
| facebook | string | Social links |
| twitter | string | |
| instagram | string | |
| youtube | string | |
| linkedin | string | |
| tiktok | string | |
| pinterest | string | |
| company_number | string | |
| vat_number | string | |
| source | string | |
| special_instructions | text | |
| status | string | |
| type | string | Prospect/Business/Individual/Internal |
| color | string | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `parent_id` → `customers` (nullable, self-referential)

**Relationships:**
- HasMany `addresses` (polymorphic)
- HasMany `contacts` (polymorphic)
- HasMany `projects`
- HasMany `tasks`
- HasMany `customer_packages`
- HasMany `calendar_events`

---

#### contacts (`crm/contact`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| contactable_type | string | Polymorphic type |
| contactable_id | bigint | Polymorphic ID |
| first_name | string | |
| last_name | string | |
| avatar | string | |
| email | string | |
| phone_prefix | string | |
| phone | string | |
| mobile_prefix | string | |
| mobile | string | |
| accepted_terms | tinyint | Boolean |
| marketing_emails | tinyint | Boolean |
| marketing_sms | tinyint | Boolean |
| notification_emails | tinyint | Boolean |
| notification_sms | tinyint | Boolean |
| status | string | Indexed |
| *_at, *_by | various | Audit fields |

**Polymorphic:** `contactable_type` + `contactable_id` references Customer, Employee, Supplier, etc.

---

#### addresses (`crm/address`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| addressable_type | string | Polymorphic type |
| addressable_id | bigint | Polymorphic ID |
| country_id | bigint | FK → countries |
| name | string | |
| line_1 | string | |
| line_2 | string | |
| line_3 | string | |
| city | string | |
| county | string | |
| postcode | string | |
| longitude | decimal | Geolocation |
| latitude | decimal | Geolocation |
| type | enum | Billing, Office |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `country_id` → `countries` (cascade update, cascade delete)

**Polymorphic:** `addressable_type` + `addressable_id` references Customer, Employee, Supplier, etc.

---

#### projects (`crm/project`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| customer_id | bigint | FK → customers (nullable) |
| contact_id | bigint | FK → contacts (nullable) |
| name | string | |
| key | string | |
| number | string | |
| reference | string | |
| content | longText | |
| start_at | date | |
| end_at | date | |
| status | enum | DRAFT, TO_DO, IN_PROGRESS, ON_HOLD, AWAITING_REVIEW, COMPLETE |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `customer_id` → `customers` (cascade update, null on delete)
- `contact_id` → `contacts` (cascade update, null on delete)

**Relationships:**
- BelongsToMany `employees` via `project_employee_pivot`
- HasMany `tasks`
- HasMany `calendar_events`

---

#### project_employee_pivot (`crm/project`)

| Column | Type | Notes |
|--------|------|-------|
| project_id | bigint | FK → projects |
| employee_id | bigint | FK → employees |

**Primary Key:** (project_id, employee_id)

---

#### tasks (`crm/task`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| customer_id | bigint | FK → customers (nullable) |
| contact_id | bigint | FK → contacts (nullable) |
| assignee_id | bigint | FK → employees (nullable) |
| project_id | bigint | FK → projects (nullable) |
| number | string | |
| reference | string | |
| name | string | |
| content | text | |
| date | date | |
| duration | bigint | In seconds |
| status | enum | DRAFT, TO_DO, IN_PROGRESS, ON_HOLD, AWAITING_REVIEW, COMPLETE |
| notified_at | datetime | |
| first_reminder | datetime | |
| second_reminder | datetime | |
| final_reminder | datetime | |
| completed_at | datetime | |
| completed_by | bigint | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `customer_id` → `customers` (cascade update, null on delete)
- `contact_id` → `contacts` (cascade update, null on delete)
- `assignee_id` → `employees` (cascade update, null on delete)
- `project_id` → `projects` (cascade update, null on delete)

---

#### customer_packages (`crm/customer-package`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| customer_id | bigint | FK → customers (nullable) |
| name | string | |
| key | string | |
| number | string | |
| reference | string | |
| start_at | date | |
| end_at | date | |
| hourly_rate | int | |
| budget | int | |
| used | int | |
| remaining | int | |
| price | int | |
| spent | int | |
| balance | int | |
| category | enum | AD_HOC, FIXED_FEE, RETAINER |
| type | enum | BILLABLE, NON_BILLABLE |
| status | string | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `customer_id` → `customers` (cascade update, null on delete)

---

#### customer_package_times (`crm/customer-package`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| customer_id | bigint | FK → customers (nullable) |
| customer_package_id | bigint | FK → customer_packages (nullable) |
| project_id | bigint | FK → projects (nullable) |
| task_id | bigint | FK → tasks (nullable) |
| employee_id | bigint | FK → employees (nullable) |
| duration | int | In seconds |
| start_at | datetime | |
| end_at | datetime | |
| is_running | tinyint | Boolean |
| content | longText | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:** All cascade update, null on delete

---

#### calendars (`crm/calendar`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| name | string | |
| key | string | |
| slug | string | |
| *_at, *_by | various | Audit fields |

---

#### calendar_events (`crm/calendar-event`)

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| calendar_id | bigint | FK → calendars (nullable) |
| eventable_type | string | Polymorphic type |
| eventable_id | bigint | Polymorphic ID |
| name | string | |
| key | string | |
| content | text | |
| start_at | datetime | |
| end_at | datetime | |
| time_slot | enum | ALL_DAY, AM, PM, CUSTOM |
| type | enum | DEVELOPMENT, MEETING, HOLIDAY, SICKNESS |
| status | enum | |
| color | string | |
| notification_emails | tinyint | Boolean |
| notification_sms | tinyint | Boolean |
| first_reminder | datetime | |
| second_reminder | datetime | |
| final_reminder | datetime | |
| *_at, *_by | various | Audit fields |

**Foreign Keys:**
- `calendar_id` → `calendars` (cascade update, null on delete)

**Polymorphic:** `eventable_type` + `eventable_id` references Task, Project, Customer, etc.

---

#### calendar_event_employee_pivot (`crm/calendar-event`)

| Column | Type | Notes |
|--------|------|-------|
| calendar_event_id | bigint | FK → calendar_events |
| employee_id | bigint | FK → employees |

**Primary Key:** (calendar_event_id, employee_id)

---

### Geographic Packages

#### Geographic Hierarchy

```
continents
    └── countries (FK: continent_id)
        └── regions (FK: country_id)
            └── counties (FK: region_id)
                └── cities (FK: county_id)
```

All geographic tables share common structure:

| Column | Type | Notes |
|--------|------|-------|
| id | bigint | Primary key |
| uuid | uuid | Unique, indexed |
| {parent}_id | bigint | FK to parent table |
| reference | string | |
| name | string | |
| key | string | |
| slug | string | |
| code | string | (continents/countries only) |
| content | longText | |
| longitude | decimal | Geolocation |
| latitude | decimal | Geolocation |
| status | enum | |
| meta_* | various | SEO fields |
| *_at, *_by | various | Audit fields |

---

## Foreign Key Summary

| From Table | Column | To Table | On Update | On Delete |
|------------|--------|----------|-----------|-----------|
| posts | user_id | users | CASCADE | CASCADE |
| enquiries | user_id | users | CASCADE | SET NULL |
| reviews | user_id | users | CASCADE | SET NULL |
| customers | parent_id | customers | CASCADE | SET NULL |
| menu_items | menu_id | menus | CASCADE | CASCADE |
| menu_items | parent_id | menu_items | CASCADE | SET NULL |
| tasks | customer_id | customers | CASCADE | SET NULL |
| tasks | contact_id | contacts | CASCADE | SET NULL |
| tasks | assignee_id | employees | CASCADE | SET NULL |
| tasks | project_id | projects | CASCADE | SET NULL |
| projects | customer_id | customers | CASCADE | SET NULL |
| projects | contact_id | contacts | CASCADE | SET NULL |
| customer_packages | customer_id | customers | CASCADE | SET NULL |
| calendar_events | calendar_id | calendars | CASCADE | SET NULL |
| addresses | country_id | countries | CASCADE | CASCADE |
| regions | country_id | countries | CASCADE | CASCADE |
| counties | region_id | regions | CASCADE | CASCADE |
| cities | county_id | counties | CASCADE | CASCADE |
| case_studies | user_id | users | CASCADE | CASCADE |

---

## Polymorphic Relationships

### contacts.contactable

**Targets:** Customer, Employee, Supplier, or any model with `HasContacts` trait

```php
// Usage
$customer->contacts; // MorphMany Contact
$contact->contactable; // MorphTo Customer/Employee/Supplier
```

### addresses.addressable

**Targets:** Customer, Employee, Supplier, or any model with `HasAddresses` trait

```php
// Usage
$customer->addresses; // MorphMany Address
$address->addressable; // MorphTo Customer/Employee/Supplier
```

### menu_items.entity

**Targets:** Page, Post, or any configured entity

```php
// Usage
$menuItem->entity; // MorphTo Page/Post
```

### calendar_events.eventable

**Targets:** Task, Project, Customer, or any eventable model

```php
// Usage
$calendarEvent->eventable; // MorphTo Task/Project/Customer
```

---

## Pivot Tables Summary

| Table | Links | Primary Key |
|-------|-------|-------------|
| `post_category_pivot` | posts ↔ post_categories | (post_id, post_category_id) |
| `project_employee_pivot` | projects ↔ employees | (project_id, employee_id) |
| `calendar_event_employee_pivot` | calendar_events ↔ employees | (calendar_event_id, employee_id) |
| `case_study_category_pivot` | case_studies ↔ case_study_categories | (case_study_id, case_study_category_id) |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial documentation |
