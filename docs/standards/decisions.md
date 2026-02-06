# Architectural Decision Records

This document tracks significant architectural decisions made for the Bespoke CMS monorepo.

## Format

Each decision follows this format:

```
## ADR-{number}: {Title}

**Date:** YYYY-MM-DD
**Status:** Proposed | Accepted | Deprecated | Superseded
**Superseded by:** ADR-{number} (if applicable)

### Context
What is the issue that we're seeing that is motivating this decision?

### Decision
What is the change that we're proposing and/or doing?

### Consequences
What becomes easier or more difficult to do because of this change?
```

---

## ADR-001: Use Contracts Directory Instead of Interfaces

**Date:** 2024-01-01
**Status:** Accepted
**Migration Status:** Core packages complete (2026-02-05)

### Context
PHP traditionally uses the term "Interface" for contracts between classes. However, Laravel and the broader PHP ecosystem have moved toward using "Contracts" terminology, as seen in `Illuminate\Contracts`.

Some packages in the monorepo used `src/Interfaces/` while others used `src/Contracts/`, creating inconsistency.

### Decision
All packages will use `src/Contracts/` for interface definitions. Existing `src/Interfaces/` directories will be migrated.

### Consequences
- **Positive:** Consistency with Laravel conventions
- **Positive:** Easier onboarding for developers familiar with Laravel
- **Negative:** Requires migration of existing packages
- **Negative:** Some IDE templates may need updating

### Migration Progress

**Core packages (complete):** module (14 interfaces), document, image, note, editor (3), employee (2), user (2), setting (4)

**Remaining packages:** See [interfaces_registry.md](../registry/interfaces_registry.md) section 1 for non-core packages still needing migration.

---

## ADR-002: Config-Driven Class Bindings

**Date:** 2024-01-01
**Status:** Accepted

### Context
Packages need flexibility to allow consuming applications to swap implementations. Hard-coded bindings in ServiceProviders make this difficult.

### Decision
All class bindings use config-driven resolution:

```php
protected function registerModelBindings(): void
{
    $this->app->bind(ContactContract::class, function ($app) {
        return $app->make($app->config['contact.models.contact']);
    });
}
```

Config files declare the default implementations:

```php
'models' => [
    'contact' => \Bespoke\Contact\Models\Contact::class,
],
```

### Consequences
- **Positive:** Applications can override any implementation
- **Positive:** Testing can swap implementations easily
- **Positive:** Consistent pattern across all packages
- **Negative:** More verbose than direct bindings
- **Negative:** Config files become larger

---

## ADR-003: UUID-Based API Routes

**Date:** 2024-01-01
**Status:** Accepted

### Context
API routes traditionally use auto-incrementing IDs (`/api/contacts/123`). This exposes database internals and makes IDs predictable, which can be a security concern.

### Decision
All API routes use UUID route key binding:

```php
Route::get('/contacts/{contact:uuid}', [ContactController::class, 'show']);
```

Models use `HasUUID` trait and override `getRouteKeyName()`:

```php
public function getRouteKeyName(): string
{
    return 'uuid';
}
```

### Consequences
- **Positive:** IDs are not predictable
- **Positive:** No information leakage about record counts
- **Positive:** Easier data migration between environments
- **Negative:** Longer URLs
- **Negative:** Cannot use simple incrementing for testing

---

## ADR-004: Nested Config Structure for Controllers and Requests

**Date:** 2024-01-01
**Status:** Accepted

### Context
Packages often have both admin and API controllers with the same name (e.g., `ContactController`). Flat config structures caused naming conflicts.

### Decision
Use nested config structure:

```php
'controllers' => [
    'admin' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
    ],
    'api' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Api\ContactController::class,
    ],
],
```

### Consequences
- **Positive:** Clear separation of admin and API controllers
- **Positive:** No naming conflicts
- **Positive:** Easier to override specific contexts
- **Negative:** Deeper config nesting
- **Negative:** Longer config key paths

---

## ADR-005: Event Naming in Past Tense

**Date:** 2024-01-01
**Status:** Accepted

### Context
Events can be named as commands (`CreateContact`) or as facts (`ContactCreated`). Inconsistency across packages made code harder to understand.

