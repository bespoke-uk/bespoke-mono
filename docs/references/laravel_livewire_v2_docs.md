### Install Livewire via Composer

Source: https://laravel-livewire.com/docs/2.x/quickstart

Installs the Livewire package into your Laravel project using Composer. This is the first step to start using Livewire.

```shell
composer require livewire/livewire
```

--------------------------------

### Install Livewire via Composer

Source: https://laravel-livewire.com/docs/2.x/index

Installs the Livewire package into your Laravel project using Composer. This is the first step to start using Livewire.

```shell
composer require livewire/livewire
```

--------------------------------

### Livewire Component Example

Source: https://laravel-livewire.com/docs/2.x/lifecycle-hooks

A PHP example demonstrating the implementation of various Livewire lifecycle hooks within a component class.

```php
class HelloWorld extends Component
{
    public $foo;

    public function boot()
    {
        //
    }

    public function booted()
    {
        //
    }

    public function mount()
    {
        //
    }

    public function hydrateFoo($value)
    {
        //
    }

    public function dehydrateFoo($value)
    {
        //
    }

    public function hydrate()
    {
        //
    }

    public function dehydrate()
    {
        //
    }

    public function updating($name, $value)
    {
        //
    }

    public function updated($name, $value)
    {
        //
    }

    public function updatingFoo($value)
    {
        //
    }

    public function updatedFoo($value)
    {
        //
    }

    public function updatingFooBar($value)
    {
        //
    }

    public function updatedFooBar($value)
    {
        //
    }
}
```

--------------------------------

### Install AlpineJS for Livewire

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Explains how to install AlpineJS by adding a script tag to your layout file's head section. It emphasizes the importance of the 'defer' attribute to ensure Alpine waits for Livewire to load first.

```html
<head>
    ...
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <!-- The "defer" attribute is important to make sure Alpine waits for Livewire to load first. -->
</head>
```

--------------------------------

### Livewire Dusk Browser Test Example

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

An example of a Livewire Dusk browser test, demonstrating how to interact with components, perform actions like clicking, and assert visible output. This test type is preferred for ensuring JavaScript and browser interactions work as expected.

```php
/** @test */
publicfunction it_can_run_foo_action
{
    $this->browse(function($browser){
        Livewire::visit($browser,FooComponent::class)
        /**
         * Basic action (click).
         */
        ->waitForLivewire()->click('@foo')
        ->assertSeeIn('@output','foo')
        ;
    });
}
```

--------------------------------

### Livewire Component Lifecycle Hooks Example

Source: https://laravel-livewire.com/docs/2.x/reference

Demonstrates the basic structure of a Livewire component class, highlighting the placement of lifecycle hooks like `mount()`.

```php
class ShowPost extends Component
{
    public function mount()
    {
        //
    }
}
```

--------------------------------

### Install NPM Dependencies

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

This command installs all the necessary Node.js and JavaScript dependencies for the Livewire project using npm. It reads the package.json file to download and manage required frontend packages.

```shell
npm install
```

--------------------------------

### Livewire Component Class Methods Example

Source: https://laravel-livewire.com/docs/2.x/reference

Demonstrates the basic structure of a Livewire component class in PHP, including a `save` method that emits an event.

```PHP
class PostForm extends Component
{
    public function save()
    {
        ...
        $this->emit('post-saved');
    }
}
```

--------------------------------

### Livewire PHP Testing Methods Example

Source: https://laravel-livewire.com/docs/2.x/reference

Illustrates how to use Livewire's PHP testing helpers to interact with and assert the behavior of Livewire components during tests.

```PHP
public function test()
{
    Livewire::test(ShowPost::class)
        ->assertDontSee('bar')
        ->set('foo','bar')
        ->assertSee('bar');
}
```

--------------------------------

### Livewire Component Traits Example

Source: https://laravel-livewire.com/docs/2.x/reference

Shows how to use traits like `WithPagination` to incorporate additional features into a Livewire component.

```php
class ShowPost extends Component
{
    use WithPagination;
}
```

--------------------------------

### Install Livewire Package with Composer

Source: https://laravel-livewire.com/docs/2.x/installation

Installs the Livewire package into your Laravel project using Composer. This is the primary method for adding Livewire to your application.

```Bash
composer require livewire/livewire
```

--------------------------------

### Install Composer Dependencies

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

This command installs all the necessary PHP dependencies for the Livewire project using Composer. It reads the composer.json file to download and manage required packages.

```shell
composer install
```

--------------------------------

### Livewire: Example Blade View Structure (Blade)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

An example of a Blade view structure that can be returned from a Livewire component's `render` method. This view iterates over a collection of posts and includes partial views for each post.

```Blade
<div>
    @foreach ($posts as $post)
        @include('includes.post', $post)
    @endforeach
</div>
```

--------------------------------

### Simplify Livewire Mount Method for Query String

Source: https://laravel-livewire.com/docs/2.x/upgrading

In Livewire v2, component properties are automatically initialized from the query string on page load. This eliminates the need for manual initialization within the `mount()` method, simplifying component setup.

```PHP
class Search extends Component
{
    // ...

    public function mount()
    {
        // No need for code like this anymore.
        // The search property will now be automatically set.
        // $this->search = request()->query('search', '');
    }
}

```

--------------------------------

### Livewire Component Redirect Example

Source: https://laravel-livewire.com/docs/2.x/redirecting

Demonstrates how to perform a redirect from a Livewire component's action. It shows how to create a new contact and then redirect the user to a success page using Laravel's `redirect()->to()` method.

```php
class ContactForm extends Component
{
    public $email;

    public function addContact()
    {
        Contact::create(['email'=>$this->email]);

        return redirect()->to('/contact-form-success');
    }
}
```

--------------------------------

### Initialize Livewire Component Properties with mount

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates how to initialize public properties within a Livewire component using the mount method. This method is called when the component is first mounted, allowing for initial state setup.

```php
class HelloWorld extends Component
{
    public $message;

    public function mount()
    {
        $this->message = 'Hello World!';
    }
}
```

--------------------------------

### Testing File Downloads with Livewire

Source: https://laravel-livewire.com/docs/2.x/file-downloads

Example of testing a Livewire component to verify that a file download was triggered correctly. The `assertFileDownloaded` method checks for the presence of the downloaded file.

```PHP
/** @test */
public function can_download_export()
{
    Livewire::test(ExportButton::class)
        ->call('download')
        ->assertFileDownloaded('export');
}
```

--------------------------------

### Include Alpine.js v2.7.0 or Greater

Source: https://laravel-livewire.com/docs/2.x/upgrading

Example of how to correctly include the Alpine.js library in your HTML to ensure compatibility with Livewire V2. It specifies using version 2.7.0 or a later patch release.

```html
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.x/dist/alpine.min.js" defer></script>
```

--------------------------------

### Laravel Event Broadcasting Example

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

Demonstrates how to define a Laravel event that implements `ShouldBroadcast` and how to dispatch it using the `event()` helper. This event is intended to be broadcast over WebSockets.

```PHP
class OrderShipped implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function broadcastOn()
    {
        return new Channel('orders');
    }
}

// Dispatching the event:
event(new OrderShipped);
```

--------------------------------

### Livewire Component View Example

Source: https://laravel-livewire.com/docs/2.x/redirecting

Provides the basic HTML structure for a Livewire component. It includes an input field bound to the component's `$email` property using `wire:model` and a button that triggers the `addContact` action using `wire:click`.

```html
<div>
    Email: <input wire:model="email">

    <button wire:click="addContact">Submit</button>
</div>
```

--------------------------------

### Recompile JavaScript Assets

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

Commands to manage JavaScript assets for Livewire. 'npm run build' compiles assets for production, while 'npm run watch' starts a watcher to automatically recompile assets during development.

```shell
npm run build
```

```shell
npm run watch
```

--------------------------------

### Livewire Component with Default Pagination

Source: https://laravel-livewire.com/docs/2.x/pagination

Demonstrates a basic Livewire component utilizing the WithPagination trait for standard pagination. This setup is suitable when only one paginator is present on the page.

```php
class ShowPosts extends Livewire\Component
{
    use WithPagination;

    public function render()
    {
        return view('livewire.show-posts',
            ['posts' => Post::paginate(10)]
        );
    }
}
```

--------------------------------

### Livewire File Storage Options (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Provides examples of different ways to store uploaded files using Livewire, leveraging Laravel's filesystem API. This includes specifying directories, storage disks (like S3), custom filenames, and visibility.

```php
// Store the uploaded file in the "photos" directory of the default filesystem disk.
$this->photo->store('photos');

// Store in the "photos" directory in a configured "s3" bucket.
$this->photo->store('photos','s3');

// Store in the "photos" directory with the filename "avatar.png".
$this->photo->storeAs('photos','avatar');

// Store in the "photos" directory in a configured "s3" bucket with the filename "avatar.png".
$this->photo->storeAs('photos','avatar','s3');

// Store in the "photos" directory, with "public" visibility in a configured "s3" bucket.
$this->photo->storePublicly('photos','s3');

// Store in the "photos" directory, with the name "avatar.png", with "public" visibility in a configured "s3" bucket.
$this->photo->storePubliclyAs('photos','avatar','s3');
```

--------------------------------

### Livewire Component Protected Properties Example

Source: https://laravel-livewire.com/docs/2.x/reference

Illustrates how to define protected properties within a Livewire component class, such as `$rules` for validation.

```php
class ShowPost extends Component
{
    protected $rules = ['foo' => 'required|min:6'];
}
```

--------------------------------

### Livewire: Event Directives (HTML)

Source: https://laravel-livewire.com/docs/2.x/actions

Illustrates how to use Livewire's event directives to listen for browser events and bind them to component actions. Common directives like wire:click, wire:keydown, and wire:submit are shown with examples.

```HTML
<button wire:click="doSomething">Do Something</button>
```

```HTML
<input wire:keydown.enter="doSomething">
```

```HTML
<form wire:submit.prevent="save">
    ...
    <button>Save</button>
</form>
```

```HTML
<button wire:foo="someAction">Listen to custom 'foo' event</button>
```

--------------------------------

### Registering Custom Livewire Components in PHP

Source: https://laravel-livewire.com/docs/2.x/package-dev

Demonstrates how to manually register custom Livewire components using the `Livewire::component` method within a service provider's boot method. This is useful for distributing components via Composer packages. The example shows the PHP code for registration and how to use the component in a Blade view.

```PHP
class YourPackageServiceProvider extends ServiceProvider {

    public function boot() {
        Livewire::component('some-component', SomeComponent::class);
    }

}
```

```HTML
<div>
    @livewire('some-component')
</div>
```

--------------------------------

### Testing Livewire File Uploads

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Provides an example of how to test file upload functionality in a Livewire component using Laravel's testing utilities. It demonstrates creating a fake file, dispatching the upload action, and asserting that the file was stored correctly.

```php
/** @test */
public function can_upload_photo()
{
    Storage::fake('avatars');

    $file = UploadedFile::fake()->image('avatar.png');

    Livewire::test(UploadPhoto::class)
        ->set('photo', $file)
        ->call('upload', 'uploaded-avatar.png');

    Storage::disk('avatars')->assertExists('uploaded-avatar.png');
}
```

```php
class UploadPhoto extends Component
{
    use WithFileUploads;

    public $photo;

    // ...

    public function upload($name)
    {
        $this->photo->storeAs('/', $name, $disk = 'avatars');
    }
}
```

--------------------------------

### Test Livewire Component with Passed Data

Source: https://laravel-livewire.com/docs/2.x/testing

Demonstrates testing a Livewire component by passing initial data directly during the test setup. The `Livewire::test` method accepts an array of data as its second argument, allowing you to pre-populate component properties and assert their initial state.

```PHP
use Tests\TestCase;
use Livewire\Livewire;
use App\Http\Livewire\ShowFoo;

class CreatePostTest extends TestCase
{
    /** @test */
    function has_data_passed_correctly() {
        Livewire::test(ShowFoo::class,['foo'=>'bar'])
            ->assertSet('foo','bar')
            ->assertSee('bar');
    }
}
```

```HTML
<livewire:show-foofoo="bar">

```

--------------------------------

### Create Inline Livewire Component with --inline Flag (PHP)

Source: https://laravel-livewire.com/docs/2.x/making-components

Demonstrates how to generate an inline Livewire component using the Artisan command. This method creates a component without a dedicated Blade view file, simplifying the setup for basic components.

```bash
php artisan make:livewire ShowPosts --inline
```

--------------------------------

### Show Loading Indicator with wire:loading

Source: https://laravel-livewire.com/docs/2.x/loading-states

This example demonstrates how to show a loading message while a Livewire action is processing. The `wire:loading` directive makes the enclosed element visible only during network requests triggered by Livewire.

```blade
<div>
    <button wire:click="checkout">Checkout</button>
    <div wire:loading>
        Processing Payment...
    </div>
</div>
```

--------------------------------

### Configure Temporary Upload Directory for Livewire (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Specify the directory within the configured disk where temporary files are stored during uploads. The default is `livewire-tmp/`. This example sets the directory to `tmp`.

```PHP
return[
    'temporary_file_upload'=>[
        'directory'=>'tmp',
    ],
];
```

--------------------------------

### Livewire: Root Element Issue Example

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Demonstrates a common Livewire error where a component has multiple root elements. This prevents child elements, like buttons with `wire:click`, from functioning correctly.

```blade
<div>
    Some content
</div>

<!-- This button isn't working -->
<button wire:click="doSomething">Do Something</button>
```

--------------------------------

### Testing Livewire Validation - Basic Assertions

Source: https://laravel-livewire.com/docs/2.x/input-validation

Provides examples of using Livewire's testing utilities to assert validation states. This snippet tests if specific fields are marked as having errors after setting them to empty values.

```php
/** @test */
public function name_and_email_fields_are_required_for_saving_a_contact()
{
    Livewire::test('contact-form')
        ->set('name','')
        ->set('email','')
        ->assertHasErrors(['name','email']);
}
```

--------------------------------

### Testing Livewire Validation - Specific Rules

Source: https://laravel-livewire.com/docs/2.x/input-validation

Demonstrates how to test against specific validation rules using Livewire's testing utilities. This example asserts that both 'name' and 'email' fields are required.

```php
/** @test */
public function name_and_email_fields_are_required_for_saving_a_contact()
{
    Livewire::test('contact-form')
        ->set('name','')
        ->set('email','')
        ->assertHasErrors([
            'name'=>'required',
            'email'=>'required',
        ]);
}
```

--------------------------------

### Reusable Blade Component with Alpine.js

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Demonstrates extracting Alpine.js logic into a reusable Blade component for use within Livewire. This example shows a Livewire view that utilizes a custom dropdown component, separating concerns and promoting reusability.

```blade
<div>
    <x-dropdown>
        <x-slotname="trigger">
            <button>Show More...</button>
        </x-slot>

        <ul>
            <li><button wire:click="archive">Archive</button></li>
            <li><button wire:click="delete">Delete</button></li>
        </ul>
    </x-dropdown>
</div>
```

```blade
<div x-data="{ open: false }">
    <span @click="open = true">{{$trigger }}
    </span>

    <div x-show="open" @click.outside="open = false">
        {{$slot }}
    </div>
</div>
```

--------------------------------

### HTML for Eloquent Relationship Binding

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates the HTML for binding to properties of related models within a loop. It uses `wire:model` with index notation for the relationship (e.g., `user.posts.{{ $i }}.title`) and includes an example of displaying validation errors using `@error`.

```HTML
<div>
    @foreach ($user->posts as $i => $post)
        <input type="text" wire:model="user.posts.{{ $i }}.title" />

        <span class="error">
            @error('user.posts.{{$i}}.title') {{ $message }} @enderror
        </span>
    @endforeach

    <button wire:click="save">Save</button>
</div>
```

--------------------------------

### Livewire: PHP Array Structure for Checksum

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Provides an example of a PHP component property containing an array. It highlights the importance of array key order (numeric before alphanumeric) to prevent checksum validation errors caused by JavaScript object conversion.

```php
class HelloWorld extends Component
{
    public $list = [
        '123' => 456,
        'foo' => 'bar'
    ];
    ...
}
```

--------------------------------

### Livewire Keydown Modifiers

Source: https://laravel-livewire.com/docs/2.x/actions

Listen for specific key presses on keydown events using Livewire modifiers. Convert native KeyboardEvent.key values to kebab-case. Examples include 'backspace', 'escape', 'shift', 'tab', and 'arrow-right'.

```html
<input wire:keydown.page-down="foo">
<input wire:keydown.escape="clearInput">
<input wire:keydown.arrow-right="nextField">
```

--------------------------------

### Update Dusk Browser Drivers

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

This command utilizes the bundled Dusk updater to detect and automatically update the necessary browser drivers (like ChromeDriver) required for running browser-based tests with Laravel Dusk. Ensure Chrome is installed.

```shell
./vendor/bin/dusk-updater detect --auto-update
```

--------------------------------

### Configure Middleware for Livewire File Upload Endpoint (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Customize the middleware applied to the temporary file upload endpoint. By default, Livewire uses throttling. This example demonstrates how to limit uploads to 5 per user per minute.

```PHP
return[
    'temporary_file_upload'=>[
        'middleware'=>'throttle:5,1', // Only allow 5 uploads per user per minute.
    ],
];
```

--------------------------------

### Livewire Pagination Component with wire:click (Blade/PHP)

Source: https://laravel-livewire.com/docs/2.x/pagination

An example of a custom Livewire pagination component that uses `wire:click` directives for navigation. This approach replaces traditional anchor tags with Livewire actions, enabling seamless client-side pagination updates.

```blade
<div>
@if($paginator->hasPages())
<nav role="navigation" aria-label="Pagination Navigation" class="flex justify-between">
<span>
{{-- Previous Page Link --}}
@if($paginator->onFirstPage())
<span class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 cursor-default leading-5 rounded-md">
{!!__('pagination.previous')!!}
</span>
@else
<button wire:click="previousPage" wire:loading.attr="disabled" rel="prev" class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 leading-5 rounded-md hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
{!!__('pagination.previous')!!}
</button>
@endif
</span>

<span>
{{-- Next Page Link --}}
@if($paginator->hasMorePages())
<button wire:click="nextPage" wire:loading.attr="disabled" rel="next" class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 leading-5 rounded-md hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
{!!__('pagination.next')!!}
</button>
@else
<span class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 cursor-default leading-5 rounded-md">
{!!__('pagination.next')!!}
</span>
@endif
</span>
</nav>
@endif
</div>
```

--------------------------------

### Livewire $wire Object API

Source: https://laravel-livewire.com/docs/2.x/reference

The $wire object provides an interface for Alpine.js components to interact with Livewire components. It allows for getting and setting component properties, calling component methods, and listening for or emitting events.

```APIDOC
$wire.foo
  Get the value of the "foo" property on the Livewire component.

$wire.foo = 'bar'
  Set the value of the "foo" property on the Livewire component.

$wire.bar(..args)
  Call the "bar" method (with params) on the Livewire component.

let baz = await $wire.bar(..args)
  Call the "bar" method, wait for the response, and set `baz` to it.

$wire.on('foo', (..args) => { ... })
  Call a function when the "foo" event is emitted from the Livewire component.

$wire.emit('foo', ...args)
  Emit the "foo" event to all Livewire components.

$wire.emitUp('foo', ...args)
  Emit the "foo" event to parent components.

$wire.emitSelf('foo', ...args)
  Emit the "foo" event only to this component.

$wire.get('foo')
  Get the "foo" property from the Livewire component.

$wire.set('foo', 'bar')
  Set the "foo" property on the component.

$wire.set('foo', 'bar', true)
  Defer setting the "foo" property on the component until the next request.

$wire.call('foo', ..args)
  Call the "foo" method with params on the component.

x-data="{ foo: $wire.entangle('foo') }"
  Entangle the value of "foo" between Livewire and Alpine.js, creating a two-way binding.

$wire.entangle('foo').defer
  Configure entangle to only update the Livewire property on the next fired Livewire request.
```

--------------------------------

### Listen to Public, Private, and Presence Channel Events in Livewire PHP

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

This example illustrates listening to various Laravel Echo channel types, including public, private, and presence channels, within a Livewire component. It covers subscribing to general events and specific presence channel lifecycle events like 'here', 'joining', and 'leaving'.

