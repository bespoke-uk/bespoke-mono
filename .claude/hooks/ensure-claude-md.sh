#!/bin/bash
# ensure-claude-md.sh - Check for CLAUDE.md when creating packages
# Warns if a new package directory is created without CLAUDE.md

# This hook should be called after Write operations
# It checks if we're in a package directory and if CLAUDE.md exists

set -e

# Read input from stdin (Claude Code passes JSON via stdin)
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty')

# Exit if no file path provided
if [ -z "$FILE_PATH" ]; then
    exit 0
fi

# Check if this is a new file in a package src/ directory
if echo "$FILE_PATH" | grep -qE '/(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+/src/'; then
    # Extract package directory
    PACKAGE_DIR=$(echo "$FILE_PATH" | sed -E 's#(.*/(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+)/.*#\1#')

    # Check if CLAUDE.md exists
    if [ -d "$PACKAGE_DIR" ] && [ ! -f "$PACKAGE_DIR/CLAUDE.md" ]; then
        echo ""
        echo "=== Package Documentation Reminder ==="
        echo "⚠ Package at $PACKAGE_DIR does not have a CLAUDE.md file."
        echo ""
        echo "Consider creating one with:"
        echo "  - Package overview"
        echo "  - Key commands (test, analyse, format)"
        echo "  - Architecture summary"
        echo "  - Key files table"
        echo ""
        echo "See /crm/contact/CLAUDE.md for reference."
        echo "======================================="
        echo ""
    fi
fi

exit 0
