# Repository Guidelines

## Project Structure & Module Organization
This is the Bespoke CMS monorepo with 100+ Laravel packages grouped by domain. Key roots:
- `api/`, `blade/`, `cms/`, `core/`, `crm/`, `default/`, `custom/`, `ecommerce/` contain packages.
- `template/` holds package scaffolds and tooling.
- `workbench/` is the Laravel test app (assets in `workbench/public/`).
- `docs/` contains standards, ADRs, and reference material.
Each package is self-contained with `src/`, `routes/`, `resources/`, `config/`, and `tests/`. Reference implementation: `crm/contact`.

## Architecture & Standards
Packages are either CRUD (full compliance) or Utility (simplified). Use `docs/PACKAGE_STANDARDS.md` to classify and build correctly.
Key rules from `docs/DECISIONS.md`:
- Use `src/Contracts/` (not `Interfaces/`).
- All bindings are config-driven (see `config/*.php`).
- API routes use UUID route keys, e.g. `/api/contacts/{contact:uuid}`.

## Build, Test, and Development Commands
Run commands inside a package directory:
- `composer test`, `composer test:parallel`, `composer test:coverage`.
- `composer analyse` (PHPStan), `composer format` (Pint), `composer build` (workbench).
Monorepo helpers: `./_pint.sh`, `./_update.sh`, `./_remove_vendor.sh`.

## Coding Style & Naming Conventions
- PHP: `declare(strict_types=1)`, PSR-12, 4-space indent, 120-char line limit.
- Return types required; trailing commas in arrays.
- CRUD naming: `StoreModel`, `UpdateModel`, `{Model}Resource`, `{Model}Collection`, `CreateModel`.
Tools: Pint, PHPStan, Rector.

## Testing Guidelines
Framework: PHPUnit with Orchestra Testbench. Follow the `tests/` structure in `docs/TESTING_GUIDE.md`.
Run a single test: `composer test -- --filter=TestName`. Coverage uses Xdebug and is optional unless required by the package.

## Commit & Pull Request Guidelines
No enforced commit message format is documented; keep messages short and scoped (e.g., `core/auth: fix token refresh`).
Optional hooks in `docs/GIT_HOOKS.md` can validate strict types, block `Interfaces/`, and warn on `dd()/dump()` or `env()` usage.
PRs should list packages touched and call out new routes, config keys, or migrations.