```PHP
class OrderTrackerextendsComponent

{

public$showNewOrderNotification =false;

public$orderId;


publicfunctionmount($orderId)

{

$this->orderId =$orderId;

}


publicfunctiongetListeners()

{

return[

// Public Channel

"echo:orders,OrderShipped"=>'notifyNewOrder',


// Private Channel

"echo-private:orders,OrderShipped"=>'notifyNewOrder',


//Presence Channel

"echo-presence:orders,OrderShipped"=>'notifyNewOrder',// Listen

"echo-presence:orders,here"=>'notifyNewOrder',// Here

"echo-presence:orders,joining"=>'notifyNewOrder',// Joining

"echo-presence:orders,leaving"=>'notifyNewOrder',// Leaving

];

}


publicfunctionnotifyNewOrder()

{

$this->showNewOrderNotification =true;

}

}
```

--------------------------------

### Debouncing Livewire Input with wire:model.debounce

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how to apply a debounce modifier to the wire:model directive to limit the frequency of network requests sent as a user types. The example uses a 500ms debounce for text inputs.

```html
<input type="text" wire:model.debounce.500ms="name">
```

--------------------------------

### HTML for Single Eloquent Model Binding

Source: https://laravel-livewire.com/docs/2.x/properties

Shows the HTML form structure for binding to Eloquent model properties using `wire:model`. This example binds to `post.title` and `post.content`, enabling two-way data flow between the form inputs and the component's model property.

```HTML
<form wire:submit.prevent="save">
    <input type="text" wire:model="post.title">

    <textarea wire:model="post.content"></textarea>

    <button type="submit">Save</button>
</form>
```

--------------------------------

### Livewire 2.x Core Concepts

Source: https://laravel-livewire.com/docs/2.x/nesting-components

This section covers the fundamental building blocks of Livewire 2.x, including component creation, rendering, properties, and actions. It's essential for understanding how to build dynamic interfaces with PHP.

```APIDOC
Livewire Component Basics:
  - Making Components: Create new Livewire components using Artisan commands.
  - Rendering Components: How to render components in Blade views using the `<livewire:component-name />` tag.
  - Properties: Define public properties in your component class to manage state. These properties are automatically synchronized between the server and client.
  - Actions: Define public methods in your component class that can be called from the frontend via `wire:click`, `wire:submit`, etc. These methods handle user interactions and update component state.
```

--------------------------------

### Toggling Classes on Referenced Elements

Source: https://laravel-livewire.com/docs/2.x/dirty-states

This example demonstrates how to apply a CSS class ('text-red-500') to a label element when the associated input element's value becomes dirty. It utilizes Livewire's `wire:dirty.class` directive targeting the 'foo' property.

```html
<div>
    <label wire:dirty.class="text-red-500" wire:target="foo">Full Name</label>
    <input wire:model.lazy="foo">
</div>
```

--------------------------------

### Configure Maximum Upload Time for Livewire File Uploads (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Set the maximum time in minutes allowed for a file upload to complete before it is invalidated. The default is 5 minutes. This example sets the maximum upload time to 5 minutes.

```PHP
return[
    'temporary_file_upload'=>[
        'max_upload_time'=>5,
    ],
];
```

--------------------------------

### Livewire Component Lifecycle Hooks

Source: https://laravel-livewire.com/docs/2.x/lifecycle-hooks

Livewire components have a lifecycle that allows developers to hook into various stages of their execution. These hooks enable running custom logic before or after specific events like component instantiation, hydration, dehydration, and property updates. The table below outlines the available hooks and their descriptions, along with a PHP example demonstrating their usage.

```APIDOC
Livewire Component Lifecycle Hooks:

boot:
  Description: Runs on every request, immediately after the component is instantiated, but before any other lifecycle methods are called.
  Usage: Called automatically.

booted:
  Description: Runs on every request, after the component is mounted or hydrated, but before any update methods are called.
  Usage: Called automatically.

mount:
  Description: Runs once, immediately after the component is instantiated, but before render() is called. This is only called once on initial page load and never called again, even on component refreshes.
  Usage: Called automatically.

hydrate:
  Description: Runs on every subsequent request, after the component is hydrated, but before an action is performed, or render() is called.
  Usage: Called automatically.

hydrateFoo:
  Description: Runs after a property called $foo is hydrated.
  Parameters:
    - $value: The hydrated value of the property.
  Usage: Called automatically when $foo is updated via hydration.

dehydrate:
  Description: Runs on every subsequent request, before the component is dehydrated, but after render() is called.
  Usage: Called automatically.

dehydrateFoo:
  Description: Runs before a property called $foo is dehydrated.
  Parameters:
    - $value: The value of the property being dehydrated.
  Usage: Called automatically before $foo is dehydrated.

updating:
  Description: Runs before any update to the Livewire component's data (Using wire:model, not directly inside PHP).
  Parameters:
    - $name: The name of the property being updated.
    - $value: The new value of the property.
  Usage: Called automatically before a property is updated via wire:model.

updated:
  Description: Runs after any update to the Livewire component's data (Using wire:model, not directly inside PHP).
  Parameters:
    - $name: The name of the property that was updated.
    - $value: The new value of the property.
  Usage: Called automatically after a property is updated via wire:model.

updatingFoo:
  Description: Runs before a property called $foo is updated. Array properties have an additional $key argument passed to this function to specify changing element inside array, like updatingArray($value, $key).
  Parameters:
    - $value: The new value of the property.
    - $key (optional): The key for array properties.
  Usage: Called automatically before $foo is updated.

updatedFoo:
  Description: Runs after a property called $foo is updated. Array properties have additional $key argument as above.
  Parameters:
    - $value: The new value of the property.
    - $key (optional): The key for array properties.
  Usage: Called automatically after $foo is updated.

updatingFooBar:
  Description: Runs before updating a nested property 'bar' on the $foo property or a multiword property such as $fooBar or $foo_bar.
  Parameters:
    - $value: The new value of the property.
  Usage: Called automatically before nested or multiword properties are updated.

updatedFooBar:
  Description: Runs after updating a nested property 'bar' on the $foo property or a multiword property such as $fooBar or $foo_bar.
  Parameters:
    - $value: The new value of the property.
  Usage: Called automatically after nested or multiword properties are updated.

Note: Mutating a property directly inside a Livewire component class doesn't trigger any of the updating/updated hooks.
```

--------------------------------

### Livewire Component with wire:init

Source: https://laravel-livewire.com/docs/2.x/defer-loading

This PHP class demonstrates how to implement defer loading using the `wire:init` directive. It includes a property to track readiness and a method that is called on initialization to load data, preventing delays in the initial page render.

```PHP
class ShowPost extends Component
{
    public $readyToLoad = false;

    public function loadPosts()
    {
        $this->readyToLoad = true;
    }

    public function render()
    {
        return view('livewire.show-posts',
            [
                'posts' => $this->readyToLoad
                    ? Post::all()
                    : [],
            ]
        );
    }
}
```

--------------------------------

### Default Livewire JavaScript Script Tag

Source: https://laravel-livewire.com/docs/2.x/installation

By default, Livewire generates a script tag to load its JavaScript from the `/livewire/livewire.js` route. This default behavior can fail if your application is hosted on a sub-path or if assets are served from a different base URL, as shown in the configuration examples.

```html
<script src="/livewire/livewire.js"></script>
```

--------------------------------

### Toggle HTML Attributes with Livewire Loading States

Source: https://laravel-livewire.com/docs/2.x/loading-states

This example shows how to use the `wire:loading.attr` directive in Livewire to toggle HTML attributes on an element while a component is loading. It's useful for disabling buttons or showing/hiding elements during asynchronous operations.

```HTML
<button wire:click="checkout" wire:loading.attr="disabled">
    Checkout
</button>
```

--------------------------------

### Initialize Livewire Properties with $this->fill()

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how to use the $this->fill() method within a Livewire component's mount method to initialize multiple properties concisely. This is useful for reducing visual noise when setting many initial values.

```php
public function mount()
{
    $this->fill(['message'=>'Hello World!']);
}
```

--------------------------------

### Livewire 2.x UI Niceties

Source: https://laravel-livewire.com/docs/2.x/nesting-components

This section covers features that enhance the user interface and experience in Livewire 2.x, such as managing loading states, polling data, prefetching content, handling offline states, tracking dirty states, and deferring component loading.

```APIDOC
Livewire UI Enhancements:
  - Loading States: Display loading indicators while component actions are being processed on the server.
  - Polling: Automatically re-fetch component data at regular intervals using `wire:poll`.
  - Prefetching: Load component data proactively when a user hovers over a link or element.
  - Offline State: Manage component behavior and display messages when the user is offline.
  - Dirty States: Track changes to component properties and indicate unsaved modifications.
  - Defer Loading: Delay the initial loading of a component until it's needed or visible.
```

--------------------------------

### Configure Global Validation Rules for Livewire File Uploads (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Customize the default validation rules applied to all temporary file uploads in Livewire. The default is `file|max:12288`. This example shows how to set custom rules for file type and size.

```PHP
return[
    'temporary_file_upload'=>[
        'rules'=>'file|mimes:png,jpg,pdf|max:102400', // (100MB max, and only pngs, jpegs, and pdfs.)
    ],
];
```

--------------------------------

### Livewire 2.x Artisan Commands

Source: https://laravel-livewire.com/docs/2.x/nesting-components

This section lists and describes the Artisan commands available in Livewire 2.x for common development tasks, such as creating components and managing application aspects.

```APIDOC
Livewire Artisan Commands:
  - `php artisan make:livewire component-name`: Generates a new Livewire component, including its class and Blade view.
  - Other commands may exist for specific tasks like clearing caches or managing assets.
```

--------------------------------

### Publish Livewire Frontend Assets with Artisan

Source: https://laravel-livewire.com/docs/2.x/installation

Publishes Livewire's frontend assets (JavaScript and CSS) to your public directory. This is useful if you prefer to serve these assets directly from your web server.

```Bash
php artisan livewire:publish --assets
```

--------------------------------

### Livewire: Basic Action Usage (PHP & HTML)

Source: https://laravel-livewire.com/docs/2.x/actions

Demonstrates the fundamental concept of actions in Livewire, where UI interactions trigger methods on a Livewire component. It shows a PHP component with a 'like' method and the corresponding HTML button to invoke it.

```PHP
class ShowPost extends Component
{
    public Post $post;

    public function like()
    {
        $this->post->addLikeBy(auth()->user());
    }
}
```

```HTML
<div>
    <button wire:click="like">Like Post</button>
</div>
```

--------------------------------

### Clone Livewire Repository Locally

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

This command clones your forked Livewire repository from GitHub to your local machine. It specifies the Git repository URL and the local directory where the project will be cloned.

```shell
git clone git@github.com:username/livewire.git~/packages/livewire
```

--------------------------------

### Direct Laravel Response Download

Source: https://laravel-livewire.com/docs/2.x/file-downloads

Illustrates using Laravel's `response()->download()` directly within a component or controller. This provides more control over the download process.

```PHP
return response()->download(storage_path('exports/export.csv'));
```

--------------------------------

### Publish Livewire Configuration File with Artisan

Source: https://laravel-livewire.com/docs/2.x/installation

Publishes Livewire's configuration file to your application's config directory. This allows for customization of Livewire's behavior and settings.

```Bash
php artisan livewire:publish --config
```

--------------------------------

### Navigate to Livewire Directory

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

After cloning the repository, this command changes your current working directory to the newly cloned Livewire project folder, allowing you to execute subsequent commands within the project context.

```shell
cd ~/packages/livewire
```

--------------------------------

### Livewire 2.x Component Features

Source: https://laravel-livewire.com/docs/2.x/nesting-components

This section details advanced features for managing component behavior and user experience in Livewire 2.x, including validation, file handling, query string integration, authorization, pagination, and redirecting.

```APIDOC
Livewire Component Advanced Features:
  - Validation: Implement server-side validation for component inputs using Livewire's built-in validation rules or custom logic.
  - File Uploads: Handle file uploads directly within Livewire components, including progress tracking and storage.
  - File Downloads: Implement functionality to trigger file downloads from within Livewire components.
  - Query String: Synchronize component state with the browser's URL query string to allow for bookmarkable and shareable states.
  - Authorization: Integrate authorization logic to control access to component actions and data based on user permissions.
  - Pagination: Implement server-driven pagination for lists and tables within Livewire components.
  - Redirecting: Perform redirects to different pages or routes from within component actions.
```

--------------------------------

### Basic Livewire Component Rendering Test

Source: https://laravel-livewire.com/docs/2.x/testing

A fundamental test to verify that a Livewire component can be rendered successfully. It instantiates the component using `Livewire::test` and then asserts that the HTTP response status is 200 OK, indicating successful rendering.

```PHP
use Tests\TestCase;
use Livewire\Livewire;
use App\Http\Livewire\ShowPosts;

class ShowPostsTest extends TestCase
{
    /** @test */
    public function the_component_can_render() {
        $component = Livewire::test(ShowPosts::class);
        
        $component->assertStatus(200);
    }
}
```

--------------------------------

### Generate Livewire Component Test File

Source: https://laravel-livewire.com/docs/2.x/testing

Creates a new Livewire component along with a corresponding PHPUnit test file. This is achieved by using the `make:livewire` Artisan command with the `--test` flag, streamlining the development workflow by providing a boilerplate test structure.

```Shell
php artisan make:livewire ShowPosts --test

```

--------------------------------

### Livewire: Action Parameter Handling (PHP)

Source: https://laravel-livewire.com/docs/2.x/actions

Details how parameters passed from the HTML view are received by the Livewire component's methods. It demonstrates standard PHP parameter binding and how to resolve models directly using type hints.

```PHP
public function addTodo($id, $name)
{
    // ...
}
```

```PHP
public function addTodo(Todo $todo, $name)
{
    // ...
}
```

--------------------------------

### Blade Template with wire:init

Source: https://laravel-livewire.com/docs/2.x/defer-loading

This Blade template shows how to attach the `wire:init` directive to a Livewire component's root element. This directive triggers the specified method (e.g., `loadPosts`) as soon as the component is rendered on the page, allowing for asynchronous data loading.

```Blade
<div wire:init="loadPosts">
    <ul>
        @foreach ($posts as $post)
            <li>{{ $post->title }}</li>
        @endforeach
    </ul>
</div>
```

--------------------------------

### Component Action for File Download

Source: https://laravel-livewire.com/docs/2.x/file-downloads

Demonstrates how to return a Laravel file download from a Livewire component action. This method is straightforward for basic file serving.

```PHP
class ExportButton extends Component
{
    public function export()
    {
        return Storage::disk('exports')->download('export.csv');
    }
}
```

--------------------------------

### Livewire: Route Model Binding in Mount (PHP)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Shows how Livewire components support route model binding directly in the `mount` method. By type-hinting a model, Livewire automatically resolves and injects the corresponding Eloquent model instance.

```PHP
use App\Http\Livewire\ShowPost;
use App\Models\Post;
use Illuminate\Support\Facades\Route;

Route::get('/post/{post}', ShowPost::class);

class ShowPost extends Component
{
    public $post;

    public function mount(Post $post)
    {
        $this->post = $post;
    }

}
```

--------------------------------

### Livewire Component Test: CreatePostTest

Source: https://laravel-livewire.com/docs/2.x/testing

This PHP code demonstrates how to test the `CreatePost` Livewire component using Livewire's testing utilities. It includes tests for creating a post, setting initial data, validating required fields, and asserting redirects after successful creation.

```PHP
class CreatePostTest extends TestCase
{
    /** @test */
    function can_create_post() {
        $this->actingAs(User::factory()->create());

        Livewire::test(CreatePost::class)
            ->set('title', 'foo')
            ->call('create');

        $this->assertTrue(Post::whereTitle('foo')->exists());
    }

    /** @test */
    function can_set_initial_title() {
        $this->actingAs(User::factory()->create());

        Livewire::test(CreatePost::class, ['initialTitle' => 'foo'])
            ->assertSet('title', 'foo');
    }

    /** @test */
    function title_is_required() {
        $this->actingAs(User::factory()->create());

        Livewire::test(CreatePost::class)
            ->set('title', '')
            ->call('create')
            ->assertHasErrors(['title' => 'required']);
    }

    /** @test */
    function is_redirected_to_posts_page_after_creation() {
        $this->actingAs(User::factory()->create());

        Livewire::test(CreatePost::class)
            ->set('title', 'foo')
            ->call('create')
            ->assertRedirect('/posts');
    }
}
```

--------------------------------

### Create Livewire Component in Sub-folder

Source: https://laravel-livewire.com/docs/2.x/making-components

Allows for the creation of Livewire components within sub-directories, organizing components logically. This supports different syntaxes for specifying the sub-folder path.

```php
php artisan make:livewire Post\Show
```

```php
php artisan make:livewire Post/Show
```

```php
php artisan make:livewire post.show
```

--------------------------------

### Livewire 2.x JavaScript Integrations

Source: https://laravel-livewire.com/docs/2.x/nesting-components

This section explains how to integrate Livewire 2.x with popular JavaScript libraries and patterns, specifically Alpine.js and Laravel Echo, and how to manage inline scripts within components.

```APIDOC
Livewire JS Integrations:
  - AlpineJS: Seamlessly integrate Alpine.js directives and behavior with Livewire components for enhanced frontend interactivity.
  - Laravel Echo: Connect Livewire components to Laravel Echo to receive real-time events from the backend and update the UI accordingly.
  - Inline Scripts: Safely execute JavaScript directly within your Livewire component views, ensuring proper scoping and lifecycle management.
```

--------------------------------

### Configure Composer for Livewire Asset Updates

Source: https://laravel-livewire.com/docs/2.x/installation

Configures the `composer.json` file to automatically run the Livewire asset publishing command after Composer's `post-autoload-dump` event. This ensures frontend assets are kept up-to-date with package updates.

```JSON
{
"scripts":{
"post-autoload-dump":[
"Illuminate\Foundation\ComposerScripts::postAutoloadDump",
"@php artisan package:discover --ansi",
"@php artisan vendor:publish --force --tag=livewire:assets --ansi"
]
}
}
```

--------------------------------

### Direct Laravel Stream Download

Source: https://laravel-livewire.com/docs/2.x/file-downloads

Demonstrates using Laravel's `response()->streamDownload()` for streaming file content directly. This is useful for dynamically generated files or large datasets.

```PHP
return response()->streamDownload(function(){
    echo 'CSV Contents...';
},'export.csv');
```

--------------------------------

### Create Livewire Component

Source: https://laravel-livewire.com/docs/2.x/making-components

Generates a new Livewire component with its corresponding Blade view. This command creates two files: a PHP class for the component logic and a Blade view for its HTML structure.

```php
php artisan make:livewire ShowPosts
```

```php
php artisan make:livewire show-posts
```

--------------------------------

### Key Livewire Components in Loop (Tag Syntax)

Source: https://laravel-livewire.com/docs/2.x/nesting-components

Shows an alternative way to render keyed Livewire components within a loop using the tag syntax, available on Laravel 7 and above. It utilizes the `wire:key` attribute for component tracking.

```html
<div>
    @foreach ($users as $user)
        <livewire:user-profile :user="$user" :wire:key="$user->id">
    @endforeach
</div>

```

--------------------------------

### Livewire Component Class Methods

Source: https://laravel-livewire.com/docs/2.x/reference

Details common methods available within Livewire component classes for interacting with the frontend, managing state, and handling validation and redirection.

```APIDOC
Livewire Component Methods:

$this->emit($eventName, ...$params)
  - Emit an event to other components on the page.

$this->emit($eventName, ...$params)->up()
  - Emit an event to parent components on the page.

$this->emit($eventName, ...$params)->self()
  - Emit an event only to THIS component.

$this->emit($eventName, ...$params)->to($componentName)
  - Emit an event to any component matching the provided name.

$this->dispatchBrowserEvent($eventName, ...$params)
  - Dispatch a browser event from this component's root element.

$this->validate()
  - Run the validation rules provided in the `$rules` property against the public component properties.

$this->validate($rules, $messages)
  - Run the provided validation rules against the public properties.

$this->validateOnly($propertyName)
  - Run the `$rules` property validation against a specific property provided and not others.

$this->validateOnly($propertyName, $rules, $messages)
  - Run the provided validation rules against a specific property name.

$this->redirect($url)
  - Redirect to a new URL when the Livewire request finishes and reaches the frontend.

$this->redirectRoute($routeName)
  - Redirect to a specific route name.

$this->skipRender()
  - Skip running the `->render()` method for the current request. (Usually for performance reasons).

$this->addError($name, $error)
  - Add a specific error name and value to the component's error bag manually.

$this->resetValidation()
  - Reset the currently stored validation errors (clear them).

$this->fill([...$propertyData])
  - Set public property names to provided values in bulk.

$this->reset()
  - Reset all public properties to their initial (pre-mount) state.

$this->reset($field)
  - Reset a specific public property to its pre-mount state.

$this->reset([...$fields])
  - Reset multiple specific properties.

$this->all()
  - Return key->value pairs of property data.

$this->only([...$propertyNames])
  - Return key->value pairs of property data only for a specific set of property names.

$this->except([...$propertyNames])
  - Return key->value pairs of property data except for a specific set of property names.
```

