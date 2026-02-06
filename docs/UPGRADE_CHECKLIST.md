# Package Upgrade Checklist

This checklist guides upgrading older Bespoke packages to meet current PACKAGE_STANDARDS.md compliance.

## Quick Assessment

Before starting, determine the package type and current state:

```bash
# Check if CRUD or Utility package
ls src/Models/  # Has models = likely CRUD

# Count current contracts
find src/Contracts -name "*.php" 2>/dev/null | wc -l

# Check for old Interfaces directory
ls src/Interfaces/ 2>/dev/null && echo "⚠ Needs migration to Contracts/"

# Check for API routes
test -f routes/api.php && echo "✓ Has API" || echo "✗ Missing API"
```

## CRUD Package Checklist

### Phase 1: Critical Fixes

#### 1.1 Directory Structure

- [ ] Rename `src/Interfaces/` to `src/Contracts/` if present
  ```bash
  mv src/Interfaces src/Contracts
  find src -name "*.php" -exec sed -i '' 's/\\Interfaces\\/\\Contracts\\/g' {} \;
  ```

- [ ] Create required directories:
  ```bash
  mkdir -p src/Contracts/Admin
  mkdir -p src/Contracts/Api
  mkdir -p src/Http/Controllers/Admin
  mkdir -p src/Http/Controllers/Api
  mkdir -p src/Http/Requests/Admin
  mkdir -p src/Http/Requests/Api
  mkdir -p src/Http/Resources
  mkdir -p src/Actions
  mkdir -p src/Events
  mkdir -p src/Exports
  mkdir -p src/Imports
  mkdir -p resources/schema
  mkdir -p resources/views/exports
  ```

#### 1.2 Model Contract

- [ ] Create `src/Contracts/{ModelName}.php`:
  ```php
  <?php

  declare(strict_types=1);

  namespace Bespoke\{PackageName}\Contracts;

  interface {ModelName}
  {
  }
  ```

- [ ] Model implements contract:
  ```php
  class {ModelName} extends AbstractModel implements {ModelName}Contract
  ```

### Phase 2: ServiceProvider Updates

#### 2.1 Binding Methods

Check and add missing binding methods to ServiceProvider:

- [ ] `registerModelBindings()`
- [ ] `registerControllerBindings()`
- [ ] `registerRequestBindings()`
- [ ] `registerActionBindings()`
- [ ] `registerImportBindings()`
- [ ] `registerExportBindings()`
- [ ] `registerRouteModelBindings()`

Template:
```php
protected function registerModelBindings(): void
{
    $this->app->bind({ModelName}Contract::class, function ($app) {
        return $app->make($app->config['{package-name}.models.{model-name}']);
    });
}
```

#### 2.2 Package Configuration

- [ ] Update `configurePackage()` to include all routes:
  ```php
  $package
      ->name('{package-name}')
      ->hasConfigFile()
      ->hasViews()
      ->hasMigrations()
      ->hasRoutes(['admin', 'api']);
  ```

### Phase 3: Config File Updates

#### 3.1 Restructure Controllers

Old (flat):
```php
'controllers' => [
    '{model}' => Controller::class,
],
```

New (nested):
```php
'controllers' => [
    'admin' => [
        '{model}' => AdminController::class,
    ],
    'api' => [
        '{model}' => ApiController::class,
    ],
],
```

#### 3.2 Restructure Requests

Old (flat):
```php
'requests' => [
    'update_{model}' => UpdateRequest::class,
],
```

New (nested):
```php
'requests' => [
    'admin' => [
        'update_{model}' => AdminUpdateRequest::class,
    ],
    'api' => [
        'store_{model}' => ApiStoreRequest::class,
        'update_{model}' => ApiUpdateRequest::class,
    ],
],
```

#### 3.3 Add Missing Sections

Ensure config has all 22 sections:
- [ ] `aliases`
- [ ] `actions`
- [ ] `casts`
- [ ] `commands`
- [ ] `components`
- [ ] `controllers` (nested)
- [ ] `defaults`
- [ ] `export`
- [ ] `fillable`
- [ ] `import` (with `schema_file`)
- [ ] `listeners`
- [ ] `livewire`
- [ ] `loggable`
- [ ] `middlewares`
- [ ] `migrations`
- [ ] `models`
- [ ] `module`
- [ ] `requests` (nested)
- [ ] `responses`
- [ ] `routes`
- [ ] `route_prefixes`
- [ ] `rules`

