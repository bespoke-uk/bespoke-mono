# Testing Guide

This guide covers testing standards and patterns for the Bespoke CMS monorepo.

## Overview

All packages use PHPUnit with Orchestra Testbench for Laravel package testing.

## Quick Commands

```bash
# Run all tests
composer test

# Run tests in parallel
composer test:parallel

# Run with coverage
composer test:coverage

# Run specific test file
composer test -- --filter=ContactTest

# Run specific test method
composer test -- --filter=test_it_can_create_contact
```

## Test Structure

```
tests/
├── TestCase.php           # Base test case (required)
├── ExampleTest.php        # Basic smoke test
├── Feature/
│   ├── Admin/             # Admin controller tests
│   │   └── {Model}ControllerTest.php
│   └── Api/               # API endpoint tests
│       └── {Model}ApiTest.php
├── Unit/
│   ├── Models/            # Model unit tests
│   │   └── {Model}Test.php
│   └── Actions/           # Action unit tests
│       └── Create{Model}Test.php
└── Livewire/              # Livewire component tests
    └── {Component}Test.php
```

## Base TestCase

Every package needs a `tests/TestCase.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\PackageName\Tests;

use Bespoke\PackageName\PackageNameServiceProvider;
use Illuminate\Database\Eloquent\Factories\Factory;
use Livewire\LivewireServiceProvider;
use Orchestra\Testbench\TestCase as Orchestra;
use Bespoke\PackageTools\Actions\RunMigrations;
use Bespoke\PackageTools\Helpers\Testing;

class TestCase extends Orchestra
{
    protected function setUp(): void
    {
        parent::setUp();

        Factory::guessFactoryNamesUsing(
            fn (string $modelName) => 'Bespoke\\PackageName\\Database\\Factories\\'.class_basename($modelName).'Factory'
        );

        if ($this->app->runningUnitTests() && Testing::fromPackage(basePath: __DIR__)) {
            RunMigrations::fromPackageStubs(package: 'package-name', basePath: __DIR__);
        }
    }

    protected function getPackageProviders($app): array
    {
        return [
            PackageNameServiceProvider::class,
            LivewireServiceProvider::class,
        ];
    }

    public function getEnvironmentSetUp($app): void
    {
        config()->set('database.default', 'testing');
    }
}
```

## Test Patterns

### Naming Conventions

Use descriptive, behaviour-focused names:

```php
// Good
public function it_can_create_a_contact(): void
public function it_fails_when_email_is_invalid(): void
public function it_returns_paginated_results(): void

// Avoid
public function testCreate(): void
public function test1(): void
```

### Attributes

Use PHP 8 attributes alongside docblocks:

```php
use PHPUnit\Framework\Attributes\Test;

#[Test]
public function it_can_create_a_contact(): void
{
    // ...
}
```

### Model Tests

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Tests\Unit\Models;

use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Models\Contact;
use Bespoke\Contact\Tests\TestCase;
use PHPUnit\Framework\Attributes\Test;

class ContactTest extends TestCase
{
    #[Test]
    public function it_can_be_instantiated(): void
    {
        $model = app(ContactContract::class);

        $this->assertInstanceOf(Contact::class, $model);
    }

    #[Test]
    public function it_has_correct_table_name(): void
    {
        $model = new Contact();

        $this->assertEquals('contacts', $model->getTable());
    }

    #[Test]
    public function it_uses_uuid_for_route_key(): void
    {
        $model = new Contact();

        $this->assertEquals('uuid', $model->getRouteKeyName());
    }

    #[Test]
    public function it_has_fillable_attributes(): void
    {
        $model = new Contact();

        $this->assertContains('name', $model->getFillable());
        $this->assertContains('email', $model->getFillable());
    }

