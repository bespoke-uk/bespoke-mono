---
name: new-blade
description: Create a new Blade component package from the skeleton-blade template
argument-hint: "<component-name>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

Create a new Blade component package following Bespoke patterns.

**Arguments:** $ARGUMENTS

The argument should be the component name in kebab-case (e.g., `dropdown`, `tooltip`, `date-picker`).

## What This Creates

A new package at `blade/blade-{component-name}/` with:

### Directory Structure

```
blade/blade-{component-name}/
├── config/
│   └── blade-{component-name}.php
├── resources/
│   └── views/
│       └── components/
│           └── {component-name}.blade.php
├── src/
│   ├── Blade{ComponentName}ServiceProvider.php
│   └── Components/
│       └── {ComponentName}.php
├── tests/
│   ├── TestCase.php
│   └── ExampleTest.php
├── CLAUDE.md
├── composer.json
├── phpstan.neon.dist
├── phpunit.xml.dist
└── pint.json
```

## Process

### 1. Copy Skeleton

```bash
cp -r /Users/stuart/Packages/bespoke/template/skeleton-blade /Users/stuart/Packages/bespoke/blade/blade-{component-name}
```

### 2. Replace Placeholders

| Placeholder | Replace With |
|-------------|--------------|
| `:vendor_name` | `bespoke-uk` |
| `:package_name` | `blade-{component-name}` |
| `:package_slug` | `blade-{component-name}` |
| `VendorName` | `Bespoke` |
| `Skeleton` | `{ComponentName}` |
| `skeleton` | `{component-name}` |

### 3. Create Component Class

`src/Components/{ComponentName}.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\Blade{ComponentName}\Components;

use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class {ComponentName} extends Component
{
    public function __construct(
        // Component properties
    ) {
    }

    public function render(): View
    {
        return view('blade-{component-name}::components.{component-name}');
    }
}
```

### 4. Create Component View

`resources/views/components/{component-name}.blade.php`:

```blade
@props([
    // Define props
])

<div {{ $attributes->class(['']) }}>
    {{ $slot }}
</div>
```

### 5. Create Service Provider

`src/Blade{ComponentName}ServiceProvider.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\Blade{ComponentName};

use Bespoke\Blade{ComponentName}\Components\{ComponentName};
use Bespoke\PackageTools\Package;
use Bespoke\PackageTools\PackageServiceProvider;

class Blade{ComponentName}ServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void
    {
        $package
            ->name('blade-{component-name}')
            ->hasConfigFile()
            ->hasViews();
    }

    public function packageBooted(): void
    {
        $this->loadViewComponentsAs('bespoke', [
            {ComponentName}::class,
        ]);
    }
}
```

### 6. Create Config File

`config/blade-{component-name}.php`:

```php
<?php

declare(strict_types=1);

return [
    'aliases' => [],

    'components' => [
        '{component-name}' => \Bespoke\Blade{ComponentName}\Components\{ComponentName}::class,
    ],
];
```

### 7. Create composer.json

```json
{
    "name": "bespoke-uk/blade-{component-name}",
    "description": "Blade {ComponentName} component for Bespoke CMS",
    "keywords": ["laravel", "blade", "{component-name}"],
    "type": "library",
    "require": {
        "php": "^8.2",
        "bespoke-uk/package-tools": "^10.0"
    },
    "require-dev": {
        "orchestra/testbench": "^9.0|^10.0",
        "phpstan/phpstan": "^1.10",
        "laravel/pint": "^1.0"
    },
    "autoload": {
        "psr-4": {
            "Bespoke\\Blade{ComponentName}\\": "src/"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "Bespoke\\Blade{ComponentName}\\Tests\\": "tests/"
        }
    },
    "extra": {
        "laravel": {
            "providers": [
                "Bespoke\\Blade{ComponentName}\\Blade{ComponentName}ServiceProvider"
            ]
        }
    }
}
```

### 8. Create CLAUDE.md

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with this package.

## Overview

This is `bespoke-uk/blade-{component-name}`, a Blade component package for Bespoke CMS.

**Namespace:** `Bespoke\Blade{ComponentName}`
**Extends:** `bespoke-uk/package-tools`

## Commands

```bash
composer test     # Run tests
composer analyse  # PHPStan
composer format   # Pint formatter
```

## Usage

```blade
<x-bespoke-{component-name}>
    Content here
</x-bespoke-{component-name}>
```

## Component Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| | | | |

## Key Files

| File | Purpose |
|------|---------|
| `src/Components/{ComponentName}.php` | Component class |
| `resources/views/components/{component-name}.blade.php` | Component view |
```

### 9. Final Steps

```bash
cd /Users/stuart/Packages/bespoke/blade/blade-{component-name}
composer install
composer format
composer analyse
```

## Output Report

```
## Blade Component Package Created

**Package:** bespoke-uk/blade-{component-name}
**Location:** blade/blade-{component-name}/

### Files Created
- src/Blade{ComponentName}ServiceProvider.php
- src/Components/{ComponentName}.php
- resources/views/components/{component-name}.blade.php
- config/blade-{component-name}.php
- tests/TestCase.php
- tests/ExampleTest.php
- composer.json
- CLAUDE.md
- phpstan.neon.dist
- phpunit.xml.dist
- pint.json

### Usage
```blade
<x-bespoke-{component-name}>
    Content
</x-bespoke-{component-name}>
```

### Next Steps
1. Implement component logic in src/Components/{ComponentName}.php
2. Add markup to resources/views/components/{component-name}.blade.php
3. Add properties and slots as needed
4. Write tests
5. Update livewire_components.md if this is a Livewire component
```

## Important Notes

- Blade packages go in `blade/` directory
- Package name format: `blade-{component-name}`
- Namespace format: `Bespoke\Blade{ComponentName}`
- Component prefix: `bespoke-` (usage: `<x-bespoke-{name}>`)
- Follow existing patterns from 33 blade-* component packages
- Keep dependencies minimal (only package-tools)
