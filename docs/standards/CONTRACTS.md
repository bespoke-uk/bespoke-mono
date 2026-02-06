# Contract Requirements

> Extracted from [PACKAGE_STANDARDS.md](../PACKAGE_STANDARDS.md) — Section 4

**Reference Implementation:** `/crm/contact`

---

## 1. Comprehensive List of Required Contracts

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

## 2. Contract Examples

### 2.1 Model Contract (Marker Interface)

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

### 2.2 Admin Controller Contract

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

### 2.3 Admin Request Contract

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

### 2.4 Action Contract

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

### 2.5 Import Contract

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

### 2.6 Export Contract

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

### 2.7 Validation Rule Contract

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

## 3. Namespace Conventions

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
