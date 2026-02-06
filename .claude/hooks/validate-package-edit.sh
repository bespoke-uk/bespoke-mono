#!/bin/bash
# Hook: Validate edits to package files follow standards
# Triggered by: PreToolUse on Edit for specific patterns

set -e

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
OLD_STRING=$(echo "$INPUT" | jq -r '.tool_input.old_string // empty')
NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')

# Check for common mistakes

# 1. Prevent using Interfaces/ instead of Contracts/
if [[ "$FILE_PATH" == *"/Interfaces/"* ]]; then
    echo "Warning: Using 'Interfaces/' directory. Bespoke standard is 'Contracts/'." >&2
    # Allow but warn - don't block
    exit 0
fi

# 2. Prevent API routes without UUID binding
if [[ "$FILE_PATH" == */routes/api.php ]]; then
    if [[ "$NEW_STRING" == *"/{id}"* ]] || [[ "$NEW_STRING" == *"/{model}"* && "$NEW_STRING" != *":uuid"* ]]; then
        echo "Warning: API routes should use {model:uuid} binding pattern." >&2
        exit 0
    fi
fi

# 3. Check for missing strict_types in new PHP files
if [[ "$FILE_PATH" == *.php ]] && [[ -z "$OLD_STRING" ]]; then
    if [[ "$NEW_STRING" != *"declare(strict_types=1)"* ]]; then
        echo "Warning: PHP files should include declare(strict_types=1);" >&2
        exit 0
    fi
fi

exit 0
