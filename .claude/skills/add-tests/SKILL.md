---
name: add-tests
description: Scaffold PHPUnit tests for a Bespoke package
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
context: fork
agent: test-scaffolder
---

Scaffold comprehensive PHPUnit tests for the package at the specified path.

**Package Path:** $ARGUMENTS

This will create:

1. **Base Test Infrastructure**
   - `tests/TestCase.php` - Base test case extending Orchestra Testbench
   - `tests/ExampleTest.php` - Basic smoke test

2. **Unit Tests**
   - `tests/Unit/Models/{Model}Test.php` - Model instantiation, attributes, relationships
   - `tests/Unit/Actions/Create{Model}Test.php` - Action unit tests

3. **Feature Tests**
   - `tests/Feature/Api/{Model}ApiTest.php` - API endpoint tests (index, store, show, update, destroy)
   - `tests/Feature/Admin/{Model}ControllerTest.php` - Admin route tests

4. **Livewire Tests** (if components exist)
   - `tests/Livewire/{Component}Test.php` - Component render and interaction tests

## Test Patterns

All tests follow these patterns:
- `declare(strict_types=1);`
- Use `#[Test]` PHP 8 attribute
- Descriptive names: `it_can_*`, `it_should_*`, `it_fails_when_*`
- Use contracts for DI, not concrete classes
- API tests use `RefreshDatabase` trait

## Output

Report showing:
- Files created
- Test coverage by category
- Next steps for manual test additions
