#!/bin/bash
# Hook: Provide monorepo context at session start
# Triggered by: SessionStart

set -e

INPUT=$(cat)
SOURCE=$(echo "$INPUT" | jq -r '.source // "startup"')

# Only run on fresh startup, not resume
if [[ "$SOURCE" != "startup" ]]; then
    exit 0
fi

cat << 'EOF'
<bespoke-monorepo-context>
You are working in the Bespoke CMS monorepo containing 109 Laravel packages.

Quick Reference:
- Reference implementation: /crm/contact (100% compliant)
- Package standards: /PACKAGE_STANDARDS.md
- Monorepo analysis: /MONOREPO_ANALYSIS.md

Available Skills:
- /audit <path> - Audit package compliance
- /new-crud <category/name> - Create new CRUD package
- /add-api <path> - Add API to package
- /add-exports <path> - Add import/export
- /fix-contracts <path> - Generate missing contracts

Package Types:
- CRUD: Full API, exports, imports, 8-13+ contracts
- Utility: Simplified, no API required

Key Patterns:
- Contracts in src/Contracts/ (not Interfaces/)
- Config-driven bindings via register*Bindings()
- UUID route binding: {model:uuid}
- Nested config: controllers.admin/api, requests.admin/api
</bespoke-monorepo-context>
EOF

exit 0