    #[Test]
    public function it_has_casts(): void
    {
        $model = new Contact();
        $casts = $model->getCasts();

        $this->assertArrayHasKey('marketing_email', $casts);
    }
}
```

### API Tests

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Tests\Feature\Api;

use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use PHPUnit\Framework\Attributes\Test;

class ContactApiTest extends TestCase
{
    use RefreshDatabase;

    #[Test]
    public function it_can_list_contacts(): void
    {
        // Arrange
        app(ContactContract::class)->create(['name' => 'Test Contact']);

        // Act
        $response = $this->getJson('/api/v1/contacts');

        // Assert
        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['uuid', 'name', 'created_at'],
                ],
            ]);
    }

    #[Test]
    public function it_can_create_a_contact(): void
    {
        $data = [
            'name' => 'New Contact',
            'email' => 'test@example.com',
        ];

        $response = $this->postJson('/api/v1/contacts', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.name', 'New Contact');

        $this->assertDatabaseHas('contacts', ['email' => 'test@example.com']);
    }

    #[Test]
    public function it_validates_required_fields(): void
    {
        $response = $this->postJson('/api/v1/contacts', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name']);
    }

    #[Test]
    public function it_can_show_a_contact(): void
    {
        $contact = app(ContactContract::class)->create(['name' => 'Test']);

        $response = $this->getJson("/api/v1/contacts/{$contact->uuid}");

        $response->assertStatus(200)
            ->assertJsonPath('data.uuid', $contact->uuid);
    }

    #[Test]
    public function it_returns_404_for_missing_contact(): void
    {
        $response = $this->getJson('/api/v1/contacts/non-existent-uuid');

        $response->assertStatus(404);
    }

    #[Test]
    public function it_can_update_a_contact(): void
    {
        $contact = app(ContactContract::class)->create(['name' => 'Original']);

        $response = $this->patchJson("/api/v1/contacts/{$contact->uuid}", [
            'name' => 'Updated',
        ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.name', 'Updated');
    }

    #[Test]
    public function it_can_delete_a_contact(): void
    {
        $contact = app(ContactContract::class)->create(['name' => 'To Delete']);

        $response = $this->deleteJson("/api/v1/contacts/{$contact->uuid}");

        $response->assertStatus(200);
        $this->assertDatabaseMissing('contacts', ['uuid' => $contact->uuid]);
    }
}
```

### Livewire Tests

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Tests\Livewire;

use Bespoke\Contact\Livewire\ContactDataTable;
use Bespoke\Contact\Tests\TestCase;
use Livewire\Livewire;
use PHPUnit\Framework\Attributes\Test;

class ContactDataTableTest extends TestCase
{
    #[Test]
    public function it_can_render(): void
    {
        Livewire::test(ContactDataTable::class)
            ->assertStatus(200);
    }

    #[Test]
    public function it_can_search(): void
    {
        Livewire::test(ContactDataTable::class)
            ->set('search', 'test')
            ->assertSet('search', 'test');
    }

    #[Test]
    public function it_can_sort(): void
    {
        Livewire::test(ContactDataTable::class)
            ->call('sortBy', 'name')
            ->assertSet('sortField', 'name')
            ->assertSet('sortDirection', 'asc');
    }

    #[Test]
    public function it_toggles_sort_direction(): void
    {
        Livewire::test(ContactDataTable::class)
            ->set('sortField', 'name')
            ->set('sortDirection', 'asc')
            ->call('sortBy', 'name')
            ->assertSet('sortDirection', 'desc');
    }
}
```

### Action Tests

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Tests\Unit\Actions;

use Bespoke\Contact\Actions\CreateContact;
use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use PHPUnit\Framework\Attributes\Test;

class CreateContactTest extends TestCase
{
    use RefreshDatabase;

    #[Test]
    public function it_creates_a_contact(): void
    {
        $data = [
            'name' => 'Test Contact',
            'email' => 'test@example.com',
        ];

        $contact = CreateContact::run($data);

        $this->assertInstanceOf(ContactContract::class, $contact);
        $this->assertEquals('Test Contact', $contact->name);
        $this->assertDatabaseHas('contacts', ['email' => 'test@example.com']);
    }

    #[Test]
    public function it_dispatches_created_event(): void
    {
        Event::fake();

        CreateContact::run(['name' => 'Test']);

        Event::assertDispatched(ContactCreated::class);
    }
}
```

