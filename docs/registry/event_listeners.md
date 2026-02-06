# Event/Listener Ecosystem

This document maps cross-package event communication in the Bespoke CMS monorepo, showing which packages fire events, which listen, and how they interact.

**Related Documentation:**
- [CLAUDE.md](../../CLAUDE.md) - Quick reference
- [package_standards.md](../standards/package_standards.md) - Architecture standards
- [monorepo_analysis.md](monorepo_analysis.md) - Complete package analysis

---

## Overview

| Metric | Count |
|--------|-------|
| Total Event Classes | 88 |
| Total Listener Classes | 31 |
| Packages with Events | 19 |
| Packages with Listeners | 10 |

---

## Event Registration Pattern

All packages use config-based event registration in `config/{package-name}.php`:

```php
'listeners' => [
    \Bespoke\Package\Events\ModelCreated::class => [
        \Bespoke\Package\Listeners\RecordActivity::class,
        \Bespoke\Package\Listeners\SendNotification::class,
    ],
],
```

The `PackageServiceProvider` from `bespoke-uk/package-tools` automatically wires these mappings.

---

## Events by Package

### Core Packages

#### auth (6 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `LoggedIn` | Successful login | `StoreLoginDetails`, `user::SetAsOnline` |
| `LoggedOut` | User logout | `StoreLogoutDetails`, `user::SetAsOffline` |
| `Registered` | New user registration | `user::SendNewUserEmail`, `user::SendWelcomeEmail` |
| `UnauthorisedIp` | Login from blocked IP | (logging only) |
| `PasswordExpired` | Password age exceeded | (logging only) |
| `UnknownUser` | Login attempt for non-existent user | (logging only) |

#### user (4 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `UserCreated` | New user created | `UpdatePermissions` |
| `UserUpdated` | User modified | `UpdateRoles`, `UpdatePermissions` |
| `UserOnline` | User becomes active | (status tracking) |
| `UserOffline` | User becomes inactive | (status tracking) |

#### acl (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `RoleCreated` | New role created | `ClearCache` |
| `RoleUpdated` | Role modified | `ClearCache` |
| `RoleDeleted` | Role removed | `ClearCache` |

#### two-factor (10 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `TwoFactorEnabled` | 2FA activated | (logging) |
| `TwoFactorDisabled` | 2FA deactivated | (logging) |
| `TwoFactorChallenged` | 2FA prompt shown | (logging) |
| `OneTimeCodeSuccess` | Valid OTP entered | (logging) |
| `OneTimeCodeFailed` | Invalid OTP entered | (logging) |
| `RecoveryCodesGenerated` | Backup codes created | (logging) |
| `RecoveryCodeSuccess` | Valid recovery code | (logging) |
| `RecoveryCodeFailed` | Invalid recovery code | (logging) |
| `RecoveryCodeReplaced` | Recovery code regenerated | (logging) |

#### employee (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `EmployeeCreated` | New employee | `AutoUpdateAssignee` |
| `EmployeeUpdated` | Employee modified | `AutoUpdateAssignee` |
| `EmployeeDeleted` | Employee removed | (cleanup) |

#### profile (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ProfileCreated` | New profile | (logging) |
| `ProfileUpdated` | Profile modified | (logging) |
| `ProfileDeleted` | Profile removed | (logging) |

#### document (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `DocumentCreated` | File uploaded | `RecordActivity` |
| `DocumentUpdated` | File modified | `RecordActivity` |
| `DocumentDeleted` | File removed | `RecordActivity` |

#### image (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ImageCreated` | Image uploaded | `RecordActivity` |
| `ImageUpdated` | Image modified | `RecordActivity` |
| `ImageDeleted` | Image removed | `RecordActivity` |

#### note (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `NoteCreated` | Note added | `RecordActivity` |
| `NoteUpdated` | Note modified | `RecordActivity` |
| `NoteDeleted` | Note removed | `RecordActivity` |

#### editor (1 event)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ContentUpdated` | WYSIWYG content saved | `ProcessExternalImages` |

#### setting (1 event)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `SettingUpdated` | Setting changed | `ClearSystemCache` |

---

### CMS Packages

#### page (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `PageCreated` | New page | (logging) |
| `PageUpdated` | Page modified | (logging) |
| `PageDeleted` | Page removed | (logging) |

#### post (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `PostCreated` | New post | `SetPostUser` |
| `PostUpdated` | Post modified | `menu::ClearMenuCache` |
| `PostDeleted` | Post removed | `menu::ClearMenuCache` |

#### post-category (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `PostCategoryCreated` | New category | (logging) |
| `PostCategoryUpdated` | Category modified | (logging) |
| `PostCategoryDeleted` | Category removed | (logging) |

#### menu (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `MenuCreated` | New menu | (logging) |
| `MenuUpdated` | Menu modified | `ClearMenuCache` |
| `MenuDeleted` | Menu removed | `ClearMenuCache` |

#### menu-item (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `MenuItemCreated` | Item added | (logging) |
| `MenuItemUpdated` | Item modified | (logging) |
| `MenuItemDeleted` | Item removed | (logging) |

#### enquiry (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `EnquiryCreated` | Form submitted | (logging) |
| `EnquiryUpdated` | Enquiry modified | (logging) |
| `EnquiryDeleted` | Enquiry removed | (logging) |

