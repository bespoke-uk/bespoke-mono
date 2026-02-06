#!/bin/bash

# =============================================================================
# generate-changelog.sh
#
# Generates detailed git history data for changelog creation.
# Designed to be used with Claude Code for semantic analysis of changes.
#
# Usage:
#   ./generate-changelog.sh <package-path>           # Analyze single package
#   ./generate-changelog.sh -d <directory>           # Analyze all packages in directory
#   ./generate-changelog.sh -l <directory>           # List packages only
#   ./generate-changelog.sh -o <output-dir> <path>   # Output to specific directory
#
# Examples:
#   ./scripts/generate_changelog/generate-changelog.sh core/acl
#   ./scripts/generate_changelog/generate-changelog.sh -d core
#   ./scripts/generate_changelog/generate-changelog.sh -d blade -o /tmp/changelogs
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Default settings
OUTPUT_DIR=""
LIST_ONLY=false
VERBOSE=false
MAX_DIFF_LINES=150
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

print_usage() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS] <package-path>

Generate detailed git history for changelog creation.

Options:
    -d, --directory <dir>   Process all packages in directory
    -l, --list              List packages only, don't generate
    -o, --output <dir>      Output directory for generated files
    -v, --verbose           Verbose output
    -h, --help              Show this help message

Examples:
    $(basename "$0") core/acl                    # Single package
    $(basename "$0") -d core                     # All packages in core/
    $(basename "$0") -d blade -o /tmp/logs       # Output to specific dir
    $(basename "$0") -l -d .                     # List all packages

