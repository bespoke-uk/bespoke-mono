# ServiceProvider & Config Reference

> Extracted from [package_standards.md](package_standards.md) — Sections 5 and 6

---

## 1. ServiceProvider Implementation

### 1.1 Complete ServiceProvider Template

```php
<?php

declare(strict_types=1);

namespace Bespoke\Contact;

use Bespoke\Contact\Contracts\Admin\ActivityController as ActivityControllerContract;
use Bespoke\Contact\Contracts\Admin\ContactController as ContactControllerContract;
use Bespoke\Contact\Contracts\Admin\MarketingController as MarketingControllerContract;
use Bespoke\Contact\Contracts\Admin\UpdateContact as UpdateContactContract;
use Bespoke\Contact\Contracts\Admin\UpdateMarketing as UpdateMarketingContract;
use Bespoke\Contact\Contracts\Api\ContactCollection as ContactCollectionContract;
use Bespoke\Contact\Contracts\Api\ContactController as ApiContactControllerContract;
use Bespoke\Contact\Contracts\Api\ContactResource as ContactResourceContract;
use Bespoke\Contact\Contracts\Api\StoreContact as ApiStoreContactContract;
use Bespoke\Contact\Contracts\Api\UpdateContact as ApiUpdateContactContract;
use Bespoke\Contact\Contracts\Contact as ContactContract;
use Bespoke\Contact\Contracts\ContactImport as ContactImportContract;
use Bespoke\Contact\Contracts\CreateContact as CreateContactContract;
use Bespoke\Contact\Contracts\UniqueContactEmail as UniqueContactEmailContract;
use Bespoke\PackageTools\Commands\InstallCommand;
use Bespoke\PackageTools\Package;
use Bespoke\PackageTools\PackageServiceProvider;

class ContactServiceProvider extends PackageServiceProvider
{
    /**
     * Configure the package
     */
    public function configurePackage(Package $package): void
    {
        $package
            ->name('contact')
            ->hasCommands($this->fromConfig('contact.commands'))
            ->hasConfigFile()
            ->hasMigrations($this->fromConfig('contact.migrations'))
            ->hasRoutes($this->fromConfig('contact.routes'))
            ->hasTranslations()
            ->hasViews()
            ->hasInstallCommand(function (InstallCommand $command) {
                $command
                    ->askToExtend()
                    ->askToMigrate();
            });
    }

    /**
     * Register action bindings
     */
    protected function registerActionBindings(): void
    {
        $this->app->bind(CreateContactContract::class, function ($app) {
            return $app->make($app->config['contact.actions.create_contact']);
        });
    }

    /**
     * Register controller bindings
     */
    protected function registerControllerBindings(): void
    {
        // Admin controllers
        $this->app->bind(ActivityControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.activity']);
        });
        $this->app->bind(ContactControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.contact']);
        });
        $this->app->bind(MarketingControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.admin.marketing']);
        });
        // API controllers
        $this->app->bind(ApiContactControllerContract::class, function ($app) {
            return $app->make($app->config['contact.controllers.api.contact']);
        });
    }

    /**
     * Register import bindings
     */
    protected function registerImportBindings(): void
    {
        $this->app->bind(ContactImportContract::class, function ($app) {
            return $app->make($app->config['contact.import.contact']);
        });
    }

    /**
     * Register export bindings
     */
    protected function registerExportBindings(): void
    {
        $this->app->bind(ContactExportContract::class, function ($app) {
            return $app->make($app->config['contact.export.contact']);
        });
    }

    /**
     * Register model bindings
     */
    protected function registerModelBindings(): void
    {
        $this->app->bind(ContactContract::class, function ($app) {
            return $app->make($app->config['contact.models.contact']);
        });
    }

    /**
     * Register request bindings
     */
    protected function registerRequestBindings(): void
    {
        // Admin requests
        $this->app->bind(UpdateContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.admin.update_contact']);
        });
        $this->app->bind(UpdateMarketingContract::class, function ($app) {
            return $app->make($app->config['contact.requests.admin.update_marketing']);
        });
        // API requests
        $this->app->bind(ApiStoreContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.api.store_contact']);
        });
        $this->app->bind(ApiUpdateContactContract::class, function ($app) {
            return $app->make($app->config['contact.requests.api.update_contact']);
        });
    }

    /**
     * Register resource bindings (API resources)
     */
    protected function registerResourceBindings(): void
    {
        $this->app->bind(ContactResourceContract::class, function ($app) {
            return $app->make($app->config['contact.resources.contact']);
        });
        $this->app->bind(ContactCollectionContract::class, function ($app) {
            return $app->make($app->config['contact.resources.contact_collection']);
        });
    }

    /**
     * Register route model bindings
     */
    protected function registerRouteModelBindings(): void
    {
        // Bind the model to the route parameter
        $this->app['router']->model('contact', config('contact.models.contact'));
    }

    /**
     * Register validation rule bindings
     */
    protected function registerRuleBindings(): void
    {
        $this->app->bind(UniqueContactEmailContract::class, function ($app) {
            return $app->make($app->config['contact.rules.unique_contact_email']);
        });
    }
}
```

