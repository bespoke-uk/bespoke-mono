#!/bin/bash

# =============================================================================
# changelog-batch.sh
#
# Batch workflow for generating changelogs across multiple packages using
# Claude Code for semantic analysis.
#
# Usage:
#   ./changelog-batch.sh prepare <directory>    # Generate git reports for all packages
#   ./changelog-batch.sh status <directory>     # Show progress status
#   ./changelog-batch.sh next <directory>       # Show next package to process
#   ./changelog-batch.sh prompt <package>       # Generate Claude Code prompt
#   ./changelog-batch.sh mark-done <package>    # Mark package as completed
#
# Workflow:
#   1. Run: ./changelog-batch.sh prepare core
#   2. Run: ./changelog-batch.sh next core
#   3. In Claude Code, analyze the package and generate CHANGELOG.md
#   4. Run: ./changelog-batch.sh mark-done core/acl
#   5. Repeat steps 2-4 until all packages are done
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROGRESS_FILE=".changelog_progress.json"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

print_usage() {
    cat << 'EOF'
Usage: changelog-batch.sh <command> [arguments]

Commands:
    prepare <directory>     Generate git history reports for all packages
    status <directory>      Show changelog generation progress
    next <directory>        Show the next package to process
    prompt <package-path>   Generate Claude Code prompt for a package
    mark-done <package>     Mark a package as completed
    reset <directory>       Reset progress tracking

Workflow Example:
    # 1. Prepare all packages in the core directory
    ./scripts/generate_changelog/changelog-batch.sh prepare core

    # 2. See what needs to be done
    ./scripts/generate_changelog/changelog-batch.sh status core

    # 3. Get the next package to work on
    ./scripts/generate_changelog/changelog-batch.sh next core

    # 4. Generate prompt for Claude Code
    ./scripts/generate_changelog/changelog-batch.sh prompt core/auth

    # 5. After completing changelog, mark as done
    ./scripts/generate_changelog/changelog-batch.sh mark-done core/auth

    # 6. Repeat steps 3-5 until done

EOF
}

