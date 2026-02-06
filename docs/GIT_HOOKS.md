# Git Hooks Setup

This guide explains how to set up git hooks for the Bespoke CMS monorepo.

## Available Hooks

The `.claude/hooks/` directory contains scripts that can be used as git hooks:

| Script | Purpose | Recommended Git Hook |
|--------|---------|---------------------|
| `validate-commit.sh` | Pre-commit validation | `pre-commit` |
| `format-php.sh` | Auto-format PHP files | `pre-commit` |

## Quick Setup

### Option 1: Symlink (Recommended)

```bash
# From repository root
cd .git/hooks

# Create pre-commit hook
cat > pre-commit << 'EOF'
#!/bin/bash
# Run Claude Code validation
../../.claude/hooks/validate-commit.sh
EOF

chmod +x pre-commit
```

### Option 2: Copy Scripts

```bash
cp .claude/hooks/validate-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### Option 3: Use Husky (for npm projects)

If using npm in your workflow:

```bash
npm install husky --save-dev
npx husky install
npx husky add .husky/pre-commit ".claude/hooks/validate-commit.sh"
```

## What validate-commit.sh Checks

The pre-commit validation script checks for:

1. **Missing `declare(strict_types=1)`**
   - Warns if PHP files don't have strict types declaration
   - Non-blocking warning

2. **Using `Interfaces/` instead of `Contracts/`**
   - Blocks commit if files are in wrong directory
   - Critical error

3. **Debug functions (`dd()`, `dump()`)**
   - Warns about debug code left in
   - Non-blocking warning

4. **`env()` calls outside config**
   - Warns about environment access in wrong places
   - Non-blocking warning

5. **Committing `.env` files**
   - Blocks commit of environment files
   - Critical error

## Custom Pre-Commit Hook

For more comprehensive validation, create a custom hook:

```bash
#!/bin/bash
# .git/hooks/pre-commit

set -e

echo "Running pre-commit checks..."

# 1. Claude Code validation
./.claude/hooks/validate-commit.sh

# 2. Get list of staged PHP files
STAGED_PHP=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.php$' || true)

if [ -n "$STAGED_PHP" ]; then
    # 3. Run PHP syntax check
    for file in $STAGED_PHP; do
        php -l "$file" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "PHP syntax error in: $file"
            exit 1
        fi
    done

    # 4. Run Pint on staged files (optional - may modify files)
    # echo "$STAGED_PHP" | xargs ./vendor/bin/pint --dirty

    # 5. Run PHPStan on staged files (optional)
    # echo "$STAGED_PHP" | xargs ./vendor/bin/phpstan analyse --no-progress
fi

echo "Pre-commit checks passed!"
```

## Pre-Push Hook

For running tests before push:

```bash
#!/bin/bash
# .git/hooks/pre-push

echo "Running tests before push..."

# Get the current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Only run on feature branches (skip main/master)
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
    echo "Skipping tests on $BRANCH"
    exit 0
fi

# Run tests for modified packages
MODIFIED_PACKAGES=$(git diff --name-only origin/$BRANCH...HEAD | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u)

if [ -z "$MODIFIED_PACKAGES" ]; then
    echo "No package changes detected"
    exit 0
fi

FAILED=0
for pkg in $MODIFIED_PACKAGES; do
    echo "Testing: $pkg"
    if [ -f "$pkg/composer.json" ]; then
        (cd "$pkg" && composer test) || FAILED=1
    fi
done

if [ $FAILED -eq 1 ]; then
    echo "Tests failed! Push aborted."
    exit 1
fi

echo "All tests passed!"
```

## Commit Message Hook

Enforce commit message format:

```bash
#!/bin/bash
# .git/hooks/commit-msg

COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

# Check for conventional commit format
if ! echo "$COMMIT_MSG" | grep -qE "^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+"; then
    echo "Invalid commit message format!"
    echo ""
    echo "Expected format: type(scope): description"
    echo "Types: feat, fix, docs, style, refactor, test, chore"
    echo ""
    echo "Examples:"
    echo "  feat(contact): add email validation"
    echo "  fix(auth): resolve login redirect issue"
    echo "  docs: update README"
    exit 1
fi
```

## Bypassing Hooks

In rare cases where you need to skip hooks:

```bash
# Skip pre-commit hook
git commit --no-verify -m "message"

# Skip pre-push hook
git push --no-verify
```

**Warning:** Use sparingly and only when necessary.

## Shared Hooks (Team Setup)

To share hooks across the team:

1. Hooks are already in `.claude/hooks/`
2. Add setup script to `scripts/`:

```bash
#!/bin/bash
# scripts/setup-hooks.sh

HOOKS_DIR=".git/hooks"
CLAUDE_HOOKS=".claude/hooks"

echo "Setting up git hooks..."

# Pre-commit
cat > "$HOOKS_DIR/pre-commit" << EOF
#!/bin/bash
$CLAUDE_HOOKS/validate-commit.sh
EOF
chmod +x "$HOOKS_DIR/pre-commit"

echo "Git hooks installed!"
```

3. Document in README or onboarding docs
4. Run after clone: `./scripts/setup-hooks.sh`

## Troubleshooting

### Hook not running
```bash
# Check if executable
ls -la .git/hooks/pre-commit

# Make executable
chmod +x .git/hooks/pre-commit
```

### Hook failing silently
```bash
# Run manually to see output
.git/hooks/pre-commit
```

### Permission denied
```bash
# Check script has correct shebang
head -1 .git/hooks/pre-commit
# Should be: #!/bin/bash
```
