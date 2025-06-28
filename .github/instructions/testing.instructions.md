# Testing Instructions

---
description: Testing standards and requirements for Python projects
applyTo: '**/*.py'
---

## Testing Requirements

- **Always create Pytest unit tests for new features** (functions, classes, routes, etc)
- **After updating any logic**, check whether existing unit tests need to be updated. If so, do it
- **Tests should live in a `/tests` folder** mirroring the main app structure

## Test Coverage Standards

Include at least:
- 1 test for expected use
- 1 edge case  
- 1 failure case

## Test Organization

- Mirror the main application structure in the `/tests` folder
- Use descriptive test names that explain what is being tested
- Group related tests using classes when appropriate