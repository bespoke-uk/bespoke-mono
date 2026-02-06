#!/bin/bash

# =============================================================================
# Generate AI Context Documentation for Multiple Packages
# =============================================================================
#
# Usage:
#   ./generate-ai-context.sh [OPTIONS]
#
# Options:
#   -d, --directory DIR    Process all packages in DIR (looks for composer.json)
#   -f, --file FILE        Process packages listed in FILE (one path per line)
#   -p, --package PATH     Process a single package at PATH
#   -c, --concurrency N    Run N packages in parallel (default: 1)
#   -o, --output DIR       Save logs to DIR (default: ./ai-context-logs)
#   -h, --help             Show this help message
#
# Examples:
#   ./generate-ai-context.sh -d /path/to/packages
#   ./generate-ai-context.sh -f package-list.txt
#   ./generate-ai-context.sh -d /path/to/packages -c 3
#
# =============================================================================

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
CONCURRENCY=1
OUTPUT_DIR="./ai-context-logs"
PACKAGES=()

# The prompt to send to Claude Code
read -r -d '' PROMPT << 'EOF' || true
Create AI context documentation for this Laravel package. This package likely extends `bespoke-uk/package-tools` which provides:
- PackageServiceProvider base class with Has*/Registers* trait pattern
- Lifecycle hooks: registeringPackage(), packageRegistered(), bootingPackage(), packageBooted()
- 14 binding hooks: registerActionBindings(), registerControllerBindings(), registerDataBindings(), registerEnumBindings(), registerExportBindings(), registerFactoryBindings(), registerImportBindings(), registerModelBindings(), registerParserBindings(), registerRequestBindings(), registerResourceBindings(), registerResponseBindings(), registerRouteModelBindings(), registerRuleBindings(), registerServiceBindings()
- Config-based registration for aliases, middlewares, listeners, livewire components

Important conventions:
- All interfaces/contracts live in `src/Contracts/` (NOT `src/Interfaces/`)
- CRUD packages (with database entities) require full API, imports, exports, actions, events, and 8-13+ contracts
- Utility packages (trait providers, wrappers) only need basic config and model contracts
- Reference implementation: `crm/contact` for CRUD package patterns

Analyze the codebase and create:

1. `.cursorrules` - Cursor AI instructions with:
   - Project structure and key directories
   - Architecture patterns and design decisions
   - Coding conventions (naming, return types, etc.)
   - Common tasks guide
   - Testing and commands
   - How this package extends package-tools (if applicable)

2. `.github/copilot-instructions.md` - GitHub Copilot instructions with:
   - Project overview
   - Key classes and relationships
   - Code style templates
   - Common patterns

3. `ARCHITECTURE.md` - Detailed architecture documentation with:
   - Directory structure
   - Class diagrams (ASCII)
   - Lifecycle/flow diagrams
   - Trait/interface reference tables
   - Extension points
   - How to add new features

4. `CLAUDE.md` - Claude Code guidance with:
   - Overview and links to other docs
   - Commands from composer.json
   - Quick architecture reference
   - Key files table
   - Code style summary

5. Update `README.md` if it exists and is incomplete, or create one if missing.

Base all content on actual code analysis. Include specific class names, method signatures, and file paths from this codebase.
EOF

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

show_help() {
    head -30 "$0" | tail -28 | sed 's/^# //' | sed 's/^#//'
    exit 0
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

find_packages_in_directory() {
    local dir="$1"

    if [[ ! -d "$dir" ]]; then
        log_error "Directory not found: $dir"
        exit 1
    fi

    # Find directories containing composer.json (Laravel packages)
    while IFS= read -r -d '' composer_file; do
        PACKAGES+=("$(dirname "$composer_file")")
    done < <(find "$dir" -maxdepth 2 -name "composer.json" -print0 2>/dev/null)

    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        log_error "No packages found in $dir"
        exit 1
    fi

    log_info "Found ${#PACKAGES[@]} packages in $dir"
}

read_packages_from_file() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        log_error "File not found: $file"
        exit 1
    fi

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^# ]] && continue

        # Expand ~ to home directory
        line="${line/#\~/$HOME}"

        if [[ -d "$line" ]]; then
            PACKAGES+=("$line")
        else
            log_warning "Skipping non-existent path: $line"
        fi
    done < "$file"

    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        log_error "No valid packages found in $file"
        exit 1
    fi

    log_info "Found ${#PACKAGES[@]} packages in $file"
}

