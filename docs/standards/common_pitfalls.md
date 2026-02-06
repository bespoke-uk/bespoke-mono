# Common Pitfalls

> Extracted from [package_standards.md](package_standards.md) — Section 10

---

### 1 Empty `Interfaces/` Directory

**Problem:** Using old `Interfaces/` directory instead of `Contracts/`

```
src/
├── Interfaces/          ❌ WRONG - Old pattern
└── Contracts/           ✅ CORRECT - Current standard
```

**Solution:** Rename `Interfaces/` to `Contracts/` and update all namespaces.

### 2 Missing API Functionality Entirely (CRUD Packages Only)

**Problem:** Package only has Admin controllers, no API endpoints

**Missing:**
- `src/Http/Controllers/Api/`
- `src/Http/Requests/Api/`
- `src/Http/Resources/`
- `routes/api.php`

**Solution:** Implement full API stack following Section 6.2 examples.

### 3 No Export Functionality (CRUD Packages Only)

**Problem:** Package has imports but no exports

**Missing:**
- `src/Exports/ModelExport.php`
- `src/Contracts/ModelExport.php`
- `resources/views/exports/models.blade.php`
- Config key: `export.model`

**Solution:** Add export handler following Section 6.5 examples.

### 4 Missing Binding Methods in ServiceProvider

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

### 5 Incomplete Config File

**Problem:** Config file missing critical sections

**Commonly Missing:**
- `export` section
- `import.schema_file` key
- `controllers.api` nested key
- `requests.api` nested key
- `route_prefixes`
- `loggable`

**Solution:** Use complete config template from Section 5.1.

### 6 No Contracts for Implementations

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

### 7 Using Old Spatie PackageServiceProvider

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

### 8 Mixing Admin and API in Same Directory

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

### 9 Not Implementing Declared Contracts

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

### 10 Missing api.php Route File (CRUD Packages Only)

**Problem:** Only `routes/admin.php` exists, no API routes

**Solution:** Create `routes/api.php` with RESTful routes (Section 6.2, API Routes).

### 11 Not Using UUID Route Binding for API

**Problem:** API routes use auto-increment IDs instead of UUIDs

```php
// ❌ WRONG - Uses ID
Route::get('{contact}', [ContactController::class, 'show']);

// ✅ CORRECT - Uses UUID
Route::get('{contact:uuid}', [ContactController::class, 'show']);
```

**Solution:** Use `{model:uuid}` pattern in all API routes.

### 12 Config Values Not Using Nested Structure

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

### 13 Forcing CRUD Patterns on Utility Packages

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

### 14 ServiceProvider Only Binding Admin Controllers (Not API)

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

### 15 ServiceProvider Only Binding Admin Requests (Not API)

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

### 16 Contract Exists But Implementation Doesn't Have `implements` Clause

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

### 17 API Controller Using Concrete Classes Instead of Contracts

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

### 18 Using Concrete Implementations Instead of Contracts

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

### 19 Misclassifying Utility Packages as CRUD

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

### 20 Empty Contract Interfaces

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

### 21 Service Classes Not Implementing Contracts

**Problem:** Service class exists and corresponding contract exists, but the class doesn't have `implements ContractInterface`

This is a variant of pitfall 16 that specifically affects service classes.

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

### 22 Renaming Classes/Interfaces Without Updating Cross-Package References

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
