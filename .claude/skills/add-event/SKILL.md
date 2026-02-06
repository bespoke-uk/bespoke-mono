---
name: add-event
description: Add an event and optional listener to a Bespoke package
argument-hint: "<package-path> <EventName> [ListenerName]"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

Add an event (and optionally a listener) to the package following established patterns.

**Arguments:** $ARGUMENTS

Parse arguments:
- First: package path (e.g., `crm/contact`)
- Second: event name in PascalCase, past tense (e.g., `ContactCreated`)
- Third (optional): listener name (e.g., `NotifyContactOwner`)

## What This Creates

### 1. Event Class

Create `src/Events/{EventName}.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Events;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class {EventName}
{
    use Dispatchable;
    use InteractsWithSockets;
    use SerializesModels;

    public function __construct(
        public readonly {ModelName}Contract ${model_name},
    ) {
    }
}
```

### 2. Listener Class (if requested)

Create `src/Listeners/{ListenerName}.php`:

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Listeners;

use Bespoke\{PackageName}\Events\{EventName};

class {ListenerName}
{
    public function __construct()
    {
        // Inject dependencies
    }

    public function handle({EventName} $event): void
    {
        // Handle the event
        ${model_name} = $event->{model_name};
    }
}
```

### 3. Config Registration

Add to `config/{package-name}.php` in the `listeners` array:

```php
'listeners' => [
    \Bespoke\{PackageName}\Events\{EventName}::class => [
        \Bespoke\{PackageName}\Listeners\{ListenerName}::class,
    ],
    // ... existing listeners
],
```

## Event Naming Conventions

Events use **past tense** to indicate something has happened:

| Action | Event Name |
|--------|------------|
| Create | `{ModelName}Created` |
| Update | `{ModelName}Updated` |
| Delete | `{ModelName}Deleted` |
| Restore | `{ModelName}Restored` |
| Archive | `{ModelName}Archived` |
| Approve | `{ModelName}Approved` |
| Reject | `{ModelName}Rejected` |
| Publish | `{ModelName}Published` |
| Login | `LoggedIn` |
| Logout | `LoggedOut` |

## Listener Naming Conventions

Listeners describe **what they do**:

| Purpose | Listener Name |
|---------|---------------|
| Record activity | `RecordActivity` |
| Send notification | `SendNotification` |
| Update cache | `InvalidateCache` |
| Sync external | `SyncToExternal` |
| Audit | `CreateAuditLog` |

## Event Templates

### Model Event (with model reference)

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Events;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class {ModelName}Created
{
    use Dispatchable;
    use InteractsWithSockets;
    use SerializesModels;

    public function __construct(
        public readonly {ModelName}Contract ${model_name},
    ) {
    }
}
```

### Action Event (with additional data)

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Events;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class {ModelName}StatusChanged
{
    use Dispatchable;
    use InteractsWithSockets;
    use SerializesModels;

    public function __construct(
        public readonly {ModelName}Contract ${model_name},
        public readonly string $oldStatus,
        public readonly string $newStatus,
    ) {
    }
}
```

### Broadcastable Event

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Events;

use Bespoke\{PackageName}\Contracts\{ModelName} as {ModelName}Contract;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class {ModelName}Updated implements ShouldBroadcast
{
    use Dispatchable;
    use InteractsWithSockets;
    use SerializesModels;

    public function __construct(
        public readonly {ModelName}Contract ${model_name},
    ) {
    }

    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('{model-name}.'.$this->{model_name}->id),
        ];
    }
}
```

## Listener Templates

### Basic Listener

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Listeners;

use Bespoke\{PackageName}\Events\{EventName};

class {ListenerName}
{
    public function handle({EventName} $event): void
    {
        // Handle the event
    }
}
```

### Queued Listener

```php
<?php

declare(strict_types=1);

namespace Bespoke\{PackageName}\Listeners;

use Bespoke\{PackageName}\Events\{EventName};
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class {ListenerName} implements ShouldQueue
{
    use InteractsWithQueue;

    public int $tries = 3;
    public int $backoff = 60;

    public function handle({EventName} $event): void
    {
        // Handle the event asynchronously
    }

    public function failed({EventName} $event, \Throwable $exception): void
    {
        // Handle failure
    }
}
```

## Output Report

```
## Event/Listener Report: {package-name}

### Created Files
- src/Events/{EventName}.php
- src/Listeners/{ListenerName}.php (if requested)

### Config Updated
- config/{package-name}.php (added to listeners array)

### Usage

**Dispatch event:**
```php
use Bespoke\{PackageName}\Events\{EventName};

{EventName}::dispatch(${model_name});
```

**In model observer:**
```php
public function created({ModelName} ${model_name}): void
{
    {EventName}::dispatch(${model_name});
}
```

### Next Steps
1. Implement listener logic
2. Consider if listener should be queued
3. Add tests for event/listener
4. Update docs/EVENT_LISTENERS.md documentation
```

## Important Notes

- Events use past tense (something happened)
- Listeners describe actions (what to do)
- Use contracts for model type hints
- Events are registered via config `listeners` array
- Consider using queued listeners for slow operations
- Update docs/EVENT_LISTENERS.md after adding significant events
