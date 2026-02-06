# Audit & Pre-Commit Checklists

> Extracted from [PACKAGE_STANDARDS.md](../PACKAGE_STANDARDS.md) — Sections 9 and 12

---

## 1. Audit Checklist

**IMPORTANT:** This checklist applies to **CRUD packages only**. Utility packages (see Section 1.2) do not need to meet these requirements.

Use this checklist to audit CRUD packages for compliance with standards.

### 1.1 Directory Structure Checklist (15 items)

- [ ] `config/package-name.php` exists
- [ ] `database/factories/` directory exists
- [ ] `database/migrations/` directory exists
- [ ] `resources/lang/en/` directory exists
- [ ] `resources/schema/` directory exists with .tsv files
- [ ] `resources/views/admin/` directory exists
- [ ] `resources/views/exports/` directory exists
- [ ] `routes/admin.php` exists
- [ ] `routes/api.php` exists
- [ ] `src/Actions/` directory exists
- [ ] `src/Contracts/` directory exists (NOT `Interfaces/`)
- [ ] `src/Contracts/Admin/` directory exists
- [ ] `src/Events/` directory exists
- [ ] `src/Exports/` directory exists
- [ ] `src/Http/Controllers/Admin/` directory exists
- [ ] `src/Http/Controllers/Api/` directory exists
- [ ] `src/Http/Requests/Admin/` directory exists
- [ ] `src/Http/Requests/Api/` directory exists (with StoreModel.php, UpdateModel.php)
- [ ] `src/Http/Resources/` directory exists (with ModelResource.php, ModelCollection.php)
- [ ] `src/Imports/` directory exists
- [ ] `src/Models/` directory exists
- [ ] `tests/` directory exists with PHPUnit `TestCase.php` and `ExampleTest.php`
- [ ] `composer.json` has correct `require` (php ^8.2, package-tools ^10.0)
- [ ] `composer.json` has all required `require-dev` dependencies
- [ ] `composer.json` has all required `scripts` (analyse, format, test, etc.)
- [ ] `composer.json` has correct `config` (sort-packages, allow-plugins)
- [ ] Database migrations use `.php.stub` extension (no datetime prefix)
- [ ] No Pest test files in `tests/` directory

**Score:** ___/29

### 1.2 Contract Count Checklist (12+ minimum)

- [ ] Model contract (`Contracts/Model.php`)
- [ ] Admin controller contract (`Contracts/Admin/ModelController.php`)
- [ ] Admin request contracts (`Contracts/Admin/UpdateModel.php`, etc.)
- [ ] API controller contract (`Contracts/Api/ModelController.php`)
- [ ] API request contracts (`Contracts/Api/StoreModel.php`, `Contracts/Api/UpdateModel.php`)
- [ ] API resource contract (`Contracts/Api/ModelResource.php`)
- [ ] API collection contract (`Contracts/Api/ModelCollection.php`)
- [ ] Action contracts (`Contracts/CreateModel.php`, etc.)
- [ ] Import contract (`Contracts/ModelImport.php`)
- [ ] Export contract (`Contracts/ModelExport.php`)
- [ ] Validation rule contracts (if custom rules exist)
- [ ] Additional controller contracts (Activity, Marketing, etc.)

**Count:** ___/12 minimum (Contact package should have 15+)

### 1.3 ServiceProvider Binding Methods (8+ minimum)

- [ ] `registerActionBindings()` implemented
- [ ] `registerControllerBindings()` implemented (includes BOTH Admin AND API)
- [ ] `registerExportBindings()` implemented
- [ ] `registerImportBindings()` implemented
- [ ] `registerModelBindings()` implemented
- [ ] `registerRequestBindings()` implemented (includes BOTH Admin AND API)
- [ ] `registerResourceBindings()` implemented (for API resources)
- [ ] `registerRouteModelBindings()` implemented
- [ ] `registerRuleBindings()` implemented (if rules exist)
- [ ] `configurePackage()` method complete

**Score:** ___/10

### 1.4 Config File Sections (23 sections)

- [ ] `aliases`
- [ ] `actions`
- [ ] `casts`
- [ ] `commands`
- [ ] `components`
- [ ] `controllers` (with `admin` and `api` nested keys)
- [ ] `defaults`
- [ ] `export`
- [ ] `fillable`
- [ ] `import` (with `schema_file` key)
- [ ] `listeners`
- [ ] `livewire`
- [ ] `loggable`
- [ ] `middlewares`
- [ ] `migrations`
- [ ] `models`
- [ ] `module`
- [ ] `requests` (with `admin` and `api` nested keys)
- [ ] `resources` (with `model` and `model_collection` keys)
- [ ] `responses`
- [ ] `routes`
- [ ] `route_prefixes`
- [ ] `rules`

**Score:** ___/23