--------------------------------

### Include Turbolinks Adapter for Turbolinks Support

Source: https://laravel-livewire.com/docs/2.x/upgrading

Livewire v2 no longer includes Turbolinks support out-of-the-box. To continue using Turbolinks, you must manually include the `@livewireScripts` and the separate Turbolinks adapter JavaScript asset.

```HTML
...
@livewireScripts
    <script src="https://cdn.jsdelivr.net/gh/livewire/turbolinks@v0.1.x/dist/livewire-turbolinks.js" data-turbolinks-eval="false"></script>
</body>

```

--------------------------------

### Laravel Livewire Artisan Commands

Source: https://laravel-livewire.com/docs/2.x/reference

Provides a set of Artisan commands for managing Livewire components, including creation, copying, moving, and deletion. These commands streamline common development tasks within a Laravel project.

```Shell
artisan make:livewire
artisan livewire:make
artisan livewire:copy
artisan livewire:move
artisan livewire:delete
artisan livewire:touch
artisan livewire:cp
artisan livewire:mv
artisan livewire:rm
artisan livewire:stubs
artisan livewire:publish
artisan livewire:publish --assets
artisan livewire:configure-s3-upload-cleanup
```

--------------------------------

### Livewire Prefetching with wire:click.prefetch

Source: https://laravel-livewire.com/docs/2.x/prefetching

Enables fetching Livewire action results on mouseover. Use the `wire:click.prefetch` directive on an element. This is suitable for actions without side-effects; using it with side-effecting actions can lead to unpredictable execution.

```Blade
<button wire:click.prefetch="toggleContent">Show Content</button>

@if ($contentIsVisible)
    <span>Some Content...</span>
@endif
```

--------------------------------

### Test Livewire Component with Query String Parameters

Source: https://laravel-livewire.com/docs/2.x/testing

Tests Livewire components that utilize the `$queryString` property by simulating query string parameters. The `Livewire::withQueryParams` helper allows you to pass an array of parameters to the test, enabling verification of how the component reacts to URL changes.

```PHP
use Tests\TestCase;
use Livewire\Livewire;
use App\Http\Livewire\ShowFoo;

class CreatePostTest extends TestCase
{
    /** @test */
    function post_creation_page_contains_livewire_component() {
        Livewire::withQueryParams(['foo'=>'bar'])
            ->test(ShowFoo::class)
            ->assertSet('foo','bar')
            ->assertSee('bar');
    }
}
```

--------------------------------

### Livewire Basic File Upload Component (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Demonstrates how to use the `WithFileUploads` trait in a Livewire component to handle single file uploads. It includes validation for the uploaded file and a method to store it.

```php
use Livewire\WithFileUploads;

class UploadPhoto extends Component
{
    use WithFileUploads;

    public $photo;

    public function save()
    {
        $this->validate([
            'photo' => 'image|max:1024', // 1MB Max
        ]);

        $this->photo->store('photos');
    }
}
```

```html
<form wire:submit.prevent="save">
    <input type="file" wire:model="photo">

    @error('photo') <span class="error">{{ $message }}</span> @enderror

    <button type="submit">Save Photo</button>
</form>
```

--------------------------------

### Emitting Livewire Events with Parameters (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

Demonstrates how to emit a Livewire event from a component, optionally passing parameters. These parameters are then received by the listener method in the target component.

```PHP
$this->emit('postAdded',$post->id);
```

--------------------------------

### Receiving Livewire Events with Parameters (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

Shows how a Livewire component can listen for an event and receive parameters passed during emission. The parameters are defined as arguments in the listener method.

```PHP
class ShowPosts extends Component
{
    public $postCount;
    public $recentlyAddedPost;

    protected $listeners = ['postAdded'];

    public function postAdded(Post $post)
    {
        $this->postCount = Post::count();
        $this->recentlyAddedPost = $post;
    }
}
```

--------------------------------

### Render Livewire Component with <livewire:tag>

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Demonstrates the most basic way to render a Livewire component on a page using the `<livewire:` tag syntax. This method is straightforward for embedding components directly within Blade views.

```html
<livewire:show-posts />
```

--------------------------------

### Render Livewire Component with Namespace

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Explains how to render a Livewire component located in a sub-folder by using a dot-prefixed namespace. This is essential for organizing components within your project structure.

```html
<livewire:nav.show-posts />
```

--------------------------------

### Generate Livewire Component with Test

Source: https://laravel-livewire.com/docs/2.x/making-components

Creates a new Livewire component and automatically generates a corresponding test file. This is useful for setting up unit or feature tests from the outset.

```php
php artisan make:livewire ShowPosts --test
```

--------------------------------

### Dependency Injection in mount()

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Dependencies can be injected into the mount() method by type-hinting parameters. This allows components to access services like the SessionManager for advanced operations.

```PHP
use \Illuminate\Session\SessionManager;

class ShowPost extends Component
{
    public $title;
    public $content;

    public function mount(SessionManager $session, $post)
    {
        $session->put("post.{$post->id}.last_viewed", now());

        $this->title = $post->title;
        $this->content = $post->content;
    }

    ...
}
```

--------------------------------

### Generate a Livewire Component

Source: https://laravel-livewire.com/docs/2.x/quickstart

Creates a new Livewire component using the Artisan CLI. This command generates both the PHP class and the corresponding Blade view file.

```shell
php artisan make:livewire counter
```

--------------------------------

### Livewire 2.x Component Testing API

Source: https://laravel-livewire.com/docs/2.x/testing

Comprehensive API documentation for Livewire 2.x testing methods, covering component interaction, property manipulation, event assertions, view assertions, and error handling. These methods are used to simulate user interactions and assert component behavior within tests.

```APIDOC
Livewire::actingAs($user)
  - Sets the provided user as the session's logged-in user for the test.
  - Parameters:
    - $user: The user instance to act as.

Livewire::withQueryParams(['foo'=>'bar'])
  - Sets query parameters for the Livewire component's `$queryString` property to pick up.
  - Parameters:
    - array: An associative array of query parameters.

Livewire::test('component-name', ['param' => $value])
  - Tests a Livewire component by name, optionally passing initial parameters.
  - Parameters:
    - component-name: The name of the Livewire component to test.
    - array: (Optional) An associative array of initial parameters for the component.

->set('property', 'value')
  - Sets a public property (`public $property`) of the component to a specified value.
  - Parameters:
    - property: The name of the component property.
    - value: The value to set the property to.

->toggle('property')
  - Toggles a boolean public property (`public $property`) of the component between true and false.
  - Parameters:
    - property: The name of the boolean component property.

->call('method-name', [param1, param2, ...])
  - Calls a method on the component, optionally passing parameters.
  - Parameters:
    - method-name: The name of the method to call.
    - ...: (Optional) Any number of parameters to pass to the method.

->emit('event-name', [param1, param2, ...])
  - Fires an event from the component, optionally passing parameters.
  - Parameters:
    - event-name: The name of the event to emit.
    - ...: (Optional) Any number of parameters to pass with the event.

->assertSet('property', 'value')
  - Asserts that a component property (including computed properties) is set to a specific value.
  - Parameters:
    - property: The name of the component property.
    - value: The expected value of the property.

->assertNotSet('property', 'value')
  - Asserts that a component property (including computed properties) is NOT set to a specific value.
  - Parameters:
    - property: The name of the component property.
    - value: The value the property should NOT be.

->assertCount('property', count)
  - Asserts that a component property (an array, including computed properties) has a specific count.
  - Parameters:
    - property: The name of the array property.
    - count: The expected number of elements in the array.

->assertPayloadSet('property', 'value')
  - Asserts that a property from the JavaScript payload returned by Livewire is set to a specific value.
  - Parameters:
    - property: The name of the property in the payload.
    - value: The expected value of the payload property.

->assertPayloadNotSet('property', 'value')
  - Asserts that a property from the JavaScript payload returned by Livewire is NOT set to a specific value.
  - Parameters:
    - property: The name of the property in the payload.
    - value: The value the payload property should NOT be.

->assertViewIs('view-name')
  - Asserts that a specific view is the currently rendered view by the component.
  - Parameters:
    - view-name: The name of the expected view.

->assertViewHas('key', 'value')
  - Asserts that the rendered view has a specific key with a specific value.
  - Parameters:
    - key: The key expected in the view data.
    - value: The expected value associated with the key.

->assertSee('string')
  - Asserts that a given string exists in the currently rendered content of the component.
  - Parameters:
    - string: The string expected to be present.

->assertDontSee('string')
  - Asserts that a given string DOES NOT exist in the currently rendered content of the component.
  - Parameters:
    - string: The string expected to be absent.

->assertSeeHtml('html-string')
  - Asserts that a given HTML string exists in the currently rendered HTML of the component.
  - Parameters:
    - html-string: The HTML string expected to be present.

->assertDontSeeHtml('html-string')
  - Asserts that a given HTML string DOES NOT exist in the currently rendered HTML of the component.
  - Parameters:
    - html-string: The HTML string expected to be absent.

->assertSeeInOrder(['string1', 'string2'])
  - Asserts that multiple strings exist in the currently rendered content in the specified order.
  - Parameters:
    - array: An array of strings expected to be present in order.

->assertSeeHtmlInOrder(['html1', 'html2'])
  - Asserts that multiple HTML strings exist in the currently rendered HTML in the specified order.
  - Parameters:
    - array: An array of HTML strings expected to be present in order.

->assertEmitted('event-name', [param1, param2, ...])
  - Asserts that a specific event was emitted by the component, optionally with specific parameters.
  - Parameters:
    - event-name: The name of the event expected to be emitted.
    - ...: (Optional) Parameters expected to be passed with the event.

->assertNotEmitted('event-name')
  - Asserts that a specific event was NOT emitted by the component.
  - Parameters:
    - event-name: The name of the event expected to be absent.

->assertEmittedTo('component-name', 'event-name')
  - Asserts that a specific event was emitted to a particular Livewire component.
  - Parameters:
    - component-name: The name of the target component.
    - event-name: The name of the event expected to be emitted to the component.

->assertHasErrors('property')
  - Asserts that a specific property has validation errors.
  - Parameters:
    - property: The name of the property expected to have errors.

->assertHasErrors(['property1', 'property2'])
  - Asserts that multiple specified properties have validation errors.
  - Parameters:
    - array: An array of property names expected to have errors.

->assertHasErrors(['property' => 'rule'])
  - Asserts that a specific property has a validation error for a given rule.
  - Parameters:
    - array: An associative array where keys are property names and values are rule names.

->assertHasErrors(['property' => ['rule1', 'rule2']])
  - Asserts that a specific property has validation errors for multiple given rules.
  - Parameters:
    - array: An associative array where keys are property names and values are arrays of rule names.

->assertHasNoErrors('property')
  - Asserts that a specific property has no validation errors.
  - Parameters:
    - property: The name of the property expected to have no errors.

->assertHasNoErrors(['property1', 'property2'])
  - Asserts that multiple specified properties have no validation errors.
  - Parameters:
    - array: An array of property names expected to have no errors.

->assertNotFound()
  - Asserts that an error within the component caused a 404 Not Found status code.

->assertRedirect('/some-path')
  - Asserts that a redirect was triggered from the component to a specific path.
  - Parameters:
    - path: The expected redirect path.

->assertNoRedirect()
  - Asserts that no redirect was triggered from the component.

->assertUnauthorized()
  - Asserts that an error within the component caused a 401 Unauthorized status code.

->assertForbidden()
  - Asserts that an error within the component caused a 403 Forbidden status code.

->assertStatus(code)
  - Asserts that an error within the component caused a specific HTTP status code.
  - Parameters:
    - code: The expected HTTP status code (e.g., 500).
```

--------------------------------

### Livewire Component Class Lifecycle Hooks

Source: https://laravel-livewire.com/docs/2.x/reference

Provides a comprehensive list of lifecycle hooks available in Livewire component classes, detailing their execution order and purpose.

```APIDOC
Livewire Component Class Lifecycle Hooks:

boot()
  - Called on all requests, immediately after the component is instantiated, but before any other lifecycle methods are called.

booted()
  - Called on all requests, after the component is mounted or hydrated, but before any update methods are called.

mount(...$params)
  - Called when a Livewire component is newed up (think of it like a constructor).

hydrate()
  - Called on subsequent Livewire requests after the component has been hydrated, but before any other action occurs.

hydrateFoo()
  - Runs after a property called $foo is hydrated.

dehydrate()
  - Called after render(), but before the component has been dehydrated and sent to the frontend.

dehydrateFoo()
  - Runs before a property called $foo is dehydrated.

updating()
  - Runs before any update to the Livewire component's data (Using wire:model, not directly inside PHP).

updated($field, $newValue)
  - Called after a property has been updated.

updatingFoo()
  - Runs before a property called $foo is updated.

updatedFoo($newValue)
  - Called after the "foo" property has been updated.

updatingFooBar()
  - Runs before updating a nested property bar on the $foo property.

updatedFooBar($newValue)
  - Called after the nested "bar" key on the "foo" property has been updated.

render()
  - Called before "dehydrate" and renders the Blade view for the component.
```

--------------------------------

### Configure Livewire Asset Base URL in PHP

Source: https://laravel-livewire.com/docs/2.x/installation

This configuration option in `config/livewire.php` allows you to specify a custom URL prefix for Livewire's JavaScript assets. It's essential when your application is hosted on a non-root domain path (e.g., `yourdomain.com/app`) or when you've published Livewire assets to a sub-directory (e.g., `/assets`). Setting this correctly ensures the `livewire.js` script is loaded from the expected location.

```php
'asset_url' => '/application'
```

```php
'asset_url' => '/assets'
```

--------------------------------

### Include Livewire Assets using Tag Syntax

Source: https://laravel-livewire.com/docs/2.x/installation

An alternative method to include Livewire's assets using custom Blade component tags. This provides a more concise way to inject the required scripts and styles into your views.

```Blade
<livewire:styles />
...
<livewire:scripts />
```

--------------------------------

### Customizing Component Stubs (`livewire:stubs`)

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

The `livewire:stubs` command generates template files for Livewire components, allowing developers to customize the default structure of generated classes and views. These stubs are then used by the `make:livewire` command.

```php
php artisan livewire:stubs
```

--------------------------------

### Livewire Temporary Preview URLs for Images

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Illustrates how to provide a temporary preview of an uploaded image before the final submission. It utilizes the `->temporaryUrl()` method on the uploaded file object, which generates a secure, time-limited URL for displaying the image.

```php
use Livewire\WithFileUploads;

class UploadPhotoWithPreview extends Component
{
    use WithFileUploads;

    public $photo;

    public function updatedPhoto()
    {
        $this->validate([
            'photo'=>'image|max:1024',
        ]);
    }

    public function save()
    {
        // ...
    }
}
```

```html
<form wire:submit.prevent="save">
    @if ($photo)
        Photo Preview:
        <img src="{{ $photo->temporaryUrl() }}">
    @endif

    <input type="file" wire:model="photo">

    @error('photo') <span class="error">{{ $message }}</span> @enderror

    <button type="submit">Save Photo</button>
</form>
```

--------------------------------

### HTML for Eloquent Collection Binding

Source: https://laravel-livewire.com/docs/2.x/properties

Provides the HTML structure for iterating over a collection of models and binding to their properties. It uses `@foreach` and `wire:key` for efficient updates, with `wire:model` referencing the index of each post in the collection (e.g., `posts.{{ $index }}.title`).

```HTML
<form wire:submit.prevent="save">
    @foreach ($posts as $index => $post)
        <div wire:key="post-field-{{ $post->id }}">
            <input type="text" wire:model="posts.{{ $index }}.title">

            <textarea wire:model="posts.{{ $index }}.content"></textarea>
        </div>
    @endforeach

    <button type="submit">Save</button>
</form>
```

--------------------------------

### Implement Livewire Pagination with WithPagination Trait

Source: https://laravel-livewire.com/docs/2.x/pagination

Demonstrates how to use the `WithPagination` trait in a Livewire component to paginate Eloquent query results. It shows the PHP code for the component and the Blade template for displaying posts and pagination links.

```php
use Livewire\WithPagination;

class ShowPosts extends Component
{
    use WithPagination;

    public function render()
    {
        return view('livewire.show-posts',
            ['posts' => Post::paginate(10)]
        );
    }
}
```

```blade
<div>
    @foreach ($posts as $post)
        ...
    @endforeach

    {{ $posts->links() }}
</div>
```

--------------------------------

### Global Livewire JavaScript API

Source: https://laravel-livewire.com/docs/2.x/reference

Methods available on the `window.Livewire` object for frontend interaction and customization. These allow direct manipulation and observation of Livewire components from JavaScript.

```APIDOC
Livewire JavaScript API:

Livewire.first()
  - Get the first Livewire component's JS object on the page.

Livewire.find(componentId)
  - Get a Livewire component by its ID.
  - Parameters:
    - componentId: The unique ID of the Livewire component.

Livewire.all()
  - Get all the Livewire components on a page.

Livewire.directive(directiveName, callback)
  - Register a new Livewire directive (e.g., `wire:custom-directive`).
  - Parameters:
    - directiveName: The name of the directive to register.
    - callback: A function that will be executed when the directive is encountered.
      - el: The DOM element the directive is attached to.
      - directive: The directive object itself.
      - component: The Livewire component instance.

Livewire.hook(hookName, callback)
  - Call a method when a JavaScript lifecycle hook is fired. Allows hooking into specific parts of Livewire's JS lifecycle.
  - Parameters:
    - hookName: The name of the lifecycle hook to listen for.
    - callback: The function to execute when the hook fires.

Livewire.onLoad(callback)
  - Fires when Livewire is first finished loading on a page.
  - Parameters:
    - callback: The function to execute on load.

Livewire.onError(callback)
  - Fires when a Livewire request fails.
  - Parameters:
    - callback: A function that receives the error message and status code.
      - message: The error message from the request.
      - statusCode: The HTTP status code of the failed request.
  - Returns:
    - Returning `false` from the callback prevents Livewire's default error handling behavior.

Livewire.onPageExpired(callback)
  - Executes a callback when the page or session has expired, instead of Livewire's default page expired dialog.
  - Parameters:
    - callback: A function that receives the response and message.
      - response: The response object from the expired request.
      - message: The message associated with the expiration.

Livewire.emit(eventName, ...params)
  - Emit an event to all Livewire components listening on the current page.
  - Parameters:
    - eventName: The name of the event to emit.
    - params: Any arguments to pass with the event.

Livewire.emitTo(componentName, eventName, ...params)
  - Emit an event to a specific Livewire component by its name.
  - Parameters:
    - componentName: The name of the target Livewire component.
    - eventName: The name of the event to emit.
    - params: Any arguments to pass with the event.

Livewire.on(eventName, callback)
  - Listen for an event to be emitted from a Livewire component.
  - Parameters:
    - eventName: The name of the event to listen for.
    - callback: The function to execute when the event is received.
      - params: Any arguments emitted with the event.

Livewire.start()
  - Boot Livewire on the page. This is typically done automatically via `@livewireScripts`.

Livewire.stop()
  - Tear down Livewire from the page, unregistering listeners and cleaning up components.

Livewire.restart()
  - Stop Livewire, then start it again on the page.

Livewire.rescan()
  - Re-scan the DOM for newly added Livewire components and initialize them.
```

--------------------------------

### Run PHPUnit Tests

Source: https://laravel-livewire.com/docs/2.x/contribution-guide

Executes all PHPUnit tests to verify the project's integrity. This command is crucial for ensuring that changes do not introduce regressions.

```shell
phpunit
```

--------------------------------

