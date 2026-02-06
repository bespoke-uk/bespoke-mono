---
name: add-migration
description: Create a database migration for a Bespoke package following naming conventions
argument-hint: "<package-path> <description>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
context: fork
agent: migration-scaffolder
---

Create a database migration for the package at the specified path.

**Arguments:** $ARGUMENTS

Parse arguments:
- First: package path (e.g., `crm/contact`)
- Second: migration description (e.g., `add status column to contacts`)

## Migration Types

Based on the description, determine the migration type:

| Description Pattern | Migration Type | File Name |
|---------------------|----------------|-----------|
| "create ... table" | Create table | `create_{table}_table.php.stub` |
| "add ... to ..." | Add column | `add_{column}_to_{table}_table.php.stub` |
| "remove ... from ..." | Remove column | `remove_{column}_from_{table}_table.php.stub` |
| "add ... index" | Add index | `add_{name}_index_to_{table}_table.php.stub` |
| "add ... foreign" | Add foreign key | `add_{column}_foreign_to_{table}_table.php.stub` |

## Output Location

Migrations are created in `database/migrations/` with `.stub` extension for Laravel package publishing.

## Examples

```bash
/add-migration crm/contact "add status column to contacts"
# Creates: database/migrations/add_status_to_contacts_table.php.stub

/add-migration core/user "create user_preferences table"
# Creates: database/migrations/create_user_preferences_table.php.stub

/add-migration crm/customer "add user_id foreign to customers"
# Creates: database/migrations/add_user_id_foreign_to_customers_table.php.stub
```

## Standards

All migrations follow these patterns:
- `declare(strict_types=1);`
- Anonymous class syntax (`return new class extends Migration`)
- Both `up()` and `down()` methods implemented
- UUID column for new tables
- Soft deletes for entity tables
- Proper foreign key constraints with `nullOnDelete()` or `cascadeOnDelete()`
