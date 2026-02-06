# Claude Code Memory

This file stores persistent context, preferences, and notes for Claude Code sessions working with the Bespoke CMS monorepo.

## User Preferences

### Code Style
- Prefer explicit over implicit
- Use contracts (interfaces) for all bound classes
- Strict types in all PHP files
- Past tense for events, action descriptions for listeners

### Communication
- Be concise and direct
- Provide code examples when explaining patterns
- Reference specific files rather than abstract descriptions

### Workflow
- Run `/audit` before major changes
- Run `/sync-docs` after significant work
- Always format with Pint before commits

## Project Context

### Current Focus Areas
- Bringing packages up to docs/standards/package_standards.md compliance
- Ensuring consistent API patterns across CRUD packages
- Improving test coverage

### Known Issues

**Legacy Interfaces (Need Migration to Contracts/):**
- `core/image` - `ImagesInterface` (HIGH priority - used by many models)
- `core/editor` - `EditableInterface` (HIGH priority - used by Page, Post, etc.)
- `core/document` - `DocumentsInterface` (HIGH priority)
- `core/note` - `NotesInterface` (HIGH priority)
- `core/employee` - `AssigneeInterface`, `AssigneesInterface` (MEDIUM priority)
- `core/module` - 13 interfaces (LOW priority - framework level)
- `core/setting` - 4 interfaces (LOW priority - constants)

See `docs/registry/interfaces_registry.md` for complete list of 30 legacy interfaces.

### Architectural Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-04 | Use `Contracts/` not `Interfaces/` | Consistency with Laravel ecosystem conventions |
| 2026-02-04 | Always search monorepo before renaming | Cross-package dependencies can break silently (see package_standards.md 10.22) |
| 2026-02-04 | Document all interfaces in registry | Created `docs/registry/interfaces_registry.md` to track ~304 interfaces/contracts |

## Package Notes

### High Priority Packages
Packages needing attention (from docs/registry/monorepo_analysis.md):
- `core/user` (55%) - Needs exports/imports
- `core/profile` (45%) - Needs API endpoints
- `ecommerce/product` (25%) - Scaffold only, needs full implementation

### Recently Completed
- `core/document` - Upgraded to 90% (full CRUD: API, exports, imports, contracts)
- `core/image` - Upgraded to 90% (full CRUD: API, exports, imports, contracts)
- `core/note` - Upgraded to 90% (full CRUD: API, exports, imports, contracts)

### Reference Packages
- `/crm/contact` - Gold standard, 100% compliant
- `/cms/page` - Good CMS package example
- `/core/auth` - Complex package example (21 contracts)

## Session Notes

### Recent Sessions

_Add notes from sessions here for continuity_

---

## How to Use This File

1. **Before starting work:** Read this file for context
2. **During sessions:** Add notes about decisions, discoveries, blockers
3. **After sessions:** Update with completed work and next steps
4. **Regularly:** Review and clean up stale information

This file is checked into the repository and persists between sessions.
