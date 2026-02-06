# CI/CD Integration Guide

This guide covers integrating the Bespoke CMS monorepo with CI/CD pipelines.

## GitHub Actions

### Basic Test Workflow

```yaml
# .github/workflows/tests.yml
name: Tests

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest

    strategy:
      fail-fast: false
      matrix:
        php: ['8.2', '8.3']
        laravel: ['10.*', '11.*', '12.*']

    name: PHP ${{ matrix.php }} - Laravel ${{ matrix.laravel }}

    steps:
      - uses: actions/checkout@v4

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: ${{ matrix.php }}
          extensions: dom, curl, libxml, mbstring, zip, pcntl, pdo, sqlite, pdo_sqlite
          coverage: none

      - name: Get changed packages
        id: changes
        run: |
          if [ "${{ github.event_name }}" = "pull_request" ]; then
            PACKAGES=$(git diff --name-only origin/${{ github.base_ref }}...HEAD | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u | tr '\n' ' ')
          else
            PACKAGES=$(git diff --name-only HEAD~1 | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u | tr '\n' ' ')
          fi
          echo "packages=$PACKAGES" >> $GITHUB_OUTPUT

      - name: Install dependencies and test
        run: |
          for pkg in ${{ steps.changes.outputs.packages }}; do
            if [ -f "$pkg/composer.json" ]; then
              echo "Testing: $pkg"
              cd "$pkg"
              composer require "laravel/framework:${{ matrix.laravel }}" --no-update
              composer update --prefer-dist --no-interaction
              composer test
              cd -
            fi
          done
```

### Static Analysis Workflow

```yaml
# .github/workflows/static-analysis.yml
name: Static Analysis

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  phpstan:
    runs-on: ubuntu-latest
    name: PHPStan

    steps:
      - uses: actions/checkout@v4

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'

      - name: Get changed packages
        id: changes
        run: |
          PACKAGES=$(git diff --name-only origin/${{ github.base_ref }}...HEAD | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u | tr '\n' ' ')
          echo "packages=$PACKAGES" >> $GITHUB_OUTPUT

      - name: Run PHPStan
        run: |
          for pkg in ${{ steps.changes.outputs.packages }}; do
            if [ -f "$pkg/phpstan.neon.dist" ]; then
              echo "Analysing: $pkg"
              cd "$pkg"
              composer update --prefer-dist --no-interaction
              composer analyse
              cd -
            fi
          done

  pint:
    runs-on: ubuntu-latest
    name: Code Style

    steps:
      - uses: actions/checkout@v4

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'

      - name: Check code style
        run: |
          for pkg in ${{ steps.changes.outputs.packages }}; do
            if [ -f "$pkg/pint.json" ]; then
              echo "Checking: $pkg"
              cd "$pkg"
              composer update --prefer-dist --no-interaction
              ./vendor/bin/pint --test
              cd -
            fi
          done
```

### Full Matrix Testing

```yaml
# .github/workflows/full-test.yml
name: Full Test Suite

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday
  workflow_dispatch:

jobs:
  test-all:
    runs-on: ubuntu-latest

    strategy:
      fail-fast: false
      matrix:
        category: [api, blade, cms, core, crm, custom, default, ecommerce]

    name: Test ${{ matrix.category }}

    steps:
      - uses: actions/checkout@v4

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'

      - name: Test all packages in category
        run: |
          for pkg in ${{ matrix.category }}/*/; do
            if [ -f "$pkg/composer.json" ]; then
              echo "Testing: $pkg"
              cd "$pkg"
              composer update --prefer-dist --no-interaction
              composer test || echo "FAILED: $pkg" >> /tmp/failures.txt
              cd -
            fi
          done

          if [ -f /tmp/failures.txt ]; then
            echo "Failed packages:"
            cat /tmp/failures.txt
            exit 1
          fi
```

## GitLab CI

