#!/bin/bash

# commit-packages.sh
# Loops through all packages in package-list.txt and commits any uncommitted changes
# with appropriate commit messages based on the type of changes detected.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_LIST="$SCRIPT_DIR/../package-list.txt"

# Colours for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Colour

# Counters
committed=0
skipped=0
failed=0

# Default commit message (can be overridden with -m flag)
CUSTOM_MESSAGE=""
DRY_RUN=false
VERBOSE=false

usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -m, --message MESSAGE    Use a custom commit message for all packages"
    echo "  -d, --dry-run            Show what would be committed without committing"
    echo "  -v, --verbose            Show detailed output"
    echo "  -h, --help               Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                       # Auto-detect commit messages"
    echo "  $0 -m 'Update dependencies'  # Use custom message for all"
    echo "  $0 -d                    # Preview changes without committing"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--message)
            CUSTOM_MESSAGE="$2"
            shift 2
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Check package list exists
if [ ! -f "$PACKAGE_LIST" ]; then
    echo -e "${RED}Error: Package list not found at $PACKAGE_LIST${NC}"
    exit 1
fi

echo -e "${BLUE}Scanning packages for uncommitted changes...${NC}"
echo ""

# Function to determine commit message based on changes
get_commit_message() {
    local git_status="$1"

    # Check for specific file changes
    local has_changelog_mod=$(echo "$git_status" | grep '^ M CHANGELOG.md' || true)
    local has_changelog_new=$(echo "$git_status" | grep '^?? CHANGELOG.md' || true)
    local has_composer=$(echo "$git_status" | grep 'composer.json' || true)
    local has_readme=$(echo "$git_status" | grep 'README.md' || true)
    local has_claude=$(echo "$git_status" | grep 'CLAUDE.md' || true)
    local has_architecture=$(echo "$git_status" | grep 'ARCHITECTURE.md' || true)
    local has_cursorrules=$(echo "$git_status" | grep '.cursorrules' || true)
    local has_copilot=$(echo "$git_status" | grep 'copilot-instructions' || true)
    local has_rector=$(echo "$git_status" | grep 'rector.php' || true)
    local has_phpstan=$(echo "$git_status" | grep 'phpstan' || true)
    local has_migrations=$(echo "$git_status" | grep 'migrations/' || true)
    local has_src=$(echo "$git_status" | grep 'src/' || true)
    local has_tests=$(echo "$git_status" | grep 'tests/' || true)
    local has_config=$(echo "$git_status" | grep 'config/' || true)

    # Determine appropriate message
    if [ -n "$has_changelog_new" ]; then
        echo "Add CHANGELOG.md with version history"
    elif [ -n "$has_claude" ] || [ -n "$has_architecture" ] || [ -n "$has_cursorrules" ] || [ -n "$has_copilot" ]; then
        echo "Add AI context documentation"
    elif [ -n "$has_changelog_mod" ] && [ -z "$has_composer" ] && [ -z "$has_src" ]; then
        echo "Update CHANGELOG.md with version history and changelog format"
    elif [ -n "$has_composer" ] && [ -z "$has_changelog_mod" ] && [ -z "$has_src" ]; then
        echo "Update composer.json dependencies"
    elif [ -n "$has_migrations" ]; then
        echo "Update database migrations"
    elif [ -n "$has_src" ] && [ -n "$has_tests" ]; then
        echo "Update source code and tests"
    elif [ -n "$has_src" ]; then
        echo "Update source code"
    elif [ -n "$has_tests" ]; then
        echo "Update tests"
    elif [ -n "$has_config" ]; then
        echo "Update package configuration"
    elif [ -n "$has_rector" ] || [ -n "$has_phpstan" ]; then
        echo "Update code quality tooling configuration"
    elif [ -n "$has_readme" ]; then
        echo "Update README documentation"
    else
        echo "Update package files"
    fi
}

# Process each package
grep -v '^#' "$PACKAGE_LIST" | grep -v '^$' | while read dir; do
    if [ -d "$dir/.git" ]; then
        cd "$dir"
        git_status=$(git status --short 2>/dev/null)

        if [ -n "$git_status" ]; then
            pkg_name=$(basename "$dir")
            category=$(basename "$(dirname "$dir")")

            # Determine commit message
            if [ -n "$CUSTOM_MESSAGE" ]; then
                msg="$CUSTOM_MESSAGE"
            else
                msg=$(get_commit_message "$git_status")
            fi

            if [ "$DRY_RUN" = true ]; then
                echo -e "${YELLOW}[DRY RUN]${NC} ${BLUE}$category/$pkg_name${NC}"
                echo -e "  Message: $msg"
                if [ "$VERBOSE" = true ]; then
                    echo -e "  Changes:"
                    echo "$git_status" | sed 's/^/    /'
                fi
                echo ""
            else
                echo -e "${GREEN}Committing${NC} ${BLUE}$category/$pkg_name${NC}: $msg"

                if [ "$VERBOSE" = true ]; then
                    echo "$git_status" | sed 's/^/  /'
                fi

                git add -A
                git commit -m "$msg

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>" > /dev/null 2>&1

                if [ $? -eq 0 ]; then
                    ((committed++)) || true
                else
                    echo -e "${RED}  Failed to commit${NC}"
                    ((failed++)) || true
                fi
            fi
        elif [ "$VERBOSE" = true ]; then
            pkg_name=$(basename "$dir")
            category=$(basename "$(dirname "$dir")")
            echo -e "${YELLOW}Skipping${NC} $category/$pkg_name (no changes)"
            ((skipped++)) || true
        fi
    fi
done

echo ""
echo -e "${BLUE}Summary:${NC}"
if [ "$DRY_RUN" = true ]; then
    echo "  Dry run completed - no changes made"
else
    echo "  Packages processed successfully"
fi