## Factories

### Creating Factories

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact\Database\Factories;

use Bespoke\Contact\Models\Contact;
use Illuminate\Database\Eloquent\Factories\Factory;

class ContactFactory extends Factory
{
    protected $model = Contact::class;

    public function definition(): array
    {
        return [
            'uuid' => $this->faker->uuid(),
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'phone' => $this->faker->phoneNumber(),
            'status' => 'active',
        ];
    }

    public function inactive(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'inactive',
        ]);
    }

    public function withMarketing(): static
    {
        return $this->state(fn (array $attributes) => [
            'marketing_email' => true,
            'marketing_sms' => true,
        ]);
    }
}
```

### Using Factories in Tests

```php
// Create single model
$contact = Contact::factory()->create();

// Create multiple
$contacts = Contact::factory()->count(5)->create();

// Use states
$inactiveContact = Contact::factory()->inactive()->create();

// Override attributes
$contact = Contact::factory()->create([
    'name' => 'Specific Name',
]);
```

## Best Practices

### Arrange-Act-Assert Pattern

```php
#[Test]
public function it_can_update_contact_status(): void
{
    // Arrange
    $contact = Contact::factory()->create(['status' => 'active']);

    // Act
    $contact->update(['status' => 'inactive']);

    // Assert
    $this->assertEquals('inactive', $contact->fresh()->status);
}
```

### Use Contracts for DI

```php
// Good - uses contract
$model = app(ContactContract::class);

// Avoid - uses concrete class directly
$model = new Contact();
```

### Test Edge Cases

```php
#[Test]
public function it_handles_empty_search(): void
{
    // Test empty string
}

#[Test]
public function it_handles_special_characters_in_search(): void
{
    // Test SQL injection prevention
}

#[Test]
public function it_handles_very_long_input(): void
{
    // Test max length validation
}
```

### Database Assertions

```php
// Check record exists
$this->assertDatabaseHas('contacts', ['email' => 'test@example.com']);

// Check record doesn't exist
$this->assertDatabaseMissing('contacts', ['email' => 'test@example.com']);

// Check record count
$this->assertDatabaseCount('contacts', 5);
```

## Running Tests

### PHPUnit Configuration

`phpunit.xml.dist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="https://schema.phpunit.de/10.0/phpunit.xsd"
         bootstrap="vendor/autoload.php"
         colors="true">
    <testsuites>
        <testsuite name="Package Tests">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
    <coverage>
        <include>
            <directory suffix=".php">src</directory>
        </include>
    </coverage>
    <php>
        <env name="DB_CONNECTION" value="testing"/>
        <env name="APP_KEY" value="base64:test-key-for-testing-only-32ch"/>
    </php>
</phpunit>
```

## Scaffolding Tests

Use the `/add-tests` skill to scaffold tests for a package:

```bash
/add-tests crm/contact
```

This creates:
- `tests/TestCase.php`
- `tests/ExampleTest.php`
- Model tests
- API tests (if API exists)
- Livewire tests (if components exist)

## Troubleshooting

### Common Issues

**"Class not found" errors:**
- Run `composer dump-autoload`
- Check namespace matches directory structure

**Database errors:**
- Ensure `RefreshDatabase` trait is used
- Check migrations run in TestCase

**Livewire component not found:**
- Register component in ServiceProvider
- Check component is in config `livewire` array

### Debugging Tests

```php
// Dump response
$response->dump();
$response->dumpHeaders();
$response->dumpSession();

// Dump database
Contact::all()->dump();

// Use dd() sparingly
dd($variable);
```