### 1.5 Implementation Classes (10+ items)

- [ ] Model class exists and implements contract
- [ ] Admin controller(s) exist and implement contracts
- [ ] API controller exists with full RESTful methods (index, store, show, update, destroy)
- [ ] Admin request classes exist and implement contracts
- [ ] API StoreModel request exists
- [ ] API UpdateModel request exists
- [ ] API ModelResource exists
- [ ] API ModelCollection exists
- [ ] Import handler exists and implements contract
- [ ] Export handler exists and implements contract
- [ ] Export blade view exists (`resources/views/exports/`)
- [ ] Action classes exist and implement contracts
- [ ] Event classes exist (ModelCreated, etc.)

**Score:** ___/13

### 1.6 Route Files

- [ ] `routes/admin.php` has resourceful routes
- [ ] `routes/api.php` has RESTful routes
- [ ] API routes use `{model:uuid}` pattern
- [ ] Routes use config-based prefixes
- [ ] Routes have permission middleware

**Score:** ___/5

### 1.7 Overall Completeness Score

**Total Score:** ___/88

**Grade:**
- **90-100% (80-88 points):** Excellent - Fully compliant
- **80-89% (71-79 points):** Good - Minor gaps
- **70-79% (62-70 points):** Fair - Needs improvement
- **Below 70% (<62 points):** Poor - Major refactoring required

### 1.8 Priority Classification

| Priority | Criteria | Action Required |
|----------|----------|-----------------|
| **High** | Missing API functionality entirely | Add full API stack (controller, requests, resources, routes) |
| **High** | Missing Contracts directory | Create contracts for all implementations |
| **High** | Missing Exports functionality | Add export handler, contract, config, view |
| **High** | Missing Imports functionality | Add import handler, contract, config, schema |
| **Medium** | Incomplete config file (<15 sections) | Add missing config sections |
| **Medium** | Missing binding methods in ServiceProvider | Implement required `register*Bindings()` methods |
| **Medium** | Using `Interfaces/` instead of `Contracts/` | Rename directory and update namespaces |
| **Low** | Missing optional functionality (Livewire, Events) | Add if business logic requires |
| **Low** | Incomplete documentation | Add CLAUDE.md, ARCHITECTURE.md |

---

## 2. Pre-Commit Verification Checklist

**Use this checklist before committing changes to any CRUD package.** This prevents the common issues discovered during package audits.

### 2.1 Quick Verification Commands

Run these commands from the package root to verify compliance:

```bash
# 1. Check all implementations have 'implements' clause
echo "=== Checking Controllers implement contracts ==="
grep -L "implements.*Contract" src/Http/Controllers/Admin/*.php 2>/dev/null && echo "⚠ Missing implements clause"
grep -L "implements.*Contract" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ Missing implements clause"

echo "=== Checking Requests implement contracts ==="
grep -L "implements.*Contract" src/Http/Requests/Admin/*.php 2>/dev/null && echo "⚠ Missing implements clause"
grep -L "implements.*Contract" src/Http/Requests/Api/*.php 2>/dev/null && echo "⚠ Missing implements clause"

echo "=== Checking Resources implement contracts ==="
grep -L "implements.*Contract" src/Http/Resources/*.php 2>/dev/null && echo "⚠ Missing implements clause"

# 2. Check ServiceProvider has API bindings
echo "=== Checking ServiceProvider API bindings ==="
grep -q "controllers.api" src/*ServiceProvider.php && echo "✓ API controller binding exists" || echo "✗ Missing API controller binding"
grep -q "requests.api" src/*ServiceProvider.php && echo "✓ API request binding exists" || echo "✗ Missing API request binding"
grep -q "resources\." src/*ServiceProvider.php && echo "✓ Resource binding exists" || echo "✗ Missing resource binding"

# 3. Check config has API sections
echo "=== Checking config API sections ==="
grep -q "'api' =>" config/*.php && echo "✓ Config has API sections" || echo "✗ Missing API sections in config"
grep -q "'resources' =>" config/*.php && echo "✓ Config has resources section" || echo "✗ Missing resources section in config"

# 4. Verify API routes exist
echo "=== Checking API routes ==="
test -f routes/api.php && echo "✓ API routes file exists" || echo "✗ Missing routes/api.php"

# 5. Check API controller uses contracts (not concrete classes)
echo "=== Checking API controller uses contracts ==="
grep -q "use.*Http\\\\Resources\\\\" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ API controller importing concrete resource classes" || echo "✓ No concrete resource imports"
grep -q "use.*Http\\\\Requests\\\\Api\\\\" src/Http/Controllers/Api/*.php 2>/dev/null && echo "⚠ API controller importing concrete request classes" || echo "✓ No concrete request imports"

# 6. Check for ANY concrete implementations being imported (package extensibility)
echo "=== Checking for concrete implementation imports (breaks extensibility) ==="
grep -r "use.*\\\\Models\\\\" src/ --include="*.php" | grep -v "^src/Models/" | grep -v "Eloquent\\\\Model" && echo "⚠ Found concrete Model imports outside Models/" || echo "✓ No concrete Model imports"
grep -r "use.*\\\\Actions\\\\" src/ --include="*.php" | grep -v "^src/Actions/" && echo "⚠ Found concrete Action imports outside Actions/" || echo "✓ No concrete Action imports"
grep -r "use.*\\\\Http\\\\Controllers\\\\" src/ --include="*.php" | grep -v "^src/Http/Controllers/" | grep -v "AbstractController" && echo "⚠ Found concrete Controller imports" || echo "✓ No concrete Controller imports"
```

