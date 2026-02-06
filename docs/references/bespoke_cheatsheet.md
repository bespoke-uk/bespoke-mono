# Bespoke CMS Framework Cheat Sheet

Concise reference of the specific Laravel, Livewire v2, Alpine.js, and Tailwind CSS patterns used across the 108 packages. All examples are from real code in this monorepo.

**Frontend stack:** Livewire v2 (`^2.12`) + Alpine.js + Tailwind CSS v3
**Backend stack:** Laravel 10/11/12, PHP ^8.2, Orchestra Testbench

---

## Laravel Patterns

### API Routes (`routes/api.php`)

```php
// From crm/contact/routes/api.php
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
                Route::patch('{contact:uuid}', [ContactController::class, 'update'])
                    ->name('update')
                    ->middleware('ability:contact.update')
                    ->withTrashed();
            });
    });
```

**Key:** UUID route binding `{model:uuid}`, Sanctum `ability:` middleware, config-driven prefixes.

### Admin Routes (`routes/admin.php`)

```php
// From crm/contact/routes/admin.php
Route::prefix(config('module.admin.prefix', 'admin'))
    ->middleware(config('module.admin.middleware', ['web', 'auth']))
    ->as('admin.')
    ->group(function () {
        Route::as('contact.')
            ->prefix(config('contact.route_prefixes.admin', 'contacts'))
            ->group(function () {
                Route::post('{contact}/update', [ContactController::class, 'update'])
                    ->name('update')
                    ->middleware('can:contact.update');
            });
    });
```

**Key:** Gate `can:` middleware for admin, POST for updates (not PATCH).

### Model

```php
// From crm/contact/src/Models/Contact.php
class Contact extends AbstractModel implements ContactContract, Profileable
{
    use HasActivity, HasFactory, HasStatus, HasUUID, SoftDeletes;

    protected $fillable = [];  // Loaded from config
    protected $casts = [];     // Loaded from config

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->useLogName('contact')
            ->logOnlyDirty()
            ->logOnly(config('contact.loggable'));
    }
}
```

**Key:** Extend `AbstractModel`, implement contracts, config-driven `$fillable`/`$casts`, `HasUUID` for API routing.

### API Controller

```php
// From crm/contact/src/Http/Controllers/Api/ContactController.php
class ContactController extends AbstractController implements ContactControllerContract
{
    public function index(): ContactCollectionContract
    {
        $contacts = app(Contact::class)::query()->active()->paginate();
        return app(ContactCollectionContract::class, ['resource' => $contacts]);
    }

    public function store(StoreContactContract $request): JsonResponse
    {
        $validated = $request->validated('data.attributes');
        $contact = app(Contact::class);
        $contact->fill($validated);
        $contact->save();

        return app(ContactResourceContract::class, ['resource' => $contact])
            ->response()
            ->header('Location', route('admin.contact.show', $contact));
    }
}
```

**Key:** Resolve via `app()` with contracts, never concrete classes. Location header on create.

### API Resource (JSON:API format)

```php
// From crm/contact/src/Http/Resources/ContactResource.php
class ContactResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => (string) $this->uuid,
            'type' => 'contact',
            'attributes' => [
                'first_name' => $this->first_name,
                'email' => $this->email,
                'status' => $this->status?->value,
                'created_at' => $this->created_at,
            ],
        ];
    }
}
```

**Key:** UUID as string ID, JSON:API structure `{id, type, attributes}`, enum `->value`.

### API Form Request

```php
// From crm/contact/src/Http/Requests/Api/StoreContact.php
class StoreContact extends FormRequest
{
    public function rules(): array
    {
        return [
            'data' => 'required|array',
            'data.type' => 'required|in:contact',
            'data.attributes' => 'required|array',
            'data.attributes.first_name' => 'required|string|max:100',
            'data.attributes.email' => [
                'required', 'string', 'max:100',
                Rule::unique('contacts', 'email')->whereNull('deleted_at'),
            ],
        ];
    }
}
```

**Key:** JSON:API nested validation, soft-delete-aware uniqueness rules.

### Migration