### $wire API for Livewire-Alpine Interaction

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Provides the full API for the `$wire` object, which allows Alpine.js components to interact with Livewire components. It covers accessing properties, calling methods, emitting events, and handling uploads.

```APIDOC
$wire API for Livewire-Alpine Interaction:

// Accessing a Livewire property
$wire.foo

// Calling a Livewire method
$wire.someMethod(someParam)

// Calling a Livewire method and handling its result with .then()
$wire.someMethod(someParam).then(result => { ... })

// Calling a Livewire method and storing its response using async/await
let foo = await $wire.getFoo()

// Emitting a Livewire event
$wire.emit('some-event', 'foo', 'bar')

// Listening for a Livewire event
$wire.on('some-event', (foo, bar) => { ... })

// Getting a Livewire property
$wire.get('property')

// Setting a Livewire property
$wire.set('property', value)

// Defer setting a Livewire property
$wire.set('property', value, true)

// Calling a Livewire action (alias for calling a method)
$wire.call('someMethod', param)

// Uploading a file
$wire.upload(
    'property',
    file,
    finishCallback=(uploadedFilename) => {},
    errorCallback=() => {},
    progressCallback=(event) => {}
)

// Uploading multiple files
$wire.uploadMultiple(
    'property',
    files,
    finishCallback=(uploadedFilenames) => {},
    errorCallback=() => {},
    progressCallback=(event) => {}
)

// Removing an uploaded file
$wire.removeUpload(
    'property',
    uploadedFilename,
    finishCallback=(uploadedFilename) => {},
    errorCallback=() => {}
)

// Accessing the underlying Livewire component JavaScript instance
$wire.__instance
```

--------------------------------

### Target Multiple Livewire Actions

Source: https://laravel-livewire.com/docs/2.x/loading-states

Allows targeting multiple specific Livewire actions by providing a comma-separated list of action names to the `wire:target` directive.

```html
<div wire:loading wire:target="foo, bar">...</div>
```

--------------------------------

### Copy Livewire Component using Artisan

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

The `php artisan livewire:copy` command creates copies of a Livewire component's class and Blade view, handling namespaces and paths. It supports options like `--force` to overwrite existing files and `--test` to include test files. The command is aliased to `livewire:cp` for convenience.

```php
php artisan livewire:copy foobar
# Copies Foo.php & foo.blade.php to Bar.php and bar.blade.php

php artisan livewire:copy foobar --force
# Overwrites existing "bar" component

php artisan livewire:copy foobar --test
# Copies Foo.php & foo.blade.php & FooTest.php to Bar.php & bar.blade.php & BarTest.php
```

--------------------------------

### Generate a Livewire Component

Source: https://laravel-livewire.com/docs/2.x/index

Creates a new Livewire component using the Artisan CLI. This command generates both the PHP class and the corresponding Blade view file.

```shell
php artisan make:livewire counter
```

--------------------------------

### Trigger File Download in Blade

Source: https://laravel-livewire.com/docs/2.x/file-downloads

Shows how to trigger a Livewire component action that initiates a file download using a button. The `wire:click` directive calls the component's `export` method.

```Blade
<button wire:click="export">
    Download File
</button>
```

--------------------------------

### Livewire PHP Testing Assertions

Source: https://laravel-livewire.com/docs/2.x/reference

Provides a comprehensive list of assertion methods available on Livewire's testing trait for verifying component state, rendered output, and dispatched events.

```APIDOC
Livewire Testing Assertions:

Component State Assertions:
  ->assertSet($propertyName, $value)
    - Asserts that a component property is set to a specific value.
  ->assertNotSet($propertyName, $value)
    - Asserts that a component property is NOT set to a specific value.
  ->assertCount($propertyName, $value)
    - Asserts that a component property (typically an array or collection) has a specific count.
  ->assertPayloadSet($propertyName, $value)
    - Asserts that a property exists in the component's payload with a specific value.
  ->assertPayloadNotSet($propertyName, $value)
    - Asserts that a property does NOT exist in the component's payload or has a different value.

Rendering Assertions:
  ->assertSee($string)
    - Asserts that the rendered component output contains the given string.
  ->assertDontSee($string)
    - Asserts that the rendered component output does NOT contain the given string.
  ->assertSeeHtml($string)
    - Asserts that the rendered component output contains the given HTML string.
  ->assertDontSeeHtml($string)
    - Asserts that the rendered component output does NOT contain the given HTML string.
  ->assertSeeHtmlInOrder([$firstString, $secondString])
    - Asserts that the rendered component output contains the given HTML strings in the specified order.
  ->assertSeeInOrder([$firstString, $secondString])
    - Asserts that the rendered component output contains the given strings in the specified order.

Event Assertions:
  ->assertEmitted($eventName)
    - Asserts that a specific event was emitted by the component.
  ->assertNotEmitted($eventName)
    - Asserts that a specific event was NOT emitted by the component.
  ->assertDispatchedBrowserEvent($eventName)
    - Asserts that a browser event was dispatched from the component.

Validation Assertions:
  ->assertHasErrors($propertyName)
    - Asserts that a specific property has validation errors.
  ->assertHasErrors($propertyName, ['required', 'min:6'])
    - Asserts that a specific property has specific validation errors.
  ->assertHasNoErrors($propertyName)
    - Asserts that a specific property has no validation errors.
  ->assertHasNoErrors($propertyName, ['required', 'min:6'])
    - Asserts that a specific property does not have the specified validation errors.

Redirection Assertions:
  ->assertRedirect()
    - Asserts that a redirect occurred.
  ->assertRedirect($url)
    - Asserts that a redirect occurred to a specific URL.

View Data Assertions:
  ->assertViewHas($viewDataKey)
    - Asserts that a specific key exists in the view data.
  ->assertViewHas($viewDataKey, $expectedValue)
    - Asserts that a specific key exists in the view data with an expected value.
  ->assertViewHas($viewDataKey, function ($dataValue) {})
    - Asserts that a specific key exists in the view data and passes a callback for further validation.
  ->assertViewIs('livewire.some-view-name')
    - Asserts that the component is rendering a specific view.

File Assertions:
  ->assertFileDownloaded($filename)
    - Asserts that a file was downloaded with the given filename.

Laravel Testing Response Helpers:
  $response->assertSeeLivewire('some-component')
    - Asserts that a specific Livewire component is present in the response.
  $response->assertDontSeeLivewire('some-component')
    - Asserts that a specific Livewire component is NOT present in the response.
```

--------------------------------

### Register Livewire Components with Routes

Source: https://laravel-livewire.com/docs/2.x/upgrading

Livewire v2 replaces the `Route::livewire()` method with the standard Laravel `Route::get()` method. Components are registered using their fully qualified class names, aligning with Laravel's routing conventions.

```PHP
// Before
Route::livewire('/post', 'show-posts');

// After
Route::get('/post', AppHttpLivewireShowPosts::class);

```

--------------------------------

### Inline Livewire Component Structure (PHP)

Source: https://laravel-livewire.com/docs/2.x/making-components

Illustrates the structure of an inline Livewire component in PHP. This class extends `Livewire\Component` and defines a `render` method that returns inline Blade content directly.

```php
class ShowPostsextendsComponent
{
    publicfunctionrender()
    {
        return<<<'blade'
            <div></div>
blade;
    }
}
```

--------------------------------

### Include Livewire JavaScript and Styles

Source: https://laravel-livewire.com/docs/2.x/quickstart

Adds the necessary Livewire JavaScript and CSS assets to your application's layout. These directives should be placed in your main Blade layout file.

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livewire App</title>
    @livewireStyles
</head>
<body>
    ...
    @livewireScripts
</body>
</html>
```

--------------------------------

### Livewire: Use wire:key in Loops

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Demonstrates how to use the `wire:key` directive within loops to help Livewire track DOM elements efficiently. This is crucial for preventing issues with dynamic lists and nested components.

```blade
<ul>
    @foreach ($items as $item)
        <li wire:key="item-{{ $item->id }}">{{ $item }}</li>
    @endforeach
</ul>
```

```blade
<ul>
    @foreach ($items as $item)
        @livewire('view-item', ['item' => $item], key('item-'.$item->id))
        <!-- key() using Laravel 7's tag syntax -->
        <livewire:view-item:item="$item":wire:key="'item-'.$item->id">
    @endforeach
</ul>
```

--------------------------------

### Livewire Component Generation (`make:livewire`)

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

The `make:livewire` command generates Livewire component classes and Blade views. It supports various naming conventions and options like `--inline` for class-only generation or `--test` to include a test file.

```php
php artisan make:livewire foo
# Creates Foo.php & foo.blade.php

php artisan make:livewire foo-bar
# Creates FooBar.php & foo-bar.blade.php

php artisan make:livewire Foo
# Creates Foo.php & foo.blade.php

php artisan make:livewire FooBar
# Creates FooBar.php & foo-bar.blade.php

php artisan make:livewire foo.bar
# Creates Foo/Bar.php & foo/bar.blade.php

php artisan make:livewire foo --inline
# Creates only Foo.php

php artisan make:livewire foo --test
# Creates Foo.php, foo.blade.php, & FooTest.php
```

--------------------------------

### Target Livewire Actions with Parameters

Source: https://laravel-livewire.com/docs/2.x/loading-states

Enables targeting of Livewire actions that accept specific parameters. The `wire:target` directive can include the method name and its parameters.

```html
<div>
    <button wire:click="update('bob')">Update</button>

    <div wire:loading wire:target="update('bob')">
        Updating Bob...
    </div>
</div>
```

--------------------------------

### Update Composer Dependencies and Assets

Source: https://laravel-livewire.com/docs/2.x/upgrading

Instructions to update the Livewire package via Composer, clear cached views, and republish assets if they were previously published. This ensures the project uses the latest Livewire 2.x version and its associated assets.

```bash
composer update livewire/livewire
php artisan view:clear
php artisan livewire:publish --assets
```

--------------------------------

### Livewire Component: CreatePost

Source: https://laravel-livewire.com/docs/2.x/testing

This PHP code defines a Livewire component responsible for creating posts. It includes public properties for data binding, validation rules, and a method to handle the post creation logic, including saving to the database and redirecting.

```PHP
class CreatePost extends Component
{
    public $title;

    protected $rules = [
        'title' => 'required',
    ];

    public function create()
    {
        auth()->user()->posts()->create(
            $this->validate()
        );

        return redirect()->to('/posts');
    }
}
```

--------------------------------

### Standard Echo Channel Listening

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

Illustrates the conventional method of listening for a broadcasted event using Laravel Echo in a JavaScript client. It connects to a channel and listens for a specific event, executing a callback upon reception.

```JavaScript
Echo.channel('orders')
    .listen('OrderShipped', (e) => {
        console.log(e.order.name);
    });
```

--------------------------------

### Livewire: Returning Template Strings from Render (PHP)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Demonstrates returning an inline Blade template string directly from the `render` method. This is useful for simple components or when generating HTML dynamically. The `--inline` flag is recommended for components created this way.

```PHP
use App\Models\Post;

class DeletePost extends Component
{
    public Post $post;

    public function delete()
    {
        $this->post->delete();
    }

    public function render()
    {
        return <<<'blade'
            <div>
                <button wire:click="delete">Delete Post</button>
            </div>
blade;
    }

}
```

--------------------------------

### Pass Parameters to Livewire Component with <livewire:tag>

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Illustrates how to pass data into a Livewire component using the `<livewire:` tag syntax by including additional parameters. This allows for dynamic data injection into components.

```html
<livewire:show-post:post="$post">
```

--------------------------------

### Target Livewire Model Synchronization

Source: https://laravel-livewire.com/docs/2.x/loading-states

Displays a loading indicator whenever a specific `wire:model` property is synchronized with the server, indicating data updates.

```html
<div>
    <input wire:model="quantity">

    <div wire:loading wire:target="quantity">
        Updating quantity...
    </div>
</div>
```

--------------------------------

### Livewire Multiple File Upload Component (PHP)

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Illustrates how to handle multiple file uploads in Livewire by adding the `multiple` attribute to the file input. The component code shows how to manage an array of files and validate each one.

```php
use Livewire\WithFileUploads;

class UploadPhotos extends Component
{
    use WithFileUploads;

    public $photos = [];

    public function save()
    {
        $this->validate([
            'photos.*' => 'image|max:1024', // 1MB Max
        ]);

        foreach ($this->photos as $photo) {
            $photo->store('photos');
        }
    }
}
```

```html
<form wire:submit.prevent="save">
    <input type="file" wire:model="photos" multiple>

    @error('photos.*') <span class="error">{{ $message }}</span> @enderror

    <button type="submit">Save Photo</button>
</form>
```

--------------------------------

### Livewire Echo Listener for Model Broadcasting

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

Provides guidance on correctly configuring Livewire Echo listeners when using Laravel's Model Broadcasting feature. It specifies that model-related events must be prefixed with a dot ('.') to ensure proper matching.

```APIDOC
When using Model Broadcasting with Livewire Echo listeners:

Prefix the event name with a '.' to listen for the correct event.
Example for a `MessageCreated` model event:

`echo:channel,'.MessageCreated'`
```

--------------------------------

### Livewire Echo Event Listener via getListeners()

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

Demonstrates how to dynamically register Laravel Echo event listeners in a Livewire component by implementing the `getListeners()` method. This is useful for channels that include dynamic variables, such as an order ID.

```PHP
class OrderTracker extends Component
{
    public $showNewOrderNotification = false;
    public $orderId;

    public function getListeners()
    {
        return [
            "echo:orders.{$this->orderId},OrderShipped" => 'notifyNewOrder',
        ];
    }

    public function notifyNewOrder()
    {
        $this->showNewOrderNotification = true;
    }
}
```

--------------------------------

### Intercepting Parameters with mount()

Source: https://laravel-livewire.com/docs/2.x/rendering-components

For more control, parameters can be intercepted within the component's mount() method. This method is called only on the initial component mount, allowing custom logic before rendering.

```PHP
class ShowPost extends Component
{
    public $title;
    public $content;

    public function mount($post)
    {
        $this->title = $post->title;
        $this->content = $post->content;
    }

    ...
}
```

--------------------------------

### Configure S3 Upload Cleanup Command

Source: https://laravel-livewire.com/docs/2.x/file-uploads

An Artisan command to configure automatic cleanup of temporary files older than 24 hours in S3. This command is only necessary if you are using S3 for uploads; Livewire handles cleanup automatically otherwise.

```Shell
php artisan livewire:configure-s3-upload-cleanup
```

--------------------------------

### Livewire: Route Parameters in Mount Method (PHP)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Demonstrates how to access route parameters within a Livewire component's `mount` method, mimicking controller behavior. The parameter from the route definition is directly passed to the `mount` method.

```PHP
use App\Http\Livewire\ShowPost;
use App\Models\Post;
use Illuminate\Support\Facades\Route;

Route::get('/post/{id}', ShowPost::class);

class ShowPost extends Component
{
    public $post;

    public function mount($id)
    {
        $this->post = Post::find($id);
    }

    // ...
}
```

--------------------------------

### Key Livewire Components in Loop (Blade)

Source: https://laravel-livewire.com/docs/2.x/nesting-components

Explains how to use the `key()` directive when rendering Livewire components within a loop to help Livewire track component instances. This is essential for dynamic lists to prevent unexpected behavior.

```html
<div>
    @foreach ($users as $user)
        @livewire('user-profile', ['user' => $user], key($user->id))
    @endforeach
</div>

```

--------------------------------

### Livewire Loading Indicator for File Uploads

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Displays a loading indicator scoped to a file upload using the `wire:loading` and `wire:target` directives. The indicator is shown while the file is being uploaded and hidden upon completion.

```HTML
<input type="file" wire:model="photo">

<div wire:loading wire:target="photo">Uploading...</div>
```

--------------------------------

### Rendering Livewire Components

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

Livewire components can be rendered in Blade views using the `@livewire` directive or the `<livewire:...>` tag syntax. The directive accepts component names as strings or class instances, while the tag syntax offers a more concise approach for Laravel 7+.

```blade
@livewire('foo')
@livewire('foo-bar')
@livewire('foo.bar')
@livewire(Package\Livewire\Foo::class)

<livewire:foo />
```

--------------------------------

### Routing Full-Page Components

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Livewire components can be rendered as full-page applications by passing the component class directly to a Laravel route. This treats the component similarly to a controller.

```PHP
Route::get('/post', ShowPosts::class);
```

--------------------------------

### Use AlpineJS within Livewire Components

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Demonstrates how to integrate AlpineJS directly into Livewire component views for interactive elements like dropdowns. It shows how Alpine's `x-data` and `@click` directives can control Livewire actions and manage component state.

```blade
<div>
    ...

    <div x-data="{ open: false }">
        <button @click="open = true">Show More...</button>

        <ul x-show="open" @click.outside="open = false">
            <li><button wire:click="archive">Archive</button></li>
            <li><button wire:click="delete">Delete</button></li>
        </ul>
    </div>
</div>
```

--------------------------------

### Livewire Counter Component Class

Source: https://laravel-livewire.com/docs/2.x/index

Defines the server-side logic for the Livewire counter component. It initializes a public `$count` property and provides an `increment` method to increase it. The `render` method specifies the view to be displayed.

```PHP
1classCounterextendsComponent



 2{



 3public$count =0;



 4 



 5publicfunctionincrement()



 6{



 7$this->count++;



 8}



 9 



10publicfunctionrender()



11{



12returnview('livewire.counter');



13}



14}

        
```

--------------------------------

### Specifying Custom Layout Component

Source: https://laravel-livewire.com/docs/2.x/rendering-components

A custom layout component can be specified directly within the component's render() method using the `->layout()` method. This allows for dynamic layout selection.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->layout(App\View\Components\BaseLayout::class);
    }
    ...
}
```

--------------------------------

### Using Traditional Blade Layouts with extends()

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Livewire supports traditional Blade layout files using `@extends`. The `->extends()` method in the render() function specifies the parent Blade layout.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->extends('layouts.app');
    }
    ...
}
```

--------------------------------

### Include Livewire Assets in Blade Templates

Source: https://laravel-livewire.com/docs/2.x/installation

Includes the necessary Livewire JavaScript and CSS assets within your main Blade layout file. The `@livewireStyles` directive should be placed in the `<head>` section, and `@livewireScripts` before the closing `</body>` tag.

```Blade
<html>
<head>
    ...
    @livewireStyles
</head>
<body>
    ...
    @livewireScripts
</body>
</html>
```

--------------------------------

### Specifying Section for Blade Layouts

Source: https://laravel-livewire.com/docs/2.x/rendering-components

When using `->extends()`, you can also specify the `@section` where the component's content should be injected using the `->section()` method.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->extends('layouts.app')
            ->section('body');
    }
    ...
}
```

--------------------------------

### Include Livewire JavaScript and Styles

Source: https://laravel-livewire.com/docs/2.x/index

Adds the necessary Livewire JavaScript and CSS assets to your application's layout. These directives should be placed in your main Blade layout file.

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livewire App</title>
    @livewireStyles
</head>
<body>
    ...
    @livewireScripts
</body>
</html>
```

--------------------------------

### Assert File Downloaded (Livewire PHP)

Source: https://laravel-livewire.com/docs/2.x/testing

Asserts that a file download was initiated by the component. This method checks if the component returned a response that triggers a file download with the specified filename.

```PHP
$component->assertFileDownloaded($filename);
```

--------------------------------

### Target Specific Livewire Actions for Loading

Source: https://laravel-livewire.com/docs/2.x/loading-states

Displays a loading indicator only when specific Livewire actions (methods) are triggered. This is useful for complex components where not all actions require a visible loading state.

```html
<div>
    <button wire:click="checkout">Checkout</button>
    <button wire:click="cancel">Cancel</button>

    <div wire:loading wire:target="checkout">
        Processing Payment...
    </div>
