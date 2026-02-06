### Install Laravel Dusk and Setup

Source: https://laravel.com/docs/10.x/dusk

The `dusk:install` Artisan command initializes Laravel Dusk in your project. It creates necessary directories, an example test, and installs the ChromeDriver binary suitable for your operating system. Ensure your `.env` file has `APP_URL` set.

```shell
php artisan dusk:install
```

--------------------------------

### Manually Control Database Transactions in Laravel

Source: https://laravel.com/docs/10.x/database

Provides examples of manually starting, rolling back, and committing database transactions using the `DB` facade. This approach offers granular control over the transaction lifecycle, suitable for complex scenarios.

```php
use Illuminate\Support\Facades\DB;

DB::beginTransaction();

// Perform database operations...

DB::rollBack();

// Or commit:
DB::commit();
```

--------------------------------

### Parallel Testing Setup Hooks (PHP)

Source: https://laravel.com/docs/10.x/testing

Implement custom logic for parallel testing setup and teardown using the `ParallelTesting` facade. This allows for actions like seeding databases or setting up test-specific resources on a per-process or per-test-case basis.

```php
<?php

namespace App\Providers;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\ParallelTesting;
use Illuminate\Support\ServiceProvider;
use PHPUnit\Framework\TestCase;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        ParallelTesting::setUpProcess(function (int $token) {
            // ...
        });

        ParallelTesting::setUpTestCase(function (int $token, TestCase $testCase) {
            // ...
        });

        // Executed when a test database is created...
        ParallelTesting::setUpTestDatabase(function (string $database, int $token) {
            Artisan::call('db:seed');
        });

        ParallelTesting::tearDownTestCase(function (int $token, TestCase $testCase) {
            // ...
        });

        ParallelTesting::tearDownProcess(function (int $token) {
            // ...
        });
    }
}

```

--------------------------------

### Install and Run Parallel Tests

Source: https://laravel.com/docs/10.x/testing

Install the `brianium/paratest` package for parallel test execution and run tests concurrently using the `--parallel` option with the Artisan `test` command. This significantly reduces test execution time.

```shell
composer require brianium/paratest --dev

php artisan test --parallel

```

--------------------------------

### Run Laravel Breeze Installation and Setup

Source: https://laravel.com/docs/10.x/starter-kits

Executes the 'breeze:install' Artisan command to publish authentication resources. It also includes commands to run database migrations, install npm dependencies, and compile frontend assets.

```shell
php artisan breeze:install

php artisan migrate
npm install
npm run dev
```

--------------------------------

### Create New Laravel Project using Laravel Installer

Source: https://laravel.com/docs/10.x/index

This method first installs the Laravel installer globally via Composer, then uses the 'laravel new' command to create a new project named 'example-app'. This provides a convenient way to scaffold new Laravel applications.

```bash
composer global require laravel/installer
laravel new example-app
```

--------------------------------

### Show Table Overview using Artisan

Source: https://laravel.com/docs/10.x/database

Explains how to use the `php artisan db:table <table_name>` command to get detailed information about a specific database table, including its columns, types, attributes, keys, and indexes.

```shell
php artisan db:table users
```

--------------------------------

### Basic PHPUnit Test Example

Source: https://laravel.com/docs/10.x/testing

A fundamental example of a unit test using PHPUnit in Laravel. This test verifies a simple assertion, demonstrating the basic structure of a test method within a PHPUnit test class.

```php
<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_basic_test(): void
    {
        $this->assertTrue(true);
    }
}
```

--------------------------------

### Start Laravel Development Server

Source: https://laravel.com/docs/10.x/index

After creating the project, this command navigates into the project directory and starts Laravel's local development server using Artisan. The application will then be accessible at http://localhost:8000.

```bash
cd example-app
php artisan serve
```

--------------------------------

### Run Laravel Boost Interactive Installer

Source: https://laravel.com/docs/10.x/index

After installing Laravel Boost via Composer, this Artisan command initiates an interactive installer. The installer auto-detects your IDE and AI agents, allowing you to opt into specific features and configure Boost according to your project's conventions.

```bash
php artisan boost:install
```

--------------------------------

### Start Laravel Sail Application (macOS/Windows)

Source: https://laravel.com/docs/10.x/index

After navigating into the newly created Laravel project directory ('example-app'), this command starts the Docker containers defined by Sail. These containers provide the necessary environment (PHP, MySQL, Redis) for your Laravel application. Access your application at http://localhost.

```bash
cd example-app
./vendor/bin/sail up
```

--------------------------------

### Create New Laravel 10 Project with Composer or Installer

Source: https://context7.com/context7/laravel_10_x/llms.txt

This snippet shows how to create a new Laravel 10 project using Composer's create-project command or the Laravel installer. It also includes the command to start the development server.

```bash
# Using Composer create-project
composer create-project "laravel/laravel:^10.0" example-app

# Or using the Laravel installer
composer global require laravel/installer
laravel new example-app

# Start the development server
cd example-app
php artisan serve
```

--------------------------------

### Docker Installation with Laravel Sail

Source: https://context7.com/context7/laravel_10_x/llms.txt

This shows how to install Laravel with Docker using Laravel Sail. It includes commands to create a project with default services or custom services, and how to start the Sail containers.

```bash
# Create project with Sail (includes MySQL, Redis, Meilisearch, Mailpit, Selenium)
curl -s "https://laravel.build/example-app" | bash

# Specify custom services
curl -s "https://laravel.build/example-app?with=mysql,redis" | bash

# Start Sail containers
cd example-app
./vendor/bin/sail up
```

--------------------------------

### User Observer Class Example

Source: https://laravel.com/docs/10.x/eloquent

A basic User Observer class demonstrating how to handle various Eloquent model events such as 'created', 'updated', 'deleted', 'restored', and 'forceDeleted'. Each method receives the affected User model as an argument.

```php
<?php

namespace App\Observers;

use App\Models\User;

class UserObserver
{
    /**
     * Handle the User "created" event.
     */
    public function created(User $user): void
    {
        // ...
    }

    /**
     * Handle the User "updated" event.
     */
    public function updated(User $user): void
    {
        // ...
    }

    /**
     * Handle the User "deleted" event.
     */
    public function deleted(User $user): void
    {
        // ...
    }
    
    /**
     * Handle the User "restored" event.
     */
    public function restored(User $user): void
    {
        // ...
    }

    /**
     * Handle the User "forceDeleted" event.
     */
    public function forceDeleted(User $user): void
    {
        // ...
    }
}
```

--------------------------------

### Start Laravel Sail Application

Source: https://laravel.com/docs/10.x/installation

After navigating to the newly created Laravel project directory, this command starts the application's Docker containers using Laravel Sail. This makes the application accessible via a web browser.

```shell
cd example-app

./vendor/bin/sail up
```

--------------------------------

### Report Test Coverage with Artisan

Source: https://laravel.com/docs/10.x/testing

Generate a test coverage report by including the `--coverage` option when running the Artisan `test` command. This feature requires Xdebug or PCOV to be installed.

```shell
php artisan test --coverage

```

--------------------------------

### Connect to Database CLI using Artisan

Source: https://laravel.com/docs/10.x/database

Illustrates how to use the `php artisan db` command to connect to your database's command-line interface. It also shows how to specify a particular database connection if you have multiple configured.

```shell
php artisan db
php artisan db mysql
```

--------------------------------

### Define Setup Block in Envoy

Source: https://laravel.com/docs/10.x/envoy

This example illustrates using the `@setup` directive to execute arbitrary PHP code before Envoy tasks run. It demonstrates initializing a DateTime object, which can then be used within task commands or for logic.

```php
@setup
    $now = new DateTime;
@endsetup
```

--------------------------------

### Nginx Server Configuration for Laravel

Source: https://laravel.com/docs/10.x/deployment

This Nginx configuration serves as a starting point for deploying a Laravel application. It directs all requests to the `public/index.php` file and includes security headers. Ensure this configuration is adapted to your specific server setup.

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name example.com;
    root /srv/example.com/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

--------------------------------

### Run Laravel Tests with Artisan

Source: https://laravel.com/docs/10.x/testing

Execute tests using Laravel's Artisan `test` command. This command provides verbose reports and supports passing arguments to PHPUnit.

```shell
php artisan test

```

--------------------------------

### Show Database Overview using Artisan

Source: https://laravel.com/docs/10.x/database

Demonstrates the `php artisan db:show` command for inspecting the overall status of your database, including size, type, connections, and a summary of tables. It also shows how to specify a database connection and include table row counts and view details.

```shell
php artisan db:show
php artisan db:show --database=pgsql
php artisan db:show --counts --views
```

--------------------------------

### Get Raw PDO Instance - Laravel

Source: https://laravel.com/docs/10.x/database

Retrieve the underlying raw PDO instance for the default database connection using the DB facade. This allows for direct interaction with PDO if necessary.

```php
use Illuminate\Support\Facades\DB;

$pdo = DB::connection()->getPdo();
```

--------------------------------

### Create New Laravel Project using Composer

Source: https://laravel.com/docs/10.x/index

This command creates a new Laravel project named 'example-app' using Composer. It ensures you have the latest version of Laravel 10.x installed. Composer handles dependency management for the project.

```bash
composer create-project "laravel/laravel:^10.0" example-app
```

--------------------------------

### Insert New Records with Model Instance and save Method

Source: https://laravel.com/docs/10.x/eloquent

To insert a new record, instantiate a new Eloquent model, set its attributes, and then call the `save` method. Timestamps (`created_at`, `updated_at`) are automatically managed. This example assumes a `Flight` model and an incoming `Request`.

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Flight;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class FlightController extends Controller
{
    /**
     * Store a new flight in the database.
     */
    public function store(Request $request): RedirectResponse
    {
        // Validate the request...

        $flight = new Flight;

        $flight->name = $request->name;

        $flight->save();

        return redirect('/flights');
    }
}
```

--------------------------------

### Run PHPUnit Tests

Source: https://laravel.com/docs/10.x/testing

Execute all tests using the PHPUnit framework directly. This is the default method for running tests in Laravel.

```shell
./vendor/bin/phpunit

```

--------------------------------

### Utilize Dynamic Eloquent Scopes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Call dynamic scopes by passing the required arguments to the scope method. This example queries for users of the 'admin' type.

```php
$users = User::ofType('admin')->get();
```

--------------------------------

### Build Custom Queries for Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Construct custom database queries using Eloquent models as query builders. Chain methods like `where`, `orderBy`, and `take` to define constraints, then use `get` to retrieve the results.

```php
$flights = Flight::where('active', 1)
               ->orderBy('name')
               ->take(10)
               ->get();
```

--------------------------------

### Install Laravel MCP via Composer

Source: https://laravel.com/docs/10.x/mcp

Installs the Laravel MCP package into your project using the Composer package manager. This is the initial step to start using MCP's features.

```shell
composer require laravel/mcp
```

--------------------------------

### Install and Configure Valet

Source: https://laravel.com/docs/10.x/valet

Executes the Valet installation command. This command configures Valet, DnsMasq, and sets up the necessary services to launch on system startup.

```shell
valet install
```

--------------------------------

### Install Laravel Breeze with Livewire Stack

Source: https://laravel.com/docs/10.x/starter-kits

Installs Laravel Breeze with Livewire scaffolding for building dynamic UIs. This involves selecting the Livewire option during 'breeze:install' and running database migrations.

```shell
php artisan breeze:install

php artisan migrate
```

--------------------------------

### Start a Process Asynchronously in PHP

Source: https://laravel.com/docs/10.x/processes

The `start` method initiates a process asynchronously, allowing the application to continue execution while the process runs in the background. This is useful for non-blocking operations. `bash import.sh` is used as an example, with a timeout set.

```php
$process = Process::timeout(120)->start('bash import.sh');

while ($process->running()) {
    // ...
}

$result = $process->wait();
```

--------------------------------

### Create New Laravel Project with Sail (Shell)

Source: https://laravel.com/docs/10.x/installation

Creates a new Laravel project named 'example-app' using the Sail installer. This command fetches the project scaffolding and sets up the necessary Docker environment. The application name can be customized, but must adhere to specific naming conventions.

```shell
docker context use default
curl -s https://laravel.build/example-app | bash
```

--------------------------------

### Create New Laravel Project with Sail (macOS)

Source: https://laravel.com/docs/10.x/index

This command fetches a script from laravel.build to create a new Laravel project named 'example-app'. It then executes the script using bash. Ensure Docker Desktop is installed and running. The application directory will be created in the current location.

```bash
curl -s "https://laravel.build/example-app" | bash
```

--------------------------------

### Combine Eloquent Scopes with OR (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Combine Eloquent scopes using `orWhere` with closures for correct logical grouping. This example shows combining 'popular' and 'active' scopes.

```php
$users = User::popular()->orWhere(function (Builder $query) {
    $query->active();
})->get();
```

--------------------------------

### Restore a Soft Deleted Eloquent Model

Source: https://laravel.com/docs/10.x/eloquent

This example demonstrates how to restore a single soft-deleted Eloquent model by calling the `restore` method. This action sets the `deleted_at` column back to null. It operates on a model instance.

```php
$flight->restore();
```

--------------------------------

### Install Laravel Breeze Package

Source: https://laravel.com/docs/10.x/starter-kits

Installs the Laravel Breeze package using Composer. This is the first step before running the installation command. It's a development dependency.

```shell
composer require laravel/breeze --dev
```

--------------------------------

### Define Dynamic Eloquent Scopes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Create dynamic scopes that accept parameters by adding them to the scope method's signature after the `$query` parameter. This example defines a scope to filter users by type.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * Scope a query to only include users of a given type.
     */
    public function scopeOfType(Builder $query, string $type): void
    {
        $query->where('type', $type);
    }
}
```

--------------------------------

### Confirm Stripe Card Setup with JavaScript

Source: https://laravel.com/docs/10.x/billing

Confirms the card setup initiated by Stripe.js, securely gathering payment method details from the user. This JavaScript code handles user input, retrieves the client secret from a data attribute, and uses Stripe's `confirmCardSetup` method to get a payment method identifier or display errors.

```javascript
const cardHolderName = document.getElementById('card-holder-name');
const cardButton = document.getElementById('card-button');
const clientSecret = cardButton.dataset.secret;

cardButton.addEventListener('click', async (e) => {
    const { setupIntent, error } = await stripe.confirmCardSetup(
        clientSecret, {
            payment_method: {
                card: cardElement,
                billing_details: { name: cardHolderName.value }
            }
        }
    );

    if (error) {
        // Display "error.message" to the user...
    } else {
        // The card has been verified successfully...
    }
});
```

--------------------------------

### Configure Read/Write Database Connections (PHP)

Source: https://laravel.com/docs/10.x/database

This configuration defines separate hosts for read and write database operations. The 'sticky' option ensures that writes within a request cycle are immediately readable. Other connection details are merged from the main connection configuration.

```php
'mysql' => [
    'read' => [
        'host' => [
            '192.168.1.1',
            '196.168.1.2',
        ],
    ],
    'write' => [
        'host' => [
            '196.168.1.3',
        ],
    ],
    'sticky' => true,
    'driver' => 'mysql',
    'database' => 'database',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix' => '',
]
```

--------------------------------

### Monitor Database Connections with Artisan Command

Source: https://laravel.com/docs/10.x/database

This command monitors specified database connections for exceeding a maximum number of open connections. It dispatches a `DatabaseBusy` event when the threshold is met. It requires the `db:monitor` Artisan command to be scheduled and run regularly.

```shell
php artisan db:monitor --databases=mysql,pgsql --max=100
```

--------------------------------

### Execute Insert Statement - Laravel

Source: https://laravel.com/docs/10.x/database

Run an INSERT SQL statement using the DB facade. This method accepts the SQL query string and an array of values to bind to the query parameters. Ensure the 'use Illuminate\Support\Facades\DB;' statement is included.

```php
use Illuminate\Support\Facades\DB;

DB::insert('insert into users (id, name) values (?, ?)', [1, 'Marc']);
```

--------------------------------

### Execute General SQL Statement - Laravel

Source: https://laravel.com/docs/10.x/database

Run general SQL statements that do not return a value, such as DDL commands, using the DB facade's statement method. This method is suitable for operations like dropping tables.

```php
DB::statement('drop table users');
```

--------------------------------

### Listen for Query Events - Laravel Service Provider

Source: https://laravel.com/docs/10.x/database

Register a listener for all SQL queries executed by the application using the DB facade's listen method. This is useful for logging or debugging queries. The listener is typically registered in a service provider's boot method.

```php
<?php

namespace App\Providers;

use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // ...
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        DB::listen(function (QueryExecuted $query) {
            // $query->sql;
            // $query->bindings;
            // $query->time;
        });
    }
}
```

--------------------------------

### Install Laravel Boost Development Dependency

Source: https://laravel.com/docs/10.x/index

This Composer command installs Laravel Boost as a development dependency in your Laravel application. Boost requires Laravel 10, 11, or 12 and PHP 8.1 or higher. It enhances AI agents with Laravel-specific context and tools.

```bash
composer require laravel/boost --dev
```

--------------------------------

### Manage Database Transactions with Laravel

Source: https://laravel.com/docs/10.x/database

Demonstrates how to execute a series of database operations within a transaction using Laravel's `DB::transaction` method. This method automatically handles committing the transaction on success and rolling back on exceptions.

```php
use Illuminate\Support\Facades\DB;

DB::transaction(function () {
    DB::update('update users set votes = 1');

    DB::delete('delete from posts');
});
```

--------------------------------

### Create Laravel Project with Custom Sail Services

Source: https://laravel.com/docs/10.x/index

This command allows for the creation of a new Laravel project while specifying desired Sail services (e.g., MySQL, Redis) using the 'with' query parameter. If no services are specified, a default stack is configured. The application name 'example-app' can be modified.

```bash
curl -s "https://laravel.build/example-app?with=mysql,redis" | bash
```

--------------------------------

### Access Specific Database Connection - Laravel

Source: https://laravel.com/docs/10.x/database

Connect to a specific database defined in the configuration file using the DB facade's connection method. This allows managing multiple database connections within a Laravel application.

```php
use Illuminate\Support\Facades\DB;

$users = DB::connection('sqlite')->select(/* ... */);
```

--------------------------------

### Run a Basic SELECT Query (PHP)

Source: https://laravel.com/docs/10.x/database

Executes a raw SQL SELECT query with parameter binding to fetch active users. It returns an array of stdClass objects, each representing a database record. Parameter binding protects against SQL injection.

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show a list of all of the application's users.
     */
    public function index(): View
    {
        $users = DB::select('select * from users where active = ?', [1]);

        return view('user.index', ['users' => $users]);
    }
}

```

--------------------------------

### Retrieve All Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Fetch all records from a model's associated database table using the `all` method. This method returns a collection of model instances.

```php
use App\Models\Flight;

foreach (Flight::all() as $flight) {
    echo $flight->name;
}
```

--------------------------------

### Customize Timestamp Format in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Control the storage format and serialization format of date attributes by setting the `$dateFormat` property on your Eloquent model. The example uses 'U' for a Unix timestamp format.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The storage format of the model's date columns.
     *
     * @var string
     */
    protected $dateFormat = 'U';
}
```

--------------------------------

### Create Subscription After Trial (PHP)

Source: https://laravel.com/docs/10.x/billing

This example illustrates how to create a new subscription for a user after they have gone through a trial period. It uses the `newSubscription` method and requires a valid payment method.

```PHP
$user = User::find(1);

$user->newSubscription('default', 'price_monthly')->create($paymentMethod);
```

--------------------------------

### Create New Laravel Project with Sail (Windows WSL2)

Source: https://laravel.com/docs/10.x/index

This command is similar to the macOS version but is intended for use within a WSL2 environment on Windows. It downloads and executes a script to set up a new Laravel project. Ensure Docker Desktop and WSL2 are installed and configured correctly.

```bash
curl -s https://laravel.build/example-app | bash
```

--------------------------------

### Install Octane and FrankenPHP via Laravel Sail

Source: https://laravel.com/docs/10.x/octane

Installs Laravel Octane and FrankenPHP when using Laravel Sail. This involves starting Sail, requiring the Octane package, and then installing Octane with the FrankenPHP server specified.

```shell
./vendor/bin/sail up
./vendor/bin/sail composer require laravel/octane
./vendor/bin/sail artisan octane:install --server=frankenphp
```

--------------------------------

### Define Eloquent Local Scopes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Define reusable query constraints within an Eloquent model by prefixing methods with `scope`. These scopes should return a query builder instance or void. This example shows scopes for 'popular' and 'active' users.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * Scope a query to only include popular users.
     */
    public function scopePopular(Builder $query): void
    {
        $query->where('votes', '>', 100);
    }

    /**
     * Scope a query to only include active users.
     */
    public function scopeActive(Builder $query): void
    {
        $query->where('active', 1);
    }
}
```

--------------------------------

### Fill Eloquent Model Instance - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Illustrates populating an existing Eloquent model instance with attributes using the `fill` method. Similar to `create`, this method respects the model's `$fillable` or `$guarded` properties.

```php
$flight->fill(['name' => 'Amsterdam to Frankfurt']);
```

--------------------------------

### Execute Select Query with Named Bindings - Laravel

Source: https://laravel.com/docs/10.x/database

Execute a SELECT SQL query using named bindings instead of positional placeholders. This method is part of the Laravel DB facade and requires an SQL string and an array of bindings.

```php
$results = DB::select('select * from users where id = :id', ['id' => 1]);
```

--------------------------------

### Basic Usage of Laravel Pail

Source: https://laravel.com/docs/10.x/logging

Demonstrates the basic command to start tailing log files in real-time using Laravel Pail. It also shows options for increasing output verbosity.

```bash
php artisan pail

php artisan pail -v

php artisan pail -vv
```

--------------------------------

### Configure Database Connection Using URL - Laravel

Source: https://laravel.com/docs/10.x/database

This snippet demonstrates how Laravel can use a single database URL to configure connection details, simplifying configuration by consolidating driver, username, password, host, port, database name, and options into one string. This is useful for managed database services.

```html
mysql://root:password@127.0.0.1/forge?charset=UTF-8
```

```html
driver://username:password@host:port/database?options
```

--------------------------------

### Create Table with Unprepared Statement (Implicit Commit Warning) - Laravel

Source: https://laravel.com/docs/10.x/database

Demonstrates using an unprepared statement to create a database table. Such statements can cause implicit commits within transactions, leading to unexpected behavior. Use with caution.

```php
DB::unprepared('create table a (col varchar(1) null)');
```

--------------------------------

### Utilize Eloquent Local Scopes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Call defined Eloquent scopes directly on the model without the `scope` prefix. Scopes can be chained for complex queries. This example demonstrates calling `popular` and `active` scopes and chaining an `orderBy` clause.

```php
use App\Models\User;

$users = User::popular()->active()->orderBy('created_at')->get();
```

--------------------------------

### GitHub Actions Configuration for Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet outlines the configuration for running Laravel Dusk tests using GitHub Actions. It sets up the environment, creates a database, installs dependencies, generates keys, configures the Chrome driver, starts the Laravel server, and executes Dusk tests, with options to upload artifacts on failure.

```yaml
name: CI
on: [push]
jobs:

  dusk-php:
    runs-on: ubuntu-latest
    env:
      APP_URL: "http://127.0.0.1:8000"
      DB_USERNAME: root
      DB_PASSWORD: root
      MAIL_MAILER: log
    steps:
      - uses: actions/checkout@v4
      - name: Prepare The Environment
        run: cp .env.example .env
      - name: Create Database
        run: |
          sudo systemctl start mysql
          mysql --user="root" --password="root" -e "CREATE DATABASE `my-database` character set UTF8mb4 collate utf8mb4_bin;"
      - name: Install Composer Dependencies
        run: composer install --no-progress --prefer-dist --optimize-autoloader
      - name: Generate Application Key
        run: php artisan key:generate
      - name: Upgrade Chrome Driver
        run: php artisan dusk:chrome-driver --detect
      - name: Start Chrome Driver
        run: ./vendor/laravel/dusk/bin/chromedriver-linux &
      - name: Run Laravel Server
        run: php artisan serve --no-reload &
      - name: Run Dusk Tests
        run: php artisan dusk
      - name: Upload Screenshots
        if: failure()
        uses: actions/upload-artifact@v2
        with:
          name: screenshots
          path: tests/Browser/screenshots
      - name: Upload Console Logs
        if: failure()
        uses: actions/upload-artifact@v2
        with:
          name: console
          path: tests/Browser/console
```

--------------------------------

### Recreate Test Databases for Parallel Runs

Source: https://laravel.com/docs/10.x/testing

Force the recreation of test databases for parallel testing runs using the `--recreate-databases` option with the Artisan `test` command. This ensures a clean database state for each test session.

```shell
php artisan test --parallel --recreate-databases

```

--------------------------------

### Execute Unprepared SQL Statement - Laravel

Source: https://laravel.com/docs/10.x/database

Execute SQL statements directly without binding values using the DB facade's unprepared method. Caution: This method is vulnerable to SQL injection if user-controlled data is used.

```php
DB::unprepared('update users set votes = 100 where name = "Dries"');
```

--------------------------------

### Permanently Delete Soft Deleted Models in Relationship

Source: https://laravel.com/docs/10.x/eloquent

This example shows how to permanently delete soft-deleted models within an Eloquent relationship using the `forceDelete` method on the relationship instance. This is useful for completely removing related data.

```php
$flight->history()->forceDelete();
```

--------------------------------

### Advanced Subquery Ordering with Eloquent (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This example shows how to use the query builder's `orderBy` function with a subquery to sort records based on data from a related table. It sorts destinations by the arrival time of the last flight. This allows for complex sorting logic within a single database query.

```php
use App\Models\Destination;
use App\Models\Flight;

return Destination::orderByDesc(
    Flight::select('arrived_at')
        ->whereColumn('destination_id', 'destinations.id')
        ->orderByDesc('arrived_at')
        ->limit(1)
)->get();
```

--------------------------------

### Run Parallel Tests with Specific Processes

Source: https://laravel.com/docs/10.x/testing

Control the number of parallel test processes by specifying the `--processes` option when using the Artisan `test` command with the `--parallel` flag. This allows for resource management.

```shell
php artisan test --parallel --processes=4

```

--------------------------------

### Generate Unit and Feature Tests with Artisan

Source: https://laravel.com/docs/10.x/testing

Use the `make:test` Artisan command to generate new test files. Specify the `--unit` flag to create a unit test in the `tests/Unit` directory, otherwise, it defaults to `tests/Feature`.

```shell
php artisan make:test UserTest
php artisan make:test UserTest --unit
```

--------------------------------

### Install Laravel Pennant with Composer

Source: https://laravel.com/docs/10.x/pennant

Installs the Laravel Pennant package into your project using the Composer package manager. This is the first step to start using feature flags in your Laravel application.

```shell
composer require laravel/pennant
```

--------------------------------

### Include Soft Deleted Models in Relationship Query

Source: https://laravel.com/docs/10.x/eloquent

This example demonstrates how to include soft-deleted models when querying an Eloquent relationship using the `withTrashed` method. This allows access to related records that might have been soft deleted. It is called on the relationship instance.

```php
$flight->history()->withTrashed()->get();
```

--------------------------------

### Create Laravel Project with Devcontainer Support

Source: https://laravel.com/docs/10.x/index

This command creates a new Laravel project with specified Sail services and also includes the 'devcontainer' parameter, enabling the installation of a default Devcontainer. This is useful for integrating with containerized development environments.

```bash
curl -s "https://laravel.build/example-app?with=mysql,redis&devcontainer" | bash
```

--------------------------------

### Retrieve Single Eloquent Models (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates methods for retrieving single Eloquent model instances instead of collections. Includes `find` by primary key, `first` to get the first matching record, and `firstWhere` as an alternative. These methods return a single model or null if no record is found.

```php
use App\Models\Flight;

// Retrieve a model by its primary key...
$flight = Flight::find(1);

// Retrieve the first model matching the query constraints...
$flight = Flight::where('active', 1)->first();

// Alternative to retrieving the first model matching the query constraints...
$flight = Flight::firstWhere('active', 1);
```

--------------------------------

### Create User Observer Artisan Command

Source: https://laravel.com/docs/10.x/eloquent

This command generates a new observer class for the User model. It creates the observer file in the app/Observers directory, creating the directory if it doesn't exist.

```shell
php artisan make:observer UserObserver --model=User
```

--------------------------------

### Test Prompts and Resources

Source: https://laravel.com/docs/10.x/mcp

Provides examples of how to test prompts and resources using the `WeatherServer`. These snippets show the basic invocation syntax for testing these components.

```php
$response = WeatherServer::prompt(...);
$response = WeatherServer::resource(...);
```

--------------------------------

### Examine Eloquent Model Attribute Changes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This example shows how to inspect the state of Eloquent model attributes using `isDirty`, `isClean`, and `wasChanged`. These methods help determine if attributes have been modified since the model was retrieved or last saved. They can be used for individual attributes or arrays of attributes.

```php
use App\Models\User;

$user = User::create([
    'first_name' => 'Taylor',
    'last_name' => 'Otwell',
    'title' => 'Developer',
]);

$user->title = 'Painter';

$user->isDirty(); // true
$user->isDirty('title'); // true
$user->isDirty('first_name'); // false
$user->isDirty(['first_name', 'title']); // true

$user->isClean(); // false
$user->isClean('title'); // false
$user->isClean('first_name'); // true
$user->isClean(['first_name', 'title']); // false

$user->save();

$user->isDirty(); // false
$user->isClean(); // true

$user->wasChanged(); // true
$user->wasChanged('title'); // true
$user->wasChanged(['title', 'slug']); // true
$user->wasChanged('first_name'); // false
$user->wasChanged(['first_name', 'title']); // true
```

--------------------------------

### Monitor Long Database Queries with Laravel

Source: https://laravel.com/docs/10.x/database

This snippet shows how to use the `whenQueryingForLongerThan` method in Laravel to detect and react to database queries that exceed a specified time threshold. It's typically placed in the `boot` method of a service provider.

```php
<?php

namespace App\Providers;

use Illuminate\Database\Connection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Events\QueryExecuted;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // ...
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        DB::whenQueryingForLongerThan(500, function (Connection $connection, QueryExecuted $event) {
            // Notify development team...
        });
    }
}
```

--------------------------------

### Install Laravel Folio

Source: https://laravel.com/docs/10.x/folio

Install the Laravel Folio package using Composer. After installation, run the `folio:install` Artisan command to register Folio's service provider, which configures the directory for searching page routes.

```bash
composer require laravel/folio
php artisan folio:install
```

--------------------------------

### Execute Specific PHP Versions via CLI

Source: https://laravel.com/docs/10.x/homestead

This example shows how to execute specific PHP versions from the command line within the Homestead virtual machine. It lists commands for accessing different installed PHP versions like php5.6, php7.0, etc., followed by an Artisan command.

```shell
php5.6 artisan list
php7.0 artisan list
php7.1 artisan list
php7.2 artisan list
php7.3 artisan list
php7.4 artisan list
php8.0 artisan list
php8.1 artisan list
php8.2 artisan list
php8.3 artisan list
```

--------------------------------

### Basic Controller Example in PHP

Source: https://laravel.com/docs/10.x/controllers

An example of a basic Laravel controller with a 'show' method. This method handles requests for a user's profile, fetches the user by ID, and returns a view. It demonstrates dependency on Eloquent Models and the View component.

```php
<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show the profile for a given user.
     */
    public function show(string $id): View
    {
        return view('user.profile', [
            'user' => User::findOrFail($id)
        ]);
    }
}
```

--------------------------------

### Configure SQLite Database Connection - Laravel

Source: https://laravel.com/docs/10.x/database

This snippet shows how to configure a SQLite database connection in Laravel using environment variables. It specifies the database connection type and the absolute path to the SQLite database file. It also demonstrates how to enable foreign key constraints.

```ini
DB_CONNECTION=sqlite
DB_DATABASE=/absolute/path/to/database.sqlite
```

```ini
DB_FOREIGN_KEYS=true
```

--------------------------------

### Install Laravel Pail

Source: https://laravel.com/docs/10.x/logging

Provides the Composer command to install Laravel Pail, a package for tailing log files in real-time directly from the command line. It specifies the required PHP version and PCNTL extension.

```bash
composer require laravel/pail
```

--------------------------------

### Install Octane and RoadRunner via Laravel Sail

Source: https://laravel.com/docs/10.x/octane

Commands to install Laravel Octane and RoadRunner components using Laravel Sail. This involves starting Sail, requiring the necessary Composer packages, and then entering a Sail shell to download the RoadRunner binary.

```shell
./vendor/bin/sail up

./vendor/bin/sail composer require laravel/octane spiral/roadrunner-cli spiral/roadrunner-http 
```

--------------------------------

### Create Stripe Setup Intent in Laravel

Source: https://laravel.com/docs/10.x/billing

Generates a Stripe Setup Intent for securely collecting customer payment method details for future use, such as subscriptions. This method is part of Laravel's Billable trait and should be called from a route or controller rendering a payment form.

```php
return view('update-payment-method', [
    'intent' => $user->createSetupIntent()
]);
```

--------------------------------

### Run Laravel Tests with PHPUnit Arguments

Source: https://laravel.com/docs/10.x/testing

Pass arguments to the underlying PHPUnit command via the Artisan `test` command. This allows for fine-grained control over test execution, such as specifying test suites or stopping on failure.

```shell
php artisan test --testsuite=Feature --stop-on-failure

```

--------------------------------

### Install Flysystem Path Prefixing Package

Source: https://laravel.com/docs/10.x/filesystem

Installs the Flysystem Path Prefixing package via Composer, enabling the creation of scoped filesystem disks.

```shell
composer require league/flysystem-path-prefixing "^3.0"
```

--------------------------------

### Get Characters from Start of String with Str::take (PHP)

Source: https://laravel.com/docs/10.x/strings

The Str::take method returns a specified number of characters from the beginning of a string. It's a concise way to get a prefix or truncate a string from the left.

```php
use Illuminate\Support\Str;

$taken = Str::take('Build something amazing!', 5);

// Build
```

--------------------------------

### Generate a Global Scope with Artisan

Source: https://laravel.com/docs/10.x/eloquent

This command generates a new global scope class in the `app/Models/Scopes` directory, implementing the `IlluminateDatabaseEloquentScope` interface.

```shell
php artisan make:scope AncientScope
```

--------------------------------

### Dockerfile for FrankenPHP with Laravel Octane

Source: https://laravel.com/docs/10.x/octane

This Dockerfile sets up a FrankenPHP environment for a Laravel application. It installs the 'pcntl' PHP extension and copies the application code into the container. The entrypoint is configured to start Octane with FrankenPHP.

```dockerfile
FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...

COPY . /app

ENTRYPOINT ["php", "artisan", "octane:frankenphp"]
```

--------------------------------

### Run Laravel Reverb Installation Command

Source: https://laravel.com/docs/10.x/reverb

Publishes Reverb's configuration, adds necessary environment variables, and enables event broadcasting in your Laravel application.

```sh
php artisan reverb:install
```

--------------------------------

### Create a Simple Process Pipeline with an Array of Commands in PHP

Source: https://laravel.com/docs/10.x/processes

A process pipeline can be created more simply by passing an array of command strings directly to the `pipe` method. This is useful when individual process customization is not required. `cat example.txt` and `grep -i "laravel"` are used as examples.

```php
$result = Process::pipe([
    'cat example.txt',
    'grep -i "laravel",
]);
```

--------------------------------

### Generate Eloquent Model with Artisan - Laravel

Source: https://laravel.com/docs/10.x/eloquent

This command generates a new Eloquent model class in the `app\Models` directory. It extends the `Illuminate\Database\Eloquent\Model` class. The `--migration` flag can be used to simultaneously generate a database migration file.

```shell
php artisan make:model Flight
```

```shell
php artisan make:model Flight --migration
```

--------------------------------

### Password prompt with placeholder and hint (PHP)

Source: https://laravel.com/docs/10.x/prompts

This PHP example shows how to configure the `password` prompt with a placeholder and a hint. These options help guide the user on expected input format or requirements, such as minimum password length, enhancing usability for sensitive data entry.

```php
$password = password(
    label: 'What is your password?',
    placeholder: 'password',
    hint: 'Minimum 8 characters.'
);
```

--------------------------------

### Travis CI Configuration for Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet configures Travis CI to run Laravel Dusk tests. It includes installing Chrome, setting up PHP, generating an application key, downloading the Chrome driver, and starting necessary services before executing Dusk tests.

```yaml
language: php

php:
  - 7.3

addons:
  chrome: stable

install:
  - cp .env.testing .env
  - travis_retry composer install --no-interaction --prefer-dist
  - php artisan key:generate
  - php artisan dusk:chrome-driver

before_script:
  - google-chrome-stable --headless --disable-gpu --remote-debugging-port=9222 http://localhost &
  - php artisan serve --no-reload &

script:
  - php artisan dusk
```

--------------------------------

### Install Laravel Fortify

Source: https://laravel.com/docs/10.x/fortify

Installs the Laravel Fortify package using Composer. This is the first step to integrating Fortify into your Laravel application for backend authentication.

```shell
composer require laravel/fortify
```

--------------------------------

### Setting up Laravel Database Queue Driver

Source: https://laravel.com/docs/10.x/queues

Provides Artisan commands to create the necessary database table for the database queue driver and migrate the database. It also shows how to configure the .env file.

```shell
php artisan queue:table

php artisan migrate
```

```dotenv
QUEUE_CONNECTION=database
```

--------------------------------

### Generate Pest PHP Tests with Artisan

Source: https://laravel.com/docs/10.x/testing

To generate tests using the Pest PHP framework, include the `--pest` option with the `make:test` Artisan command. This can be combined with the `--unit` flag for unit tests.

```shell
php artisan make:test UserTest --pest
php artisan make:test UserTest --unit --pest
```

--------------------------------

### Start Laravel Reverb Server

Source: https://laravel.com/docs/10.x/reverb

Use the `reverb:start` Artisan command to launch the Reverb server. By default, it runs on `0.0.0.0:8080`. You can specify custom host and port using `--host` and `--port` options, or by setting `REVERB_SERVER_HOST` and `REVERB_SERVER_PORT` in your `.env` file.

```sh
php artisan reverb:start
```

```sh
php artisan reverb:start --host=127.0.0.1 --port=9000
```

--------------------------------

### Generate Eloquent Model with Related Classes - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates generating an Eloquent model along with associated classes like factories, seeders, controllers, policies, and form requests using the `make:model` Artisan command. Options can be combined for multi-class generation.

```shell
php artisan make:model Flight --factory
php artisan make:model Flight -f
php artisan make:model Flight --seed
php artisan make:model Flight -s
php artisan make:model Flight --controller
php artisan make:model Flight -c
php artisan make:model Flight --controller --resource --requests
php artisan make:model Flight -crR
php artisan make:model Flight --policy
php artisan make:model Flight -mfsc
php artisan make:model Flight --all
php artisan make:model Member --pivot
php artisan make:model Member -p
```

--------------------------------

### Install Laravel Telescope Assets and Run Migrations

Source: https://laravel.com/docs/10.x/telescope

Publishes Telescope's assets and runs the necessary database migrations to store Telescope's data. This command should be run after installing Telescope via Composer.

```shell
php artisan telescope:install

php artisan migrate
```

--------------------------------

### Get All OAuth Scopes (JavaScript)

Source: https://laravel.com/docs/10.x/passport

This JavaScript snippet uses Axios to make a GET request to the /oauth/scopes endpoint. This endpoint returns a list of all scopes defined for your application, which can be used to display available scopes for personal access tokens.

```javascript
axios.get('/oauth/scopes')
    .then(response => {
        console.log(response.data);
    });
```

--------------------------------

### Select Multiple Result Sets (PHP)

Source: https://laravel.com/docs/10.x/database

Allows retrieval of multiple result sets, typically returned from a stored procedure. The results are returned as an array where each element corresponds to a result set.

```php
[$options, $notifications] = DB::selectResultSets(
    "CALL get_user_options_and_notifications(?)", $request->user()->id
);

```

--------------------------------

### Register Observer Manually in Service Provider

Source: https://laravel.com/docs/10.x/eloquent

This method manually registers the UserObserver with the User model within the `boot` method of the `App\Providers\EventServiceProvider`. This is a common and flexible way to manage observer registrations.

```php
use App\Models\User;
use App\Observers\UserObserver;

/**
 * Register any events for your application.
 */
public function boot(): void
{
    User::observe(UserObserver::class);
}
```

--------------------------------

### Execute Update Statement - Laravel

Source: https://laravel.com/docs/10.x/database

Perform an UPDATE SQL statement on existing database records using the DB facade. The method returns the number of affected rows. It takes the SQL query and an array of bindings as arguments.

```php
use Illuminate\Support\Facades\DB;

$affected = DB::update(
    'update users set votes = 100 where name = ?',
    ['Anita']
);
```

--------------------------------

### Enable Database Backups in Homestead.yaml

Source: https://laravel.com/docs/10.x/homestead

This example shows how to enable automatic database backups in Homestead.yaml by adding the 'backup: true' line. This feature is triggered when the 'vagrant destroy' command is executed.

```yaml
backup: true
```

--------------------------------

### Install Laravel Valet Globally

Source: https://laravel.com/docs/10.x/valet

Installs the Laravel Valet Composer package globally. This makes the 'valet' command available system-wide. Assumes Composer is installed and its bin directory is in the system PATH.

```shell
composer global require laravel/valet
```

--------------------------------

### Install Laravel Prompts using Composer

Source: https://laravel.com/docs/10.x/prompts

This command installs the Laravel Prompts package into your existing PHP project using Composer. Ensure Composer is installed and accessible in your environment. This is the primary method for adding prompts to non-Laravel projects.

```shell
composer require laravel/prompts
```

--------------------------------

### Inspect Eloquent Model with Artisan - Laravel

Source: https://laravel.com/docs/10.x/eloquent

This Artisan command provides a detailed overview of a specified Eloquent model, including its attributes and relationships. This is useful for understanding a model's structure without needing to examine its code directly.

```shell
php artisan model:show Flight
```

--------------------------------

### Get All Defined Passport Scopes (PHP)

Source: https://laravel.com/docs/10.x/passport

Demonstrates retrieving all defined scopes as instances of `LaravelPassportScope` using the `Passport::scopes()` method. This provides more detailed information about each scope.

```php
use Laravel\Passport\Passport;

Passport::scopes();
```

--------------------------------

### Text prompt with placeholder, default, and hint (PHP)

Source: https://laravel.com/docs/10.x/prompts

This PHP example shows how to enhance the `text` prompt with additional options. It includes placeholder text, a default value potentially sourced from a user object, and an informational hint to guide the user. This improves the user experience for text input.

```php
$name = text(
    label: 'What is your name?',
    placeholder: 'E.g. Taylor Otwell',
    default: $user?->name,
    hint: 'This will be displayed on your profile.'
);
```

--------------------------------

### Retrieve or Create Models with firstOrCreate and firstOrNew

Source: https://laravel.com/docs/10.x/eloquent

The `firstOrCreate` method retrieves a record or creates a new one if it doesn't exist, merging attributes. `firstOrNew` retrieves a record or instantiates a new model instance without saving it immediately. Both methods require Eloquent models.

```php
use App\Models\Flight;

// Retrieve flight by name or create it if it doesn't exist...
$flight = Flight::firstOrCreate([
    'name' => 'London to Paris'
]);

// Retrieve flight by name or create it with the name, delayed, and arrival_time attributes...
$flight = Flight::firstOrCreate(
    ['name' => 'London to Paris'],
    ['delayed' => 1, 'arrival_time' => '11:30']
);

// Retrieve flight by name or instantiate a new Flight instance...
$flight = Flight::firstOrNew([
    'name' => 'London to Paris'
]);

// Retrieve flight by name or instantiate with the name, delayed, and arrival_time attributes...
$flight = Flight::firstOrNew(
    ['name' => 'Tokyo to Sydney'],
    ['delayed' => 1, 'arrival_time' => '11:30']
);
```

--------------------------------

### Install Laravel Telescope for Local Development Only

Source: https://laravel.com/docs/10.x/telescope

Installs Telescope as a development dependency, suitable for local development environments. Requires manual service provider registration and disabling auto-discovery.

```shell
composer require laravel/telescope --dev

php artisan telescope:install

php artisan migrate
```

--------------------------------

### GET /oauth/clients

Source: https://laravel.com/docs/10.x/passport

Retrieves all OAuth clients associated with the authenticated user. This endpoint is useful for listing clients that can then be edited or deleted.

```APIDOC
## GET /oauth/clients

### Description
Retrieves all OAuth clients for the authenticated user. This is primarily useful for listing all of the user's clients so that they may edit or delete them.

### Method
GET

### Endpoint
/oauth/clients

### Parameters

#### Query Parameters

### Request Example
```js
axios.get('/oauth/clients')
    .then(response => {
        console.log(response.data);
    });
```

### Response
#### Success Response (200)
- **clients** (array) - An array of client objects.
  - **id** (integer) - The unique identifier of the client.
  - **name** (string) - The name of the client.
  - **redirect_uri** (string) - The redirect URI for the client.
  - **secret** (string) - The client secret.
  - **created_at** (datetime) - The timestamp when the client was created.
  - **updated_at** (datetime) - The timestamp when the client was last updated.

#### Response Example
```json
{
  "id": 1,
  "name": "My App",
  "redirect_uri": "http://localhost:8000/callback",
  "secret": "your_client_secret",
  "created_at": "2023-10-27T10:00:00.000Z",
  "updated_at": "2023-10-27T10:00:00.000Z"
}
```
```

--------------------------------

### Assign Keys to Pipeline Processes and Handle Output by Key in PHP

Source: https://laravel.com/docs/10.x/processes

String keys can be assigned to individual processes within a pipeline using the `as` method. These keys are then passed to the output closure, allowing identification of the output's source process. `cat example.txt` and `grep -i "laravel"` are used as examples, with output handled by a key.

```php
$result = Process::pipe(function (Pipe $pipe) {
    $pipe->as('first')->command('cat example.txt');
    $pipe->as('second')->command('grep -i "laravel"');
})->start(function (string $type, string $output, string $key) {
    // ...
});
```

--------------------------------

### Open Laravel Project in VS Code (Windows WSL2)

Source: https://laravel.com/docs/10.x/index

This command, executed from the root directory of your Laravel project within Windows Terminal (using WSL2), opens the project in Visual Studio Code. This assumes you have VS Code installed and configured with the Remote Development extension for WSL.

```bash
code .
```

--------------------------------

### Local Valet Driver Example

Source: https://laravel.com/docs/10.x/valet

This example demonstrates how to create a local Valet driver for a single application by extending an existing driver (e.g., LaravelValetDriver). It overrides the 'serves' method to always return true and modifies the 'frontControllerPath' to point to a different index file.

```php
use Valet\Drivers\LaravelValetDriver;

class LocalValetDriver extends LaravelValetDriver
{
    /**
     * Determine if the driver serves the request.
     */
    public function serves(string $sitePath, string $siteName, string $uri): bool
    {
        return true;
    }

    /**
     * Get the fully resolved path to the application's front controller.
     */
    public function frontControllerPath(string $sitePath, string $siteName, string $uri): string
    {
        return $sitePath.'/public_html/index.php';
    }
}
```

--------------------------------

### Retrieve Coupon from Promotion Code

Source: https://laravel.com/docs/10.x/billing

Access the `coupon` method on a `PromotionCode` instance to get the associated coupon object. This allows inspection of the discount details.

```php
$coupon = $user->findPromotionCode('SUMMERSALE')->coupon();
```

--------------------------------

### Install Dropbox Flysystem Adapter (Shell)

Source: https://laravel.com/docs/10.x/filesystem

Installs the community-maintained Flysystem Dropbox adapter using Composer. This is a prerequisite for using Dropbox as a custom filesystem.

```shell
composer require spatie/flysystem-dropbox
```

--------------------------------

### Insert New Records with the create Method

Source: https://laravel.com/docs/10.x/eloquent

The `create` method provides a concise way to insert a new record and return the model instance in a single statement. It requires the model to have `fillable` or `guarded` properties defined to prevent mass assignment vulnerabilities.

```php
use App\Models\Flight;

$flight = Flight::create([
    'name' => 'London to Paris',
]);
```

--------------------------------

### Retrieve Applied Discount

Source: https://laravel.com/docs/10.x/billing

Get the currently applied discount for a billable entity or subscription by calling the `discount()` method. This returns a `Discount` instance.

```php
$discount = $billable->discount();

$discount = $subscription->discount();
```

--------------------------------

### Test Valet Installation

Source: https://laravel.com/docs/10.x/valet

Pings a *.test domain to verify that Valet is installed correctly and routing requests to 127.0.0.1. This confirms Nginx and DnsMasq are properly configured.

```shell
ping foobar.test
```

--------------------------------

### Test Sanctum API Token with All Abilities - PHP

Source: https://laravel.com/docs/10.x/sanctum

This example shows how to use `Sanctum::actingAs` to authenticate a user for testing and grant them all possible abilities by passing '*'. This is useful for testing scenarios where a user should have unrestricted access to protected routes.

```php
Sanctum::actingAs(
    User::factory()->create(),
    ['*']
);
```

--------------------------------

### Delete Eloquent Model Instance

Source: https://laravel.com/docs/10.x/eloquent

Deletes a specific model instance from the database. This method is called on an already retrieved model object.

```PHP
use App\Models\Flight;

$flight = Flight::find(1);

$flight->delete();
```

--------------------------------

### Combine Eloquent Scopes with Higher Order OR (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Use Laravel's higher order `orWhere` method to fluently chain scopes without explicit closures. This simplifies combining scopes with OR logic.

```php
$users = User::popular()->orWhere->active()->get();
```

--------------------------------

### Add FastCGI Parameters in Homestead.yaml

Source: https://laravel.com/docs/10.x/homestead

This example demonstrates how to add custom Nginx fastcgi_param values to a site configuration in Homestead.yaml using the 'params' directive. It defines a key-value pair for additional parameters.

```yaml
sites:
    - map: homestead.test
      to: /home/vagrant/project1/public
      params:
          - key: FOO
            value: BAR
```

--------------------------------

### Compare Eloquent Models (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Determine if two Eloquent models are the same (same primary key, table, and connection) using the `is` and `isNot` methods. These methods are also available on model relationships.

```php
if ($post->is($anotherPost)) {
    // ...
}

if ($post->isNot($anotherPost)) {
    // ...
}

if ($post->author()->is($user)) {
    // ...
}
```

--------------------------------

### Install Flysystem SFTP Package

Source: https://laravel.com/docs/10.x/filesystem

Installs the Flysystem SFTP v3 package using Composer, which is necessary for configuring SFTP support in Laravel.

```shell
composer require league/flysystem-sftp-v3 "^3.0"
```

--------------------------------

### Truncate Eloquent Model Table

Source: https://laravel.com/docs/10.x/eloquent

Deletes all records from the database table associated with the model and resets any auto-incrementing IDs. This is a destructive operation.

```PHP
Flight::truncate();
```

--------------------------------

### Install Supervisor on Ubuntu

Source: https://laravel.com/docs/10.x/horizon

This command installs Supervisor, a process control system, on Ubuntu. Supervisor is used to monitor and automatically restart the Horizon process if it unexpectedly stops.

```shell
sudo apt-get install supervisor
```

--------------------------------

### Configure Optional Features in Homestead (YAML)

Source: https://laravel.com/docs/10.x/homestead

This snippet demonstrates how to configure optional software features within your `Homestead.yaml` file. It shows examples for Blackfire with detailed configuration and other features enabled with a simple boolean value.

```yaml
features:
    - blackfire:
        server_id: "server_id"
        server_token: "server_value"
        client_id: "client_id"
        client_token: "client_value"
    - cassandra: true
    - chronograf: true
    - couchdb: true
    - crystal: true
    - dragonflydb: true
    - elasticsearch:
        version: 7.9.0
    - eventstore: true
        version: 21.2.0
    - flyway: true
    - gearman: true
    - golang: true
    - grafana: true
    - influxdb: true
    - logstash: true
    - mariadb: true
    - meilisearch: true
    - minio: true
    - mongodb: true
    - neo4j: true
    - ohmyzsh: true
    - openresty: true
    - pm2: true
    - python: true
    - r-base: true
    - rabbitmq: true
    - rustc: true
    - rvm: true
    - solr: true
    - timescaledb: true
    - trader: true
    - webdriver: true
```

--------------------------------

### Install Reverb Event Loop Extensions

Source: https://laravel.com/docs/10.x/reverb

For handling over 1,000 concurrent connections, Reverb can utilize faster event loops like `ext-event`, `ext-ev`, or `ext-uv`. Install these PHP extensions via PECL if the default `stream_select` becomes a bottleneck.

```sh
pecl install event
# or
pecl install ev
# or
pecl install uv
```

--------------------------------

### Handle Database Deadlocks with Retries in Laravel

Source: https://laravel.com/docs/10.x/database

Shows how to configure the `DB::transaction` method to automatically retry a transaction a specified number of times when a deadlock occurs. This prevents the application from failing immediately due to transient database lock issues.

```php
use Illuminate\Support\Facades\DB;

DB::transaction(function () {
    DB::update('update users set votes = 1');

    DB::delete('delete from posts');
}, 5);
```

--------------------------------

### Enforce Minimum Test Coverage Threshold (Artisan Shell)

Source: https://laravel.com/docs/10.x/testing

This command enforces a minimum test coverage threshold. The test suite will fail if the specified percentage is not met. It requires the 'test' command to be available.

```shell
php artisan test --coverage --min=80.3
```

--------------------------------

### Watch for File Changes with Octane (Shell)

Source: https://laravel.com/docs/10.x/octane

This command starts the Octane server and enables watching for file changes. When changes are detected, the server automatically restarts. This requires Node.js and the Chokidar library to be installed.

```shell
php artisan octane:start --watch
```

--------------------------------

### Get Specific Passport Scopes by ID (PHP)

Source: https://laravel.com/docs/10.x/passport

Illustrates how to fetch `LaravelPassportScope` instances for a specific set of scope IDs or names by passing an array to the `Passport::scopesFor()` method.

```php
use Laravel\Passport\Passport;

Passport::scopesFor(['place-orders', 'check-status']);
```

--------------------------------

### Iterating Over Eloquent Collections in PHP

Source: https://laravel.com/docs/10.x/eloquent

Shows how to loop through an Eloquent collection, treating it like a standard PHP array. This allows you to access individual model properties within the collection.

```php
foreach ($flights as $flight) {
    echo $flight->name;
}
```

--------------------------------

### Apply Global Scope Manually in PHP

Source: https://laravel.com/docs/10.x/eloquent

Manually registers a global scope by overriding the model's `booted` method and calling `addGlobalScope`. This allows for programmatic application of scopes.

```php
<?php

namespace App\Models;

use App\Models\Scopes\AncientScope;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The "booted" method of the model.
     */
    protected static function booted(): void
    {
        static::addGlobalScope(new AncientScope);
    }
}
```

--------------------------------

### Create a Process Pipeline with Commands in PHP

Source: https://laravel.com/docs/10.x/processes

The `pipe` method allows chaining commands, where the output of one becomes the input of the next. It executes processes synchronously and returns the result of the last process. It uses the `Pipe` object for defining commands. `cat example.txt` and `grep -i "laravel"` are used as examples.

```php
use Illuminate\Process\Pipe;
use Illuminate\Support\Facades\Process;

$result = Process::pipe(function (Pipe $pipe) {
    $pipe->command('cat example.txt');
    $pipe->command('grep -i "laravel"');
});

if ($result->successful()) {
    // ...
}
```

--------------------------------

### Install Flysystem FTP Package

Source: https://laravel.com/docs/10.x/filesystem

Installs the Flysystem FTP package using Composer, which is required to use the FTP driver in Laravel.

```shell
composer require league/flysystem-ftp "^3.0"
```

--------------------------------

### Remove All Global Scopes in PHP

Source: https://laravel.com/docs/10.x/eloquent

Removes all global scopes from a query using the `withoutGlobalScopes` method. An optional array can be passed to remove specific scopes.

```php
// Remove all of the global scopes...
User::withoutGlobalScopes()->get();

// Remove some of the global scopes...
User::withoutGlobalScopes([
    FirstScope::class, SecondScope::class
])->get();
```

--------------------------------

### Access Parallel Testing Token (PHP)

Source: https://laravel.com/docs/10.x/testing

Retrieve the unique token for the current parallel test process using the `ParallelTesting::token()` method. This token can be used to segment resources, such as test databases.

```php
$token = ParallelTesting::token();

```

--------------------------------

### Apply Global Scope using Attribute in PHP

Source: https://laravel.com/docs/10.x/eloquent

Applies a global scope to a model using the `ScopedBy` attribute. This automatically applies the specified scope to all queries for this model.

```php
<?php

namespace App\Models;

use App\Models\Scopes\AncientScope;
use Illuminate\Database\Eloquent\Attributes\ScopedBy;

#[ScopedBy([AncientScope::class])]
class User extends Model
{
    //
}
```

--------------------------------

### Handle Model Not Found Exceptions with findOrFail and firstOrFail

Source: https://laravel.com/docs/10.x/eloquent

The `findOrFail` and `firstOrFail` methods simplify handling cases where a model is not found. If no record matches the query, an `Illuminate\Database\Eloquent\ModelNotFoundException` is thrown, which Laravel automatically converts to a 404 HTTP response if not caught.

```php
$flight = Flight::findOrFail(1);

$flight = Flight::where('legs', '>', 3)->firstOrFail();
```

```php
use App\Models\Flight;

Route::get('/api/flights/{id}', function (string $id) {
    return Flight::findOrFail($id);
});
```

--------------------------------

### Install Laravel Horizon

Source: https://laravel.com/docs/10.x/horizon

Installs the Laravel Horizon package using Composer. This command adds Horizon to your project's dependencies.

```shell
composer require laravel/horizon
```

--------------------------------

### Install Guzzle HTTP Client

Source: https://laravel.com/docs/10.x/http-client

Installs the Guzzle HTTP client package, a core dependency for Laravel's HTTP client functionality. This command should be run via Composer.

```shell
composer require guzzlehttp/guzzle
```

--------------------------------

### Handle Specific Stripe Webhook Events (PHP)

Source: https://laravel.com/docs/10.x/billing

This example demonstrates how to listen for specific Stripe webhook events dispatched by Cashier, such as 'invoice.payment_succeeded', using Laravel's event listeners.

```php
<?php

namespace App\Listeners;

use Laravel\Cashier\Events\WebhookReceived;

class StripeEventListener
{
    /**
     * Handle received Stripe webhooks.
     */
    public function handle(WebhookReceived $event): void
    {
        if ($event->payload['type'] === 'invoice.payment_succeeded') {
            // Handle the incoming event...
        }
    }
}
```

```php
<?php

namespace App\Providers;

use App\Listeners\StripeEventListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Laravel\Cashier\Events\WebhookReceived;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        WebhookReceived::class => [
            StripeEventListener::class,
        ],
    ];
}
```

--------------------------------

### Install Frontend Dependencies

Source: https://laravel.com/docs/10.x/vite

Install all the necessary frontend dependencies for your Laravel application, including Vite and the official Laravel plugin. This command reads the 'package.json' file to install the required packages.

```sh
npm install
```

--------------------------------

### Set Docker Context to Default on Linux

Source: https://laravel.com/docs/10.x/index

This command ensures that Docker is configured to use the default context, which is often necessary before proceeding with Docker Compose operations on Linux systems. It requires Docker to be installed and configured.

```bash
docker context use default
```

--------------------------------

### Laravel Controller with Model Type-Hinting and Route Definition

Source: https://context7.com/context7/laravel_10_x/llms.txt

Example of a Laravel controller demonstrating type-hinting for a model within a method and its corresponding route definition. This helps in accessing model instances directly within controller actions. The code uses the `App\Models\User` model and defines a GET route for `/user/{id}`.

```php
// app/Http/Controllers/UserController.php
<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class UserController extends Controller
{
    public function show(string $id): View
    {
        return view('user.profile', [
            'user' => User::findOrFail($id)
        ]);
    }
}

// Route definition
use App\Http\Controllers\UserController;

Route::get('/user/{id}', [UserController::class, 'show']);
```

--------------------------------

### Observer Handling Events After Commit

Source: https://laravel.com/docs/10.x/eloquent

Implement the `ShouldHandleEventsAfterCommit` interface on an observer to ensure its event handlers only execute after a database transaction has been successfully committed. If no transaction is active, events fire immediately.

```php
<?php

namespace App\Observers;

use App\Models\User;
use Illuminate\Contracts\Events\ShouldHandleEventsAfterCommit;

class UserObserver implements ShouldHandleEventsAfterCommit
{
    /**
     * Handle the User "created" event.
     */
    public function created(User $user): void
    {
        // ...
    }
}
```

--------------------------------

### Get Customer Balance (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet retrieves the total balance of a customer as a formatted string representation in their currency. It uses the `balance` method available on the billable model.

```php
$balance = $user->balance();
```

--------------------------------

### Install Passport and Generate Keys

Source: https://laravel.com/docs/10.x/passport

Installs Passport, generates encryption keys for secure token generation, and creates initial OAuth2 clients. This command is crucial for Passport's operation.

```shell
php artisan passport:install
```

--------------------------------

### Start Tinker REPL

Source: https://laravel.com/docs/10.x/artisan

Launches the Tinker REPL environment. This allows for interactive execution of PHP code within the context of your Laravel application.

```shell
php artisan tinker
```

--------------------------------

### Get Number Ordinal Representation - PHP

Source: https://laravel.com/docs/10.x/helpers

Returns the ordinal representation of a number using `Number::ordinal()`. For example, 1 becomes 1st, 2 becomes 2nd.

```PHP
use Illuminate\Support\Number;

$number = Number::ordinal(1);
// 1st

$number = Number::ordinal(2);
// 2nd

$number = Number::ordinal(21);
// 21st
```

--------------------------------

### Start Reverb Server with Custom Hostname and SSL

Source: https://laravel.com/docs/10.x/reverb

Starts the Reverb server, specifying the host, port, and a custom hostname. This is useful for integrating with tools like Laravel Valet or Herd for secure local development using generated certificates.

```sh
php artisan reverb:start --host="0.0.0.0" --port=8080 --hostname="laravel.test"
```

--------------------------------

### Register Observer using Model Attribute

Source: https://laravel.com/docs/10.x/eloquent

This approach registers the UserObserver with the User model by adding the `ObservedBy` attribute directly to the User model class. This is a concise way to associate an observer with its model.

```php
use App\Observers\UserObserver;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;

#[ObservedBy([UserObserver::class])]
class User extends Authenticatable
{
    //
}
```

--------------------------------

### Listen for DatabaseBusy Event in EventServiceProvider

Source: https://laravel.com/docs/10.x/database

This PHP code snippet demonstrates how to register a listener for the `DatabaseBusy` event within Laravel's `EventServiceProvider`. When the event is dispatched, it sends an email notification using the `DatabaseApproachingMaxConnections` notification class. It requires the `IlluminateDatabaseEventsDatabaseBusy` event and Laravel's notification system.

```php
use App\Notifications\DatabaseApproachingMaxConnections;
use Illuminate\Database\Events\DatabaseBusy;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Notification;

/**
 * Register any other events for your application.
 */
public function boot(): void
{
    Event::listen(function (DatabaseBusy $event) {
        Notification::route('mail', 'dev@example.com')
                ->notify(new DatabaseApproachingMaxConnections(
                    $event->connectionName,
                    $event->connections
                ));
    });
}
```

--------------------------------

### Prevent Lazy Loading in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Configure Eloquent to prevent lazy loading by calling the preventLazyLoading method, optionally passing a boolean to disable it in non-production environments. This is typically done in the AppServiceProvider.

```php
use Illuminate\Database\Eloquent\Model;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Model::preventLazyLoading(! $this->app->isProduction());
}
```

--------------------------------

### Scheduling Model Pruning Command (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Schedule the `model:prune` Artisan command in your `App\Console\Kernel` to run daily or at your desired interval. You can specify models to prune, exclude models, or use `--pretend` for a dry run.

```php
<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        $schedule->command('model:prune')->daily();

        // Specify models to prune:
        $schedule->command('model:prune', [
            '--model' => [Address::class, Flight::class],
        ])->daily();

        // Exclude specific models:
        $schedule->command('model:prune', [
            '--except' => [Address::class, Flight::class],
        ])->daily();
    }
}
```

--------------------------------

### Install Laravel Socialite

Source: https://laravel.com/docs/10.x/socialite

Installs the Laravel Socialite package using Composer. This is the first step to enable OAuth authentication in your Laravel application.

```shell
composer require laravel/socialite
```

--------------------------------

### Delete Eloquent Models Using Queries

Source: https://laravel.com/docs/10.x/eloquent

Deletes models that match specific query criteria. This is a mass deletion operation and does not dispatch model events ('deleting', 'deleted') because the models are not retrieved individually.

```PHP
$deleted = Flight::where('active', 0)->delete();
```

--------------------------------

### Install Predis Package with Composer

Source: https://laravel.com/docs/10.x/redis

This command installs the Predis package, a Redis client written in PHP that does not require additional extensions. It is used when the PhpRedis extension is not installed.

```shell
composer require predis/predis
```

--------------------------------

### Set Default Attribute Values for Eloquent Model

Source: https://laravel.com/docs/10.x/eloquent

Define default attribute values for a new Eloquent model instance by specifying the $attributes property. Values should be in their raw, database-storable format.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The model's default values for attributes.
     *
     * @var array
     */
    protected $attributes = [
        'options' => '[]',
        'delayed' => false,
    ];
}
```

--------------------------------

### Define Anonymous Global Scope with Closure in PHP

Source: https://laravel.com/docs/10.x/eloquent

Defines a global scope using a closure, which is useful for simpler scopes. A unique name must be provided as the first argument to `addGlobalScope`.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The "booted" method of the model.
     */
    protected static function booted(): void
    {
        static::addGlobalScope('ancient', function (Builder $builder) {
            $builder->where('created_at', '<', now()->subYears(2000));
        });
    }
}
```

--------------------------------

### Start Local MCP Server via Artisan

Source: https://laravel.com/docs/10.x/mcp

Initiates the 'mcp:start' Artisan command for a specific server, in this case, 'weather'. This command is typically invoked by an MCP client to manage the server's lifecycle.

```shell
php artisan mcp:start weather
```

--------------------------------

### Create a basic browser instance in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet demonstrates how to create a single browser instance using the `browse` method in a Laravel Dusk test. It navigates to the login page, fills in credentials, submits the form, and asserts the path after login. Dependencies include the `Browser` class and potentially user models.

```php
<?php

namespace Tests\Browser;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Laravel\Dusk\Browser;
use Laravel\Dusk\Chrome;
use Tests\DuskTestCase;

class ExampleTest extends DuskTestCase
{
    use DatabaseMigrations;

    /**
     * A basic browser test example.
     */
    public function test_basic_example(): void
    {
        $user = User::factory()->create([
            'email' => 'taylor@laravel.com',
        ]);

        $this->browse(function (Browser $browser) use ($user) {
            $browser->visit('/login')
                    ->type('email', $user->email)
                    ->type('password', 'password')
                    ->press('Login')
                    ->assertPathIs('/home');
        });
    }
}
```

--------------------------------

### Specify Database Connection for Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Define the specific database connection to be used by an Eloquent model by setting the `$connection` property. This overrides the application's default database connection for that particular model.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The database connection that should be used by the model.
     *
     * @var string
     */
    protected $connection = 'sqlite';
}
```

--------------------------------

### Get All Defined Passport Scope IDs (PHP)

Source: https://laravel.com/docs/10.x/passport

Shows how to retrieve an array containing the string IDs or names of all scopes defined within your Laravel Passport configuration using the `Passport::scopeIds()` method.

```php
use Laravel\Passport\Passport;

Passport::scopeIds();
```

--------------------------------

### Install Laravel Cashier Paddle

Source: https://laravel.com/docs/10.x/cashier-paddle

Installs the Laravel Cashier package for Paddle integration using Composer. This is the first step in setting up Paddle's subscription billing services in your Laravel application.

```shell
composer require laravel/cashier-paddle
```

--------------------------------

### Configure Fortify Features (PHP)

Source: https://laravel.com/docs/10.x/fortify

Defines which backend authentication features Fortify will expose by default. This example enables registration, password reset, and email verification features.

```php
'features' => [
    Features::registration(),
    Features::resetPasswords(),
    Features::emailVerification(),
]
```

--------------------------------

### Get All Access Tokens (JavaScript/Axios)

Source: https://laravel.com/docs/10.x/passport

This JavaScript snippet uses Axios to fetch all authorized access tokens for the authenticated user from the '/oauth/tokens' endpoint. This is useful for displaying a list of tokens that the user can manage, such as revoking them.

```javascript
axios.get('/oauth/tokens')
    .then(response => {
        console.log(response.data);
    });
```

--------------------------------

### Run Vite Commands (npm)

Source: https://laravel.com/docs/10.x/vite

Commands to run Vite. `npm run dev` starts the development server with hot module replacement, and `npm run build` compiles and versions assets for production deployment.

```shell
# Run the Vite development server...
npm run dev

# Build and version the assets for production...
npm run build
```

--------------------------------

### Install Meilisearch PHP SDK

Source: https://laravel.com/docs/10.x/scout

Installs the Meilisearch PHP SDK and HTTP factory for Guzzle. This is a prerequisite for using Meilisearch with Laravel Scout.

```shell
composer require meilisearch/meilisearch-php http-interop/http-factory-guzzle
```

--------------------------------

### Facade vs. Helper Function for View Creation - PHP

Source: https://laravel.com/docs/10.x/facades

Demonstrates the equivalent functionality between using a Laravel facade and a helper function for creating a view. Both achieve the same outcome of rendering a view named 'profile'.

```PHP
return Illuminate\Support\Facades\View::make('profile');
```

```PHP
return view('profile');
```

--------------------------------

### Launch Vagrant Box (Shell)

Source: https://laravel.com/docs/10.x/homestead

This command initiates the Vagrant virtual machine for Homestead. After editing `Homestead.yaml`, running `vagrant up` provisions the environment, including shared folders and Nginx sites.

```shell
vagrant up
```

--------------------------------

### Install PHP with Homebrew

Source: https://laravel.com/docs/10.x/valet

Installs PHP using Homebrew, which is a necessary dependency for running Laravel applications served by Valet.

```shell
brew install php
```

--------------------------------

### Remove Specific Global Scope in SQL

Source: https://laravel.com/docs/10.x/eloquent

This SQL query demonstrates how to retrieve records without applying a specific global scope named `AncientScope`. It targets the `users` table and filters by `created_at`.

```sql
select * from `users` where `created_at` < 0021-02-18 00:00:00
```

--------------------------------

### Iterate Through SELECT Query Results (PHP)

Source: https://laravel.com/docs/10.x/database

Demonstrates how to loop through the results of a database query executed using DB::select. Each row is accessed as a stdClass object, allowing property access to column names like 'name'.

```php
use Illuminate\Support\Facades\DB;

$users = DB::select('select * from users');

foreach ($users as $user) {
    echo $user->name;
}

```

--------------------------------

### Rendering a View using View Facade

Source: https://laravel.com/docs/10.x/views

Demonstrates an alternative method to render a view using the `View` facade. This approach requires importing the facade and explicitly calling the `make` method.

```php
use IlluminateSupportFacadesView;

return View::make('greeting', ['name' => 'James']);
```

--------------------------------

### Optimize Composer Autoloader for Production

Source: https://laravel.com/docs/10.x/deployment

This command optimizes Composer's class autoloader map for faster class loading in a production environment. It is recommended to run this during your deployment process and to always include a `composer.lock` file for faster installations.

```shell
composer install --optimize-autoloader --no-dev
```

--------------------------------

### Use Public Path Binding in Laravel

Source: https://laravel.com/docs/10.x/upgrade

This PHP code example shows the modern approach to binding the public path in Laravel 10, replacing older methods by using the `usePublicPath` method on the Application instance.

```php
app()->usePublicPath(__DIR__.'/public');
```

--------------------------------

### Register Closures for Model Events (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This code illustrates registering closures directly within the `booted` method of an Eloquent model to listen for specific events, such as 'created'. This approach is useful for simpler event handling logic that doesn't require a dedicated event class.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The "booted" method of the model.
     */
    protected static function booted(): void
    {
        static::created(function (User $user) {
            // ...
        });
    }
}
```

--------------------------------

### Add Nginx Site Configuration to Homestead

Source: https://laravel.com/docs/10.x/homestead

Example of how to configure additional Nginx sites within the Homestead.yaml file. This allows multiple Laravel projects to be served from a single Homestead environment, mapping domain names to project directories.

```yaml
sites:
    - map: homestead.test
      to: /home/vagrant/project1/public
    - map: another.test
      to: /home/vagrant/project2/public
```

--------------------------------

### Run Laravel Envoy Binary

Source: https://laravel.com/docs/10.x/envoy

After installation, this command executes the Envoy binary, typically used to run defined tasks. It's located in the `vendor/bin` directory of your Laravel project.

```shell
php vendor/bin/envoy
```

--------------------------------

### Install Laravel Pulse Composer Package

Source: https://laravel.com/docs/10.x/pulse

Installs the Laravel Pulse package using Composer. This command requires the 'minimum-stability' to be set to 'beta' and 'prefer-stable' to true in your composer.json file.

```sh
composer require laravel/pulse
```

--------------------------------

### PHPDoc Example - Native Type Hinting

Source: https://laravel.com/docs/10.x/contributions

Illustrates a PHPDoc block for a method where native type hints make the `@param` and `@return` attributes redundant. This example uses a simple 'void' return type.

```php
/**
 * Execute the job.
 */
public function handle(AudioProcessor $processor): void
{
    //
}
```

--------------------------------

### Install Laravel Homestead with Composer (Shell)

Source: https://laravel.com/docs/10.x/homestead

This command installs the Laravel Homestead package as a development dependency using Composer. This is the first step in setting up Homestead per project.

```shell
composer require laravel/homestead --dev
```

--------------------------------

### HTTP Verb Routing Methods in Laravel

Source: https://laravel.com/docs/10.x/routing

Illustrates various HTTP verbs that can be used to register routes in Laravel. Includes examples for GET, POST, PUT, PATCH, DELETE, and OPTIONS. It also shows how to use 'match' for multiple verbs and 'any' for all verbs.

```php
Route::get($uri, $callback);
Route::post($uri, $callback);
Route::put($uri, $callback);
Route::patch($uri, $callback);
Route::delete($uri, $callback);
Route::options($uri, $callback);

Route::match(['get', 'post'], '/', function () {
    // ...
});

Route::any('/', function () {
    // ...
});
```

--------------------------------

### Manage ChromeDriver Installations

Source: https://laravel.com/docs/10.x/dusk

These commands manage the ChromeDriver binary used by Laravel Dusk. You can install the latest version, a specific version, for all operating systems, or detect the installed Chrome version. Ensure the binaries are executable.

```shell
php artisan dusk:chrome-driver
php artisan dusk:chrome-driver 86
php artisan dusk:chrome-driver --all
php artisan dusk:chrome-driver --detect
```

--------------------------------

### Install Doctrine DBAL for Database Truncation

Source: https://laravel.com/docs/10.x/dusk

Installs the doctrine/dbal package required for the DatabaseTruncation trait. This package is necessary for efficient database state management during testing by allowing table truncation instead of full migrations on subsequent test runs.

```shell
composer require --dev doctrine/dbal
```

--------------------------------

### Define Multiple Applications in Reverb Configuration

Source: https://laravel.com/docs/10.x/reverb

Allows a single Reverb installation to serve multiple applications by defining multiple app configurations within the `config/reverb.php` file.

```php
'apps' => [
    [
        'app_id' => 'my-app-one',
        // ...
    ],
    [
        'app_id' => 'my-app-two',
        // ...
    ],
],
```

--------------------------------

### Clone Homestead Repository

Source: https://laravel.com/docs/10.x/homestead

This command clones the official Laravel Homestead repository from GitHub to the specified directory. It's the first step in setting up the virtual environment.

```shell
git clone https://github.com/laravel/homestead.git ~/Homestead
```

--------------------------------

### CSS Styling Example

Source: https://laravel.com/docs/10.x/mcp

A simple CSS snippet demonstrating how to style HTML elements, specifically targeting a heading to change its color and text alignment.

```css
h1 {
    color: blue;
    text-align: center;
}
```

--------------------------------

### Define Mass Assignable Attributes - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Shows how to define the attributes that can be mass assigned using the `$fillable` property within an Eloquent model. This explicitly lists attributes that are safe to be populated from user input.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name'];
}
```

--------------------------------

### Configure Laravel Database Connection and Run Migrations

Source: https://context7.com/context7/laravel_10_x/llms.txt

This snippet demonstrates how to configure database connections in the .env file for different databases like MySQL or SQLite. It also includes the command to run migrations to create database tables.

```ini
# .env file configuration
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=secret

# Or use SQLite for simplicity
DB_CONNECTION=sqlite
```

```bash
# Run migrations to create database tables
php artisan migrate
```

--------------------------------

### Select a Single Scalar Value (PHP)

Source: https://laravel.com/docs/10.x/database

Retrieves a single scalar value (e.g., a count) directly from a database query, avoiding the need to access it from a stdClass object. This is useful for aggregate functions.

```php
$burgers = DB::scalar(
    "select count(case when food = 'burger' then 1 end) as burgers from menu"
);

```

--------------------------------

### Basic GET Route Definition in Laravel

Source: https://laravel.com/docs/10.x/routing

Defines a simple route that responds to GET requests at the '/greeting' URI. It returns a string 'Hello World' when accessed. This demonstrates the most basic form of route definition using a closure.

```php
use Illuminate\Support\Facades\Route;

Route::get('/greeting', function () {
    return 'Hello World';
});
```

--------------------------------

### Route Middleware for Subscription Status (PHP)

Source: https://laravel.com/docs/10.x/billing

An example of a route middleware in Laravel that checks if the authenticated user has an active subscription. If not, it redirects the user to the billing page. This ensures that only subscribed users can access protected routes.

```PHP
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureUserIsSubscribed
{
    /**
     * Handle an incoming request.
     *
     * @param    \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if ($request->user() && ! $request->user()->subscribed('default')) {
            // This user is not a paying customer...
            return redirect('billing');
        }

        return $next($request);
    }
}
```

--------------------------------

### Blade Component and Layout Example

Source: https://context7.com/context7/laravel_10_x/llms.txt

Demonstrates creating a reusable layout component and using it in a view. The layout accepts a title and renders content within a main section. This promotes code reuse and maintainability in Blade views.

```blade
<!-- resources/views/components/layout.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <title>{{ $title ?? 'Default Title' }}</title>
</head>
<body>
    <nav>
        <!-- Navigation -->
    </nav>

    <main>
        {{ $slot }}
    </main>

    <footer>
        <!-- Footer -->
    </footer>
</body>
</html>

<!-- resources/views/welcome.blade.php -->
<x-layout>
    <x-slot:title>
        Welcome Page
    </x-slot>

    <h1>Welcome to our site</h1>
    <p>This content appears in the $slot variable</p>
</x-layout>
```

--------------------------------

### Publish Horizon Assets

Source: https://laravel.com/docs/10.x/horizon

Publishes Horizon's assets, including configuration files and public assets, using the `horizon:install` Artisan command. This command should be run after installing the package.

```shell
php artisan horizon:install
```

--------------------------------

### Add Hostname Entry to Hosts File (Text)

Source: https://laravel.com/docs/10.x/homestead

This example shows the format for adding a custom hostname entry to your system's `hosts` file. It maps a specific IP address to a domain name, allowing direct access to your Homestead sites.

```text
192.168.56.56  homestead.test
```

--------------------------------

### Install Laravel Pint via Composer

Source: https://laravel.com/docs/10.x/pint

Installs Laravel Pint as a development dependency using Composer. This is typically for older Laravel applications as Pint is included in recent versions.

```shell
composer require laravel/pint --dev
```

--------------------------------

### Overriding Eloquent Primary Key (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Illustrates how to specify a custom primary key column name for an Eloquent model. This is done by defining the protected `$primaryKey` property. Eloquent defaults to 'id'.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'flight_id';
}

```

--------------------------------

### Publish Fortify Resources

Source: https://laravel.com/docs/10.x/fortify

Publishes Fortify's configuration files, actions, migrations, and service provider using the `vendor:publish` Artisan command. This makes Fortify's components available for customization and use.

```shell
php artisan vendor:publish --provider="Laravel\Fortify\FortifyServiceProvider"
```

--------------------------------

### Disable Timestamps in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Configure Eloquent models to not automatically manage `created_at` and `updated_at` columns by setting the `$timestamps` property to `false`. This is useful when your database schema does not include these timestamp columns.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;
}
```

--------------------------------

### Testing Model Pruning with `--pretend` (Shell)

Source: https://laravel.com/docs/10.x/eloquent

Execute the `model:prune` Artisan command with the `--pretend` option to see how many records would be pruned without actually deleting them. This is useful for testing your pruning logic.

```shell
php artisan model:prune --pretend
```

--------------------------------

### Execute Delete Statement - Laravel

Source: https://laravel.com/docs/10.x/database

Remove records from the database using the DELETE SQL statement via the DB facade. Similar to the update method, it returns the count of deleted rows and accepts the SQL query with bindings.

```php
use Illuminate\Support\Facades\DB;

$deleted = DB::delete('delete from users');
```

--------------------------------

### Initiate Metered Subscription via Stripe Checkout (Laravel)

Source: https://laravel.com/docs/10.x/billing

Starts a metered subscription process using Stripe Checkout. This method redirects the user to Stripe's checkout page to complete the subscription. It requires authentication and specifies the metered price ID.

```PHP
$checkout = Auth::user()
        ->newSubscription('default', [])
        ->meteredPrice('price_metered')
        ->checkout();

    return view('your-checkout-view', [
        'checkout' => $checkout,
    ]);
```

--------------------------------

### Retrieve Only Soft Deleted Models

Source: https://laravel.com/docs/10.x/eloquent

This code shows how to retrieve **only** the soft-deleted models from the database using the `onlyTrashed` method on an Eloquent query. This is useful for managing or displaying records that have been soft deleted. Requires `App\Models\Flight`.

```php
$flights = Flight::onlyTrashed()
                ->where('airline_id', 1)
                ->get();
```

--------------------------------

### Get All Personal Access Tokens (JavaScript)

Source: https://laravel.com/docs/10.x/passport

This JavaScript snippet uses Axios to fetch all personal access tokens created by the authenticated user from the /oauth/personal-access-tokens endpoint. This is useful for displaying tokens in a user interface for management purposes.

```javascript
axios.get('/oauth/personal-access-tokens')
    .then(response => {
        console.log(response.data);
    });
```

--------------------------------

### Create Stripe Checkout Session for Subscription (PHP)

Source: https://laravel.com/docs/10.x/billing

Creates a Stripe Checkout session for a user to subscribe to a specific plan, with options for trial periods, promotion codes, and success/cancel URLs. Requires user authentication and Laravel Cashier setup with Stripe.

```php
use Illuminate\Http\Request;

Route::get('/subscription-checkout', function (Request $request) {
    return $request->user()
        ->newSubscription('default', 'price_basic_monthly')
        ->trialDays(5)
        ->allowPromotionCodes()
        ->checkout([
            'success_url' => route('your-success-route'),
            'cancel_url' => route('your-cancel-route'),
        ]);
});
```

--------------------------------

### Enable Soft Deletes for Eloquent Model

Source: https://laravel.com/docs/10.x/eloquent

This snippet shows how to enable soft deleting for an Eloquent model by using the `SoftDeletes` trait. This trait automatically manages the `deleted_at` timestamp. No external dependencies are required beyond Eloquent.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Flight extends Model
{
    use SoftDeletes;
}
```

--------------------------------

### Testing Podcast Publication with Real-Time Facade

Source: https://laravel.com/docs/10.x/facades

This PHP code demonstrates how to test the 'publish' method of the 'Podcast' model when using a real-time facade. It utilizes Laravel's facade testing helpers to mock the 'Publisher' facade, asserting that the 'publish' method is called exactly once with the correct arguments.

```php
<?php

namespace Tests\Feature;

use App\Models\Podcast;
use Facades\App\Contracts\Publisher;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class PodcastTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A test example.
     */
    public function test_podcast_can_be_published(): void
    {
        $podcast = Podcast::factory()->create();

        Publisher::shouldReceive('publish')->once()->with($podcast);

        $podcast->publish();
    }
}
```

--------------------------------

### Retrieve Single Eloquent Models or Execute Closure (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Illustrates the `findOr` and `firstOr` methods, which retrieve a single Eloquent model or execute a provided closure if no results are found. The return value of the closure is used as the method's result. This is useful for providing default data or handling not-found scenarios gracefully.

```php
use App\Models\Flight;

$flight = Flight::findOr(1, function () {
    // ...
});

$flight = Flight::where('legs', '>', 3)->firstOr(function () {
    // ...
});
```

--------------------------------

### Update Existing Eloquent Model (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This snippet demonstrates how to update an existing Eloquent model. First, retrieve the model by its ID, then modify its attributes, and finally call the `save` method. The `updated_at` timestamp is automatically managed by Eloquent.

```php
use App\Models\Flight;

$flight = Flight::find(1);

$flight->name = 'Paris to London';

$flight->save();
```

--------------------------------

### Chipper CI Configuration for Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet details the setup for running Laravel Dusk tests on Chipper CI. It configures the PHP and Node.js environment, includes Chrome as a service, and defines a pipeline for setup, asset compilation, and browser testing using the built-in PHP server.

```yaml
# file .chipperci.yml
version: 1

environment:
  php: 8.2
  node: 16

# Include Chrome in the build environment
services:
  - dusk

# Build all commits
on:
   push:
      branches: .*

pipeline:
  - name: Setup
    cmd: |
      cp -v .env.example .env
      composer install --no-interaction --prefer-dist --optimize-autoloader
      php artisan key:generate
      
      # Create a dusk env file, ensuring APP_URL uses BUILD_HOST
      cp -v .env .env.dusk.ci
      sed -i "s@APP_URL=.*@APP_URL=http://$BUILD_HOST:8000@g" .env.dusk.ci

  - name: Compile Assets
    cmd: |
      npm ci --no-audit
      npm run build

  - name: Browser Tests
    cmd: |
      php -S [::0]:8000 -t public 2>server.log &
      sleep 2
      php artisan dusk:chrome-driver $CHROME_DRIVER
      php artisan dusk --env=ci
```

--------------------------------

### Install S3 Flysystem Adapter - Composer

Source: https://laravel.com/docs/10.x/filesystem

Installs the Flysystem AWS S3 v3 package using Composer, which is a prerequisite for using the S3 driver in Laravel.

```shell
composer require league/flysystem-aws-s3-v3 "^3.0" --with-all-dependencies
```

--------------------------------

### Single Action Controller Example in PHP

Source: https://laravel.com/docs/10.x/controllers

An example of a single-action controller in Laravel. It contains only an __invoke method, which handles the entire logic for a specific action, in this case, provisioning a web server.

```php
<?php

namespace App\Http\Controllers;

class ProvisionServer extends Controller
{
    /**
     * Provision a new web server.
     */
    public function __invoke()
    {
        // ...
    }
}
```

--------------------------------

### Install Laravel Telescope using Composer

Source: https://laravel.com/docs/10.x/telescope

Installs the Laravel Telescope package into your project using the Composer package manager. This is the standard method for adding Telescope to your Laravel application.

```shell
composer require laravel/telescope
```

--------------------------------

### Create Subscription with Trial Days (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Creates a new subscription for a user with a specified number of trial days. Payment method details are collected upfront, and the customer is not charged until the trial period ends.

```php
use Illuminate\Http\Request;

Route::post('/user/subscribe', function (Request $request) {
    $request->user()->newSubscription('default', 'price_monthly')
                ->trialDays(10)
                ->create($request->paymentMethodId);

    // ...
});
```

--------------------------------

### Get Trial End Date (PHP)

Source: https://laravel.com/docs/10.x/billing

This code retrieves the trial ending date for a user. The `trialEndsAt` method returns a Carbon instance if the user is on trial, or null otherwise. An optional subscription type can be provided.

```PHP
if ($user->onTrial()) {
    $trialEndsAt = $user->trialEndsAt('main');
}
```

--------------------------------

### Remove Specific Global Scope in PHP

Source: https://laravel.com/docs/10.x/eloquent

Removes a specific global scope from a query using the `withoutGlobalScope` method. This can be used for scopes defined by class name or by string name if defined using a closure.

```php
User::withoutGlobalScope(AncientScope::class)->get();

User::withoutGlobalScope('ancient')->get();
```

--------------------------------

### Replicating Model Excluding Attributes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

When replicating a model, you can exclude specific attributes from being copied to the new instance by passing an array of attribute names to the `replicate` method. This allows for precise control over which data is carried over.

```php
use App\Models\Flight;

$flight = Flight::create([
    'destination' => 'LAX',
    'origin' => 'LHR',
    'last_flown' => '2020-03-04 11:00:00',
    'last_pilot_id' => 747,
]);

$flight = $flight->replicate([
    'last_flown',
    'last_pilot_id'
]);
```

--------------------------------

### Perform Operations Without Updating Timestamps

Source: https://laravel.com/docs/10.x/eloquent

Execute model operations while temporarily disabling the `updated_at` timestamp modification. This is achieved by using the `withoutTimestamps` method with a closure, ensuring the timestamp is not altered during specific actions.

```php
Model::withoutTimestamps(fn () => $post->increment(['reads']));
```

--------------------------------

### Rejecting Models from Eloquent Collection in PHP

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates how to remove models from an Eloquent collection based on a condition. It uses the `reject` method, which takes a closure to determine which models to remove. This is useful for filtering out specific records before further processing.

```php
use App\Models\Flight;

$flights = Flight::where('destination', 'Paris')->get();

$flights = $flights->reject(function (Flight $flight) {
    return $flight->cancelled;
});
```

--------------------------------

### Check for Incomplete Subscription Payments (PHP)

Source: https://laravel.com/docs/10.x/billing

Checks if a user or subscription has an incomplete payment that requires confirmation. Useful for guiding users through the payment process. This method can be called on the billable model or a subscription instance.

```php
if ($user->hasIncompletePayment('default')) {
    // ...
}

if ($user->subscription('default')->hasIncompletePayment()) {
    // ...
}
```

--------------------------------

### Save Model Quietly Without Events

Source: https://laravel.com/docs/10.x/eloquent

The `saveQuietly` method persists changes to a model instance without dispatching any save-related events. This is useful when performing background updates or routine operations where event listeners are not needed.

```php
$user = User::findOrFail(1);

$user->name = 'Victoria Faith';

$user->saveQuietly();
```

--------------------------------

### Prepend Default Value to Attribute in Blade

Source: https://laravel.com/docs/10.x/blade

Shows how to use the `prepends` method to ensure an attribute always starts with a specific default value, followed by any injected values. This example uses `data-controller` to prefix with 'profile-controller'.

```blade
<div {{ $attributes->merge(['data-controller' => $attributes->prepends('profile-controller')]) }}>
    {{ $slot }}
</div>
```

--------------------------------

### Restore Soft Deleted Models in Relationship

Source: https://laravel.com/docs/10.x/eloquent

This snippet illustrates how to restore soft-deleted models within an Eloquent relationship. The `restore` method is called on the relationship instance. This is useful for cascading restores within related data.

```php
$flight->history()->restore();
```

--------------------------------

### Update or Create Eloquent Model

Source: https://laravel.com/docs/10.x/eloquent

Updates an existing model or creates a new one if no matching model exists. It persists the model automatically, eliminating the need for a manual 'save' call. This method merges attributes if a new model is created.

```PHP
$flight = Flight::updateOrCreate(
    ['departure' => 'Oakland', 'destination' => 'San Diego'],
    ['price' => 99, 'discounted' => 1]
);
```

--------------------------------

### Mute All Model Events with a Closure

Source: https://laravel.com/docs/10.x/eloquent

The `withoutEvents` method allows you to execute a closure where all model events are temporarily muted. Any code within the closure will not dispatch events, and the return value of the closure is returned by the `withoutEvents` method.

```php
use App\Models\User;

$user = User::withoutEvents(function () {
    User::findOrFail(1)->delete();

    return User::find(2);
});
```

--------------------------------

### Replicating Model Instance (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Create an unsaved copy of an existing model instance using the `replicate` method. You can then use the `fill` method to modify attributes before saving the new instance. This is useful for creating models with many shared attributes.

```php
use App\Models\Address;

$shipping = Address::create([
    'type' => 'shipping',
    'line_1' => '123 Example Street',
    'city' => 'Victorville',
    'state' => 'CA',
    'postcode' => '90001',
]);

$billing = $shipping->replicate()->fill([
    'type' => 'billing'
]);

$billing->save();
```

--------------------------------

### Basic Suggest Input in Laravel Prompts

Source: https://laravel.com/docs/10.x/prompts

Provides a basic 'suggest' prompt for user input with predefined auto-completion options. This guides the user by offering a list of possible answers.

```php
use function Laravel\Prompts\suggest;

$name = suggest('What is your name?', ['Taylor', 'Dayle']);
```

--------------------------------

### Install Composer Dependencies for Existing Projects

Source: https://laravel.com/docs/10.x/sail

This command is used to install Composer dependencies for an existing Laravel project that has been cloned. It utilizes a temporary Docker container (`laravelsail/phpXX-composer`) with PHP and Composer to install dependencies, ensuring compatibility with your project's PHP version. The `--ignore-platform-reqs` flag is used to bypass platform requirement checks during installation.

```shell
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php83-composer:latest \
    composer install --ignore-platform-reqs
```

--------------------------------

### Get Help for an Artisan Command

Source: https://laravel.com/docs/10.x/artisan

Retrieves detailed help information for a specific Artisan command, including its arguments and options. This is useful for understanding how to use a command correctly.

```shell
php artisan help migrate
```

--------------------------------

### Publish and Run Cashier Migrations

Source: https://laravel.com/docs/10.x/billing

Publishes Cashier's database migrations and then runs them using Artisan commands. This adds necessary columns to the users table and creates new tables for subscriptions and subscription items.

```shell
php artisan vendor:publish --tag="cashier-migrations"
php artisan migrate
```

--------------------------------

### Prevent Silently Discarding Attributes - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Shows how to configure Laravel to throw an exception when attempting to mass assign an unfillable attribute. This is typically done within a service provider's `boot` method and is useful for local development.

```php
use Illuminate\Database\Eloquent\Model;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Model::preventSilentlyDiscardingAttributes($this->app->isLocal());
}
```

--------------------------------

### Basic Blade View Example

Source: https://laravel.com/docs/10.x/views

Demonstrates a simple Blade view file with variable interpolation. This view expects a 'name' variable to be passed to it.

```blade
<!-- View stored in resources/views/greeting.blade.php -->

<html>
    <body>
        <h1>Hello, {{ $name }}</h1>
    </body>
</html>
```

--------------------------------

### Make Basic GET Request with Laravel HTTP Client

Source: https://laravel.com/docs/10.x/http-client

Demonstrates how to make a simple GET request to a specified URL using Laravel's Http facade. The response object can then be used to inspect the result.

```php
use Illuminate\Support\Facades\Http;

$response = Http::get('http://example.com');
```

--------------------------------

### Create Personal Access Client (Shell)

Source: https://laravel.com/docs/10.x/passport

This command generates a personal access client for your Laravel application using the Passport Artisan command. This client is necessary for issuing personal access tokens to users. It should be run once, unless `passport:install` has already been executed.

```shell
php artisan passport:client --personal
```

--------------------------------

### Overriding Eloquent Table Name (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Shows how to explicitly define the database table name for an Eloquent model if it deviates from the default convention. This is achieved by setting the protected `$table` property within the model class.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'my_flights';
}

```

--------------------------------

### Prevent Silently Discarding Attributes in Eloquent

Source: https://laravel.com/docs/10.x/eloquent

Instruct Laravel to throw an exception when attempting to fill an unfillable attribute by using the preventSilentlyDiscardingAttributes method. This aids in development by highlighting errors when setting attributes not in the fillable array.

```php
Model::preventSilentlyDiscardingAttributes(! $this->app->isProduction());
```

--------------------------------

### Show Application Overview - Artisan

Source: https://laravel.com/docs/10.x/configuration

The `about` Artisan command provides a quick overview of your application's configuration, drivers, and environment. You can filter the output using the `--only` option to view specific sections.

```shell
php artisan about
```

```shell
php artisan about --only=environment
```

--------------------------------

### Forward Additional Ports in Homestead.yaml

Source: https://laravel.com/docs/10.x/homestead

This example shows how to configure additional port forwarding in Homestead.yaml using the 'ports' directive. It allows specifying a 'send' port on the host and a 'to' port within the Vagrant box, with optional protocol specification.

```yaml
ports:
    - send: 50000
      to: 5000
    - send: 7777
      to: 777
      protocol: udp
```

--------------------------------

### Install Symfony Brevo Mailer and HTTP Client via Composer

Source: https://laravel.com/docs/10.x/mail

This command installs the necessary Symfony packages for Brevo mailer integration and HTTP client support. These are essential dependencies for enabling the Brevo transport in Laravel.

```shell
composer require symfony/brevo-mailer symfony/http-client
```

--------------------------------

### GET Request with Query Parameters

Source: https://laravel.com/docs/10.x/http-client

Demonstrates how to send GET requests with query parameters, either directly in the URL or as an array.

```APIDOC
## GET /users

### Description
Sends a GET request to retrieve users, optionally filtering by query parameters.

### Method
GET

### Endpoint
`http://example.com/users`

### Query Parameters
- **name** (string) - Optional - Filters users by name.
- **page** (integer) - Optional - Specifies the page number for results.

### Request Example
```php
use Illuminate\Support\Facades\Http;

$response = Http::get('http://example.com/users', [
    'name' => 'Taylor',
    'page' => 1,
]);

// Alternative using withQueryParameters:
$response = Http::retry(3, 100)->withQueryParameters([
    'name' => 'Taylor',
    'page' => 1,
])->get('http://example.com/users');
```

### Response
#### Success Response (200)
- **users** (array) - A list of user objects.
- **pagination** (object) - Pagination details.
```

--------------------------------

### Install Laravel Tinker

Source: https://laravel.com/docs/10.x/artisan

Installs the Laravel Tinker package using Composer. Tinker provides an interactive REPL for your Laravel application, allowing you to run code and interact with your application's components.

```shell
composer require laravel/tinker
```

--------------------------------

### Install Sail with Devcontainer Support (Artisan)

Source: https://laravel.com/docs/10.x/sail

Installs Laravel Sail and publishes a default .devcontainer/devcontainer.json file for VS Code Devcontainer integration. This option facilitates developing within a containerized environment.

```shell
php artisan sail:install --devcontainer
```

--------------------------------

### Configure Vite Entry Points in Laravel

Source: https://laravel.com/docs/10.x/vite

Sets up the primary JavaScript and CSS entry points for the Vite build process in a Laravel project. This configuration is done in the `vite.config.js` file using the `laravel-vite-plugin`.

```javascript
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel([
            'resources/css/app.css',
            'resources/js/app.js',
        ]),
    ],
});
```

--------------------------------

### Install Laravel Scout via Composer

Source: https://laravel.com/docs/10.x/scout

Installs the Laravel Scout package using the Composer package manager. This is the initial step for integrating Scout into a Laravel project.

```shell
composer require laravel/scout
```

--------------------------------

### Transition to Event, Bus, and Notification Fakes in Laravel

Source: https://laravel.com/docs/10.x/upgrade

Replaces deprecated `MocksApplicationServices` trait methods with new fake facade methods for testing events, jobs, and notifications. Ensures proper mocking of application services.

```php
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Notification;

// Instead of deprecated methods:
// $this->expectsEvents(UserRegistered::class);
// $this->expectsJobs(SendWelcomeEmail::class);
// $this->expectsNotifications(NewUserNotification::class);

// Use fakes:
Event::fake();
Bus::fake();
Notification::fake();

// Example assertions:
Event::assertDispatched(UserRegistered::class);
Bus::assertDispatched(SendWelcomeEmail::class);
Notification::assertSentTo(
    [$user],
    NewUserNotification::class
);
```

--------------------------------

### Share a Specific Site using Homestead Share Command

Source: https://laravel.com/docs/10.x/homestead

Initiates a share for a specific configured site (e.g., `homestead.test`) using the Homestead `share` command. This command utilizes Ngrok to create a public URL for the local development site.

```shell
share homestead.test
```

--------------------------------

### Install Flysystem Read-Only Package

Source: https://laravel.com/docs/10.x/filesystem

Installs the Flysystem Read-Only package using Composer, which is required to configure filesystem disks that do not permit write operations.

```shell
composer require league/flysystem-read-only "^3.0"
```

--------------------------------

### Lazy Loading Eloquent Results in PHP

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates the `lazy` method for processing Eloquent results, which is similar to chunking but returns a flattened `LazyCollection`. This allows treating the results as a single stream, while still executing the query in chunks behind the scenes for memory efficiency.

```php
use App\Models\Flight;

foreach (Flight::lazy() as $flight) {
    // ...
}
```

--------------------------------

### Install AWS SDK for PHP (Shell)

Source: https://laravel.com/docs/10.x/mail

Installs the official AWS SDK for PHP using Composer, required for the SES mailer driver.

```shell
composer require aws/aws-sdk-php
```

--------------------------------

### GET Request with Query Parameters

Source: https://laravel.com/docs/10.x/http-client

Demonstrates how to send GET requests with query parameters, either by appending them to the URL or passing them as an array to the `get` method. The `withQueryParameters` method also provides an alternative.

```php
$response = Http::get('http://example.com/users', [
    'name' => 'Taylor',
    'page' => 1,
]);
```

```php
Http::retry(3, 100)->withQueryParameters([
    'name' => 'Taylor',
    'page' => 1,
])->get('http://example.com/users')
```

--------------------------------

### Basic Eloquent Model Class (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates the basic structure of an Eloquent Model class in Laravel. It extends the base Model class from the Illuminate database package. By default, Eloquent infers the database table name from the plural, snake_case version of the model class name.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    // ...
}

```

--------------------------------

### Implement Custom Invoice Renderer in Laravel Cashier

Source: https://laravel.com/docs/10.x/billing

Demonstrates how to create a custom invoice renderer by implementing the `Laravel\Cashier\Contracts\InvoiceRenderer` interface. This example shows rendering HTML to PDF via an external API call. The custom renderer must be configured in `config/cashier.php`.

```php
use Illuminate\Support\Facades\Http;
use Laravel\Cashier\Contracts\InvoiceRenderer;
use Laravel\Cashier\Invoice;

class ApiInvoiceRenderer implements InvoiceRenderer
{
    /**
     * Render the given invoice and return the raw PDF bytes.
     */
    public function render(Invoice $invoice, array $data = [], array $options = []): string
    {
        $html = $invoice->view($data)->render();

        return Http::get('https://example.com/html-to-pdf', ['html' => $html])->get()->body();
    }
}
```

--------------------------------

### Customize Timestamp Column Names in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Change the names of the `created_at` and `updated_at` columns used by Eloquent by defining `CREATED_AT` and `UPDATED_AT` constants on your model. This allows flexibility if your database uses different naming conventions.

```php
<?php

class Flight extends Model
{
    const CREATED_AT = 'creation_date';
    const UPDATED_AT = 'updated_date';
}
```

--------------------------------

### Install Ably PHP SDK

Source: https://laravel.com/docs/10.x/broadcasting

Installs the Ably PHP SDK using Composer, which is required for broadcasting events via Ably.

```sh
composer require ably/ably-php
```

--------------------------------

### Install Algolia PHP SDK

Source: https://laravel.com/docs/10.x/scout

Installs the official Algolia PHP SDK via Composer, which is required when using the Algolia driver for Laravel Scout.

```shell
composer require algolia/algoliasearch-client-php
```

--------------------------------

### Navigate and Interact with Pages in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

Demonstrates how to navigate to a specific page using the `visit` method and how to load selectors and methods of a page into the current test context using the `on` method. This is useful for sequential interactions where a click action leads to a new page.

```php
use Tests\Browser\Pages\Login;
use Tests\Browser\Pages\CreatePlaylist;

// Navigate directly to a login page
$browser->visit(new Login);

// Navigate, click a link, and then load the subsequent page's context
$browser->visit('/dashboard')
        ->clickLink('Create Playlist')
        ->on(new CreatePlaylist)
        ->assertSee('@create');
```

--------------------------------

### Add Soft Deletes Column to Database Table

Source: https://laravel.com/docs/10.x/eloquent

This code demonstrates how to add the `deleted_at` column to a database table using Laravel's schema builder. This column is essential for soft deletion. It requires the `Illuminate\Database\Schema\Blueprint` and `Illuminate\Support\Facades\Schema` facade.

```php
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

Schema::table('flights', function (Blueprint $table) {
    $table->softDeletes();
});
```

--------------------------------

### Rebuild and Seed Database with `migrate:fresh`

Source: https://laravel.com/docs/10.x/seeding

This snippet illustrates how to completely rebuild your database by dropping all tables and re-running migrations, followed by seeding. It shows the basic `migrate:fresh --seed` command and how to specify a seeder class with `--seeder`.

```shell
php artisan migrate:fresh --seed

php artisan migrate:fresh --seed --seeder=UserSeeder
```

--------------------------------

### Run Database Migrations

Source: https://laravel.com/docs/10.x/index

This Artisan command is used to run the database migrations for your Laravel application. It creates the necessary database tables defined in your migration files. If an SQLite database does not exist, Laravel will prompt to create it.

```bash
php artisan migrate
```

--------------------------------

### Install Laravel Passport

Source: https://laravel.com/docs/10.x/passport

Installs the Laravel Passport package using Composer. This is the initial step for integrating API authentication with Passport.

```shell
composer require laravel/passport
```

--------------------------------

### Initialize Stripe.js and Mount Card Element

Source: https://laravel.com/docs/10.x/billing

This JavaScript code initializes the Stripe.js library using a provided public key and then creates and mounts a Stripe 'card' Element to a specified HTML element. This is crucial for securely embedding the card input fields directly into your web form.

```javascript
const stripe = Stripe('stripe-public-key');

const elements = stripe.elements();
const cardElement = elements.create('card');

cardElement.mount('#card-element');
```

--------------------------------

### Create or Get Stripe Customer Object (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet provides a method to either retrieve an existing Stripe customer object for a billable model or create one if it doesn't exist. The `createOrGetStripeCustomer` method handles this logic.

```php
$stripeCustomer = $user->createOrGetStripeCustomer();
```

--------------------------------

### Initialize Homestead Configuration

Source: https://laravel.com/docs/10.x/homestead

Executes the initialization script to create the Homestead.yaml configuration file. This file is crucial for customizing your Homestead environment settings. Use 'bash init.sh' for macOS/Linux and 'init.bat' for Windows.

```shell
# macOS / Linux...
bash init.sh

# Windows...
init.bat
```

--------------------------------

### Vite Asset URL Processing Example

Source: https://laravel.com/docs/10.x/vite

Demonstrates how Vite handles absolute and relative asset paths. Absolute paths are not processed by Vite, while relative paths are rewritten, versioned, and bundled.

```html
<!-- This asset is not handled by Vite and will not be included in the build -->
<img src="/taylor.png">

<!-- This asset will be re-written, versioned, and bundled by Vite -->
<img src="../../images/abigail.png">
```

--------------------------------

### Install Laravel Envoy using Composer

Source: https://laravel.com/docs/10.x/envoy

This command installs the Laravel Envoy package as a development dependency in your Laravel project using Composer. It ensures the Envoy binary is available for use.

```shell
composer require laravel/envoy --dev
```

--------------------------------

### Specify Configuration File for Pint

Source: https://laravel.com/docs/10.x/pint

Runs Laravel Pint using a specified configuration file from a different directory using the --config option.

```shell
pint --config vendor/my-company/coding-style/pint.json
```

--------------------------------

### Define Arguments for MCP Prompts (PHP)

Source: https://laravel.com/docs/10.x/mcp

This example shows how to define arguments for an MCP prompt using the `arguments` method. The `DescribeWeatherPrompt` accepts a required `tone` argument, which allows AI clients to customize the prompt's output. Each `Argument` object specifies the name, description, and whether the argument is required.

```php
<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;
use Laravel\Mcp\Server\Prompts\Argument;

class DescribeWeatherPrompt extends Prompt
{
    /**
     * Get the prompt's arguments.
     *
     * @return array<int, \Laravel\Mcp\Server\Prompts\Argument>
     */
    public function arguments(): array
    {
        return [
            new Argument(
                name: 'tone',
                description: 'The tone to use in the weather description (e.g., formal, casual, humorous).',
                required: true,
            ),
        ];
    }
}

```

--------------------------------

### Get the Process ID (PID) of a Running Process in PHP

Source: https://laravel.com/docs/10.x/processes

The `id` method retrieves the operating system assigned process ID (PID) of a running process. This is useful for process management and signaling. `bash import.sh` is used as an example.

```php
$process = Process::start('bash import.sh');

return $process->id();
```

--------------------------------

### Create PKCE Client

Source: https://laravel.com/docs/10.x/passport

Creates a new OAuth client that supports the Authorization Code Grant with PKCE.

```APIDOC
## Create PKCE Client

### Description
Creates a new OAuth client for PKCE grant type, suitable for public clients like SPAs or native apps.

### Method
CLI command

### Endpoint
N/A

### Parameters
#### Command Line Options
- `--public` (boolean) - Required - Indicates that the client is public and does not have a secret.

### Request Example
```shell
php artisan passport:client --public
```

### Response
#### Success Response
Returns the client ID and client secret (if applicable for non-public clients) for the newly created client.

#### Response Example
```json
{
    "name": "My Application",
    "client_id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "client_secret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "redirect_uris": [
        "http://localhost:3000/callback"
    ]
}
```
```

--------------------------------

### Install Postmark Mailer Transport (Shell)

Source: https://laravel.com/docs/10.x/mail

Installs the necessary Symfony components for using the Postmark mailer driver in Laravel. Requires Composer.

```shell
composer require symfony/postmark-mailer symfony/http-client
```

--------------------------------

### PHPDoc Example - Generic Type Hinting

Source: https://laravel.com/docs/10.x/contributions

Shows how to use PHPDoc attributes (`@return`) when native type hints are generic. This example specifies a generic array return type with detailed element types for attachments.

```php
/**
 * Get the attachments for the message.
 *
 * @return array<int, \Illuminate\Mail\Mailables\Attachment>
 */
public function attachments(): array
{
    return [
        Attachment::fromStorage('/path/to/file'),
    ];
}
```

--------------------------------

### Install Laravel Cashier Package

Source: https://laravel.com/docs/10.x/billing

Installs the Laravel Cashier package using Composer, a dependency manager for PHP. This is the first step in integrating Stripe payment processing into a Laravel application.

```shell
composer require laravel/cashier
```

--------------------------------

### Returning a View from a Route in Laravel

Source: https://laravel.com/docs/10.x/blade

Illustrates how to define a route that returns a Blade view. This example shows fetching all tasks from the database and passing them as data to the 'tasks' view.

```php
use App\Models\Task;

Route::get('/tasks', function () {
    return view('tasks', ['tasks' => Task::all()]);
});
```

--------------------------------

### Passing Access Token in Authorization Header (PHP)

Source: https://laravel.com/docs/10.x/passport

Provides an example of how to make an API request using Guzzle HTTP client, including the necessary 'Authorization' header with a 'Bearer' token. This is the standard method for clients to authenticate with a Passport-protected API.

```php
use Illuminate\Support\Facades\Http;

$response = Http::withHeaders([
    'Accept' => 'application/json',
    'Authorization' => 'Bearer '.$accessToken,
])->get('https://passport-app.test/api/user');

return $response->json();
```

--------------------------------

### Start Laravel Sail Environment (Shell)

Source: https://laravel.com/docs/10.x/sail

Starts the Docker containers defined by Laravel Sail. This command brings up the development environment, including services like PHP, MySQL, and Redis, allowing you to run your Laravel application.

```shell
./vendor/bin/sail up
```

--------------------------------

### PHPDoc Example - Basic Binding Method

Source: https://laravel.com/docs/10.x/contributions

Demonstrates a valid PHPDoc block for a method binding a string or array to a concrete class or closure. It specifies parameter types, return type, and potential exceptions.

```php
/**
 * Register a binding with the container.
 *
 * @param  string|array  $abstract
 * @param  \Closure|string|null  $concrete
 * @param  bool  $shared
 * @return void
 *
 * @throws \Exception
 */
public function bind($abstract, $concrete = null, $shared = false)
{
    // ...
}
```

--------------------------------

### Start Laravel Queue Listener

Source: https://laravel.com/docs/10.x/queues

Starts a queue listener using the Artisan `queue:listen` command. This command is less efficient than `queue:work` but automatically reloads updated code and resets application state without manual restart.

```shell
php artisan queue:listen
```

--------------------------------

### Allow All Attributes for Mass Assignment - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates how to make all model attributes mass assignable by setting the `$guarded` property to an empty array. This approach requires extra caution to manually craft arrays passed to Eloquent methods.

```php
protected $guarded = [];
```

--------------------------------

### Initialize CSRF Protection for SPA with Axios

Source: https://laravel.com/docs/10.x/sanctum

This snippet demonstrates how to initialize CSRF protection for a Single Page Application (SPA) by making a GET request to the `/sanctum/csrf-cookie` endpoint using Axios. This sets the XSRF-TOKEN cookie, which is essential for subsequent authenticated requests.

```javascript
axios.get('/sanctum/csrf-cookie').then(response => {
    // Login...
});
```

--------------------------------

### Include Soft Deleted Models in Query Results

Source: https://laravel.com/docs/10.x/eloquent

This code snippet shows how to retrieve all models, including those that have been soft deleted, by using the `withTrashed` method on an Eloquent query. By default, soft-deleted models are excluded from queries. Requires `App\Models\Flight`.

```php
use App\Models\Flight;

$flights = Flight::withTrashed()
                ->where('account_id', 1)
                ->get();
```

--------------------------------

### Manually Control Progress Bar Advancement in Laravel Prompts

Source: https://laravel.com/docs/10.x/prompts

This example demonstrates manual control over a progress bar's advancement. You define the total steps, start the progress bar, iterate through your task, manually advance the bar after each item, and finally finish it. This provides granular control over progress updates.

```php
$progress = progress(label: 'Updating users', steps: 10);

$users = User::all();

$progress->start();

foreach ($users as $user) {
    $this->performTask($user);

    $progress->advance();
}

$progress->finish();
```

--------------------------------

### Execute Composer Commands with Sail

Source: https://laravel.com/docs/10.x/sail

This snippet demonstrates how to run Composer commands within the Sail environment. Laravel Sail includes a Composer 2.x installation, allowing you to manage your project's PHP dependencies. The example shows how to require a new package.

```shell
sail composer require laravel/sanctum
```

--------------------------------

### Creating a View using Artisan Command

Source: https://laravel.com/docs/10.x/views

Illustrates the use of the `make:view` Artisan command to create a new Blade view file. This command simplifies the process of setting up new view files.

```shell
php artisan make:view greeting
```

--------------------------------

### Manage Supervisor Processes with supervisorctl

Source: https://laravel.com/docs/10.x/queues

These shell commands are used to interact with Supervisor after configuration changes. 'reread' loads new configurations, 'update' applies them, and 'start' initiates the specified processes. Ensure you have the necessary sudo privileges.

```shell
sudo supervisorctl reread

sudo supervisorctl update

sudo supervisorctl start "laravel-worker:*"
```

--------------------------------

### Install and Enable vite-plugin-manifest-sri

Source: https://laravel.com/docs/10.x/vite

Installs the `vite-plugin-manifest-sri` NPM package and enables it in the `vite.config.js` file to include integrity hashes in the Vite manifest. This enhances asset security by allowing browsers to verify the integrity of loaded assets.

```shell
npm install --save-dev vite-plugin-manifest-sri
```

```javascript
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import manifestSRI from 'vite-plugin-manifest-sri';

export default defineConfig({
    plugins: [
        laravel({
            // ...
        }),
        manifestSRI(),
    ],
});
```

--------------------------------

### Mass Assignment for JSON Columns - Laravel

Source: https://laravel.com/docs/10.x/eloquent

Explains how to specify mass assignable keys for JSON columns using the `$fillable` array. Laravel does not support updating nested JSON attributes when using the `guarded` property for security reasons.

```php
protected $fillable = [
    'options->enabled',
];
```

--------------------------------

### Install Chokidar for File Watching (Shell)

Source: https://laravel.com/docs/10.x/octane

This command installs the Chokidar file-watching library as a development dependency in your project. It is required for the --watch flag in Octane to function correctly.

```shell
npm install --save-dev chokidar
```

--------------------------------

### Create Subscription with Trial Until Date (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Creates a new subscription for a user, specifying an exact `DateTime` instance for the trial period's end. This provides precise control over when the trial concludes and billing begins.

```php
use Carbon\Carbon;

$user->newSubscription('default', 'price_monthly')
            ->trialUntil(Carbon::now()->addDays(10))
            ->create($paymentMethod);
```

--------------------------------

### Podcast Model With Real-Time Facade

Source: https://laravel.com/docs/10.x/facades

This snippet illustrates how to refactor the 'Podcast' model to use a real-time facade for the 'Publisher' dependency. By prefixing the namespace with 'Facades', the 'Publisher' instance is resolved from the service container automatically, simplifying the method signature and usage.

```php
<?php

namespace App\Models;

// use App\Contracts\Publisher; // [tl! remove]
use Facades\App\Contracts\Publisher; // [tl! add]
use Illuminate\Database\Eloquent\Model;

class Podcast extends Model
{
    /**
     * Publish the podcast.
     */
    public function publish(Publisher $publisher): void // [tl! remove]
    public function publish(): void // [tl! add]
    {
        $this->update(['publishing' => now()]);

        $publisher->publish($this); // [tl! remove]
        Publisher::publish($this); // [tl! add]
    }
}
```

--------------------------------

### List All OAuth2 Clients - JavaScript (Axios)

Source: https://laravel.com/docs/10.x/passport

Fetches a list of all OAuth2 clients associated with the authenticated user. This endpoint is useful for displaying clients in a dashboard for editing or deletion. It uses the Axios library to make an HTTP GET request to the `/oauth/clients` endpoint.

```javascript
axios.get('/oauth/clients')
    .then(response => {
        console.log(response.data);
    });
```

--------------------------------

### Install Laravel Echo and Pusher JS for Reverb

Source: https://laravel.com/docs/10.x/broadcasting

Installs the necessary JavaScript packages for Laravel Echo and Pusher JS, which are required for client-side integration with the Reverb broadcasting server. This is a prerequisite for setting up Echo with Reverb.

```shell
npm install --save-dev laravel-echo pusher-js
```

--------------------------------

### Install Laravel Reverb

Source: https://laravel.com/docs/10.x/broadcasting

Installs the Reverb broadcasting package for Laravel using Composer. This command also publishes configuration files, updates broadcasting settings, and adds necessary environment variables.

```sh
composer require laravel/reverb
php artisan reverb:install
```

--------------------------------

### Refresh Eloquent Model Instance

Source: https://laravel.com/docs/10.x/eloquent

Re-retrieve an Eloquent model instance from the database using the `fresh` method, which returns a new instance without affecting the original. Alternatively, use the `refresh` method to re-hydrate the existing instance with fresh data, including its loaded relationships.

```php
$flight = Flight::where('number', 'FR 900')->first();

$freshFlight = $flight->fresh();

$flight->refresh();

$flight->number; // "FR 900"
```

--------------------------------

### Install MailerSend Laravel Driver (Shell)

Source: https://laravel.com/docs/10.x/mail

Installs the MailerSend driver package for Laravel using Composer.

```shell
composer require mailersend/laravel-driver
```

--------------------------------

### Install Typesense PHP SDK

Source: https://laravel.com/docs/10.x/scout

Installs the Typesense PHP SDK via Composer. This is required to integrate Typesense with Laravel Scout.

```shell
composer require typesense/typesense-php
```

--------------------------------

### Retrieve Original Eloquent Model Attributes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This snippet demonstrates how to retrieve the original values of Eloquent model attributes using the `getOriginal` method. This is useful for comparing current attribute values with their state when the model was initially loaded or created.

```php
$user = User::find(1);

$user->name; // John
$user->email; // john@example.com

$user->name = "Jack";
$user->name; // Jack

$user->getOriginal('name'); // John
$user->getOriginal(); // Array of original attributes...
```

--------------------------------

### Wait for an Asynchronous Process to Complete in PHP

Source: https://laravel.com/docs/10.x/processes

The `wait` method is used to block execution until an asynchronously started process finishes. It then returns the process result instance, allowing access to its output and status. `bash import.sh` is used as an example, with a timeout set.

```php
$process = Process::timeout(120)->start('bash import.sh');

// ...

$result = $process->wait();
```

--------------------------------

### Customize Multi-select Prompt with Defaults and Hint in PHP

Source: https://laravel.com/docs/10.x/prompts

Configure the `multiselect` prompt with default selected choices and an informational hint to guide the user's selection process.

```php
use function Laravel\Prompts\multiselect;

$permissions = multiselect(
    label: 'What permissions should be assigned?',
    options: ['Read', 'Create', 'Update', 'Delete'],
    default: ['Read', 'Create'],
    hint: 'Permissions may be updated at any time.'
);
```

--------------------------------

### Register Queueable Closures for Model Events (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This PHP snippet shows how to register a queueable closure for a model event ('created'). By wrapping the closure with `queueable()`, the event listener will be executed in the background using Laravel's queue system, improving application responsiveness for longer-running tasks.

```php
use function Illuminate\Events\queueable;

static::created(queueable(function (User $user) {
    // ...
}));
```

--------------------------------

### Resource Dependency Injection via Constructor

Source: https://laravel.com/docs/10.x/mcp

This PHP example shows how to use Laravel's service container for dependency injection by type-hinting dependencies in the resource's constructor. Dependencies like `WeatherRepository` are automatically resolved and injected.

```php
<?php

namespace App\Mcp\Resources;

use App\Repositories\WeatherRepository;
use Laravel\Mcp\Server\Resource;

class WeatherGuidelinesResource extends Resource
{
    /**
     * Create a new resource instance.
     */
    public function __construct(
        protected WeatherRepository $weather,
    ) {}

    // ...
}
```

--------------------------------

### Install Laravel Sail Configuration (Artisan)

Source: https://laravel.com/docs/10.x/sail

Publishes Sail's docker-compose.yml file and configures the .env file for Docker services after Sail has been installed via Composer. This command sets up the necessary files for Sail to function.

```shell
php artisan sail:install
```

--------------------------------

### Check Node.js and NPM Versions

Source: https://laravel.com/docs/10.x/vite

Verify that Node.js (version 16 or higher) and NPM are installed on your system. These are prerequisites for running Vite and the Laravel plugin. You can use the provided commands to check their versions.

```sh
node -v
npm -v
```

--------------------------------

### Configuring Non-Integer Primary Key Type (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Explains how to specify the data type of a non-integer primary key in Eloquent models. If the primary key is not an integer (e.g., a UUID string), the protected `$keyType` property should be set to 'string'.

```php
<?php

class Flight extends Model
{
    /**
     * The data type of the primary key ID.
     *
     * @var string
     */
    protected $keyType = 'string';
}

```

--------------------------------

### Capture Pipeline Output in Real-time with a Closure in PHP

Source: https://laravel.com/docs/10.x/processes

Real-time output capture for a process pipeline is possible by passing a closure as the second argument to the `pipe` method. This closure receives output type and string, allowing immediate processing of output from chained commands. `cat example.txt` and `grep -i "laravel"` are used as examples.

```php
$result = Process::pipe(function (Pipe $pipe) {
    $pipe->command('cat example.txt');
    $pipe->command('grep -i "laravel"');
}, function (string $type, string $output) {
    echo $output;
});
```

--------------------------------

### Override UUID Generation in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

Customize UUID generation by overriding the `newUniqueId` method to provide custom logic (e.g., using `Uuid::uuid4()`). You can also specify which columns should receive UUIDs by implementing the `uniqueIds` method.

```php
use Ramsey\Uuid\Uuid;

/**
 * Generate a new UUID for the model.
 */
public function newUniqueId(): string
{
    return (string) Uuid::uuid4();
}

/**
 * Get the columns that should receive a unique identifier.
 *
 * @return array<int, string>
 */
public function uniqueIds(): array
{
    return ['id', 'discount_code'];
}
```

--------------------------------

### Install Laravel Sanctum via Composer

Source: https://laravel.com/docs/10.x/sanctum

Installs the Laravel Sanctum package using the Composer package manager. This is the initial step for integrating Sanctum into a Laravel application.

```shell
composer require laravel/sanctum
```

--------------------------------

### Perform Model Actions Quietly

Source: https://laravel.com/docs/10.x/eloquent

Several methods allow performing model operations like delete, force delete, restore, and replicate without dispatching events. These `Quietly` suffixed methods are equivalent to calling the respective action within `withoutEvents`.

```php
$user->deleteQuietly();
$user->forceDeleteQuietly();
$user->restoreQuietly();
```

--------------------------------

### Configuring Non-Incrementing Primary Key (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Demonstrates how to configure an Eloquent model to use a non-incrementing primary key. By default, Eloquent assumes the primary key is an auto-incrementing integer. Setting `public $incrementing = false;` disables this behavior.

```php
<?php

class Flight extends Model
{
    /**
     * Indicates if the model's ID is auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;
}

```

--------------------------------

### Install Laravel Precognition Vue Frontend Helper

Source: https://laravel.com/docs/10.x/precognition

This shell command demonstrates how to install the Laravel Precognition frontend package for Vue.js using NPM. This package provides the necessary tools and functions to integrate live validation into your Vue components.

```shell
npm install laravel-precognition-vue
```

--------------------------------

### Retrieve Aggregate Query Results

Source: https://laravel.com/docs/10.x/eloquent

Eloquent models can utilize query builder aggregate methods like `count`, `sum`, `max`, etc., to retrieve scalar values instead of model instances. These methods are chained after a query builder instance.

```php
$count = Flight::where('active', 1)->count();

$max = Flight::where('active', 1)->max('price');
```

--------------------------------

### Display Metered Usage Records (Blade/Laravel)

Source: https://laravel.com/docs/10.x/billing

Iterates over the retrieved usage records collection in a Blade template to display details such as the billing period start and end dates, and the total usage for each record. This assumes the $usageRecords variable is passed from the controller.

```Blade
@foreach ($usageRecords as $usageRecord)
    - Period Starting: {{ $usageRecord['period']['start'] }}
    - Period Ending: {{ $usageRecord['period']['end'] }}
    - Total Usage: {{ $usageRecord['total_usage'] }}
@endforeach
```

--------------------------------

### Check Token Scope within Application Logic (PHP)

Source: https://laravel.com/docs/10.x/passport

Provides an example of how to check if an authenticated user's token has a specific scope ('place-orders') directly within a route closure using the `tokenCan` method on the authenticated User instance.

```php
use Illuminate\Http\Request;

Route::get('/orders', function (Request $request) {
    if ($request->user()->tokenCan('place-orders')) {
        // ...
    }
});
```

--------------------------------

### Initiate Subscription Checkout with Trial (PHP)

Source: https://laravel.com/docs/10.x/cashier-paddle

Initiates a checkout session for a subscription with a predefined trial period. This method assumes payment details are collected upfront. It utilizes the `subscribe` method and returns a view with the checkout object.

```PHP
use Illuminate\Http\Request;

Route::get('/user/subscribe', function (Request $request) {
    $checkout = $request->user()->subscribe('pri_monthly')
                ->returnTo(route('home'));

    return view('billing', ['checkout' => $checkout]);
});
```

--------------------------------

### Update Homebrew

Source: https://laravel.com/docs/10.x/valet

Ensures that Homebrew is up to date before installing other packages. This is a prerequisite for installing Valet and PHP.

```shell
brew update
```

--------------------------------

### Configure Ngrok Token for Valet

Source: https://laravel.com/docs/10.x/valet

This command configures your Valet installation with an ngrok authentication token, enabling secure sharing of your local development sites. Ensure you have created an ngrok account and obtained an authentication token before running this command.

```shell
valet set-ngrok-token YOUR_TOKEN_HERE
```

--------------------------------

### Execute Database Seeders with Artisan

Source: https://laravel.com/docs/10.x/seeding

This snippet demonstrates how to run database seeders using the `php artisan db:seed` command. It shows the basic command to run the default seeder class and how to specify a particular seeder class using the `--class` option.

```shell
php artisan db:seed

php artisan db:seed --class=UserSeeder
```

--------------------------------

### Install Pusher PHP SDK

Source: https://laravel.com/docs/10.x/broadcasting

Installs the Pusher Channels PHP SDK using Composer, which is required for broadcasting events via Pusher Channels.

```sh
composer require pusher/pusher-php-server
```

--------------------------------

### Initiate Stripe Customer Billing Portal Session (Blade)

Source: https://laravel.com/docs/10.x/billing

This Blade snippet generates a link to initiate a Stripe Customer Billing Portal session. It relies on the `billing` named route to handle the backend logic.

```blade
<a href="{{ route('billing') }}">
    Billing
</a>
```

--------------------------------

### Configure Package Discovery in Composer JSON

Source: https://laravel.com/docs/10.x/packages

This JSON configuration snippet shows how to register a package's service provider and facades for automatic discovery by Laravel. It is placed in the `extra` section of the package's `composer.json` file, simplifying installation for users.

```json
{
    "extra": {
        "laravel": {
            "providers": [
                "Barryvdh\\Debugbar\\ServiceProvider"
            ],
            "aliases": {
                "Debugbar": "Barryvdh\\Debugbar\\Facade"
            }
        }
    }
}
```

--------------------------------

### Install Laravel Dusk Composer Dependency

Source: https://laravel.com/docs/10.x/dusk

This command installs the Laravel Dusk package as a development dependency in your Laravel project using Composer. It is essential for enabling browser automation and testing features.

```shell
composer require laravel/dusk --dev
```

--------------------------------

### Create a Basic Collection - PHP

Source: https://laravel.com/docs/10.x/collections

Illustrates the simplest way to create an instance of Illuminate\Support\Collection using the 'collect' helper function with an array of integers.

```PHP
$collection = collect([1, 2, 3]);
```

--------------------------------

### Configure Laravel Dusk with Docker Compose

Source: https://laravel.com/docs/10.x/sail

These snippets show how to configure your `docker-compose.yml` file to run Laravel Dusk tests. This involves uncommenting the Selenium service and ensuring the `laravel.test` service depends on it. This setup allows browser automation testing without local Selenium installation.

```yaml
selenium:
    image: 'selenium/standalone-chrome'
    extra_hosts:
      - 'host.docker.internal:host-gateway'
    volumes:
        - '/dev/shm:/dev/shm'
    networks:
        - sail
```

```yaml
depends_on:
    - mysql
    - redis
    - selenium
```

--------------------------------

### Consume API with JavaScript using Axios (JavaScript)

Source: https://laravel.com/docs/10.x/passport

Provides an example of how to make an API request to '/api/user' using Axios in a JavaScript application. When the `CreateFreshApiToken` middleware is active, the browser automatically sends the `laravel_token` cookie, authenticating the request without manual token handling.

```javascript
axios.get('/api/user')
    .then(response => {
        console.log(response.data);
    });
```

--------------------------------

### Start and Stop Sail Docker Containers

Source: https://laravel.com/docs/10.x/sail

These commands demonstrate how to manage the Docker containers for your Laravel application using Sail. The `sail up` command starts all defined services, while `sail up -d` starts them in detached mode (in the background). `sail stop` is used to halt all running containers.

```shell
sail up
sail up -d
sail stop
```

--------------------------------

### Create Subscription with Multiple Products - Laravel

Source: https://laravel.com/docs/10.x/billing

Demonstrates how to create a new subscription that includes multiple billing products using Laravel Cashier. This is achieved by passing an array of price IDs to the `newSubscription` method. It also shows how to specify quantities for individual prices during creation.

```php
use Illuminate\Http\Request;
use App\Models\User;

// Example route handler for subscription creation
Route::post('/user/subscribe', function (Request $request) {
    $request->user()->newSubscription('default', [
        'price_monthly',
        'price_chat',
    ])->create($request->paymentMethodId);

    // ...
});

$user = User::find(1);

// Create subscription with multiple prices and specify quantity for one
$user->newSubscription('default', ['price_monthly', 'price_chat'])
    ->quantity(5, 'price_chat')
    ->create($paymentMethod);
```

--------------------------------

### Install Swoole PHP Extension via PECL

Source: https://laravel.com/docs/10.x/octane

This command uses PECL to install the Swoole PHP extension, which is required for running Laravel Octane with the Swoole application server.

```shell
pecl install swoole
```

--------------------------------

### Common Laravel Artisan Commands

Source: https://context7.com/context7/laravel_10_x/llms.txt

A collection of frequently used Artisan commands for managing Laravel applications. These commands cover tasks like viewing routes, generating keys, running migrations, seeding databases, clearing caches, and generating IDE helper files.

```bash
# View all routes
php artisan route:list
php artisan route:list --path=api
php artisan route:list -v  # Show middleware

# Generate application key
php artisan key:generate

# Run migrations
php artisan migrate
php artisan migrate:fresh  # Drop all tables and re-migrate
php artisan migrate:rollback
php artisan migrate:status

# Create migration
php artisan make:migration create_flights_table

# Database seeding
php artisan db:seed
php artisan db:seed --class=UserSeeder

# Clear caches
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Cache for performance
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Enter tinker REPL
php artisan tinker

# Generate IDE helper files
php artisan ide-helper:generate
```

--------------------------------

### Permanently Delete a Soft Deleted Model

Source: https://laravel.com/docs/10.x/eloquent

This code demonstrates how to permanently remove a soft-deleted Eloquent model from the database using the `forceDelete` method. This action bypasses the soft delete mechanism and performs a true deletion. It is called on a model instance.

```php
$flight->forceDelete();
```

--------------------------------

### Install Packages Safely in Homestead (Shell)

Source: https://laravel.com/docs/10.x/homestead

This shell command installs packages within the Homestead VM while preventing interactive prompts for configuration file overwrites. It uses dpkg options to default to existing configurations or keep the old version.

```shell
sudo apt-get -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    install package-name
```

--------------------------------

### Fresh Migration with Laravel Artisan

Source: https://laravel.com/docs/10.x/migrations

Drops all tables from the database and then runs all pending migrations. This command effectively starts the database schema from scratch. The '--seed' option can be added to also run database seeders.

```shell
php artisan migrate:fresh
php artisan migrate:fresh --seed
```

--------------------------------

### Database Query Example in PHP (Laravel)

Source: https://laravel.com/docs/10.x/mcp

Illustrates a database query using Laravel's Eloquent ORM in PHP. This is commonly used for fetching data from the database.

```php
<?php

use App\Models\User; // Assuming a User model exists

// Fetch all users
$users = User::all();

// Fetch a specific user by ID
$user = User::find(1);

// Fetch users with specific conditions
$activeUsers = User::where('status', 'active')->get();
?>
```

--------------------------------

### Vue Component Using Inertia Props

Source: https://laravel.com/docs/10.x/frontend

An example of a Vue 3 component using the Composition API (`<script setup>`) that receives data via Inertia props. It defines props using `defineProps` and uses them within the template. It also shows how to use `Head` from `@inertiajs/vue3` for setting the page title and includes a layout component.

```vue
<script setup>
import Layout from '@/Layouts/Authenticated.vue';
import { Head } from '@inertiajs/vue3';

const props = defineProps(['user']);
</script>

<template>
    <Head title="User Profile" />

    <Layout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Profile
            </h2>
        </template>

        <div class="py-12">
            Hello, {{ user.name }}
        </div>
    </Layout>
</template>
```

--------------------------------

### Install Passport with UUIDs for Client IDs

Source: https://laravel.com/docs/10.x/passport

Installs Passport while configuring it to use UUIDs as primary keys for the client model instead of auto-incrementing integers.

```shell
php artisan passport:install --uuids
```

--------------------------------

### Restore Multiple Soft Deleted Models

Source: https://laravel.com/docs/10.x/eloquent

This code shows how to restore multiple soft-deleted models that match specific query constraints using the `restore` method on a query builder. Note that this mass operation does not dispatch model events. It requires the `withTrashed` scope.

```php
Flight::withTrashed()
        ->where('airline_id', 1)
        ->restore();
```

--------------------------------

### Install and Configure Vite React Plugin for Laravel

Source: https://laravel.com/docs/10.x/vite

Installs the Vite React plugin and configures it in vite.config.js. Ensure JSX files have .jsx or .tsx extensions and include @viteReactRefresh and @vite directives in Blade.

```sh
npm install --save-dev @vitejs/plugin-react
```

```js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins: [
        laravel(['resources/js/app.jsx']),
        react(),
    ],
});
```

```blade
@viteReactRefresh
@vite('resources/js/app.jsx')
```

--------------------------------

### Dispatch Jobs as a Batch with Callbacks in PHP

Source: https://laravel.com/docs/10.x/queues

This code illustrates how to dispatch a batch of queueable jobs using Laravel's `Bus` facade. It includes examples of using `before`, `progress`, `then`, `catch`, and `finally` callbacks to hook into the batch lifecycle. These callbacks receive a `Batch` instance and can perform actions before, during, or after the batch execution.

```php
use App\Jobs\ImportCsv;
use Illuminate\Bus\Batch;
use Illuminate\Support\Facades\Bus;
use Throwable;

$batch = Bus::batch([
    new ImportCsv(1, 100),
    new ImportCsv(101, 200),
    new ImportCsv(201, 300),
    new ImportCsv(301, 400),
    new ImportCsv(401, 500),
])->before(function (Batch $batch) {
    // The batch has been created but no jobs have been added...
})->progress(function (Batch $batch) {
    // A single job has completed successfully...
})->then(function (Batch $batch) {
    // All jobs completed successfully...
})->catch(function (Batch $batch, Throwable $e) {
    // First batch job failure detected...
})->finally(function (Batch $batch) {
    // The batch has finished executing...
})->dispatch();

return $batch->id;
```

--------------------------------

### Remove Soft Deletes Column from Database Table

Source: https://laravel.com/docs/10.x/eloquent

This snippet shows how to remove the `deleted_at` column from a database table using Laravel's schema builder. This is typically done when disabling soft deletes. It requires the `Illuminate\Database\Schema\Blueprint` and `Illuminate\Support\Facades\Schema` facade.

```php
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

Schema::table('flights', function (Blueprint $table) {
    $table->dropSoftDeletes();
});
```

--------------------------------

### Mass Pruning Models with `MassPrunable` Trait (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Use the `MassPrunable` trait for efficient deletion of models using mass-deletion queries. This bypasses model events and the `pruning` method, making it faster for large datasets but less flexible for custom cleanup logic.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\MassPrunable;

class Flight extends Model
{
    use MassPrunable;

    /**
     * Get the prunable model query.
     */
    public function prunable(): Builder
    {
        return static::where('created_at', '<=', now()->subMonth());
    }
}
```

--------------------------------

### Install Octane Configuration

Source: https://laravel.com/docs/10.x/octane

Executes the Octane Artisan command to install Octane's configuration file into your Laravel application. This command generates the necessary configuration files for Octane.

```shell
php artisan octane:install
```

--------------------------------

### Install Laravel Reverb with Composer

Source: https://laravel.com/docs/10.x/reverb

Installs the Laravel Reverb package into your project using the Composer package manager. Requires PHP 8.2+ and Laravel 10.47+.

```sh
composer require laravel/reverb
```

--------------------------------

### Install Dompdf for Invoice PDFs

Source: https://laravel.com/docs/10.x/billing

Installs the Dompdf library using Composer, which is the default PDF renderer for Laravel Cashier invoices. This is a prerequisite for generating invoice PDFs.

```bash
composer require dompdf/dompdf
```

--------------------------------

### Configure Trial Period for Subscription Checkout in Laravel

Source: https://laravel.com/docs/10.x/billing

This example demonstrates setting a trial period for a subscription that will be finalized using Stripe Checkout. The `trialDays()` method is used to specify the trial duration. Note that Stripe Checkout requires a minimum trial period of 48 hours.

```php
$checkout = Auth::user()->newSubscription('default', 'price_monthly')
    ->trialDays(3)
    ->checkout();
```

--------------------------------

### Apply Coupon to Subscription

Source: https://laravel.com/docs/10.x/billing

Use the `withCoupon` method to apply a coupon code when creating a new subscription. This method takes the coupon code as an argument and should be chained before the `create` method.

```php
$user->newSubscription('default', 'price_monthly')
     ->withCoupon('code')
     ->create($paymentMethod);
```

--------------------------------

### Check if Model Instance is Soft Deleted

Source: https://laravel.com/docs/10.x/eloquent

This code illustrates how to check if a specific Eloquent model instance has been soft deleted using the `trashed` method. This method returns a boolean value indicating the deletion status. It is called on a model instance.

```php
if ($flight->trashed()) {
    // ...
}
```

--------------------------------

### Envoy @before Hook Example

Source: https://laravel.com/docs/10.x/envoy

Illustrates the usage of the `@before` hook in Envoy, which executes code locally before each task. This example checks if the upcoming task is 'deploy'.

```blade
@before
    if ($task === 'deploy') {
        // ...
    }
@endbefore
```

--------------------------------

### Configure Local File Permissions in Laravel (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Provides a configuration example for the `local` driver in Laravel's `filesystems` configuration file. It shows how to map 'public' and 'private' visibility settings to specific file and directory permissions (octal notation).

```PHP
'local' => [
    'driver' => 'local',
    'root' => storage_path('app'),
    'permissions' => [
        'file' => [
            'public' => 0644,
            'private' => 0600,
        ],
        'dir' => [
            'public' => 0755,
            'private' => 0700,
        ],
    ],
],
```

--------------------------------

### Chunking Eloquent Results for Memory Efficiency in PHP

Source: https://laravel.com/docs/10.x/eloquent

Illustrates how to process large numbers of Eloquent models efficiently using the `chunk` method. This method retrieves models in smaller subsets (chunks), reducing memory usage. It takes the chunk size and a callback closure for processing each chunk.

```php
use App\Models\Flight;
use Illuminate\Database\Eloquent\Collection;

Flight::chunk(200, function (Collection $flights) {
    foreach ($flights as $flight) {
        // ...
    }
});
```

--------------------------------

### Manage PHP Versions with Valet

Source: https://laravel.com/docs/10.x/valet

Valet allows switching between PHP versions using the `valet use php@version` command. It can install missing versions via Homebrew. A `.valetrc` file can specify a default PHP version for a project. Valet only serves one PHP version at a time.

```shell
valet use php@8.1

valet use php
```

```shell
php=php@8.1
```

--------------------------------

### Install Laravel Precognition Vue Inertia Package

Source: https://laravel.com/docs/10.x/precognition

This command installs the Laravel Precognition library compatible with Vue and Inertia using NPM. Ensure you have Node.js and NPM installed.

```shell
npm install laravel-precognition-vue-inertia
```

--------------------------------

### Instantiate a Model Factory Instance (PHP)

Source: https://laravel.com/docs/10.x/eloquent-factories

This PHP code shows the basic method of obtaining a factory instance for a User model using the static 'factory' method provided by the HasFactory trait. This instance is the starting point for creating and manipulating models.

```php
use App\Models\User;

$user = User::factory()->make();
```

--------------------------------

### Install Slack Notification Channel

Source: https://laravel.com/docs/10.x/notifications

Installs the Slack notification channel for Laravel using Composer. This is a prerequisite for sending Slack notifications.

```shell
composer require laravel/slack-notification-channel
```

--------------------------------

### Create Stripe Customer without Subscription (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet shows how to create a Stripe customer associated with a billable model without immediately starting a subscription. The `createAsStripeCustomer` method is used, and it accepts an optional array for additional Stripe API customer creation parameters.

```php
$stripeCustomer = $user->createAsStripeCustomer();

$stripeCustomer = $user->createAsStripeCustomer($options);
```

--------------------------------

### Implement a Global Scope in PHP

Source: https://laravel.com/docs/10.x/eloquent

Defines a custom global scope by implementing the `Scope` interface and its `apply` method. The `apply` method adds constraints to the query builder, such as filtering by `created_at` before a specific date. It's recommended to use `addSelect` if adding columns to the select clause.

```php
<?php

namespace App\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;

class AncientScope implements Scope
{
    /**
     * Apply the scope to a given Eloquent query builder.
     */
    public function apply(Builder $builder, Model $model): void
    {
        $builder->where('created_at', '<', now()->subYears(2000));
    }
}
```

--------------------------------

### Simulate a basic process execution in Laravel

Source: https://laravel.com/docs/10.x/processes

This snippet demonstrates how to run an external command using Laravel's Process facade. It's useful for integrating shell scripts or other command-line tools within your application. The output can be captured and returned.

```php
use Illuminate\Support\Facades\Process;
use Illuminate\Support\Facades\Route;

Route::get('/import', function () {
    Process::run('bash import.sh');

    return 'Import complete!';
});
```

--------------------------------

### Get string between two values using `between` - Laravel

Source: https://laravel.com/docs/10.x/strings

The `between` method extracts the portion of a string that lies between two specified delimiter values. It finds the first occurrence of the start delimiter and the first occurrence of the end delimiter after that. This is part of Laravel's string utilities.

```PHP
use Illuminate\Support\Str;

$converted = Str::of('This is my name')->between('This', 'name');

// ' is my '
```

--------------------------------

### Laravel Controller Dependency Injection Example

Source: https://laravel.com/docs/10.x/container

Demonstrates dependency injection in a Laravel controller constructor. The UserRepository is injected, allowing for easy swapping of implementations and mocking for testing. This is a common pattern for managing data retrieval logic.

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Repositories\UserRepository;
use App\Models\User;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     */
    public function __construct(
        protected UserRepository $users,
    ) {}

    /**
     * Show the profile for the given user.
     */
    public function show(string $id): View
    {
        $user = $this->users->find($id);

        return view('user.profile', ['user' => $user]);
    }
}
```

--------------------------------

### Lazy Loading Eloquent Results by ID in PHP

Source: https://laravel.com/docs/10.x/eloquent

Shows how to use `lazyById` for memory-efficient iteration when filtering and updating records. It retrieves models sequentially by ID, ensuring data integrity. The method can also be configured to process in descending ID order using `lazyByIdDesc`.

```php
Flight::where('departed', true)
    ->lazyById(200, $column = 'id')
    ->each->update(['departed' => false]);
```

--------------------------------

### Install Open Swoole PHP Extension via PECL

Source: https://laravel.com/docs/10.x/octane

This command uses PECL to install the Open Swoole PHP extension. Open Swoole provides similar functionality to Swoole, such as concurrent tasks and intervals, for Laravel Octane applications.

```shell
pecl install openswoole
```

--------------------------------

### Share a Specific Site with Custom Ngrok Options

Source: https://laravel.com/docs/10.x/homestead

Shares a specific configured site using custom Ngrok runtime options, such as specifying the region and subdomain. This allows for more granular control over the shared environment.

```shell
share homestead.test -region=eu -subdomain=laravel
```

--------------------------------

### Generate Controllers in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

This snippet provides the Artisan console commands to generate controllers in Laravel. It shows how to create a basic controller and a resource controller.

```bash
# Generate controller
php artisan make:controller UserController

# Generate resource controller
php artisan make:controller PhotoController --resource

```

--------------------------------

### Configure SFTP Filesystem Disk

Source: https://laravel.com/docs/10.x/filesystem

Provides a sample configuration for an SFTP filesystem disk in Laravel's `filesystems.php`. It supports both basic authentication and SSH key-based authentication, along with settings for file visibility and optional parameters.

```php
'sftp' => [
    'driver' => 'sftp',
    'host' => env('SFTP_HOST'),

    // Settings for basic authentication...
    'username' => env('SFTP_USERNAME'),
    'password' => env('SFTP_PASSWORD'),

    // Settings for SSH key based authentication with encryption password...
    'privateKey' => env('SFTP_PRIVATE_KEY'),
    'passphrase' => env('SFTP_PASSPHRASE'),

    // Settings for file / directory permissions...
    'visibility' => 'private', // `private` = 0600, `public` = 0644
    'directory_visibility' => 'private', // `private` = 0700, `public` = 0755

    // Optional SFTP Settings...
    // 'hostFingerprint' => env('SFTP_HOST_FINGERPRINT'),
    // 'maxTries' => 4,
    // 'passphrase' => env('SFTP_PASSPHRASE'),
    // 'port' => env('SFTP_PORT', 22),
    // 'root' => env('SFTP_ROOT', ''),
    // 'timeout' => 30,
    // 'useAgent' => true,
]
```

--------------------------------

### Create Blade Views in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

Illustrates the creation and usage of Blade view files in Laravel. It demonstrates how to render dynamic data using double curly braces for escaped output and triple curly braces for unescaped HTML. The example also covers conditional rendering with `@if`, `@elseif`, `@else`, looping through data with `@foreach` and `@forelse`, and including CSRF tokens and method spoofing in forms.

```blade
<!-- resources/views/user/profile.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <title>{{ $user->name }}'s Profile</title>
</head>
<body>
    <h1>Welcome, {{ $user->name }}</h1>

    <!-- Escaped output -->
    <p>{{ $user->bio }}</p>

    <!-- Unescaped output -->
    <div>{!! $user->html_content !!}</div>

    <!-- Conditional -->
    @if ($user->isAdmin())
        <p>You are an admin</p>
    @elseif ($user->isModerator())
        <p>You are a moderator</p>
    @else
        <p>You are a regular user</p>
    @endif

    <!-- Loops -->
    @foreach ($user->posts as $post)
        <article>
            <h2>{{ $post->title }}</h2>
            <p>{{ $post->excerpt }}</p>
        </article>
    @endforeach

    @forelse ($user->comments as $comment)
        <p>{{ $comment->text }}</p>
    @empty
        <p>No comments yet</p>
    @endforelse

    <!-- CSRF token -->
    <form method="POST" action="/profile">
        @csrf
        @method('PUT')

        <input type="text" name="name" value="{{ old('name', $user->name) }}">
        <button type="submit">Update</button>
    </form>
</body>
</html>
```

--------------------------------

### Create an on-demand logging stack in Laravel

Source: https://laravel.com/docs/10.x/logging

Shows how to create and use an on-demand logging stack composed of multiple channels using the `Log::stack` method. This enables simultaneous logging to different configurations.

```php
use Illuminate\Support\Facades\Log;

Log::stack(['single', 'slack'])->info('Something happened!');
```

--------------------------------

### Enable Blackfire Profiling (YAML)

Source: https://laravel.com/docs/10.x/homestead

Enables Blackfire.io profiling for your Homestead environment by adding the 'features' section to your Homestead.yaml file. You need to provide your Blackfire server and client credentials obtained from their website.

```yaml
features:
    - blackfire:
        server_id: "server_id"
        server_token: "server_value"
        client_id: "client_id"
        client_token: "client_value"
```

--------------------------------

### Install Laravel Sail in Existing Application (Composer)

Source: https://laravel.com/docs/10.x/sail

Installs the laravel/sail package as a development dependency into an existing Laravel application using Composer. This is the first step to integrating Sail into a project not initially set up with it.

```shell
composer require laravel/sail --dev
```

--------------------------------

### Get the smallest string between two values using `betweenFirst` - Laravel

Source: https://laravel.com/docs/10.x/strings

The `betweenFirst` method extracts the smallest possible portion of a string between the first occurrence of a start delimiter and the first occurrence of an end delimiter that follows it. This is useful when dealing with nested or multiple occurrences of delimiters.

```PHP
use Illuminate\Support\Str;

$converted = Str::of('[a] bc [d]')->betweenFirst('[', ']');

// 'a'
```

--------------------------------

### Configure FTP Filesystem Disk

Source: https://laravel.com/docs/10.x/filesystem

Provides a sample configuration for an FTP filesystem disk within Laravel's `filesystems.php` configuration file. It includes essential settings like host, username, and password, with optional parameters for port, root directory, and security.

```php
'ftp' => [
    'driver' => 'ftp',
    'host' => env('FTP_HOST'),
    'username' => env('FTP_USERNAME'),
    'password' => env('FTP_PASSWORD'),

    // Optional FTP Settings...
    // 'port' => env('FTP_PORT', 21),
    // 'root' => env('FTP_ROOT'),
    // 'passive' => true,
    // 'ssl' => true,
    // 'timeout' => 30,
]
```

--------------------------------

### Pruning Models with `Prunable` Trait (PHP)

Source: https://laravel.com/docs/10.x/eloquent

Implement the `Prunable` trait to define a `prunable` method that returns a query builder for models to be deleted. Optionally, define a `pruning` method for pre-deletion cleanup. This is suitable for models where the deletion process needs to trigger events or perform related actions.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Prunable;

class Flight extends Model
{
    use Prunable;

    /**
     * Get the prunable model query.
     */
    public function prunable(): Builder
    {
        return static::where('created_at', '<=', now()->subMonth());
    }

    /**
     * Prepare the model for pruning.
     */
    protected function pruning(): void
    {
        // ...
    }
}
```

--------------------------------

### Customize Subscription Checkout URLs in Laravel

Source: https://laravel.com/docs/10.x/billing

This code example shows how to specify custom success and cancellation URLs for a Stripe Checkout subscription session initiated via Laravel Cashier. The `checkout()` method accepts an array of options, including `success_url` and `cancel_url`.

```php
use Illuminate\Http\Request;

Route::get('/subscription-checkout', function (Request $request) {
    return $request->user()
        ->newSubscription('default', 'price_monthly')
        ->checkout([
            'success_url' => route('your-success-route'),
            'cancel_url' => route('your-cancel-route'),
        ]);
});
```

--------------------------------

### Test Authenticated API Request with Sanctum - PHP

Source: https://laravel.com/docs/10.x/sanctum

This PHP code demonstrates how to test API routes that are protected by Sanctum. The `Sanctum::actingAs` method allows you to authenticate a user for testing purposes and optionally specify the abilities granted to their token. It then makes a GET request to '/api/task' and asserts that the response is OK.

```php
use App\Models\User;
use Laravel\Sanctum\Sanctum;

public function test_task_list_can_be_retrieved(): void
{
    Sanctum::actingAs(
        User::factory()->create(),
        ['view-tasks']
    );

    $response = $this->get('/api/task');

    $response->assertOk();
}
```

--------------------------------

### Add Start of String - Laravel

Source: https://laravel.com/docs/10.x/strings

Adds a specified string to the beginning of another string only if it does not already start with the specified value. Ensures a consistent string prefix.

```php
use Illuminate\Support\Str;

$adjusted = Str::of('this/string')->start('/');

// /this/string

$adjusted = Str::of('/this/string')->start('/');

// /this/string
```

--------------------------------

### Resolving Configuration Repository with Closure (Laravel)

Source: https://laravel.com/docs/10.x/octane

This example presents workarounds for injecting the configuration repository. It includes binding the service as transient and binding it as a singleton with a closure that resolves the latest configuration instance on demand, which is a recommended approach.

```php
use App\Service;
use Illuminate\Container\Container;
use Illuminate\Contracts\Foundation\Application;

$this->app->bind(Service::class, function (Application $app) {
    return new Service($app->make('config'));
});

$this->app->singleton(Service::class, function () {
    return new Service(fn () => Container::getInstance()->make('config'));
});
```

--------------------------------

### Using Cache and Route Facades in Laravel

Source: https://laravel.com/docs/10.x/facades

Demonstrates how to use the Cache and Route facades to define a GET route that retrieves a value from the cache. It requires importing the facades from the `IlluminateSupportFacades` namespace.

```php
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;

Route::get('/cache', function () {
    return Cache::get('key');
});
```

--------------------------------

### Configure Homestead Provider

Source: https://laravel.com/docs/10.x/homestead

This YAML snippet shows how to set the Vagrant provider in the Homestead.yaml file. Options include 'virtualbox' and 'parallels'. The Parallels provider is required for Apple Silicon.

```yaml
provider: virtualbox
```

--------------------------------

### Credit Customer Balance (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet demonstrates how to credit a customer's balance. The `creditBalance` method accepts a numeric value for the amount to credit and an optional description string.

```php
$user->creditBalance(500, 'Premium customer top-up.');
```

--------------------------------

### PHP: Get Substring Between Two Values with Str::between

Source: https://laravel.com/docs/10.x/strings

The `Str::between` method extracts and returns the portion of a string situated between two specified delimiter values. It finds the first occurrence of the start delimiter and the first occurrence of the end delimiter after that, returning the content in between.

```php
use Illuminate\Support\Str;

$slice = Str::between('This is my name', 'This', 'name');

// ' is my '
```

--------------------------------

### Run Synchronous Process and Get Output (PHP)

Source: https://laravel.com/docs/10.x/processes

Executes a command synchronously and retrieves its standard output. The `run` method waits for the process to complete. The result object provides methods to check success, exit code, output, and error output.

```php
use Illuminate\Support\Facades\Process;

$result = Process::run('ls -la');

return $result->output();
```

--------------------------------

### Initiate Subscription Checkout in Laravel

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to create a new subscription using Laravel Cashier and initiate a Stripe Checkout session. It requires the user object, subscription name, and a Stripe price ID. The `checkout()` method redirects the user to Stripe.

```php
use Illuminate\Http\Request;

Route::get('/subscription-checkout', function (Request $request) {
    return $request->user()
        ->newSubscription('default', 'price_monthly')
        ->checkout();
});
```

--------------------------------

### Protect API Route with Sanctum - PHP

Source: https://laravel.com/docs/10.x/sanctum

This code example shows how to protect a Laravel API route using the 'auth:sanctum' middleware. Any incoming requests to the '/user' route will require a valid Sanctum API token in the Authorization header. If authenticated, it returns the authenticated user.

```php
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
```

--------------------------------

### Publish Package Assets Using Artisan CLI

Source: https://laravel.com/docs/10.x/packages

Shows the command-line instruction to publish assets that have been tagged for publishing, specifically using the 'public' tag in this example. The `--force` flag is often used to overwrite existing assets.

```shell
php artisan vendor:publish --tag=public --force
```

--------------------------------

### Registering View Composers in Laravel Service Provider's Boot Method

Source: https://laravel.com/docs/10.x/providers

This example shows how to register a view composer within the `boot` method of a Laravel Service Provider. The `boot` method is executed after all other service providers have been registered, allowing access to other registered services. Dependencies include `Illuminate\Support\Facades\View` and `Illuminate\Support\ServiceProvider`.

```php
<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('view', function () {
            // ...
        });
    }
}
```

--------------------------------

### Install Laravel Octane via Composer

Source: https://laravel.com/docs/10.x/octane

Installs the Laravel Octane package using the Composer package manager. This is the first step to integrating Octane into your Laravel application.

```shell
composer require laravel/octane
```

--------------------------------

### Basic MCP Server Structure (PHP)

Source: https://laravel.com/docs/10.x/mcp

Demonstrates the fundamental structure of an MCP server class. It extends Laravel MCP's base `Server` class and includes arrays for registering tools, resources, and prompts.

```php
<?php

namespace App\Mcp\Servers;

use Laravel\Mcp\Server;

class WeatherServer extends Server
{
    /**
     * The tools registered with this MCP server.
     *
     * @var array<int, class-string<\Laravel\Mcp\Server\Tool>>
     */
    protected array $tools = [
        // ExampleTool::class,
    ];

    /**
     * The resources registered with this MCP server.
     *
     * @var array<int, class-string<\Laravel\Mcp\Server\Resource>>
     */
    protected array $resources = [
        // ExampleResource::class,
    ];

    /**
     * The prompts registered with this MCP server.
     *
     * @var array<int, class-string<\Laravel\Mcp\Server\Prompt>>
     */
    protected array $prompts = [
        // ExamplePrompt::class,
    ];
}
```

--------------------------------

### Iterate Eloquent Models with Cursor for Memory Efficiency (PHP)

Source: https://laravel.com/docs/10.x/eloquent

The `cursor` method allows iterating through large Eloquent model datasets with minimal memory consumption by hydrating models one at a time. It uses PHP generators internally. This method does not support eager loading of relationships. Ensure to use alternatives like `lazy` for eager loading.

```php
use App\Models\Flight;

foreach (Flight::where('destination', 'Zurich')->cursor() as $flight) {
    // ...
}
```

```php
use App\Models\User;

$users = User::cursor()->filter(function (User $user) {
    return $user->id > 500;
});

foreach ($users as $user) {
    echo $user->id;
}
```

--------------------------------

### Install Mailgun Mailer Transport (Shell)

Source: https://laravel.com/docs/10.x/mail

Installs the necessary Symfony Mailer transport for Mailgun and HTTP client components using Composer. This is a prerequisite for using the Mailgun driver.

```shell
composer require symfony/mailgun-mailer symfony/http-client
```

--------------------------------

### Reload Homestead VM with Provisioning

Source: https://laravel.com/docs/10.x/homestead

Command to reload the Homestead virtual machine and re-run the provisioning scripts. This is essential after making changes to configuration files like Homestead.yaml or the aliases file.

```shell
vagrant reload --provision
```

--------------------------------

### Delete Eloquent Model by Primary Key

Source: https://laravel.com/docs/10.x/eloquent

Deletes a model without retrieving it first, using its primary key. This method can accept a single primary key, multiple primary keys, an array of keys, or a collection of keys. It dispatches model events for each deleted model.

```PHP
Flight::destroy(1);

Flight::destroy(1, 2, 3);

Flight::destroy([1, 2, 3]);

Flight::destroy(collect([1, 2, 3]));
```

--------------------------------

### Checkout Homestead Release Branch

Source: https://laravel.com/docs/10.x/homestead

After cloning, this command navigates into the Homestead directory and checks out the 'release' branch, ensuring you are using the latest stable version of Homestead.

```shell
cd ~/Homestead

git checkout release
```

--------------------------------

### Get Uploaded File Name and Extension (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Provides examples for retrieving the original name and extension of an uploaded file using `getClientOriginalName` and `getClientOriginalExtension`. It also highlights safer alternatives, `hashName` and `extension`, which generate unique names and determine extensions based on MIME type, respectively, to mitigate security risks.

```PHP
$file = $request->file('avatar');

$name = $file->getClientOriginalName();
$extension = $file->getClientOriginalExtension();
```

```PHP
$file = $request->file('avatar');

$name = $file->hashName(); // Generate a unique, random name...
$extension = $file->extension(); // Determine the file's extension based on the file's MIME type...
```

--------------------------------

### Retrieve Metered Usage Records (Laravel)

Source: https://laravel.com/docs/10.x/billing

Retrieves a collection of past usage records for a customer's subscription. You can fetch records for a specific metered price if the subscription has multiple prices. The returned collection contains details like the period start and end dates, and total usage.

```PHP
$user = User::find(1);

$usageRecords = $user->subscription('default')->usageRecords();
```

```PHP
$user = User::find(1);

$usageRecords = $user->subscription('default')->usageRecordsFor('price_metered');
```

--------------------------------

### Configured Suggest Input in Laravel Prompts

Source: https://laravel.com/docs/10.x/prompts

Enhances a 'suggest' prompt with additional configurations like placeholder text, default values, and informational hints. This improves user experience and clarity.

```php
$name = suggest(
    label: 'What is your name?',
    options: ['Taylor', 'Dayle'],
    placeholder: 'E.g. Taylor',
    default: $user?->name,
    hint: 'This will be displayed on your profile.'
);
```

--------------------------------

### Laravel Passport actingAsClient for Authenticated Client Testing

Source: https://laravel.com/docs/10.x/passport

Employ Passport's `actingAsClient` method in tests to simulate an authenticated OAuth client with specified scopes. This is useful for testing API endpoints that require client credentials and authorization. The method accepts a client instance and an array of scopes, as shown in the example for retrieving orders.

```PHP
use Laravel\Passport\Client;
use Laravel\Passport\Passport;

public function test_orders_can_be_retrieved(): void
{
    Passport::actingAsClient(
        Client::factory()->create(),
        ['check-status']
    );

    $response = $this->get('/api/orders');

    $response->assertStatus(200);
}
```

--------------------------------

### Register Web MCP Server with Middleware (PHP)

Source: https://laravel.com/docs/10.x/mcp

Registers a web MCP server and applies middleware for access control or rate limiting. This example uses the `throttle:mcp` middleware.

```php
Mcp::web('/mcp/weather', WeatherServer::class)
    ->middleware(['throttle:mcp']);
```

--------------------------------

### Generate Homestead Configuration Files (Shell)

Source: https://laravel.com/docs/10.x/homestead

This command generates the `Vagrantfile` and `Homestead.yaml` files for a project. It automatically configures site and folder directives in `Homestead.yaml`. Usage varies slightly between macOS/Linux and Windows.

```shell
# macOS / Linux...
php vendor/bin/homestead make

# Windows...
vendor\\bin\\homestead make
```

--------------------------------

### Publish Sanctum Configuration and Migrations

Source: https://laravel.com/docs/10.x/sanctum

Publishes Sanctum's configuration and migration files using the `vendor:publish` Artisan command. The configuration file is placed in `config/sanctum.php`.

```shell
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
```

--------------------------------

### Obtain Cache Instance - PHP

Source: https://laravel.com/docs/10.x/cache

Demonstrates how to obtain an instance of the cache store using the Cache facade in Laravel. This is the primary method for interacting with the cache system.

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
     * Show a list of all users of the application.
     */
    public function index(): array
    {
        $value = Cache::get('key');

        return [
            // ...
        ];
    }
}
```

--------------------------------

### Preview Subscription Invoice with New Price (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to preview what a customer's invoice will look like after a price change using the `previewInvoice` method. It takes the new price ID as an argument.

```PHP
$invoice = $user->subscription('default')->previewInvoice('price_yearly');
```

--------------------------------

### Customize Select Prompt with Default and Hint in PHP

Source: https://laravel.com/docs/10.x/prompts

Enhance the `select` prompt by specifying a default selected option and an informational hint. This guides the user's choice.

```php
$role = select(
    label: 'What role should the user have?',
    options: ['Member', 'Contributor', 'Owner'],
    default: 'Owner',
    hint: 'The role may be changed at any time.'
);
```

--------------------------------

### Laravel Passport actingAs for Authenticated User Testing

Source: https://laravel.com/docs/10.x/passport

Use Passport's `actingAs` method in tests to simulate an authenticated user with specific scopes. This method takes a user instance and an array of scopes as arguments, enabling you to test API endpoints that require user authentication and authorization. The example demonstrates creating a user, assigning a scope, and making a POST request.

```PHP
use App\Models\User;
use Laravel\Passport\Passport;

public function test_servers_can_be_created(): void
{
    Passport::actingAs(
        User::factory()->create(),
        ['create-servers']
    );

    $response = $this->post('/api/create-server');

    $response->assertStatus(201);
}
```

--------------------------------

### Assign Abilities to API Tokens

Source: https://laravel.com/docs/10.x/sanctum

Demonstrates how to assign specific abilities (scopes) to an API token when creating it using the `createToken` method. Abilities control the permissions of the token.

```php
return $user->createToken('token-name', ['server:update'])->plainTextToken;
```

--------------------------------

### Publish Specific Package File Groups

Source: https://laravel.com/docs/10.x/packages

Demonstrates how to tag specific groups of package files for separate publishing. This example shows how to tag configuration files and migration files individually, allowing users to publish only the desired group.

```php
/**
 * Bootstrap any package services.
 */
public function boot(): void
{
    $this->publishes([
        __DIR__.'/../config/package.php' => config_path('package.php')
    ], 'courier-config');

    $this->publishes([
        __DIR__.'/../database/migrations/' => database_path('migrations')
    ], 'courier-migrations');
}
```

--------------------------------

### Advanced Subquery Selects with Eloquent (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This snippet demonstrates using Eloquent's `addSelect` method with a subquery to retrieve data from related tables in a single query. It selects destinations and the name of the most recently arrived flight for each destination. Ensure the subquery correctly references related tables and columns.

```php
use App\Models\Destination;
use App\Models\Flight;

return Destination::addSelect(['last_flight' => Flight::select('name')
    ->whereColumn('destination_id', 'destinations.id')
    ->orderByDesc('arrived_at')
    ->limit(1)
])->get();
```

--------------------------------

### Use UUIDs as Primary Keys in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

This snippet demonstrates how to use UUIDs as primary keys for Eloquent models by utilizing the `HasUuids` trait. Ensure your migration includes a UUID equivalent primary key column. The trait generates ordered UUIDs by default.

```php
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasUuids;

    // ...
}

$article = Article::create(['title' => 'Traveling to Europe']);

$article->id; // "8f8e8478-9035-4d23-b9a7-62f4d2612ce5"
```

--------------------------------

### Use ULIDs as Primary Keys in Eloquent Models

Source: https://laravel.com/docs/10.x/eloquent

This code demonstrates how to use ULIDs as primary keys for Eloquent models, offering lexicographical sortability similar to ordered UUIDs. Use the `HasUlids` trait and ensure your migration includes a ULID equivalent primary key column.

```php
use Illuminate\Database\Eloquent\Concerns\HasUlids;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasUlids;

    // ...
}

$article = Article::create(['title' => 'Traveling to Asia']);

$article->id; // "01gd4d3tgrrfqeda94gdbtdk5c"
```

--------------------------------

### Perform Multiple Upserts in a Single Query

Source: https://laravel.com/docs/10.x/eloquent

Executes multiple 'upserts' (update or insert) in a single database query. It takes an array of records to insert/update, a list of columns that uniquely identify records, and an array of columns to update if a record exists. Timestamps are automatically managed if enabled.

```PHP
Flight::upsert([
    ['departure' => 'Oakland', 'destination' => 'San Diego', 'price' => 99],
    ['departure' => 'Chicago', 'destination' => 'New York', 'price' => 150]
], ['departure', 'destination'], ['price']);
```

--------------------------------

### Map Eloquent Model Events to Event Classes (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This snippet demonstrates how to define the `$dispatchesEvents` property on an Eloquent model to map lifecycle events ('saved', 'deleted') to custom event classes (UserSaved::class, UserDeleted::class). This allows for custom logic to be executed when these specific model events occur.

```php
<?php

namespace App\Models;

use App\Events\UserDeleted;
use App\Events\UserSaved;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The event map for the model.
     *
     * @var array
     */
    protected $dispatchesEvents = [
        'saved' => UserSaved::class,
        'deleted' => UserDeleted::class,
    ];
}
```

--------------------------------

### PHP: Get Smallest Substring Between First Occurrences with Str::betweenFirst

Source: https://laravel.com/docs/10.x/strings

The `Str::betweenFirst` method returns the smallest possible string segment found between the first occurrence of a starting delimiter and the first occurrence of an ending delimiter. This is useful when a string might contain multiple pairs of delimiters.

```php
use Illuminate\Support\Str;

$slice = Str::betweenFirst('[a] bc [d]', '[', ']');

// 'a'
```

--------------------------------

### Fluent Keyboard Interactions with Laravel Dusk (PHP)

Source: https://laravel.com/docs/10.x/dusk

The `withKeyboard` method provides a fluent interface for complex keyboard actions using the `LaravelDuskKeyboard` class. It allows chaining `press`, `release`, `type`, and `pause` methods within a closure to control keyboard events precisely.

```php
use Laravel\Dusk\Keyboard;

$browser->withKeyboard(function (Keyboard $keyboard) {
    $keyboard->press('c')
        ->pause(1000)
        ->release('c')
        ->type(['c', 'e', 'o']);
});
```

--------------------------------

### Publish Package File Groups Using Artisan CLI

Source: https://laravel.com/docs/10.x/packages

Provides the command-line instruction to publish specific groups of package files by referencing their assigned tags. This example shows how to publish the 'courier-config' group.

```shell
php artisan vendor:publish --tag=courier-config
```

--------------------------------

### Managing Concurrent Processes with Laravel Pools in PHP

Source: https://laravel.com/docs/10.x/processes

Illustrates how to manage a pool of concurrent, asynchronous processes in PHP using Laravel's `Process::pool` method. It shows how to define multiple commands within a pool, start them, and optionally handle output in real-time. The `wait` method is used to retrieve results from all processes in the pool.

```php
use IlluminateProcessPool;
use IlluminateSupportFacadesProcess;

$pool = Process::pool(function (Pool $pool) {
    $pool->path(__DIR__)->command('bash import-1.sh');
    $pool->path(__DIR__)->command('bash import-2.sh');
    $pool->path(__DIR__)->command('bash import-3.sh');
})->start(function (string $type, string $output, int $key) {
    // ...
});

while ($pool->running()->isNotEmpty()) {
    // ...
}

$results = $pool->wait();
```

--------------------------------

### Publish Cashier Configuration File

Source: https://laravel.com/docs/10.x/billing

Publishes Cashier's configuration file using an Artisan command. This allows for customization of Cashier's settings beyond environment variables.

```shell
php artisan vendor:publish --tag="cashier-config"
```

--------------------------------

### Perform Mass Updates on Eloquent Models (PHP)

Source: https://laravel.com/docs/10.x/eloquent

This code illustrates how to perform mass updates on models that match specific query constraints. The `update` method modifies multiple records at once and returns the count of affected rows. Note that model events like `saving` and `saved` are not fired during mass updates.

```php
Flight::where('active', 1)
      ->where('destination', 'San Diego')
      ->update(['delayed' => 1]);
```

--------------------------------

### Vue 3 Inertia Form Submission with Precognition

Source: https://laravel.com/docs/10.x/precognition

This Vue 3 script setup example demonstrates how to use the `useForm` function from `laravel-precognition-vue-inertia`. It initializes a form with a 'post' method and URL, and defines a submit function that handles form submission with Inertia's visit options, including `preserveScroll` and `onSuccess` callbacks.

```vue
<script setup>
import { useForm } from 'laravel-precognition-vue-inertia';

const form = useForm('post', '/users', {
    name: '',
    email: '',
});

const submit = () => form.submit({
    preserveScroll: true,
    onSuccess: () => form.reset(),
});
</script>
```

--------------------------------

### Boot Method Dependency Injection in Laravel Service Provider

Source: https://laravel.com/docs/10.x/providers

This snippet illustrates dependency injection within the `boot` method of a Laravel Service Provider. By type-hinting dependencies like `ResponseFactory`, the service container automatically injects the required instances. This allows for easier access to framework services within the boot process. The code uses a closure for a macro definition.

```php
use Illuminate\Contracts\Routing\ResponseFactory;

/**
 * Bootstrap any application services.
 */
public function boot(ResponseFactory $response): void
{
    $response->macro('serialized', function (mixed $value) {
        // ...
    });
}
```

--------------------------------

### Testing Individual Job Interaction with a Fake Batch

Source: https://laravel.com/docs/10.x/queues

This example demonstrates how to test an individual job's interaction with its batch by assigning a fake batch using the `withFakeBatch` method. It allows simulating actions like cancelling the batch and verifying outcomes.

```php
use App\Jobs\ShipOrder;

[$job, $batch] = (new ShipOrder)->withFakeBatch();

$job->handle();

// Assertions on the fake batch, e.g.:
// $this->assertTrue($batch->cancelled());
// $this->assertEmpty($batch->added);
```

--------------------------------

### Show Specific Configuration File - Artisan

Source: https://laravel.com/docs/10.x/configuration

The `config:show` Artisan command allows you to inspect the values of a specific configuration file in detail. This is useful for understanding the current settings of a particular configuration.

```shell
php artisan config:show database
```

--------------------------------

### Providing Auto-Completion Suggestions in PHP

Source: https://laravel.com/docs/10.x/artisan

The `anticipate` method provides auto-completion hints for user input. It accepts an array of possible choices or a closure that generates choices based on the current input. This enhances user experience by guiding input.

```PHP
<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class AutoCompleteInput extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:autocomplete-input';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
        $name = $this->anticipate('What is your name?', ['Taylor', 'Dayle', 'Samantha']);
        $this->info("Selected name: {$name}");

        $address = $this->anticipate('What is your address?', function (string $input) {
            // Example: Fetch addresses from an API based on input
            return ['123 Main St', '456 Oak Ave', '789 Pine Ln']
                // Filter options based on input if needed
                . array_filter($input) ? array_filter(['123 Main St', '456 Oak Ave', '789 Pine Ln'], fn($opt) => str_starts_with($opt, $input)) : ['123 Main St', '456 Oak Ave', '789 Pine Ln'];
        });
        $this->info("Selected address: {$address}");
    }
}

```

--------------------------------

### Queueing Artisan Commands in Laravel

Source: https://laravel.com/docs/10.x/artisan

Explains how to queue Artisan commands for background processing using `Artisan::queue`. It covers basic queuing and specifying connection and queue names using `onConnection` and `onQueue` methods.

```php
use Illuminate\Support\Facades\Artisan;

Route::post('/user/{user}/mail', function (string $user) {
    Artisan::queue('mail:send', [
        'user' => $user,
        '--queue' => 'default'
    ]);

    // ...
});
```

```php
Artisan::queue('mail:send', [
    'user' => 1,
    '--queue' => 'default'
])->onConnection('redis')->onQueue('commands');
```

--------------------------------

### Envoy @success Hook Example

Source: https://laravel.com/docs/10.x/envoy

Provides an example of the `@success` hook in Envoy, which executes locally if all tasks complete without errors. This hook is useful for post-deployment success actions.

```blade
@success
    // ...
@endsuccess
```

--------------------------------

### Supervisor Command Line Interface

Source: https://laravel.com/docs/10.x/horizon

Commands to manage Supervisor processes after configuration files have been created or modified. These commands reread configurations, update running processes, and start specific monitored applications like 'horizon'.

```shell
sudo supervisorctl reread

sudo supervisorctl update

sudo supervisorctl start horizon
```

--------------------------------

### Start Laravel Octane Server (Shell)

Source: https://laravel.com/docs/10.x/octane

This command starts the Octane server using the Artisan command. It utilizes the server specified in the application's octane configuration file. By default, it runs on port 8000.

```shell
php artisan octane:start
```

--------------------------------

### Chunking Eloquent Results by ID in PHP

Source: https://laravel.com/docs/10.x/eloquent

Explains the use of `chunkById` for processing large datasets, especially when updating records during iteration. This method ensures consistent results by retrieving models based on their ID, preventing issues that can arise with the standard `chunk` method when filtering and updating simultaneously.

```php
Flight::where('departed', true)
    ->chunkById(200, function (Collection $flights) {
        $flights->each->update(['departed' => false]);
    }, $column = 'id');
```

--------------------------------

### Handle Task Creation Response (JavaScript)

Source: https://laravel.com/docs/10.x/broadcasting

Example of handling a successful response after creating a task. The new task data is pushed directly into the local task list.

```javascript
axios.post('/task', task)
    .then((response) => {
        this.tasks.push(response.data);
    });
```

--------------------------------

### Testing Chained Batches with Bus Facade

Source: https://laravel.com/docs/10.x/queues

This example shows how to test a job chain that includes a batch of jobs. It uses `Bus::chainedBatch` within `Bus::assertChained` to define expectations for the batch, such as the number of jobs it contains.

```php
use App\Jobs\ShipOrder;
use App\Jobs\UpdateInventory;
use Illuminate\Bus\PendingBatch;
use Illuminate\Support\Facades\Bus;

Bus::fake();

// ... Dispatch your chained jobs including a batch ...

Bus::assertChained([
    new ShipOrder,
    Bus::chainedBatch(function (PendingBatch $batch) {
        return $batch->jobs->count() === 3;
    }),
    new UpdateInventory,
]);
```

--------------------------------

### Manage Laravel Horizon Process

Source: https://laravel.com/docs/10.x/horizon

Commands for starting, pausing, resuming, checking status, and terminating the Laravel Horizon process. These commands are essential for managing the background job processing system.

```shell
php artisan horizon
```

```shell
php artisan horizon:pause
```

```shell
php artisan horizon:continue
```

```shell
php artisan horizon:pause-supervisor supervisor-1
```

```shell
php artisan horizon:continue-supervisor supervisor-1
```

```shell
php artisan horizon:status
```

```shell
php artisan horizon:terminate
```

--------------------------------

### Stateless HTTP Basic Authentication

Source: https://laravel.com/docs/10.x/authentication

Guides on implementing stateless HTTP Basic Authentication for APIs using a custom middleware.

```APIDOC
## Stateless HTTP Basic Authentication

### Description
Implements HTTP Basic Authentication without session cookies, suitable for API requests.

### Method
Custom middleware calling `Auth::onceBasic()`.

### Endpoint
Example: `/api/user`

### Parameters
#### Path Parameters
- None

#### Query Parameters
- None

#### Request Body
- None (Credentials are provided via HTTP headers)

### Request Example
```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateOnceWithBasicAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        return Auth::onceBasic() ?: $next($request);
    }

}

// In your routes file:
use App\Http\Middleware\AuthenticateOnceWithBasicAuth;
use Illuminate\Support\Facades\Route;

Route::get('/api/user', function () {
    // Only authenticated users may access this route...
})->middleware(AuthenticateOnceWithBasicAuth::class);
```

### Response
#### Success Response (200)
- If authenticated, the user gains access to the route.

#### Response Example
- Browser prompts for username and password, or API client provides credentials in headers.
```

--------------------------------

### Apply Stripe Promotion Code to Subscription

Source: https://laravel.com/docs/10.x/billing

Utilize the `withPromotionCode` method to apply a Stripe promotion code ID when creating a subscription. The `promo_code_id` should be the Stripe API ID.

```php
$user->newSubscription('default', 'price_monthly')
     ->withPromotionCode('promo_code_id')
     ->create($paymentMethod);
```

--------------------------------

### Creating Resource Controllers - Laravel Artisan

Source: https://laravel.com/docs/10.x/controllers

Demonstrates the use of the `make:controller` Artisan command with the `--resource` option to quickly generate a controller with pre-defined methods for common CRUD operations.

```shell
php artisan make:controller PhotoController --resource
```

--------------------------------

### Start Laravel Queue Worker

Source: https://laravel.com/docs/10.x/queues

Starts a queue worker using the Artisan `queue:work` command to process jobs from the queue. This process runs until manually stopped or the terminal is closed.

```shell
php artisan queue:work
```

--------------------------------

### Basic Blade Component in PHP

Source: https://laravel.com/docs/10.x/mcp

Provides an example of creating and using a simple Blade component in Laravel. Components help in organizing and reusing UI elements across your application. This snippet shows the component definition and its rendering.

```php
// resources/views/components/alert.blade.php
@props(['type', 'message'])

<div class="alert alert-{{ $type }}">
    {{ $message }}
</div>

// In another Blade view:
<x-alert type="success" message="Operation successful!" />
```

--------------------------------

### Install Laravel Precognition Alpine JS Package

Source: https://laravel.com/docs/10.x/precognition

This shell command shows how to install the `laravel-precognition-alpine` package using NPM. This package provides the necessary frontend helpers to integrate Laravel Precognition with Alpine.js.

```bash
npm install laravel-precognition-alpine
```

--------------------------------

### Debug Laravel Reverb Server

Source: https://laravel.com/docs/10.x/reverb

Enable debug output for the Reverb server by adding the `--debug` flag to the `reverb:start` command. This is useful for monitoring the stream of data passing through the server during development or troubleshooting.

```sh
php artisan reverb:start --debug
```

--------------------------------

### Configure Minio Credentials and Endpoint in .env

Source: https://laravel.com/docs/10.x/homestead

Sets the necessary AWS environment variables in the `.env` file to connect to the Minio object storage server. This includes access keys, region, and the Minio endpoint URL.

```ini
AWS_ACCESS_KEY_ID=homestead
AWS_SECRET_ACCESS_KEY=secretkey
AWS_DEFAULT_REGION=us-east-1
AWS_URL=http://localhost:9600
```

--------------------------------

### Define Envoy Tasks and Servers

Source: https://laravel.com/docs/10.x/envoy

This example shows how to define servers and tasks in an `Envoy.blade.php` file. It specifies a 'web' server and a task 'restart-queues' to be run on the 'workers' server, executing a command within a specific directory.

```blade
@servers(['web' => ['user@192.168.1.1'], 'workers' => ['user@192.168.1.2']])

@task('restart-queues', ['on' => 'workers'])
    cd /home/user/example.com
    php artisan queue:restart
@endtask
```

--------------------------------

### Check if String Starts With - Laravel

Source: https://laravel.com/docs/10.x/strings

Determines whether a given string begins with a specified prefix. Returns a boolean value: true if it starts with the prefix, false otherwise.

```php
use Illuminate\Support\Str;

$result = Str::of('This is my name')->startsWith('This');

// true
```

--------------------------------

### Authorization Code Grant with PKCE

Source: https://laravel.com/docs/10.x/passport

Securely authenticate single page applications or native applications using PKCE.

```APIDOC
## Authorization Code Grant With PKCE

### Description
A secure method for authenticating SPAs or native applications using a "code verifier" and "code challenge" instead of a client secret.

### Method
HTTP Redirect and Token Exchange

### Endpoint
`/oauth/authorize` (for authorization)
`/oauth/token` (for token exchange)

### Parameters
#### Query Parameters for `/oauth/authorize`
- **client_id** (string) - Required - The client ID of your PKCE-enabled application.
- **redirect_uri** (string) - Required - The URI to redirect back to after authorization.
- **response_type** (string) - Required - Must be `code` for this grant.
- **scope** (string) - Optional - The scopes requested for the access token.
- **state** (string) - Required - An opaque value used to maintain state between the request and callback.
- **code_challenge** (string) - Required - The Base64 encoded SHA256 hash of the code verifier.
- **code_challenge_method** (string) - Required - Must be `S256`.

### Request Example (Redirect to authorize)
```php
use Illuminate\Http\Request;
use Illuminate\Support\Str;

Route::get('/redirect', function (Request $request) {
    $request->session()->put('state', $state = Str::random(40));

    $request->session()->put(
        'code_verifier',
        $code_verifier = Str::random(128)
    );

    $codeChallenge = strtr(rtrim(
        base64_encode(hash('sha256', $code_verifier, true))
    , '='), '+/', '-_');

    $query = http_build_query([
        'client_id' => 'client-id',
        'redirect_uri' => 'http://third-party-app.com/callback',
        'response_type' => 'code',
        'scope' => '',
        'state' => $state,
        'code_challenge' => $codeChallenge,
        'code_challenge_method' => 'S256',
    ]);

    return redirect('http://passport-app.test/oauth/authorize?' . $query);
});
```

### Response
#### Success Response (Redirect to callback URL)
- A redirect to the `redirect_uri` with `code` and `state` query parameters.

#### Response Example
`http://third-party-app.com/callback?code=SplxlOBeZQQYbYS6WxSbIA&state=aW0M4r38jM5KqR095rR2WzP5iP1sJbM4`
```

--------------------------------

### Run Laravel Dusk Browser Tests

Source: https://laravel.com/docs/10.x/dusk

Executes all browser tests using the `dusk` Artisan command. This is the primary command for running your Dusk test suite.

```shell
php artisan dusk
```

--------------------------------

### Install Laravel Precognition for React/Inertia

Source: https://laravel.com/docs/10.x/precognition

Installs the Inertia-compatible Precognition library via NPM, enabling enhanced validation features for forms when using React with Inertia in Laravel applications. No specific dependencies are required beyond a standard Node.js environment.

```shell
npm install laravel-precognition-react-inertia
```

--------------------------------

### Test File Uploads with Fake Storage (Laravel)

Source: https://laravel.com/docs/10.x/filesystem

Demonstrates testing file uploads using Laravel's `Storage::fake` method and `UploadedFile::fake`. This allows for isolated testing of file handling logic without actual disk I/O. It includes assertions for file existence, non-existence, and directory emptiness.

```php
<?php

namespace Tests\Feature;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    public function test_albums_can_be_uploaded(): void
    {
        Storage::fake('photos');

        $response = $this->json('POST', '/photos', [
            UploadedFile::fake()->image('photo1.jpg'),
            UploadedFile::fake()->image('photo2.jpg')
        ]);

        // Assert one or more files were stored...
        Storage::disk('photos')->assertExists('photo1.jpg');
        Storage::disk('photos')->assertExists(['photo1.jpg', 'photo2.jpg']);

        // Assert one or more files were not stored...
        Storage::disk('photos')->assertMissing('missing.jpg');
        Storage::disk('photos')->assertMissing(['missing.jpg', 'non-existing.jpg']);

        // Assert that a given directory is empty...
        Storage::disk('photos')->assertDirectoryEmpty('/wallpapers');
    }
}
```

--------------------------------

### Configure Off-Session Payment Notification (INI)

Source: https://laravel.com/docs/10.x/billing

Enables Cashier's off-session payment notification by setting the CASHIER_PAYMENT_NOTIFICATION environment variable. This ensures customers are notified when extra payment verification is required, for example, during subscription renewal. Verify Stripe webhooks and ensure the Billable model uses the Notifiable trait.

```ini
CASHIER_PAYMENT_NOTIFICATION=Laravel\Cashier\Notifications\ConfirmPayment
```

--------------------------------

### Add Prefix to String if Missing with Str::start (PHP)

Source: https://laravel.com/docs/10.x/strings

The Str::start method ensures a string begins with a specified prefix. It adds the prefix only if the string does not already start with it. This is useful for standardizing string formats.

```php
use Illuminate\Support\Str;

$adjusted = Str::start('this/string', '/');

// /this/string

$adjusted = Str::start('/this/string', '/');

// /this/string
```

--------------------------------

### Publish Telescope Assets (Shell)

Source: https://laravel.com/docs/10.x/telescope

Command to publish Telescope's assets. This is typically run after upgrading Telescope.

```shell
php artisan telescope:publish
```

--------------------------------

### Define Passport Keys via Environment Variables

Source: https://laravel.com/docs/10.x/passport

Sets Passport's private and public keys using environment variables after publishing the configuration file.

```ini
PASSPORT_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----
<private key here>
-----END RSA PRIVATE KEY-----"

PASSPORT_PUBLIC_KEY="-----BEGIN PUBLIC KEY-----
<public key here>
-----END PUBLIC KEY-----
```

--------------------------------

### Reset Valet Installation

Source: https://laravel.com/docs/10.x/valet

To resolve issues with Valet, you can reset the installation by reinstalling it using Composer. For persistent problems, a 'hard reset' involves uninstalling and then reinstalling Valet.

```shell
composer global require laravel/valet
valet install
```

```shell
valet uninstall --force
valet install
```

--------------------------------

### Start Laravel Queue Worker with Verbose Output

Source: https://laravel.com/docs/10.x/queues

Starts a queue worker with verbose output enabled using the `-v` flag, which includes processed job IDs in the command's output.

```shell
php artisan queue:work -v
```

--------------------------------

### Dependency Injection in Laravel Controllers

Source: https://context7.com/context7/laravel_10_x/llms.txt

Demonstrates dependency injection patterns within Laravel controllers, including constructor injection and method injection. This allows controllers to easily access repository services or other dependencies. It shows how to inject `UserRepository` and handle requests for user creation and updates.

```php
<?php

namespace App\Http\Controllers;

use App\Repositories\UserRepository;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class UserController extends Controller
{
    // Constructor injection
    public function __construct(
        protected UserRepository $users,
    ) {}

    // Method injection
    public function store(Request $request): RedirectResponse
    {
        $name = $request->name;

        $this->users->create(['name' => $name]);

        return redirect('/users');
    }

    // Combined with route parameters
    public function update(Request $request, string $id): RedirectResponse
    {
        $user = $this->users->find($id);
        $user->update($request->validated());

        return redirect('/users');
    }
}
```

--------------------------------

### Cache Laravel Events for Production

Source: https://laravel.com/docs/10.x/deployment

If your application uses event discovery, this Artisan command caches your application's event-to-listener mappings. Running this during deployment ensures faster event handling.

```shell
php artisan event:cache
```

--------------------------------

### Replace String Start with Str::replaceStart() in PHP

Source: https://laravel.com/docs/10.x/strings

Replaces the beginning of a string with a new value, but only if the string starts with a specific substring. Otherwise, the original string is returned. Requires the Illuminate\Support\Str class.

```php
use Illuminate\Support\Str;

$replaced = Str::replaceStart('Hello', 'Laravel', 'Hello World');

// Laravel World

$replaced = Str::replaceStart('World', 'Laravel', 'Hello World');

// Hello World
```

--------------------------------

### Run Laravel Pint

Source: https://laravel.com/docs/10.x/pint

Executes Laravel Pint to fix code style issues. It can be run on the entire project or specific files and directories. Verbosity and testing modes are available.

```shell
./vendor/bin/pint
./vendor/bin/pint app/Models
./vendor/bin/pint app/Models/User.php
./vendor/bin/pint -v
./vendor/bin/pint --test
./vendor/bin/pint --dirty
```

--------------------------------

### Issue API Tokens with createToken Method

Source: https://laravel.com/docs/10.x/sanctum

Shows how to generate an API token for a user using the `createToken` method. The method returns a `NewAccessToken` instance, and the plain text token should be displayed immediately.

```php
use Illuminate\Http\Request;

Route::post('/tokens/create', function (Request $request) {
    $token = $request->user()->createToken($request->token_name);

    return ['token' => $token->plainTextToken];
});
```

--------------------------------

### Preview Subscription Invoice with Multiple New Prices (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to preview an invoice when multiple price changes are being made simultaneously. It accepts an array of price IDs to the `previewInvoice` method.

```PHP
$invoice = $user->subscription('default')->previewInvoice(['price_yearly', 'price_metered']);
```

--------------------------------

### Define Route to Basic Controller Method

Source: https://laravel.com/docs/10.x/controllers

This defines a GET route for '/user/{id}' that, when matched, will execute the 'show' method of the UserController. Route parameters are automatically passed to the controller method.

```php
use App\Http\Controllers\UserController;

Route::get('/user/{id}', [UserController::class, 'show']);
```

--------------------------------

### Create a basic Folio page

Source: https://laravel.com/docs/10.x/folio

To create a page accessible at a specific URL, create a Blade template file in the `resources/views/pages` directory. The filename directly corresponds to the URI path. For example, `greeting.blade.php` creates the `/greeting` route.

```blade
<div>
    Hello World
</div>
```

--------------------------------

### Using Response Facade vs. Helper Function for JSON Response

Source: https://laravel.com/docs/10.x/facades

Compares generating a JSON response using the `Response` facade versus the global `response` helper function. The helper function is globally available and does not require class imports.

```php
use Illuminate\Support\Facades\Response;

Route::get('/users', function () {
    return Response::json([
        // ...
    ]);
});
```

```php
Route::get('/users', function () {
    return response()->json([
        // ...
    ]);
});
```

--------------------------------

### Prepend and Append Text to Files in Laravel Storage

Source: https://laravel.com/docs/10.x/filesystem

Shows how to add content to the beginning or end of a file using Laravel's Storage facade. The `prepend` method writes text to the start of a file, while the `append` method adds text to the end.

```php
Storage::prepend('file.log', 'Prepended Text');
```

```php
Storage::append('file.log', 'Appended Text');
```

--------------------------------

### Laravel Zero Configuration Resolution Example

Source: https://laravel.com/docs/10.x/container

Illustrates zero-configuration dependency injection within a Laravel route closure. The 'Service' class is automatically resolved and injected without explicit container binding, showcasing the power of automatic resolution for simple dependencies.

```php
<?php

class Service
{
    // ...
}

Route::get('/', function (Service $service) {
    die($service::class);
});
```

--------------------------------

### Create Custom Page Methods in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

Shows how to add custom methods to a Dusk Page class to encapsulate reusable testing logic. The `createPlaylist` method example demonstrates how to define a method that performs a series of actions (typing, checking, pressing) and can be called directly on the browser instance when that page is active.

```php
<?php

namespace Tests\Browser\Pages;

use Laravel\Dusk\Browser;
use Laravel\Dusk\Page;

class Dashboard extends Page
{
    // Other page methods...

    /**
     * Create a new playlist.
     */
    public function createPlaylist(Browser $browser, string $name): void
    {
        $browser->type('name', $name)
                ->check('share')
                ->press('Create Playlist');
    }
}

// Usage in a test:
use Tests\Browser\Pages\Dashboard;

$browser->visit(new Dashboard)
        ->createPlaylist('My Playlist')
        ->assertSee('My Playlist');
```

--------------------------------

### Generate Passport Encryption Keys for Deployment

Source: https://laravel.com/docs/10.x/passport

Generates the encryption keys required by Passport for creating access tokens. This command is typically run during deployment.

```shell
php artisan passport:keys
```

--------------------------------

### Revoke Sanctum API Tokens - PHP

Source: https://laravel.com/docs/10.x/sanctum

These snippets illustrate how to revoke Sanctum API tokens for a given user. The first example shows how to delete all tokens associated with a user, while the second demonstrates deleting a specific token by its ID. This is typically used in an account settings section to allow users to manage their active sessions.

```php
// Revoke all tokens...
$user->tokens()->delete();
```

```php
// Revoke a specific token...
$user->tokens()->where('id', $tokenId)->delete();
```

--------------------------------

### Publish Passport Configuration File

Source: https://laravel.com/docs/10.x/passport

Publishes Passport's configuration file to your application, allowing for direct modification and environment variable-based key loading.

```shell
php artisan vendor:publish --tag=passport-config
```

--------------------------------

### Interact with Stripe Client for Prices (PHP)

Source: https://laravel.com/docs/10.x/billing

Illustrates how to use the `Cashier::stripe()` method to access the Stripe client directly and perform operations, such as retrieving a list of prices from your Stripe account. This provides full access to the Stripe SDK functionality within your Laravel application.

```php
use Laravel\Cashier\Cashier;

$prices = Cashier::stripe()->prices->all();
```

--------------------------------

### Invoke Console Command with Option Value (Shell)

Source: https://laravel.com/docs/10.x/artisan

Example of how to invoke a Laravel console command, providing a value for the 'queue' option. The value 'default' is passed to the --queue option.

```shell
php artisan mail:send 1 --queue=default
```

--------------------------------

### Get All Files in a Directory (Laravel)

Source: https://laravel.com/docs/10.x/filesystem

Retrieves an array of all files within a specified directory using the Storage facade. The `files` method gets files only in the given directory, while `allFiles` includes files from all subdirectories.

```php
use Illuminate\Support\Facades\Storage;

$files = Storage::files($directory);

$files = Storage::allFiles($directory);
```

--------------------------------

### Run and Manage External Processes with Laravel's Process Facade

Source: https://laravel.com/docs/10.x/releases

This code demonstrates the usage of Laravel's `Process` facade to execute external commands. It shows how to run a single command and retrieve its output, as well as how to manage multiple concurrent processes using a pool for efficient parallel execution.

```php
use Illuminate\Support\Facades\Process;
use Illuminate\Process\Pool;

// Running a single command
$result = Process::run('ls -la');
return $result->output();

// Running concurrent commands
[$first, $second, $third] = Process::concurrently(function (Pool $pool) {
    $pool->command('cat first.txt');
    $pool->command('cat second.txt');
    $pool->command('cat third.txt');
});

return $first->output();
```

--------------------------------

### View Composer Class Example in Laravel

Source: https://laravel.com/docs/10.x/views

An example of a class-based view composer in Laravel. Composers are resolved via the service container, allowing dependency injection in the constructor. The `compose` method binds data to the view. Dependencies: Service container, `IlluminateViewView`, and any injected repositories/services. Input: View instance. Output: Data bound to the view.

```php
<?php

namespace App\View\Composers;

use App\Repositories\UserRepository;
use Illuminate\view\view;

class ProfileComposer
{
    /**
     * Create a new profile composer.
     */
    public function __construct(
        protected UserRepository $users,
    ) {}

    /**
     * Bind data to the view.
     */
    public function compose(View $view): void
    {
        $view->with('count', $this->users->count());
    }
}
```

--------------------------------

### Initiate Guest Checkout Session - PHP

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to create a checkout session for a guest user using Laravel Cashier's `Checkout::guest()` method. It requires the `Request` facade and the `Checkout` facade. The output is a redirect to the Stripe checkout page.

```php
use Illuminate\Http\Request;
use Laravel\Cashier\Checkout;

Route::get('/product-checkout', function (Request $request) {
    return Checkout::guest()->create('price_tshirt', [
        'success_url' => route('your-success-route'),
        'cancel_url' => route('your-cancel-route'),
    ]);
});
```

--------------------------------

### JSON API for Token Management

Source: https://laravel.com/docs/10.x/passport

Endpoints for managing authorized access tokens via a JSON API.

```APIDOC
## JSON API for Token Management

### Description
Passport provides a JSON API for managing authorized access tokens. This API is protected by the `web` and `auth` middleware, meaning it can only be accessed from within your own application.

<a name="get-oauthtokens"></a>
#### GET /oauth/tokens

### Description
Retrieves a list of all authorized access tokens created by the authenticated user.

### Method
GET

### Endpoint
/oauth/tokens

### Response
#### Success Response (200)
- **tokens** (array) - An array of token objects, each containing details about an authorized access token.

### Request Example
```js
axios.get('/oauth/tokens')
    .then(response => {
        console.log(response.data);
    });
```

<a name="delete-oauthtokenstoken-id"></a>
#### DELETE /oauth/tokens/{token-id}

### Description
Revokes a specific authorized access token and its associated refresh tokens.

### Method
DELETE

### Endpoint
/oauth/tokens/{token-id}

### Parameters
#### Path Parameters
- **token-id** (string) - Required - The ID of the access token to revoke.

### Request Example
```js
const tokenId = 'some-token-id';
axios.delete('/oauth/tokens/' + tokenId);
```
```

--------------------------------

### Assert Fragment Begins With

Source: https://laravel.com/docs/10.x/dusk

Asserts that the URL's current hash fragment starts with the given string. This is useful when the exact fragment might vary slightly but should still begin with a known identifier.

```php
$browser->assertFragmentBeginsWith('anchor');
```

--------------------------------

### Test a Weather Tool using Pest and PHPUnit

Source: https://laravel.com/docs/10.x/mcp

Demonstrates how to write unit tests for a tool, specifically the `CurrentWeatherTool` on the `WeatherServer`. It shows how to invoke the tool with parameters and assert the response status and content. Supports both Pest and PHPUnit testing frameworks.

```php
test('tool', function () {
    $response = WeatherServer::tool(CurrentWeatherTool::class, [
        'location' => 'New York City',
        'units' => 'fahrenheit',
    ]);

    $response
        ->assertOk()
        ->assertSee('The current weather in New York City is 72°F and sunny.');
});
```

```php
/**
 * Test a tool.
 */
public function test_tool(): void
{
    $response = WeatherServer::tool(CurrentWeatherTool::class, [
        'location' => 'New York City',
        'units' => 'fahrenheit',
    ]);

    $response
        ->assertOk()
        ->assertSee('The current weather in New York City is 72°F and sunny.');
}
```

--------------------------------

### Build Log Stacks with Multiple Channels (PHP)

Source: https://laravel.com/docs/10.x/logging

Demonstrates configuring a 'stack' log channel that aggregates messages from multiple other channels like 'syslog' and 'slack'. This allows for consolidated logging across different destinations.

```php
'channels' => [
        'stack' => [
            'driver' => 'stack',
            'channels' => ['syslog', 'slack'],
        ],

        'syslog' => [
            'driver' => 'syslog',
            'level' => 'debug',
        ],

        'slack' => [
            'driver' => 'slack',
            'url' => env('LOG_SLACK_WEBHOOK_URL'),
            'username' => 'Laravel Log',
            'emoji' => ':boom:',
            'level' => 'critical',
        ],
    ]
```

--------------------------------

### Invoke Closure if String Starts With Value (PHP)

Source: https://laravel.com/docs/10.x/strings

The `whenStartsWith` method invokes a closure if the string begins with a specified substring. The closure receives the Stringable instance.

```php
use Illuminate\Support\Str;
use Illuminate\Support\Stringable;

$string = Str::of('disney world')->whenStartsWith('disney', function (Stringable $string) {
    return $string->title();
});

// Output: 'Disney World'
```

--------------------------------

### SSH into Homestead VM

Source: https://laravel.com/docs/10.x/homestead

Command to establish an SSH connection to the Homestead virtual machine. This allows direct access to the virtual environment for debugging or manual operations.

```shell
vagrant ssh
```

--------------------------------

### Create On-Demand Log Channel (PHP)

Source: https://laravel.com/docs/10.x/logging

Demonstrates how to create a logging channel at runtime by providing a configuration array to the Log facade's build method. This is useful for temporary or dynamically configured log channels.

```php
use Illuminate\Support\Facades\Log;

Log::build([
  'driver' => 'single',
  'path' => storage_path('logs/custom.log'),
])->info('Something happened!');
```

--------------------------------

### Configure Xdebug Autostart for Web Debugging (INI)

Source: https://laravel.com/docs/10.x/homestead

This configuration snippet enables Xdebug to autostart debugging for web requests. It requires modifying the Xdebug INI file within the Homestead VM. Ensure the `client_host` matches your Homestead subnet.

```ini
; If Homestead.yaml contains a different subnet for the IP address, this address may be different...
xdebug.client_host = 192.168.10.1
xdebug.mode = debug
xdebug.start_with_request = yes
```

--------------------------------

### Upgrade Laravel Valet

Source: https://laravel.com/docs/10.x/valet

Valet can be updated using Composer. After upgrading, it's recommended to run `valet install` to apply any necessary configuration changes.

```shell
composer global require laravel/valet
valet install
```

--------------------------------

### Assert Path Begins With

Source: https://laravel.com/docs/10.x/dusk

Asserts that the current URL path starts with the specified string. This is helpful for validating that a user is within a particular section of a website, like a dashboard or user profile area.

```php
$browser->assertPathBeginsWith('/home');
```

--------------------------------

### Laravel Task Scheduling: Combined Schedule Example

Source: https://laravel.com/docs/10.x/scheduling

Demonstrates combining multiple scheduling methods and constraints to create a complex schedule, such as running a task weekly on Mondays between specific hours.

```PHP
$schedule->call(function () {
    // Your task logic...
})->weekly()->mondays()->at('13:00');

$schedule->command('foo')
          ->weekdays()
          ->hourly()
          ->timezone('America/Chicago')
          ->between('8:00', '17:00');
```

--------------------------------

### File Upload Handling in PHP

Source: https://laravel.com/docs/10.x/mcp

Provides a basic example of handling file uploads in PHP using the $_FILES superglobal. This is essential for web applications that allow users to upload files.

```php
<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['myFile'])) {
    $targetDir = "uploads/";
    $targetFile = $targetDir . basename($_FILES["myFile"]["name"]);
    // Move the uploaded file to the destination
    if (move_uploaded_file($_FILES["myFile"]["tmp_name"], $targetFile)) {
        echo "The file ". htmlspecialchars( basename( $_FILES["myFile"]["name"])). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>
```

--------------------------------

### List Available Artisan Commands

Source: https://laravel.com/docs/10.x/artisan

Displays a list of all available Artisan commands in the Laravel application. This is a fundamental command for exploring Artisan's capabilities.

```shell
php artisan list
```

--------------------------------

### Create Subscription with Additional Stripe Options

Source: https://laravel.com/docs/10.x/billing

This snippet illustrates how to pass additional customer or subscription options directly to Stripe when creating a subscription. The `create` method accepts arrays for customer and subscription options as its second and third arguments, respectively. This allows for advanced Stripe configurations.

```php
$user->newSubscription('default', 'price_monthly')->create($paymentMethod, [
    'email' => $email,
], [
    'metadata' => ['note' => 'Some extra information.'],
]);
```

--------------------------------

### Use Global Cache Helper Function (Laravel)

Source: https://laravel.com/docs/10.x/cache

Explains the usage of the global `cache` helper function for retrieving and storing data. It shows how to get a value by key, store multiple key-value pairs with expiration, and obtain the cache factory instance to call other caching methods like `remember`.

```php
$value = cache('key');

cache(['key' => 'value'], $seconds);

cache(['key' => 'value'], now()->addMinutes(10));

cache()->remember('users', $seconds, function () {
    return DB::table('users')->get();
});
```

--------------------------------

### Replace Start of String with Laravel Str

Source: https://laravel.com/docs/10.x/strings

The `replaceStart` method replaces a substring at the beginning of a string only if it matches the specified value.

```php
use Illuminate\Support\Str;

$replaced = Str::of('Hello World')->replaceStart('Hello', 'Laravel');

// Laravel World

$replaced = Str::of('Hello World')->replaceStart('World', 'Laravel');

// Hello World
```

--------------------------------

### Named Routes and Redirects in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

This PHP code demonstrates how to define named routes, generate URLs from them, and perform redirects. It covers named routes with and without parameters, and how to pass parameters to route generation functions.

```php
// Define named route
Route::get('/user/profile', function () {
    return view('user.profile');
})->name('profile');

// Generate URL from named route
$url = route('profile');

// Redirect to named route
return redirect()->route('profile');
return to_route('profile');

// Named route with parameters
Route::get('/user/{id}/profile', function (string $id) {
    return "User $id profile";
})->name('profile');

$url = route('profile', ['id' => 1]); // /user/1/profile
$url = route('profile', ['id' => 1, 'photos' => 'yes']); // /user/1/profile?photos=yes
```

--------------------------------

### Debit Customer Balance (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet shows how to debit a customer's balance. The `debitBalance` method accepts a numeric value for the amount to debit and an optional description string.

```php
$user->debitBalance(300, 'Bad usage penalty.');
```

--------------------------------

### Simple Text Response in Laravel MCP Tools

Source: https://laravel.com/docs/10.x/mcp

Provides an example of returning a simple text response from an MCP tool's `handle` method using the `Response::text()` static method. Requires `Request` and `Response` classes.

```php
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;

/**
 * Handle the tool request.
 */
public function handle(Request $request): Response
{
    // ...

    return Response::text('Weather Summary: Sunny, 72°F');
}
```

--------------------------------

### Configure SQLite Database in .env

Source: https://laravel.com/docs/10.x/installation

This snippet shows how to modify the .env file to use SQLite as the database connection. It replaces the default MySQL configuration with the necessary SQLite parameters. Ensure the database file is created or accessible.

```ini
DB_CONNECTION=sqlite
# [tl! remove]
# DB_CONNECTION=mysql
# [tl! remove]
# DB_HOST=127.0.0.1
# [tl! remove]
# DB_PORT=3306
# [tl! remove]
# DB_DATABASE=laravel
# [tl! remove]
# DB_USERNAME=root
# [tl! remove]
# DB_PASSWORD=
# [tl! remove]
```

--------------------------------

### Update Homestead Source Code (Git)

Source: https://laravel.com/docs/10.x/homestead

Instructions for updating the Homestead source code using Git. This involves fetching the latest changes and pulling the most recent release branch. Assumes Homestead was cloned from a repository.

```shell
git fetch

git pull origin release
```

--------------------------------

### List All Application Routes using Artisan

Source: https://laravel.com/docs/10.x/routing

The `php artisan route:list` command displays all registered routes. Use `-v` or `-vv` to show middleware and expand middleware groups. Filter by path or vendor involvement with `--path`, `--except-vendor`, or `--only-vendor`.

```shell
php artisan route:list

php artisan route:list -v

php artisan route:list -vv

php artisan route:list --path=api

php artisan route:list --except-vendor

php artisan route:list --only-vendor
```

--------------------------------

### Execute Node/NPM Commands with Sail

Source: https://laravel.com/docs/10.x/sail

While not explicitly shown with a code example in the provided text, the documentation states that Node/NPM commands can be executed using Sail. This implies a similar pattern to other commands, likely `sail npm ...` or `sail yarn ...`, allowing you to manage frontend assets and dependencies within the Sail environment.

```shell
# Example (based on documentation pattern):
sail npm install
sail yarn run dev
```

--------------------------------

### Render Blade Component with Props and Classes

Source: https://laravel.com/docs/10.x/blade

This example shows how to render a Blade component, passing specific props like 'type' and 'message', and also applying HTML attributes like 'class'. The 'message' prop is passed as a dynamic variable using Laravel's : syntax.

```blade
<x-alert type="error" :message="$message" class="mb-4"/>
```

--------------------------------

### Apply Coupon or Promotion Code to Existing Customer/Subscription

Source: https://laravel.com/docs/10.x/billing

Update an existing billable entity or subscription with a new coupon or promotion code using `applyCoupon` or `applyPromotionCode`. Note that only one discount can be active at a time.

```php
$billable->applyCoupon('coupon_id');
$billable->applyPromotionCode('promotion_code_id');

$subscription->applyCoupon('coupon_id');
$subscription->applyPromotionCode('promotion_code_id');
```

--------------------------------

### Install Vonage Channel for SMS (Composer)

Source: https://laravel.com/docs/10.x/notifications

Installs the necessary packages for sending SMS notifications via Vonage (formerly Nexmo). This command uses Composer to add the `laravel/vonage-notification-channel` and `guzzlehttp/guzzle` packages to your project's dependencies.

```bash
composer require laravel/vonage-notification-channel guzzlehttp/guzzle
```

--------------------------------

### Retrieve Translation Strings with `__` Helper

Source: https://laravel.com/docs/10.x/localization

Retrieves translation strings using the `__` helper function. For 'short keys', specify the file and key using dot notation (e.g., `messages.welcome`). If translation strings are used as keys, pass the default string directly. If a translation is not found, the key itself is returned. This function is a core part of Laravel's localization system. Input is a string representing the key or default translation. Output is the translated string or the key.

```php
echo __('messages.welcome');
```

```php
echo __('I love programming.');
```

```php
{{ __('messages.welcome') }}
```

--------------------------------

### Get All Directories in a Directory (Laravel)

Source: https://laravel.com/docs/10.x/filesystem

Retrieves an array of all directories within a specified directory using the Storage facade. The `directories` method gets directories only in the given directory, while `allDirectories` includes directories from all subdirectories.

```php
$directories = Storage::directories($directory);

$directories = Storage::allDirectories($directory);
```

--------------------------------

### Add Information to Artisan 'about' Command

Source: https://laravel.com/docs/10.x/packages

Shows how to extend Laravel's built-in 'about' Artisan command to display custom package information. This is typically done within the package service provider's 'boot' method using the `AboutCommand::add` static method.

```php
use Illuminate\Foundation\Console\AboutCommand;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    AboutCommand::add('My Package', fn () => ['Version' => '1.0.0']);
}
```

--------------------------------

### Export Passport Migrations

Source: https://laravel.com/docs/10.x/passport

Exports Passport's default database migration files, enabling customization before running them.

```shell
php artisan vendor:publish --tag=passport-migrations
```

--------------------------------

### Configure Homestead Services (YAML)

Source: https://laravel.com/docs/10.x/homestead

This snippet shows how to configure which services are enabled or disabled during Homestead provisioning using the `services` option in `Homestead.yaml`. It specifies PostgreSQL as enabled and MySQL as disabled.

```yaml
services:
    - enabled:
        - "postgresql"
    - disabled:
        - "mysql"
```

--------------------------------

### Take Screenshots with Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

Demonstrates capturing screenshots using Dusk's `screenshot` and `responsiveScreenshots` methods. Screenshots are saved to the `tests/Browser/screenshots` directory. `screenshot` takes a single image, while `responsiveScreenshots` captures at various breakpoints.

```php
$browser->screenshot('filename');

$browser->responsiveScreenshots('filename');
```

--------------------------------

### API Request: Sending GET Request (PHP)

Source: https://laravel.com/docs/10.x/mcp

Illustrates how to make a GET request to an external API using Laravel's HTTP client. This is useful for fetching data from other services. It relies on the Guzzle HTTP client, which is bundled with Laravel.

```php
<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class ApiService
{
    public function fetchData(string $url)
    {
        $response = Http::get($url);
        return $response->json(); // Returns the JSON response body
    }
}

```

--------------------------------

### Configure S3 Disk for Minio in Laravel Filesystems

Source: https://laravel.com/docs/10.x/homestead

Adjusts the S3 disk configuration in Laravel's `config/filesystems.php` to connect to the Minio server. It sets the endpoint and enables path-style endpoint usage.

```php
's3' => [
    'driver' => 's3',
    'key' => env('AWS_ACCESS_KEY_ID'),
    'secret' => env('AWS_SECRET_ACCESS_KEY'),
    'region' => env('AWS_DEFAULT_REGION'),
    'bucket' => env('AWS_BUCKET'),
    'endpoint' => env('AWS_URL'),
    'use_path_style_endpoint' => true,
]
```

--------------------------------

### Retrieve Subset of Session Data (PHP)

Source: https://laravel.com/docs/10.x/session

Demonstrates using the `only` and `except` methods to retrieve specific portions of the session data. `only` gets specified keys, while `except` gets all keys except the specified ones. Both operate on the `Request` instance's session.

```PHP
$data = $request->session()->only(['username', 'email']);

$data = $request->session()->except(['username', 'email']);
```

--------------------------------

### Using Cache Facade to Get User Data - PHP

Source: https://laravel.com/docs/10.x/facades

Illustrates a typical use case of the Cache facade within a controller to retrieve user data. This code assumes the 'Cache' facade has been imported and demonstrates fetching a user record by key.

```PHP
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show the profile for the given user.
     */
    public function showProfile(string $id): View
    {
        $user = Cache::get('user:'.$id);

        return view('profile', ['user' => $user]);
    }
}
```

--------------------------------

### Create Passport Client via Artisan Command

Source: https://laravel.com/docs/10.x/passport

Generates a new OAuth2 client for testing purposes using the `passport:client` Artisan command. The command prompts for necessary client information and provides a client ID and secret upon completion. Multiple redirect URLs can be specified as a comma-delimited list.

```shell
php artisan passport:client
```

--------------------------------

### Register Laravel Package Views

Source: https://laravel.com/docs/10.x/packages

Demonstrates how to register a package's views with Laravel using the `loadViewsFrom` method in the service provider's `boot` method. This allows views to be loaded using the `package::view` syntax.

```php
/**
 * Bootstrap any package services.
 */
public function boot(): void
{
    $this->loadViewsFrom(__DIR__.'/../resources/views', 'courier');
}
```

--------------------------------

### Define Minio Buckets in Homestead YAML

Source: https://laravel.com/docs/10.x/homestead

Specifies the buckets to be provisioned by Minio within the Homestead configuration. Each bucket can have a defined policy for access control.

```yaml
buckets:
    - name: your-bucket
      policy: public
    - name: your-private-bucket
      policy: none
```

--------------------------------

### Browser window resizing in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet demonstrates methods for resizing and managing the browser window size during Laravel Dusk tests. It includes `resize` for specific dimensions, `maximize` to fill the screen, and `fitContent` to adjust to content size. `disableFitOnFailure` prevents automatic resizing on test failure.

```php
$browser->resize(1920, 1080);

$browser->maximize();

$browser->fitContent();

$browser->disableFitOnFailure();

$browser->move($x = 100, $y = 100);
```

--------------------------------

### Create Stripe Webhook via Artisan Command (PHP)

Source: https://laravel.com/docs/10.x/billing

This Artisan command creates a webhook in Stripe that listens to all events required by Cashier. It defaults to the APP_URL and cashier.webhook route but can be customized with --url, --api-version, and --disabled options.

```shell
php artisan cashier:webhook
php artisan cashier:webhook --url "https://example.com/stripe/webhook"
php artisan cashier:webhook --api-version="2019-12-03"
php artisan cashier:webhook --disabled
```

--------------------------------

### Configure Nginx Sites in Homestead

Source: https://laravel.com/docs/10.x/homestead

Maps custom domains to specific project directories within your Homestead environment, allowing you to serve multiple Laravel applications. Changes require 'vagrant reload --provision'.

```yaml
sites:
    - map: homestead.test
      to: /home/vagrant/project1/public
```

--------------------------------

### Docker Compose for FrankenPHP Development

Source: https://laravel.com/docs/10.x/octane

This Docker Compose file defines a service to run a FrankenPHP powered Laravel application for development. It builds the image from the Dockerfile, sets the entrypoint to start Octane with a maximum of 1 request, maps port 8000, and mounts the local directory as a volume.

```yaml
# compose.yaml
services:
  frankenphp:
    build:
      context: .
    entrypoint: php artisan octane:frankenphp --max-requests=1
    ports:
      - "8000:8000"
    volumes:
      - .:/app
```

--------------------------------

### Schedule a Shell Command in Laravel

Source: https://laravel.com/docs/10.x/scheduling

This example demonstrates scheduling a system or shell command using the `exec` method in Laravel. This is useful for executing external scripts or commands directly from your Laravel application's scheduler.

```php
$schedule->exec('node /home/forge/script.js')->daily();
```

--------------------------------

### Defining Custom HTTP Client Macros (PHP)

Source: https://laravel.com/docs/10.x/http-client

Define reusable HTTP client configurations, such as base URLs and default headers, using macros. Macros are registered in the `AppServiceProvider`'s `boot` method and can be invoked from anywhere in the application to create pre-configured pending requests.

```php
use Illuminate\Support\Facades\Http;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Http::macro('github', function () {
        return Http::withHeaders([
            'X-Example' => 'example',
        ])->baseUrl('https://github.com');
    });
}
```

```php
$response = Http::github()->get('/');
```

--------------------------------

### Get Redis Key Value in Laravel

Source: https://laravel.com/docs/10.x/redis

Retrieves a value from Redis using the 'GET' command via the Laravel Redis facade. This is useful for fetching cached data or user profiles. It requires the 'illuminate/redis' package.

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redis;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show the profile for the given user.
     */
    public function show(string $id): View
    {
        return view('user.profile', [
            'user' => Redis::get('user:profile:'.$id)
        ]);
    }
}
```

--------------------------------

### Extract Substring - Laravel

Source: https://laravel.com/docs/10.x/strings

Returns a portion of a string based on a start position and an optional length. If length is omitted, it extracts from the start position to the end of the string.

```php
use Illuminate\Support\Str;

$string = Str::of('Laravel Framework')->substr(8);

// Framework

$string = Str::of('Laravel Framework')->substr(8, 5);

// Frame
```

--------------------------------

### Install Doctrine DBAL for SQLite Column Modifications

Source: https://laravel.com/docs/10.x/migrations

Before modifying columns on SQLite databases, install the 'doctrine/dbal' package using Composer. This library helps determine the column's current state and generates SQL for changes. It's also required for renaming and dropping columns on certain legacy database versions.

```bash
composer require doctrine/dbal
```

--------------------------------

### Show Spinner During Callback Execution in Laravel Prompts

Source: https://laravel.com/docs/10.x/prompts

This example uses the `spin` function to display a visual spinner while a callback function is executing, such as an HTTP request. It provides visual feedback for ongoing processes and returns the result of the callback. Note that the `pcntl` PHP extension is required for animation.

```php
use function Laravel\Prompts\spin;

$response = spin(
    fn () => Http::get('http://example.com'),
    'Fetching response...'
);
```

--------------------------------

### Configure Default Site

Source: https://laravel.com/docs/10.x/valet

Allows setting a default site to be served when an unknown .test domain is accessed. This is configured in `~/.config/valet/config.json` by adding a `default` key with the site's path.

```json
{
  "default": "/Users/Sally/Sites/example-site"
}
```

--------------------------------

### Update Minimum Stability in Composer

Source: https://laravel.com/docs/10.x/upgrade

This JSON snippet demonstrates how to set the 'minimum-stability' to 'stable' in composer.json, a requirement for Laravel 10, or how to remove it if the default is desired.

```json
"minimum-stability": "stable"
```

--------------------------------

### Laravel Queued Event Listener with Manual Tagging

Source: https://laravel.com/docs/10.x/horizon

An example of manually tagging a queued event listener in Laravel. The 'tags' method receives the event instance, allowing tags to be dynamically generated based on event data, such as the ID of a related video.

```php
class SendRenderNotifications implements ShouldQueue
{
    /**
     * Get the tags that should be assigned to the listener.
     *
     * @return array<int, string>
     */
    public function tags(VideoRendered $event): array
    {
        return ['video:'.$event->video->id];
    }
}
```

--------------------------------

### Returning a User Resource from a Route (PHP)

Source: https://laravel.com/docs/10.x/eloquent-resources

This example demonstrates how to return a single UserResource instance from a Laravel route. The User model is fetched using findOrFail and then passed to the UserResource constructor. The resource handles the transformation to JSON.

```php
use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/user/{id}', function (string $id) {
    return new UserResource(User::findOrFail($id));
});
```

--------------------------------

### Publish Cashier Migrations

Source: https://laravel.com/docs/10.x/cashier-paddle

Publishes the necessary migration files for Laravel Cashier using the `vendor:publish` Artisan command. These migrations create tables for customers, subscriptions, subscription items, and transactions.

```shell
php artisan vendor:publish --tag="cashier-migrations"
```

--------------------------------

### Subscribe User to Metered Plan (Laravel)

Source: https://laravel.com/docs/10.x/billing

Creates a new subscription for a user with a metered pricing plan. It requires the user to be authenticated and have a payment method associated. The subscription is named 'default' and is linked to a metered price ID.

```PHP
use Illuminate\Http\Request;

Route::post('/user/subscribe', function (Request $request) {
    $request->user()->newSubscription('default')
        ->meteredPrice('price_metered')
        ->create($request->paymentMethodId);

    // ...
});
```

--------------------------------

### Create User with Trial Without Upfront Payment (PHP)

Source: https://laravel.com/docs/10.x/cashier-paddle

Creates a new user and sets a "generic trial" period without collecting payment information immediately. The trial end date is stored in the `trial_ends_at` column on the user record. This is ideal for sign-up incentives.

```PHP
use App\Models\User;

$user = User::create([
    // ...
]);

$user->createAsCustomer([
    'trial_ends_at' => now()->addDays(10)
]);
```

--------------------------------

### Envoy @error Hook Example

Source: https://laravel.com/docs/10.x/envoy

Shows how to use the `@error` hook in Envoy, which runs locally after a task fails. The hook receives the task name, and this example checks if the failed task was 'deploy'.

```blade
@error
    if ($task === 'deploy') {
        // ...
    }
@enderror
```

--------------------------------

### Get and Set File Visibility (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Demonstrates how to retrieve and modify the visibility of an existing file using `Storage::getVisibility` and `Storage::setVisibility`. This is useful for managing file permissions after they have been stored.

```PHP
$visibility = Storage::getVisibility('file.jpg');

Storage::setVisibility('file.jpg', 'public');
```

--------------------------------

### Browser navigation methods in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet illustrates various navigation methods available for a `Browser` instance in Laravel Dusk. It includes navigating to a specific URI using `visit`, a named route using `visitRoute`, and basic browser controls like `back`, `forward`, and `refresh`. These methods are fundamental for controlling test flow.

```php
$browser->visit('/login');

$browser->visitRoute('login');

$browser->back();

$browser->forward();

$browser->refresh();
```

--------------------------------

### Envoy @after Hook Example

Source: https://laravel.com/docs/10.x/envoy

Demonstrates the `@after` hook in Envoy, executing code locally after each task. This hook receives the name of the executed task, shown here checking for 'deploy'.

```blade
@after
    if ($task === 'deploy') {
        // ...
    }
@endafter
```

--------------------------------

### Invoke Console Command with Option Shortcut and Value (Shell)

Source: https://laravel.com/docs/10.x/artisan

Demonstrates invoking a Laravel console command using an option shortcut ('-Q') and providing a value for it. The value 'default' is passed to the 'queue' option via its shortcut.

```shell
php artisan mail:send 1 -Qdefault
```

--------------------------------

### Register Service Container Binding in Service Provider

Source: https://laravel.com/docs/10.x/providers

Demonstrates how to register a service binding within the `register` method of a Laravel service provider. This example binds a concrete implementation of `App\Services\Riak\Connection` to the service container as a singleton.

```php
<?php

namespace App\Providers;

use App\Services\Riak\Connection;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Support\ServiceProvider;

class RiakServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(Connection::class, function (Application $app) {
            return new Connection(config('riak'));
        });
    }
}
```

--------------------------------

### Configure Public Network Interface with Device (YAML)

Source: https://laravel.com/docs/10.x/homestead

Configures a public network interface for your Homestead VM, specifying the host network device to bridge with. This provides more granular control over the network connection.

```yaml
networks:
    - type: "public_network"
      ip: "192.168.10.20"
      bridge: "en1: Wi-Fi (AirPort)"
      dev: "enp2s0"
```

--------------------------------

### Process Input Through Pipeline with Closures

Source: https://laravel.com/docs/10.x/helpers

Demonstrates using Laravel's Pipeline facade to process an input through an array of closures. Each closure receives the input and a `$next` closure to pass control to the subsequent stage. The `then` method defines the final processing step.

```php
use Closure;
use App\Models\User;
use Illuminate\Support\Facades\Pipeline;

$user = Pipeline::send($user)
            ->through([
                function (User $user, Closure $next) {
                    // ...

                    return $next($user);
                },
                function (User $user, Closure $next) {
                    // ...

                    return $next($user);
                },
            ])
            ->then(fn (User $user) => $user);
```

--------------------------------

### Update Homestead Dependencies (Composer)

Source: https://laravel.com/docs/10.x/homestead

Command to update Homestead's dependencies via Composer. This is applicable when Homestead is installed as a project dependency. Ensure the version constraint in composer.json is set correctly.

```shell
composer update
```

--------------------------------

### Basic Model Search in Laravel

Source: https://laravel.com/docs/10.x/scout

Demonstrates how to search Eloquent models using the `search` and `get` methods provided by Laravel Scout. This is the primary method for retrieving models that match a given search query.

```php
use App\Models\Order;

$orders = Order::search('Star Trek')->get();
```

--------------------------------

### Retrieve Items from Cache - PHP

Source: https://laravel.com/docs/10.x/cache

Illustrates retrieving items from the cache using the `get` method of the Cache facade. It covers retrieving a value, providing a default value, and using a closure for a deferred default value.

```php
$value = Cache::get('key');

$value = Cache::get('key', 'default');

$value = Cache::get('key', function () {
    return DB::table(/* ... */)->get();
});
```

--------------------------------

### Rebuild and Start Sail Containers

Source: https://laravel.com/docs/10.x/sail

After modifying docker-compose.yml to change PHP or Node.js versions, rebuild the container images without cache and then restart the Sail environment.

```shell
sail build --no-cache

sail up
```

--------------------------------

### Extend Sanctum's PersonalAccessToken Model

Source: https://laravel.com/docs/10.x/sanctum

Demonstrates how to extend Sanctum's default `PersonalAccessToken` model by creating a custom model in `App\Models\Sanctum\PersonalAccessToken` and instructing Sanctum to use it via `Sanctum::usePersonalAccessTokenModel()`.

```php
namespace App\Models\Sanctum;

use Laravel\Sanctum\PersonalAccessToken as SanctumPersonalAccessToken;

class PersonalAccessToken extends SanctumPersonalAccessToken
{
    // ...
}
```

```php
use App\Models\Sanctum\PersonalAccessToken;
use Laravel\Sanctum\Sanctum;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Sanctum::usePersonalAccessTokenModel(PersonalAccessToken::class);
}
```

--------------------------------

### Execute Code Before and After Scheduled Tasks in Laravel

Source: https://laravel.com/docs/10.x/scheduling

This example demonstrates using `before` and `after` hooks to execute custom code snippets. The `before` closure runs prior to the task execution, and the `after` closure runs once the task has completed.

```php
$schedule->command('emails:send')
         ->daily()
         ->before(function () {
             // The task is about to execute...
         })
         ->after(function () {
             // The task has executed...
         });
```

--------------------------------

### Run Scout Queue Worker

Source: https://laravel.com/docs/10.x/scout

Starts a queue worker to process jobs on a specific connection and queue. This is necessary when Scout is configured to use queues.

```shell
php artisan queue:work redis --queue=scout
```

--------------------------------

### Set Login View using Fortify

Source: https://laravel.com/docs/10.x/fortify

Instructs Fortify to render a specific login view. This is typically done in the `boot` method of the `FortifyServiceProvider`. It returns the `auth.login` view.

```php
use Laravel\Fortify\Fortify;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Fortify::loginView(function () {
        return view('auth.login');
    });

    // ...
}
```

--------------------------------

### Check Node.js and NPM Versions with Laravel Sail

Source: https://laravel.com/docs/10.x/vite

If you are using Laravel Sail for your development environment, you can check the Node.js and NPM versions by invoking them through Sail. This ensures you are using the versions provided by your Sail setup.

```sh
./vendor/bin/sail node -v
./vendor/bin/sail npm -v
```

--------------------------------

### JavaScript: Handling Form Submission with Precognition Promises

Source: https://laravel.com/docs/10.x/precognition

This JavaScript example shows how to handle the promise returned by Laravel Precognition's `submit` function. It includes examples of resetting the form on success, displaying success messages, and handling potential errors during submission.

```js
const submit = (e) => {
    e.preventDefault();

    form.submit()
        .then(response => {
            form.reset();

            alert('User created.');
        })
        .catch(error => {
            alert('An error occurred.');
        });
};
```

--------------------------------

### Configure GitHub OAuth Credentials

Source: https://laravel.com/docs/10.x/socialite

Example of configuring GitHub OAuth credentials in Laravel's `config/services.php` file. This includes the client ID, client secret, and redirect URI required for authentication.

```php
    'github' => [
        'client_id' => env('GITHUB_CLIENT_ID'),
        'client_secret' => env('GITHUB_CLIENT_SECRET'),
        'redirect' => 'http://example.com/callback-url',
    ],

```

--------------------------------

### Validate String Start/End Patterns with Laravel

Source: https://laravel.com/docs/10.x/validation

Checks if a string field starts or ends with specific values. It can also validate that a string does not start or end with given patterns.

```PHP
'foo' => 'starts_with:foo,bar'
'foo' => 'ends_with:foo,bar'
'foo' => 'doesnt_start_with:foo,bar'
'foo' => 'doesnt_end_with:foo,bar'
```

--------------------------------

### Route Groups and Middleware in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

This PHP code shows how to group routes in Laravel to apply common middleware, prefixes, or name prefixes. It demonstrates applying multiple middleware, setting a URL prefix for a group, and a name prefix for routes within a group.

```php
// Apply middleware to route group
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    });

    Route::get('/settings', function () {
        return view('settings');
    });
});

// Route prefix
Route::prefix('admin')->group(function () {
    Route::get('/users', function () {
        // Matches /admin/users
    });
});

// Route name prefix
Route::name('admin.')->group(function () {
    Route::get('/users', function () {
        // Route named "admin.users"
    })->name('users');
});
```

--------------------------------

### Get or Set Session Values with session() in Laravel

Source: https://laravel.com/docs/10.x/helpers

The `session` function in Laravel provides a convenient way to interact with the session. It can be used to retrieve a specific session value, set multiple session values at once by passing an array, or get the session store instance if no arguments are provided.

```php
$value = session('key');
```

```php
session(['chairs' => 7, 'instruments' => 3]);
```

```php
$value = session()->get('key');

session()->put('key', $value);
```

--------------------------------

### POST /oauth/clients

Source: https://laravel.com/docs/10.x/passport

Creates a new OAuth client for the authenticated user. Requires the client's name and a redirect URL. Issues a client ID and secret upon successful creation.

```APIDOC
## POST /oauth/clients

### Description
Creates new OAuth clients. It requires the client's `name` and a `redirect` URL. The `redirect` URL is where the user will be redirected after approving or denying a request for authorization. When a client is created, it will be issued a client ID and client secret.

### Method
POST

### Endpoint
/oauth/clients

### Parameters

#### Request Body
- **name** (string) - Required - The name of the client.
- **redirect** (string) - Required - The redirect URI for the client.

### Request Example
```js
const data = {
    name: 'Client Name',
    redirect: 'http://example.com/callback'
};

axios.post('/oauth/clients', data)
    .then(response => {
        console.log(response.data);
    })
    .catch (response => {
        // List errors on response...
    });
```

### Response
#### Success Response (201 Created)
- **id** (integer) - The unique identifier of the newly created client.
- **name** (string) - The name of the client.
- **redirect_uri** (string) - The redirect URI for the client.
- **secret** (string) - The client secret issued for the new client.
- **created_at** (datetime) - The timestamp when the client was created.
- **updated_at** (datetime) - The timestamp when the client was last updated.

#### Response Example
```json
{
  "id": 2,
  "name": "New Client",
  "redirect_uri": "http://example.com/callback",
  "secret": "another_client_secret",
  "created_at": "2023-10-27T10:05:00.000Z",
  "updated_at": "2023-10-27T10:05:00.000Z"
}
```
```

--------------------------------

### Get Item from Collection (PHP)

Source: https://laravel.com/docs/10.x/collections

The `get` method retrieves an item from a collection by its key. It supports a default value or a callback for cases where the key is not found. This method is part of the Laravel collection API.

```php
$collection = collect(['name' => 'taylor', 'framework' => 'laravel']);

$value = $collection->get('name');

// taylor

$value = $collection->get('age', 34);

// 34

$collection->get('email', function () {
    return 'taylor@example.com';
});

// taylor@example.com
```

--------------------------------

### Load Passport Keys from a Specific Directory

Source: https://laravel.com/docs/10.x/passport

Configures Passport to load encryption keys from a specified directory, typically used when keys are not stored in the default location.

```php
/**
 * Register any authentication / authorization services.
 */
public function boot(): void
{
    Passport::loadKeysFrom(__DIR__.'/../secrets/oauth');
}
```

--------------------------------

### Basic Markdown Mailable Structure (Blade)

Source: https://laravel.com/docs/10.x/mail

This is an example of a Markdown mailable's content using Blade components and Markdown syntax. It includes a main heading, paragraph, and a button component, demonstrating how to structure email content that renders both HTML and plain-text versions.

```blade
<x-mail::message>
# Order Shipped

Your order has been shipped!

<x-mail::button :url="$url">
View Order
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
```

--------------------------------

### Register Telescope Service Providers in AppServiceProvider

Source: https://laravel.com/docs/10.x/telescope

Manually registers Telescope's service providers within the `register` method of `AppProvidersAppServiceProvider` to ensure it only loads in local environments. This is part of the local-only installation process.

```php
/**
 * Register any application services.
 */
public function register(): void
{
    if ($this->app->environment('local')) {
        $this->app->register(
            \Laravel\Telescope\TelescopeServiceProvider::class
        );
        $this->app->register(TelescopeServiceProvider::class);
    }
}
```

--------------------------------

### Configure Stripe API Keys

Source: https://laravel.com/docs/10.x/billing

Sets Stripe API keys and webhook secret in the application's `.env` file. These credentials are required for Cashier to communicate with the Stripe API.

```ini
STRIPE_KEY=your-stripe-key
STRIPE_SECRET=your-stripe-secret
STRIPE_WEBHOOK_SECRET=your-stripe-webhook-secret
```

--------------------------------

### Create and Manage Multiple Subscriptions per User

Source: https://laravel.com/docs/10.x/billing

Allows customers to have multiple subscriptions simultaneously by specifying a subscription type when creating a new subscription. Existing subscriptions can be swapped or cancelled.

```php
use Illuminate\Http\Request;

// Create a new subscription with a specific type
Route::post('/swimming/subscribe', function (Request $request) {
    $request->user()->newSubscription('swimming')
        ->price('price_swimming_monthly')
        ->create($request->paymentMethodId);
});

// Swap the price on an existing subscription type
$user->subscription('swimming')->swap('price_swimming_yearly');

// Cancel a specific subscription type
$user->subscription('swimming')->cancel();
```

--------------------------------

### POST /oauth/token

Source: https://laravel.com/docs/10.x/passport

Exchanges an authorization code for an access token or refreshes an existing access token.

```APIDOC
## POST /oauth/token

### Description
This endpoint is used to exchange an authorization code for an access token or to refresh an existing access token using a refresh token.

### Method
POST

### Endpoint
/oauth/token

### Parameters
#### Request Body
- **grant_type** (string) - Required - The type of grant. Use 'authorization_code' for initial token requests or 'refresh_token' for refreshing tokens.
- **client_id** (string) - Required - The client ID of the application.
- **client_secret** (string) - Required - The client secret of the application.
- **redirect_uri** (string) - Required (for authorization_code grant) - The redirect URI registered with the application.
- **code** (string) - Required (for authorization_code grant) - The authorization code received from the user.
- **refresh_token** (string) - Required (for refresh_token grant) - The refresh token to obtain a new access token.
- **scope** (string) - Optional - The scopes being requested for the new token.

### Request Example (Authorization Code Grant)
```json
{
  "grant_type": "authorization_code",
  "client_id": "client-id",
  "client_secret": "client-secret",
  "redirect_uri": "http://third-party-app.com/callback",
  "code": "AUTHORIZATION_CODE"
}
```

### Request Example (Refresh Token Grant)
```json
{
  "grant_type": "refresh_token",
  "refresh_token": "REFRESH_TOKEN",
  "client_id": "client-id",
  "client_secret": "client-secret",
  "scope": ""
}
```

### Response
#### Success Response (200)
- **access_token** (string) - The obtained access token.
- **refresh_token** (string) - The refresh token.
- **expires_in** (integer) - The number of seconds until the access token expires.

#### Response Example
```json
{
  "access_token": "ACCESS_TOKEN",
  "refresh_token": "REFRESH_TOKEN",
  "expires_in": 31536000
}
```
```

--------------------------------

### Testing Cache Facade Method Calls in Laravel

Source: https://laravel.com/docs/10.x/facades

Shows how to test facade interactions using Laravel's testing methods. This example verifies that the `Cache::get` method is called with a specific argument and returns an expected value. It requires the `Cache` facade to be imported.

```php
use Illuminate\Support\Facades\Cache;

/**
 * A basic functional test example.
 */
public function test_basic_example(): void
{
    Cache::shouldReceive('get')
         ->with('key')
         ->andReturn('value');

    $response = $this->get('/cache');

    $response->assertSee('value');
}
```

--------------------------------

### Handle Job with Redis Rate Limiting

Source: https://laravel.com/docs/10.x/queues

This example shows how to directly implement Redis rate limiting within a job's handle method. It demonstrates blocking job execution if the rate limit is exceeded. Note that this approach can lead to noisy and duplicated code if used across multiple jobs.

```php
use Illuminate\Support\Facades\Redis;

/**
 * Execute the job.
 */
public function handle(): void
{
    Redis::throttle('key')->block(0)->allow(1)->every(5)->then(function () {
        info('Lock obtained...');

        // Handle job...
    }, function () {
        // Could not obtain lock...

        return $this->release(5);
    });
}
```

--------------------------------

### Filter Telescope Entries (PHP)

Source: https://laravel.com/docs/10.x/telescope

Customizes the filtering of data recorded by Telescope. This example records all data in local environments and specific reportable events in others.

```php
use Laravel\Telescope\IncomingEntry;
use Laravel\Telescope\Telescope;

/**
 * Register any application services.
 */
public function register(): void
{
    $this->hideSensitiveRequestDetails();

    Telescope::filter(function (IncomingEntry $entry) {
        if ($this->app->environment('local')) {
            return true;
        }

        return $entry->isReportableException() ||
            $entry->isFailedJob() ||
            $entry->isScheduledTask() ||
            $entry->isSlowQuery() ||
            $entry->hasMonitoredTag();
    });
}
```

--------------------------------

### Get Application Directory Paths in Laravel

Source: https://laravel.com/docs/10.x/helpers

These functions return the fully qualified path to specific directories within your Laravel application. They can be used to access the lang, public, resources, or storage directories. Optionally, you can provide a file path to get the qualified path to a specific file within these directories.

```php
$langPath = lang_path();
$specificLangPath = lang_path('en/messages.php');

$publicPath = public_path();
$specificPublicPath = public_path('css/app.css');

$resourcePath = resource_path();
$specificResourcePath = resource_path('sass/app.scss');

$storagePath = storage_path();
$specificStoragePath = storage_path('app/file.txt');
```

--------------------------------

### Process High and Low Priority Queues

Source: https://laravel.com/docs/10.x/queues

This command starts a queue worker that will process jobs from the 'high' priority queue first, and then proceed to the 'low' priority queue. This ensures prioritized job execution.

```shell
php artisan queue:work --queue=high,low
```

--------------------------------

### Configure Paddle API Keys in .env

Source: https://laravel.com/docs/10.x/cashier-paddle

Sets up essential Paddle API credentials including client-side token, API key, retain key (optional), webhook secret, and sandbox mode in the .env file for secure communication with Paddle.

```ini
PADDLE_CLIENT_SIDE_TOKEN=your-paddle-client-side-token
PADDLE_API_KEY=your-paddle-api-key
PADDLE_RETAIN_KEY=your-paddle-retain-key
PADDLE_WEBHOOK_SECRET="your-paddle-webhook-secret"
PADDLE_SANDBOX=true
```

--------------------------------

### Creating the First Available View

Source: https://laravel.com/docs/10.x/views

Shows how to use the `View::first` method to return the first view that exists from a given array of view names. This is useful for fallback mechanisms or customizable views.

```php
use IlluminateSupportFacadesView;

return View::first(['custom.admin', 'admin'], $data);
```

--------------------------------

### Get or Set Configuration Values with config() in PHP

Source: https://laravel.com/docs/10.x/helpers

The config function retrieves configuration values using dot syntax, with an option for a default value. It can also set configuration variables for the current request.

```PHP
$value = config('app.timezone');
$value = config('app.timezone', $default);

config(['app.debug' => true]);
```

--------------------------------

### Define Routes for Post Creation and Storage in Laravel

Source: https://laravel.com/docs/10.x/validation

Defines GET and POST routes for creating and storing blog posts using a PostController. These routes are fundamental for handling user-submitted form data in a Laravel application.

```PHP
use App\Http\Controllers\PostController;

Route::get('/post/create', [PostController::class, 'create']);
Route::post('/post', [PostController::class, 'store']);
```

--------------------------------

### List all Folio routes

Source: https://laravel.com/docs/10.x/folio

View a list of all generated Folio routes and their corresponding page files. This command helps in understanding the routing structure created by Folio pages.

```bash
php artisan folio:list
```

--------------------------------

### Get File Size (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Retrieves the size of a file in bytes using the Storage facade. Requires the file path as an argument.

```php
use Illuminate\Support\Facades\Storage;

$size = Storage::size('file.jpg');
```

--------------------------------

### Purge Expired Passport Tokens (Artisan)

Source: https://laravel.com/docs/10.x/passport

This command purges expired tokens and authorization codes from your Laravel Passport installation. It's useful for cleaning up old data and maintaining database efficiency.

```shell
php artisan passport:purge --expired
```

--------------------------------

### Configure Minio Object Storage in Homestead YAML

Source: https://laravel.com/docs/10.x/homestead

Enables the Minio object storage server within the Homestead configuration. Minio provides an S3-compatible API for storing and retrieving objects.

```yaml
minio: true
```

--------------------------------

### Example Malicious CSRF Form

Source: https://laravel.com/docs/10.x/csrf

Illustrates a potential cross-site request forgery attack using an HTML form. This example highlights how a malicious website could trick a user into performing an unauthorized action on your application.

```HTML
<form action="https://your-application.com/user/email" method="POST">
    <input type="email" value="malicious-email@example.com">
</form>

<script>
    document.forms[0].submit();
</script>
```

--------------------------------

### Initiate Stripe Checkout with Order Metadata (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to initiate a Stripe Checkout session and include custom metadata, specifically an order ID, which can be used to link the Stripe transaction back to your application's order. It utilizes Laravel's `User` model and Cashier's `checkout` method.

```php
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Http\Request;

Route::get('/cart/{cart}/checkout', function (Request $request, Cart $cart) {
    $order = Order::create([
        'cart_id' => $cart->id,
        'price_ids' => $cart->price_ids,
        'status' => 'incomplete',
    ]);

    return $request->user()->checkout($order->price_ids, [
        'success_url' => route('checkout-success').'?session_id={CHECKOUT_SESSION_ID}',
        'cancel_url' => route('checkout-cancel'),
        'metadata' => ['order_id' => $order->id],
    ]);
})->name('checkout');
```

--------------------------------

### Configure Shared Folders in Homestead

Source: https://laravel.com/docs/10.x/homestead

Defines shared folders between your host machine and the Homestead environment. Files in these mapped folders are synchronized. Supports multiple mappings and NFS/Rsync types.

```yaml
folders:
    - map: ~/code/project1
      to: /home/vagrant/project1
    - map: ~/code/project2
      to: /home/vagrant/project2
    - map: ~/code/project1
      to: /home/vagrant/project1
      type: "nfs"
    - map: ~/code/project1
      to: /home/vagrant/project1
      type: "rsync"
      options:
          rsync__args: ["--verbose", "--archive", "--delete", "-zz"]
          rsync__exclude: ["node_modules"]
```

--------------------------------

### Disable Automatic ChromeDriver Startup in Dusk

Source: https://laravel.com/docs/10.x/dusk

Comments out the line that automatically starts ChromeDriver in the `tests/DuskTestCase.php` file. This is done when you intend to manually manage the ChromeDriver process.

```php
/**
 * Prepare for Dusk test execution.
 *
 * @beforeClass
 */
public static function prepare(): void
{
    // static::startChromeDriver();
}
```

--------------------------------

### Configure Custom Billable Model

Source: https://laravel.com/docs/10.x/billing

Allows customization of the billable model used by Cashier. This method should be called in the `boot` method of the `AppServiceProvider` to specify an alternative customer model.

```php
use App\Models\Cashier\User;
use Laravel\Cashier\Cashier;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Cashier::useCustomerModel(User::class);
}
```

--------------------------------

### Render Registered Component (Blade)

Source: https://laravel.com/docs/10.x/blade

Renders a Blade component that has been manually registered with an alias or namespace. This example shows rendering a component aliased as 'package-alert'.

```blade
<x-package-alert/>
```

--------------------------------

### Listen for Event (JavaScript)

Source: https://laravel.com/docs/10.x/broadcasting

Listen for broadcasted events on a channel using Laravel Echo. This example shows how to listen for 'OrderShipmentStatusUpdated' on a channel and log data to the console.

```javascript
Echo.channel(`orders.${this.order.id}`)
    .listen('OrderShipmentStatusUpdated', (e) => {
        console.log(e.order.name);
    });
```

--------------------------------

### Customizing Job Handle Method Injection in Laravel

Source: https://laravel.com/docs/10.x/queues

This example demonstrates how to manually control dependency injection for a job's `handle` method using the service container's `bindMethod`. This is typically done in the `AppServiceProvider`.

```php
use App\Jobs\ProcessPodcast;
use App\Services\AudioProcessor;
use Illuminate\Contracts\Foundation\Application;

$this->app->bindMethod([ProcessPodcast::class, 'handle'], function (ProcessPodcast $job, Application $app) {
    return $job->handle($app->make(AudioProcessor::class));
});
```

--------------------------------

### Getting Raw Rendered View Contents

Source: https://laravel.com/docs/10.x/http-tests

Shows how to obtain the raw HTML content of a rendered view by casting the `TestView` instance to a string.

```php
$contents = (string) $this->view('welcome');
```

--------------------------------

### Configure Composer Minimum Stability for Beta Packages

Source: https://laravel.com/docs/10.x/pulse

Sets the minimum stability level for Composer to 'beta' and prefers stable packages. This is a prerequisite for installing packages like Laravel Pulse that might be in beta.

```json
{
  "minimum-stability": "beta",
  "prefer-stable": true
}
```

--------------------------------

### Set Connection and Queue for Batched Jobs in PHP

Source: https://laravel.com/docs/10.x/queues

This example demonstrates how to specify the queue connection and queue name for all jobs within a batch. Use the `onConnection` and `onQueue` methods to direct the batch to a specific Redis connection or a custom queue. All jobs in the batch must run on the same connection and queue.

```php
use Illuminate\Support\Facades\Bus;

$batch = Bus::batch([
    // ... jobs
])->then(function (Batch $batch) {
    // All jobs completed successfully...
})->onConnection('redis')->onQueue('imports')->dispatch();
```

--------------------------------

### Configure Private Network Interface (YAML)

Source: https://laravel.com/docs/10.x/homestead

Sets up a private network interface for your Homestead virtual machine. This assigns a static IP address to the VM, allowing consistent access within your local network.

```yaml
networks:
    - type: "private_network"
      ip: "192.168.10.20"
```

--------------------------------

### Access Current Route Information in Laravel

Source: https://laravel.com/docs/10.x/routing

Shows how to use the Route facade to get details about the current incoming request's route, including the route instance, name, and action. This requires the Illuminate\Support\Facades\Route facade to be imported.

```php
use Illuminate\Support\Facades\Route;

$route = Route::current(); // Illuminate\Routing\Route
$name = Route::currentRouteName(); // string
$action = Route::currentRouteAction(); // string
```

--------------------------------

### Register Tool in MCP Server

Source: https://laravel.com/docs/10.x/mcp

Defines the '$tools' property within a Laravel MCP Server class to register available tools. This example shows how to register the 'CurrentWeatherTool' within the 'WeatherServer'.

```php
<?php

namespace App\Mcp\Servers;

use App\Mcp\Tools\CurrentWeatherTool;
use Laravel\Mcp\Server;

class WeatherServer extends Server
{
    /**
     * The tools registered with this MCP server.
     *
     * @var array<int, class-string<\Laravel\Mcp\Server\Tool>>
     */
    protected array $tools = [
        CurrentWeatherTool::class,
    ];
}
```

--------------------------------

### Create On-Demand Disk Instance - Laravel

Source: https://laravel.com/docs/10.x/filesystem

This snippet illustrates how to create a temporary storage disk instance at runtime using a custom configuration array passed to `Storage::build`. The resulting disk instance can then be used for file operations like `put`. It requires the `IlluminateSupportFacadesStorage` facade.

```PHP
use Illuminate\Support\Facades\Storage;

$disk = Storage::build([
    'driver' => 'local',
    'root' => '/path/to/root',
]);

$disk->put('image.jpg', $content);
```

--------------------------------

### Configure API Authentication Guard for Passport

Source: https://laravel.com/docs/10.x/passport

Defines an 'api' authentication guard in `config/auth.php` to use Passport's `TokenGuard` for API request authentication.

```php
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],

    'api' => [
        'driver' => 'passport',
        'provider' => 'users',
    ],
],
```

--------------------------------

### Dispatching Jobs Synchronously in Laravel 10.x

Source: https://laravel.com/docs/10.x/upgrade

The deprecated `Bus::dispatchNow` and `dispatch_now` methods have been removed in Laravel 10.x. Use `Bus::dispatchSync` and `dispatch_sync` for synchronous job dispatching to maintain behavior.

```php
// Use dispatchSync instead of dispatchNow
Bus::dispatchSync($job);
```

--------------------------------

### Create Today's Date Instance with today() (PHP)

Source: https://laravel.com/docs/10.x/helpers

The `today` function instantiates a new `Illuminate\Support\Carbon` object representing the current date. This is a convenient way to get a Carbon instance for the current day without manual instantiation.

```PHP
$today = today();
```

--------------------------------

### Configure CreateFreshApiToken Middleware (PHP)

Source: https://laravel.com/docs/10.x/passport

Explains how to add the `CreateFreshApiToken` middleware to the 'web' middleware group in `app/Http/Kernel.php`. This middleware automatically attaches a `laravel_token` cookie to responses, facilitating API consumption from JavaScript.

```php
'web' => [
    // Other middleware...
    \Laravel\Passport\Http\Middleware\CreateFreshApiToken::class,
],
```

--------------------------------

### Basic HTTP Request and Status Assertion in PHP

Source: https://laravel.com/docs/10.x/http-tests

Demonstrates how to make a basic GET request to the application root and assert that the response has a status code of 200. This is a fundamental test for verifying application availability.

```php
<?php

namespace Tests\Feature;

use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_the_application_returns_a_successful_response(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
```

--------------------------------

### Type-Hinting Contracts in PHP for Service Resolution

Source: https://laravel.com/docs/10.x/contracts

Demonstrates how to use Laravel contracts by type-hinting an interface in a class constructor. The service container automatically resolves and injects the appropriate implementation when the class is instantiated. This example uses the `IlluminateContractsRedisFactory` contract.

```php
<?php

namespace App\Listeners;

use App\Events\OrderWasPlaced;
use App\Models\User;
use Illuminate\Contracts\Redis\Factory;

class CacheOrderInformation
{
    /**
     * Create a new event handler instance.
     */
    public function __construct(
        protected Factory $redis,
    ) {}

    /**
     * Handle the event.
     */
    public function handle(OrderWasPlaced $event): void
    {
        // ...
    }
}
```

--------------------------------

### Log Messages at Different Levels (PHP)

Source: https://laravel.com/docs/10.x/logging

Illustrates how to log messages at various severity levels using Laravel's Log facade. The example shows a 'debug' message and an 'emergency' message, highlighting how log channel configurations determine where messages are sent based on their level.

```php
Log::debug('An informational message.');
```

```php
Log::emergency('The system is down!');
```

--------------------------------

### Destroy Vagrant Box (Shell)

Source: https://laravel.com/docs/10.x/homestead

This command is used to terminate and remove the Vagrant virtual machine created by Homestead, freeing up system resources.

```shell
vagrant destroy
```

--------------------------------

### Display Invoice Information in a Table (PHP/HTML)

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to iterate over a collection of invoices and display relevant information such as the date, total amount, and a download link in an HTML table. It uses methods like `date()`, `total()`, and `id` from the `Laravel\Cashier\Invoice` object.

```PHP
<table>
    @foreach ($invoices as $invoice)
        <tr>
            <td>{{ $invoice->date()->toFormattedDateString() }}</td>
            <td>{{ $invoice->total() }}</td>
            <td><a href="/user/invoice/{{ $invoice->id }}">Download</a></td>
        </tr>
    @endforeach
</table>
```

--------------------------------

### Create a Directory (Laravel)

Source: https://laravel.com/docs/10.x/filesystem

Creates a directory, including any necessary parent directories, using the `makeDirectory` method of the Storage facade. This is useful for organizing files and ensuring paths exist before uploading.

```php
Storage::makeDirectory($directory);
```

--------------------------------

### Heroku CI Configuration for Laravel Dusk Tests

Source: https://laravel.com/docs/10.x/dusk

This JSON snippet configures Heroku CI to run Laravel Dusk tests. It includes essential buildpacks for PHP and Google Chrome, and defines scripts for test setup and execution. The `test` script ensures the ChromeDriver and a local PHP server are running before executing Dusk tests.

```json
{
  "environments": {
    "test": {
      "buildpacks": [
        { "url": "heroku/php" },
        { "url": "https://github.com/heroku/heroku-buildpack-google-chrome" }
      ],
      "scripts": {
        "test-setup": "cp .env.testing .env",
        "test": "nohup bash -c './vendor/laravel/dusk/bin/chromedriver-linux > /dev/null 2>&1 &' && nohup bash -c 'php artisan serve --no-reload > /dev/null 2>&1 &' && php artisan dusk"
      }
    }
  }
}
```

--------------------------------

### Custom Truncation Hooks in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

Defines methods to execute code before or after database truncation in Laravel Dusk tests. `beforeTruncatingDatabase` runs prior to truncation, and `afterTruncatingDatabase` runs after, allowing for setup or teardown logic.

```php
/**
 * Perform any work that should take place before the database has started truncating.
 */
protected function beforeTruncatingDatabase(): void
{
    //
}
```

```php
/**
 * Perform any work that should take place after the database has finished truncating.
 */
protected function afterTruncatingDatabase(): void
{
    //
}
```

--------------------------------

### Register Custom Scout Search Engine (PHP)

Source: https://laravel.com/docs/10.x/scout

Demonstrates how to register a custom search engine with Laravel Scout using the `extend` method on the `EngineManager`. This example registers a 'mysql' driver using `App\ScoutExtensions\MySqlSearchEngine`. This code should be placed in the `boot` method of a service provider.

```php
use App\ScoutExtensions\MySqlSearchEngine;
use Laravel\Scout\EngineManager;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    resolve(EngineManager::class)->extend('mysql', function () {
        return new MySqlSearchEngine;
    });
}
```

--------------------------------

### Check Attribute Presence in Blade Component

Source: https://laravel.com/docs/10.x/blade

Demonstrates how to check for the presence of attributes in a Blade component using `has`, `hasAny`, and `get` methods. `has` checks for a single attribute or all attributes in an array. `hasAny` checks if at least one attribute is present. `get` retrieves the value of a specific attribute.

```blade
@if ($attributes->has('class'))
    <div>Class attribute is present</div>
@endif
```

```blade
@if ($attributes->has(['name', 'class']))
    <div>All of the attributes are present</div>
@endif
```

```blade
@if ($attributes->hasAny(['href', ':href', 'v-bind:href']))
    <div>One of the attributes is present</div>
@endif
```

```blade
{{ $attributes->get('class') }}
```

--------------------------------

### Render Namespaced Component (Blade)

Source: https://laravel.com/docs/10.x/blade

Renders Blade components from a registered namespace using the 'vendor::component' syntax. This example shows rendering 'calendar' and 'color-picker' components from the 'nightshade' package namespace.

```blade
<x-nightshade::calendar />
<x-nightshade::color-picker />
```

--------------------------------

### Install PSR-7 Bridge Components for Laravel

Source: https://laravel.com/docs/10.x/requests

To use PSR-7 compatible requests in Laravel, you need to install the Symfony HTTP Message Bridge and Nyholm PSR7 libraries. This allows Laravel to convert its native request objects to PSR-7 implementations.

```shell
composer require symfony/psr-http-message-bridge
composer require nyholm/psr7
```

--------------------------------

### Type-Hinting Dependencies in Laravel Routes

Source: https://laravel.com/docs/10.x/container

Example of type-hinting the `IlluminateHttpRequest` object directly in a route definition. This allows direct access to the request object without manual container interaction, showcasing automatic dependency injection.

```php
use Illuminate\Http\Request;

Route::get('/', function (Request $request) {
    // ...
});
```

--------------------------------

### PUT /oauth/clients/{client-id}

Source: https://laravel.com/docs/10.x/passport

Updates an existing OAuth client identified by its ID. Requires the client's name and a redirect URL for the update.

```APIDOC
## PUT /oauth/clients/{client-id}

### Description
Updates existing OAuth clients. It requires the client's `name` and a `redirect` URL. The route will return the updated client instance.

### Method
PUT

### Endpoint
/oauth/clients/{client-id}

### Parameters

#### Path Parameters
- **client-id** (integer) - Required - The ID of the client to update.

#### Request Body
- **name** (string) - Required - The new name for the client.
- **redirect** (string) - Required - The new redirect URI for the client.

### Request Example
```js
const clientId = 1; // Assume clientId is obtained previously
const data = {
    name: 'New Client Name',
    redirect: 'http://example.com/callback'
};

axios.put('/oauth/clients/' + clientId, data)
    .then(response => {
        console.log(response.data);
    })
    .catch (response => {
        // List errors on response...
    });
```

### Response
#### Success Response (200 OK)
- **id** (integer) - The ID of the updated client.
- **name** (string) - The updated name of the client.
- **redirect_uri** (string) - The updated redirect URI for the client.
- **secret** (string) - The client secret (remains the same unless re-issued).
- **created_at** (datetime) - The timestamp when the client was created.
- **updated_at** (datetime) - The timestamp when the client was last updated.

#### Response Example
```json
{
  "id": 1,
  "name": "Updated Client Name",
  "redirect_uri": "http://example.com/callback",
  "secret": "your_client_secret",
  "created_at": "2023-10-27T10:00:00.000Z",
  "updated_at": "2023-10-27T10:10:00.000Z"
}
```
```

--------------------------------

### Start Octane with Custom Worker Count

Source: https://laravel.com/docs/10.x/octane

Allows manual specification of the number of application request workers for Octane. This controls how many concurrent requests your application can handle.

```shell
php artisan octane:start --workers=4
```

--------------------------------

### Prevent Telescope Auto-Discovery in composer.json

Source: https://laravel.com/docs/10.x/telescope

Configures `composer.json` to prevent Laravel from automatically discovering and registering the Telescope package. This is a step in the local-only installation.

```json
"extra": {
    "laravel": {
        "dont-discover": [
            "laravel/telescope"
        ]
    }
},
```

--------------------------------

### Query Subscription Scopes (PHP)

Source: https://laravel.com/docs/10.x/billing

Demonstrates how to use built-in query scopes to retrieve subscriptions based on their status. These scopes allow for easy filtering of subscriptions in the database, such as active, canceled, or past due subscriptions.

```php
// Get all active subscriptions...
$subscriptions = Subscription::query()->active()->get();

// Get all of the canceled subscriptions for a user...
$subscriptions = $user->subscriptions()->canceled()->get();
```

--------------------------------

### Define MCP Tool Input Schema

Source: https://laravel.com/docs/10.x/mcp

Specifies the input arguments for an MCP tool using Laravel's JsonSchema builder. This example defines 'location' as a required string and 'units' as an enum with a default value.

```php
<?php

namespace App\Mcp\Tools;

use Illuminate\JsonSchema\JsonSchema;
use Laravel\Mcp\Server\Tool;

class CurrentWeatherTool extends Tool
{
    /**
     * Get the tool's input schema.
     *
     * @return array<string, JsonSchema>
     */
    public function schema(JsonSchema $schema): array
    {
        return [
            'location' => $schema->string()
                ->description('The location to get the weather for.')
                ->required(),

            'units' => $schema->enum(['celsius', 'fahrenheit'])
                ->description('The temperature units to use.')
                ->default('celsius'),
        ];
    }
}
```

--------------------------------

### Benchmark Code Execution and Get Value with Benchmark::value() (PHP)

Source: https://laravel.com/docs/10.x/helpers

The `Benchmark::value` method executes a callback, returns its result, and also provides the execution duration in milliseconds as a tuple. This is useful when you need both the output and the performance metrics of a piece of code.

```PHP
[$count, $duration] = Benchmark::value(fn () => User::count());
```

--------------------------------

### Applying Annotations to Laravel MCP Tools

Source: https://laravel.com/docs/10.x/mcp

Shows how to enhance MCP tools with annotations using attributes to provide metadata for AI clients. Supported annotations include `IsIdempotent`, `IsReadOnly`, `IsDestructive`, and `IsOpenWorld`. Requires annotation classes from `Laravel\Mcp\Server\Tools\Annotations`.

```php
<?php

namespace App\Mcp\Tools;

use Laravel\Mcp\Server\Tools\Annotations\IsIdempotent;
use Laravel\Mcp\Server\Tools\Annotations\IsReadOnly;
use Laravel\Mcp\Server\Tool;

#[IsIdempotent]
#[IsReadOnly]
class CurrentWeatherTool extends Tool
{
    //
}
```

--------------------------------

### Blade Template for Paginated Search Results

Source: https://laravel.com/docs/10.x/scout

Provides an example of how to loop through paginated search results and render pagination links using Blade directives, similar to traditional Eloquent pagination.

```html
<div class="container">
    @foreach ($orders as $order)
        {{ $order->price }}
    @endforeach
</div>

{{ $orders->links() }}
```

--------------------------------

### Valet Driver - Serves Method Implementation

Source: https://laravel.com/docs/10.x/valet

The 'serves' method determines if a custom Valet driver should handle the incoming request. It returns true if the provided site path contains a project of the type the driver is intended to serve, and false otherwise. This example checks for the existence of a 'wp-admin' directory, typical for WordPress sites.

```php
/**
 * Determine if the driver serves the request.
 */
public function serves(string $sitePath, string $siteName, string $uri): bool
{
    return is_dir($sitePath.'/wp-admin');
}
```

--------------------------------

### Create New Laravel Application with Pest Scaffolding

Source: https://laravel.com/docs/10.x/releases

This command shows how to generate a new Laravel application pre-configured with Pest test scaffolding. By using the `--pest` flag, developers can opt-in to Pest as the default testing framework from the project's inception.

```shell
laravel new example-application --pest
```

--------------------------------

### Configure Default Currency

Source: https://laravel.com/docs/10.x/billing

Sets the default currency for Cashier by defining the `CASHIER_CURRENCY` environment variable. This impacts how monetary values are handled and displayed.

```ini
CASHIER_CURRENCY=eur
```

--------------------------------

### Construct URL with URI Templates

Source: https://laravel.com/docs/10.x/http-client

Illustrates how to dynamically construct request URLs using URI templates and the `withUrlParameters` method. This allows for flexible URL generation based on provided parameters.

```php
Http::withUrlParameters([
    'endpoint' => 'https://laravel.com',
    'page' => 'docs',
    'version' => '9.x',
    'topic' => 'validation',
])->get('{+endpoint}/{page}/{version}/{topic}');
```

--------------------------------

### Schedule Token Purging

Source: https://laravel.com/docs/10.x/passport

Configure a scheduled job to automatically prune expired tokens.

```APIDOC
## Schedule Token Purging

### Description
Automatically prune expired passport tokens on a schedule.

### Method
Configuration in `App\Console\Kernel`

### Endpoint
N/A

### Parameters
N/A

### Request Example
```php
<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        $schedule->command('passport:purge')->hourly();
    }
}
```

### Response
N/A

#### Response Example
N/A
```

--------------------------------

### Define Envoy Task on Multiple Servers

Source: https://laravel.com/docs/10.x/envoy

This example demonstrates running a 'deploy' task on multiple servers ('web-1', 'web-2') by listing them in the `on` array of the `@task` directive. It also includes a variable `{{ $branch }}` for dynamic command execution.

```blade
@servers(['web-1' => '192.168.1.1', 'web-2' => '192.168.1.2'])

@task('deploy', ['on' => ['web-1', 'web-2']])
    cd /home/user/example.com
    git pull origin {{ $branch }}
    php artisan migrate --force
@endtask
```

--------------------------------

### Artisan Command: passport:purge

Source: https://laravel.com/docs/10.x/passport

Command to purge revoked and expired tokens and authorization codes from the database.

```APIDOC
## Artisan Command: passport:purge

### Description
This Artisan command is used to remove revoked and expired tokens and authorization codes from your database.

### Usage
```shell
php artisan passport:purge
```

### Options
- **--hours=** (integer) - Optional - Purge tokens and authorization codes expired for more than the specified number of hours.
  Example: `php artisan passport:purge --hours=6`
- **--revoked** - Optional - Only purge revoked tokens and authorization codes.
  Example: `php artisan passport:purge --revoked`
```

--------------------------------

### Define Basic Routes in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

This PHP code defines basic routes in Laravel, including routes with simple closures, routes with parameters, optional parameters with default values, and routes with parameter constraints.

```php
// routes/web.php
use IlluminateSupportFacadesRoute;

Route::get('/greeting', function () {
    return 'Hello World';
});

// Route with parameters
Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
});

// Optional parameters with default value
Route::get('/user/{name?}', function (?string $name = 'John') {
    return $name;
});

// Route with constraints
Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
})->where('id', '[0-9]+');

// Multiple constraints
Route::get('/user/{id}/{name}', function (string $id, string $name) {
    return "User $id: $name";
})->where(['id' => '[0-9]+', 'name' => '[a-z]+']);
```

--------------------------------

### Create Subscription with Specific Quantity

Source: https://laravel.com/docs/10.x/billing

This PHP code shows how to create a subscription with a specified quantity for the subscribed price. The `quantity` method is invoked on the subscription builder before calling `create`. This is useful for scenarios where a subscription's cost scales with usage or volume.

```php
$user->newSubscription('default', 'price_monthly')
     ->quantity(5)
     ->create($paymentMethod);
```

--------------------------------

### Customize Mail Notification Theme

Source: https://laravel.com/docs/10.x/notifications

Example of customizing the theme for an individual mail notification in Laravel using the 'theme' method.

```php
public function toMail(object $notifiable): MailMessage
{
    return (new MailMessage)
                ->theme('invoice')
                ->subject('Invoice Paid')
                ->markdown('mail.invoice.paid', ['url' => $url]);
}
```

--------------------------------

### Retrieve Upcoming Invoice for a Customer (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to retrieve the upcoming invoice for a customer using the `upcomingInvoice` method. This is useful for displaying projected billing information.

```PHP
$invoice = $user->upcomingInvoice();
```

--------------------------------

### Advanced Vite Configuration in Laravel Blade and Vite Config

Source: https://laravel.com/docs/10.x/vite

Provides examples of advanced customization for Laravel's Vite plugin, including specifying the hot file, build directory, and manifest filename. It shows configurations in both Blade views and the `vite.config.js` file, as well as customizing asset path generation.

```blade
<!doctype html>
<head>
    {{-- ... --}}

    {{
        Vite::useHotFile(storage_path('vite.hot'))
            ->useBuildDirectory('bundle')
            ->useManifestFilename('assets.json')
            ->withEntryPoints(['resources/js/app.js'])
            ->createAssetPathsUsing(function (string $path, ?bool $secure) {
                return "https://cdn.example.com/{$path}";
            })
    }}
</head>
```

```javascript
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            hotFile: 'storage/vite.hot',
            buildDirectory: 'bundle',
            input: ['resources/js/app.js'],
        }),
    ],
    build: {
      manifest: 'assets.json',
    },
});
```

--------------------------------

### Configure Site Type in Homestead.yaml

Source: https://laravel.com/docs/10.x/homestead

This snippet shows how to define a specific site type, such as 'statamic', within the Homestead.yaml configuration file. It maps a domain to a project directory and specifies the site type.

```yaml
sites:
    - map: statamic.test
      to: /home/vagrant/my-symfony-project/web
      type: "statamic"
```

--------------------------------

### Build Subscribed Middleware (PHP)

Source: https://laravel.com/docs/10.x/billing

Creates a middleware to protect routes, ensuring that only subscribed users can access them. If a user is not subscribed, they are redirected to a specified billing page. Requires user authentication and the Billable trait.

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Subscribed
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (! $request->user()?->subscribed()) {
            // Redirect user to billing page and ask them to subscribe...
            return redirect('/billing');
        }

        return $next($request);
    }
}
```

--------------------------------

### Database Cache Lock Table Schema (Laravel)

Source: https://laravel.com/docs/10.x/cache

Provides an example `Schema` declaration for creating the `cache_locks` table required when using the `database` cache driver for atomic locks. It defines the necessary columns: `key`, `owner`, and `expiration`.

```php
Schema::create('cache_locks', function (Blueprint $table) {
    $table->string('key')->primary();
    $table->string('owner');
    $table->integer('expiration');
});
```

--------------------------------

### Customize Guest Checkout with Promotion Code - PHP

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to customize a guest checkout session by applying a promotion code using Laravel Cashier. It extends the basic guest checkout by adding the `withPromotionCode` method. Dependencies are the same as the basic guest checkout.

```php
use Illuminate\Http\Request;
use Laravel\Cashier\Checkout;

Route::get('/product-checkout', function (Request $request) {
    return Checkout::guest()
        ->withPromotionCode('promo-code')
        ->create('price_tshirt', [
            'success_url' => route('your-success-route'),
            'cancel_url' => route('your-cancel-route'),
        ]);
});
```

--------------------------------

### Load Package Migrations - PHP

Source: https://laravel.com/docs/10.x/packages

Loads database migrations from a package using the `loadMigrationsFrom` method in the service provider's `boot` method. Migrations will automatically run with `php artisan migrate`.

```PHP
<?php

namespace VendorName\PackageName\Providers;

use Illuminate\Support\ServiceProvider;

class PackageServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any package services.
     */
    public function boot(): void
    {
        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');
    }
}
```

--------------------------------

### Laravel Stripe Checkout for Existing Product

Source: https://laravel.com/docs/10.x/billing

Initiates a Stripe Checkout session for an existing product defined in your Stripe dashboard. Requires a Stripe Price ID. Redirects the user to Stripe's Checkout page upon completion or cancellation.

```PHP
use Illuminate\Http\Request;

Route::get('/product-checkout', function (Request $request) {
    return $request->user()->checkout('price_tshirt');
});
```

--------------------------------

### DELETE /oauth/clients/{client-id}

Source: https://laravel.com/docs/10.x/passport

Deletes an existing OAuth client identified by its ID.

```APIDOC
## DELETE /oauth/clients/{client-id}

### Description
Deletes OAuth clients.

### Method
DELETE

### Endpoint
/oauth/clients/{client-id}

### Parameters

#### Path Parameters
- **client-id** (integer) - Required - The ID of the client to delete.

### Request Example
```js
const clientId = 1; // Assume clientId is obtained previously

axios.delete('/oauth/clients/' + clientId)
    .then(response => {
        // Client deleted successfully
    });
```

### Response
#### Success Response (204 No Content)
This endpoint returns no content upon successful deletion.
```

--------------------------------

### Configure Vite for Server-Side Rendering (SSR)

Source: https://laravel.com/docs/10.x/vite

Shows how to configure the Laravel Vite plugin for Server-Side Rendering (SSR). This involves specifying an SSR entry point in `vite.config.js` and updating the `package.json` build script. It also includes commands to build and run the SSR server.

```javascript
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            ssr: 'resources/js/ssr.js',
        }),
    ],
});
```

```json
"scripts": {
     "dev": "vite",
     "build": "vite build && vite build --ssr"
}
```

```shell
npm run build
node bootstrap/ssr/ssr.js
```

```shell
php artisan inertia:start-ssr
```

--------------------------------

### Send a Signal to a Running Process in PHP

Source: https://laravel.com/docs/10.x/processes

The `signal` method sends a specified signal to a running process. Predefined signal constants from PHP's PCNTL extension can be used. `SIGUSR2` is used as an example signal.

```php
$process->signal(SIGUSR2);
```

--------------------------------

### Define Console Command Option with Shortcut (PHP)

Source: https://laravel.com/docs/10.x/artisan

Defines a console command option ('queue') with a single-character shortcut ('Q'). This allows users to use either '--queue' or '-Q' when invoking the command.

```php
'mail:send {user} {--Q|queue}'
```

--------------------------------

### Cache Laravel Configuration

Source: https://laravel.com/docs/10.x/deployment

This Artisan command caches all of Laravel's configuration files into a single file, significantly reducing filesystem reads when loading configuration values in production. Ensure you only use the `env()` function within configuration files, as the `.env` file is not loaded after caching.

```shell
php artisan config:cache
```

--------------------------------

### Define a Laravel 10.x Class-Based Console Command

Source: https://laravel.com/docs/10.x/artisan

This snippet demonstrates how to define a console command using a class in Laravel 10.x. It includes setting the command signature, description, and the core logic within the `handle` method. Dependencies can be type-hinted in the `handle` method and will be resolved by the service container.

```php
<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Support\DripEmailer;
use Illuminate\Console\Command;

class SendEmails extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'mail:send {user}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send a marketing email to a user';

    /**
     * Execute the console command.
     */
    public function handle(DripEmailer $drip): void
    {
        $drip->send(User::find($this->argument('user')));
    }
}
```

--------------------------------

### Listen for Presence Channel Events with Echo

Source: https://laravel.com/docs/10.x/broadcasting

Provides an example of listening for specific events, such as 'NewMessage', on a presence channel using Echo. This allows real-time updates from other users in the channel.

```javascript
Echo.join(`chat.${roomId}`)
    .here(/* ... */)
    .joining(/* ... */)
    .leaving(/* ... */)
    .listen('NewMessage', (e) => {
        // ...
    });
```

--------------------------------

### Generate PKCE Code Verifier and Challenge (PHP)

Source: https://laravel.com/docs/10.x/passport

This code snippet demonstrates how to generate a code verifier and then derive a Base64 URL-and-filename-safe encoded code challenge from it using SHA256 hashing. This is crucial for the PKCE flow in Passport.

```php
$encoded = base64_encode(hash('sha256', $code_verifier, true));

$codeChallenge = strtr(rtrim($encoded, '='), '+/', '-_');
```

--------------------------------

### Registering Simple Service Container Bindings in Laravel

Source: https://laravel.com/docs/10.x/container

Demonstrates how to register a simple binding within a Laravel service provider using the `bind` method. It registers a `Transistor` class, providing a closure that resolves a `PodcastParser` dependency.

```php
use App\Services\Transistor;
use App\Services\PodcastParser;
use Illuminate\Contracts\Foundation\Application;

$this->app->bind(Transistor::class, function (Application $app) {
    return new Transistor($app->make(PodcastParser::class));
});
```

--------------------------------

### Start Octane with Custom Max Requests Per Worker

Source: https://laravel.com/docs/10.x/octane

Configures the maximum number of requests a single worker will handle before being gracefully restarted. This helps mitigate potential memory leaks.

```shell
php artisan octane:start --max-requests=250
```

--------------------------------

### Park Directory with Valet

Source: https://laravel.com/docs/10.x/valet

The `valet park` command designates a directory to serve all its subdirectories as distinct sites. Any directory within the 'parked' location will be accessible via `http://<directory-name>.test`.

```shell
cd ~/Sites

valet park
```

--------------------------------

### Retrieve Stripe Customer Object (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

This PHP snippet demonstrates how to retrieve the Stripe customer object for a billable model. The `asStripeCustomer` method is used for this purpose.

```php
$stripeCustomer = $user->asStripeCustomer();
```

--------------------------------

### Render Anonymous Component (Blade)

Source: https://laravel.com/docs/10.x/blade

Renders an anonymous Blade component defined in a Blade file located in the 'resources/views/components' directory. This example assumes a component is defined at 'resources/views/components/alert.blade.php'.

```blade
<x-alert/>
```

--------------------------------

### Laravel Stripe Checkout with Promotion Codes Enabled

Source: https://laravel.com/docs/10.x/billing

Enables user-redeemable promotion codes for Stripe Checkout sessions. This is achieved by chaining the `allowPromotionCodes` method before initiating the checkout. It applies to existing products.

```PHP
use Illuminate\Http\Request;

Route::get('/product-checkout', function (Request $request) {
    return $request->user()
        ->allowPromotionCodes()
        ->checkout('price_tshirt');
});
```

--------------------------------

### Capture Process Output in Real-time with a Closure in PHP

Source: https://laravel.com/docs/10.x/processes

Process output can be captured in real-time by providing a closure to the `run` method. This closure receives the output type ('stdout' or 'stderr') and the output string. It's useful for immediate feedback during long-running processes. The `ls -la` command is used as an example.

```php
$result = Process::run('ls -la', function (string $type, string $output) {
    echo $output;
});
```

--------------------------------

### Registering Container Bindings and Singletons in Laravel Service Provider

Source: https://laravel.com/docs/10.x/providers

This snippet demonstrates how to use the `bindings` and `singletons` properties within a Laravel Service Provider to automatically register container bindings and singletons when the provider is loaded. This simplifies the registration of multiple simple bindings. Dependencies include the Laravel ServiceProvider class and specific contract/service classes.

```php
<?php

namespace App\Providers;

use App\Contracts\DowntimeNotifier;
use App\Contracts\ServerProvider;
use App\Services\DigitalOceanServerProvider;
use App\Services\PingdomDowntimeNotifier;
use App\Services\ServerToolsProvider;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * All of the container bindings that should be registered.
     *
     * @var array
     */
    public $bindings = [
        ServerProvider::class => DigitalOceanServerProvider::class,
    ];

    /**
     * All of the container singletons that should be registered.
     *
     * @var array
     */
    public $singletons = [
        DowntimeNotifier::class => PingdomDowntimeNotifier::class,
        ServerProvider::class => ServerToolsProvider::class,
    ];
}
```

--------------------------------

### Retrieve Customer-Specific Price Previews with Laravel

Source: https://laravel.com/docs/10.x/cashier-paddle

Fetch prices tailored to an existing customer by calling the `previewPrices` method on the customer's model instance. This utilizes the customer's Paddle customer ID to get prices in their associated currency.

```php
use App\Models\User;

$prices = User::find(1)->previewPrices(['pri_123', 'pri_456']);
```

--------------------------------

### Create Client Credentials Grant Client (Shell)

Source: https://laravel.com/docs/10.x/passport

Command to create a client credentials grant client for Laravel Passport using the Artisan CLI. This is used for machine-to-machine authentication. The `--client` option specifies the type of client to create.

```shell
php artisan passport:client --client

```

--------------------------------

### Create User with Trial End Date (PHP)

Source: https://laravel.com/docs/10.x/billing

This code snippet demonstrates how to create a new user record with a specified trial end date, allowing for trial periods without an upfront payment method. It requires the App\Models\User model and the `now()` helper function.

```PHP
use App\Models\User;

$user = User::create([
    // ...
    'trial_ends_at' => now()->addDays(10),
]);
```

--------------------------------

### Create range collection in Laravel

Source: https://laravel.com/docs/10.x/collections

The range method creates and returns a collection containing integers within a specified start and end range, inclusive.

```php
$collection = collect()->range(3, 6);

$collection->all();

// [3, 4, 5, 6]
```

--------------------------------

### String Manipulation: String Reversal (PHP)

Source: https://laravel.com/docs/10.x/mcp

Provides an example of reversing a string in PHP. This is a basic string operation that can be achieved using built-in functions. It takes a string as input and returns the reversed string.

```php
<?php

$string = 'hello';
$reversedString = strrev($string);

echo $reversedString;
// Output: olleh

```

--------------------------------

### Update Vagrant Box

Source: https://laravel.com/docs/10.x/homestead

Command to update the underlying Vagrant box used by Homestead to its latest available version. This ensures you are running on the most recent base image.

```shell
vagrant box update
```

--------------------------------

### Take Characters from String Start - PHP

Source: https://laravel.com/docs/10.x/strings

The take method extracts a specified number of characters from the beginning of a string. It returns a new string containing only the requested characters. This is useful for creating prefixes or truncating strings.

```php
use Illuminate\Support\Str;

$taken = Str::of('Build something amazing!')->take(5);

// Build
```

--------------------------------

### Create a One-Time Charge with an Invoice using Laravel Cashier

Source: https://laravel.com/docs/10.x/billing

The `invoicePrice` method creates a one-time charge and generates a PDF invoice. It takes a Stripe price ID and quantity. Optional arrays for discounts and tax rates can be provided. The `invoiceFor` method offers a simpler alternative for one-off charges without pre-defined prices.

```php
$user->invoicePrice('price_tshirt', 5);
```

```php
$user->invoicePrice('price_tshirt', 5, [
    'discounts' => [['coupon' => 'SUMMER21SALE']],
], [
    'default_tax_rates' => ['txr_id'],
]);
```

```php
$user->invoiceFor('One Time Fee', 500);
```

--------------------------------

### Retrieve Upcoming Invoice for a Specific Subscription (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to retrieve the upcoming invoice for a specific subscription of a customer. This is particularly useful when a customer has multiple subscriptions.

```PHP
$invoice = $user->subscription('default')->upcomingInvoice();
```

--------------------------------

### Create Response Instances with response() in Laravel

Source: https://laravel.com/docs/10.x/helpers

The `response` function in Laravel is used to create a response instance or access the response factory. It can return a basic response with content, status, and headers, or a JSON response by accessing the factory methods.

```php
return response('Hello World', 200, $headers);
```

```php
return response()->json(['foo' => 'bar'], 200, $headers);
```

--------------------------------

### Purge Expired Tokens

Source: https://laravel.com/docs/10.x/passport

This command removes expired passport tokens and authorization codes from your application.

```APIDOC
## Purge Expired Tokens

### Description
Removes expired passport tokens and authorization codes.

### Method
CLI command

### Endpoint
N/A

### Parameters
#### Command Line Options
- `--expired` (boolean) - Optional - Purges only expired tokens and authorization codes.

### Request Example
```shell
php artisan passport:purge --expired
```

### Response
#### Success Response
No direct response, but tokens and codes are removed from the database.

#### Response Example
N/A
```

--------------------------------

### Ignore Passport's Default Migrations

Source: https://laravel.com/docs/10.x/passport

Instructs Passport to ignore its default database migrations, allowing developers to use their own custom migration files.

```php
public function register(): void
{
    Passport::ignoreMigrations();
}
```

--------------------------------

### Get First Array Element with head (PHP)

Source: https://laravel.com/docs/10.x/helpers

The head function returns the first element of a given array. It is a simple utility for accessing the initial item in a collection.

```php
$array = [100, 200, 300];

$first = head($array);

// 100
```

--------------------------------

### Protect Route with All Required Token Abilities (Laravel)

Source: https://laravel.com/docs/10.x/sanctum

Use the 'abilities' middleware on a route to ensure the authenticated token possesses all specified abilities. This is useful for actions requiring multiple permissions, such as checking order status and placing orders.

```php
use Illuminate\Support\Facades\Route;

Route::get('/orders', function () {
    // Token has both "check-status" and "place-orders" abilities...
})->middleware(['auth:sanctum', 'abilities:check-status,place-orders']);
```

--------------------------------

### Hydrating a Batch with Additional Jobs (PHP)

Source: https://laravel.com/docs/10.x/queues

An example of a job that dynamically adds more jobs to its parent batch. It checks if the batch has been cancelled and then uses the `add` method on the batch instance to append a collection of new `ImportContacts` jobs. This requires the job to belong to the same batch.

```php
use App\Jobs\ImportContacts;
use Illuminate\Support\Collection;

/**
 * Execute the job.
 */
public function handle(): void
{
    if ($this->batch()->cancelled()) {
        return;
    }

    $this->batch()->add(Collection::times(1000, function () {
        return new ImportContacts;
    }));
}
```

--------------------------------

### Resolving Request Instance with Closure (Laravel)

Source: https://laravel.com/docs/10.x/octane

This example shows alternative ways to bind a service that depends on the request instance. It includes binding with a closure that resolves the request on demand and a method call to pass specific request data, which are recommended approaches to avoid issues with singletons.

```php
use App\Service;
use Illuminate\Contracts\Foundation\Application;

$this->app->bind(Service::class, function (Application $app) {
    return new Service($app['request']);
});

$this->app->singleton(Service::class, function (Application $app) {
    return new Service(fn () => $app['request']);
});

// Or...

$service->method($request->input('name'));
```

--------------------------------

### Personal Access Tokens API

Source: https://laravel.com/docs/10.x/passport

Manage personal access tokens for the authenticated user. These tokens can be used for API access without requiring a full OAuth redirect flow.

```APIDOC
## GET /oauth/scopes

### Description
Retrieves all defined scopes for your application.

### Method
GET

### Endpoint
/oauth/scopes

### Parameters
None

### Response
#### Success Response (200)
- An array of available scopes (strings).

#### Response Example
```json
[
    "scope-name-1",
    "scope-name-2"
]
```
```

```APIDOC
## GET /oauth/personal-access-tokens

### Description
Retrieves all personal access tokens created by the authenticated user.

### Method
GET

### Endpoint
/oauth/personal-access-tokens

### Parameters
None

### Response
#### Success Response (200)
- An array of personal access token objects, each containing details like ID, name, and scopes.

#### Response Example
```json
[
    {
        "id": 1,
        "name": "My Token",
        "scopes": ["scope1"],
        "last_used_at": "2023-10-27T10:00:00.000Z",
        "created_at": "2023-10-27T09:00:00.000Z"
    }
]
```
```

```APIDOC
## POST /oauth/personal-access-tokens

### Description
Creates a new personal access token for the authenticated user.

### Method
POST

### Endpoint
/oauth/personal-access-tokens

### Parameters
#### Request Body
- **name** (string) - Required - The name for the new token.
- **scopes** (array) - Optional - An array of scopes to assign to the token.

### Request Example
```json
{
    "name": "My New Token",
    "scopes": ["read", "write"]
}
```

### Response
#### Success Response (200)
- **accessToken** (string) - The newly created access token.
- **token** (string) - The full token object, including ID, name, and scopes.

#### Response Example
```json
{
    "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...",
    "token": {
        "id": 2,
        "name": "My New Token",
        "scopes": ["read", "write"],
        "created_at": "2023-10-27T11:00:00.000Z"
    }
}
```
```

```APIDOC
## DELETE /oauth/personal-access-tokens/{token-id}

### Description
Revokes (deletes) a specific personal access token.

### Method
DELETE

### Endpoint
/oauth/personal-access-tokens/{token-id}

### Parameters
#### Path Parameters
- **token-id** (integer) - Required - The ID of the token to revoke.

### Response
#### Success Response (204)
No content is returned on successful deletion.

#### Response Example
(No content)
```

--------------------------------

### Check if a Passport Scope is Defined (PHP)

Source: https://laravel.com/docs/10.x/passport

Shows the usage of the `Passport::hasScope()` method to determine if a scope with a given name ('place-orders') has been defined in your Passport configuration.

```php
use Laravel\Passport\Passport;

Passport::hasScope('place-orders');
```

--------------------------------

### Subdomain Routing with Route Parameters (PHP)

Source: https://laravel.com/docs/10.x/routing

Handles routing for subdomains by defining a common domain pattern ({account}.example.com) and extracting parameters from the subdomain. Route parameters can be captured and used within the route closure.

```PHP
use Illuminate\Support\Facades\Route;

Route::domain('{account}.example.com')->group(function () {
    Route::get('user/{id}', function (string $account, string $id) {
        // Access $account and $id from the subdomain and route
    });
});
```

--------------------------------

### Get and Check Current Locale

Source: https://laravel.com/docs/10.x/localization

Utilizes the App facade to retrieve the currently active locale and to check if the current locale matches a specific language.

```php
use Illuminate\Support\Facades\App;

$locale = App::currentLocale();

if (App::isLocale('en')) {
    // ...
}
```

--------------------------------

### Configure Laravel Echo with Existing Pusher Client

Source: https://laravel.com/docs/10.x/broadcasting

Demonstrates how to configure Laravel Echo to utilize a pre-existing Pusher Channels client instance. This is useful when you have custom configurations or existing Pusher setups that Echo needs to integrate with.

```javascript
import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

const options = {
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key'
}

window.Echo = new Echo({
    ...options,
    client: new Pusher(options.key, options)
});
```

--------------------------------

### Define Telescope Dashboard Authorization Gate (PHP)

Source: https://laravel.com/docs/10.x/telescope

Defines an authorization gate to control access to the Telescope dashboard in non-local environments. This example restricts access to users with a specific email address.

```php
use App\Models\User;

/**
 * Register the Telescope gate.
 *
 * This gate determines who can access Telescope in non-local environments.
 */
protected function gate(): void
{
    Gate::define('viewTelescope', function (User $user) {
        return in_array($user->email, [
            'taylor@laravel.com',
        ]);
    });
}
```

--------------------------------

### Blade Conditional Directives (If/ElseIf/Else/Unless)

Source: https://laravel.com/docs/10.x/blade

Provides examples of using Blade's `if` statement directives: `@if`, `@elseif`, `@else`, and `@endif`. It also shows the `@unless` directive as a convenience for `if` statements.

```blade
@if (count($records) === 1)
    I have one record!
@elseif (count($records) > 1)
    I have multiple records!
@else
    I don't have any records!
@endif
```

```blade
@unless (Auth::check())
    You are not signed in.
@endunless
```

--------------------------------

### Render Nested Anonymous Component (Blade)

Source: https://laravel.com/docs/10.x/blade

Renders a nested anonymous Blade component. This example assumes the component is defined at 'resources/views/components/inputs/button.blade.php' and is rendered using dot notation.

```blade
<x-inputs.button/>
```

--------------------------------

### Specify Redis Queue and Emails Queue

Source: https://laravel.com/docs/10.x/queues

This command starts a queue worker specifically for the 'emails' queue on the 'redis' connection. It will only process jobs dispatched to this particular queue.

```shell
php artisan queue:work redis --queue=emails
```

--------------------------------

### Compile Application Assets

Source: https://laravel.com/docs/10.x/broadcasting

Compiles the application's front-end assets, including JavaScript files, after making changes to the Echo configuration or installing new packages. This command is typically used with build tools like Vite.

```shell
npm run build
```

--------------------------------

### Check if User is on Trial Period (PHP)

Source: https://laravel.com/docs/10.x/billing

Checks if a user's subscription is currently within its trial period. This can be useful for displaying trial-specific information or warnings to the user.

```PHP
if ($user->subscription('default')->onTrial()) {
    // ...
}
```

--------------------------------

### Type-Hint PSR-7 Request Interface in Routes/Controllers

Source: https://laravel.com/docs/10.x/requests

After installing the necessary packages, you can obtain a PSR-7 compatible request instance by type-hinting the `Psr\Http\Message\ServerRequestInterface` in your route closures or controller methods.

```php
use Psr\Http\Message\ServerRequestInterface;

Route::get('/', function (ServerRequestInterface $request) {
    // Access PSR-7 request here
});
```

--------------------------------

### Check Token Abilities with tokenCan Method

Source: https://laravel.com/docs/10.x/sanctum

Illustrates how to check if an authenticated user's token possesses a specific ability using the `tokenCan` method. This is used to enforce granular permissions.

```php
if ($user->tokenCan('server:update')) {
    // ...
}
```

--------------------------------

### Render Blade Component in Laravel

Source: https://laravel.com/docs/10.x/blade

Illustrates how to render Blade components using custom HTML-like tags starting with `x-`. Nested components are rendered using dot notation for directories, corresponding to their file path.

```blade
<x-alert/>
<x-user-profile/>
<x-inputs.button/>
```

```blade
<x-package-alert/>
```

```blade
<x-nightshade::calendar />
<x-nightshade::color-picker />
```

--------------------------------

### Publish Package Public Assets

Source: https://laravel.com/docs/10.x/packages

Explains how to make package assets like JavaScript, CSS, and images available to the application's public directory using the service provider's `publishes` method. It also demonstrates adding a tag for easy group publishing.

```php
/**
 * Bootstrap any package services.
 */
public function boot(): void
{
    $this->publishes([
        __DIR__.'/../public' => public_path('vendor/courier'),
    ], 'public');
}
```

--------------------------------

### Configure PostCSS with Tailwind and Autoprefixer for Vite

Source: https://laravel.com/docs/10.x/vite

Sets up a postcss.config.js file to automatically apply PostCSS plugins like Tailwind CSS and Autoprefixer when using Vite.

```js
export default {
    plugins: {
        tailwindcss: {},
        autoprefixer: {},
    },
};
```

--------------------------------

### Use Resource Collection with Preserved Keys in Laravel

Source: https://laravel.com/docs/10.x/eloquent-resources

Shows an example of returning a resource collection from a Laravel route while ensuring the original collection keys are preserved by using `preserveKeys = true` in the resource.

```php
use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/users', function () {
    return UserResource::collection(User::all()->keyBy->id);
});
```

--------------------------------

### Configure User Model with HasApiTokens Trait

Source: https://laravel.com/docs/10.x/passport

Applies the `HasApiTokens` trait to the User model to enable Passport's token and scope helper methods. This integrates Passport's functionality with your user authentication.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
}
```

--------------------------------

### Publish MCP Views for Passport Authorization

Source: https://laravel.com/docs/10.x/mcp

This command publishes the specific Passport authorization view provided by the MCP package. Ensure you have run Passport's initial installation steps before executing this.

```shell
php artisan vendor:publish --tag=mcp-views
```

--------------------------------

### Add Additional Services to Sail (Artisan)

Source: https://laravel.com/docs/10.x/sail

Adds new services to an existing Laravel Sail installation. This command helps in extending the development environment by incorporating additional Docker services as needed.

```shell
php artisan sail:add
```

--------------------------------

### Remove registerPolicies Call in AuthServiceProvider

Source: https://laravel.com/docs/10.x/upgrade

This PHP code illustrates the removal of the `registerPolicies` method call from the `boot` method in `AuthServiceProvider`, as it's now automatically handled by the framework.

```php
// Remove this line from the boot method:
// $this->registerPolicies();
```

--------------------------------

### Get File MIME Type (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Determines the MIME type of a given file via the Storage facade. The file path is required as input.

```php
use Illuminate\Support\Facades\Storage;

$mime = Storage::mimeType('file.jpg');
```

--------------------------------

### Pretend Laravel Migration Execution (Shell)

Source: https://laravel.com/docs/10.x/migrations

This shell command simulates the execution of migrations without actually running them. It outputs the SQL statements that would be executed, allowing you to review changes before applying them to the database.

```shell
php artisan migrate --pretend

```

--------------------------------

### Implement Stripe Checkout for Single Products

Source: https://laravel.com/docs/10.x/billing

Facilitates selling non-recurring products by redirecting users to Stripe Checkout. It uses the `checkout` method to handle the payment process, customer creation if necessary, and redirects to success or cancel URLs. Requires pre-defined Stripe products and webhook handling.

```php
use Illuminate\Http\Request;

Route::get('/checkout', function (Request $request) {
    $stripePriceId = 'price_deluxe_album';

    $quantity = 1;

    return $request->user()->checkout([$stripePriceId => $quantity], [
        'success_url' => route('checkout-success'),
        'cancel_url' => route('checkout-cancel'),
    ]);
})->name('checkout');

Route::view('checkout.success')->name('checkout-success');
Route::view('checkout.cancel')->name('checkout-cancel');
```

--------------------------------

### Get Primary Keys of Models in Laravel Collection

Source: https://laravel.com/docs/10.x/eloquent-collections

The `modelKeys` method returns an array containing the primary keys of all models present in the collection.

```php
$users->modelKeys();

// [1, 2, 3, 4, 5]
```

--------------------------------

### Retrieve Access Token

Source: https://laravel.com/docs/10.x/passport

This endpoint is used to retrieve an access token using the client credentials grant type. You need to provide your client ID, client secret, and the desired scope.

```APIDOC
## POST /oauth/token

### Description
Retrieves an access token using the client credentials grant type.

### Method
POST

### Endpoint
/oauth/token

### Parameters
#### Query Parameters
- **grant_type** (string) - Required - The grant type, which must be 'client_credentials'.
- **client_id** (string) - Required - Your application's client ID.
- **client_secret** (string) - Required - Your application's client secret.
- **scope** (string) - Optional - The scope to request for the token.

### Request Example
```json
{
    "grant_type": "client_credentials",
    "client_id": "client-id",
    "client_secret": "client-secret",
    "scope": "your-scope"
}
```

### Response
#### Success Response (200)
- **access_token** (string) - The generated access token.
- **token_type** (string) - The type of token, usually 'Bearer'.
- **expires_in** (integer) - The token's expiration time in seconds.

#### Response Example
```json
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...",
    "token_type": "Bearer",
    "expires_in": 31536000
}
```
```

--------------------------------

### Add Subscription to Existing Customer

Source: https://laravel.com/docs/10.x/billing

Add a new subscription to a customer who already has a default payment method using the `add` method on the subscription builder. This requires the user model and subscription details.

```php
use App\Models\User;

$user = User::find(1);

$user->newSubscription('default', 'price_monthly')->add();
```

--------------------------------

### Making Various HTTP Requests in PHP

Source: https://laravel.com/docs/10.x/http-tests

Illustrates how to simulate different HTTP requests like GET, POST, PUT, PATCH, and DELETE within Laravel tests. These methods return a TestResponse object for further assertions.

```php
<?php

namespace Tests\Feature;

use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_a_basic_request(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
```

--------------------------------

### Make RoadRunner Binary Executable and Build Sail Images

Source: https://laravel.com/docs/10.x/octane

These shell commands are used to make the downloaded RoadRunner binary executable and then rebuild the Laravel Sail Docker images to apply the changes.

```shell
chmod +x ./rr

./vendor/bin/sail build --no-cache
```

--------------------------------

### Update Composer Dependencies for Laravel 10

Source: https://laravel.com/docs/10.x/upgrade

This snippet shows the necessary updates to composer.json for migrating to Laravel 10. It includes core framework packages and optional packages like Passport and Sanctum.

```json
{
    "require": {
        "laravel/framework": "^10.0",
        "laravel/sanctum": "^3.2",
        "doctrine/dbal": "^3.0",
        "spatie/laravel-ignition": "^2.0",
        "laravel/passport": "^11.0",
        "laravel/ui": "^4.0"
    }
}
```

--------------------------------

### Throwing HTTP Client Exceptions in Laravel

Source: https://laravel.com/docs/10.x/http-client

Demonstrates how to throw exceptions for client or server errors using `throw`, `throwIf`, `throwUnless`, `throwIfStatus`, and `throwUnlessStatus` methods. It also shows how to customize exception handling with closures and access the response within the exception.  This is specific to Laravel's HTTP client.

```php
use Illuminate\Http\Client\Response;
use Illuminate\Http\Client\RequestException;

$response = Http::post(/* ... */);

// Throw an exception if a client or server error occurred...
$response->throw();

// Throw an exception if an error occurred and the given condition is true...
$response->throwIf($condition);

// Throw an exception if an error occurred and the given closure resolves to true...
$response->throwIf(fn (Response $response) => true);

// Throw an exception if an error occurred and the given condition is false...
$response->throwUnless($condition);

// Throw an exception if an error occurred and the given closure resolves to false...
$response->throwUnless(fn (Response $response) => false);

// Throw an exception if the response has a specific status code...
$response->throwIfStatus(403);

// Throw an exception unless the response has a specific status code...
$response->throwUnlessStatus(200);

return $response['user']['id'];

// Chaining operations after throwing
return Http::post(/* ... */)->throw()->json();

// Custom logic before throwing
return Http::post(/* ... */)->throw(function (Response $response, RequestException $e) {
    // ...
})->json();
```

--------------------------------

### Compile JavaScript and CSS with Laravel Mix

Source: https://laravel.com/docs/10.x/mix

This snippet demonstrates the basic usage of Laravel Mix to compile JavaScript and CSS files. It takes the source files from 'resources/js' and 'resources/css' and outputs them to 'public/js' and 'public/css' respectively. This requires Laravel Mix and webpack to be installed and configured.

```javascript
mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css');
```

--------------------------------

### Handle Process Signals in Artisan Commands (PHP)

Source: https://laravel.com/docs/10.x/artisan

Shows how to use the `trap` method to listen for and respond to operating system signals within Artisan commands. It supports trapping single or multiple signals and executing a callback function when a signal is received.

```php
/**
 * Execute the console command.
 */
public function handle(): void
{
    $this->trap(SIGTERM, fn () => $this->shouldKeepRunning = false);

    while ($this->shouldKeepRunning) {
        // ...
    }
}

$this->trap([SIGTERM, SIGQUIT], function (int $signal) {
    $this->shouldKeepRunning = false;

    dump($signal); // SIGTERM / SIGQUIT
});
```

--------------------------------

### Reference Versioned Assets in Blade

Source: https://laravel.com/docs/10.x/vite

After Vite has processed your static assets, use the Vite::asset method in your Blade templates to get the versioned URL for a given asset.

```blade
<img src="{{ Vite::asset('resources/images/logo.png') }}">
```

--------------------------------

### Issue Personal Access Token with Scopes (PHP)

Source: https://laravel.com/docs/10.x/passport

Demonstrates how to create a personal access token for a user and assign specific scopes to it using the `createToken` method on the User model. The scopes are passed as an array to the method.

```php
$token = $user->createToken('My Token', ['place-orders'])->accessToken;
```

--------------------------------

### Count Items in Collection (PHP)

Source: https://laravel.com/docs/10.x/collections

The `count` method provides the total number of items present in a collection. It's a straightforward way to get the size of the collection.

```php
$collection = collect([1, 2, 3, 4]);

$collection->count();

// 4
```

--------------------------------

### Provide Input to a Process (PHP)

Source: https://laravel.com/docs/10.x/processes

Sends data to the standard input of an external process. The `input` method is used to pipe string content to the process, which is useful for commands that expect interactive input, like `cat`.

```php
$result = Process::input('Hello World')->run('cat');
```

--------------------------------

### Protect All Incoming Requests with Sanctum Guard (Laravel)

Source: https://laravel.com/docs/10.x/sanctum

Apply the 'auth:sanctum' middleware to routes in `routes/web.php` and `routes/api.php` to ensure all requests are authenticated. Sanctum handles both cookie-based sessions and API token authentication.

```php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
```

--------------------------------

### Policy Method with Additional Context in PHP

Source: https://laravel.com/docs/10.x/authorization

Example of a PHP policy method (`PostPolicy`) that accepts additional context parameters (e.g., `$category`) to make authorization decisions beyond the user and model.

```php
/**
 * Determine if the given post can be updated by the user.
 */
public function update(User $user, Post $post, int $category): bool
{
    return $user->id === $post->user_id &&
           $user->canUpdateCategory($category);
}
```

--------------------------------

### Autoload Package Components by Namespace in Laravel

Source: https://laravel.com/docs/10.x/blade

Shows how to use `Blade::componentNamespace` to automatically discover and register component classes from a package based on a given namespace and a prefix. This simplifies the usage of package components.

```php
use Illuminate\Support\Facades\Blade;

/**
 * Bootstrap your package's services.
 */
public function boot(): void
{
    Blade::componentNamespace('Nightshade\Views\Components', 'nightshade');
}
```

--------------------------------

### Generate HTTP Exceptions with abort() Helper (PHP)

Source: https://laravel.com/docs/10.x/errors

Demonstrates how to generate HTTP error responses from anywhere in the application using the `abort` helper function. For example, `abort(404)` generates a 'page not found' error.

```PHP
abort(404);
```

--------------------------------

### Configure Sanctum Middleware for SPAs

Source: https://laravel.com/docs/10.x/sanctum

Adds Sanctum's `EnsureFrontendRequestsAreStateful` middleware to the `api` middleware group in `app/Http/Kernel.php`. This is crucial for authenticating Single Page Applications (SPAs) with Sanctum.

```php
'api' => [
    \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
],
```

--------------------------------

### Get Recursive Class Traits with class_uses_recursive() in PHP

Source: https://laravel.com/docs/10.x/helpers

The class_uses_recursive function returns all traits used by a class, including those inherited from parent classes.

```PHP
$traits = class_uses_recursive(App\Models\User::class);
```

--------------------------------

### Configure API Token Default Expiration (PHP)

Source: https://laravel.com/docs/10.x/sanctum

Sets a default expiration time for all API tokens generated by Sanctum in minutes. This is configured in the 'sanctum' configuration file.

```php
'expiration' => 525600
```

--------------------------------

### Configure Axios for SPA Authentication (JavaScript)

Source: https://laravel.com/docs/10.x/sanctum

Sets global Axios defaults to enable credential handling and CSRF token inclusion for SPA authentication with Laravel Sanctum. This is typically done in `resources/js/bootstrap.js`.

```javascript
axios.defaults.withCredentials = true;axios.defaults.withXSRFToken = true;
```

--------------------------------

### Envoy @finished Hook Example

Source: https://laravel.com/docs/10.x/envoy

Illustrates the `@finished` hook in Envoy, which runs locally after all tasks have completed, regardless of their success or failure. It receives the exit code of the last task.

```blade
@finished
    if ($exitCode > 0) {
        // There were errors in one of the tasks...
    }
@endfinished
```

--------------------------------

### End Subscription Trial Immediately (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Immediately ends the trial period for a user's default subscription. This will cause the subscription to become active and billing to commence if a payment method is on file.

```php
$user->subscription('default')->endTrial();
```

--------------------------------

### Verify Password Hash in Laravel

Source: https://laravel.com/docs/10.x/hashing

Provides an example of using the `check` method from Laravel's Hash facade to compare a plain-text password against a stored hash. It returns a boolean indicating if they match.

```php
if (Hash::check('plain-text', $hashedPassword)) {
    // The passwords match...
}
```

--------------------------------

### Get Default Redis Connection in Laravel

Source: https://laravel.com/docs/10.x/redis

Retrieves the default Redis connection instance as defined in the application's configuration. Useful when only one Redis connection is being used.

```php
use Illuminate\Support\Facades\Redis;

$redis = Redis::connection();
```

--------------------------------

### Access Multiple Cache Stores - PHP

Source: https://laravel.com/docs/10.x/cache

Shows how to access different cache stores configured in Laravel's application using the `store` method of the Cache facade. This allows switching between file, Redis, or other configured cache backends.

```php
$value = Cache::store('file')->get('foo');

Cache::store('redis')->put('bar', 'baz', 600); // 10 Minutes
```

--------------------------------

### Import CSS via JavaScript in Laravel Vite

Source: https://laravel.com/docs/10.x/vite

Demonstrates how to import CSS files directly within a JavaScript file, typically `app.js`, when Vite is configured for an SPA setup in Laravel.

```javascript
import './bootstrap';
import '../css/app.css'; // [tl! add]
```

--------------------------------

### Rate Limiter Attempt with Custom Decay Rate

Source: https://laravel.com/docs/10.x/rate-limiting

Extend the `attempt` method by providing a fourth argument for the decay rate (seconds until reset). This example allows five attempts every two minutes.

```PHP
use Illuminate\Support\Facades\RateLimiter;

$executed = RateLimiter::attempt(
    'send-message:'.$user->id,
    $perTwoMinutes = 5,
    function() {
        // Send message...
    },
    $decayRate = 120,
);
```

--------------------------------

### Configure Public Network Interface with Bridge (YAML)

Source: https://laravel.com/docs/10.x/homestead

Configures a public network interface for your Homestead VM, allowing it to be accessible on your local network like any other device. The 'bridge' option specifies the host network interface to use.

```yaml
networks:
    - type: "public_network"
      ip: "192.168.10.20"
      bridge: "en1: Wi-Fi (AirPort)"
```

--------------------------------

### Release Overlapping Jobs After a Delay (PHP)

Source: https://laravel.com/docs/10.x/queues

This example shows how to configure the `WithoutOverlapping` middleware to release an overlapping job after a specified number of seconds. The job will be retried after the release period.

```php
/**
 * Get the middleware the job should pass through.
 *
 * @return array<int, object>
 */
public function middleware(): array
{
    return [(new WithoutOverlapping($this->order->id))->releaseAfter(60)];
}
```

--------------------------------

### Apply Billable Trait to User Model

Source: https://laravel.com/docs/10.x/billing

Applies the `Billable` trait to the User model to enable subscription and payment functionalities. This trait provides essential methods for managing billing tasks.

```php
use Laravel\Cashier\Billable;

class User extends Authenticatable
{
    use Billable;
}
```

--------------------------------

### Specify Custom Filename for Invoice PDF Download

Source: https://laravel.com/docs/10.x/billing

Sets a custom filename for the downloaded invoice PDF by providing a string as the third argument to the `downloadInvoice` method. The `.pdf` extension is automatically appended.

```php
return $request->user()->downloadInvoice($invoiceId, [], 'my-invoice');
```

--------------------------------

### Configure Docker Compose for FrankenPHP with Sail (Basic)

Source: https://laravel.com/docs/10.x/octane

Configures the `docker-compose.yml` file for Laravel Sail to use FrankenPHP with Octane. It sets the `SUPERVISOR_PHP_COMMAND` environment variable to direct Sail to start Octane using FrankenPHP. This is for basic HTTP serving.

```yaml
services:
  laravel.test:
    environment:
      SUPERVISOR_PHP_COMMAND: "/usr/bin/php -d variables_order=EGPCS /var/www/html/artisan octane:start --server=frankenphp --host=0.0.0.0 --admin-port=2019 --port=80" # [tl! add]
      XDG_CONFIG_HOME:  /var/www/html/config # [tl! add]
      XDG_DATA_HOME:  /var/www/html/data # [tl! add]
```

--------------------------------

### Create Post Controller with Create and Store Methods in Laravel

Source: https://laravel.com/docs/10.x/validation

A basic Laravel controller with `create` and `store` methods. The `create` method renders a view for the post creation form, while the `store` method is intended for validating and saving the blog post data.

```PHP
<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PostController extends Controller
{
    /**
     * Show the form to create a new blog post.
     */
    public function create(): View
    {
        return view('post.create');
    }

    /**
     * Store a new blog post.
     */
    public function store(Request $request): RedirectResponse
    {
        // Validate and store the blog post...

        $post = /** ... */;

        return to_route('post.show', ['post' => $post->id]);
    }
}
```

--------------------------------

### Start Octane with Custom Worker and Task Worker Counts (Swoole)

Source: https://laravel.com/docs/10.x/octane

For Swoole users, this command allows specifying both application request workers and dedicated task workers. Task workers are used for background processing.

```shell
php artisan octane:start --workers=4 --task-workers=6
```

--------------------------------

### Create Paddle Customer Without Subscription in Laravel

Source: https://laravel.com/docs/10.x/cashier-paddle

Create a new customer in Paddle without immediately starting a subscription using the `createAsCustomer` method on the billable model. This returns a `LaravelPaddleCustomer` instance and can accept additional Paddle API parameters.

```php
$customer = $user->createAsCustomer();
```

```php
$customer = $user->createAsCustomer($options);
```

--------------------------------

### Check if Subscription has Ended (PHP)

Source: https://laravel.com/docs/10.x/billing

Determines if a user's subscription has been canceled and is no longer within the grace period. This indicates that the subscription has fully expired.

```PHP
if ($user->subscription('default')->ended()) {
    // ...
}
```

--------------------------------

### API Call with Fetch (JavaScript)

Source: https://laravel.com/docs/10.x/mcp

This JavaScript snippet demonstrates how to make an API call using the `fetch` API to retrieve product data. It includes basic error handling and JSON parsing. This is commonly used in front-end applications to interact with a backend API.

```JavaScript
async function getProducts(apiUrl) {
  try {
    const response = await fetch(apiUrl, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        // Add any other necessary headers, like authorization tokens
        // 'Authorization': 'Bearer YOUR_API_TOKEN'
      }
    });

    if (!response.ok) {
      // Handle HTTP errors
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    console.log('Products fetched successfully:', data);
    return data;

  } catch (error) {
    console.error('Error fetching products:', error);
    // Handle network errors or other exceptions
    return null; // Or return an empty array, or re-throw the error
  }
}

// Example usage:
// const productsApiUrl = '/api/products';
// getProducts(productsApiUrl).then(products => {
//   if (products) {
//     // Process the products data here
//     console.log(products);
//   }
// });

```

--------------------------------

### Find Stripe Promotion Code ID

Source: https://laravel.com/docs/10.x/billing

Retrieve a promotion code's Stripe API ID using the `findPromotionCode` or `findActivePromotionCode` methods. These methods accept the customer-facing promotion code.

```php
// Find a promotion code ID by its customer facing code...
$promotionCode = $user->findPromotionCode('SUMMERSALE');

// Find an active promotion code ID by its customer facing code...
$promotionCode = $user->findActivePromotionCode('SUMMERSALE');
```

--------------------------------

### Specify Redis Queue Connection

Source: https://laravel.com/docs/10.x/queues

This command starts a queue worker that utilizes the 'redis' queue connection defined in your application's configuration. It will process jobs from the default queue for that connection.

```shell
php artisan queue:work redis
```

--------------------------------

### Create Stringable Instance using str()

Source: https://laravel.com/docs/10.x/strings

The str() function returns a new Illuminate\Support\Stringable instance for a given string. It is equivalent to the Str::of method. If no argument is provided, it returns an instance of Illuminate\Support\Str.

```php
$string = str('Taylor')->append(' Otwell');

// 'Taylor Otwell'
```

```php
$snake = str()->snake('FooBar');

// 'foo_bar'
```

--------------------------------

### Authorize Private Channel Access

Source: https://laravel.com/docs/10.x/broadcasting

Define channel authorization rules in `routes/channels.php`. This example authorizes users to listen on a private channel named `orders.{orderId}` only if they are the creator of the order.

```php
use App\Models\Order;
use App\Models\User;

Broadcast::channel('orders.{orderId}', function (User $user, int $orderId) {
    return $user->id === Order::findOrNew($orderId)->user_id;
});
```

--------------------------------

### Create Subscription with Custom Invoice Due Date

Source: https://laravel.com/docs/10.x/billing

This code demonstrates creating a subscription and setting a custom number of days until the invoice is due. The `days_until_due` option can be passed as an array to the `createAndSendInvoice` method. This allows for flexible payment terms.

```php
$user->newSubscription('default', 'price_monthly')->createAndSendInvoice([], [
    'days_until_due' => 30
]);
```

--------------------------------

### Supervisor Process Manager Configuration for File Descriptors

Source: https://laravel.com/docs/10.x/reverb

This configuration for the Supervisor process manager increases the minimum number of file descriptors (`minfds`) that Supervisor can open. This is necessary to handle a large number of connections for services like Reverb.

```ini
[supervisord]
...
minfds=10000
```

--------------------------------

### Display Password Reset Form (PHP)

Source: https://laravel.com/docs/10.x/passwords

Defines a GET route to display the password reset form. It receives a 'token' parameter, which is passed to the view for form submission.

```php
Route::get('/reset-password/{token}', function (string $token) {
    return view('auth.reset-password', ['token' => $token]);
})->middleware('guest')->name('password.reset');
```

--------------------------------

### Get Collection Keys in PHP

Source: https://laravel.com/docs/10.x/collections

The `keys` method returns an array containing all of the keys from the collection. It does not modify the original collection. It requires the collection to have keys associated with its values.

```php
$collection = collect([
    'prod-100' => ['product_id' => 'prod-100', 'name' => 'Desk'],
    'prod-200' => ['product_id' => 'prod-200', 'name' => 'Chair'],
]);

$keys = $collection->keys();

$keys->all();

// ['prod-100', 'prod-200']
```

--------------------------------

### Control Proration for Subscription Price Adjustments

Source: https://laravel.com/docs/10.x/billing

By default, Stripe prorates charges when adding or removing prices. The `noProrate` method can be chained to prevent proration for price adjustments.

```php
$user->subscription('default')->noProrate()->removePrice('price_chat');
```

--------------------------------

### Configure Trusted Proxies Middleware - PHP

Source: https://laravel.com/docs/10.x/requests

Provides an example of configuring the `App\Http\Middleware\TrustProxies` middleware to specify trusted proxies and headers. This is essential for applications behind load balancers to correctly generate HTTPS links.

```php
<?php

namespace App\Http\Middleware;

use Illuminate\Http\Middleware\TrustProxies as Middleware;
use Illuminate\Http\Request;

class TrustProxies extends Middleware
{
    /**
     * The trusted proxies for this application.
     *
     * @var string|array
     */
    protected $proxies = [
        '192.168.1.1',
        '192.168.1.2',
    ];

    /**
     * The headers that should be used to detect proxies.
     *
     * @var int
     */
    protected $headers = Request::HEADER_X_FORWARDED_FOR | Request::HEADER_X_FORWARDED_HOST | Request::HEADER_X_FORWARDED_PORT | Request::HEADER_X_FORWARDED_PROTO;
}
```

--------------------------------

### Manually Configure ChromeDriver Port in Dusk

Source: https://laravel.com/docs/10.x/dusk

Modifies the `driver` method in `tests/DuskTestCase.php` to connect to a manually started ChromeDriver instance on a non-default port. This is necessary if ChromeDriver is not running on port 9515.

```php
use Facebook\WebDriver\Remote\RemoteWebDriver;

/**
 * Create the RemoteWebDriver instance.
 */
protected function driver(): RemoteWebDriver
{
    return RemoteWebDriver::create(
        'http://localhost:9515',
        DesiredCapabilities::chrome()
    );
}
```

--------------------------------

### Register MCP Prompts in Laravel Server (PHP)

Source: https://laravel.com/docs/10.x/mcp

This code shows how to register a custom prompt, `DescribeWeatherPrompt`, within a Laravel MCP server. The `$prompts` property in the `WeatherServer` class is an array where you list the fully qualified class names of your prompts. This makes the prompt available for AI clients to use.

```php
<?php

namespace App\Mcp\Servers;

use App\Mcp\Prompts\DescribeWeatherPrompt;
use Laravel\Mcp\Server;

class WeatherServer extends Server
{
    /**
     * The prompts registered with this MCP server.
     *
     * @var array<int, class-string<\Laravel\Mcp\Server\Prompt>>
     */
    protected array $prompts = [
        DescribeWeatherPrompt::class,
    ];
}

```

--------------------------------

### Determine Time Until Rate Limiter Availability

Source: https://laravel.com/docs/10.x/rate-limiting

Check if a key has exceeded attempts using `tooManyAttempts`, then use `availableIn` to get the number of seconds until attempts reset. Requires `Illuminate\Support\Facades\RateLimiter`.

```PHP
use Illuminate\Support\Facades\RateLimiter;

if (RateLimiter::tooManyAttempts('send-message:'.$user->id, $perMinute = 5)) {
    $seconds = RateLimiter::availableIn('send-message:'.$user->id);

    return 'You may try again in '.$seconds.' seconds.';
}

RateLimiter::increment('send-message:'.$user->id);

// Send message...
```

--------------------------------

### Send Mail via a Specific Mailer Configuration

Source: https://laravel.com/docs/10.x/mail

This PHP example demonstrates sending an email using a specific mailer defined in the application's configuration, rather than the default one. It uses the `mailer` method on the Mail facade, followed by the usual `to` and `send` methods.

```php
Mail::mailer('postmark')
        ->to($request->user())
        ->send(new OrderShipped($order));
```

--------------------------------

### Laravel Stripe Checkout with Custom URLs

Source: https://laravel.com/docs/10.x/billing

Initiates a Stripe Checkout session for an existing product and allows customization of the success and cancel URLs. These URLs define where the user is redirected after completing or canceling the purchase.

```PHP
use Illuminate\Http\Request;

Route::get('/product-checkout', function (Request $request) {
    return $request->user()->checkout(['price_tshirt' => 1], [
        'success_url' => route('your-success-route'),
        'cancel_url' => route('your-cancel-route'),
    ]);
});
```

--------------------------------

### Extend Subscription Trial (PHP)

Source: https://laravel.com/docs/10.x/billing

This demonstrates how to extend the trial period of an existing subscription using the `extendTrial` method. It can be used even if the trial has expired, with the extended time deducted from the next invoice.

```PHP
use App\Models\User;

$subscription = User::find(1)->subscription('default');

// End the trial 7 days from now...
$subscription->extendTrial(
    now()->addDays(7)
);

// Add an additional 5 days to the trial...
$subscription->extendTrial(
    $subscription->trial_ends_at->addDays(5)
);
```

--------------------------------

### Configure Inertia Page Component Resolution with Vite

Source: https://laravel.com/docs/10.x/vite

Provides an example of using the resolvePageComponent function from laravel-vite-plugin to resolve Inertia page components. This helper can be used with Vue 3, React, and other frameworks.

```js
import { createApp, h } from 'vue';
import { createInertiaApp } from '@inertiajs/vue3';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';

createInertiaApp({
  resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
  setup({ el, App, props, plugin }) {
    return createApp({ render: () => h(App, props) })
      .use(plugin)
      .mount(el)
  },
});
```

--------------------------------

### Protect Route with At Least One Token Ability (Laravel)

Source: https://laravel.com/docs/10.x/sanctum

Employ the 'ability' middleware to grant access to a route if the authenticated token has at least one of the listed abilities. This is suitable for scenarios where any one of several permissions is sufficient.

```php
use Illuminate\Support\Facades\Route;

Route::get('/orders', function () {
    // Token has the "check-status" or "place-orders" ability...
})->middleware(['auth:sanctum', 'ability:check-status,place-orders']);
```

--------------------------------

### Configure Telescope Watchers (PHP Array)

Source: https://laravel.com/docs/10.x/telescope

This snippet shows how to configure the enabled watchers and their specific options within the `config/telescope.php` configuration file. It illustrates enabling multiple watchers and providing custom configurations for `QueryWatcher` and `CommandWatcher`.

```php
'watchers' => [
    Watchers\CacheWatcher::class => true,
    Watchers\CommandWatcher::class => true,
    ...
],

'watchers' => [
    Watchers\QueryWatcher::class => [
        'enabled' => env('TELESCOPE_QUERY_WATCHER', true),
        'slow' => 100,
    ],
    ...
],

'watchers' => [
    Watchers\CommandWatcher::class => [
        'enabled' => env('TELESCOPE_COMMAND_WATCHER', true),
        'ignore' => ['key:generate'],
    ],
    ...
]
```

--------------------------------

### Get Remaining Attempts and Increment

Source: https://laravel.com/docs/10.x/rate-limiting

Retrieve the number of remaining attempts for a key using `remaining`. If attempts are available, increment the count using `increment`. Requires `Illuminate\Support\Facades\RateLimiter`.

```PHP
use Illuminate\Support\Facades\RateLimiter;

if (RateLimiter::remaining('send-message:'.$user->id, $perMinute = 5)) {
    RateLimiter::increment('send-message:'.$user->id);

    // Send message...
}
```

--------------------------------

### Defining Token Scopes in AuthServiceProvider (PHP)

Source: https://laravel.com/docs/10.x/passport

Shows how to define API token scopes using the `Passport::tokensCan` method within the `boot` method of the `AppProvidersAuthServiceProvider` class. This allows clients to request specific permissions when authorizing access.

```php
use Laravel\Passport\Passport;

/**
 * Register any authentication / authorization services.
 */
public function boot(): void
{
    Passport::tokensCan([
        'place-orders' => 'Place orders',
        'check-status' => 'Check order status',
    ]);
}
```

--------------------------------

### Faking Processes for Testing in PHP

Source: https://laravel.com/docs/10.x/processes

Introduces how to use the `Process::fake` method to instruct Laravel to return stubbed or dummy results when process commands are invoked during testing. This allows for isolated and predictable testing of code that interacts with external processes.

```php
Process::fake();
```

--------------------------------

### Stripe Elements Integration for Payment Forms

Source: https://laravel.com/docs/10.x/billing

Integrates Stripe Elements into an HTML form to securely collect credit card details. This involves including the Stripe.js library, initializing Stripe, creating a card element, and mounting it to a designated DOM element.

```html
<script src="https://js.stripe.com/v3/"></script>

<script>
    const stripe = Stripe('stripe-public-key');

    const elements = stripe.elements();
    const cardElement = elements.create('card');

    cardElement.mount('#card-element');
</script>
```

--------------------------------

### Generate Laravel Dusk Component

Source: https://laravel.com/docs/10.x/dusk

This command generates a new Dusk component. Components help encapsulate reusable browser automation logic, reducing redundancy in tests. The generated component will be placed in the `tests/Browser/Components` directory.

```bash
php artisan dusk:component DatePicker
```

--------------------------------

### Configure Passport Scope Middleware (PHP)

Source: https://laravel.com/docs/10.x/passport

Shows how to register Passport's scope checking middleware within the `$middlewareAliases` property of your `app/Http/Kernel.php` file. This makes the middleware available for use on routes.

```php
'scopes' => \Laravel\Passport\Http\Middleware\CheckScopes::class,
    'scope' => \Laravel\Passport\Http\Middleware\CheckForAnyScope::class,
```

--------------------------------

### Retrieve Request Method in Laravel

Source: https://laravel.com/docs/10.x/requests

Get the HTTP verb of the request using the `method` method. Verify the method using `isMethod` to check against specific verbs like 'post'.

```php
$method = $request->method();

if ($request->isMethod('post')) {
    // ...
}
```

--------------------------------

### Append Task Output to File in Laravel

Source: https://laravel.com/docs/10.x/scheduling

This example demonstrates how to append the output of a scheduled command to a file instead of overwriting it. The `appendOutputTo` method is used for this purpose, allowing you to accumulate logs from recurring tasks.

```php
$schedule->command('emails:send')
         ->daily()
         ->appendOutputTo($filePath);
```

--------------------------------

### Create Subscription and Send Invoice

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to create a subscription and instruct Stripe to email an invoice to the customer for payment. It uses the `createAndSendInvoice` method. The customer will have a set period to pay the invoice before the subscription is canceled. Requires a billable model instance and a Stripe price ID.

```php
$user->newSubscription('default', 'price_monthly')->createAndSendInvoice();
```

--------------------------------

### Get All Items from a Laravel Collection

Source: https://laravel.com/docs/10.x/collections

The `all` method returns the underlying array representation of a Laravel collection. It takes no arguments and returns a PHP array containing all items within the collection.

```php
collect([1, 2, 3])->all();

// [1, 2, 3]
```

--------------------------------

### Use Dusk Selectors for Element Interaction

Source: https://laravel.com/docs/10.x/dusk

This example illustrates using Dusk's custom `@` selector syntax for more robust element interaction. By adding a `dusk` attribute to HTML elements, tests can target them reliably. The `selectorHtmlAttribute` method allows customization of the attribute used for Dusk selectors.

```php
// Test...
$browser->click('@login-button');

// Configuration in AppServiceProvider
use Laravel\Dusk\Dusk;
Dusk::selectorHtmlAttribute('data-dusk');
```

--------------------------------

### Basic Redis Configuration - Laravel

Source: https://laravel.com/docs/10.x/redis

Defines the default and cache Redis server configurations in Laravel's `config/database.php`. It includes parameters like host, password, port, and database, utilizing environment variables for flexibility.

```php
'redis' => [

    'client' => env('REDIS_CLIENT', 'phpredis'),

    'default' => [
        'host' => env('REDIS_HOST', '127.0.0.1'),
        'password' => env('REDIS_PASSWORD'),
        'port' => env('REDIS_PORT', 6379),
        'database' => env('REDIS_DB', 0),
    ],

    'cache' => [
        'host' => env('REDIS_HOST', '127.0.0.1'),
        'password' => env('REDIS_PASSWORD'),
        'port' => env('REDIS_PORT', 6379),
        'database' => env('REDIS_CACHE_DB', 1),
    ],

]
```

--------------------------------

### Inject Container Instance (PHP)

Source: https://laravel.com/docs/10.x/container

Shows how to get the Laravel container instance injected into a class. By type-hinting `Illuminate\Container\Container` in the constructor, the container itself becomes available for use within the class. This allows for programmatic interaction with the container.

```php
use Illuminate\Container\Container;

/**
 * Create a new class instance.
 */
public function __construct(
    protected Container $container
) {}

```

--------------------------------

### Get String Length (Laravel)

Source: https://laravel.com/docs/10.x/strings

The `length` method returns the number of characters in a string. This is a fundamental string operation for various text processing tasks. Requires the `IlluminateSupportStr` facade.

```php
use Illuminate\Support\Str;

$length = Str::of('Laravel')->length();

// 7
```

--------------------------------

### Check if User is on Trial (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Checks if a user's default subscription is currently within its trial period. This can be checked either on the user instance or the subscription instance directly.

```php
if ($user->onTrial('default')) {
    // ...
}

if ($user->subscription('default')->onTrial()) {
    // ...
}
```

--------------------------------

### Use Custom Subscription Models in Cashier

Source: https://laravel.com/docs/10.x/billing

Allows Cashier to use custom models for subscriptions and subscription items by extending Cashier's default models and informing Cashier in `AppServiceProvider`. This provides flexibility in extending subscription functionality.

```php
use Laravel\Cashier\Subscription as CashierSubscription;

class Subscription extends CashierSubscription
{
    // ...
}

use App\Models\Cashier\Subscription;
use App\Models\Cashier\SubscriptionItem;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Cashier::useSubscriptionModel(Subscription::class);
    Cashier::useSubscriptionItemModel(SubscriptionItem::class);
}
```

--------------------------------

### Fluent JSON Testing with AssertableJson in Laravel

Source: https://laravel.com/docs/10.x/http-tests

This example demonstrates Laravel's fluent JSON testing capabilities using `AssertableJson`. It shows how to chain assertions like `where`, `whereNot`, `missing`, and `etc` to comprehensively test the structure and content of a JSON response. The `getJson` method is used for the initial request.

```php
use Illuminate\Testing\Fluent\AssertableJson;

/**
 * A basic functional test example.
 */
public function test_fluent_json(): void
{
    $response = $this->getJson('/users/1');

    $response
        ->assertJson(fn (AssertableJson $json) =>
            $json->where('id', 1)
                 ->where('name', 'Victoria Faith')
                 ->where('email', fn (string $email) => str($email)->is('victoria@gmail.com'))
                 ->whereNot('status', 'pending')
                 ->missing('password')
                 ->etc()
        );
}

```

--------------------------------

### Laravel Stripe Checkout with Quantity

Source: https://laravel.com/docs/10.x/billing

Performs a Stripe Checkout for an existing product, specifying the desired quantity. The quantity is passed as an associative array with the Price ID as the key. Users are redirected to Stripe's Checkout page.

```PHP
use Illuminate\Http\Request;

Route::get('/product-checkout', function (Request $request) {
    return $request->user()->checkout(['price_tshirt' => 15]);
});
```

--------------------------------

### Podcast Model Without Real-Time Facade

Source: https://laravel.com/docs/10.x/facades

This code snippet shows a typical Laravel Eloquent model ('Podcast') with a method ('publish') that requires an injected dependency ('Publisher'). This pattern allows for easy unit testing through mocking but necessitates passing the dependency explicitly on each method call.

```php
<?php

namespace App\Models;

use App\Contracts\Publisher;
use Illuminate\Database\Eloquent\Model;

class Podcast extends Model
{
    /**
     * Publish the podcast.
     */
    public function publish(Publisher $publisher): void
    {
        $this->update(['publishing' => now()]);

        $publisher->publish($this);
    }
}
```

--------------------------------

### Mock Console Command Input and Output (PHP)

Source: https://laravel.com/docs/10.x/console-tests

Tests a console command by mocking user input using expectsQuestion and asserting expected output using expectsOutput, doesntExpectOutput, expectsOutputToContain, and doesntExpectOutputToContain. It also verifies the command's exit code.

```php
<?php

namespace Tests\Feature;

use Tests\TestCase;

class ConsoleInputOutputTest extends TestCase
{
    /**
     * Test a console command with input and output expectations.
     */
    public function test_console_command(): void
    {
        $this->artisan('question')
             ->expectsQuestion('What is your name?', 'Taylor Otwell')
             ->expectsQuestion('Which language do you prefer?', 'PHP')
             ->expectsOutput('Your name is Taylor Otwell and you prefer PHP.')
             ->doesntExpectOutput('Your name is Taylor Otwell and you prefer Ruby.')
             ->expectsOutputToContain('Taylor Otwell')
             ->doesntExpectOutputToContain('you prefer Ruby')
             ->assertExitCode(0);
    }
}
```

--------------------------------

### Displaying Application Usage Card with Specific Types

Source: https://laravel.com/docs/10.x/pulse

This example shows how to use the `<livewire:pulse.usage />` Livewire component to display specific types of application usage metrics. By setting the `type` attribute, you can choose to view data for requests, slow requests, or jobs.

```blade
<livewire:pulse.usage type="requests" />
<livewire:pulse.usage type="slow_requests" />
<livewire:pulse.usage type="jobs" />
```

--------------------------------

### Handle Stripe Customer Billing Portal Session (Laravel Route)

Source: https://laravel.com/docs/10.x/billing

This Laravel route definition handles the request to initiate a Stripe Customer Billing Portal session. It uses the `redirectToBillingPortal` method on the authenticated user model and redirects the user back to the dashboard upon exiting the portal. Requires authentication.

```php
use Illuminate\Http\Request;

Route::get('/billing', function (Request $request) {
    return $request->user()->redirectToBillingPortal(route('dashboard'));
})->middleware(['auth'])->name('billing');
```

--------------------------------

### Define Global Route Parameter Constraints in Laravel

Source: https://laravel.com/docs/10.x/routing

Define global constraints for route parameters in the `boot` method of your `AppProvidersRouteServiceProvider`. Use the `Route::pattern` method to associate a regular expression with a parameter name. This pattern will then be automatically applied to all routes using that parameter name, ensuring consistent validation across your application.

```php
/**
 * Define your route model bindings, pattern filters, etc.
 */
public function boot(): void
{
    Route::pattern('id', '[0-9]+');
}
```

--------------------------------

### Redirect for PKCE Authorization (PHP)

Source: https://laravel.com/docs/10.x/passport

This PHP code generates the necessary session variables (state and code verifier), creates the code challenge, and then redirects the user to the Passport authorization endpoint with the required query parameters for the PKCE flow. It assumes usage within a Laravel route.

```php
use Illuminate\Http\Request;
use Illuminate\Support\Str;

Route::get('/redirect', function (Request $request) {
    $request->session()->put('state', $state = Str::random(40));

    $request->session()->put(
        'code_verifier',
        $code_verifier = Str::random(128)
    );

    $codeChallenge = strtr(rtrim(
        base64_encode(hash('sha256', $code_verifier, true))
    , '='), '+/', '-_');

    $query = http_build_query([
        'client_id' => 'client-id',
        'redirect_uri' => 'http://third-party-app.com/callback',
        'response_type' => 'code',
        'scope' => '',
        'state' => $state,
        'code_challenge' => $codeChallenge,
        'code_challenge_method' => 'S256',
        // 'prompt' => '', // "none", "consent", or "login"
    ]);

    return redirect('http://passport-app.test/oauth/authorize?'.$query);
});
```

--------------------------------

### Configure SQLite Database Connection

Source: https://laravel.com/docs/10.x/index

This snippet shows how to configure the `.env` file to use an SQLite database. It sets the database connection type to 'sqlite' and removes other database-related configurations. Laravel will automatically create the SQLite database file if it doesn't exist.

```dotenv
DB_CONNECTION=sqlite
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```

--------------------------------

### Retrieve Validated Data with `validated()` - PHP

Source: https://laravel.com/docs/10.x/validation

Retrieves an array of data that has been validated by a form request or validator instance. This is a direct way to get only the fields that passed validation.

```php
$validated = $request->validated();

$validated = $validator->validated();
```

--------------------------------

### Get Configuration Directory Path - PHP

Source: https://laravel.com/docs/10.x/helpers

Returns the fully qualified path to the application's `config` directory using the `config_path()` helper. Can also generate paths relative to the config directory.

```PHP
$path = config_path();

$path = config_path('app.php');
```

--------------------------------

### Generate an MCP Prompt using Artisan (Shell)

Source: https://laravel.com/docs/10.x/mcp

This shell command demonstrates how to use the `make:mcp-prompt` Artisan command provided by Laravel MCP to generate a new prompt class. Running this command scaffolds a new prompt file, typically in the `app/Mcp/Prompts` directory, ready for further customization.

```shell
php artisan make:mcp-prompt DescribeWeatherPrompt

```

--------------------------------

### Check Subscription to Specific Product (PHP)

Source: https://laravel.com/docs/10.x/billing

Verifies if a user is subscribed to a particular product identified by its Stripe product ID. It can check against a single product ID or an array of product IDs.

```PHP
if ($user->subscribedToProduct('prod_premium', 'default')) {
    // ...
}

if ($user->subscribedToProduct(['prod_basic', 'prod_premium'], 'default')) {
    // ...
}
```

--------------------------------

### Using a Specific Guard for Route Protection (PHP)

Source: https://laravel.com/docs/10.x/passport

Illustrates how to apply a specific authentication guard, like 'auth:api-customers', to a route. This ensures that incoming requests are authenticated using the defined 'api-customers' guard, which might be configured to use a different user provider than the default 'api' guard.

```php
Route::get('/customer', function () {
    // ...
})->middleware('auth:api-customers');
```

--------------------------------

### Create Password Grant Client (Artisan CLI)

Source: https://laravel.com/docs/10.x/passport

This command is used to create a client that can be used with the password grant type in Laravel Passport. It requires the 'passport:client' Artisan command with the '--password' option. This is a prerequisite for requesting password grant tokens.

```shell
php artisan passport:client --password
```

--------------------------------

### Registering Multiple Resource Controllers - Laravel

Source: https://laravel.com/docs/10.x/controllers

Illustrates registering multiple resource controllers simultaneously by passing an array of resource definitions to the `Route::resources` method.

```php
Route::resources([
    'photos' => PhotoController::class,
    'posts' => PostController::class,
]);
```

--------------------------------

### Create PKCE-Enabled Passport Client (Artisan)

Source: https://laravel.com/docs/10.x/passport

This Artisan command creates a new Passport client specifically for the PKCE flow. The `--public` option indicates that the client secret should not be used, making it suitable for public clients like SPAs and mobile apps.

```shell
php artisan passport:client --public
```

--------------------------------

### Configure Dusk Environment File

Source: https://laravel.com/docs/10.x/dusk

Explains how to create a Dusk-specific environment file (e.g., `.env.dusk.local`) to isolate test environment settings. Dusk will temporarily use this file during test execution, backing up and restoring the original `.env` file.

```plaintext
.env.dusk.{environment}
```

--------------------------------

### Enforce All Required Scopes on a Route (PHP)

Source: https://laravel.com/docs/10.x/passport

Illustrates how to apply the 'scopes' middleware to a route, requiring the authenticated user's access token to possess all the specified scopes ('check-status', 'place-orders') to access the route.

```php
Route::get('/orders', function () {
    // Access token has both "check-status" and "place-orders" scopes...
})->middleware(['auth:api', 'scopes:check-status,place-orders']);
```

--------------------------------

### Swap Subscription Prices in Laravel

Source: https://laravel.com/docs/10.x/billing

Allows swapping prices for a subscription with multiple products. The old price item is deleted, and the new one is created. Existing metadata on other prices is preserved when swapping a single price via the subscription item.

```php
use App\Models\User;

$user = User::find(1);

// Swap to a new price, preserving another add-on price
$user->subscription('default')->swap(['price_pro', 'price_chat']);

// Swap with specific options like quantity
$user->subscription('default')->swap([
    'price_pro' => ['quantity' => 5],
    'price_chat'
]);

// Swap a single price on a subscription item, preserving metadata
$user->subscription('default')
        ->findItemOrFail('price_basic')
        ->swap('price_pro');
```

--------------------------------

### Subscribe with Multiple Products (Laravel)

Source: https://laravel.com/docs/10.x/cashier-paddle

Allows a user to subscribe to multiple products simultaneously by passing an array of prices to the 'subscribe' method. Each price will be charged according to its billing interval. The default subscription is assumed if not specified.

```php
use Illuminate\Http\Request;

Route::post('/user/subscribe', function (Request $request) {
    $checkout = $request->user()->subscribe([
        'price_monthly',
        'price_chat',
    ]);

    return view('billing', ['checkout' => $checkout]);
});
```

--------------------------------

### Define Global Environment Variables in Homestead.yaml

Source: https://laravel.com/docs/10.x/homestead

This snippet illustrates how to set global environment variables in the Homestead.yaml file. It shows the 'variables' directive for defining key-value pairs that will be applied across the environment.

```yaml
variables:
    - key: APP_ENV
      value: local
    - key: FOO
      value: bar
```

--------------------------------

### Provide Payment Confirmation Options for SEPA

Source: https://laravel.com/docs/10.x/billing

Allows providing additional data required for confirming certain payment methods, such as SEPA. The `withPaymentConfirmationOptions` method is used to pass an array of options, like 'mandate_data', before performing actions such as swapping subscriptions. Consult Stripe API documentation for all available options.

```php
$subscription->withPaymentConfirmationOptions([
    'mandate_data' => '...',
])->swap('price_xxx');
```

--------------------------------

### Start Pulse Redis Worker

Source: https://laravel.com/docs/10.x/pulse

Launches the Pulse worker process that monitors the Redis stream and moves entries into Pulse's database tables. This command should be run as a long-lived background process, ideally managed by a process monitor like Supervisor.

```php
php artisan pulse:work
```

--------------------------------

### Freeze Time in Laravel Tests with Closures

Source: https://laravel.com/docs/10.x/mocking

Illustrates using `freezeTime` and `freezeSecond` to freeze time during the execution of a closure in Laravel tests. `freezeTime` freezes at the current moment, while `freezeSecond` freezes at the start of the current second.

```php
<?php

use Illuminate\Support\Carbon;

// Freeze time and resume normal time after executing closure...
$this->freezeTime(function (Carbon $time) {
    // ...
});

// Freeze time at the current second and resume normal time after executing closure...
$this->freezeSecond(function (Carbon $time) {
    // ...
});

```

--------------------------------

### Retrieve All Invoices Including Pending (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to retrieve all invoices for a billable model, including pending ones, using the `invoicesIncludingPending` method. It returns a collection of `Laravel\Cashier\Invoice` instances.

```PHP
$invoices = $user->invoicesIncludingPending();
```

--------------------------------

### Check for Recurring Subscription (PHP)

Source: https://laravel.com/docs/10.x/billing

Checks if a user is currently subscribed and has passed their trial period, indicating a recurring subscription. This method is useful for identifying actively paying customers.

```PHP
if ($user->subscription('default')->recurring()) {
    // ...
}
```

--------------------------------

### Retrieve Request URL in Laravel

Source: https://laravel.com/docs/10.x/requests

Get the request URL with or without the query string using `url` and `fullUrl` methods. Append query strings with `fullUrlWithQuery` and remove them with `fullUrlWithoutQuery`.

```php
$url = $request->url();

$urlWithQueryString = $request->fullUrl();

$request->fullUrlWithQuery(['type' => 'phone']);

$request->fullUrlWithoutQuery(['type']);
```

--------------------------------

### Setting Request Headers

Source: https://laravel.com/docs/10.x/http-client

Details methods for adding and managing request headers. `withHeaders` merges new headers, `replaceHeaders` replaces all existing headers, `accept` sets the expected response content type, and `acceptJson` is a shortcut for JSON.

```php
$response = Http::withHeaders([
    'X-First' => 'foo',
    'X-Second' => 'bar'
])->post('http://example.com/users', [
    'name' => 'Taylor',
]);
```

```php
$response = Http::accept('application/json')->get('http://example.com/users');
```

```php
$response = Http::acceptJson()->get('http://example.com/users');
```

```php
$response = Http::withHeaders([
    'X-Original' => 'foo',
])->replaceHeaders([
    'X-Replacement' => 'bar',
])->post('http://example.com/users', [
    'name' => 'Taylor',
]);
```

--------------------------------

### Test Time-Sensitive Logic in Laravel

Source: https://laravel.com/docs/10.x/mocking

An example demonstrating how to test time-sensitive application behavior, such as locking inactive forum threads after a week, using Laravel's time manipulation testing helpers.

```php
<?php

use App\Models\Thread;

public function test_forum_threads_lock_after_one_week_of_inactivity()
{
    $thread = Thread::factory()->create();

    $this->travel(1)->week();

    $this->assertTrue($thread->isLockedByInactivity());
}

```

--------------------------------

### Execute PHP Commands with Sail

Source: https://laravel.com/docs/10.x/sail

This shows how to execute arbitrary PHP commands or scripts using the `sail php` command. This ensures the commands run with the PHP version configured for your Sail application. It includes examples for checking the PHP version and running a specific PHP script.

```shell
sail php --version
sail php script.php
```

--------------------------------

### Log messages using Laravel's Log facade

Source: https://laravel.com/docs/10.x/logging

Demonstrates how to log messages using the `Log` facade in Laravel for all defined logging levels. These messages are written to the default log channel.

```php
use Illuminate\Support\Facades\Log;

Log::emergency($message);
Log::alert($message);
Log::critical($message);
Log::error($message);
Log::warning($message);
Log::notice($message);
Log::info($message);
Log::debug($message);
```

--------------------------------

### Get string before a value using `before` - Laravel

Source: https://laravel.com/docs/10.x/strings

The `before` method returns the portion of a string that appears before a specified value. If the value is not found, an empty string is returned. This method is part of Laravel's Fluent Strings.

```PHP
use Illuminate\Support\Str;

$slice = Str::of('This is my name')->before('my name');

// 'This is '
```

--------------------------------

### Publish Passport Views using Artisan

Source: https://laravel.com/docs/10.x/passport

This shell command is used to publish the views for Laravel Passport, allowing for customization of the authorization approval screen. It uses the `vendor:publish` Artisan command with the `passport-views` tag. The views will be placed in the `resources/views/vendor/passport` directory.

```shell
php artisan vendor:publish --tag=passport-views

```

--------------------------------

### Inline State Transformation with Factory (PHP)

Source: https://laravel.com/docs/10.x/eloquent-factories

This PHP example demonstrates using the 'state' method directly on the factory instance for an inline attribute override. This achieves the same result as passing an array to the 'make' method but provides an alternative syntax for setting attributes.

```php
$user = User::factory()->state([
    'name' => 'Abigail Otwell',
])->make();
```

--------------------------------

### Update Composer Dependencies for PHPUnit 10

Source: https://laravel.com/docs/10.x/upgrade

This JSON snippet details the composer.json adjustments required to use PHPUnit 10 with Laravel 10. It involves updating collision and PHPUnit packages.

```json
{
    "require-dev": {
        "nunomaduro/collision": "^7.0",
        "phpunit/phpunit": "^10.0"
    }
}
```

--------------------------------

### Implement HasApiTokens Trait for User Model

Source: https://laravel.com/docs/10.x/sanctum

Applies the `HasApiTokens` trait to the User model to enable Sanctum's API token authentication features. This allows users to generate and manage API tokens.

```php
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
}
```

--------------------------------

### Get Last Modified Time (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Obtains the UNIX timestamp representing the last modification time of a file using the Storage facade. Accepts the file path.

```php
use Illuminate\Support\Facades\Storage;

$time = Storage::lastModified('file.jpg');
```

--------------------------------

### Configure Reverb Server Environment Variables

Source: https://laravel.com/docs/10.x/reverb

Define `REVERB_SERVER_HOST` and `REVERB_SERVER_PORT` for the Reverb server's operational address, and `REVERB_HOST` and `REVERB_PORT` for broadcast message routing. This is crucial for production setups where the server might be behind a proxy.

```ini
REVERB_SERVER_HOST=0.0.0.0
REVERB_SERVER_PORT=8080

REVERB_HOST=ws.laravel.com
REVERB_PORT=443
```

--------------------------------

### Configure Laravel Pint with pint.json

Source: https://laravel.com/docs/10.x/pint

Configures Laravel Pint using a pint.json file in the project root. Supports specifying presets, custom rules, and excluding files or folders.

```json
{
    "preset": "laravel"
}

{
    "preset": "psr12"
}

{
    "preset": "laravel",
    "rules": {
        "simplified_null_return": true,
        "braces": false,
        "new_with_braces": {
            "anonymous_class": false,
            "named_class": false
        }
    }
}

{
    "exclude": [
        "my-specific/folder"
    ]
}

{
    "notName": [
        "*-my-file.php"
    ]
}

{
    "notPath": [
        "path/to/excluded-file.php"
    ]
}
```

--------------------------------

### Cancel Subscription Immediately (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Cancels a user's default subscription immediately. This method stops the subscription without regard to the end of the current billing cycle.

```php
$user->subscription('default')->cancelNow();
```

--------------------------------

### Get Specific Redis Connection in Laravel

Source: https://laravel.com/docs/10.x/redis

Obtains a Redis connection instance using a configured connection name from `config/database.php`. This is essential for applications using multiple Redis servers or configurations.

```php
use Illuminate\Support\Facades\Redis;

$redis = Redis::connection('connection-name');
```

--------------------------------

### Process Input Through Pipeline with Invokable Classes

Source: https://laravel.com/docs/10.x/helpers

Shows how to use Laravel's Pipeline facade with invokable classes. The framework automatically resolves these classes via the service container, injecting any required dependencies. The pipeline passes the input through each class sequentially.

```php
$user = Pipeline::send($user)
            ->through([
                GenerateProfilePhoto::class,
                ActivateSubscription::class,
                SendWelcomeEmail::class,
            ])
            ->then(fn (User $user) => $user);
```

--------------------------------

### Get First Item or Throw Exception - Laravel

Source: https://laravel.com/docs/10.x/collections

The `firstOrFail` method retrieves the first item from a collection. If no item is found, it throws an `Illuminate\Support\ItemNotFoundException`. This method can be called with or without a closure to define the search criteria.

```php
collect([1, 2, 3, 4])->firstOrFail(function (int $value, int $key) {
    return $value > 5;
});

// Throws ItemNotFoundException...

collect([])->firstOrFail();

// Throws ItemNotFoundException...
```

--------------------------------

### Retrieving Raw Search Results in Laravel

Source: https://laravel.com/docs/10.x/scout

Explains how to use the `raw` method to get the raw search results from Scout before they are converted into Eloquent models. This can be useful for inspecting the underlying search engine data.

```php
$orders = Order::search('Star Trek')->raw();
```

--------------------------------

### Cancel Subscription at Specific Time (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Schedules the cancellation of a user's default subscription for a specific future date and time. The subscription will end at the specified `DateTime` instance.

```php
$user->subscription('default')->cancelAt(
    now()->addDays(10)
);
```

--------------------------------

### Enforce Any Required Scope on a Route (PHP)

Source: https://laravel.com/docs/10.x/passport

Demonstrates using the 'scope' middleware on a route. This middleware verifies if the authenticated user's access token has at least one of the provided scopes ('check-status' or 'place-orders').

```php
Route::get('/orders', function () {
    // Access token has either "check-status" or "place-orders" scope...
})->middleware(['auth:api', 'scope:check-status,place-orders']);
```

--------------------------------

### Enable Laravel Dusk WebDriver Feature in Homestead

Source: https://laravel.com/docs/10.x/homestead

Activates the WebDriver feature for Laravel Dusk testing within the Homestead environment. This is required for running Dusk's browser automation tests.

```yaml
features:
    - webdriver: true
```

--------------------------------

### Define a Laravel 10.x Closure-Based Console Command

Source: https://laravel.com/docs/10.x/artisan

This snippet illustrates how to define a console command using a closure in Laravel 10.x. This approach is suitable for simpler commands and is registered within the `routes/console.php` file. The closure receives command arguments and options, and can also type-hint dependencies from the service container. The `purpose` method can be chained to provide a description.

```php
use App\Models\User;
use App\Support\DripEmailer;

Artisan::command('mail:send {user}', function (string $user) {
    $this->info("Sending email to: {$user}!");
});
```

```php
use App\Models\User;
use App\Support\DripEmailer;

Artisan::command('mail:send {user}', function (DripEmailer $drip, string $user) {
    $drip->send(User::find($user));
});
```

```php
Artisan::command('mail:send {user}', function (string $user) {
    // ...
})->purpose('Send a marketing email to a user');
```

--------------------------------

### Class Definition and Instantiation in PHP

Source: https://laravel.com/docs/10.x/mcp

Shows the basic structure of defining a class and creating an instance (object) of that class in PHP. This is core to object-oriented programming in PHP.

```php
<?php

class Car {
    public $color;

    public function __construct($color) {
        $this->color = $color;
    }

    public function displayColor() {
        echo "The car is " . $this->color;
    }
}

// Create an instance of the Car class
$myCar = new Car("red");
$myCar->displayColor(); // Output: The car is red
?>
```

--------------------------------

### Import Envoy Tasks from Another File

Source: https://laravel.com/docs/10.x/envoy

This example shows how to use the `@import` directive in an Envoy file to include tasks and stories from another Envoy file. This promotes code reusability and modularity in task definitions.

```blade
@import('vendor/package/Envoy.blade.php')
```

--------------------------------

### Get Strictly Unique Items from Collection - Laravel

Source: https://laravel.com/docs/10.x/collections

The `uniqueStrict` method is similar to `unique` but uses strict type comparison for determining uniqueness. This is useful when precise value matching is required.

```php
// Same signature as unique(), but uses strict comparisons.
// Example:
// $collection->uniqueStrict('brand');
```

--------------------------------

### Get Maximum Value with max() (PHP)

Source: https://laravel.com/docs/10.x/collections

The max method returns the maximum value from a collection. It can operate on a specific key within nested arrays or directly on a collection of primitive values.

```PHP
$max = collect([
    ['foo' => 10],
    ['foo' => 20]
])->max('foo');

// 20

$max = collect([1, 2, 3, 4, 5])->max();

// 5
```

--------------------------------

### Download Invoice PDF using Laravel Cashier

Source: https://laravel.com/docs/10.x/billing

Generates a PDF download of an invoice using the `downloadInvoice` method available on the user model in Laravel Cashier. This method automatically handles the HTTP response for downloading the file. The filename defaults to the application name.

```php
use Illuminate\Http\Request;

Route::get('/user/invoice/{invoice}', function (Request $request, string $invoiceId) {
    return $request->user()->downloadInvoice($invoiceId);
});
```

--------------------------------

### Check Subscription to Specific Price (PHP)

Source: https://laravel.com/docs/10.x/billing

Determines if a customer's subscription is associated with a given Stripe price ID. This is useful for verifying subscriptions tied to specific pricing plans.

```PHP
if ($user->subscribedToPrice('price_basic_monthly', 'default')) {
    // ...
}
```

--------------------------------

### Get Application Directory Path - PHP

Source: https://laravel.com/docs/10.x/helpers

Returns the fully qualified path to the application's `app` directory using the `app_path()` helper. Can also generate paths relative to the app directory.

```PHP
$path = app_path();

$path = app_path('Http/Controllers/Controller.php');
```

--------------------------------

### Create a New Subscription with Payment Method ID

Source: https://laravel.com/docs/10.x/billing

This PHP code snippet illustrates creating a new subscription for a user using Laravel Cashier. It uses the `newSubscription` method to define the subscription type and price, and the `create` method to process the subscription with a given payment method ID. Requires an authenticated user, a valid payment method ID, and a Stripe price ID.

```php
use Illuminate\Http\Request;

Route::post('/user/subscribe', function (Request $request) {
    $request->user()->newSubscription(
        'default', 'price_monthly'
    )->create($request->paymentMethodId);

    // ...
});
```

--------------------------------

### Authorize Action Via `can` Method in Route (PHP)

Source: https://laravel.com/docs/10.x/authorization

This example shows a more concise way to apply the `can` middleware to a route using the route's `can` method. It achieves the same authorization as the `middleware('can:update,post')` syntax.

```PHP
use App\Models\Post;
use Illuminate\Support\Facades\Route;

Route::put('/post/{post}', function (Post $post) {
    // The current user may update the post...
})->can('update', 'post');
```

--------------------------------

### Create LazyCollection from a Generator Function (PHP)

Source: https://laravel.com/docs/10.x/collections

Provides an example of creating a LazyCollection instance by passing a PHP generator function to the `LazyCollection::make()` method. This generator function reads a file line by line.

```php
use Illuminate\Support\LazyCollection;

LazyCollection::make(function () {
    $handle = fopen('log.txt', 'r');

    while (($line = fgets($handle)) !== false) {
        yield $line;
    }
});
```

--------------------------------

### Get Model Broadcast Channel Name (PHP)

Source: https://laravel.com/docs/10.x/broadcasting

This method returns the string name of the broadcast channel for a given model instance, following Laravel's conventions (e.g., `App.Models.User.1`).

```php
$user->broadcastChannel()
```

--------------------------------

### Acquire Lock with Closure and Auto-Release in Laravel

Source: https://laravel.com/docs/10.x/cache

Shows how to acquire an atomic lock and execute a closure within its scope, with automatic release upon closure completion. This simplifies lock management by handling the release automatically. The `get` method accepts a closure argument for this purpose.

```php
use Illuminate\Support\Facades\Cache;

Cache::lock('foo', 10)->get(function () {
    // Lock acquired for 10 seconds and automatically released...
});
```

--------------------------------

### Login Users with Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet demonstrates how to log in a user for testing purposes using Dusk's `loginAs` method. It accepts a user model instance or primary key and maintains the session for subsequent tests in the file. Dependencies include the `LaravelDuskBrowser` class and your application's User model.

```php
use App\Models\User;
use Laravel\Dusk\Browser;

$this->browse(function (Browser $browser) {
    $browser->loginAs(User::find(1))
          ->visit('/home');
});
```

--------------------------------

### Route Slack Notifications for a Model (PHP)

Source: https://laravel.com/docs/10.x/notifications

This example demonstrates how to define the `routeNotificationForSlack` method within a Laravel model to specify where Slack notifications should be sent. It shows how to return a channel name string for routing.

```php
<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Notifications\Notification;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * Route notifications for the Slack channel.
     */
    public function routeNotificationForSlack(Notification $notification): mixed
    {
        return '#support-channel';
    }
}
```

--------------------------------

### Get Database Directory Path - PHP

Source: https://laravel.com/docs/10.x/helpers

Returns the fully qualified path to the application's `database` directory using the `database_path()` helper. Can also generate paths relative to the database directory.

```PHP
$path = database_path();

$path = database_path('factories/UserFactory.php');
```

--------------------------------

### Update Subscription Price Quantities in Laravel

Source: https://laravel.com/docs/10.x/billing

Enables updating quantities for individual subscription prices using dedicated methods. The price ID is passed as an argument to specify which price to modify.

```php
$user = User::find(1);

// Increment the quantity of a specific price
$user->subscription('default')->incrementQuantity(5, 'price_chat');

// Decrement the quantity of a specific price
$user->subscription('default')->decrementQuantity(3, 'price_chat');

// Set a specific quantity for a price
$user->subscription('default')->updateQuantity(10, 'price_chat');
```

--------------------------------

### Check if Subscription is Canceled (PHP)

Source: https://laravel.com/docs/10.x/billing

Determines if a user has canceled their subscription. This method returns true if the subscription has been canceled, regardless of whether it's still within the grace period.

```PHP
if ($user->subscription('default')->canceled()) {
    // ...
}
```

--------------------------------

### Configure Personal Access Client Credentials (INI)

Source: https://laravel.com/docs/10.x/passport

After creating a personal access client, configure your application's .env file with the generated client ID and secret. These values are used by your application to authenticate when issuing personal access tokens.

```ini
PASSPORT_PERSONAL_ACCESS_CLIENT_ID="client-id-value"
PASSPORT_PERSONAL_ACCESS_CLIENT_SECRET="unhashed-client-secret-value"
```

--------------------------------

### Get Unique Models from Laravel Collection

Source: https://laravel.com/docs/10.x/eloquent-collections

The `unique` method returns a new collection containing only unique models. Models with the same type and primary key are considered duplicates and removed.

```php
$users = $users->unique();
```

--------------------------------

### Swap Subscription Prices Immediately (Laravel)

Source: https://laravel.com/docs/10.x/cashier-paddle

Updates an existing subscription by swapping prices and immediately invoicing the customer for the changes. The 'swapAndInvoice' method is used, requiring the current prices and quantities to be included along with new or modified ones.

```php
$user->subscription()->swapAndInvoice(['price_chat', 'price_original' => 2]);
```

--------------------------------

### Database Migration for Products Table (PHP)

Source: https://laravel.com/docs/10.x/mcp

This PHP snippet defines a Laravel database migration for creating the 'products' table. It includes columns for name, description, price, stock, category ID, and an active status, along with timestamps.

```PHP
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->decimal('price', 8, 2);
            $table->integer('stock_quantity')->default(0);
            $table->foreignId('category_id')->nullable()->constrained()->onDelete('set null');
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};

```

--------------------------------

### Apply Client Credentials Middleware to Route (PHP)

Source: https://laravel.com/docs/10.x/passport

Applies the `client` middleware to a specific route to restrict access to authenticated clients using the client credentials grant. You can also specify required scopes as a comma-delimited list.

```php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/orders', function (Request $request) {
    // ...
})->middleware('client');

Route::get('/orders', function (Request $request) {
    // ...
})->middleware('client:check-status,your-scope');

```

--------------------------------

### Prepend Item to Array - PHP

Source: https://laravel.com/docs/10.x/helpers

The Arr::prepend method adds an item to the beginning of an array. You can specify a custom key for the prepended item if needed. This is useful for adding default or initial values to the start of an array.

```php
use Illuminate\Support\Arr;

$array = ['one', 'two', 'three', 'four'];

$array = Arr::prepend($array, 'zero');

// ['zero', 'one', 'two', 'three', 'four']

$array = ['price' => 100];

$array = Arr::prepend($array, 'Desk', 'name');

// ['name' => 'Desk', 'price' => 100]
```

--------------------------------

### Pushing Mail to Specific Queues in Laravel

Source: https://laravel.com/docs/10.x/mail

This example illustrates how to specify the connection and queue name for a mail message in Laravel. It utilizes the `onQueue` and `onConnection` methods on a mailable class instance, which requires the `Illuminate\Bus\Queueable` trait.

```php
$message = (new OrderShipped($order))
                ->onConnection('sqs')
                ->onQueue('emails');

Mail::to($request->user())
    ->cc($moreUsers)
    ->bcc($evenMoreUsers)
    ->queue($message);
```

--------------------------------

### Spying on Laravel Cache Facade - PHP

Source: https://laravel.com/docs/10.x/mocking

This example illustrates how to use a facade spy with the Laravel Cache facade. Spies record interactions with the facade, allowing assertions on method calls after the code has executed, such as verifying a `put` operation.

```php
<?php

namespace Tests\Feature;

use Illuminate\Support\Facades\Cache;
use Tests\TestCase;

class CacheSpyTest extends TestCase
{
    public function test_values_are_be_stored_in_cache(): void
    {
        Cache::spy();

        $response = $this->get('/');

        $response->assertStatus(200);

        Cache::shouldHaveReceived('put')->once()->with('name', 'Taylor', 10);
    }
}
```

--------------------------------

### Dispatching Jobs to Specific Connections in Laravel

Source: https://laravel.com/docs/10.x/queues

This PHP snippet illustrates dispatching a job to a specific queue connection named 'sqs' using the `onConnection` method. This is useful when your application utilizes multiple distinct queue configurations, such as different message brokers or external services. The example dispatches a `ProcessPodcast` job to the 'sqs' connection.

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Jobs\ProcessPodcast;
use App\Models\Podcast;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class PodcastController extends Controller
{
    /**
     * Store a new podcast.
     */
    public function store(Request $request): RedirectResponse
    {
        $podcast = Podcast::create(/* ... */);

        // Create podcast...

        ProcessPodcast::dispatch($podcast)->onConnection('sqs');

        return redirect('/podcasts');
    }
}

```

--------------------------------

### Derive Incomplete Payment Status from Exception

Source: https://laravel.com/docs/10.x/billing

Shows how to inspect the `payment` property of an `IncompletePayment` exception to determine the specific status of the failed payment. This allows for more granular error handling, such as checking if the payment requires a new payment method or further confirmation.

```php
use Laravel\Cashier\Exceptions\IncompletePayment;

try {
    $user->charge(1000, 'pm_card_threeDSecure2Required');
} catch (IncompletePayment $exception) {
    // Get the payment intent status...
    $exception->payment->status;

    // Check specific conditions...
    if ($exception->payment->requiresPaymentMethod()) {
        // Payment requires a payment method
    } elseif ($exception->payment->requiresConfirmation()) {
        // Payment requires confirmation
    }
}
```

--------------------------------

### Create and Customize MCP Prompt Metadata (PHP)

Source: https://laravel.com/docs/10.x/mcp

This PHP snippet illustrates how to define custom metadata for an MCP prompt. By setting the `$name`, `$title`, and `$description` properties within the `DescribeWeatherPrompt` class, you can control how the prompt is identified and understood by AI clients. A descriptive `$description` is crucial for effective prompt usage.

```php
<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;

class DescribeWeatherPrompt extends Prompt
{
    /**
     * The prompt's name.
     */
    protected string $name = 'weather-assistant';

    /**
     * The prompt's title.
     */
    protected string $title = 'Weather Assistant Prompt';

    /**
     * The prompt's description.
     */
    protected string $description = 'Generates a natural-language explanation of the weather for a given location.';

    // ...
}

```

--------------------------------

### Configure Cron Schedule in Homestead YAML

Source: https://laravel.com/docs/10.x/homestead

Enables cron job scheduling for a specific site within the Homestead configuration file. This ensures the `schedule:run` command is executed for the defined site.

```yaml
sites:
    - map: homestead.test
      to: /home/vagrant/project1/public
      schedule: true
```

--------------------------------

### Get or Set Cache Values with cache() in PHP

Source: https://laravel.com/docs/10.x/helpers

The cache function retrieves values from the cache, returning a default if the key doesn't exist. It can also add items to the cache with a specified duration.

```PHP
$value = cache('key');
$value = cache('key', 'default');

cache(['key' => 'value'], 300);
cache(['key' => 'value'], now()->addSeconds(10));
```

--------------------------------

### Create API Token with Custom Expiration (PHP)

Source: https://laravel.com/docs/10.x/sanctum

Generates an API token with a specific expiration date and time using the `createToken` method, overriding the default configuration. The expiration is provided as the third argument.

```php
return $user->createToken(
    'token-name', ['*'], now()->addWeek()
)->plainTextToken;
```

--------------------------------

### Ignore Passport Routes in Laravel

Source: https://laravel.com/docs/10.x/passport

Prevent Passport from registering its default routes by calling `Passport::ignoreRoutes()` in the `register` method of your `AppServiceProvider`. This is the first step before overriding Passport's routes.

```php
use Laravel\Passport\Passport;

// In AppServiceProvider::register()
Passport::ignoreRoutes();
```

--------------------------------

### Mocking Laravel Cache Facade - PHP

Source: https://laravel.com/docs/10.x/mocking

This snippet demonstrates how to mock a call to the Laravel Cache facade's `get` method using `shouldReceive` for testing controller actions. It utilizes Mockery to set expectations on the facade.

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
     * Retrieve a list of all users of the application.
     */
    public function index(): array
    {
        $value = Cache::get('key');

        return [
            // ...
        ];
    }
}
```

```php
<?php

namespace Tests\Feature;

use Illuminate\Support\Facades\Cache;
use Tests\TestCase;

class UserControllerTest extends TestCase
{
    public function test_get_index(): void
    {
        Cache::shouldReceive('get')
                    ->once()
                    ->with('key')
                    ->andReturn('value');

        $response = $this->get('/users');

        // ...
    }
}
```

--------------------------------

### Dynamically Configure Laravel Queue Listener (PHP)

Source: https://laravel.com/docs/10.x/events

Demonstrates how to define the listener's queue connection, queue name, or delay at runtime by implementing `viaConnection`, `viaQueue`, or `withDelay` methods within the listener class. This provides flexibility for dynamic configuration based on event data.

```php
/**
 * Get the name of the listener's queue connection.
 */
public function viaConnection(): string
{
    return 'sqs';
}

/**
 * Get the name of the listener's queue.
 */
public function viaQueue(): string
{
    return 'listeners';
}

/**
 * Get the number of seconds before the job should be processed.
 */
public function withDelay(OrderShipped $event): int
{
    return $event->highPriority ? 0 : 60;
}
```

--------------------------------

### Check Coupon Type and Discount Amount

Source: https://laravel.com/docs/10.x/billing

Determine if a coupon is percentage-based or a fixed amount using `isPercentage()`. Retrieve the discount value with `percentOff()` for percentage coupons or `amountOff()` for fixed amount coupons.

```php
if ($coupon->isPercentage()) {
    return $coupon->percentOff().'%'; // 21.5%
} else {
    return $coupon->amountOff(); // $5.99
}
```

--------------------------------

### Check if User is on Trial (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet shows how to check if a user is currently within their trial period using the `onTrial` method. It returns `true` if the current date is before the `trial_ends_at` timestamp.

```PHP
if ($user->onTrial()) {
    // User is within their trial period...
}
```

--------------------------------

### Confirm Two Factor Authentication Status (Blade)

Source: https://laravel.com/docs/10.x/fortify

Displays a confirmation message when the user has successfully confirmed their two factor authentication setup. This is used within Blade templates to inform the user of successful configuration.

```html
@if (session('status') == 'two-factor-authentication-confirmed')
    <div class="mb-4 font-medium text-sm">
        Two factor authentication confirmed and enabled successfully.
    </div>
@endif
```

--------------------------------

### Generating Resource Controllers with Model Binding and Resource Option

Source: https://laravel.com/docs/10.x/controllers

This command generates a resource controller for a specified model, enabling route model binding. The `--model` option ensures type-hinting of the model instance in controller methods. The `--resource` flag generates all the standard resource controller methods.

```shell
php artisan make:controller PhotoController --model=Photo --resource
```

--------------------------------

### Configure Sanctum Token Ability Middleware

Source: https://laravel.com/docs/10.x/sanctum

Add the CheckAbilities and CheckForAnyAbility middleware to your application's Http Kernel to enable route protection based on token capabilities. These middleware allow granular control over which tokens can access specific routes.

```php
class HttpKernel {
    protected $middlewareAliases = [
        'abilities' => \Laravel\Sanctum\Http\Middleware\CheckAbilities::class,
        'ability' => \Laravel\Sanctum\Http\Middleware\CheckForAnyAbility::class,
    ];
}
```

--------------------------------

### Force Seeders in Production Environment

Source: https://laravel.com/docs/10.x/seeding

This snippet shows how to bypass the confirmation prompt when running seeders in a production environment. The `--force` flag is used with the `db:seed` command to ensure seeders are executed without user interaction, which is useful for automated deployments but should be used with caution.

```shell
php artisan db:seed --force
```

--------------------------------

### Add Bash Aliases to Homestead

Source: https://laravel.com/docs/10.x/homestead

This snippet shows how to define custom Bash aliases within the Homestead virtual machine by editing the 'aliases' file. After modification, the machine needs to be re-provisioned for changes to take effect.

```shell
alias c='clear'
alias ..='cd ..'
```

--------------------------------

### Handle IncompletePayment Exception and Redirect

Source: https://laravel.com/docs/10.x/billing

Catches the IncompletePayment exception thrown during payment creation and redirects the user to Cashier's payment confirmation page. It includes parameters for the payment ID and a redirect URL. This method requires the user to re-enter payment details and complete additional security steps.

```php
use Laravel\Cashier\Exceptions\IncompletePayment;

try {
    $subscription = $user->newSubscription('default', 'price_monthly')
                            ->create($paymentMethod);
} catch (IncompletePayment $exception) {
    return redirect()->route(
        'cashier.payment',
        [$exception->payment->id, 'redirect' => route('home')]
    );
}
```

--------------------------------

### Replace Substring - Laravel

Source: https://laravel.com/docs/10.x/strings

Replaces a portion of a string with another string, starting at a specified position and for a specified number of characters. A length of 0 inserts the new string without replacing.

```php
use Illuminate\Support\Str;

$string = Str::of('1300')->substrReplace(':', 2);

// 13:

$string = Str::of('The Framework')->substrReplace(' Laravel', 3, 0);

// The Laravel Framework
```

--------------------------------

### Get Socket ID (JavaScript)

Source: https://laravel.com/docs/10.x/broadcasting

Retrieve the current socket ID assigned to the Laravel Echo instance. This is necessary when manually configuring the `X-Socket-ID` header for requests not using a global Axios instance.

```javascript
var socketId = Echo.socketId();
```

--------------------------------

### Swap Subscription Plan and Invoice Immediately

Source: https://laravel.com/docs/10.x/cashier-paddle

Swaps a user to a new subscription plan and immediately invoices the user for the change, bypassing the regular billing cycle. Requires the Paddle price identifier for the new plan. Assumes the default subscription.

```PHP
$user = User::find(1);

$user->subscription()->swapAndInvoice($premium = 'pri_456');
```

--------------------------------

### Find a Specific Invoice by ID (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to retrieve a specific invoice by its unique ID using the `findInvoice` method. It takes the invoice ID as an argument and returns a single `Laravel\Cashier\Invoice` instance.

```PHP
$invoice = $user->findInvoice($invoiceId);
```

--------------------------------

### Get Last Array Element with last (PHP)

Source: https://laravel.com/docs/10.x/helpers

The last function returns the last element of a given array. It provides a convenient way to access the final item in a collection.

```php
$array = [100, 200, 300];

$last = last($array);

// 300
```

--------------------------------

### Share context across all logging channels in Laravel

Source: https://laravel.com/docs/10.x/logging

Demonstrates how to share contextual information across all logging channels, including those created subsequently, by using the `Log::shareContext` method. This ensures consistent context for all log outputs.

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Response;

class AssignRequestId
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $requestId = (string) Str::uuid();

        Log::shareContext([
            'request-id' => $requestId
        ]);

        // ...
    }
}
```

--------------------------------

### Clear Specific Queue Jobs

Source: https://laravel.com/docs/10.x/queues

Clears jobs from a specific queue and connection using the `queue:clear` Artisan command. This example clears jobs from the 'emails' queue on the 'redis' connection.

```shell
php artisan queue:clear redis --queue=emails
```

--------------------------------

### Add Client Credentials Middleware to Kernel (PHP)

Source: https://laravel.com/docs/10.x/passport

Configures the `CheckClientCredentials` middleware for Laravel Passport's client credentials grant. Add the middleware alias to the `$middlewareAliases` property in your application's `app/Http/Kernel.php` file.

```php
use Laravel\Passport\Http\Middleware\CheckClientCredentials;

protected $middlewareAliases = [
    'client' => CheckClientCredentials::class,
];

```

--------------------------------

### Generate a New Dusk Test

Source: https://laravel.com/docs/10.x/dusk

Use the `php artisan dusk:make` command to scaffold a new browser test file. This command generates a basic test structure within the `tests/Browser` directory, ready for customization.

```shell
php artisan dusk:make LoginTest
```

--------------------------------

### Making an API Request with Guzzle HTTP Client in PHP

Source: https://laravel.com/docs/10.x/mcp

Demonstrates how to make an HTTP GET request to an external API using the Guzzle HTTP client, which is commonly used in Laravel projects. This snippet fetches data from a specified URL and returns the JSON response. Error handling for API requests is recommended.

```php
use GuzzleHttp\Client;

$client = new Client();
$response = $client->get('https://api.example.com/data');

$data = json_decode($response->getBody(), true);

return $data;
```

--------------------------------

### Implement Deferred Provider in Laravel

Source: https://laravel.com/docs/10.x/providers

This PHP code snippet demonstrates how to create a deferred service provider in Laravel. It implements the `DeferrableProvider` interface and defines a `provides` method to return the service container bindings registered by the provider. This improves application performance by deferring the loading of the provider until its services are actually needed.

```php
<?php

namespace App\Providers;

use App\Services\Riak\Connection;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Support\ServiceProvider;

class RiakServiceProvider extends ServiceProvider implements DeferrableProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(Connection::class, function (Application $app) {
            return new Connection($app['config']['riak']);
        });
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array<int, string>
     */
    public function provides(): array
    {
        return [Connection::class];
    }
}
```

--------------------------------

### Create Carbon Instance using Carbon Class

Source: https://laravel.com/docs/10.x/helpers

Creates a new Carbon instance representing the current date and time by explicitly calling the `now()` method on the `Illuminate\Support\Carbon` class. This method requires importing the Carbon class.

```php
use Illuminate\Support\Carbon;

$now = Carbon::now();
```

--------------------------------

### Define custom browser macros in Laravel Dusk

Source: https://laravel.com/docs/10.x/dusk

This snippet shows how to extend the `Browser` class with custom methods (macros) in Laravel Dusk. Macros are defined in a service provider's `boot` method and can be used like any other browser method, promoting code reusability. The example defines a `scrollToElement` macro.

```php
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Laravel\Dusk\Browser;

class DuskServiceProvider extends ServiceProvider
{
    /**
     * Register Dusk's browser macros.
     */
    public function boot(): void
    {
        Browser::macro('scrollToElement', function (string $element = null) {
            $this->script("$(\'html, body\').animate({ scrollTop: $(\'$element\').offset().top }, 0);");

            return $this;
        });
    }
}
```

```php
$this->browse(function (Browser $browser) use ($user) {
    $browser->visit('/pay')
            ->scrollToElement('#credit-card-details')
            ->assertSee('Enter Credit Card Details');
});
```

--------------------------------

### Define Shorthand Selectors in Laravel Dusk Page Objects

Source: https://laravel.com/docs/10.x/dusk

Explains how to define shorthand selectors within a Dusk Page class using the `elements` method. These shortcuts simplify CSS selector usage throughout tests, making them more readable and easier to manage. The example shows defining a shortcut for an email input field.

```php
<?php

namespace Tests\Browser\Pages;

use Laravel\Dusk\Page;
use Laravel\Dusk\Browser;

class LoginPage extends Page
{
    /**
     * Get the element shortcuts for the page.
     *
     * @return array<string, string>
     */
    public function elements(): array
    {
        return [
            '@email' => 'input[name=email]',
        ];
    }
}

// Usage in a test:
$browser->type('@email', 'taylor@laravel.com');
```

--------------------------------

### Basic HTML Structure

Source: https://laravel.com/docs/10.x/mcp

A minimal HTML structure demonstrating the essential tags like doctype, html, head, and body. This serves as a template for web pages.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>
```

--------------------------------

### Delete All Payment Methods for a User

Source: https://laravel.com/docs/10.x/billing

This code deletes all payment method information for a given billable model. It calls the `deletePaymentMethods` method on the billable model. This action is irreversible and should be used with caution.

```php
$user->deletePaymentMethods();
```

--------------------------------

### Redirecting to Home Route in Laravel 10.x

Source: https://laravel.com/docs/10.x/upgrade

The deprecated `Redirect::home` method has been removed in Laravel 10.x. To redirect to the home route, explicitly use `Redirect::route('home')`, referencing the route's name.

```php
// Deprecated:
// return Redirect::home();

// Recommended:
return Redirect::route('home');
```

--------------------------------

### Get Project Root Directory Path - PHP

Source: https://laravel.com/docs/10.x/helpers

Returns the fully qualified path to the project's root directory using the `base_path()` helper. Can also generate paths relative to the root directory.

```PHP
$path = base_path();

$path = base_path('vendor/bin');
```

--------------------------------

### Date and Time Handling in PHP

Source: https://laravel.com/docs/10.x/mcp

Demonstrates how to work with dates and times in PHP, including formatting and retrieving the current date and time.

```php
<?php

// Get the current date and time
echo date('Y-m-d H:i:s');

// Format a specific date
$timestamp = strtotime("2023-10-27");
echo date('l, F j, Y', $timestamp);
?>
```

--------------------------------

### Customize Passport Cookie Name (PHP)

Source: https://laravel.com/docs/10.x/passport

Demonstrates how to change the default name of the authentication cookie used by Passport. The `Passport::cookie()` method should typically be called within the `boot` method of your `AppProvidersAuthServiceProvider`.

```php
/**
 * Register any authentication / authorization services.
 */
public function boot(): void
{
    Passport::cookie('custom_name');
}
```

--------------------------------

### Perform a Simple One-Time Charge with Laravel Cashier

Source: https://laravel.com/docs/10.x/billing

The `charge` method on a billable model instance initiates a one-time payment. The first argument is the amount in the lowest currency denomination (e.g., cents for USD), and the second is the payment method identifier. You can pass additional Stripe API options as the third argument.

```php
use Illuminate\Http\Request;

Route::post('/purchase', function (Request $request) {
    $user = $request->user();
    $paymentMethodId = $request->paymentMethodId;

    try {
        $payment = $user->charge(
            100, $paymentMethodId, [
                'custom_option' => 'value',
            ]
        );
        // Charge successful
    } catch (Exception $e) {
        // Charge failed
    }
});
```

```php
use App\Models\User;

$user = new User();
$paymentMethodId = 'pm_card_visa'; // Example payment method ID

$payment = $user->charge(100, $paymentMethodId);
```

--------------------------------

### Adding Additional Meta Data When Constructing Laravel Resources

Source: https://laravel.com/docs/10.x/eloquent-resources

This example shows how to append top-level data to a resource response directly when creating the resource instance in a controller or route. The `additional` method is utilized for this purpose.

```php
return (new UserCollection(User::all()->load('roles')))
                ->additional(['meta' => [
                    'key' => 'value',
                ]]);
```

--------------------------------

### Get File Path (PHP)

Source: https://laravel.com/docs/10.x/filesystem

Retrieves the path to a file using the Storage facade. For the 'local' driver, it returns the absolute path. For the 's3' driver, it returns the relative path within the bucket.

```php
use Illuminate\Support\Facades\Storage;

$path = Storage::path('file.jpg');
```

--------------------------------

### Get user input with text prompt (PHP)

Source: https://laravel.com/docs/10.x/prompts

This PHP code snippet demonstrates how to use the `text` prompt function from Laravel Prompts to ask the user for their name. The input is stored in the `$name` variable. This is a fundamental prompt for capturing string input.

```php
use function Laravel\Prompts\text;

$name = text('What is your name?');
```

--------------------------------

### Configure Stripe Error Logging Channel

Source: https://laravel.com/docs/10.x/billing

Specifies the log channel for fatal Stripe errors by defining the `CASHIER_LOGGER` environment variable. Exceptions from API calls are logged using the application's default channel.

```ini
CASHIER_LOGGER=stack
```

--------------------------------

### Inject Dependencies into Prompt Handle Method

Source: https://laravel.com/docs/10.x/mcp

Allows type-hinting dependencies directly within the `handle` method of a prompt. The service container automatically resolves and injects these dependencies when the method is invoked. Ensures dependencies are available and registered.

```php
<?php

namespace App\Mcp\Prompts;

use App\Repositories\WeatherRepository;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Prompt;

class DescribeWeatherPrompt extends Prompt
{
    /**
     * Handle the prompt request.
     */
    public function handle(Request $request, WeatherRepository $weather): Response
    {
        $isAvailable = $weather->isServiceAvailable();

        // ...
    }
}

```

--------------------------------

### Event Listener Mapping for Authentication (PHP)

Source: https://laravel.com/docs/10.x/authentication

Example of configuring event listeners in Laravel's `EventServiceProvider`. This array maps authentication-related events dispatched by Laravel to their corresponding listener classes, allowing custom logic to be executed upon specific authentication actions.

```php
<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\LogRegisteredUser;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'Illuminate\Auth\Events\Registered' => [
            'App\Listeners\LogRegisteredUser',
        ],

        'Illuminate\Auth\Events\Attempting' => [
            'App\Listeners\LogAuthenticationAttempt',
        ],

        'Illuminate\Auth\Events\Authenticated' => [
            'App\Listeners\LogAuthenticated',
        ],

        'Illuminate\Auth\Events\Login' => [
            'App\Listeners\LogSuccessfulLogin',
        ],

        'Illuminate\Auth\Events\Failed' => [
            'App\Listeners\LogFailedLogin',
        ],

        'Illuminate\Auth\Events\Validated' => [
            'App\Listeners\LogValidated',
        ],

        'Illuminate\Auth\Events\Verified' => [
            'App\Listeners\LogVerified',
        ],

        'Illuminate\Auth\Events\Logout' => [
            'App\Listeners\LogSuccessfulLogout',
        ],

        'Illuminate\Auth\Events\CurrentDeviceLogout' => [
            'App\Listeners\LogCurrentDeviceLogout',
        ],

        'Illuminate\Auth\Events\OtherDeviceLogout' => [
            'App\Listeners\LogOtherDeviceLogout',
        ],

        'Illuminate\Auth\Events\Lockout' => [
            'App\Listeners\LogLockout',
        ],

        'Illuminate\Auth\Events\PasswordReset' => [
            'App\Listeners\LogPasswordReset',
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
```

--------------------------------

### POST Request with Multi-Part File Upload

Source: https://laravel.com/docs/10.x/http-client

Explains how to send files as multi-part requests using the `attach` method, including options for filename and headers.

```APIDOC
## POST /attachments

### Description
Sends a POST request with file attachments using the multi-part content type.

### Method
POST

### Endpoint
`http://example.com/attachments`

### Request Body
- **attachment** (file|resource) - Required - The file to attach.
- **filename** (string) - Optional - The filename to be sent with the attachment.
- **headers** (array) - Optional - Custom headers for the attachment.

### Request Example
```php
use Illuminate\Support\Facades\Http;

// Attaching file content directly
$response = Http::attach(
    'attachment',
    file_get_contents('photo.jpg'),
    'photo.jpg',
    ['Content-Type' => 'image/jpeg']
)->post('http://example.com/attachments');

// Attaching a stream resource
$photo = fopen('photo.jpg', 'r');
$response = Http::attach('attachment', $photo, 'photo.jpg')->post('http://example.com/attachments');
```

### Response
#### Success Response (200 or 201)
- **message** (string) - Upload success message.
- **file_id** (string) - Identifier for the uploaded file.
```

--------------------------------

### Format Slack Notifications with Block Kit in PHP

Source: https://laravel.com/docs/10.x/notifications

Defines the `toSlack` method to construct rich Slack notifications using Block Kit. It accepts a `$notifiable` entity and returns an `Illuminate\Notifications\Slack\SlackMessage` instance. This example showcases text, header, context, section, and divider blocks.

```php
use Illuminate\Notifications\Slack\BlockKit\Blocks\ContextBlock;
use Illuminate\Notifications\Slack\BlockKit\Blocks\SectionBlock;
use Illuminate\Notifications\Slack\BlockKit\Composites\ConfirmObject;
use Illuminate\Notifications\Slack\SlackMessage;

/**
 * Get the Slack representation of the notification.
 */
public function toSlack(object $notifiable): SlackMessage
{
    return (new SlackMessage)
            ->text('One of your invoices has been paid!')
            ->headerBlock('Invoice Paid')
            ->contextBlock(function (ContextBlock $block) {
                $block->text('Customer #1234');
            })
            ->sectionBlock(function (SectionBlock $block) {
                $block->text('An invoice has been paid.');
                $block->field("*Invoice No:*
1000")->markdown();
                $block->field("*Invoice Recipient:*
taylor@laravel.com")->markdown();
            })
            ->dividerBlock()
            ->sectionBlock(function (SectionBlock $block) {
                $block->text('Congratulations!');
            });
}
```

--------------------------------

### Naming Pool Processes for Better Key Management in PHP

Source: https://laravel.com/docs/10.x/processes

Explains how to assign custom string keys to processes within a pool using the `as` method, improving the expressiveness of accessing results. The assigned key is also passed to the output closure, allowing identification of the source process.

```php
$pool = Process::pool(function (Pool $pool) {
    $pool->as('first')->command('bash import-1.sh');
    $pool->as('second')->command('bash import-2.sh');
    $pool->as('third')->command('bash import-3.sh');
})->start(function (string $type, string $output, string $key) {
    // ...
});

$results = $pool->wait();

return $results['first']->output();
```

--------------------------------

### Protecting Routes with Auth Middleware (PHP)

Source: https://laravel.com/docs/10.x/passport

Demonstrates how to protect routes using the 'auth:api' middleware in Laravel, ensuring only authenticated requests with valid access tokens can access the route. This is a common pattern for securing API endpoints.

```php
Route::get('/user', function () {
    // ...
})->middleware('auth:api');
```

--------------------------------

### Resume Canceled Subscription (Laravel Cashier)

Source: https://laravel.com/docs/10.x/billing

Resumes a customer's canceled subscription, provided they are still within their grace period. If resumed before the original expiration, the customer will not be billed immediately and will be billed on their original billing cycle.

```php
$user->subscription('default')->resume();
```

--------------------------------

### Create, Update, and Delete Eloquent Models in Laravel

Source: https://context7.com/context7/laravel_10_x/llms.txt

Demonstrates various methods for creating, updating, and deleting models using Laravel's Eloquent ORM. Includes methods like save(), create(), firstOrCreate(), update(), upsert(), delete(), and destroy(). Ensure the model has the necessary fillable properties for create() and updateOrCreate().

```php
use App\Models\Flight;

// Create using save()
$flight = new Flight;
$flight->name = 'London to Paris';
$flight->save();

// Create using create() - requires $fillable
$flight = Flight::create([
    'name' => 'London to Paris',
    'destination' => 'Paris',
]);

// Find or create
$flight = Flight::firstOrCreate(
    ['name' => 'London to Paris'],
    ['delayed' => 1, 'arrival_time' => '11:30']
);

// Update existing model
$flight = Flight::find(1);
$flight->name = 'Paris to London';
$flight->save();

// Mass update
Flight::where('active', 1)
    ->where('destination', 'San Diego')
    ->update(['delayed' => 1]);

// Update or create
$flight = Flight::updateOrCreate(
    ['departure' => 'Oakland', 'destination' => 'San Diego'],
    ['price' => 99, 'discounted' => 1]
);

// Upsert multiple records
Flight::upsert([
    ['departure' => 'Oakland', 'destination' => 'San Diego', 'price' => 99],
    ['departure' => 'Chicago', 'destination' => 'New York', 'price' => 150]
], ['departure', 'destination'], ['price']);

// Delete model
$flight = Flight::find(1);
$flight->delete();

// Delete by primary key
Flight::destroy(1);
Flight::destroy([1, 2, 3]);

// Delete matching query
Flight::where('active', 0)->delete();
```

--------------------------------

### Get File URL - Laravel

Source: https://laravel.com/docs/10.x/filesystem

This snippet demonstrates generating a URL for a given file on the default storage disk using `Storage::url`. The generated URL will be relative for the 'local' driver and fully qualified for drivers like 's3'. It requires the `IlluminateSupportFacadesStorage` facade.

```PHP
use Illuminate\Support\Facades\Storage;

$url = Storage::url('file.jpg');
```

--------------------------------

### Retrieving Request Path Information (PHP)

Source: https://laravel.com/docs/10.x/requests

Illustrates how to get the URI path of the incoming request using the `path` method on the Request instance. This method returns the path relative to the application's root.

```php
$uri = $request->path();

```

--------------------------------

### Share Lock Keys Across Different Job Classes (PHP)

Source: https://laravel.com/docs/10.x/queues

This example shows how to use the `shared` method with the `WithoutOverlapping` middleware. This ensures that the lock key is applied across different job classes, preventing overlaps even between distinct job types that share a common identifier.

```php
use Illuminate\Queue\Middleware\WithoutOverlapping;

// In ProviderIsDown job class
public function middleware(): array
{
    return [
        (new WithoutOverlapping("status:{$this->provider}"))->shared(),
    ];
}

// In ProviderIsUp job class
public function middleware(): array
{
    return [
        (new WithoutOverlapping("status:{$this->provider}"))->shared(),
    ];
}
```

--------------------------------

### Constructor Dependency Injection in Laravel MCP Tools

Source: https://laravel.com/docs/10.x/mcp

Demonstrates how to use Laravel's service container for dependency injection via the constructor in MCP tools. Dependencies are automatically resolved and injected when the tool instance is created. Requires the `WeatherRepository` class.

```php
<?php

namespace App\Mcp\Tools;

use App\Repositories\WeatherRepository;
use Laravel\Mcp\Server\Tool;

class CurrentWeatherTool extends Tool
{
    /**
     * Create a new tool instance.
     */
    public function __construct(
        protected WeatherRepository $weather,
    ) {}

    // ...
}
```

--------------------------------

### Create New OAuth2 Client - JavaScript (Axios)

Source: https://laravel.com/docs/10.x/passport

Creates a new OAuth2 client by sending a POST request to the `/oauth/clients` endpoint. Requires the client's `name` and a `redirect` URL. Upon successful creation, it returns the new client instance, including its ID and secret, which are used for requesting access tokens.

```javascript
const data = {
    name: 'Client Name',
    redirect: 'http://example.com/callback'
};
axios.post('/oauth/clients', data)
    .then(response => {
        console.log(response.data);
    })
    .catch (response => {
        // List errors on response...
    });
```

--------------------------------

### Preview Prices with Discounts using Laravel Cashier

Source: https://laravel.com/docs/10.x/cashier-paddle

Apply discounts when previewing prices by providing a `discount_id` in the options array to the `previewPrices` method. This allows displaying prices after a specific discount has been applied.

```php
use Laravel\Paddle\Cashier;

$prices = Cashier::previewPrices(['pri_123', 'pri_456'], [
    'discount_id' => 'dsc_123'
]);
```

--------------------------------

### Retrieve All Invoices for a Billable Model (PHP)

Source: https://laravel.com/docs/10.x/billing

This snippet demonstrates how to retrieve a collection of all invoices for a billable model using the `invoices` method. The method returns `Laravel\Cashier\Invoice` instances. Pending invoices are not included by default.

```PHP
$invoices = $user->invoices();
```

--------------------------------

### Create Subquery WHERE Clauses in Laravel

Source: https://laravel.com/docs/10.x/queries

This example shows how to create 'where' clauses that compare query results against a subquery. It covers comparing a subquery's result to a value and comparing a column to the results of a subquery.

```php
use App\Models\User;
use Illuminate\Database\Query\Builder;

$users = User::where(function (Builder $query) {
    $query->select('type')
        ->from('membership')
        ->whereColumn('membership.user_id', 'users.id')
        ->orderByDesc('membership.start_date')
        ->limit(1);
}, 'Pro')->get();
```

```php
use App\Models\Income;
use Illuminate\Database\Query\Builder;

$incomes = Income::where('amount', '<', function (Builder $query) {
    $query->selectRaw('avg(i.amount)')->from('incomes as i');
})->get();
```

--------------------------------

### Create Mail Attachments from In-Memory Data (PHP)

Source: https://laravel.com/docs/10.x/mail

This example illustrates creating an email attachment directly from data held in memory. The `Attachment::fromData()` method accepts a closure that returns the raw attachment content and an optional name for the attachment.

```php
return Attachment::fromData(fn () => $this->content, 'Photo Name');
```

--------------------------------

### Get String Length in PHP

Source: https://laravel.com/docs/10.x/strings

The `Str::length` method calculates and returns the number of characters in a given string. This is a straightforward utility function within Laravel's `Str` helper class.

```php
use Illuminate\Support\Str;

$length = Str::length('Laravel');

// 7
```

--------------------------------

### Output Inline Asset Content with Vite Facade

Source: https://laravel.com/docs/10.x/vite

Allows outputting the raw content of Vite assets directly into your HTML, useful for scenarios like PDF generation. It uses the `content` method of the `Vite` facade.

```blade
@php
use Illuminate\Support\Facades\Vite;
@endphp

<!doctype html>
<head>
    {{-- ... --}}

    <style>
        {!! Vite::content('resources/css/app.css') !!}
    </style>
    <script>
        {!! Vite::content('resources/js/app.js') !!}
    </script>
</head>
```

--------------------------------

### Get Items for a Specific Page - Laravel

Source: https://laravel.com/docs/10.x/collections

The `forPage` method creates a new collection containing items corresponding to a specific page number. It requires the page number and the number of items per page as arguments.

```php
$collection = collect([1, 2, 3, 4, 5, 6, 7, 8, 9]);

$chunk = $collection->forPage(2, 3);

$chunk->all();

// [4, 5, 6]
```

--------------------------------

### Generate a Laravel Policy with Model in Artisan

Source: https://laravel.com/docs/10.x/authorization

Generate a policy class along with example CRUD methods by providing the `--model` option to the `make:policy` Artisan command. This streamlines the creation of policies by pre-populating common authorization methods for a given model.

```shell
php artisan make:policy PostPolicy --model=Post
```

--------------------------------

### Retrieve Request IP Address in Laravel

Source: https://laravel.com/docs/10.x/requests

Get the client's IP address using the `ip` method. Retrieve all forwarded IP addresses, including the original, using the `ips` method.

```php
$ipAddress = $request->ip();

$ipAddresses = $request->ips();
```

--------------------------------

### Select Every Nth Element with nth() (PHP)

Source: https://laravel.com/docs/10.x/collections

The nth method creates a new collection containing every n-th element from the original collection. An optional offset can be provided to start the selection from a different position.

```PHP
$collection = collect(['a', 'b', 'c', 'd', 'e', 'f']);

$collection->nth(4);

// ['a', 'e']

$collection->nth(4, 1);

// ['b', 'f']
```

--------------------------------

### Swap Subscription Price (PHP)

Source: https://laravel.com/docs/10.x/billing

Swaps a user's current subscription to a new Stripe price identifier. This method assumes the user wishes to re-activate the subscription if previously canceled and maintains trial periods and quantities. It can be chained with `skipTrial` or `swapAndInvoice` for different behaviors.

```php
use App\Models\User;

$user = App\Models\User::find(1);

$user->subscription('default')->swap('price_yearly');

// Swap prices and cancel trial
$user->subscription('default')
        ->skipTrial()
        ->swap('price_yearly');

// Swap prices and immediately invoice
$user = User::find(1);

$user->subscription('default')->swapAndInvoice('price_yearly');
```

--------------------------------

### Pause Subscription Until Specific Time (Laravel Cashier)

Source: https://laravel.com/docs/10.x/cashier-paddle

Enables pausing a subscription until a specified future date and time. This is useful for scheduling subscription pauses. The `now()->addMonth()` example demonstrates pausing for one month.

```php
$user->subscription()->pauseUntil(now()->addMonth());
```

--------------------------------

### Manage Quantity for Multiple Products - Laravel

Source: https://laravel.com/docs/10.x/billing

Illustrates how to manage subscription quantities when dealing with subscriptions that include multiple products. The `incrementQuantity` and `decrementQuantity` methods accept a price ID as the second argument to specify which product's quantity to modify.

```php
use App\Models\User;

$user = User::find(1);

// Increment quantity for a specific price
$user->subscription('default')->incrementQuantity(1, 'price_chat');

// Decrement quantity for a specific price
$user->subscription('default')->decrementQuantity(1, 'price_chat');
```

--------------------------------

### Get Minimum Value with min() (PHP)

Source: https://laravel.com/docs/10.x/collections

The min method returns the minimum value from a collection. It can target a specific key within nested arrays or find the minimum of the collection's direct values.

```PHP
$min = collect([['foo' => 10], ['foo' => 20]])->min('foo');

// 10

$min = collect([1, 2, 3, 4, 5])->min();

// 1
```

--------------------------------

### Check Token Ability within Authorization Policy (Laravel)

Source: https://laravel.com/docs/10.x/sanctum

Verify if a user's token has the necessary abilities to perform an action, such as updating a server. This check should be combined with user ownership verification for comprehensive authorization.

```php
return $request->user()->id === $server->user_id &&
       $request->user()->tokenCan('server:update');
```

--------------------------------

### Enable Promotion Codes for Subscription Checkout in Laravel

Source: https://laravel.com/docs/10.x/billing

This snippet illustrates how to allow promotion codes to be applied during a Stripe Checkout subscription session. By calling the `allowPromotionCodes()` method before `checkout()`, users can enter discount codes at Stripe's checkout page.

```php
use Illuminate\Http\Request;

Route::get('/subscription-checkout', function (Request $request) {
    return $request->user()
        ->newSubscription('default', 'price_monthly')
        ->allowPromotionCodes()
        ->checkout();
});
```

--------------------------------

### Request with Authentication

Source: https://laravel.com/docs/10.x/http-client

Explains how to configure Basic, Digest, and Bearer token authentication for requests.

```APIDOC
## Authenticated Requests

### Description
Configures various authentication methods for HTTP requests, including Basic, Digest, and Bearer tokens.

### Method
GET, POST, PUT, DELETE, etc.

### Endpoint
`http://example.com/*`

### Request Example
```php
use Illuminate\Support\Facades\Http;

// Basic Authentication
$response = Http::withBasicAuth('taylor@laravel.com', 'secret')->post('http://example.com/users', [
    'name' => 'Taylor',
]);

// Digest Authentication
$response = Http::withDigestAuth('taylor@laravel.com', 'secret')->post('http://example.com/users', [
    'name' => 'Taylor',
]);

// Bearer Token
$response = Http::withToken('token')->post('http://example.com/users', [
    'name' => 'Taylor',
]);
```

### Response
#### Success Response (200)
(Response structure varies based on the authenticated endpoint)
```

--------------------------------

### Get string after a value using `after` - Laravel

Source: https://laravel.com/docs/10.x/strings

The `after` method returns the portion of a string that appears after a specified value. If the value is not found, the entire string is returned. This method is part of Laravel's Fluent Strings.

```PHP
use Illuminate\Support\Str;

$slice = Str::of('This is my name')->after('This is');

// ' my name'
```

--------------------------------

### Get CSRF Token in Laravel

Source: https://laravel.com/docs/10.x/csrf

Demonstrates how to retrieve the current CSRF token from the user's session or using the csrf_token helper function in Laravel. This is essential for form submissions and API requests.

```PHP
use Illuminate\Http\Request;

Route::get('/token', function (Request $request) {
    $token = $request->session()->token();

    $token = csrf_token();

    // ...
});
```

--------------------------------

### Get Host IP for Xdebug on Linux

Source: https://laravel.com/docs/10.x/sail

On Linux, determine the correct host IP address for Xdebug configuration by inspecting the Docker container's network settings. Replace '<container-name>' with your application's container name.

```shell
docker inspect -f {{range.NetworkSettings.Networks}}{{.Gateway}}{{end}} <container-name>
```

--------------------------------

### Add/Remove Prices to Existing Subscription - Laravel

Source: https://laravel.com/docs/10.x/billing

Explains how to add or remove products (prices) from an existing subscription using Laravel Cashier. Methods like `addPrice`, `addPriceAndInvoice`, and `removePrice` are provided. This allows for flexible subscription management by dynamically changing the products a customer is subscribed to.

```php
use App\Models\User;

$user = User::find(1);

// Add a new price to the subscription
$user->subscription('default')->addPrice('price_chat');

// Add a new price and immediately invoice the customer
$user->subscription('default')->addPriceAndInvoice('price_chat');

// Add a new price with a specific quantity
$user->subscription('default')->addPrice('price_chat', 5);

// Remove a price from the subscription
$user->subscription('default')->removePrice('price_chat');
```

--------------------------------

### Configure Mailpit for Email Interception (INI)

Source: https://laravel.com/docs/10.x/homestead

Sets up Mailpit as the mailer in the application's `.env` file to intercept outgoing emails for debugging. This prevents emails from being sent to actual recipients during development.

```ini
MAIL_MAILER=smtp
MAIL_HOST=localhost
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```

--------------------------------

### Configure SPA Stateful Requests Middleware (PHP)

Source: https://laravel.com/docs/10.x/sanctum

Adds Sanctum's middleware to the 'api' middleware group in `app/Http/Kernel.php`. This middleware ensures that frontend requests from SPAs are statefully authenticated using Laravel's session cookies.

```php
'api' => [
    \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
]
```

--------------------------------

### Display User Information with Pulse Blade Component

Source: https://laravel.com/docs/10.x/pulse

This is a Blade component example demonstrating how to use `<x-pulse::user-card>` to display user information fetched from Pulse aggregates. It takes a user object and statistics as props, providing a convenient way to render user-related data in your application's UI.

```blade
<x-pulse::user-card :user="{{ $seller->user }}" :stats="{{ $seller->sum }}" />
```

--------------------------------

### Enable Sanctum Middleware for Broadcast Routes

Source: https://laravel.com/docs/10.x/sanctum

This PHP code snippet shows how to enable the `auth:sanctum` middleware for broadcast routes within the `routes/api.php` file. This is necessary for authorizing private and presence broadcast channels when using Laravel Echo.

```php
Broadcast::routes(['middleware' => ['auth:sanctum']]);
```