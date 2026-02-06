# Bespoke CMS Documentation Index

Central entry point for all monorepo documentation. Files are organised by purpose into four subdirectories.

## Standards & Architecture

Package architecture, compliance requirements, and design decisions.

| Document | Purpose |
|----------|---------|
| [package_standards.md](standards/package_standards.md) | Architecture standards and compliance requirements (~850 line index + 5 sub-documents) |
| [contracts.md](standards/contracts.md) | Contract-first development patterns and examples |
| [serviceprovider.md](standards/serviceprovider.md) | ServiceProvider binding methods and config structure |
| [code_examples.md](standards/code_examples.md) | Reference code snippets for common patterns |
| [audit_checklist.md](standards/audit_checklist.md) | 88-point package compliance checklist |
| [common_pitfalls.md](standards/common_pitfalls.md) | 22 common mistakes and their solutions |
| [decisions.md](standards/decisions.md) | Architectural decision records (ADRs) |

## Registry

Comprehensive catalogues of what exists across the monorepo.

| Document | Purpose |
|----------|---------|
| [monorepo_analysis.md](registry/monorepo_analysis.md) | Complete analysis of all 108 packages with status |
| [interfaces_registry.md](registry/interfaces_registry.md) | Catalogue of ~304 interfaces and contracts |
| [dependencies.md](registry/dependencies.md) | Cross-package dependency map |
| [database_schema.md](registry/database_schema.md) | All database tables, relationships, and migrations |
| [event_listeners.md](registry/event_listeners.md) | Cross-package event communication (88 events, 31 listeners) |
| [livewire_components.md](registry/livewire_components.md) | Component registry (98 Livewire components) |
| [routes_overview.md](registry/routes_overview.md) | API, admin, and frontend routes across all packages |

## Guides

Development workflows, testing, and operational procedures.

| Document | Purpose |
|----------|---------|
| [testing_guide.md](guides/testing_guide.md) | Testing standards, patterns, and examples |
| [upgrade_checklist.md](guides/upgrade_checklist.md) | Step-by-step package upgrade guide |
| [ci_cd_guide.md](guides/ci_cd_guide.md) | CI/CD pipeline integration guide |
| [git_hooks.md](guides/git_hooks.md) | Git hooks setup and configuration |
| [project_examples.md](guides/project_examples.md) | Typical project configurations and package combinations |

## References

Bespoke-specific cheat sheet and external library documentation.

| Document | Purpose |
|----------|---------|
| [bespoke_cheatsheet.md](references/bespoke_cheatsheet.md) | **Concise patterns cheat sheet** — real Laravel, Livewire v2, Alpine.js, and Tailwind examples from this monorepo |
| [laravel_10_docs.md](references/laravel_10_docs.md) | Laravel 10 framework reference (full) |
| [laravel_livewire_v2_docs.md](references/laravel_livewire_v2_docs.md) | Livewire v2 component patterns (full) |
| [tailwind.css_v3_docs.md](references/tailwind.css_v3_docs.md) | Tailwind CSS utility classes (full) |