### Decision
Events use past tense to indicate something has happened:
- `ContactCreated` (not `CreateContact`)
- `ContactUpdated` (not `UpdateContact`)
- `LoggedIn` (not `Login`)

Actions use imperative form:
- `CreateContact::run()`

### Consequences
- **Positive:** Clear distinction between actions and events
- **Positive:** Events read naturally: "When ContactCreated, do X"
- **Positive:** Consistent with Laravel conventions
- **Negative:** Requires renaming some existing events

---

## ADR-006: Monorepo Package Structure

**Date:** 2024-01-01
**Status:** Accepted

### Context
The codebase contains 100+ packages. Options considered:
1. Single repository per package (polyrepo)
2. All packages in one repository (monorepo)

### Decision
Use a monorepo structure with packages organised by domain:

```
bespoke/
├── api/      # Third-party integrations
├── blade/    # UI components
├── cms/      # Content management
├── core/     # Core functionality
├── crm/      # Customer relationship
├── custom/   # Client-specific
├── default/  # Utilities
└── template/ # Scaffolding
```

### Consequences
- **Positive:** Atomic commits across packages
- **Positive:** Easier refactoring
- **Positive:** Single CI/CD pipeline
- **Positive:** Consistent tooling
- **Negative:** Larger repository size
- **Negative:** All packages versioned together
- **Negative:** Requires monorepo-specific tooling

---

## ADR-007: Abstract Base Classes in Module Package

**Date:** 2024-01-01
**Status:** Accepted

### Context
CRUD packages share common patterns for models, imports, and exports. Code duplication was increasing maintenance burden.

### Decision
The `bespoke-uk/module` package provides abstract base classes:
- `AbstractModel` - Base model with UUID, activity logging
- `AbstractImport` - Base import with common patterns
- `AbstractExport` - Base export with styling helpers

CRUD packages extend these rather than implementing from scratch.

### Consequences
- **Positive:** Consistent behaviour across packages
- **Positive:** Bug fixes apply everywhere
- **Positive:** New packages are faster to create
- **Negative:** Coupling to module package
- **Negative:** Less flexibility for edge cases

---

## ADR-008: Trait-Based Feature Composition

**Date:** 2024-01-01
**Status:** Accepted

### Context
Models need various features (UUID, activity logging, soft deletes, etc.). Options:
1. Base class with all features
2. Traits for composable features

### Decision
Use traits for composable features. Traits follow naming convention `Has{Feature}`:
- `HasUUID`
- `HasActivity`
- `HasContacts`
- `HasDocuments`

Models compose the features they need:

```php
class Contact extends AbstractModel
{
    use HasUUID;
    use HasActivity;
    use HasAvatar;
}
```

### Consequences
- **Positive:** Models only include what they need
- **Positive:** Features are reusable across packages
- **Positive:** Clear what features a model has
- **Negative:** Many use statements in models
- **Negative:** Trait method conflicts possible

---

## ADR-009: Livewire for Interactive Components

**Date:** 2024-01-01
**Status:** Accepted

### Context
Admin interfaces need interactive features (search, filtering, modals). Options:
1. Traditional JavaScript + AJAX
2. Vue.js components
3. Livewire components

### Decision
Use Livewire for interactive admin components. Components are registered via config:

```php
'livewire' => [
    'contact-data-table' => ContactDataTable::class,
],
```

### Consequences
- **Positive:** PHP-centric development
- **Positive:** No JavaScript build step for basic interactions
- **Positive:** Consistent with Laravel ecosystem
- **Negative:** More server requests
- **Negative:** Learning curve for team
- **Negative:** 98 components to maintain

---

## ADR-010: Contract-First Development

**Date:** 2024-01-01
**Status:** Accepted

### Context
Swappable implementations require interfaces. The question is when to create them - upfront or when needed.

### Decision
Create contracts (interfaces) before or alongside implementations for all classes that are bound in the service container:
- Models
- Controllers
- Requests
- Actions
- Imports/Exports

Minimum 8-13 contracts per CRUD package.

### Consequences
- **Positive:** All implementations are swappable
- **Positive:** Clear API boundaries
- **Positive:** Better testability
- **Negative:** More files to create
- **Negative:** Maintenance of parallel hierarchies

---

## ADR-011: Cross-Package Reference Management

