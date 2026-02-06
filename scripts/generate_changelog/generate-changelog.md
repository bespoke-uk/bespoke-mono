# Generating Detailed Changelogs

This document describes how to generate detailed, accurate changelogs for packages in the Bespoke monorepo using the changelog generation scripts and Claude Code.

## Overview

The changelog generation process has two phases:
1. **Prepare**: Run shell scripts to extract git history into report files
2. **Analyze**: Use Claude Code to read the reports and write detailed changelog entries

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/generate_changelog/generate-changelog.sh` | Generates git history report for a single package |
| `scripts/generate_changelog/changelog-batch.sh` | Batch workflow for processing multiple packages |

## Workflow

### Step 1: Prepare Git History Reports

Run the prepare command for each directory you want to process:

```bash
# Prepare all packages in a directory
./scripts/generate_changelog/changelog-batch.sh prepare cms
./scripts/generate_changelog/changelog-batch.sh prepare crm
./scripts/generate_changelog/changelog-batch.sh prepare core
./scripts/generate_changelog/changelog-batch.sh prepare blade
```

This creates:
- `.changelog_progress.json` in the directory (tracks which packages are done)
- `.git_history_report.txt` in each package (contains commit history and diffs)

### Step 2: Check Status

```bash
./scripts/generate_changelog/changelog-batch.sh status cms
./scripts/generate_changelog/changelog-batch.sh status crm
```

Shows:
- Total packages
- Completed/pending/skipped counts
- List of pending packages

### Step 3: Process Each Package

For each pending package:

```bash
# Get the next package to process
./scripts/generate_changelog/changelog-batch.sh next cms
```

Then in Claude Code, ask:

> Read the git history report at `cms/page/.git_history_report.txt` and update the CHANGELOG.md with detailed, specific entries based on the actual code changes.

### Step 4: Mark Complete

After updating a changelog:

```bash
./scripts/generate_changelog/changelog-batch.sh mark-done cms/page
```

## What Makes a Good Changelog Entry

### Bad (Vague)
```markdown
## [10.0.5] - 2025-08-22

### Changed
- Updated to use new blade components
- Fixed some issues
- Improved performance
```

### Good (Specific)
```markdown
## [10.0.5] - 2025-08-22

### Changed
- **Blade component namespace migration**: Updated all admin views to use new `x-admin.*` prefixed components:
  - `x-layout.admin` → `x-admin.layout`
  - `x-content.header` → `x-admin.content.header`
  - `x-content.body` → `x-admin.content.body`
- Refactored `PageController::show()` to use route model binding instead of manual query
- Updated `HasSlug` trait to generate unique slugs with numeric suffix on collision

### Fixed
- Fixed `PageDataTable` search not filtering by `meta_description` column
- Resolved N+1 query in `Page::withImages()` scope by eager loading `images` relationship

### Added
- New `page.editor_type` config option to switch between WYSIWYG/markdown editors
- Added `FallbackController` for last-resort route matching on nested slugs
```

## Guidelines for Claude Code

When analyzing git history reports and writing changelog entries:

### 1. Read the Diffs Carefully
- Look at what files were actually changed
- Examine method signatures, class names, config keys
- Note renamed/moved files

### 2. Be Specific
- Mention class names: `HasPermissions::hasRole()`
- Mention config keys: `page.editor_type`
- Mention file paths when relevant: `routes/admin.php`
- List specific component renames with before/after

### 3. Categorize Correctly
- **Added**: New files, methods, features, config options
- **Changed**: Refactoring, behavior changes, updates
- **Fixed**: Bug fixes, error corrections
- **Removed**: Deleted features, deprecated code
- **Security**: Security-related updates

### 4. Skip Noise
- Ignore "Fix styling" commits (Pint formatting)
- Ignore merge commits
- Ignore dependabot bumps (unless security-related)
- Ignore "- Debugging" commits

### 5. Group Related Changes
- Multiple commits for the same feature should be one entry
- Version bump commits mark release boundaries

### 6. Explain the "Why"
- Not just "Updated controller" but "Updated controller to use dependency injection for testability"
- Not just "Added caching" but "Added permanent caching for roles to reduce database queries"

## Example Claude Code Prompt

```
I need to update the changelog for the cms/page package.

Please:
1. Read the git history report at cms/page/.git_history_report.txt
2. Analyze the commits and diffs to understand what actually changed
3. Update cms/page/CHANGELOG.md with detailed, specific entries

Follow the Keep a Changelog format. Be specific - mention class names, method names,
config keys. Look at the core/acl/CHANGELOG.md for an example of the level of detail expected.
```

## Batch Processing with Claude Code

To process multiple packages efficiently, you can ask Claude Code:

```
Process all pending changelogs in the cms directory:
1. For each package, read the .git_history_report.txt
2. Update the CHANGELOG.md with detailed entries
3. Mark each package as done when complete

Start with the first pending package and work through them sequentially.
```

## Troubleshooting

### No git history report found
```bash
# Regenerate for a single package
./scripts/generate_changelog/generate-changelog.sh cms/page
```

### Reset progress tracking
```bash
./scripts/generate_changelog/changelog-batch.sh reset cms
```

### List packages without processing
```bash
./scripts/generate_changelog/generate-changelog.sh -l -d cms
```

## File Locations

| File | Location |
|------|----------|
| Progress tracking | `{directory}/.changelog_progress.json` |
| Git history report | `{package}/.git_history_report.txt` |
| Changelog | `{package}/CHANGELOG.md` |

## Keep a Changelog Format

All changelogs should follow [Keep a Changelog](https://keepachangelog.com/en/1.0.0/):

```markdown
# Changelog

All notable changes to `package-name` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- New features

### Changed
- Changes to existing functionality

### Fixed
- Bug fixes

### Removed
- Removed features

### Security
- Security fixes

## [1.0.0] - 2024-01-15

### Added
- Initial release
```