```bash
# 7. Check composer.json has required dependencies
echo "=== Checking composer.json ==="
grep -q '"php": "\\^8.2"' composer.json && echo "✓ PHP ^8.2 required" || echo "✗ Missing php ^8.2 requirement"
grep -q '"bespoke-uk/package-tools": "\\^10.0"' composer.json && echo "✓ package-tools ^10.0 required" || echo "✗ Missing package-tools requirement"
grep -q '"phpunit/phpunit"' composer.json && echo "✓ PHPUnit in require-dev" || echo "✗ Missing PHPUnit"
grep -q '"larastan/larastan"' composer.json && echo "✓ Larastan in require-dev" || echo "✗ Missing Larastan"

# 8. Check for Pest files (should not exist)
echo "=== Checking for Pest files ==="
test -f tests/Pest.php && echo "✗ Pest.php found - must replace with PHPUnit" || echo "✓ No Pest.php"
grep -rl "^test(" tests/ --include="*.php" 2>/dev/null && echo "✗ Pest test syntax found" || echo "✓ No Pest syntax"

# 9. Check migration naming
echo "=== Checking migration naming ==="
ls database/migrations/ 2>/dev/null | grep -E "^[0-9]{4}_" && echo "✗ Migrations have datetime prefix - remove it" || echo "✓ No datetime prefix"
ls database/migrations/*.php.stub 2>/dev/null > /dev/null 2>&1 && echo "✓ Migrations use .php.stub extension" || echo "⚠ Check migration file extensions"
```

### 2.2 Contract-Implementation Alignment Checklist

For every contract in `src/Contracts/`, verify the implementation:

| Contract Location | Implementation Must Have |
|-------------------|-------------------------|
| `Contracts/Model.php` | Model class with `implements ModelContract` |
| `Contracts/Admin/ModelController.php` | Admin controller with `implements ModelControllerContract` |
| `Contracts/Admin/StoreModel.php` | Admin request with `implements StoreModelContract` |
| `Contracts/Admin/UpdateModel.php` | Admin request with `implements UpdateModelContract` |
| `Contracts/Api/ModelController.php` | API controller with `implements ModelControllerContract` |
| `Contracts/Api/StoreModel.php` | API request with `implements StoreModelContract` |
| `Contracts/Api/UpdateModel.php` | API request with `implements UpdateModelContract` |
| `Contracts/Api/ModelResource.php` | API resource with `implements ModelResourceContract` |
| `Contracts/Api/ModelCollection.php` | API collection with `implements ModelCollectionContract` |
| `Contracts/CreateModel.php` | Action with `implements CreateModelContract` |
| `Contracts/ModelImport.php` | Import handler with `implements ModelImportContract` |
| `Contracts/ModelExport.php` | Export handler with `implements ModelExportContract` |

### 2.3 ServiceProvider Binding Verification

For CRUD packages, verify `registerControllerBindings()` includes:

```php
// ✅ MUST have Admin controller binding
$this->app->bind(AdminModelControllerContract::class, ...);

// ✅ MUST have API controller binding
$this->app->bind(ApiModelControllerContract::class, ...);
```

For CRUD packages, verify `registerRequestBindings()` includes:

```php
// ✅ MUST have Admin request bindings
$this->app->bind(AdminStoreModelContract::class, ...);
$this->app->bind(AdminUpdateModelContract::class, ...);

// ✅ MUST have API request bindings
$this->app->bind(ApiStoreModelContract::class, ...);
$this->app->bind(ApiUpdateModelContract::class, ...);
```

For CRUD packages, verify `registerResourceBindings()` includes:

```php
// ✅ MUST have API resource bindings
$this->app->bind(ModelResourceContract::class, function ($app) {
    return $app->make($app->config['package.resources.model']);
});
$this->app->bind(ModelCollectionContract::class, function ($app) {
    return $app->make($app->config['package.resources.model_collection']);
});
```

### 2.4 Config File Verification

Verify config has nested structure for controllers, requests, and resources:

```php
// ✅ CORRECT structure
'controllers' => [
    'admin' => [
        'model' => \Package\Http\Controllers\Admin\ModelController::class,
    ],
    'api' => [
        'model' => \Package\Http\Controllers\Api\ModelController::class,
    ],
],
'requests' => [
    'admin' => [
        'store_model' => \Package\Http\Requests\Admin\StoreModel::class,
        'update_model' => \Package\Http\Requests\Admin\UpdateModel::class,
    ],
    'api' => [
        'store_model' => \Package\Http\Requests\Api\StoreModel::class,
        'update_model' => \Package\Http\Requests\Api\UpdateModel::class,
    ],
],
'resources' => [
    'model' => \Package\Http\Resources\ModelResource::class,
    'model_collection' => \Package\Http\Resources\ModelCollection::class,
],
```

### 2.5 Pre-Commit Checklist Summary

Before committing changes to a CRUD package, verify:

- [ ] **Package Classification**: Confirmed this is a CRUD package (not utility)
- [ ] **Contracts Exist**: All bound classes have corresponding contracts
- [ ] **ALL Controllers Have Contracts**: Every controller (Admin, API, auxiliary) implements a contract
- [ ] **Implements Clauses**: All implementations have `implements ContractName`
- [ ] **No Concrete Imports**: No code imports from `Models\`, `Actions\`, `Http\Controllers\` directly (use `Contracts\`)
- [ ] **API Contracts**: `Contracts/Api/` has controller, request, AND resource contracts
- [ ] **API Controller Binding**: ServiceProvider binds API controller contract
- [ ] **API Request Bindings**: ServiceProvider binds API request contracts
- [ ] **API Resource Bindings**: ServiceProvider has `registerResourceBindings()` method
- [ ] **API Controller Uses Contracts**: Controller type-hints contracts, not concrete classes
- [ ] **Resource Instantiation**: Uses `app(ResourceContract::class, ['resource' => $model])`
- [ ] **Config Structure**: Config has `controllers.api`, `requests.api`, and `resources` sections
- [ ] **Routes File**: `routes/api.php` exists with RESTful endpoints
- [ ] **UUID Binding**: API routes use `{model:uuid}` pattern
- [ ] **composer.json**: Has correct `require`, `require-dev`, `scripts`, and `config` sections (Section 3.3)
- [ ] **PHPUnit Tests**: Tests use PHPUnit (not Pest), with `TestCase.php` and `ExampleTest.php` (Section 3.4)
- [ ] **Migration Naming**: Migrations use `.php.stub` extension with no datetime prefix (Section 3.5)

### 2.6 Common Audit Failures (Lessons Learned)

These issues were discovered during the February 2026 core and default package audits:

| Package | Issue Found | Root Cause |
|---------|-------------|------------|
| `core/user` | API controller not bound | `registerControllerBindings()` only had Admin |
| `core/user` | API resources using concrete classes | Controller imported `Http\Resources\` instead of contracts |
| `core/document` | API request contracts not bound | `registerRequestBindings()` only had Admin |
| `core/image` | API controller not bound | Same pattern - Admin only |
| `core/note` | API request contracts not bound | Same pattern - Admin only |
| `core/profile` | Flagged for missing CRUD features | Misclassified - it's a utility package |
| `core/core` | Flagged for missing ServiceProvider | Misclassified - it's a meta-package |
| `default/seo` | Using `Interfaces/` directory | Should be `Contracts/` per naming convention |
| `default/cloudflare` | Empty contract interface | `interface CloudFlare {}` with no method signatures |
| `default/cloudflare` | Service not implementing contract | `CloudFlare` service missing `implements CloudFlareContract` |
| `default/referrer` | Empty contract interface | `interface Referrer {}` with no method signatures |
| `default/referrer` | Service not implementing contract | `Referrer` service missing `implements ReferrerContract` |
| `default/continent` | Missing export functionality | CRUD package without export handler |
| `default/country` | Missing export functionality | CRUD package without export handler |
| `default/redirect` | Missing export functionality | CRUD package without export handler |

**Pattern:** When adding API functionality, developers often:
1. Create the API controller ✓
2. Create the API routes ✓
3. Create the API contracts (controller, requests) ✓
4. **FORGET** to create resource contracts ✗
5. **FORGET** to add ServiceProvider bindings ✗
6. **FORGET** to make implementations `implements` the contracts ✗
7. **FORGET** to use contract type-hints in controllers ✗
8. **Use** `new ResourceClass($model)` instead of `app(Contract::class, ['resource' => $model])` ✗

**Pattern:** When creating service contracts, developers often:
1. Create the contract file ✓
2. Register the binding in ServiceProvider ✓
3. **FORGET** to add method signatures to the contract (leaving it empty) ✗
4. **FORGET** to add `implements ContractName` to the service class ✗
