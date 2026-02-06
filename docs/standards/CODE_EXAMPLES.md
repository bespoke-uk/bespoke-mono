# Code Examples

> Extracted from [PACKAGE_STANDARDS.md](../PACKAGE_STANDARDS.md) — Section 7

**Reference Implementation:** `/crm/contact`

---

## 1. Admin Components

### Admin Controller with CRUD Methods

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

### Admin Form Request

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

### Admin Routes

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

## 2. API Components

### RESTful API Controller (Contract-Based)

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

### API Store Request (with Contract)

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

### API Update Request (with Contract)

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

### API Resource Transformer (with Contract)

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

### API Resource Collection (with Contract)

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

### API Routes

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

## 3. Actions

### CreateModel Action with Static Method Pattern

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

### Standalone CRUD Actions (Simpler Pattern)

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

## 4. Imports

### Import Class Extending AbstractImport

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

### Schema File Structure

```tsv
first_name	last_name	email	phone	mobile	status	created_at	updated_at
John	Doe	john.doe@example.com	07700900000	07700900001	active	2024-01-01 00:00:00	2024-01-01 00:00:00
Jane	Smith	jane.smith@example.com	07700900002	07700900003	active	2024-01-02 00:00:00	2024-01-02 00:00:00
```

**File:** `resources/schema/contacts.tsv`
**Format:** Tab-separated values (TSV)

## 5. Exports

### Export Class Extending AbstractExport

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

### Export View Template

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

## 6. Models

### Model Extending AbstractModel

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

### Relationship Traits

#### HasContact (BelongsTo Single Contact)

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

#### HasContacts (MorphMany Contacts)

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