EOF
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_header() {
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# -----------------------------------------------------------------------------
# Git Analysis Functions
# -----------------------------------------------------------------------------

# Check if directory is a git repository or part of one
is_git_repo() {
    local dir="$1"
    git -C "$dir" rev-parse --git-dir > /dev/null 2>&1
}

# Get all tags for a package, sorted by version
get_tags() {
    local package_path="$1"
    git -C "$package_path" tag -l --sort=-version:refname 2>/dev/null || echo ""
}

# Get commit history with details
get_commit_history() {
    local package_path="$1"
    local format="%H|%h|%ad|%an|%s"

    git -C "$package_path" log --pretty=format:"$format" --date=short --all 2>/dev/null || echo ""
}

# Get files changed in a commit
get_commit_files() {
    local package_path="$1"
    local commit_hash="$2"

    git -C "$package_path" diff-tree --no-commit-id --name-status -r "$commit_hash" 2>/dev/null || echo ""
}

# Get diff for a specific commit (limited lines)
get_commit_diff() {
    local package_path="$1"
    local commit_hash="$2"
    local max_lines="${3:-$MAX_DIFF_LINES}"

    git -C "$package_path" show "$commit_hash" --stat --patch 2>/dev/null | head -n "$max_lines" || echo ""
}

# Get diff stats for a commit
get_commit_stats() {
    local package_path="$1"
    local commit_hash="$2"

    git -C "$package_path" show "$commit_hash" --stat --format="" 2>/dev/null || echo ""
}

# -----------------------------------------------------------------------------
# Changelog Generation Functions
# -----------------------------------------------------------------------------

# Generate detailed git history report for a package
generate_package_report() {
    local package_path="$1"
    local output_file="$2"
    local package_name=$(basename "$package_path")

    log_info "Analyzing package: $package_name"

    # Check if it's a valid package (has composer.json)
    if [[ ! -f "$package_path/composer.json" ]]; then
        log_warning "No composer.json found in $package_path, skipping"
        return 1
    fi

    # Check for git history
    if ! is_git_repo "$package_path"; then
        log_warning "Not a git repository: $package_path"
        return 1
    fi

    # Start generating report
    {
        echo "# Git History Report: $package_name"
        echo "# Generated: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "# Package Path: $package_path"
        echo ""
        echo "=================================================================================="
        echo "PACKAGE METADATA"
        echo "=================================================================================="
        echo ""

        # Extract package info from composer.json
        if command -v jq &> /dev/null; then
            echo "Package Name: $(jq -r '.name // "unknown"' "$package_path/composer.json")"
            echo "Description: $(jq -r '.description // "N/A"' "$package_path/composer.json")"
        else
            grep -E '"name"|"description"' "$package_path/composer.json" | head -2
        fi
        echo ""

        echo "=================================================================================="
        echo "GIT TAGS"
        echo "=================================================================================="
        echo ""

        local tags=$(get_tags "$package_path")
        if [[ -n "$tags" ]]; then
            echo "$tags"
        else
            echo "(No tags found)"
        fi
        echo ""

        echo "=================================================================================="
        echo "COMMIT HISTORY (with file changes)"
        echo "=================================================================================="
        echo ""

        # Get all commits
        local commits=$(get_commit_history "$package_path")

        if [[ -z "$commits" ]]; then
            echo "(No commits found)"
        else
            # Process each commit
            echo "$commits" | while IFS='|' read -r full_hash short_hash date author message; do
                echo "--------------------------------------------------------------------------------"
                echo "COMMIT: $short_hash"
                echo "DATE: $date"
                echo "AUTHOR: $author"
                echo "MESSAGE: $message"
                echo ""
                echo "FILES CHANGED:"
                get_commit_files "$package_path" "$full_hash" | while read -r status file; do
                    case "$status" in
                        A) echo "  [ADDED]    $file" ;;
                        M) echo "  [MODIFIED] $file" ;;
                        D) echo "  [DELETED]  $file" ;;
                        R*) echo "  [RENAMED]  $file" ;;
                        *) echo "  [$status]  $file" ;;
                    esac
                done
                echo ""
                echo "DIFF STATS:"
                get_commit_stats "$package_path" "$full_hash" | sed 's/^/  /'
                echo ""
            done
        fi

        echo "=================================================================================="
        echo "DETAILED DIFFS FOR KEY COMMITS"
        echo "=================================================================================="
        echo ""
        echo "Below are detailed diffs for commits that appear to contain significant changes."
        echo "(Excluding merge commits, version bumps, and style fixes)"
        echo ""

        # Get significant commits (non-merge, non-trivial)
        echo "$commits" | while IFS='|' read -r full_hash short_hash date author message; do
            # Skip merge commits and trivial changes
            if [[ "$message" =~ ^Merge ]] || \
               [[ "$message" =~ ^Bump ]] || \
               [[ "$message" =~ ^Fix\ styling$ ]] || \
               [[ "$message" =~ ^-\ Debugging ]]; then
                continue
            fi

            # Check if this commit has substantial file changes
            local file_count=$(get_commit_files "$package_path" "$full_hash" | wc -l)
            if [[ $file_count -lt 1 ]]; then
                continue
            fi

            echo "================================================================================"
            echo "DETAILED DIFF: $short_hash - $message"
            echo "================================================================================"
            echo ""
            get_commit_diff "$package_path" "$full_hash" 200
            echo ""
            echo ""
        done

        echo "=================================================================================="
        echo "EXISTING CHANGELOG"
        echo "=================================================================================="
        echo ""

        if [[ -f "$package_path/CHANGELOG.md" ]]; then
            cat "$package_path/CHANGELOG.md"
        else
            echo "(No existing CHANGELOG.md)"
        fi

    } > "$output_file"

    log_success "Report generated: $output_file"
    return 0
}