#### review (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ReviewCreated` | New review | (logging) |
| `ReviewUpdated` | Review modified | (logging) |
| `ReviewDeleted` | Review removed | (logging) |

---

### CRM Packages

#### contact (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ContactCreated` | New contact | (logging) |
| `ContactUpdated` | Contact modified | `SyncWithUser` |
| `ContactDeleted` | Contact removed | (logging) |

#### customer (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `CustomerCreated` | New customer | (logging) |
| `CustomerUpdated` | Customer modified | `SyncStatusWithContacts` |
| `CustomerDeleted` | Customer removed | `DeleteCustomerContacts` |

#### supplier (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `SupplierCreated` | New supplier | (logging) |
| `SupplierUpdated` | Supplier modified | `SyncStatusWithContacts` |
| `SupplierDeleted` | Supplier removed | `DeleteSupplierContacts` |

#### project (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `ProjectCreated` | New project | (logging) |
| `ProjectUpdated` | Project modified | (logging) |
| `ProjectDeleted` | Project removed | (logging) |

#### task (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `TaskCreated` | New task | (logging) |
| `TaskUpdated` | Task modified | `UpdateCompletedAt` |
| `TaskDeleted` | Task removed | (logging) |

#### calendar-event (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `CalendarEventCreated` | Event scheduled | `SendNewCalendarEventEmail` |
| `CalendarEventUpdated` | Event modified | `SendUpdatedCalendarEventEmail` |
| `CalendarEventDeleted` | Event cancelled | `SendDeletedCalendarEventEmail` |

#### address (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `AddressCreated` | Address added | (logging) |
| `AddressUpdated` | Address modified | (logging) |
| `AddressDeleted` | Address removed | (logging) |

#### customer-package (3 events)

| Event | Trigger | Listeners |
|-------|---------|-----------|
| `CustomerPackageCreated` | Package added | (logging) |
| `CustomerPackageUpdated` | Package modified | (logging) |
| `CustomerPackageDeleted` | Package removed | (logging) |

#### Geographic Packages (region, county, city)

Each has 3 standard events: `Created`, `Updated`, `Deleted` - primarily for logging.

---

### Default Packages

#### continent, country, redirect

Each has 3 standard events: `Created`, `Updated`, `Deleted` - primarily for logging.

---

## Cross-Package Event Flows

### 1. Authentication Workflow

```
User logs in
    │
    ▼
auth::LoggedIn event fired
    │
    ├──► auth::StoreLoginDetails (record login)
    │
    └──► user::SetAsOnline (update user status)


User logs out
    │
    ▼
auth::LoggedOut event fired
    │
    ├──► auth::StoreLogoutDetails (record logout)
    │
    └──► user::SetAsOffline (update user status)


New registration
    │
    ▼
auth::Registered event fired
    │
    ├──► user::SendNewUserEmail (admin notification)
    │
    └──► user::SendWelcomeEmail (user welcome)
```

### 2. Cache Invalidation Pattern

```
Role changes
    │
    ▼
acl::Role{Created|Updated|Deleted}
    │
    └──► acl::ClearCache (invalidate permission cache)


Menu or content changes
    │
    ▼
menu::Menu{Updated|Deleted}
post::Post{Updated|Deleted}  ────► menu::ClearMenuCache
    │
    └──► Invalidates forever cache for navigation
```

### 3. Activity Logging Pattern

```
Document/Image/Note changes
    │
    ▼
{document|image|note}::{Model}{Created|Updated|Deleted}
    │
    └──► RecordActivity (Spatie activity-log integration)
```

### 4. Data Synchronisation Pattern

```
Customer status change
    │
    ▼
customer::CustomerUpdated
    │
    └──► customer::SyncStatusWithContacts
            │
            └──► Updates all related contact statuses


Customer deletion
    │
    ▼
customer::CustomerDeleted
    │
    └──► customer::DeleteCustomerContacts
            │
            └──► Removes orphaned contact records
```

### 5. Email Notification Pattern

```
Calendar event scheduled
    │
    ▼
calendar-event::CalendarEventCreated
    │
    └──► SendNewCalendarEventEmail
            │
            └──► Queued email to attendees (3 retries)
```

---

## Listener Queue Configuration

Most listeners implement `ShouldQueue` for async processing:

```php
class SendCalendarEventEmail implements ShouldQueue
{
    public $tries = 3;
    public $backoff = [10, 60, 300]; // 10s, 1m, 5m
}
```

**Queued Listeners:**
- All email notification listeners
- Authentication logging listeners
- Cross-package sync listeners
- Activity recording listeners

**Synchronous Listeners:**
- Cache clearing listeners
- Status update listeners

---

## Extending Events

### Adding Custom Listeners

In your application's `EventServiceProvider`:

```php
protected $listen = [
    \Bespoke\Contact\Events\ContactCreated::class => [
        \App\Listeners\SyncContactToHubspot::class,
        \App\Listeners\NotifyAccountManager::class,
    ],
];
```

### Creating Package Events

Follow the standard pattern:

```php
// src/Events/ModelCreated.php
namespace Bespoke\Package\Events;

use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ModelCreated
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public Model $model
    ) {}
}
```

---

## Packages Without Events

The following package categories do not emit events:
- **api/** - External API integrations
- **blade/** - UI components
- **custom/** - Client-specific (except case-study)
- **ecommerce/** - Product (scaffold only)

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial documentation |