**Date:** 2026-02-04
**Status:** Accepted

### Context
The monorepo contains 108 packages with extensive cross-package dependencies. Trait interfaces (like `SeoInterface`, `ImagesInterface`) are implemented by models across many packages. When renaming or moving these interfaces, broken references can silently propagate, only surfacing at runtime or during static analysis.

A concrete example: renaming `Bespoke\Seo\Interfaces\SeoInterface` to `Bespoke\Seo\Contracts\Seo` broke 10 packages that implemented the old interface.

### Decision
1. **Maintain an Interface Registry** (`docs/registry/interfaces_registry.md`) cataloguing all ~304 interfaces/contracts with their full namespaces and usage patterns.

2. **Mandatory Search Before Rename** - Before renaming any interface or contract, search the entire monorepo:
   ```bash
   grep -r "OldNamespace\\OldInterface" --include="*.php" . | grep -v vendor
   ```

3. **Document High-Impact Interfaces** - Trait interfaces that are implemented by many packages are flagged as "HIGH" priority in the registry.

4. **Add Guidance to package_standards.md** - Section 10.22 documents the pitfall and provides commands for safe renaming.

### Consequences
- **Positive:** Prevents silent breakages across packages
- **Positive:** Provides clear process for safe refactoring
- **Positive:** Documents all interfaces in one place
- **Negative:** Additional documentation to maintain
- **Negative:** Requires discipline to follow process

---

## ADR-012: Actions Layer for Business Logic

**Date:** 2026-02-05
**Status:** Accepted

### Context
CRUD packages were implementing business logic directly in controllers, leading to:
1. Controllers becoming bloated with database operations
2. Difficulty testing business logic in isolation
3. Inconsistent patterns for event dispatching
4. No reusability of business logic across different contexts (API, CLI, jobs)

Some packages (like `crm/contact`) had already adopted an Actions pattern, but it wasn't standardised across all CRUD packages.

### Decision
All CRUD packages MUST implement an Actions layer for Create, Update, and Delete operations:

1. **Create action classes** in `src/Actions/` for each major operation:
   - `CreateModel.php` - Handles creation with defaults and events
   - `UpdateModel.php` - Handles updates with audit trail and events
   - `DeleteModel.php` - Handles deletion with event dispatching

2. **Create action contracts** in `src/Contracts/` for each action class

3. **Register actions** in ServiceProvider using `registerActionBindings()`:
   ```php
   protected function registerActionBindings(): void
   {
       $this->app->bind(CreateModelContract::class, function ($app) {
           return $app->make($app->config['package.actions.create_model']);
       });
   }
   ```

4. **Declare actions in config** under `actions` section:
   ```php
   'actions' => [
       'create_model' => \Bespoke\Package\Actions\CreateModel::class,
       'update_model' => \Bespoke\Package\Actions\UpdateModel::class,
       'delete_model' => \Bespoke\Package\Actions\DeleteModel::class,
   ],
   ```

5. **Controllers use actions** instead of direct model manipulation:
   ```php
   public function store(StoreModel $request): RedirectResponse
   {
       $model = CreateModel::execute($request->validated());
       return redirect()->route('admin.model.show', $model);
   }
   ```

### Consequences
- **Positive:** Business logic is testable in isolation
- **Positive:** Logic is reusable across controllers, commands, jobs
- **Positive:** Consistent event dispatching patterns
- **Positive:** Controllers become thinner and focus on HTTP concerns
- **Positive:** Actions can be swapped via config (like all other package components)
- **Negative:** More files to create per package (3 actions + 3 contracts)
- **Negative:** Additional binding method to implement

### Implementation Status
- ✅ `crm/contact` - Reference implementation
- ✅ `default/continent` - Full Actions layer (2026-02-05)
- ✅ `default/country` - Full Actions layer (2026-02-05)
- ✅ `default/redirect` - Full Actions layer (2026-02-05)
- 🔄 Other CRUD packages to be updated incrementally

---

## Template for New Decisions

Copy this template when adding a new decision:

```markdown
## ADR-0XX: Title

**Date:** YYYY-MM-DD
**Status:** Proposed

### Context
[Describe the context and problem]

### Decision
[Describe the decision]

### Consequences
- **Positive:** [benefit]
- **Negative:** [drawback]
```
