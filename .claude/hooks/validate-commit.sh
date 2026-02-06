#!/bin/bash
# validate-commit.sh - Pre-commit validation hook
# Runs quick checks before git commits to catch common issues

set -e

# Get the list of staged PHP files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.php$' || true)

if [ -z "$STAGED_FILES" ]; then
    exit 0
fi

ERRORS=0
WARNINGS=""

# Check each staged file
for FILE in $STAGED_FILES; do
    if [ ! -f "$FILE" ]; then
        continue
    fi

    # Check for declare(strict_types=1)
    if ! head -5 "$FILE" | grep -q "declare(strict_types=1)"; then
        WARNINGS="$WARNINGS\n⚠ Missing strict_types: $FILE"
    fi

    # Check for Interfaces directory (should be Contracts)
    if echo "$FILE" | grep -q "/Interfaces/"; then
        WARNINGS="$WARNINGS\n⚠ Using Interfaces/ instead of Contracts/: $FILE"
        ERRORS=$((ERRORS + 1))
    fi

    # Check for dd() or dump() calls
    if grep -qE '\b(dd|dump)\s*\(' "$FILE"; then
        WARNINGS="$WARNINGS\n⚠ Debug function found: $FILE"
    fi

    # Check for env() calls outside config
    if ! echo "$FILE" | grep -q "/config/" && grep -qE '\benv\s*\(' "$FILE"; then
        WARNINGS="$WARNINGS\n⚠ env() call outside config: $FILE"
    fi
done

# Check for .env files being committed
if git diff --cached --name-only | grep -qE '\.env$|\.env\.'; then
    WARNINGS="$WARNINGS\n🚫 Attempting to commit .env file!"
    ERRORS=$((ERRORS + 1))
fi

# Output warnings
if [ -n "$WARNINGS" ]; then
    echo -e "\n=== Pre-commit Validation ===$WARNINGS\n"
fi

# Exit with error if critical issues found
if [ $ERRORS -gt 0 ]; then
    echo "❌ Commit blocked due to $ERRORS critical issue(s)"
    exit 1
fi

exit 0