# Generate a summary of all packages
generate_summary() {
    local directory="$1"
    local output_file="$2"

    {
        echo "# Package Summary Report"
        echo "# Generated: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "# Directory: $directory"
        echo ""
        echo "| Package | Commits | Tags | Has Changelog |"
        echo "|---------|---------|------|---------------|"

        for package_dir in "$directory"/*/; do
            if [[ -f "$package_dir/composer.json" ]]; then
                local package_name=$(basename "$package_dir")
                local commit_count=$(git -C "$package_dir" rev-list --count --all 2>/dev/null || echo "0")
                local tag_count=$(git -C "$package_dir" tag -l 2>/dev/null | wc -l | tr -d ' ')
                local has_changelog="No"
                [[ -f "$package_dir/CHANGELOG.md" ]] && has_changelog="Yes"

                echo "| $package_name | $commit_count | $tag_count | $has_changelog |"
            fi
        done
    } > "$output_file"

    log_success "Summary generated: $output_file"
}

# List all packages in a directory
list_packages() {
    local directory="$1"

    log_header "Packages in: $directory"

    local count=0
    for package_dir in "$directory"/*/; do
        if [[ -f "$package_dir/composer.json" ]]; then
            local package_name=$(basename "$package_dir")
            local has_changelog="No"
            [[ -f "$package_dir/CHANGELOG.md" ]] && has_changelog="Yes"

            printf "  %-30s (CHANGELOG: %s)\n" "$package_name" "$has_changelog"
            ((count++))
        fi
    done

    echo ""
    log_info "Total packages found: $count"
}

# Process a single package
process_package() {
    local package_path="$1"
    local output_dir="$2"

    # Resolve to absolute path
    if [[ ! "$package_path" = /* ]]; then
        package_path="$REPO_ROOT/$package_path"
    fi

    # Validate package exists
    if [[ ! -d "$package_path" ]]; then
        log_error "Package directory not found: $package_path"
        return 1
    fi

    local package_name=$(basename "$package_path")

    # Determine output file location
    local output_file
    if [[ -n "$output_dir" ]]; then
        mkdir -p "$output_dir"
        output_file="$output_dir/${package_name}_git_history.txt"
    else
        output_file="$package_path/.git_history_report.txt"
    fi

    generate_package_report "$package_path" "$output_file"
}

# Process all packages in a directory
process_directory() {
    local directory="$1"
    local output_dir="$2"

    # Resolve to absolute path
    if [[ ! "$directory" = /* ]]; then
        directory="$REPO_ROOT/$directory"
    fi

    if [[ ! -d "$directory" ]]; then
        log_error "Directory not found: $directory"
        return 1
    fi

    log_header "Processing packages in: $directory"

    # Generate summary first
    if [[ -n "$output_dir" ]]; then
        mkdir -p "$output_dir"
        generate_summary "$directory" "$output_dir/_summary.md"
    fi

    local processed=0
    local failed=0

    for package_dir in "$directory"/*/; do
        if [[ -f "$package_dir/composer.json" ]]; then
            if process_package "$package_dir" "$output_dir"; then
                ((processed++))
            else
                ((failed++))
            fi
        fi
    done

    echo ""
    log_header "Processing Complete"
    log_info "Processed: $processed packages"
    [[ $failed -gt 0 ]] && log_warning "Failed: $failed packages"
}

# -----------------------------------------------------------------------------
# Interactive Mode for Claude Code
# -----------------------------------------------------------------------------

# Generate prompt for Claude Code to analyze
generate_claude_prompt() {
    local package_path="$1"
    local package_name=$(basename "$package_path")

    cat << EOF

================================================================================
CLAUDE CODE CHANGELOG GENERATION TASK
================================================================================

Package: $package_name
Path: $package_path

Please analyze the git history report above and generate/update the CHANGELOG.md
file with accurate descriptions based on the actual code changes.

Instructions:
1. Read the git history report that was generated
2. For each significant commit, examine the diff to understand what actually changed
3. Write clear, specific changelog entries that describe:
   - What was added (new features, files, methods)
   - What was changed (refactoring, API changes, behavior changes)
   - What was fixed (bugs, issues)
   - What was removed/deprecated
4. Group related commits into logical version sections
5. Use the Keep a Changelog format
6. Be specific - mention actual class names, method names, config keys, etc.

To proceed, read the report file at:
$package_path/.git_history_report.txt

Then update/create:
$package_path/CHANGELOG.md

================================================================================

EOF
}

# -----------------------------------------------------------------------------
# Main Entry Point
# -----------------------------------------------------------------------------

main() {
    local target_path=""
    local directory_mode=false
    local target_directory=""

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                print_usage
                exit 0
                ;;
            -d|--directory)
                directory_mode=true
                target_directory="$2"
                shift 2
                ;;
            -l|--list)
                LIST_ONLY=true
                shift
                ;;
            -o|--output)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -*)
                log_error "Unknown option: $1"
                print_usage
                exit 1
                ;;
            *)
                target_path="$1"
                shift
                ;;
        esac
    done

    # Validate arguments
    if [[ "$directory_mode" = true ]]; then
        if [[ -z "$target_directory" ]]; then
            log_error "Directory mode requires a directory path"
            print_usage
            exit 1
        fi

        if [[ "$LIST_ONLY" = true ]]; then
            list_packages "$REPO_ROOT/$target_directory"
        else
            process_directory "$target_directory" "$OUTPUT_DIR"
        fi
    elif [[ -n "$target_path" ]]; then
        process_package "$target_path" "$OUTPUT_DIR"

        # Show Claude prompt for interactive use
        echo ""
        generate_claude_prompt "$REPO_ROOT/$target_path"
    else
        log_error "No package or directory specified"
        print_usage
        exit 1
    fi
}

main "$@"
