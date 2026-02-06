---
name: add-exports
description: Add import and export functionality to an existing Bespoke package
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

Add import and export functionality to the package at the specified path.

**Package Path:** $ARGUMENTS

## What This Creates

### Export Functionality

1. **Contract** - `src/Contracts/{Model}Export.php`
```php
interface {Model}Export extends FromView, WithStyles
{
    public function view(): View;
    public function styles(Worksheet $sheet): array;
}
```

2. **Implementation** - `src/Exports/{Model}Export.php`
```php
class {Model}Export implements {Model}ExportContract
{
    public function __construct(protected Collection $models) {}

    public function view(): View
    {
        return view('{package}::exports.{models}', [
            '{models}' => $this->models,
        ]);
    }

    public function styles(Worksheet $sheet): array
    {
        return [
            1 => ['font' => ['bold' => true]],
        ];
    }
}
```

3. **View** - `resources/views/exports/{models}.blade.php`
```blade
<table>
    <thead>
        <tr>
            <th>UUID</th>
            <th>Name</th>
            <!-- other columns -->
            <th>Created At</th>
        </tr>
    </thead>
    <tbody>
        @foreach(${models} as ${model})
        <tr>
            <td>{{ ${model}->uuid }}</td>
            <td>{{ ${model}->name }}</td>
            <td>{{ ${model}->created_at }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
```

### Import Functionality

1. **Contract** - `src/Contracts/{Model}Import.php`
```php
interface {Model}Import extends ToCollection, WithHeadingRow
{
    public function collection(Collection $rows): void;
}
```

2. **Implementation** - `src/Imports/{Model}Import.php`
```php
class {Model}Import extends AbstractImport implements {Model}ImportContract
{
    public function collection(Collection $rows): void
    {
        foreach ($rows as $row) {
            app({Model}Contract::class)->updateOrCreate(
                ['uuid' => $row['uuid']],
                [
                    'name' => $row['name'],
                    // other fields
                ]
            );
        }
    }
}
```

3. **Schema File** - `resources/schema/{models}.tsv`
```
uuid	name	status	created_at
```

### Config Updates

Add to `config/{package}.php`:
```php
'export' => [
    '{model}' => \Bespoke\{Package}\Exports\{Model}Export::class,
],

'import' => [
    '{model}' => \Bespoke\{Package}\Imports\{Model}Import::class,
    'schema_file' => __DIR__.'/../resources/schema/{models}.tsv',
],
```

### ServiceProvider Updates

```php
protected function registerExportBindings(): void
{
    $this->app->bind({Model}ExportContract::class, function ($app) {
        return $app->make($app->config['{package}.export.{model}']);
    });
}

protected function registerImportBindings(): void
{
    $this->app->bind({Model}ImportContract::class, function ($app) {
        return $app->make($app->config['{package}.import.{model}']);
    });
}
```

## Process

1. Read the package to understand the model and its fields
2. Create all export files (contract, implementation, view)
3. Create all import files (contract, implementation, schema)
4. Update config file
5. Update ServiceProvider with binding methods

Output a report of all files created and how to use the export/import functionality.
