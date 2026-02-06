---
name: new-crud
description: Create a new CRUD package from the skeleton-crud template
argument-hint: "<category>/<package-name> [ModelName]"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
context: fork
agent: crud-scaffolder
---

Create a new CRUD package following Bespoke standards.

**Arguments:** $ARGUMENTS

Parse the arguments:
- First argument: `category/package-name` (e.g., `crm/invoice`, `custom/ticket`)
- Second argument (optional): `ModelName` (defaults to PascalCase of package-name)

Example usage:
- `/new-crud crm/invoice` - Creates Invoice package in crm/
- `/new-crud custom/support-ticket SupportTicket` - Creates SupportTicket package

Steps:
1. Copy `/template/skeleton-crud` to the target location
2. Replace all placeholders with package-specific values
3. Rename files to match the model name
4. Create full directory structure per docs/standards/package_standards.md
5. Generate all required contracts
6. Configure ServiceProvider with all binding methods
7. Set up config file with 22 sections
8. Create CLAUDE.md documentation
9. Run `composer install`, `composer format`, `composer analyse`

Output a summary of created files and next steps.
