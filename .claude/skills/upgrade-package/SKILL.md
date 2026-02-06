---
name: upgrade-package
description: Upgrade an older Bespoke package to meet current standards
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
context: fork
agent: package-auditor
---

Upgrade the package at the specified path to meet current docs/PACKAGE_STANDARDS.md compliance.

**Package Path:** $ARGUMENTS

## Process

### 1. Run Audit First

Use the package-auditor agent to get a compliance report:
- Identify current compliance score
- List specific missing items
- Determine if CRUD or Utility package

### 2. Prioritise Fixes

Address issues in this order:

**Critical (do first):**
1. Rename `Interfaces/` to `Contracts/` if present
2. Add missing model contracts
3. Fix ServiceProvider binding methods

**Important (do second):**
4. Add missing controller contracts
5. Add missing request contracts
6. Update config file structure (nested controllers/requests)

**For CRUD packages:**
7. Add API implementation if missing
8. Add exports/imports if missing
9. Add missing events

**Final:**
10. Run `composer format`
11. Run `composer analyse` and fix issues

### 3. Common Upgrades

#### Rename Interfaces to Contracts

```bash
# Check if Interfaces directory exists
if [ -d "src/Interfaces" ]; then
    mv src/Interfaces src/Contracts
    # Update all namespace references
    find src -name "*.php" -exec sed -i '' 's/\\Interfaces\\/\\Contracts\\/g' {} \;
fi
```

#### Add Missing Binding Methods

Check ServiceProvider for these methods:
- `registerModelBindings()`
- `registerControllerBindings()`
- `registerRequestBindings()`
- `registerActionBindings()`
- `registerImportBindings()` (CRUD only)
- `registerExportBindings()` (CRUD only)

Template for missing binding method:

```php
protected function register{Type}Bindings(): void
{
    $this->app->bind({Contract}::class, function ($app) {
        return $app->make($app->config['{package}.{section}.{key}']);
    });
}
```

#### Update Config Structure

Old (flat):
```php
'controllers' => [
    'contact' => ContactController::class,
],
```

New (nested):
```php
'controllers' => [
    'admin' => [
        'contact' => ContactController::class,
    ],
    'api' => [
        'contact' => ApiContactController::class,
    ],
],
```

#### Add API Routes Pattern

Ensure routes use UUID:
```php
// Old (wrong)
Route::get('/{contact}', [ContactController::class, 'show']);

// New (correct)
Route::get('/{contact:uuid}', [app(ContactController::class), 'show']);
```

### 4. Upgrade Checklist

For each upgrade, verify:

- [ ] `src/Contracts/` exists (not `Interfaces/`)
- [ ] All bound classes have contracts
- [ ] ServiceProvider has required binding methods
- [ ] Config uses nested structure
- [ ] `declare(strict_types=1);` in all PHP files
- [ ] Models extend `AbstractModel` with `HasUUID`
- [ ] API routes use `{model:uuid}` pattern
- [ ] Events use past tense naming
- [ ] Traits use `Has*` naming

### 5. Post-Upgrade Verification

```bash
composer format
composer analyse
composer test
```

## Output Report

```
## Package Upgrade Report: {package-name}

### Before
- Compliance Score: {old_score}/81 ({old_percentage}%)

### Changes Made

**Structural Changes:**
- Renamed Interfaces/ to Contracts/
- Created src/Contracts/Admin/ directory
- ...

**Files Created ({count}):**
- src/Contracts/{Name}.php
- ...

**Files Modified ({count}):**
- src/{Name}ServiceProvider.php (added binding methods)
- config/{name}.php (restructured)
- ...

**Config Updates:**
- Added nested controllers.admin/api structure
- Added nested requests.admin/api structure
- Added routes array with 'api'
- ...

### After
- Compliance Score: {new_score}/81 ({new_percentage}%)
- Improvement: +{points} points

### Remaining Issues
- {issue 1}
- {issue 2}

### Next Steps
1. {manual step needed}
2. Run tests and fix failures
3. Consider running /add-api for full API implementation
```

## Reference

- Use `/crm/contact` as the gold standard (100% compliant)
- See docs/PACKAGE_STANDARDS.md for detailed requirements
- See docs/UPGRADE_CHECKLIST.md for step-by-step guide