### 1.2 All 14 Binding Method Signatures

```php
/**
 * Register action class bindings (business logic)
 * Config key: actions.*
 */
protected function registerActionBindings(): void {}

/**
 * Register controller bindings (admin and API)
 * Config key: controllers.admin.*, controllers.api.*
 */
protected function registerControllerBindings(): void {}

/**
 * Register data object bindings (DTOs)
 * Config key: data.*
 */
protected function registerDataBindings(): void {}

/**
 * Register enum bindings
 * Config key: enums.*
 */
protected function registerEnumBindings(): void {}

/**
 * Register factory bindings (non-model factories)
 * Config key: factories.*
 */
protected function registerFactoryBindings(): void {}

/**
 * Register export handler bindings
 * Config key: export.*
 */
protected function registerExportBindings(): void {}

/**
 * Register import handler bindings
 * Config key: import.*
 */
protected function registerImportBindings(): void {}

/**
 * Register model bindings
 * Config key: models.*
 */
protected function registerModelBindings(): void {}

/**
 * Register parser bindings (file parsers, etc.)
 * Config key: parsers.*
 */
protected function registerParserBindings(): void {}

/**
 * Register form request bindings
 * Config key: requests.admin.*, requests.api.*
 */
protected function registerRequestBindings(): void {}

/**
 * Register API resource bindings
 * Config key: resources.*
 */
protected function registerResourceBindings(): void {}

/**
 * Register response object bindings
 * Config key: responses.*
 */
protected function registerResponseBindings(): void {}

/**
 * Register route model bindings (route parameters)
 * Uses: Router::model()
 */
protected function registerRouteModelBindings(): void {}

/**
 * Register validation rule bindings
 * Config key: rules.* (object rules only)
 */
protected function registerRuleBindings(): void {}

/**
 * Register service bindings (repositories, services)
 * Config key: services.*
 */
protected function registerServiceBindings(): void {}
```

### 1.3 Lifecycle Hook Usage

```php
/**
 * Called at the start of register() method
 * Use for: Pre-registration setup
 */
protected function registeringPackage(): void
{
    // Example: Register additional config files
}

/**
 * Called at the end of register() method
 * Use for: Post-registration tasks
 */
protected function packageRegistered(): void
{
    // Example: Merge additional config
}

/**
 * Called at the start of boot() method
 * Use for: Pre-boot setup
 */
protected function bootingPackage(): void
{
    // Example: Register observers
}

/**
 * Called at the end of boot() method
 * Use for: Post-boot tasks
 */
protected function packageBooted(): void
{
    // Example: Publish additional assets
}
```

### 1.4 configurePackage() Method Pattern

```php
public function configurePackage(Package $package): void
{
    $package
        ->name('contact')                                          // Package name (required)
        ->hasCommands($this->fromConfig('contact.commands'))      // Artisan commands
        ->hasConfigFile()                                         // config/contact.php
        ->hasMigrations($this->fromConfig('contact.migrations'))  // Ordered migrations
        ->hasRoutes($this->fromConfig('contact.routes'))          // Route files
        ->hasTranslations()                                       // resources/lang
        ->hasViews()                                              // resources/views
        ->hasInstallCommand(function (InstallCommand $command) {
            $command
                ->askToExtend()                                   // Prompt to extend models
                ->askToMigrate();                                 // Prompt to run migrations
        });
}
```

