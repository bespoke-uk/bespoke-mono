#!/bin/bash
# setup-hooks.sh - Install git hooks for the Bespoke CMS monorepo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
HOOKS_DIR="$REPO_ROOT/.git/hooks"
CLAUDE_HOOKS="$REPO_ROOT/.claude/hooks"

echo "Setting up git hooks for Bespoke CMS..."
echo ""

# Check if we're in a git repository
if [ ! -d "$REPO_ROOT/.git" ]; then
    echo "ERROR: Not a git repository"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p "$HOOKS_DIR"

# Pre-commit hook
echo "Installing pre-commit hook..."
cat > "$HOOKS_DIR/pre-commit" << 'EOF'
#!/bin/bash
# Bespoke CMS pre-commit hook
# Runs validation checks before allowing commit

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"

# Run Claude Code validation
if [ -x "$REPO_ROOT/.claude/hooks/validate-commit.sh" ]; then
    "$REPO_ROOT/.claude/hooks/validate-commit.sh"
fi

# PHP syntax check on staged files
STAGED_PHP=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.php$' || true)

if [ -n "$STAGED_PHP" ]; then
    echo "Checking PHP syntax..."
    for file in $STAGED_PHP; do
        if [ -f "$file" ]; then
            php -l "$file" > /dev/null 2>&1
            if [ $? -ne 0 ]; then
                echo "PHP syntax error in: $file"
                exit 1
            fi
        fi
    done
fi

echo "Pre-commit checks passed!"
EOF
chmod +x "$HOOKS_DIR/pre-commit"
echo "  ✓ pre-commit"

# Commit message hook
echo "Installing commit-msg hook..."
cat > "$HOOKS_DIR/commit-msg" << 'EOF'
#!/bin/bash
# Bespoke CMS commit message hook
# Encourages conventional commit format (optional)

COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

# Skip merge commits
if echo "$COMMIT_MSG" | grep -qE "^Merge "; then
    exit 0
fi

# Check for conventional commit format (warning only)
if ! echo "$COMMIT_MSG" | grep -qE "^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+"; then
    echo ""
    echo "TIP: Consider using conventional commit format:"
    echo "  type(scope): description"
    echo ""
    echo "Types: feat, fix, docs, style, refactor, test, chore"
    echo "Example: feat(contact): add email validation"
    echo ""
fi

exit 0
EOF
chmod +x "$HOOKS_DIR/commit-msg"
echo "  ✓ commit-msg"

# Pre-push hook (optional - testing)
echo "Installing pre-push hook..."
cat > "$HOOKS_DIR/pre-push" << 'EOF'
#!/bin/bash
# Bespoke CMS pre-push hook
# Runs tests on modified packages before push

REPO_ROOT="$(git rev-parse --show-toplevel)"

# Get the current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Skip on main/master
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" || "$BRANCH" == "develop" ]]; then
    exit 0
fi

# Get remote and branch being pushed to
read local_ref local_sha remote_ref remote_sha

# Find modified packages
MODIFIED=$(git diff --name-only "$remote_sha"..."$local_sha" 2>/dev/null | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u || true)

if [ -z "$MODIFIED" ]; then
    exit 0
fi

echo "Running tests for modified packages..."
echo ""

FAILED=0
for pkg in $MODIFIED; do
    if [ -f "$REPO_ROOT/$pkg/composer.json" ]; then
        echo "Testing: $pkg"
        (cd "$REPO_ROOT/$pkg" && composer test --quiet 2>/dev/null) || {
            echo "  ✗ FAILED"
            FAILED=1
        }
    fi
done

if [ $FAILED -eq 1 ]; then
    echo ""
    echo "Some tests failed. Push anyway? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Push aborted."
        exit 1
    fi
fi

exit 0
EOF
chmod +x "$HOOKS_DIR/pre-push"
echo "  ✓ pre-push"

echo ""
echo "Git hooks installed successfully!"
echo ""
echo "Installed hooks:"
echo "  - pre-commit: Validates code before commit"
echo "  - commit-msg: Suggests conventional commit format"
echo "  - pre-push: Runs tests on modified packages"
echo ""
echo "To skip hooks when needed: git commit --no-verify"