</div>
```

--------------------------------

### Livewire 2.x: Using Custom Pagination Views

Source: https://laravel-livewire.com/docs/2.x/upgrading

If you need to use a specific pagination view, including the one from Livewire V1, you can copy the view source and reference it in your Blade view using the `->links()` method. This allows for complete control over the pagination UI.

```Blade
{{ $posts->links('pagination-links') }}
```

--------------------------------

### Configure Livewire S3 Upload Disk

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Sets the Livewire temporary file upload disk to 's3' in the `config/livewire.php` file. This directs file uploads to bypass the server and go directly to an S3 bucket.

```PHP
return [
    // ...
    'temporary_file_upload' => [
        'disk' => 's3',
        // ...
    ],
    // ...
];
```

--------------------------------

### Livewire File Upload Progress Indicator with AlpineJS

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Implements a progress bar for Livewire file uploads using AlpineJS to listen to Livewire's dispatched JavaScript events (`livewire-upload-start`, `livewire-upload-finish`, `livewire-upload-error`, `livewire-upload-progress`).

```JavaScript
<div
    x-data="{ isUploading: false, progress: 0 }"
    x-on:livewire-upload-start="isUploading = true"
    x-on:livewire-upload-finish="isUploading = false"
    x-on:livewire-upload-error="isUploading = false"
    x-on:livewire-upload-progress="progress = $event.detail.progress"
>
    <!-- File Input -->
    <input type="file" wire:model="photo">

    <!-- Progress Bar -->
    <div x-show="isUploading">
        <progress max="100" x-bind:value="progress"></progress>
    </div>
</div>
```

--------------------------------

### Livewire Magic Actions

Source: https://laravel-livewire.com/docs/2.x/actions

Livewire offers 'magic actions' prefixed with '$' for common component operations. These include $refresh to re-render, $set('property', value) to update properties, $toggle('property') to flip booleans, and $emit('event', ...params) to broadcast events.

```html
<button wire:click="$set('message', 'Hello')">Say Hi</button>
<button wire:click="$toggle('isEditing')">Toggle Edit Mode</button>
<button wire:click="$refresh">Refresh Component</button>
```

```php
class MyComponent extends Component
{
    public $message = 'Initial';
    public $isEditing = false;

    public function someMethodThatEmits()
    {
        $this->emit('userLoggedIn', ['userId' => 123]);
    }

    protected $listeners = [
        'userLoggedIn' => '$refresh'
    ];
}
```

--------------------------------

### Configure Authentication Guard Middleware

Source: https://laravel-livewire.com/docs/2.x/authorization

Shows how to add a custom authentication guard to the `middleware_group` in the Livewire configuration file. This is necessary when your application uses a different guard for authenticating users.

```php
...
'middleware_group'=>['web','auth:otherguard'],
...
```

--------------------------------

### Manage Query Strings in Livewire Traits (Method)

Source: https://laravel-livewire.com/docs/2.x/traits

Provides an alternative method-based approach to defining query string mappings within a Livewire PHP Trait. This method allows for more dynamic configuration of query string parameters, such as setting default values based on component state.

```PHP
trait WithSorting
{
    // ... other methods

    public function queryStringWithSorting()
    {
        return [
            'sortBy' => ['except' => 'id'],
            'sortDirection' => ['except' => $this->defaultSortDirection()],
        ];
    }
    
    // Assuming a helper method like this exists or is defined elsewhere
    protected function defaultSortDirection()
    {
        return 'asc';
    }
}
```

--------------------------------

### Livewire Query String Aliasing in PHP

Source: https://laravel-livewire.com/docs/2.x/query-string

Demonstrates how to alias component properties for URL representation using Livewire's $queryString property. This allows for shorter URL parameters, improving readability. The 'as' modifier maps a component property to a specific URL query string key.

```PHP
class SearchPosts extends Component
{
    public $search = '';
    public $page = 1;

    protected $queryString = [
        'search' => ['except' => '', 'as' => 's'],
        'page' => ['except' => 1, 'as' => 'p'],
    ];

    // ...
}
```

--------------------------------

### Use Custom Blade Component with Wire:Model

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Shows how a custom Blade component (`x-color-picker`) can be integrated into a Livewire component using `wire:model`. This illustrates passing data from a child component to a parent Livewire component.

```Blade
<div>
    <x-color-picker wire:model="color"/>
</div>
```

--------------------------------

### Livewire Counter Component Class (PHP)

Source: https://laravel-livewire.com/docs/2.x/quickstart

Defines the Livewire component class for a counter. It includes a public property `$count` initialized to 0 and an `increment` method to update it. The `render` method specifies the view to be displayed.

```php
class Counter extends Component
{
    public $count = 0;

    public function increment()
    {
        $this->count++;
    }

    public function render()
    {
        return view('livewire.counter');
    }
}
```

--------------------------------

### Specifying Custom Layout Slot

Source: https://laravel-livewire.com/docs/2.x/rendering-components

When using a custom layout component, you can also specify which slot the component's content should be rendered into using the `->slot()` method.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->layout('layouts.base')
            ->slot('main');
    }
    ...
}
```

--------------------------------

### Livewire Component View: Create Post Form

Source: https://laravel-livewire.com/docs/2.x/testing

This is the Blade template for the `CreatePost` Livewire component. It renders an HTML form with a Livewire submit handler and an input field that is bound to the component's `title` property using `wire:model`.

```Blade
<form wire:submit.prevent="create">
    <input wire:model="title" type="text">

    <button>Create Post</button>
</form>
```

--------------------------------

### Livewire Component PHP Class

Source: https://laravel-livewire.com/docs/2.x/quickstart

The server-side logic for a Livewire component. This PHP class handles rendering the component's view and managing its state.

```php
namespace App\Http\Livewire;

use Livewire\Component;

class Counter extends Component
{
    public function render()
    {
        return view('livewire.counter');
    }
}
```

--------------------------------

### Dispatch Input Event with Alpine for Livewire Model

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Demonstrates how to use Alpine.js's $dispatch('input', ...)` to update a Livewire component property (`$foo`) when buttons are clicked. This shows direct communication from Alpine to Livewire's `wire:model` by dispatching the 'input' event.

```Blade
<div>
    <div wire:model="foo">
        <button x-data @click="$dispatch('input', 'bar')">Set to "bar"</button>
        <button x-data @click="$dispatch('input', 'baz')">Set to "baz"</button>
    </div>
</div>
```

--------------------------------

### Moving/Renaming Livewire Components (`livewire:move`)

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

The `livewire:move` command (aliased as `livewire:mv`) is used to rename or move Livewire component classes, Blade views, and associated test files. It automatically handles namespace and path updates.

```php
php artisan livewire:move foobar.baz
# Foo.php|foo.blade.php|FooTest.php -> Bar/Baz.php|bar/baz.blade.php|Bar/BazTest.php
```

--------------------------------

### JavaScript Hooks: V1 vs V2 Comparison

Source: https://laravel-livewire.com/docs/2.x/upgrading

Compares the JavaScript hook usages between Livewire V1 and V2. V2 introduces new hook names and altered parameter orders for consistency. Note that 'response' objects in some hooks are now 'message' objects, with the response accessible via 'message.response'.

```JavaScript
Livewire.hook('component.initialized', (component) => {}) // V2
Livewire.hook('element.initialized', (el, component) => {}) // V2
Livewire.hook('element.updating', (fromEl, toEl, component) => {}) // V2
Livewire.hook('element.updated', (el, component) => {}) // V2
Livewire.hook('element.removed', (el, component) => {}) // V2
Livewire.hook('message.sent', (message, component) => {}) // V2
Livewire.hook('message.failed', (message, component) => {}) // V2
Livewire.hook('message.received', (message, component) => {}) // V2
Livewire.hook('message.processed', (message, component) => {}) // V2
```

--------------------------------

### Publish Livewire Pagination Views (Artisan)

Source: https://laravel-livewire.com/docs/2.x/pagination

This Artisan command publishes Livewire's default pagination views to your application's resources directory. This allows for direct modification of the default pagination markup, which can then be used by your components.

```shell
php artisan livewire:publish --pagination
```

--------------------------------

### Default Layout for Full-Page Components

Source: https://laravel-livewire.com/docs/2.x/rendering-components

By default, full-page components render into the {{ $slot }} of the `resources/views/layouts/app.blade.php` layout. This default can be overridden in the `livewire.php` configuration file.

```PHP
'layout'=>'app.other_default_layout'
```

--------------------------------

### Integrate Livewire Lifecycle Hooks into Traits

Source: https://laravel-livewire.com/docs/2.x/traits

Shows how to use Livewire's lifecycle hooks within a PHP Trait. By naming methods with a `WithTraitName` suffix (e.g., `bootWithSorting`), these hooks can be called from within the trait and executed alongside the component's own lifecycle methods.

```PHP
trait WithSorting
{
    // ... other methods

    public function bootWithSorting()
    {
        // Initialization logic for the trait
    }
    
    public function bootedWithSorting()
    {
        // Logic after component is booted
    }
    
    public function mountWithSorting()
    {
        // Logic for mounting the component
    }
    
    public function updatingWithSorting($name, $value)
    {
        // Logic before a property update
    }
    
    public function updatedWithSorting($name, $value)
    {
        // Logic after a property update
    }
    
    public function hydrateWithSorting()
    {
        // Logic when component is hydrated
    }
    
    public function dehydrateWithSorting()
    {
        // Logic when component is dehydrated
    }
    
    public function renderingWithSorting()
    {
        // Logic before rendering
    }
    
    public function renderedWithSorting($view)
    {
        // Logic after rendering
    }
}
```

--------------------------------

### Livewire: Unique wire:key Usage

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Illustrates the correct application of `wire:key` for DOM element tracking. The value must be unique per element on the page, often prefixed to avoid collisions, especially when dealing with collections.

```blade
<div wire:key="foo">...</div>
<div wire:key="bar">...</div>
```

--------------------------------

### Livewire Component Class Traits

Source: https://laravel-livewire.com/docs/2.x/reference

Lists available traits that extend Livewire component functionality, such as pagination and file uploads.

```APIDOC
Livewire Component Class Traits:

WithPagination
  - This trait enables Livewire-based pagination instead of Laravel's stock pagination system. [Read Docs](https://laravel-livewire.com/docs/2.x/pagination)

WithFileUploads
  - This trait enables adding wire:model to an input of type="file". [Read Docs](https://laravel-livewire.com/docs/2.x/file-uploads)
```

--------------------------------

### Scoping Livewire Events to Specific Components with `emitTo` (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

The `emitTo` method allows emitting an event to a specific Livewire component by its name. This is useful for targeting a particular component instance, regardless of its position in the component tree.

```PHP
$this->emitTo('counter', 'postAdded');
```

--------------------------------

### Test Livewire Component Presence

Source: https://laravel-livewire.com/docs/2.x/testing

Asserts whether a Livewire component is rendered on a page by its name or class. Uses `assertSeeLivewire` and `assertDontSeeLivewire` methods for verification. This is crucial for ensuring components are correctly integrated into your application's views.

```PHP
use Tests\TestCase;
use Livewire\Livewire;
use App\Http\Livewire\CreatePost;
use App\Http\Livewire\EditPost;

class CreatePostTest extends TestCase
{
    /** @test */
    function post_creation_page_contains_livewire_component() {
        $this->get('/posts/create')->assertSeeLivewire('create-post');
    }
    
    /** @test */
    function post_creation_page_doesnt_contain_livewire_component() {
        $this->get('/posts/create')->assertDontSeeLivewire('edit-post');
    }

    /** @test */
    function post_creation_page_contains_livewire_component_by_class() {
        $this->get('/posts/create')->assertSeeLivewire(CreatePost::class);
    }

    /** @test */
    function post_creation_page_doesnt_contain_livewire_component_by_class() {
        $this->get('/posts/create')->assertDontSeeLivewire(EditPost::class);
    }
}
```

--------------------------------

### Livewire Component Class Protected Properties

Source: https://laravel-livewire.com/docs/2.x/reference

Details the core protected properties used in Livewire components for configuration, validation, event listening, and theming.

```APIDOC
Livewire Component Class Protected Properties:

$queryString
  - Declare which properties to "bind" to the query string. [Read Docs](https://laravel-livewire.com/docs/2.x/query-string)

$rules
  - Specify validation rules to be applied to properties when calling $this->validate(). [Read Docs](https://laravel-livewire.com/docs/2.x/input-validation)

$listeners
  - Specify which events you want to listen for emitted by other components. [Read Docs](https://laravel-livewire.com/docs/2.x/events)

$paginationTheme
  - Specify whether you want to use Tailwind or Bootstrap for your pagination theme. [Read Docs](https://laravel-livewire.com/docs/2.x/pagination)
```

--------------------------------

### Livewire JavaScript Lifecycle Hooks

Source: https://laravel-livewire.com/docs/2.x/reference

Hooks that can be listened for in JavaScript to integrate with specific parts of a Livewire component's JavaScript lifecycle. These are powerful for third-party packages and deep customizations.

```javascript
Livewire.hook('component.initialized', component => {
  // Custom logic when a component is initialized
})
```

```APIDOC
Livewire JavaScript Lifecycle Hooks:

component.initialized
  - Params: (component)
  - Description: A new Livewire component has been initialized.

element.initialized
  - Params: (el, component)
  - Description: A new DOM element managed by Livewire has been initialized.

element.updating
  - Params: (fromEl, toEl, component)
  - Description: An element is about to be updated after a Livewire request.

element.updated
  - Params: (el, component)
  - Description: An element has just been updated from a Livewire request.

element.removed
  - Params: (el, component)
  - Description: An element has been removed after a Livewire request.

message.sent
  - Params: (message, component)
  - Description: A new Livewire message (request) was just sent to the server.

message.failed
  - Params: (message, component)
  - Description: A Livewire AJAX request (message) failed.

message.received
  - Params: (message, component)
  - Description: A message has been received from the server, but has not yet affected the DOM.

message.processed
  - Params: (message, component)
  - Description: A message has been fully received and implemented (DOM updates, etc.).
```

--------------------------------

### Dynamically Registering Livewire Event Listeners with `getListeners()` (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

Allows dynamic generation of event listeners by overriding the `getListeners()` protected method. This method returns an array of listeners, similar to the `$listeners` property. Listeners generated this way are set during component mounting and cannot be changed afterward.

```PHP
class ShowPosts extends Component
{
    public $postCount;

    protected function getListeners()
    {
        return ['postAdded'=>'incrementPostCount'];
    }

    // ...
}
```

--------------------------------

### Add Custom Persistent Middleware - APIDOC

Source: https://laravel-livewire.com/docs/2.x/security

Demonstrates how to register custom middleware to be captured and reapplied by Livewire's persistent middleware feature. This is done within a service provider, allowing for extended security logic. The middleware will only be reapplied if it was assigned to the original route the component was loaded on.

```PHP
Livewire::addPersistentMiddleware([
    YourOwnMiddleware::class
]);
```

--------------------------------

### Livewire: Passing Action Parameters (HTML)

Source: https://laravel-livewire.com/docs/2.x/actions

Shows how to pass dynamic parameters from the HTML view directly into a Livewire component's action method. This includes passing IDs, strings, and other values.

```HTML
<button wire:click="addTodo({{ $todo->id }}, '{{ $todo->name }}')">
    Add Todo
</button>
```

--------------------------------

### Livewire: Returning Blade Views from Render (PHP)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Explains how the `render` method in a Livewire component is responsible for returning the view. It can return a Blade view path along with data, similar to a controller method. The returned Blade view must have a single root element.

```PHP
use App\Models\Post;

class ShowPost extends Component
{
    public function render()
    {
        return view('livewire.show-posts', [
            'posts' => Post::all(),
        ]);
    }

}
```

--------------------------------

### Livewire: Route Model Binding to Properties (PHP)

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Illustrates automatic route model binding to public component properties for PHP 7.4+. If a public property's type is hinted with a model, Livewire injects the resolved model instance without needing a `mount` method.

```PHP
use App\Models\Post;

class ShowPost extends Component
{
    public Post $post;

}
```

--------------------------------

### Listening for Livewire Events in JavaScript

Source: https://laravel-livewire.com/docs/2.x/events

Livewire provides a JavaScript API to listen for events emitted from PHP components. This allows for seamless integration of backend actions with frontend behavior, such as displaying notifications.

```JavaScript
<script>
Livewire.on('postAdded', postId => {
    alert('A post was added with the id of: '+ postId);
})
</script>
```

--------------------------------

### Listen for Browser Event with Alpine.js

Source: https://laravel-livewire.com/docs/2.x/events

This HTML snippet illustrates how to listen for a Livewire browser event using Alpine.js directives. The `@name-updated.window` directive binds to the custom event, updating the component's state (`open = false`) when the event is received. This provides a declarative way to handle events.

```html
<div x-data="{ open: false }" @name-updated.window="open = false">
    <!-- Modal with a Livewire name update form -->
</div>
```

--------------------------------

### Livewire: Sync Component State with Query String

Source: https://laravel-livewire.com/docs/2.x/query-string

Synchronizes a component property with the browser's query string. When the property changes, the URL updates, and vice-versa. This is useful for features like search or filtering where the URL should reflect the current state.

```php
class SearchPosts extends Component
{
    public $search;

    protected $queryString = ['search'];

    public function render()
    {
        return view('livewire.search-posts', [
            'posts' => Post::where('title', 'like', '%' . $this->search . '%')->get(),
        ]);
    }
}
```

```html
<div>
    <input wire:model="search" type="search" placeholder="Search posts by title...">

    <h1>Search Results:</h1>

    <ul>
        @foreach($posts as $post)
            <li>{{ $post->title }}</li>
        @endforeach
    </ul>
</div>
```

--------------------------------

### Testing: assertSet() vs assertPayloadSet() in Livewire

Source: https://laravel-livewire.com/docs/2.x/upgrading

In Livewire V1, `assertSet()` tested against the JavaScript-safe payload. In V2, it asserts against the actual PHP component instance. Use `assertPayloadSet()` to test against payload data. This change affects tests that relied on V1's payload assertion behavior.

```PHP
use Livewire\Component;

// In Livewire V1, assertSet('property', 'value') tested against the JS payload.
// In Livewire V2, assertSet('property', 'value') tests against the PHP instance.
// For payload assertions in V2, use assertPayloadSet('property', 'value').
```

--------------------------------

### Livewire: Add Inline Scripts to Component View

Source: https://laravel-livewire.com/docs/2.x/inline-scripts

Demonstrates adding `<script>` tags directly within a Livewire component's Blade view. Scripts execute once on initial render. For dynamic execution, consider emitting events.

```blade
<div>
    <!-- Your components HTML -->
    
    <script>
        document.addEventListener('livewire:load',function(){
            // Your JS here.
        })
    </script>
</div>
```

--------------------------------

### Livewire: Output PHP Data to JavaScript with @js Directive

Source: https://laravel-livewire.com/docs/2.x/inline-scripts

Demonstrates using the `@js` directive to safely pass PHP variables (like `$posts`) into JavaScript code within a `<script>` tag. The output will be a JavaScript-compatible representation of the PHP data.

```javascript
let posts = @js($posts)

// "posts" will now be a JavaScript array of post data from PHP.
```

--------------------------------

### Passing Data to Layouts

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Data can be passed from a Livewire component to its layout using the `->layout()` method by providing an array of data as the second argument.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->layout('layouts.base', ['title' => 'Show Posts']);
    }
    ...
}
```

--------------------------------

### VueJS Support: Livewire-Vue Plugin Update

Source: https://laravel-livewire.com/docs/2.x/upgrading

Illustrates the required update for the Livewire VueJS plugin when migrating to Livewire 2.x. The CDN path for the vue-plugin needs to be changed from version '0.2.x' to '0.3.x'.

```HTML
<script src="https://cdn.jsdelivr.net/gh/livewire/vue@v0.3.x/dist/livewire-vue.js"></script>
```

--------------------------------

### Livewire Component PHP Class

Source: https://laravel-livewire.com/docs/2.x/index

The server-side logic for a Livewire component. This PHP class handles rendering the component's view and managing its state.

```php
namespace App\Http\Livewire;

use Livewire\Component;

class Counter extends Component
{
    public function render()
    {
        return view('livewire.counter');
    }
}
```

--------------------------------

### Scoping Livewire Events Upwards with `emitUp` (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

When dealing with nested components, `emitUp` is used to emit an event only to parent components, not children or siblings. This ensures events propagate up the component tree.

```PHP
$this->emitUp('postAdded');
```

--------------------------------

### Integrate Pikaday Datepicker with Alpine.js in Blade

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Provides the definition for a reusable Blade component that integrates the Pikaday JavaScript library for date selection. It uses Alpine.js directives like x-data and x-init to initialize Pikaday on an input field, forwarding attributes via {{ $attributes }}.

```blade
<input
    x-data
    x-ref="input"
    x-init="new Pikaday({ field: $refs.input })"
    type="text"
    {{ $attributes }}