---

## 2. Complete Config File Reference

### 2.1 All 20+ Config Sections

```php
<?php

declare(strict_types=1);

return [
    /**
     * Aliases
     *
     * Class aliases for global access
     * Format: 'AliasName' => Alias::class
     */
    'aliases' => [
        'Contact' => \Bespoke\Contact\Contracts\Contact::class,
    ],

    /**
     * Actions
     *
     * Business logic action classes
     * Format: 'action_name' => Action::class
     */
    'actions' => [
        'create_contact' => \Bespoke\Contact\Actions\CreateContact::class,
    ],

    /**
     * Casts
     *
     * Model attribute casts
     * Single model: 'field_name' => Cast::class
     * Multi-model: 'model_name' => ['field_name' => Cast::class]
     */
    'casts' => [],

    /**
     * Commands
     *
     * Artisan console commands
     * Format: Command::class
     */
    'commands' => [
        \Bespoke\Contact\Commands\ImportContacts::class,
    ],

    /**
     * Blade Components
     *
     * Blade component registrations
     * Format: Component::class => 'component-alias'
     */
    'components' => [],

    /**
     * Controllers
     *
     * Controller class bindings (separated by context)
     * Format: 'admin' => ['controller_name' => Controller::class]
     *         'api' => ['controller_name' => Controller::class]
     */
    'controllers' => [
        'admin' => [
            'activity' => \Bespoke\Contact\Http\Controllers\Admin\ActivityController::class,
            'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
            'marketing' => \Bespoke\Contact\Http\Controllers\Admin\MarketingController::class,
        ],
        'api' => [
            'contact' => \Bespoke\Contact\Http\Controllers\Api\ContactController::class,
        ],
    ],

    /**
     * Defaults
     *
     * Default values for database migrations/fields
     */
    'defaults' => [
        'phone_prefix' => '+44',
        'mobile_prefix' => '+44',
        'status' => 'pending',
    ],

    /**
     * Export
     *
     * Export handler class binding
     * Format: 'entity' => Export::class
     */
    'export' => [
        'contact' => \Bespoke\Contact\Exports\ContactExport::class,
    ],

    /**
     * Fillable
     *
     * Mass-assignable model attributes
     * Single model: ['field_name']
     * Multi-model: 'model_name' => ['field_name']
     */
    'fillable' => [],

    /**
     * Import
     *
     * Import handler and schema file location
     * Required keys: handler class, schema_file path
     */
    'import' => [
        'contact' => \Bespoke\Contact\Imports\ContactImport::class,
        'schema_file' => file_exists(resource_path('schema').'/contacts.tsv')
            ? resource_path('schema').'/contacts.tsv'
            : __DIR__.'/../resources/schema/contacts.tsv',
    ],

    /**
     * Listeners
     *
     * Event to listener mappings
     * Format: Event::class => [Listener::class]
     */
    'listeners' => [],

    /**
     * Livewire Components
     *
     * Livewire component registrations
     * Format: Component::class => 'component-alias'
     */
    'livewire' => [
        \Bespoke\Contact\Livewire\Admin\ContactAutoComplete::class => 'admin.contact-auto-complete',
        \Bespoke\Contact\Livewire\Admin\ContactBuilder::class => 'admin.contact-builder',
        \Bespoke\Contact\Livewire\Admin\ContactCredentials::class => 'admin.contact-credentials',
        \Bespoke\Contact\Livewire\Admin\ContactDetails::class => 'admin.contact-details',
        \Bespoke\Contact\Livewire\Admin\ContactDataTable::class => 'admin.contact-data-table',
        \Bespoke\Contact\Livewire\Admin\ContactModal::class => 'admin.contact-modal',
        \Bespoke\Contact\Livewire\Admin\ContactModalButton::class => 'admin.contact-modal-button',
    ],

    /**
     * Loggable Fields (Activity Log)
     *
     * Fields to track in activity log
     * Single model: ['field_name']
     * Multi-model: 'model_name' => ['field_name']
     */
    'loggable' => [
        'first_name',
        'last_name',
        'email',
        'phone',
        'phone_prefix',
        'mobile',
        'mobile_prefix',
        'accepted_terms',
        'marketing_emails',
        'notification_emails',
        'notification_sms',
        'status',
    ],

    /**
     * Middlewares
     *
     * Middleware alias registrations
     * Format: 'middleware_name' => Middleware::class
     */
    'middlewares' => [],

    /**
     * Migrations
     *
     * Migration files in publish/run order
     * Format: ['migration_file_name'] (without .php extension)
     */
    'migrations' => [
        'create_contacts_table',
    ],

    /**
     * Models
     *
     * Model class bindings
     * Format: 'model_name' => Model::class
     */
    'models' => [
        'contact' => \Bespoke\Contact\Models\Contact::class,
    ],

    /**
     * Module Details
     *
     * Module system metadata
     */
    'module' => [
        'name' => 'Contact',
        'key' => 'contact',
        'group' => null,
        'icon' => 'contact',
        'status' => 'active',
        'is_visible' => 1,
    ],

    /**
     * Requests (Form Requests)
     *
     * Form request validation classes (separated by context)
     * Format: 'admin' => ['request_name' => Request::class]
     *         'api' => ['request_name' => Request::class]
     */
    'requests' => [
        'admin' => [
            'update_contact' => \Bespoke\Contact\Http\Requests\Admin\UpdateContact::class,
            'update_marketing' => \Bespoke\Contact\Http\Requests\Admin\UpdateMarketing::class,
        ],
        'api' => [
            'store_contact' => \Bespoke\Contact\Http\Requests\Api\StoreContact::class,
            'update_contact' => \Bespoke\Contact\Http\Requests\Api\UpdateContact::class,
        ],
    ],

    /**
     * Resources
     *
     * API resource classes for JSON transformations
     * Format: 'resource_name' => Resource::class
     */
    'resources' => [
        'contact' => \Bespoke\Contact\Http\Resources\ContactResource::class,
        'contact_collection' => \Bespoke\Contact\Http\Resources\ContactCollection::class,
    ],

    /**
     * Responses
     *
     * Response object bindings
     * Format: 'response_name' => Response::class
     */
    'responses' => [],

    /**
     * Route Files
     *
     * Route files to load
     * Available: ['api', 'admin', 'account', 'frontend', 'custom']
     */
    'routes' => [
        'admin',
        'api',
    ],

    /**
     * Route Prefixes
     *
     * URL prefixes for route groups
     */
    'route_prefixes' => [
        'api' => 'contacts',
        'admin' => 'contacts',
    ],

    /**
     * Rules
     *
     * Custom validation rules and field constraints
     * Object rules: 'rule_name' => Rule::class
     * Field rules: 'field_name' => ['constraint' => value]
     */
    'rules' => [
        'unique_contact_email' => \Bespoke\Contact\Rules\UniqueContactEmail::class,
        'first_name' => [
            'max' => 150,
        ],
        'last_name' => [
            'max' => 150,
        ],
        'email' => [
            'max' => 50,
        ],
        'phone' => [
            'max' => 20,
        ],
        'phone_prefix' => [
            'max' => 10,
        ],
        'mobile' => [
            'max' => 20,
        ],
        'mobile_prefix' => [
            'max' => 10,
        ],
    ],
];
```

### 2.2 Nested Structure for Controllers and Requests

Controllers and requests MUST be organised by context:

```php
'controllers' => [
    'admin' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Admin\ContactController::class,
    ],
    'api' => [
        'contact' => \Bespoke\Contact\Http\Controllers\Api\ContactController::class,
    ],
],

'requests' => [
    'admin' => [
        'update_contact' => \Bespoke\Contact\Http\Requests\Admin\UpdateContact::class,
    ],
    'api' => [
        'store_contact' => \Bespoke\Contact\Http\Requests\Api\StoreContact::class,
        'update_contact' => \Bespoke\Contact\Http\Requests\Api\UpdateContact::class,
    ],
],
```
