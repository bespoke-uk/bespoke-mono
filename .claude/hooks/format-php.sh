#!/bin/bash
# Hook: Format PHP files with Laravel Pint after editing
# Triggered by: PostToolUse on Edit|Write for .php files

set -e

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty')

# Only process PHP files
if [[ "$FILE_PATH" != *.php ]]; then
    exit 0
fi

# Find the package root (directory containing composer.json)
CURRENT_DIR=$(dirname "$FILE_PATH")
PACKAGE_ROOT=""

while [[ "$CURRENT_DIR" != "/" ]]; do
    if [[ -f "$CURRENT_DIR/composer.json" ]]; then
        PACKAGE_ROOT="$CURRENT_DIR"
        break
    fi
    CURRENT_DIR=$(dirname "$CURRENT_DIR")
done

# If we found a package root with pint.json, run Pint on the file
if [[ -n "$PACKAGE_ROOT" && -f "$PACKAGE_ROOT/pint.json" ]]; then
    if [[ -f "$PACKAGE_ROOT/vendor/bin/pint" ]]; then
        "$PACKAGE_ROOT/vendor/bin/pint" "$FILE_PATH" --quiet 2>/dev/null || true
    fi
fi

exit 0
