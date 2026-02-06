#!/bin/bash

# Script to add rector dependencies to composer.json files
# Usage: ./add-rector-deps.sh

set -e

# Dependencies to add
DEPENDENCIES=(
    '"rector/rector": "^1.2"'
    '"driftingly/rector-laravel": "^1.2"'
    '"webmozart/assert": "^2.1"'
)

# Counter for updated packages
UPDATED=0
SKIPPED=0
ERRORS=0

# Find all composer.json files excluding vendor and workbench directories
while IFS= read -r file; do
    echo "Processing: $file"

    # Check if rector/rector already exists
    if grep -q '"rector/rector"' "$file"; then
        echo "  ⏭️  Skipped - rector/rector already present"
        ((SKIPPED++))
        continue
    fi

    # Check if require-dev section exists
    if ! grep -q '"require-dev"' "$file"; then
        echo "  ⚠️  Warning - no require-dev section found, skipping"
        ((ERRORS++))
        continue
    fi

    # Use jq to add dependencies
    if command -v jq &> /dev/null; then
        # Create a temporary file
        tmp_file=$(mktemp)

        # Use jq to add the dependencies while preserving formatting
        jq '.["require-dev"] += {
            "rector/rector": "^1.2",
            "driftingly/rector-laravel": "^1.2",
            "webmozart/assert": "^2.1"
        }' "$file" > "$tmp_file"

        # Replace original file
        mv "$tmp_file" "$file"
        echo "  ✅ Updated successfully"
        ((UPDATED++))
    else
        echo "  ❌ Error - jq not installed"
        ((ERRORS++))
        exit 1
    fi

done < <(find /Users/stuart/Packages/bespoke -name "composer.json" -type f -not -path "*/vendor/*" -not -path "*/workbench/*")

echo ""
echo "════════════════════════════════════════"
echo "Summary:"
echo "  Updated: $UPDATED packages"
echo "  Skipped: $SKIPPED packages (already have rector)"
echo "  Errors:  $ERRORS packages"
echo "════════════════════════════════════════"