```php
// From crm/contact/database/migrations/create_contacts_table.php.stub
Schema::create('contacts', function (Blueprint $table) {
    $table->bigIncrements('id');
    $table->uuid()->index();
    $table->string('first_name')->nullable();
    $table->string('email')->nullable();
    $table->string('status')->default(config('contact.defaults.status'))->index();

    // Standard audit fields (all packages use this pattern)
    $table->timestamp('created_at')->nullable()->index();
    $table->unsignedBigInteger('created_by')->nullable()->index();
    $table->timestamp('updated_at')->nullable()->index();
    $table->unsignedBigInteger('updated_by')->nullable()->index();
    $table->timestamp('deleted_at')->nullable()->index();
    $table->unsignedBigInteger('deleted_by')->nullable()->index();
});
```

**Key:** UUID + auto-increment, config-driven defaults, 6 audit fields (`created/updated/deleted` at/by).

### Event

```php
// From crm/contact/src/Events/ContactCreated.php
class ContactCreated
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public Contact $contact;
    public ?Authenticatable $user;

    public function __construct(Contact $contact)
    {
        $this->contact = $contact;
        $this->user = Auth::user() ?? null;
    }
}
```

**Key:** Store entity + current user, three standard traits, public properties.

### Import

```php
// From crm/contact/src/Imports/ContactImport.php
class ContactImport extends AbstractImport implements
    ContactImportContract, ToCollection, WithHeadingRow
{
    public function collection(Collection $rows): void
    {
        foreach ($rows as $row) {
            $contact = app(Contact::class)->firstOrCreate([
                'email' => $this->formatEmail($row['email']),
            ]);
            $contact->timestamps = false;
            $contact->imported_at = $this->formatImportedAt();
            $contact->save();
        }
    }
}
```

**Key:** Extend `AbstractImport`, formatting helpers from base class, manual timestamps.

### Export

```php
// From crm/contact/src/Exports/ContactExport.php
class ContactExport extends AbstractExport implements
    ContactExportContract, FromView, WithStyles
{
    protected Collection $rows;

    public function __construct(Collection $rows)
    {
        $this->rows = $rows;
    }

    public function view(): View
    {
        return view('contact::exports.contacts', ['rows' => $this->rows]);
    }

    public function styles(Worksheet $sheet): array
    {
        return [1 => ['font' => ['bold' => true]]];
    }
}
```

**Key:** Extend `AbstractExport`, blade view for content, bold header row.

---

## Livewire v2 Patterns

### Component Class

```php
// From crm/contact/src/Livewire/Admin/ContactModal.php
class ContactModal extends Component implements ModalInterface, StateInterface
{
    use WithModal, WithState;

    protected $listeners = [
        'refresh' => '$refresh',
        'createContact' => 'create',
        'editContact' => 'edit',
    ];

    public Contact $contact;

    public function mount(): void
    {
        $this->contact = $this->makeNewContact();
    }

    public function getRules(): array
    {
        return [
            'contact.first_name' => ['required', 'max:'.config('contact.rules.first_name.max')],
            'contact.email' => ['required', 'string', 'email:rfc,dns'],
        ];
    }

    public function save(): void
    {
        $validated = $this->validate();
        $this->contact->fill($validated['contact']);
        $this->contact->save();
        $this->emit($this->handler, $this->contact);
        $this->hideModal();
    }

    public function render(): View|Factory|Application
    {
        return view('contact::admin.livewire.modal');
    }
}
```

**Key:** `$listeners` array, `mount()` init, `getRules()` for dynamic validation, `emit()` for communication, `$refresh` shorthand.

### Livewire Blade Directives

```blade
{{-- Button with wire:click --}}
<x-button.default
    wire:key="edit-contact-{{ $this->contact->id }}"
    wire:click.prevent="edit({{ $this->contact->id }})"
>
    <x-icon name="pencil"/>
</x-button.default>

{{-- Debounced search input --}}
<x-autocomplete.input
    wire:model.debounce.500ms="query"
    wire:keydown.escape.prevent="resetQuery"
    wire:keydown.arrow-down.prevent="incrementHighlighted"
    wire:keydown.enter.prevent="resultSelected"
/>
```

