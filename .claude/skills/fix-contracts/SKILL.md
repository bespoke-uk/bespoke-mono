---
name: fix-contracts
description: Generate missing contracts for a Bespoke package
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
context: fork
agent: contract-generator
---

Analyse the package and generate any missing contracts.

**Package Path:** $ARGUMENTS

## What This Does

1. **Scans the package** for:
   - Models in `src/Models/`
   - Controllers in `src/Http/Controllers/Admin/` and `Api/`
   - Requests in `src/Http/Requests/Admin/` and `Api/`
   - Resources in `src/Http/Resources/`
   - Actions in `src/Actions/`
   - Imports in `src/Imports/`
   - Exports in `src/Exports/`
   - Rules in `src/Rules/`

2. **Checks existing contracts** in `src/Contracts/`

3. **Generates missing contracts** with proper:
   - Namespace matching the package
   - Interface methods matching the implementation
   - Proper type hints and return types
   - `declare(strict_types=1);`

4. **Creates directory structure**:
   - `src/Contracts/` for main contracts
   - `src/Contracts/Admin/` for admin-specific contracts
   - `src/Contracts/Api/` for API-specific contracts

## Contract Templates

Each contract type has a specific template:
- **Model contracts** - Marker interfaces (empty)
- **Controller contracts** - Method signatures for all actions
- **Request contracts** - `rules()` and `authorize()` methods
- **Action contracts** - Static `run()` method
- **Import contracts** - Extends `ToCollection`, `WithHeadingRow`
- **Export contracts** - Extends `FromView`, `WithStyles`
- **Rule contracts** - Extends `ValidationRule`

## Output

Report showing:
- Contracts created (with file paths)
- Contracts that already existed
- Implementations that need to be updated to implement their contracts
- ServiceProvider bindings that need to be added

## Important Notes

- Uses `Contracts/` directory, NOT `Interfaces/`
- Admin contracts go in `Contracts/Admin/`
- API contracts go in `Contracts/Api/`
- All contracts use `declare(strict_types=1);`