### Phase 4: Contracts

#### 4.1 Controller Contracts

- [ ] `src/Contracts/Admin/{ModelName}Controller.php`
- [ ] `src/Contracts/Api/{ModelName}Controller.php`

#### 4.2 Request Contracts

- [ ] `src/Contracts/Admin/Update{ModelName}.php`
- [ ] `src/Contracts/Api/Store{ModelName}.php`
- [ ] `src/Contracts/Api/Update{ModelName}.php`

#### 4.3 Other Contracts

- [ ] `src/Contracts/Create{ModelName}.php` (action)
- [ ] `src/Contracts/{ModelName}Import.php`
- [ ] `src/Contracts/{ModelName}Export.php`

### Phase 5: API Implementation

Use `/add-api {package-path}` or manually create:

- [ ] `src/Http/Controllers/Api/{ModelName}Controller.php`
- [ ] `src/Http/Requests/Api/Store{ModelName}.php`
- [ ] `src/Http/Requests/Api/Update{ModelName}.php`
- [ ] `src/Http/Resources/{ModelName}Resource.php`
- [ ] `routes/api.php`

#### API Route Pattern

```php
Route::middleware(config('module.api.middleware', ['api', 'auth:sanctum']))
    ->prefix('api/v1')
    ->group(function () {
        Route::apiResource('{route-prefix}', app({ModelName}Controller::class))
            ->parameters(['{route-prefix}' => '{model-name}:uuid']);
    });
```

### Phase 6: Import/Export

Use `/add-exports {package-path}` or manually create:

- [ ] `src/Imports/{ModelName}Import.php`
- [ ] `src/Exports/{ModelName}Export.php`
- [ ] `resources/schema/{model-plural}.tsv`
- [ ] `resources/views/exports/{model-plural}.blade.php`

### Phase 7: Events

- [ ] `src/Events/{ModelName}Created.php`
- [ ] `src/Events/{ModelName}Updated.php`
- [ ] `src/Events/{ModelName}Deleted.php`

### Phase 8: Code Quality

- [ ] Run `composer format`
- [ ] Run `composer analyse` and fix issues
- [ ] Ensure all PHP files have `declare(strict_types=1);`
- [ ] Remove any debug code (`dd()`, `dump()`)
- [ ] Update `CLAUDE.md` documentation

### Phase 9: Verification

```bash
# Run full audit
/audit {package-path}

# Run tests
composer test

# Check compliance score
# Target: 81/81 (100%) for CRUD packages
```

---

## Utility Package Checklist

Utility packages have simplified requirements:

### Required

- [ ] `src/Contracts/{ModelName}.php` (if has models)
- [ ] ServiceProvider with `configurePackage()`
- [ ] Config file with relevant sections
- [ ] Traits in `src/Traits/` following `Has{Feature}` naming

### Not Required

- ❌ API controllers/routes
- ❌ Import/Export functionality
- ❌ `Contracts/Admin/` or `Contracts/Api/` subdirectories

### Verification

```bash
# Run audit with utility flag
/audit {package-path}

# Target: 30/30 for utility packages
```

---

## Common Migration Issues

### Issue: Namespace Changes After Moving Interfaces

```bash
# Find and replace all namespace references
grep -r "Bespoke\\\\{PackageName}\\\\Interfaces" --include="*.php" .
```

### Issue: Missing Route Model Binding

Add to ServiceProvider:
```php
protected function registerRouteModelBindings(): void
{
    Route::bind('{model-name}', function ($value) {
        return app({ModelName}Contract::class)
            ->where('uuid', $value)
            ->firstOrFail();
    });
}
```

### Issue: Config Not Loading

Ensure ServiceProvider has:
```php
$package->hasConfigFile();
```

And config file is at `config/{package-name}.php`.

---

## Reference

- **Gold Standard:** `/crm/contact` (100% compliant)
- **Standards Document:** `PACKAGE_STANDARDS.md`
- **Upgrade Skill:** `/upgrade-package {path}`
- **Audit Skill:** `/audit {path}`