**Key:** `wire:key` for dynamic lists, `wire:model.debounce`, keyboard modifiers, `.prevent`.

---

## Alpine.js Patterns

### Toggle State (`x-data` + `x-show`)

```blade
{{-- From blade/blade-accordion --}}
<button
    x-on:click="expanded = ! expanded"
    :aria-expanded="expanded"
    :class="{ 'border-b border-gray-200': expanded }"
>
    {{ $slot }}
    <span x-show="expanded"><x-icon name="minus"/></span>
    <span x-show="! expanded"><x-icon name="plus"/></span>
</button>
```

### Livewire Bridge (`@entangle`)

```blade
{{-- From blade/blade-modal --}}
<div
    x-data="{
        show: @entangle($attributes->wire('model')),
        close() {
            window.Livewire && window.Livewire.emit('modal:closed');
            this.show = false;
        }
    }"
    x-on:keydown.escape.window="close()"
    x-show="show"
    x-trap="show"
    x-transition:enter="ease-out duration-300"
    x-transition:enter-start="opacity-0"
    x-transition:enter-end="opacity-100"
>
```

**Key:** `@entangle()` for two-way Livewire binding, `x-trap` for focus lock, `x-transition` for animations.

### External Library Init (`x-ref`)

```blade
{{-- From blade/blade-form date picker --}}
<div
    x-data="{
        value: @entangle($attributes->wire('model')),
        init() {
            new window.Pikaday({
                field: this.$refs.date,
                format: 'DD/MM/YYYY',
            });
        }
    }"
    x-on:change="value = $event.target.value"
>
    <input x-ref="date" x-bind:value="value" type="text" readonly />
</div>
```

**Key:** `x-ref` for DOM access, `init()` for setup, `$event` for native events.

---

## Tailwind CSS Patterns

### Button Variants (colour + dark mode)

```blade
{{-- From blade/blade-button --}}
<x-button {{ $attributes->class([
    'border-transparent text-white bg-green-600',
    'hover:bg-green-700 focus:ring-green-500',
    'dark:text-gray-300 dark:bg-green-800 dark:hover:text-gray-200',
]) }}>
    {{ $slot }}
</x-button>
```

### Conditional Error Styling

```blade
{{-- From blade/blade-form --}}
{{ $attributes->class([
    'appearance-none block w-full border rounded-sm shadow-sm text-sm px-3 py-2',
    'focus:outline-none focus:ring-2 focus:ring-offset-2',
    $errors->has($name)
        ? 'border-red-300 focus:ring-red-500 text-red-900'
        : 'border-gray-300 focus:ring-primary-500 dark:bg-gray-800',
]) }}
```

### Size Variants (conditional classes)

```blade
{{-- From blade/blade-modal --}}
{{ $attributes->class([
    'inline-block align-middle rounded-sm text-left shadow-xl',
    'bg-white dark:bg-gray-900 dark:shadow-gray-800',
    'max-w-lg' => ! $attributes->has('size'),
    'max-w-3xl' => $attributes->get('size') === 'medium',
    'max-w-6xl' => $attributes->get('size') === 'large',
    'max-w-[90%]' => $attributes->get('size') === 'full',
]) }}
```

**Key:** `$attributes->class()` for merging, ternary for error states, key-value pairs for conditional classes, `dark:` variants throughout.

---

## Quick Reference

| Pattern | Convention |
|---------|------------|
| API route binding | `{model:uuid}` |
| API middleware | `ability:package.action` (Sanctum) |
| Admin middleware | `can:package.action` (Gates) |
| API response format | JSON:API `{id, type, attributes}` |
| Dependency resolution | `app(ContractClass::class)` — never concrete |
| Config access | `config('package.section.key')` |
| Migration audit fields | `created_at/by`, `updated_at/by`, `deleted_at/by` |
| Livewire communication | `$this->emit('eventName', $data)` (v2) |
| Livewire model binding | `wire:model.defer` (v2), `wire:model.debounce.500ms` |
| Alpine-Livewire bridge | `@entangle($attributes->wire('model'))` |
| Blade class merging | `$attributes->class([...])` |
| Dark mode | `dark:` prefix on all colour utilities |