>
```

--------------------------------

### Livewire Counter Component (PHP)

Source: https://laravel-livewire.com/docs/2.x/alpine-js

A basic Livewire component implemented in PHP. It defines a public property `$count` and a method `increment` to modify this property, serving as the backend for an interactive UI.

```php
use Livewire\Component;

class Counter extends Component
{
    public $count = 0;

    public function increment()
    {
        $this->count++;
    }
}
```

--------------------------------

### Livewire Component with Bootstrap Pagination Theme

Source: https://laravel-livewire.com/docs/2.x/pagination

Configures a Livewire component to use the Bootstrap styling for its pagination views. This is achieved by setting the protected property `$paginationTheme` to 'bootstrap'.

```php
class ShowPosts extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    // ... component logic
}
```

--------------------------------

### Fix Livewire Root Element Issue with Wrapping Div

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Demonstrates how to resolve the 'root element' error in Livewire by wrapping multiple root elements within a single parent `<div>`. This ensures Livewire can correctly manage component rendering and state.

```html
<div><!-- Added this wrapping div -->
  <div>
    Some content
  </div>
  <button wire:click="doSomething">Do Something</button>
</div><!-- Added this closing tag for the wrapping div -->
```

--------------------------------

### Livewire Form HTML Structure

Source: https://laravel-livewire.com/docs/2.x/input-validation

Shows the HTML structure for a Livewire form, binding input fields to component properties using `wire:model` and displaying validation errors using `@error` directives.

```HTML
<form wire:submit.prevent="submit">
    <input type="text" wire:model="name">
    @error('name') <span class="error">{{ $message }}</span> @enderror
    
    <input type="text" wire:model="email">
    @error('email') <span class="error">{{ $message }}</span> @enderror
    
    <button type="submit">Save Contact</button>
</form>
```

--------------------------------

### Re-use Sorting Logic with PHP Traits in Livewire

Source: https://laravel-livewire.com/docs/2.x/traits

Demonstrates how to extract common sorting logic into a reusable PHP Trait for Livewire components. This avoids code duplication and promotes cleaner component structure. The trait includes properties for sorting direction and methods to toggle sorting.

```PHP
class ShowPostsextendsComponent
{
    use WithSorting;
    
    // ...
}

```

```PHP
trait WithSorting
{
    public $sortBy = '';
    public $sortDirection = 'asc';
    
    public function sortBy($field)
    {
        $this->sortDirection = $this->sortBy === $field
            ? $this->reverseSort()
            : 'asc';
        
        $this->sortBy = $field;
    }
    
    public function reverseSort()
    {
        return $this->sortDirection === 'asc'
            ? 'desc'
            : 'asc';
    }
}
```

--------------------------------

### Livewire Page Expired Hook Placement After Scripts

Source: https://laravel-livewire.com/docs/2.x/deployment

Demonstrates placing the `Livewire.onPageExpired()` call after Livewire's scripts in the layout file. This ensures that the Livewire JavaScript object is available and initialized before the hook is registered.

```html
<livewire:scripts />

<script>
    Livewire.onPageExpired((response, message)=>{})
</script>
```

--------------------------------

### Dynamic Validation Rules

Source: https://laravel-livewire.com/docs/2.x/input-validation

Explains how to define validation rules dynamically by substituting the `$rules` property with a `rules()` method within the Livewire component.

```PHP
class ContactForm extends Component
{
    public $name;
    public $email;
    
    protected function rules()
    {
        return [
            'name' => 'required|min:6',
            'email' => ['required', 'email', 'not_in:'.auth()->user()->email],
        ];
    }
}
```

--------------------------------

### Render Livewire Component with @livewire directive

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Shows an alternative method to render a Livewire component using the `@livewire` Blade directive. This provides a programmatic way to include components within your application's views.

```php
@livewire('show-posts')
```

--------------------------------

### Configure Livewire Component Slot in Layout

Source: https://laravel-livewire.com/docs/2.x/upgrading

When using the `->extends()` method in Livewire v2, you can specify which named slot the component should render into using the `->slot()` method. By default, it renders into the main `$slot`.

```PHP
class ShowPosts extends Component
{
    public function render()
    {
        return view('livewire.show-posts')
            ->layout('layouts.base')
            ->slot('body');
    }
}

```

--------------------------------

### Livewire Component with Named Paginator

Source: https://laravel-livewire.com/docs/2.x/pagination

Illustrates how to implement multiple paginators on the same page by assigning a custom name ('commentsPage') to a specific paginator. This prevents conflicts with the default '$page' property.

```php
class PostComments extends Livewire\Component
{
    use WithPagination;

    public Post $post;

    public function render()
    {
        return view('livewire.show-posts',
            ['posts' => $post->comments()->paginate(10, ['*'], 'commentsPage')]
        );
    }
}
```

--------------------------------

### Livewire: Push Scripts to Blade Stacks

Source: https://laravel-livewire.com/docs/2.x/inline-scripts

Shows how to use the `@push('scripts')` directive in a Livewire component to inject JavaScript into a designated Blade stack. This is useful for managing script loading.

```blade
<!-- Your component's view here -->

@push('scripts')
<script>
    // Your JS here.
</script>
@endpush
```

--------------------------------

### Livewire JS Hooks: Component & Element Lifecycle

Source: https://laravel-livewire.com/docs/2.x/lifecycle-hooks

This snippet demonstrates how to register JavaScript hooks to execute custom code during various stages of a Livewire component's lifecycle. It covers initialization of the component and its elements, as well as updates and removals.

```javascript
document.addEventListener("DOMContentLoaded", () => {
    Livewire.hook('component.initialized', (component) => {});
    Livewire.hook('element.initialized', (el, component) => {});
    Livewire.hook('element.updating', (fromEl, toEl, component) => {});
    Livewire.hook('element.updated', (el, component) => {});
    Livewire.hook('element.removed', (el, component) => {});
});
```

--------------------------------

### Livewire: Service Injection in Actions (PHP)

Source: https://laravel-livewire.com/docs/2.x/actions

Explains how to leverage Laravel's dependency injection container within Livewire actions. Services can be injected into action method signatures before other parameters, allowing for easy access to application services.

```PHP
public function addTodo(TodoService $todoService, $id, $name)
{
    // ...
}
```

--------------------------------

### Custom Wireable Property Implementation

Source: https://laravel-livewire.com/docs/2.x/properties

Defines a custom PHP class that implements the `LivewireWireable` interface. This allows Livewire to properly hydrate and dehydrate custom objects (like DTOs) between requests, enabling state persistence for non-Eloquent data structures.

```PHP
use Livewire;

class Settings implements Livewire\Wireable
{
    public $items = [];

    public function __construct($items)
    {
        $this->items = $items;
    }

    // ... other methods

    public function toLivewire()
    {
        return $this->items;
    }

    public static function fromLivewire($value)
    {
        return new static($value);
    }
}
```

--------------------------------

### Passing Layout Data Separately

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Alternatively, layout data can be passed separately from the layout name using the `->layoutData()` method, allowing for more granular control over data passed to the layout.

```PHP
class ShowPosts extends Component
{
    ...
    public function render()
    {
        return view('livewire.show-posts')
            ->layoutData(['title' => 'Show Posts']);
    }
    ...
}
```

--------------------------------

### Livewire Echo Event Listener via $listeners

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

Shows how to register an event listener for Laravel Echo within a Livewire component using the `$listeners` property. It utilizes a special syntax `echo:{channel},{event}` to map incoming Echo events to component methods.

```PHP
class OrderTracker extends Component
{
    public $showNewOrderNotification = false;

    // Special Syntax: ['echo:{channel},{event}' => '{method}']
    protected $listeners = ['echo:orders,OrderShipped'=>'notifyNewOrder'];

    public function notifyNewOrder()
    {
        $this->showNewOrderNotification = true;
    }
}
```

--------------------------------

### Toggle Classes on Livewire Loading

Source: https://laravel-livewire.com/docs/2.x/loading-states

Adds a specified class to an element while a Livewire request is processing. This allows for visual feedback like changing background colors during loading.

```html
<div>
    <button wire:click="checkout" wire:loading.class="bg-gray">
        Checkout
    </button>
</div>
```

--------------------------------

### Define Color-Picker Blade Component with Alpine and Wire:Ignore

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Defines a reusable Blade component that uses Alpine.js to manage a color picker. It dispatches an 'input' event with the selected color for Livewire's `wire:model` to capture. `wire:ignore` prevents Livewire from interfering with the component's internal DOM.

```Blade
<div
    x-data="{ color: '#ffffff' }"
    x-init="
        picker = new Picker($refs.button);
        picker.onDone = rawColor => {
            color = rawColor.hex;
            $dispatch('input', color)
        }
    "
    wire:ignore
    {{ $attributes }}
>
    <span x-text="color" :style="`background: ${color}`"></span>
    <button x-ref="button">Change</button>
</div>
```

--------------------------------

### Livewire JavaScript File Upload API

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Provides JavaScript functions accessible via the `@this` directive for advanced file upload control. These functions allow integration with third-party libraries and custom upload logic.

```APIDOC
@this.upload(fieldName, file, successCallback, errorCallback, progressCallback)
  - Uploads a single file.
  - Parameters:
    - fieldName: The name of the Livewire component property to upload to (e.g., 'photo').
    - file: The File object to upload.
    - successCallback: Function called on successful upload. Receives the uploaded filename.
    - errorCallback: Function called if the upload fails.
    - progressCallback: Function called during upload progress. Receives an event object with a 'detail.progress' property (0-100).

@this.uploadMultiple(fieldName, files, successCallback, errorCallback, progressCallback)
  - Uploads multiple files.
  - Parameters:
    - fieldName: The name of the Livewire component property for multiple files (e.g., 'photos').
    - files: An array of File objects to upload.
    - successCallback: Function called on successful upload. Receives an array of uploaded filenames.
    - errorCallback: Function called if the upload fails.
    - progressCallback: Function called during upload progress. Receives an event object with a 'detail.progress' property (0-100).

@this.removeUpload(fieldName, uploadedFilename, successCallback)
  - Removes a single file from a multiple file upload.
  - Parameters:
    - fieldName: The name of the Livewire component property for multiple files (e.g., 'photos').
    - uploadedFilename: The filename of the file to remove.
    - successCallback: Function called on successful removal.
```

--------------------------------

### Use Custom Pagination View with ->links() (Blade/PHP)

Source: https://laravel-livewire.com/docs/2.x/pagination

This method demonstrates how to specify a custom Blade view for pagination links directly within the `links()` method call. It's a straightforward way to apply a custom pagination template to a specific query result.

```blade
<div>
    @foreach ($posts as $post)
        ...
    @endforeach

    {{ $posts->links('custom-pagination-links-view') }}
</div>
```

--------------------------------

### Scoping Livewire Events to Specific Components in Blade with `emitTo`

Source: https://laravel-livewire.com/docs/2.x/events

Enables emitting an event to a specific Livewire component instance directly from a Blade view. The first argument is the component name, followed by the event and any parameters.

```Blade
<button wire:click="$emitTo('counter', 'postAdded')">Emit to Counter</button>
```

--------------------------------

### Authorize Actions in Livewire Components

Source: https://laravel-livewire.com/docs/2.x/authorization

Demonstrates how to use the `AuthorizesRequests` trait within a Livewire component to authorize actions. It shows calling `$this->authorize()` with a policy and the model instance, similar to controller usage.

```php
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class EditPost extends \Livewire\Component
{
    use AuthorizesRequests;

    public $post;

    public function mount(Post $post)
    {
        $this->post = $post;
    }

    public function save()
    {
        $this->authorize('update', $this->post);

        $this->post->update(['title' => $this->title]);
    }
}
```

--------------------------------

### Assigning Parameters to Public Properties

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Livewire automatically assigns parameters passed to a component to matching public properties. This simplifies data flow by directly binding incoming data to component state.

```PHP
class ShowPost extends Component
{
    public $post;

    ...
}
```

--------------------------------

### Manage Query Strings in Livewire Traits (Property)

Source: https://laravel-livewire.com/docs/2.x/traits

Illustrates how to define query string mappings for properties within a PHP Trait for Livewire components. This allows sorting parameters like `$sortBy` and `$sortDirection` to be reflected in the URL, enabling bookmarking and sharing of filtered states.

```PHP
trait WithSorting
{
    // ... other methods

    protected $queryStringWithSorting = [
        'sortBy' => ['except' => 'id'],
        'sortDirection' => ['except' => 'asc'],
    ];
}
```

--------------------------------

### Default Persistent Middleware Classes - PHP

Source: https://laravel-livewire.com/docs/2.x/security

Lists the default authentication and authorization middleware classes that Livewire reapplies to subsequent requests by default. These are crucial for maintaining security after an initial request.

```PHP
[
    \Illuminate\Auth\Middleware\Authenticate::class,
    \Illuminate\Auth\Middleware\Authorize::class
]
```

--------------------------------

### Flash Session Message in Livewire Component

Source: https://laravel-livewire.com/docs/2.x/flash-messages

Demonstrates how to use Laravel's `session()->flash()` method within a Livewire component to store a message. This message can then be displayed to the user.

```PHP
1classUpdatePostextendsComponent

2{

3publicPost$post;

4

5protected$rules = [

6'post.title'=>'required',

7];

8

9publicfunctionupdate()

10{

11$this->validate();

12

13$this->post->save();

14

15session()->flash('message','Post successfully updated.');

16}

17}
```

--------------------------------

### Livewire Real-time File Validation

Source: https://laravel-livewire.com/docs/2.x/file-uploads

Demonstrates how to validate file uploads in real-time within a Livewire component before form submission. It shows the component logic for validation and the corresponding Blade view for the file input and error display.

```php
use Livewire\WithFileUploads;

class UploadPhoto extends Component
{
    use WithFileUploads;

    public $photo;

    public function updatedPhoto()
    {
        $this->validate([
            'photo'=>'image|max:1024', // 1MB Max
        ]);
    }

    public function save()
    {
        // ...
    }
}
```

```html
<form wire:submit.prevent="save">
    <input type="file" wire:model="photo">

    @error('photo') <span class="error">{{ $message }}</span> @enderror

    <button type="submit">Save Photo</button>
</form>
```

--------------------------------

### Display Livewire Properties in Blade View

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how to render Livewire component public properties directly within a Blade template using Blade's templating syntax. This allows for seamless integration of component data into the UI.

```html
<div>
    <h1>{{ $message }}</h1>
    <!-- Will output "Hello World!" -->
</div>
```

--------------------------------

### Customize Livewire Loading Delay Duration

Source: https://laravel-livewire.com/docs/2.x/loading-states

Allows customization of the delay duration for the loading indicator using predefined modifiers like `.shortest` (50ms) up to `.longest` (1000ms).

```html
<div wire:loading.delay.shortest>...</div>
<div wire:loading.delay.shorter>...</div>
<div wire:loading.delay.short>...</div>
<div wire:loading.delay>...</div>
<div wire:loading.delay.long>...</div>
<div wire:loading.delay.longer>...</div>
<div wire:loading.delay.longest>...</div>
```

--------------------------------

### Livewire Counter Component PHP Class

Source: https://laravel-livewire.com/docs/2.x/security

Defines a basic Livewire component in PHP. It includes a public property `$count` and an `increment` method to modify it. The `render` method specifies the Blade view to be displayed.

```PHP
class Counter extends Component
{
    public $count = 1;

    public function increment()
    {
        $this->count++;
    }

    public function render()
    {
        return view('livewire.counter');
    }
}
```

--------------------------------

### Flash Message with Redirect in Livewire

Source: https://laravel-livewire.com/docs/2.x/flash-messages

Illustrates flashing a message to the session and then redirecting the user to another page. Livewire automatically persists flash data for one additional request, ensuring the message is available on the redirected page.

```PHP
1publicfunctionupdate()

2{

3$this->validate();

4

5$this->post->save();

6

7session()->flash('message','Post successfully updated.');

8

9return redirect()->to('/posts');

10}
```

--------------------------------

### Unique wire:key for Sibling Livewire Components in Loops

Source: https://laravel-livewire.com/docs/2.x/nesting-components

Illustrates the correct method for assigning unique `wire:key` attributes to sibling Livewire components rendered inside a loop. It contrasts an incorrect approach (duplicate keys) with the recommended solution (prefixing keys with component names and the item ID) to prevent rendering issues.

```blade
<!-- user-profile component -->
<div>
    <!-- Good -->
    <livewire:user-profile-one :user="$user" :wire:key="'user-profile-one-'.$user->id">
    <livewire:user-profile-two :user="$user" :wire:key="'user-profile-two-'.$user->id">
</div>
```

--------------------------------

### Livewire Data Binding with wire:model

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates bidirectional data binding between an HTML input element and a Livewire component's public property using the wire:model directive. Changes in the input update the property, and vice-versa.

```php
class HelloWorld extends Component
{
    public $message;
}
```

```html
<div>
    <input wire:model="message" type="text">

    <h1>{{ $message }}</h1>
</div>
```

--------------------------------

### Fire Event from Livewire Template (HTML)

Source: https://laravel-livewire.com/docs/2.x/events

This snippet demonstrates how to emit a Livewire event directly from an HTML template using the `wire:click` directive. This is useful for triggering component actions or inter-component communication when a user interacts with an element.

```HTML
<button wire:click="$emit('postAdded')">
    Add Post
</button>
```

--------------------------------

### Include Livewire Component in Blade

Source: https://laravel-livewire.com/docs/2.x/quickstart

Renders a Livewire component within a Blade view using a custom HTML-like tag. This is similar to how Blade includes work.

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livewire App</title>
    @livewireStyles
</head>
<body>
    <livewire:counter />
    
    @livewireScripts
</body>
</html>
```

--------------------------------

### Livewire 2.x: Automatic Casting for Collections and DateTime

Source: https://laravel-livewire.com/docs/2.x/upgrading

Property casters for `Collection` and `DateTime` instances have been removed in Livewire V2 as these types are now automatically cast. This simplifies component definitions by removing the need for explicit caster configurations.

```PHP
class MyComponent extends Component
{
    public $foo;

    public function mount()
    {
        // Collections are automatically cast now
        $this->foo = collect(['foo', 'bar']);
    }
}
```

--------------------------------

### Deferred Updating Livewire Input with wire:model.defer

Source: https://laravel-livewire.com/docs/2.x/properties

Explains the use of the defer modifier with wire:model to batch data updates with the next network request. This prevents network requests on every input change, improving performance for multiple inputs or actions.

```html
<input type="text" wire:model.defer="query">
<button wire:click="search">Search</button>
```

--------------------------------

### Livewire Component Validation Logic

Source: https://laravel-livewire.com/docs/2.x/input-validation

Demonstrates how to define validation rules using the `$rules` property and trigger validation with `$this->validate()` within a Livewire component. Validation failures prevent further execution and populate the `$errors` bag.

```PHP
class ContactForm extends Component
{
    public $name;
    public $email;
    
    protected $rules = [
        'name' => 'required|min:6',
        'email' => 'required|email',
    ];

    public function submit()
    {
        $this->validate();
        
        // Execution doesn't reach here if validation fails.
        
        Contact::create([
            'name' => $this->name,
            'email' => $this->email,
        ]);
    }
}
```

--------------------------------

### Add Class When Offline with wire:offline.class

Source: https://laravel-livewire.com/docs/2.x/offline-state

Shows how to dynamically add a CSS class to an element when the user goes offline using the `wire:offline.class` directive. The class is applied when offline and removed when back online.

```html
<div wire:offline.class="bg-red-300"></div>
```

--------------------------------

### Listen for Browser Event with JavaScript

Source: https://laravel-livewire.com/docs/2.x/events

This JavaScript snippet shows how to listen for a custom browser event dispatched by Livewire. It uses `window.addEventListener` to capture the 'name-updated' event and accesses the passed data via `event.detail`. An alert displays the new name received.

```javascript
window.addEventListener('name-updated', event => {
    alert('Name updated to: '+ event.detail.newName);
})
```

--------------------------------

### Alpine Counter with Livewire Interaction

Source: https://laravel-livewire.com/docs/2.x/alpine-js

An Alpine.js component that interacts with a Livewire component using the magic `$wire` object. It displays the Livewire component's `$count` property and triggers the `increment` method on button click.

```javascript
<div>
    <!-- Alpine Counter Component -->
    <div x-data>
        <h1 x-text="$wire.count"></h1>

        <button @click="$wire.increment()">Increment</button>
    </div>
</div>
```

