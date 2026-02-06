---
name: add-api
description: Add complete RESTful API functionality to an existing Bespoke package
argument-hint: "<package-path>"
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
context: fork
agent: api-scaffolder
---

Add full API functionality to the package at the specified path.

**Package Path:** $ARGUMENTS

This will create:

1. **Contracts**
   - `src/Contracts/Api/{Model}Controller.php`
   - `src/Contracts/Api/Store{Model}.php`
   - `src/Contracts/Api/Update{Model}.php`

2. **Controller**
   - `src/Http/Controllers/Api/{Model}Controller.php` with index/store/show/update/destroy

3. **Requests**
   - `src/Http/Requests/Api/Store{Model}.php`
   - `src/Http/Requests/Api/Update{Model}.php`

4. **Resource**
   - `src/Http/Resources/{Model}Resource.php`

5. **Routes**
   - `routes/api.php` with RESTful endpoints using `{model:uuid}`

6. **Config Updates**
   - Add `controllers.api` section
   - Add `requests.api` section
   - Add `api` to `routes` array
   - Add `route_prefixes.api`

7. **ServiceProvider Updates**
   - Add API controller binding
   - Add API request bindings

Output a report of all files created/modified and the API endpoints available.
