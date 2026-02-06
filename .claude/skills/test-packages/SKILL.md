---
name: test-packages
description: Run tests across one or more Bespoke packages
argument-hint: "<package-path|category|--all> [--filter=name]"
user-invocable: true
allowed-tools:
  - Read
  - Bash
  - Glob
---

Run PHPUnit tests across packages.

**Arguments:** $ARGUMENTS

## Usage

```bash
# Test single package
/test-packages crm/contact

# Test all packages in a category
/test-packages crm

# Test all packages
/test-packages --all

# Test with filter
/test-packages crm/contact --filter=ContactTest

# Test multiple specific packages
/test-packages crm/contact crm/customer core/user
```

## Process

### Single Package
```bash
cd {package-path}
composer test
```

### Category
```bash
for pkg in {category}/*/; do
  cd "$pkg" \
  && rm -f composer.lock \
  && composer update --no-interaction \
  && composer test
done
```

### All Packages
Iterate through all categories and packages, collecting results.

## Output

### Per-Package Results
```
=== crm/contact ===
Tests: 15, Assertions: 42
Time: 2.3s
Status: ✓ PASSED

=== crm/customer ===
Tests: 8, Assertions: 23
Time: 1.1s
Status: ✓ PASSED
```

### Summary
```
=== Test Summary ===
Packages Tested: 15
Passed: 14
Failed: 1
Skipped: 0

Failed Packages:
- core/user: 2 failures
  - test_it_can_update_email (UserTest.php:45)
  - test_it_validates_password (UserTest.php:67)

Total Time: 45.2s
```

## Options

| Option | Description |
|--------|-------------|
| `--filter=name` | Only run tests matching pattern |
| `--stop-on-failure` | Stop at first failure |
| `--coverage` | Generate coverage report |
| `--parallel` | Run tests in parallel (faster) |

## Prerequisites

Each package must have:
- `composer.json` with test script
- `tests/TestCase.php`
- PHPUnit configuration

## Notes

- Packages without tests are skipped with warning
- Failed packages are listed at the end
- Exit code reflects overall success/failure
- Use `--parallel` for faster execution on large runs