process_package() {
    local package_path="$1"
    local package_name
    package_name=$(basename "$package_path")
    local log_file="${OUTPUT_DIR}/${package_name}.log"

    log_info "Processing: $package_name"

    # Check if Claude Code is available
    if ! command -v claude &> /dev/null; then
        log_error "Claude Code CLI not found. Install from: https://claude.ai/code"
        exit 1
    fi

    # Run Claude Code with the prompt (cd into directory first)
    # Use -p for non-interactive mode with --dangerously-skip-permissions to bypass permission checks
    if (cd "$package_path" && claude -p --dangerously-skip-permissions "$PROMPT") > "$log_file" 2>&1; then
        log_success "Completed: $package_name"
        echo "$package_path" >> "${OUTPUT_DIR}/completed.txt"
        return 0
    else
        log_error "Failed: $package_name (see $log_file)"
        echo "$package_path" >> "${OUTPUT_DIR}/failed.txt"
        return 1
    fi
}

process_packages_sequential() {
    local total=${#PACKAGES[@]}
    local current=0
    local failed=0

    for package in "${PACKAGES[@]}"; do
        ((current++))
        echo ""
        log_info "[$current/$total] Processing package..."

        if ! process_package "$package"; then
            ((failed++))
        fi
    done

    echo ""
    log_info "=========================================="
    log_info "Completed: $((total - failed))/$total packages"
    if [[ $failed -gt 0 ]]; then
        log_warning "Failed: $failed packages (see ${OUTPUT_DIR}/failed.txt)"
    fi
}

process_packages_parallel() {
    local total=${#PACKAGES[@]}

    log_info "Processing $total packages with concurrency: $CONCURRENCY"

    # Use GNU parallel if available, otherwise fall back to batch processing
    if command -v parallel &> /dev/null; then
        printf '%s\n' "${PACKAGES[@]}" | parallel -j "$CONCURRENCY" --bar \
            "cd {} && claude -p --dangerously-skip-permissions '$PROMPT' > '${OUTPUT_DIR}/\$(basename {}).log' 2>&1 && echo {} >> '${OUTPUT_DIR}/completed.txt' || echo {} >> '${OUTPUT_DIR}/failed.txt'"
    else
        # Batch processing fallback (compatible with bash 3.2 which lacks wait -n)
        local completed=0

        for ((i=0; i<total; i+=CONCURRENCY)); do
            local batch_end=$((i + CONCURRENCY))
            [[ $batch_end -gt $total ]] && batch_end=$total

            # Start batch of concurrent jobs
            for ((j=i; j<batch_end; j++)); do
                (process_package "${PACKAGES[$j]}") &
            done

            # Wait for entire batch to complete
            wait

            completed=$batch_end
            log_info "Progress: $completed/$total packages completed"
        done
    fi

    echo ""
    local success_count=0
    local fail_count=0
    [[ -f "${OUTPUT_DIR}/completed.txt" ]] && success_count=$(wc -l < "${OUTPUT_DIR}/completed.txt" | tr -d ' ')
    [[ -f "${OUTPUT_DIR}/failed.txt" ]] && fail_count=$(wc -l < "${OUTPUT_DIR}/failed.txt" | tr -d ' ')

    log_info "=========================================="
    log_info "Completed: $success_count/$total packages"
    if [[ $fail_count -gt 0 ]]; then
        log_warning "Failed: $fail_count packages (see ${OUTPUT_DIR}/failed.txt)"
    fi
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--directory)
            find_packages_in_directory "$2"
            shift 2
            ;;
        -f|--file)
            read_packages_from_file "$2"
            shift 2
            ;;
        -p|--package)
            PACKAGES+=("$2")
            shift 2
            ;;
        -c|--concurrency)
            CONCURRENCY="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            ;;
        *)
            log_error "Unknown option: $1"
            show_help
            ;;
    esac
done

# Validate
if [[ ${#PACKAGES[@]} -eq 0 ]]; then
    log_error "No packages specified. Use -d, -f, or -p to specify packages."
    echo ""
    show_help
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"
rm -f "${OUTPUT_DIR}/completed.txt" "${OUTPUT_DIR}/failed.txt"

# Process packages
echo ""
log_info "=========================================="
log_info "AI Context Generator"
log_info "=========================================="
log_info "Packages to process: ${#PACKAGES[@]}"
log_info "Concurrency: $CONCURRENCY"
log_info "Log directory: $OUTPUT_DIR"
log_info "=========================================="

if [[ $CONCURRENCY -eq 1 ]]; then
    process_packages_sequential
else
    process_packages_parallel
fi