--------------------------------

### Update Route Layout Method

Source: https://laravel-livewire.com/docs/2.x/upgrading

The `->layout()` method for manually configuring component layouts in routes has been moved and renamed to `->extends()` within the component's `render()` method in Livewire v2. The `->section()` method remains the same.

```PHP
// Before
Route::livewire('/post', ShowPosts::class)
    ->layout('layouts.base')
    ->section('body');

// After
class ShowPosts extends Component
{
    public function render()
    {
        return view('livewire.show-posts')
            ->extends('layouts.base')
            ->section('body');
    }
}

```

--------------------------------

### Livewire Counter View (Blade)

Source: https://laravel-livewire.com/docs/2.x/quickstart

The Blade view for the Livewire counter component. It displays the current count using `{{ $count }}` and includes a button that triggers the `increment` method on the server-side component via the `wire:click` directive.

```blade
<div style="text-align: center">
    <button wire:click="increment">+</button>
    <h1>{{ $count }}</h1>
</div>
```

--------------------------------

### Livewire Page Expired Hook on Load Event

Source: https://laravel-livewire.com/docs/2.x/deployment

Shows how to wrap the `Livewire.onPageExpired()` call within a `document.addEventListener('livewire:load', ...)` listener. This method ensures the hook is registered only after Livewire has fully loaded and is ready to receive events.

```javascript
document.addEventListener('livewire:load',()=>{
    Livewire.onPageExpired((response,message)=>{})
})
```

--------------------------------

### Registering Livewire Event Listeners via `$listeners` Property (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

Defines event listeners within a Livewire component using the protected `$listeners` property. The key is the event name, and the value is the method to call. If the event and method names match, only the event name is needed.

```PHP
class ShowPosts extends Component
{
    public $postCount;

    protected $listeners = ['postAdded'=>'incrementPostCount'];

    public function incrementPostCount()
    {
        $this->postCount = Post::count();
    }
}
```

```PHP
class ShowPosts extends Component
{
    public $postCount;

    protected $listeners = ['postAdded']; // Calls postAdded method if names match

    public function postAdded()
    {
        $this->postCount = Post::count();
    }
}
```

--------------------------------

### Binding to Eloquent Collection Properties

Source: https://laravel-livewire.com/docs/2.x/properties

Illustrates binding to properties of multiple Eloquent models stored within a collection. The `$rules` property uses array notation (e.g., `posts.*.title`) to define validation for each item in the collection, and `wire:model` reflects this structure.

```PHP
use App\Post;

class PostForm extends Component
{
    public $posts;

    protected $rules = [
        'posts.*.title' => 'required|string|min:6',
        'posts.*.content' => 'required|string|max:500',
    ];

    public function mount()
    {
        $this->posts = auth()->user()->posts;
    }

    public function save()
    {
        $this->validate();

        foreach ($this->posts as $post) {
            $post->save();
        }
    }
}
```

--------------------------------

### Livewire Polling Specific Action

Source: https://laravel-livewire.com/docs/2.x/polling

Illustrates triggering a specific component method on the polling interval by passing the method name as a value to the `wire:poll` directive, e.g., `wire:poll="foo"`.

```blade
<div wire:poll="foo">
    Current time: {{ now() }}
</div>
```

--------------------------------

### Livewire Binding Nested Data with Dot Notation

Source: https://laravel-livewire.com/docs/2.x/properties

Explains how to bind to nested data within arrays or objects in a Livewire component's properties using dot notation directly in the wire:model directive.

```html
<input type="text" wire:model="parent.message">
```

--------------------------------

### Assert Dispatched Browser Event (Livewire PHP)

Source: https://laravel-livewire.com/docs/2.x/testing

Asserts that a browser event was dispatched from the component using the `dispatchBrowserEvent` method. This method verifies that the specified event name and optional data payload were emitted to the browser.

```PHP
$component->assertDispatchedBrowserEvent('event', $data);
```

--------------------------------

### Define Public Properties in Livewire 2.x PHP

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates how to declare public properties within a Livewire component class. These properties are automatically serialized and made available to the component's view, enabling dynamic data display and interaction.

```php
class HelloWorld extends Component
{
    public $message = 'Hello World!';

    // ...
}
```

```php
class HelloWorld extends Component
{
    public $message = 'Hello World!';
}
```

--------------------------------

### Nest Livewire Component in Blade View

Source: https://laravel-livewire.com/docs/2.x/nesting-components

Demonstrates how to render a nested Livewire component within a parent component's Blade view. It shows passing a data parameter, such as a User model, to the nested component.

```php
class UserDashboard extends Component
{
    public User $user;
}

```

```html
<div>
    <h2>User Details:</h2>
    Name: {{ $user->name }}
    Email: {{ $user->email }}

    <h2>User Notes:</h2>
    <div>
        @livewire('add-user-note', ['user' => $user])
    </div>
</div>

```

--------------------------------

### Livewire Counter Blade View

Source: https://laravel-livewire.com/docs/2.x/index

The client-side template for the Livewire counter component. It displays the `$count` property and includes a button that triggers the `increment` method on click using Livewire's `wire:click` directive, enabling dynamic updates.

```Blade
1<divstyle="text-align: center">

2<buttonwire:click="increment">+</button>

3<h1>{{ $count }}</h1>

4</div>

        
```

--------------------------------

### Pass Parameters to Livewire Component with @livewire directive

Source: https://laravel-livewire.com/docs/2.x/rendering-components

Demonstrates passing parameters to a Livewire component using the `@livewire` Blade directive with an array. This method is useful for passing multiple data points to a component.

```php
@livewire('show-post',['post'=>$post])
```

--------------------------------

### Livewire Component State Payload with Checksum

Source: https://laravel-livewire.com/docs/2.x/security

Illustrates the structure of data transmitted between the browser and server in Livewire. It includes the component's serialized state and a security checksum, which validates that the state has not been tampered with.

```JSON
{
    "state": {
        "count": 1
    },
    "checksum": "A6jHn359Ku3lFc82arW8"
}
```

--------------------------------

### Binding to Eloquent Model Relationships

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how to bind Livewire component properties to properties of related Eloquent models, such as posts belonging to a user. The `$rules` and `wire:model` syntax reflects the relationship chain (e.g., `user.posts.*.title`).

```PHP
use App\User;

class EditUsersPosts extends Component
{
    public User $user;

    protected $rules = [
        'user.posts.*.title'
    ];

    public function save()
    {
        $this->validate();

        $this->user->posts->each->save();
    }
}
```

--------------------------------

### Livewire JS Hooks: Message Handling

Source: https://laravel-livewire.com/docs/2.x/lifecycle-hooks

This snippet shows how to register JavaScript hooks for handling messages sent to and from the Livewire server. It covers events related to sending messages, potential failures, receiving messages, and processing them after DOM updates.

```javascript
document.addEventListener("DOMContentLoaded", () => {
    Livewire.hook('message.sent', (message, component) => {});
    Livewire.hook('message.failed', (message, component) => {});
    Livewire.hook('message.received', (message, component) => {});
    Livewire.hook('message.processed', (message, component) => {});
});
```

--------------------------------

### Update Blade Layout for Livewire Components

Source: https://laravel-livewire.com/docs/2.x/upgrading

Livewire v2 expects Blade layout files to use the `$slot` syntax for rendering components, replacing the older `@yield('content')` directive. This change ensures proper component injection into the main layout.

```HTML
<!-- Before -->
<html>
<body>
    @yield('content')

    @livewireScripts
</body>
</html>

<!-- After -->
<html>
<body>
    {{$slot }}

    @livewireScripts
</body>
</html>

```

--------------------------------

### Livewire 2.x: Setting Pagination Theme to Bootstrap

Source: https://laravel-livewire.com/docs/2.x/upgrading

Livewire V2's default pagination views have been updated from Bootstrap-4 to Tailwind. To retain the Bootstrap-4 pagination styling, you can set the `$paginationTheme` property on your component to 'bootstrap'.

```PHP
use Livewire\Component;
use Livewire\WithPagination;

class ShowPosts extends Component
{
    use WithPagination;

    // Set the pagination theme to Bootstrap
    protected $paginationTheme = 'bootstrap';

    // ... component logic
}
```

--------------------------------

### Livewire Component Blade View

Source: https://laravel-livewire.com/docs/2.x/quickstart

The client-side template for a Livewire component. It must contain a single root element and can include HTML, Blade directives, and Livewire's data binding.

```blade
<div>
    <h1>Hello World!</h1>
</div>
```

--------------------------------

### Livewire: Toggle Element Visibility Based on Dirty State

Source: https://laravel-livewire.com/docs/2.x/dirty-states

Toggles the visibility of an element based on the dirty state of another element using `wire:dirty` and `wire:target`. The target element is hidden by default and shown only when the specified input is dirty, providing feedback like 'Updating...'.

```html
<div>
    <span wire:dirty wire:target="foo">Updating...</span>
    <input wire:model.lazy="foo">
</div>
```

--------------------------------

### Using Custom Wireable Properties in Component

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how to use a custom `Wireable` object as a public property in a Livewire component. The property must be type-hinted, and Livewire will automatically handle its serialization and deserialization, ensuring state is maintained across requests.

```PHP
use Livewire;

class SettingsComponent extends Livewire\Component
{
    public Settings $settings;

    public function mount()
    {
        $this->settings = new Settings([
            'foo' => 'bar',
        ]);
    }

    public function changeSetting()
    {
        $this->settings->foo = 'baz';
    }
}
```

--------------------------------

### Include Livewire Component in Blade

Source: https://laravel-livewire.com/docs/2.x/index

Renders a Livewire component within a Blade view using a custom HTML-like tag. This is similar to how Blade includes work.

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livewire App</title>
    @livewireStyles
</head>
<body>
    <livewire:counter />
    
    @livewireScripts
</body>
</html>
```

--------------------------------

### Listen to Private/Presence Channel Events with Order ID in Livewire PHP

Source: https://laravel-livewire.com/docs/2.x/laravel-echo

This snippet demonstrates how to listen to private and presence channel events within a Laravel Livewire component. It shows how to dynamically subscribe to channels based on a component property, such as an order ID, and react to broadcasted events.

```PHP
class OrderTrackerextendsComponent

{

public$showNewOrderNotification =false;

public$orderId;


publicfunctionmount($orderId)

{

$this->orderId =$orderId;

}


publicfunctiongetListeners()

{

return[

"echo-private:orders.{$this->orderId},OrderShipped"=>'notifyNewOrder',

// Or:

"echo-presence:orders.{$this->orderId},OrderShipped"=>'notifyNewOrder',

];

}


publicfunctionnotifyNewOrder()

{

$this->showNewOrderNotification =true;

}

}
```

--------------------------------

### Livewire Validation with Dynamic Rules

Source: https://laravel-livewire.com/docs/2.x/input-validation

Shows how to pass validation rules directly to the `validate()` and `validateOnly()` methods, bypassing the component's `$rules` property. This is useful for one-off validations or when rules are determined dynamically. It allows for more flexibility in defining validation logic.

```PHP
class ContactForm extends Component
{
    public $name;
    public $email;

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName, [
            'name' => 'min:6',
            'email' => 'email',
        ]);
    }

    public function saveContact()
    {
        $validatedData = $this->validate([
            'name' => 'required|min:6',
            'email' => 'required|email',
        ]);

        Contact::create($validatedData);
    }
}
```

--------------------------------

### Delay Livewire Loading Indicator

Source: https://laravel-livewire.com/docs/2.x/loading-states

Shows a loading indicator only if the operation takes longer than a default duration (200ms). This helps prevent UI flickering for fast operations.

```html
<div wire:loading.delay>...</div>
```

--------------------------------

### Fire Event from Livewire Component (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

This snippet shows how to emit a Livewire event from within a Livewire component's PHP class. The `$this->emit()` method allows components to broadcast events to other components on the same page, facilitating state management and communication.

```PHP
$this->emit('postAdded');
```

--------------------------------

### Laravel Livewire PHP Lifecycle Hooks

Source: https://laravel-livewire.com/docs/2.x/reference

Details global PHP lifecycle hooks that can be registered in Service Providers to listen for component events like hydration and dehydration. These hooks allow for custom logic execution at various stages of a component's lifecycle.

```PHP
Livewire::listen('component.hydrate', function ($component, $request) {
    // Your logic here
});

Livewire::listen('component.hydrate.initial', function ($component, $request) {
    // Your logic here
});

Livewire::listen('component.hydrate.subsequent', function ($component, $request) {
    // Your logic here
});

Livewire::listen('component.dehydrate', function ($component, $response) {
    // Your logic here
});

Livewire::listen('component.dehydrate.initial', function ($component, $response) {
    // Your logic here
});

Livewire::listen('component.dehydrate.subsequent', function ($component, $response) {
    // Your logic here
});

Livewire::listen('property.hydrate', function ($name, $value, $component, $request) {
    // Your logic here
});

Livewire::listen('property.dehydrate', function ($name, $value, $component, $response) {
    // Your logic here
});
```

--------------------------------

### Livewire Counter Component Blade View

Source: https://laravel-livewire.com/docs/2.x/security

The front-end view for the Livewire counter component. It displays the current value of the `$count` property and provides a button that triggers the `increment` method on the server using `wire:click`.

```Blade
<div>
    <h1>{{ $count }}</h1>

    <button wire:click="increment">+</button>
</div>
```

--------------------------------

### Direct Livewire ErrorBag Manipulation

Source: https://laravel-livewire.com/docs/2.x/input-validation

Demonstrates methods for directly controlling Livewire's internal ErrorBag. This includes adding errors, resetting all errors, resetting errors for specific keys, and retrieving the entire error bag instance for custom operations.

```php
$this->addError('email','The email field is invalid.');

$this->resetErrorBag();
$this->resetValidation();

$this->resetValidation('email');
$this->resetErrorBag('email');

$errors =$this->getErrorBag();
$errors->add('some-key','Some message');
```

--------------------------------

### Livewire Component Blade View

Source: https://laravel-livewire.com/docs/2.x/index

The client-side template for a Livewire component. It must contain a single root element and can include HTML, Blade directives, and Livewire's data binding.

```blade
<div>
    <h1>Hello World!</h1>
</div>
```

--------------------------------

### Binding to Single Eloquent Model Properties

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates how to bind Livewire component properties directly to Eloquent model attributes. This allows for direct data binding and validation. Ensure model attributes intended for binding have corresponding entries in the component's `$rules` property.

```PHP
use App\Post;

class PostForm extends Component
{
    public Post $post;

    protected $rules = [
        'post.title' => 'required|string|min:6',
        'post.content' => 'required|string|max:500',
    ];

    public function save()
    {
        $this->validate();

        $this->post->save();
    }
}
```

--------------------------------

### Share State Between Livewire and Alpine with @entangle

Source: https://laravel-livewire.com/docs/2.x/alpine-js

The @entangle directive in Livewire allows seamless synchronization of state between Livewire components and Alpine.js instances. Changes in one automatically reflect in the other. The `.defer` modifier can be chained to prevent immediate AJAX requests for Alpine-driven state changes, bundling them with the next Livewire request.

```PHP
class Dropdown extends Component
{
    public $showDropdown = false;

    public function archive()
    {
        // ...
        $this->showDropdown = false;
    }

    public function delete()
    {
        // ...
        $this->showDropdown = false;
    }
}

```

```HTML (Alpine.js)
<div x-data="{ open: @entangle('showDropdown') }">
    <button @click="open = true">Show More...</button>

    <ul x-show="open" @click.outside="open = false">
        <li><button wire:click="archive">Archive</button></li>
        <li><button wire:click="delete">Delete</button></li>
    </ul>
</div>

```

```HTML (Alpine.js with .defer)
<div x-data="{ open: @entangle('showDropdown').defer }">
    ...
</div>

```

--------------------------------

### Customize Loading Indicator Display with Modifiers

Source: https://laravel-livewire.com/docs/2.x/loading-states

Livewire provides modifiers for the `wire:loading` directive to control the CSS display property of the loading indicator. These modifiers allow you to set the display to block, flex, grid, and more, or to hide the element entirely during loading.

```blade
<div wire:loading.block>...</div>
<div wire:loading.flex>...</div>
<div wire:loading.inline-flex>...</div>
<div wire:loading.grid>...</div>
<div wire:loading.inline>...</div>
<div wire:loading.table>...</div>

<div wire:loading.remove>Hide Me While Loading...</div>
```

--------------------------------

### Output PHP Data to Alpine.js with @js Directive

Source: https://laravel-livewire.com/docs/2.x/alpine-js

The `@js` directive in Livewire enables the safe and convenient output of PHP data directly into Alpine.js expressions. This allows you to pass complex PHP data structures, like arrays or objects, to your frontend JavaScript for use within Alpine components.

```HTML (Livewire/Alpine.js)
<div x-data="{ posts: @js($posts) }">
    ...
</div>

```

--------------------------------

### Target Livewire Model Array Changes

Source: https://laravel-livewire.com/docs/2.x/loading-states

Triggers a loading indicator when any property within a targeted array model changes. This is useful for synchronizing loading states for related data.

```html
<div>
    <input type="text" wire:model="post.title">
    <input type="text" wire:model="post.author">
    <input type="text" wire:model="post.content">

    <div wire:loading wire:target="post">
        Updating Post...
    </div>
</div>
```

--------------------------------

### Fire Event from Global JavaScript (JS)

Source: https://laravel-livewire.com/docs/2.x/events

This snippet illustrates how to dispatch a Livewire event from global JavaScript code. By using `Livewire.emit()`, you can trigger Livewire component actions or communication from any JavaScript context, such as after an AJAX call or a page load.

```JavaScript
Livewire.emit('postAdded')
```

--------------------------------

### Remove Namespace from RouteServiceProvider (Laravel 7)

Source: https://laravel-livewire.com/docs/2.x/upgrading

For Laravel 7 users registering Livewire components via `Route::get()`, the `namespace()` directive must be removed from `app/Providers/RouteServiceProvider.php`. This prevents Laravel from prepending an incorrect namespace to component class names.

```PHP
protected function mapWebRoutes()
{
    Route::middleware('web')
        ->namespace($this->namespace) // Remove me
        ->group(base_path('routes/web.php'));
}

```

--------------------------------

### Access Livewire Component Instance with @this

Source: https://laravel-livewire.com/docs/2.x/inline-scripts

This snippet shows how to use the `@this` Blade directive within a JavaScript block in a Livewire component's view. The `@this` directive compiles to a JavaScript object that represents the component instance, allowing you to read and write component properties, and call component methods. It also demonstrates how to listen for events emitted from the component.

```blade
<script>
    document.addEventListener('livewire:load', function () {
        // Get the value of the "count" property
        var someValue = @this.count

        // Set the value of the "count" property
        @this.count = 5

        // Call the increment component action
        @this.increment()

        // Run a callback when an event ("foo") is emitted from this component
        @this.on('foo', () => {})
    })
</script>
```

--------------------------------

### Scoping Livewire Events to Self with `emitSelf` (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

The `emitSelf` method emits an event only to the component instance that fired it. This is useful when an action should only affect the component that initiated it, preventing unintended side effects on other components.

```PHP
$this->emitSelf('postAdded');
```

--------------------------------

### Livewire Basic Polling

Source: https://laravel-livewire.com/docs/2.x/polling

Demonstrates the default usage of the `wire:poll` directive. When applied to an element, it will refresh the associated Livewire component every 2 seconds.

```blade
<div wire:poll>
    Current time: {{ now() }}
</div>
```

--------------------------------

### Show Element When Offline with wire:offline

Source: https://laravel-livewire.com/docs/2.x/offline-state

Demonstrates how to use the `wire:offline` attribute to conditionally display an HTML element when the user loses internet connection. The element is hidden by default and shown when offline.

```html
<div wire:offline>
    You are now offline.
</div>
```

--------------------------------

### Reset Livewire Component Properties

Source: https://laravel-livewire.com/docs/2.x/properties

Illustrates the use of $this->reset() and $this->resetExcept() methods to programmatically reset public property values to their initial states. This is particularly useful for clearing form inputs after actions.

```php
public $search ='';
public $isActive =true;

