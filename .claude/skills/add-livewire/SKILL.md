---
name: add-livewire
description: Add a Livewire component to a Bespoke package following established patterns
argument-hint: "<package-path> <ComponentName>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

Add a Livewire component to the package following established patterns.

**Arguments:** $ARGUMENTS

Parse arguments:
- First: package path (e.g., `crm/contact`)
- Second: component name in PascalCase (e.g., `ContactDataTable`)

## What This Creates

### 1. Component Class

Create `src/Livewire/{ComponentName}.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Livewire;

use Illuminate\Contracts\View\View;
use Livewire\Component;

class {ComponentName} extends Component
{
    // Component properties
    public string $search = '';

    // Lifecycle hooks
    public function mount(): void
    {
        // Initialize component
    }

    // Actions
    public function refresh(): void
    {
        // Refresh data
    }

    public function render(): View
    {
        return view('{package-name}::livewire.{component-kebab}');
    }
}
```

### 2. Component View

Create `resources/views/livewire/{component-kebab}.blade.php`:

```blade
<div>
    {{-- Component content --}}
</div>
```

### 3. Config Registration

Add to `config/{package-name}.php` in the `livewire` array:

```php
'livewire' => [
    '{component-kebab}' => \Bespoke\{PackageName}\Livewire\{ComponentName}::class,
    // ... existing components
],
```

## Component Patterns

### DataTable Component

For listing data with search/filters:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Livewire;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Contracts\View\View;
use Illuminate\Pagination\LengthAwarePaginator;
use Livewire\Component;
use Livewire\WithPagination;

class {ModelName}DataTable extends Component
{
    use WithPagination;

    public string $search = '';
    public string $sortField = 'created_at';
    public string $sortDirection = 'desc';
    public int $perPage = 25;

    protected $queryString = [
        'search' => ['except' => ''],
        'sortField' => ['except' => 'created_at'],
        'sortDirection' => ['except' => 'desc'],
    ];

    public function updatingSearch(): void
    {
        $this->resetPage();
    }

    public function sortBy(string $field): void
    {
        if ($this->sortField === $field) {
            $this->sortDirection = $this->sortDirection === 'asc' ? 'desc' : 'asc';
        } else {
            $this->sortField = $field;
            $this->sortDirection = 'asc';
        }
    }

    public function get{ModelName}sProperty(): LengthAwarePaginator
    {
        return app({ModelName}Contract::class)
            ->query()
            ->when($this->search, fn ($q) => $q->where('name', 'like', "%{$this->search}%"))
            ->orderBy($this->sortField, $this->sortDirection)
            ->paginate($this->perPage);
    }

    public function render(): View
    {
        return view('{package-name}::livewire.{model-name}-data-table', [
            '{model_plural}' => $this->{model_plural},
        ]);
    }
}
```

### Modal Component

For create/edit modals:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Livewire;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class {ModelName}Modal extends Component
{
    public bool $show = false;
    public ?int $modelId = null;
    public array $form = [];

    protected $listeners = [
        'open{ModelName}Modal' => 'open',
        'close{ModelName}Modal' => 'close',
    ];

    public function open(?int $id = null): void
    {
        $this->modelId = $id;

        if ($id) {
            $model = app({ModelName}Contract::class)->find($id);
            $this->form = $model->toArray();
        } else {
            $this->form = $this->getDefaultForm();
        }

        $this->show = true;
    }

    public function close(): void
    {
        $this->show = false;
        $this->reset(['modelId', 'form']);
    }

    public function save(): void
    {
        $validated = $this->validate($this->rules());

        if ($this->modelId) {
            app({ModelName}Contract::class)->find($this->modelId)->update($validated);
            $this->dispatch('{model-name}-updated');
        } else {
            app({ModelName}Contract::class)->create($validated);
            $this->dispatch('{model-name}-created');
        }

        $this->close();
    }

    protected function getDefaultForm(): array
    {
        return [
            'name' => '',
        ];
    }

    protected function rules(): array
    {
        return [
            'form.name' => ['required', 'string', 'max:255'],
        ];
    }

    public function render(): View
    {
        return view('{package-name}::livewire.{model-name}-modal');
    }
}
```

### AutoComplete Component

For search/select:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Livewire;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;

class {ModelName}AutoComplete extends Component
{
    public string $search = '';
    public ?int $selectedId = null;
    public string $selectedName = '';
    public bool $showDropdown = false;

    public function updatedSearch(): void
    {
        $this->showDropdown = strlen($this->search) >= 2;
    }

    public function select(int $id, string $name): void
    {
        $this->selectedId = $id;
        $this->selectedName = $name;
        $this->search = $name;
        $this->showDropdown = false;

        $this->dispatch('{model-name}-selected', id: $id);
    }

    public function clear(): void
    {
        $this->reset(['selectedId', 'selectedName', 'search', 'showDropdown']);
        $this->dispatch('{model-name}-cleared');
    }

    public function getResultsProperty(): Collection
    {
        if (strlen($this->search) < 2) {
            return collect();
        }

        return app({ModelName}Contract::class)
            ->query()
            ->where('name', 'like', "%{$this->search}%")
            ->limit(10)
            ->get(['id', 'name']);
    }

    public function render(): View
    {
        return view('{package-name}::livewire.{model-name}-auto-complete', [
            'results' => $this->results,
        ]);
    }
}
```

## Output Report

```
## Livewire Component Report: {package-name}

### Created Files
- src/Livewire/{ComponentName}.php
- resources/views/livewire/{component-kebab}.blade.php

### Config Updated
- config/{package-name}.php (added to livewire array)

### Usage
```blade
<livewire:{package-name}-{component-kebab} />
```

### Next Steps
1. Implement component logic in the class
2. Add component markup to the view
3. Add any required JavaScript interactions
4. Register in ServiceProvider if not auto-discovered
```

## Naming Conventions

| Pattern | Example |
|---------|---------|
| Class name | `ContactDataTable` |
| View file | `contact-data-table.blade.php` |
| Config key | `contact-data-table` |
| Blade tag | `<livewire:contact-contact-data-table />` |

## Important Notes

- Components are registered via config `livewire` array
- Views go in `resources/views/livewire/`
- Use contracts for model access, not concrete classes
- Follow existing patterns in the 98 registered components
- Use kebab-case for file names and config keys