```yaml
# .gitlab-ci.yml
stages:
  - lint
  - test
  - analyse

variables:
  COMPOSER_HOME: /cache/composer

.php-template:
  image: php:8.2-cli
  before_script:
    - apt-get update && apt-get install -y git unzip
    - curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

lint:
  extends: .php-template
  stage: lint
  script:
    - |
      for pkg in $(git diff --name-only origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME...HEAD | grep -oE '^[^/]+/[^/]+' | sort -u); do
        if [ -f "$pkg/pint.json" ]; then
          cd "$pkg"
          composer install --prefer-dist --no-interaction
          ./vendor/bin/pint --test
          cd -
        fi
      done
  only:
    - merge_requests

test:
  extends: .php-template
  stage: test
  script:
    - |
      for pkg in $(git diff --name-only origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME...HEAD | grep -oE '^[^/]+/[^/]+' | sort -u); do
        if [ -f "$pkg/composer.json" ]; then
          cd "$pkg"
          composer install --prefer-dist --no-interaction
          composer test
          cd -
        fi
      done
  only:
    - merge_requests

analyse:
  extends: .php-template
  stage: analyse
  script:
    - |
      for pkg in $(git diff --name-only origin/$CI_MERGE_REQUEST_TARGET_BRANCH_NAME...HEAD | grep -oE '^[^/]+/[^/]+' | sort -u); do
        if [ -f "$pkg/phpstan.neon.dist" ]; then
          cd "$pkg"
          composer install --prefer-dist --no-interaction
          composer analyse
          cd -
        fi
      done
  only:
    - merge_requests
```

## Package Validation Job

Add validation that uses the audit tooling:

```yaml
# .github/workflows/validate-packages.yml
name: Validate Packages

on:
  pull_request:
    paths:
      - '*/*/src/**'
      - '*/*/config/**'

jobs:
  validate:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Get changed packages
        id: changes
        run: |
          PACKAGES=$(git diff --name-only origin/${{ github.base_ref }}...HEAD | grep -oE '^(api|blade|cms|core|crm|custom|default|ecommerce)/[^/]+' | sort -u)
          echo "packages=$PACKAGES" >> $GITHUB_OUTPUT

      - name: Validate package structure
        run: |
          for pkg in ${{ steps.changes.outputs.packages }}; do
            echo "Validating: $pkg"

            # Check for Contracts (not Interfaces)
            if [ -d "$pkg/src/Interfaces" ]; then
              echo "ERROR: $pkg uses Interfaces/ instead of Contracts/"
              exit 1
            fi

            # Check for config file
            PKG_NAME=$(basename "$pkg")
            if [ ! -f "$pkg/config/$PKG_NAME.php" ]; then
              echo "WARNING: $pkg missing config file"
            fi

            # Check for CLAUDE.md
            if [ ! -f "$pkg/CLAUDE.md" ]; then
              echo "WARNING: $pkg missing CLAUDE.md"
            fi

            # Check for strict types in PHP files
            for php_file in $(find "$pkg/src" -name "*.php" 2>/dev/null); do
              if ! head -5 "$php_file" | grep -q "declare(strict_types=1)"; then
                echo "WARNING: $php_file missing strict_types declaration"
              fi
            done
          done
```

## Caching Strategies

### Composer Cache

```yaml
- name: Cache Composer packages
  uses: actions/cache@v3
  with:
    path: |
      ~/.composer/cache
      */*/vendor
    key: ${{ runner.os }}-composer-${{ hashFiles('**/composer.lock') }}
    restore-keys: |
      ${{ runner.os }}-composer-
```

### Per-Package Cache

```yaml
- name: Cache package vendors
  uses: actions/cache@v3
  with:
    path: ${{ matrix.package }}/vendor
    key: ${{ runner.os }}-${{ matrix.package }}-${{ hashFiles(format('{0}/composer.lock', matrix.package)) }}
```

## Notifications

### Slack Notification

```yaml
- name: Notify Slack on failure
  if: failure()
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    fields: repo,message,commit,author,action,eventName,ref,workflow
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK }}
```

## Private Packagist Integration

For publishing packages:

```yaml
# .github/workflows/publish.yml
name: Publish to Packagist

on:
  release:
    types: [published]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger Packagist update
        run: |
          curl -X POST \
            -H "Authorization: token ${{ secrets.PACKAGIST_TOKEN }}" \
            "https://repo.packagist.com/api/update-package?url=https://github.com/${{ github.repository }}"
```

## Best Practices

1. **Only test changed packages** - Monorepos can be slow; target what changed
2. **Use matrix builds** - Test across PHP/Laravel versions in parallel
3. **Cache aggressively** - Composer installs are slow
4. **Fail fast on critical issues** - Style/lint before tests
5. **Separate workflows** - PR checks vs scheduled full runs
6. **Use artifacts** - Save test reports for debugging
7. **Timeout limits** - Prevent hung jobs from blocking
