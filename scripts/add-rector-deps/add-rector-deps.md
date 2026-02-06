# Add Rector Dependencies Script

Instructions for Claude Code when adding Rector dependencies to composer.json files across packages.

## Overview

The `add-rector-deps.sh` script automates adding Rector refactoring dependencies to the `require-dev` section of all package `composer.json` files. It safely skips packages that already have the dependencies and packages without a `require-dev` section.

## Dependencies Added

The script adds these three dependencies:
- `rector/rector: ^1.2` - Core Rector refactoring tool
- `driftingly/rector-laravel: ^1.2` - Laravel-specific Rector rules
- `webmozart/assert: ^2.1` - Assertion library (required by rector-laravel)

## Quick Start

```bash
# Run the script from the repository root
./scripts/add-rector-deps/add-rector-deps.sh
```

## How It Works

1. Finds all `composer.json` files in the monorepo (excluding `vendor/` and `workbench/`)
2. For each file:
   - Checks if `rector/rector` already exists (skips if present)
   - Checks if `require-dev` section exists (skips if missing)
   - Uses `jq` to add the three dependencies to `require-dev`
   - Preserves existing JSON formatting
3. Displays a summary of updated, skipped, and error packages

## Output Examples

```
Processing: /Users/stuart/Packages/bespoke/core/editor/composer.json
  ✅ Updated successfully

Processing: /Users/stuart/Packages/bespoke/core/auth/composer.json
  ⏭️  Skipped - rector/rector already present

Processing: /Users/stuart/Packages/bespoke/blade/blade/composer.json
  ⚠️  Warning - no require-dev section found, skipping
```

## Summary Report

After processing all packages:
```
════════════════════════════════════════
Summary:
  Updated: 83 packages
  Skipped: 19 packages (already have rector)
  Errors:  4 packages
════════════════════════════════════════
```

## When to Use This Script

Use this script when:
- Adding Rector to new packages in the monorepo
- You've created new packages that don't have Rector configured yet
- Updating Rector version constraints across all packages (modify the version numbers in the script first)

## Requirements

- **jq** must be installed: `brew install jq` (macOS) or `apt-get install jq` (Linux)
- Script must be run from a location where the paths resolve correctly

## Package Types Skipped

The script automatically skips:
- **Meta-packages** (no `require-dev` section): `blade/blade`, `cms/cms`, `default/default`
- **Template packages** (no `require-dev`): `template/skeleton-alias`

These packages don't contain code and don't need dev dependencies.

## Compatibility

All three dependencies are compatible with:
- **PHP ^8.2** (all packages require this)
- **Laravel 10.x, 11.x, 12.x** (driftingly/rector-laravel supports all versions)

## Claude Code Instructions

When asked to add Rector to packages or update Rector versions:

1. **Run the script:**
   ```bash
   ./scripts/add-rector-deps/add-rector-deps.sh
   ```

2. **Review the summary** to ensure expected packages were updated

3. **Verify a sample package** to confirm proper JSON formatting:
   ```bash
   grep -A 2 '"rector/rector"' /Users/stuart/Packages/bespoke/core/editor/composer.json
   ```

4. **If updating versions**, edit the script first to change version constraints, then run

## Notes

- The script is idempotent - safe to run multiple times
- Uses `jq` to ensure valid JSON output
- Creates temporary files during processing
- Uses absolute paths: `/Users/stuart/Packages/bespoke`
- Processes approximately 106 packages in the monorepo

## Troubleshooting

**Error: jq not installed**
```bash
brew install jq  # macOS
```

**Paths not resolving**
- Ensure you're running from the correct directory
- Verify the absolute path in the script matches your system
- Path is currently set to: `/Users/stuart/Packages/bespoke`

**Packages showing as errors**
- Check if the package has a `require-dev` section in `composer.json`
- Meta-packages intentionally don't have `require-dev` sections
