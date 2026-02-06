# Claude Code Project State

This file tracks work-in-progress and session context for the Bespoke CMS monorepo.

## Current Task: Expand Claude Code Tooling

**Started:** 2026-02-04
**Status:** Completed

### Items Created

#### Skills (8) - All Complete
- [x] `/add-tests` - Scaffold PHPUnit tests for a package
- [x] `/add-livewire` - Add Livewire component following patterns
- [x] `/add-event` - Create event + optional listener
- [x] `/new-blade` - Create blade package from skeleton-blade
- [x] `/upgrade-package` - Upgrade older package to latest standards
- [x] `/add-migration` - Create database migration for package
- [x] `/check-deps` - Analyse package dependencies
- [x] `/test-packages` - Run tests across packages

#### Agents (3) - All Complete
- [x] `test-scaffolder` - Creates test files matching package patterns
- [x] `dependency-analyzer` - Analyses cross-package dependencies
- [x] `migration-scaffolder` - Creates migrations following conventions

#### Hooks (2) - All Complete
- [x] `validate-commit.sh` - Pre-commit audit checks
- [x] `ensure-claude-md.sh` - Ensure new packages have CLAUDE.md

#### Documentation (5) - All Complete (in `docs/`)
- [x] `docs/guides/testing_guide.md` - Standard test patterns
- [x] `docs/standards/decisions.md` - Architectural decision records
- [x] `docs/guides/upgrade_checklist.md` - Step-by-step upgrade guide
- [x] `docs/guides/git_hooks.md` - Git hooks setup and configuration
- [x] `docs/guides/ci_cd_guide.md` - CI/CD pipeline integration guide

#### Memory/Context (1) - Complete
- [x] `.claude/memory.md` - Persistent preferences and notes

#### Scripts (1) - Complete
- [x] `scripts/setup-hooks.sh` - Git hooks installation script

#### MCP Server Extensions (3) - All Complete
- [x] `get_test_coverage` - Check test coverage
- [x] `compare_packages` - Compare two packages
- [x] `get_package_health` - Combined health check

### Progress Log

| Date | Items Completed |
|------|-----------------|
| 2026-02-04 | Started task, created project-state.md |
| 2026-02-04 | Created all 5 new skills |
| 2026-02-04 | Created all 3 new agents |
| 2026-02-04 | Created both new hooks |
| 2026-02-04 | Created all 3 documentation files |
| 2026-02-04 | Created memory.md |
| 2026-02-04 | Extended MCP server with 3 new tools |
| 2026-02-04 | Updated CLAUDE.md, instructions.md, settings.json |

---

## Previous Sessions

### 2026-02-04: Tooling Expansion (Phase 1)
Expanded Claude Code tooling from 6 skills to 11, 6 agents to 9, 3 hooks to 5, and 6 MCP tools to 9. Also created 3 new documentation files and persistent memory/project-state files.

### 2026-02-04: Tooling Expansion (Phase 2)
Added 3 more skills (`/add-migration`, `/check-deps`, `/test-packages`), created `git_hooks.md` and `ci_cd_guide.md` documentation, and added `scripts/setup-hooks.sh` for easy git hook installation. Final count: 14 skills, 9 agents, 5 hooks, 9 MCP tools, 14 documentation files.

### 2026-02-04: Documentation Reorganisation
Moved all documentation files (except CLAUDE.md) to `docs/` directory for cleaner root. Updated all cross-references in CLAUDE.md, instructions.md, skills, and agents.

### 2026-02-04: Polymorphic Manager Package Upgrades
Upgraded three polymorphic manager packages to full CRUD compliance:
- `core/document` - 40% -> 90% (API routes, controllers, resources, exports, imports, 11 contracts)
- `core/image` - 40% -> 90% (API routes, controllers, resources, exports, imports, 11 contracts)
- `core/note` - 40% -> 90% (API routes, controllers, resources, exports, imports, 11 contracts)

### 2026-02-04: Documentation Sync
Ran `/sync-docs` to update all documentation reflecting the package upgrades:
- Updated CLAUDE.md, monorepo_analysis.md, instructions.md, memory.md, project-state.md
- Corrected package counts: 108 total (was 109), 34 blade (was 35)
- Moved document, image, note from "needs work" to "90% complete"

### 2026-02-04: Interface to Contract Migrations
Migrated multiple packages from old `Interfaces/` pattern to new `Contracts/` pattern:

**CRM Package Migrations:**
- `crm/address` - `AddressesInterface` → `Addresses`
- `crm/contact` - `ContactsInterface` → `Contacts`
- `crm/calendar-event` - `CalendarEventsInterface` → `CalendarEvents`
- `crm/customer-package` - `PackageTimesInterface` → `PackageTimes`
- Added export functionality to: customer, supplier, address, city, county, region, calendar-event

**SEO Interface Migration (High Impact):**
- Renamed `Bespoke\Seo\Interfaces\SeoInterface` → `Bespoke\Seo\Contracts\Seo`
- Fixed 10 broken cross-package references in: City, County, Region, Continent, Country, Page, Post, PostCategory, CaseStudy, CaseStudyCategory

**Documentation Created:**
- `docs/registry/interfaces_registry.md` - Comprehensive catalogue of ~304 interfaces/contracts across monorepo
- Added Section 10.22 to `docs/standards/package_standards.md` - Guidance on updating cross-package references when renaming
- Updated package_standards.md version to 1.7

### 2026-02-06: Documentation Directory Reorganisation
Reorganised the `docs/` directory from 14 flat files into 4 purpose-based subdirectories:

**Structure:**
- `docs/standards/` — Architecture standards (package_standards.md, decisions.md + 5 existing sub-docs)
- `docs/registry/` — Monorepo knowledge base (monorepo_analysis, interfaces_registry, dependencies, database_schema, event_listeners, livewire_components, routes_overview)
- `docs/guides/` — Development workflows (testing_guide, upgrade_checklist, ci_cd_guide, git_hooks, project_examples)
- `docs/references/` — External library docs (unchanged)

**Changes:**
- 14 files moved via `git mv` across 3 subdirectories
- Created `docs/index.md` as central entry point
- Updated ~100+ cross-references across ~28 files (CLAUDE.md, .claude/, agents, skills, AGENTS.md, GEMINI.md)
