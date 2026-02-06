---
name: audit
description: Audit a Bespoke package against docs/PACKAGE_STANDARDS.md compliance requirements
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Glob
  - Grep
context: fork
agent: package-auditor
---

Audit the package at the specified path against docs/PACKAGE_STANDARDS.md.

**Package Path:** $ARGUMENTS

Run a full compliance audit checking:
1. Directory structure (15 points)
2. Contracts count (13 points)
3. ServiceProvider binding methods (14 points)
4. Config file sections (22 points)
5. API implementation (10 points)
6. Import/Export functionality (8 points)

First determine if this is a CRUD package or Utility package, then apply the appropriate scoring.

Output a detailed report with:
- Overall compliance score and percentage
- Checklist for each category
- Specific recommendations for improvement
- References to docs/PACKAGE_STANDARDS.md sections

Compare against `/crm/contact` as the reference implementation (100% compliant).