# Get absolute path
get_abs_path() {
    local path="$1"
    if [[ "$path" = /* ]]; then
        echo "$path"
    else
        echo "$REPO_ROOT/$path"
    fi
}

# -----------------------------------------------------------------------------
# Progress Tracking
# -----------------------------------------------------------------------------

init_progress() {
    local directory="$1"
    local progress_path="$(get_abs_path "$directory")/$PROGRESS_FILE"

    if [[ -f "$progress_path" ]]; then
        return 0
    fi

    local packages=()
    for pkg_dir in "$(get_abs_path "$directory")"/*/; do
        if [[ -f "$pkg_dir/composer.json" ]]; then
            local pkg_name=$(basename "$pkg_dir")
            packages+=("\"$pkg_name\": {\"status\": \"pending\", \"updated\": null}")
        fi
    done

    local json_content=$(IFS=,; echo "{${packages[*]}}")

    echo "$json_content" | python3 -m json.tool > "$progress_path" 2>/dev/null || \
        echo "$json_content" > "$progress_path"

    log_success "Progress file created: $progress_path"
}

get_progress() {
    local directory="$1"
    local progress_path="$(get_abs_path "$directory")/$PROGRESS_FILE"

    if [[ ! -f "$progress_path" ]]; then
        echo "{}"
        return
    fi

    cat "$progress_path"
}

update_progress() {
    local directory="$1"
    local package="$2"
    local status="$3"
    local progress_path="$(get_abs_path "$directory")/$PROGRESS_FILE"

    if [[ ! -f "$progress_path" ]]; then
        log_error "Progress file not found. Run 'prepare' first."
        return 1
    fi

    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    # Use Python for reliable JSON manipulation
    python3 << EOF
import json
import sys

try:
    with open("$progress_path", "r") as f:
        data = json.load(f)

    if "$package" in data:
        data["$package"]["status"] = "$status"
        data["$package"]["updated"] = "$timestamp"
    else:
        data["$package"] = {"status": "$status", "updated": "$timestamp"}

    with open("$progress_path", "w") as f:
        json.dump(data, f, indent=2)

    print("Updated: $package -> $status")
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
EOF
}

# -----------------------------------------------------------------------------
# Commands
# -----------------------------------------------------------------------------

cmd_prepare() {
    local directory="$1"

    if [[ -z "$directory" ]]; then
        log_error "Directory required"
        print_usage
        exit 1
    fi

    local abs_dir=$(get_abs_path "$directory")

    if [[ ! -d "$abs_dir" ]]; then
        log_error "Directory not found: $abs_dir"
        exit 1
    fi

    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  Preparing Changelog Generation: $directory${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

    # Initialize progress tracking
    init_progress "$directory"

    # Generate git history reports for each package
    local count=0
    for pkg_dir in "$abs_dir"/*/; do
        if [[ -f "$pkg_dir/composer.json" ]]; then
            local pkg_name=$(basename "$pkg_dir")
            log_info "Generating report for: $pkg_name"

            "$SCRIPT_DIR/generate-changelog.sh" "$directory/$pkg_name" > /dev/null 2>&1 || \
                log_warning "Failed to generate report for $pkg_name"

            ((count++))
        fi
    done

    echo ""
    log_success "Prepared $count packages"
    log_info "Run './scripts/generate_changelog/changelog-batch.sh status $directory' to see progress"
    log_info "Run './scripts/generate_changelog/changelog-batch.sh next $directory' to get started"
}

cmd_status() {
    local directory="$1"

    if [[ -z "$directory" ]]; then
        log_error "Directory required"
        exit 1
    fi

    local abs_dir=$(get_abs_path "$directory")
    local progress_path="$abs_dir/$PROGRESS_FILE"

    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  Changelog Progress: $directory${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

    if [[ ! -f "$progress_path" ]]; then
        log_warning "No progress file found. Run 'prepare' first."
        exit 1
    fi

    # Count statuses and display
    python3 << EOF
import json

with open("$progress_path", "r") as f:
    data = json.load(f)

pending = []
done = []
skipped = []

for pkg, info in sorted(data.items()):
    status = info.get("status", "pending")
    if status == "done":
        done.append(pkg)
    elif status == "skipped":
        skipped.append(pkg)
    else:
        pending.append(pkg)

total = len(data)
print(f"Total packages: {total}")
print(f"  ✓ Completed:  {len(done)}")
print(f"  ○ Pending:    {len(pending)}")
print(f"  - Skipped:    {len(skipped)}")
print(f"\nProgress: {len(done)}/{total} ({100*len(done)//total if total else 0}%)")

if pending:
    print(f"\n📋 Pending packages:")
    for pkg in pending[:10]:
        print(f"   • {pkg}")
    if len(pending) > 10:
        print(f"   ... and {len(pending)-10} more")

if done:
    print(f"\n✅ Completed packages:")
    for pkg in done[:5]:
        print(f"   • {pkg}")
    if len(done) > 5:
        print(f"   ... and {len(done)-5} more")
EOF
}

cmd_next() {
    local directory="$1"

    if [[ -z "$directory" ]]; then
        log_error "Directory required"
        exit 1
    fi

    local abs_dir=$(get_abs_path "$directory")
    local progress_path="$abs_dir/$PROGRESS_FILE"

    if [[ ! -f "$progress_path" ]]; then
        log_error "No progress file found. Run 'prepare' first."
        exit 1
    fi

    # Find next pending package
    local next_pkg=$(python3 << EOF
import json

with open("$progress_path", "r") as f:
    data = json.load(f)

for pkg, info in sorted(data.items()):
    if info.get("status", "pending") == "pending":
        print(pkg)
        break
EOF
)

    if [[ -z "$next_pkg" ]]; then
        log_success "All packages have been processed!"
        exit 0
    fi

    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  Next Package: $next_pkg${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

    local pkg_path="$abs_dir/$next_pkg"

    echo -e "${BOLD}Package:${NC} $directory/$next_pkg"
    echo -e "${BOLD}Path:${NC} $pkg_path"
    echo ""

    # Check for existing changelog
    if [[ -f "$pkg_path/CHANGELOG.md" ]]; then
        local lines=$(wc -l < "$pkg_path/CHANGELOG.md" | tr -d ' ')
        echo -e "${YELLOW}Existing CHANGELOG.md:${NC} $lines lines"
    else
        echo -e "${YELLOW}No existing CHANGELOG.md${NC}"
    fi

    # Check for git history report
    if [[ -f "$pkg_path/.git_history_report.txt" ]]; then
        echo -e "${GREEN}Git history report:${NC} Ready"
    else
        echo -e "${RED}Git history report:${NC} Not generated"
    fi

    echo ""
    echo -e "${BOLD}To process this package in Claude Code:${NC}"
    echo ""
    echo "  1. Read the git history report:"
    echo -e "     ${CYAN}Read $pkg_path/.git_history_report.txt${NC}"
    echo ""
    echo "  2. Analyze the commits and generate/update CHANGELOG.md"
    echo ""
    echo "  3. Mark as done when complete:"
    echo -e "     ${CYAN}./scripts/generate_changelog/changelog-batch.sh mark-done $directory/$next_pkg${NC}"
    echo ""
}

cmd_prompt() {
    local package="$1"

    if [[ -z "$package" ]]; then
        log_error "Package path required"
        exit 1
    fi

    local pkg_path=$(get_abs_path "$package")
    local pkg_name=$(basename "$pkg_path")
    local report_file="$pkg_path/.git_history_report.txt"

    if [[ ! -f "$report_file" ]]; then
        log_warning "Git history report not found. Generating..."
        "$SCRIPT_DIR/generate-changelog.sh" "$package"
    fi

    cat << EOF

================================================================================
CHANGELOG GENERATION TASK
================================================================================

Package: $pkg_name
Path: $pkg_path

TASK: Generate an accurate CHANGELOG.md based on the git history.

STEPS:
1. Read the git history report at:
   $report_file

2. For each significant commit:
   - Examine the files changed and diff content
   - Understand what was actually modified in the code
   - Write a specific, accurate description

3. Create/update CHANGELOG.md following Keep a Changelog format:
   - Group by version/date
   - Categorize: Added, Changed, Fixed, Removed, Security
   - Be specific: mention class names, method names, config keys
   - Explain the "why" not just the "what"

4. Key things to look for in diffs:
   - New files added (what do they do?)
   - Method signatures changed (what's the impact?)
   - Config keys added/removed
   - Dependencies updated
   - Breaking changes

EXAMPLE OF GOOD vs BAD entries:

BAD:  "Updated the permissions logic"
GOOD: "Refactored HasPermissions::hasRole() into focused methods: hasRoleById(),
       hasRoleByModel(), hasRoleByArray(), hasRoleByKey(), hasRoleByCollection()"

BAD:  "Added caching"
GOOD: "Added permanent caching for roles: Cache::rememberForever('roles.{key}')
       in new getRoleByKey() method"

================================================================================

To begin, please read: $report_file

EOF
}

cmd_mark_done() {
    local package="$1"

    if [[ -z "$package" ]]; then
        log_error "Package path required (e.g., core/acl)"
        exit 1
    fi

    # Extract directory and package name
    local directory=$(dirname "$package")
    local pkg_name=$(basename "$package")

    update_progress "$directory" "$pkg_name" "done"
    log_success "Marked $pkg_name as done"

    # Show next
    echo ""
    cmd_next "$directory"
}

cmd_reset() {
    local directory="$1"

    if [[ -z "$directory" ]]; then
        log_error "Directory required"
        exit 1
    fi

    local progress_path="$(get_abs_path "$directory")/$PROGRESS_FILE"

    if [[ -f "$progress_path" ]]; then
        rm "$progress_path"
        log_success "Progress reset for $directory"
    else
        log_info "No progress file to reset"
    fi
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

main() {
    local command="$1"
    shift || true

    case "$command" in
        prepare)
            cmd_prepare "$@"
            ;;
        status)
            cmd_status "$@"
            ;;
        next)
            cmd_next "$@"
            ;;
        prompt)
            cmd_prompt "$@"
            ;;
        mark-done|done)
            cmd_mark_done "$@"
            ;;
        reset)
            cmd_reset "$@"
            ;;
        -h|--help|help|"")
            print_usage
            ;;
        *)
            log_error "Unknown command: $command"
            print_usage
            exit 1
            ;;
    esac
}

main "$@"