public function resetFilters()
{
    $this->reset('search');
    // Will only reset the search property.

    $this->reset(['search','isActive']);
    // Will reset both the search AND the isActive property.

    $this->resetExcept('search');
    // Will only reset the isActive property (any property but the search property).
}
```

--------------------------------

### Livewire Custom Validation Logic

Source: https://laravel-livewire.com/docs/2.x/input-validation

Demonstrates how to use Laravel's Validator facade within a Livewire component to perform custom validation. Catches ValidationException and passes errors to the view, mirroring the behavior of $this->validate().

```PHP
1use Illuminate\Support\Facades\Validator;


2 


3class ContactForm extends Component

4{

5public $email;

6 

7public function saveContact()

8{

9$validatedData = Validator::make(

10['email' => $this->email],

11['email' => 'required|email'],

12['required' => 'The :attribute field is required'],

13)->validate();

14 

15Contact::create($validatedData);

16}

}
```

--------------------------------

### Scoping Livewire Events to Self in Blade with `emitSelf`

Source: https://laravel-livewire.com/docs/2.x/events

Allows emitting an event directly to the current component instance from a Blade view. This is a targeted way to trigger an action within the same component.

```Blade
<button wire:click="$emitSelf('postAdded')">Emit to Self</button>
```

--------------------------------

### Update Livewire Query String Property Name

Source: https://laravel-livewire.com/docs/2.x/upgrading

Livewire v2 renames the `$updatesQueryString` property to `$queryString` for managing browser query parameters based on component state. This change simplifies the syntax for controlling URL synchronization.

```PHP
class Search extends Component
{
    // Before
    protected $updatesQueryString = ['search'];

    // After
    protected $queryString = ['search'];
}

```

--------------------------------

### Livewire 2.x: Custom Property Casting via Hydrate/Dehydrate

Source: https://laravel-livewire.com/docs/2.x/upgrading

Custom property caster classes are removed in Livewire V2. Functionality previously handled by custom casters can now be achieved using `hydrate` and `dehydrate` methods on the component. These methods allow for custom logic during data hydration and dehydration for specific properties.

```PHP
class MyComponent extends Component
{
    public $foo;

    // Replaces custom caster for string to uppercase on hydrate
    public function hydrateFoo($value)
    {
        $this->foo = strtoupper($value);
    }

    // Replaces custom caster for string to lowercase on dehydrate
    public function dehydrateFoo($value)
    {
        $this->foo = strtolower($value);
    }
}
```

--------------------------------

### Livewire: Conditional Query String Updates (Excluding Defaults)

Source: https://laravel-livewire.com/docs/2.x/query-string

Configures query string synchronization to exclude specific values, preventing clutter in the URL when a property is at its default state. This is ideal for pagination or filters where the default state (e.g., page 1) doesn't need to be in the URL.

```php
class SearchPosts extends Component
{
    public $foo;
    public $search = '';
    public $page = 1;

    protected $queryString = [
        'foo',
        'search' => ['except' => ''],
        'page' => ['except' => 1],
    ];

    // ... other methods
}
```

--------------------------------

### Dispatch Browser Event from Livewire (PHP)

Source: https://laravel-livewire.com/docs/2.x/events

This PHP code demonstrates how to dispatch a custom browser event named 'name-updated' from a Livewire component. It passes data, specifically a new name, to the event payload. This allows client-side scripts to react to changes within the Livewire component.

```php
$this->dispatchBrowserEvent('name-updated',['newName'=>$value]);
```

--------------------------------

### Livewire: Using wire:ignore with Select2

Source: https://laravel-livewire.com/docs/2.x/alpine-js

This snippet demonstrates how to integrate the Select2 JavaScript library within a Livewire component. The `wire:ignore` directive is applied to the parent element of the Select2 component to prevent Livewire from re-rendering it, allowing Select2 to manage its own DOM manipulations.

```html
<div wire:ignore>
    <select class="select2" name="state">
        <option value="AL">Alabama</option>
        <option value="WY">Wyoming</option>
    </select>
    <!-- Select2 will insert its DOM here. -->
</div>
```

```javascript
$(document).ready(function(){
    $('.select2').select2();
});
```

```php
@push('scripts')
<script>
$(document).ready(function(){
    $('.select2').select2();
});
</script>
@endpush
```

--------------------------------

### Adding Custom Error Messages

Source: https://laravel-livewire.com/docs/2.x/input-validation

Illustrates how to manually add a custom error message to a specific key in the component's error bag using the `$this->addError()` method.

```PHP
$this->addError('key','message')
```

--------------------------------

### Livewire Template Directives

Source: https://laravel-livewire.com/docs/2.x/reference

These directives are added to elements within Livewire component templates to enable dynamic behavior. They facilitate event binding, property synchronization, and DOM manipulation based on component state changes.

```HTML
<button wire:click="save">...</button>
<input wire:model="name" type="text">
<div wire:loading>Loading...</div>
<div wire:key="unique-id">...</div>
```

--------------------------------

### Livewire: Wrap Blade Conditionals

Source: https://laravel-livewire.com/docs/2.x/troubleshooting

Shows how to wrap Blade conditional directives like `@error` within a single HTML element. This ensures Livewire can correctly manage the DOM structure when these conditionals are present.

```blade
<input type="text" wire:model="name">
<div> @error('name'){{ $message }}@enderror </div>
```

--------------------------------

### Forward Specific Livewire Directive in Blade

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Shows how to selectively forward a specific Livewire directive, such as 'wire:model.defer', to an HTML element within a Blade component. This is useful for passing only the necessary Livewire attributes to child elements.

```blade
<input type="text" {{ $attributes->wire('model') }}>
```

--------------------------------

### Livewire Page Expired Callback Definition

Source: https://laravel-livewire.com/docs/2.x/deployment

Defines the basic structure of the `Livewire.onPageExpired()` callback function. This function is invoked when a page expiration event occurs, receiving the response and message from the server.

```javascript
Livewire.onPageExpired((response, message)=>{})
```

--------------------------------

### Livewire: Add Class to Dirty Input Element

Source: https://laravel-livewire.com/docs/2.x/dirty-states

Adds a CSS class to an element when its value differs from the last server-side data. Uses the `wire:dirty.class` directive to dynamically apply styling. The class is removed when the component updates or the value returns to its original state.

```html
<div>
    <input wire:dirty.class="border-red-500" wire:model.lazy="foo">
</div>
```

--------------------------------

### Scoping Livewire Events Upwards in Blade with `emitUp`

Source: https://laravel-livewire.com/docs/2.x/events

Allows emitting an event upwards through the component hierarchy directly from a Blade view. This is useful for triggering actions in parent components from child components.

```Blade
<button wire:click="$emitUp('postAdded')">Emit Up</button>
```

--------------------------------

### Livewire Error Display and Input Binding

Source: https://laravel-livewire.com/docs/2.x/input-validation

Shows the HTML structure for a Livewire component, including an input field bound with wire:model.lazy and conditional display of validation errors using @if($errors->has('email')). This allows users to see validation feedback.

```HTML
1<div>

2    Email: <input wire:model.lazy="email">

3 

4    @if($errors->has('email'))

5<span>{{ $errors->first('email') }}</span>

6    @endif

7 

8<button wire:click="saveContact">Save Contact</button>

9</div>
```

--------------------------------

### Assert Not Dispatched Browser Event (Livewire PHP)

Source: https://laravel-livewire.com/docs/2.x/testing

Asserts that a browser event was *not* dispatched from the component using the `dispatchBrowserEvent` method. This is useful for ensuring specific events are not triggered unintentionally.

```PHP
$component->assertNotDispatchedBrowserEvent('event');
```

--------------------------------

### Access Livewire Directives and Modifiers in Blade

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Demonstrates how to use the $attributes->wire() method in Blade components to retrieve the value and modifiers of Livewire directives like 'wire:model' and 'wire:loading'. This allows for granular control and inspection of attributes passed to components.

```blade
$attributes->wire('model')->value(); // "foo"
$attributes->wire('model')->modifiers(); // ["defer"]
$attributes->wire('model')->hasModifier('defer'); // true

$attributes->wire('loading')->hasModifier('class'); // true
$attributes->wire('loading')->value(); // "opacity-25"
```

--------------------------------

### Display Flashed Session Message in Blade View

Source: https://laravel-livewire.com/docs/2.x/flash-messages

Shows how to check for the existence of a session flash message and display it within a Blade template. This is typically used to provide user feedback after an action.

```Blade
1<formwire:submit.prevent="update">

2    <div>

3        @if (session()->has('message'))

4            <div class="alert alert-success">

5                {{ session('message') }}

6            </div>

7        @endif

8    </div>

9

10    Title: <input wire:model="post.title" type="text">

11

12    <button>Save</button>

13</form>
```

--------------------------------

### Define Computed Property in Livewire PHP

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates defining a computed property (`getPostProperty`) in a Livewire component. This property fetches a `Post` model based on `$this->postId` and is automatically cached for the current request lifecycle.

```php
class ShowPost extends Component
{
    // Computed Property
    public function getPostProperty()
    {
        return Post::find($this->postId);
    }
}
```

--------------------------------

### Livewire Real-time Validation with `updated` Hook

Source: https://laravel-livewire.com/docs/2.x/input-validation

Implements real-time validation in Livewire components using the `updated` hook and `validateOnly`. This method validates only the property that was just updated, preventing full form validation on every keystroke for a better user experience. It requires the component to have a `$rules` property defined.

```PHP
class ContactForm extends Component
{
    public $name;
    public $email;

    protected $rules = [
        'name' => 'required|min:6',
        'email' => 'required|email',
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

    public function saveContact()
    {
        $validatedData = $this->validate();

        Contact::create($validatedData);
    }
}
```

```HTML
<form wire:submit.prevent="saveContact">
    <input type="text" wire:model="name">
    @error('name') <span class="error">{{ $message }}</span> @enderror

    <input type="text" wire:model="email">
    @error('email') <span class="error">{{ $message }}</span> @enderror

    <button type="submit">Save Contact</button>
</form>
```

--------------------------------

### Livewire Polling: Only When Visible

Source: https://laravel-livewire.com/docs/2.x/polling

This Livewire feature allows you to conditionally poll the server only when a component's element is visible in the browser's viewport. It helps optimize performance by preventing unnecessary server requests for components that are not currently being viewed by the user. Simply add the `.visible` modifier to your `wire:poll` directive.

```html
<div wire:poll.visible></div>
```

--------------------------------

### Lazy Updating Livewire Input with wire:model.lazy

Source: https://laravel-livewire.com/docs/2.x/properties

Demonstrates using the lazy modifier with wire:model to update component properties only on the 'change' event, rather than the 'input' event. This is useful for text fields where immediate updates are not necessary.

```html
<input type="text" wire:model.lazy="message">
```

--------------------------------

### Delete Livewire Component using Artisan

Source: https://laravel-livewire.com/docs/2.x/artisan-commands

The `php artisan livewire:delete` command removes a Livewire component's class and Blade view. It offers options such as `--force` to bypass confirmation prompts and `--test` to remove associated test files. This command is aliased to `livewire:rm`.

```php
php artisan livewire:delete foo
# Removes Foo.php & foo.blade.php

php artisan livewire:delete foo --force
# Removes without confirmation prompt

php artisan livewire:delete foo --test
# Removes Foo.php & foo.blade.php & FooTest.php
```

--------------------------------

### Override paginationView() Method in Livewire Component (PHP)

Source: https://laravel-livewire.com/docs/2.x/pagination

Customize the default pagination view by overriding the `paginationView()` method within your Livewire component. This approach sets a global custom pagination view for all paginated results within that specific component.

```php
use Livewire\Component;
use Livewire\WithPagination;

class ShowPosts extends Component
{
    use WithPagination;

    ...

    public function paginationView()
    {
        return 'custom-pagination-links-view';
    }

    ...
}
```

--------------------------------

### Remove Class When Offline with wire:offline.class.remove

Source: https://laravel-livewire.com/docs/2.x/offline-state

Illustrates how to remove a CSS class from an element when the user is offline using the `wire:offline.class.remove` directive. This is the inverse of adding a class, reverting the element's state when connectivity is lost.

```html
<div wire:offline.class.remove="bg-green-300" class="bg-green-300"></div>
```

--------------------------------

### Use Computed Property in Livewire Action PHP

Source: https://laravel-livewire.com/docs/2.x/properties

Shows how a computed property (`$this->post`) can be accessed and utilized within a Livewire component's actions, such as deleting the associated post. It highlights the integration of computed properties into component logic for data manipulation.

```php
class ShowPost extends Component
{
    public $postId;
    
    public function getPostProperty()
    {
        return Post::find($this->postId);
    }
    
    public function deletePost()
    {
        $this->post->delete();
    }
}
```

--------------------------------

### Livewire Component Resetting Named Paginator

Source: https://laravel-livewire.com/docs/2.x/pagination

Shows how to reset a specific named paginator ('commentsPage') within a Livewire component. This is typically done when an action, like updating a search term, should reset the pagination state.

```php
class PostComments extends Livewire\Component
{
    use WithPagination;

    public $search ='';

    public function updatingSearch()
    {
        $this->resetPage('commentsPage');
    }

    public function render()
    {
        return view('livewire.show-posts',
            ['posts' => $post->comments()->where('title','like','%'.$this->search.'%')->paginate(10, ['*'], 'commentsPage')],
        );
    }
}
```

--------------------------------

### Accessing Validator Instance in Livewire

Source: https://laravel-livewire.com/docs/2.x/input-validation

Shows how to access the IlluminateValidationValidator instance within Livewire's validation process using the withValidator method. This allows for custom validation logic or modifications before rules are evaluated.

```php
use Illuminate\Validation\Validator;

class ContactForm extends Component
{
    public function save()
    {
        $this->withValidator(function(Validator $validator){
            $validator->after(function($validator){
                if ($this->somethingElseIsInvalid()) {
                    $validator->errors()->add('field','Something is wrong with this field!');
                }
            });
        })->validate();
    }
}
```

--------------------------------

### Livewire Polling Keep-Alive

Source: https://laravel-livewire.com/docs/2.x/polling

Explains the `keep-alive` modifier for `wire:poll`. This modifier ensures that polling continues at the normal rate even when the browser tab is in the background, preventing unnecessary server load reduction.

```blade
<div wire:poll.keep-alive>
    Current time: {{ now() }}
</div>
```

--------------------------------

### Alpine.js @entangle with Livewire Attributes

Source: https://laravel-livewire.com/docs/2.x/alpine-js

Illustrates how to use Alpine.js's @entangle directive within a Blade component to bind a Livewire property to an Alpine.js data property. It demonstrates accessing the Livewire model value via $attributes->wire('model') for dynamic state management.

```blade
<div x-data="{ open: @entangle($attributes->wire('model')) }">
    <span @click="open = true">{{$trigger }}</span>

    <div x-show="open" @click.outside="open = false">
        {{$slot }}
    </div>
</div>
```

--------------------------------

### Livewire: Remove Class from Dirty Input Element

Source: https://laravel-livewire.com/docs/2.x/dirty-states

Removes a CSS class from an element when it is in a 'dirty' state using the `wire:dirty.class.remove` directive. This is useful for styling elements based on their clean state, providing an inverse visual feedback mechanism.

```html
<div>
    <input wire:dirty.class.remove="bg-green-200" class="bg-green-200" wire:model.lazy="foo">
</div>
```

--------------------------------

### Livewire $event Variable

Source: https://laravel-livewire.com/docs/2.x/actions

The special '$event' variable in Livewire captures the native browser event object. It can be passed to component methods to access event properties like target values.

```html
<input wire:change="updateValue($event.target.value)">
<button wire:click="logEventKey($event.key)">Log Key</button>
```

--------------------------------

### Access Computed Property in Livewire Blade

Source: https://laravel-livewire.com/docs/2.x/properties

Illustrates accessing a computed property (`$this->post`) directly within a Livewire Blade view to display data like the post title. It also shows how to trigger component actions, like `deletePost`, using Livewire's `wire:click` directive.

```html
<div>
    <h1>{{ $this->post->title }}</h1>
    ...
    <button wire:click="deletePost">Delete Post</button>
</div>
```

--------------------------------

### Testing Livewire Validation - AssertHasNoErrors

Source: https://laravel-livewire.com/docs/2.x/input-validation

Illustrates the use of assertHasNoErrors in conjunction with assertHasErrors to test validation outcomes. This snippet checks if a 'name' field has a 'required' error while ensuring the 'email' field does not have a 'required' error.

```php
/** @test */
public function name_field_is_required_for_saving_a_contact()
{
    Livewire::test('contact-form')
        ->set('name','')
        ->set('email','foo')
        ->assertHasErrors(['name'=>'required'])
        ->assertHasNoErrors(['email'=>'required']);
}
```

--------------------------------

### Livewire Custom Polling Interval

Source: https://laravel-livewire.com/docs/2.x/polling

Shows how to customize the polling frequency by adding a directive modifier, such as `wire:poll.750ms`. This allows for more granular control over how often the component refreshes.

```blade
<div wire:poll.750ms>
    Current time: {{ now() }}
</div>
```

--------------------------------

### Livewire: Toggle Attributes with `wire:offline.attr`

Source: https://laravel-livewire.com/docs/2.x/offline-state

This snippet demonstrates how to use the `wire:offline.attr` modifier in Livewire to add an HTML attribute to an element when the browser is offline. The `.remove` modifier can be used to achieve the inverse behavior, removing attributes when offline.

```html
<button wire:offline.attr="disabled">Submit</button>

<button wire:offline.attr.remove="disabled">Enable Submit</button>
```

--------------------------------

### Remove Classes on Livewire Loading

Source: https://laravel-livewire.com/docs/2.x/loading-states

Removes a specified class from an element while a Livewire request is processing. This is useful for toggling states where a class is initially present and should be removed during loading.

```html
<div>
    <button wire:click="checkout" wire:loading.class.remove="bg-blue" class="bg-blue">
        Checkout
    </button>
</div>
```

--------------------------------

### Livewire Custom Error Messages and Attributes

Source: https://laravel-livewire.com/docs/2.x/input-validation

Demonstrates customizing validation error messages and attribute names in Livewire components. The `$messages` property allows overriding default Laravel messages, while `$validationAttributes` customizes the placeholder `:attribute` in messages. These can also be passed directly to `validate()` or `validateOnly()`.

```PHP
class ContactForm extends Component
{
    public $email;

    protected $rules = [
        'email' => 'required|email',
    ];

    protected $messages = [
        'email.required' => 'The Email Address cannot be empty.',
        'email.email' => 'The Email Address format is not valid.',
    ];

    protected $validationAttributes = [
        'email' => 'email address'
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

    public function saveContact()
    {
        $validatedData = $this->validate();

        Contact::create($validatedData);
    }
}
```

```PHP
class ContactForm extends Component
{
    public $email;

    public function saveContact()
    {
        $validatedData = $this->validate(
            ['email' => 'required|email'],
            [
                'email.required' => 'The :attribute cannot be empty.',
                'email.email' => 'The :attribute format is not valid.',
            ],
            ['email' => 'Email Address']
        );

        Contact::create($validatedData);
    }
}
```

--------------------------------

### Livewire Event Modifiers

Source: https://laravel-livewire.com/docs/2.x/actions

Livewire provides event modifiers to control event behavior directly in the HTML. These include 'stop' for event.stopPropagation(), 'prevent' for event.preventDefault(), 'self' to trigger only on the element itself, and 'debounce.Xms' to limit action calls.

```html
<button wire:click.stop="doSomething">Stop Propagation</button>
<button wire:click.prevent="doSomethingElse">Prevent Default</button>
<div wire:click.self="doSomethingOnSelf">Click Me Directly</div>
<input wire:keydown.debounce.250ms="search">
```

--------------------------------

### Reset Livewire Pagination on Filter Update

Source: https://laravel-livewire.com/docs/2.x/pagination

Explains how to reset the pagination page to '1' when a search or filter input is updated in a Livewire component. It uses the `updating` lifecycle hook and the `resetPage()` method to ensure correct results after filtering.

```php
use Livewire\WithPagination;

class ShowPosts extends Component
{
    use WithPagination;

    public $search = '';

    public function updatingSearch()
    {
        $this->resetPage();
    }

    public function render()
    {
        return view('livewire.show-posts',
            ['posts' => Post::where('title', 'like', '%'.$this->search.'%')->paginate(10)]
        );
    }
}
```

=== COMPLETE CONTENT === This response contains all available snippets from this library. No additional content exists. Do not make further requests.