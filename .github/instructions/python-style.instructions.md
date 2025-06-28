# Python Style & Conventions

---
description: Python-specific coding standards and conventions
applyTo: '**/*.py'
---

## Language & Framework Standards

- **Use Python** as the primary language
- **Follow PEP8**, use type hints, and format with `black`
- **Use `uv` for package management** - everything should be done within the local project virtual environment
- **Use `pydantic` for data validation**
- **Use `pytest` for testing** - all tests should be in a `/tests` folder mirroring the main app structure
- **Use `structlog` for structured logging** - ensure all logs are JSON formatted for easy parsing
- **Use `uvicorn` for running FastAPI applications** - ensure it is configured to
- **Use `uv sync`** to manage dependencies - never install packages globally
- **Use `uv pip freeze`** to generate `requirements.txt` for production
- **Use `python-dotenv`** for all sensitive configuration management like API keys and passwords
- **Follow PLANNING.md** for other technical stack decisions

- Use `FastAPI` for APIs and `SQLAlchemy` or `SQLModel` for ORM if applicable

## Code Organization

- **Never create a file longer than 500 lines of code.** If a file approaches this limit, refactor by splitting it into modules or helper files
- **Organize code into clearly separated modules**, grouped by feature or responsibility
- **Use clear, consistent imports** (prefer relative imports within packages)

## Documentation Standards

- **Write docstrings for every function** using the Google style:
  ```python
  def example():
      """
      Brief summary.

      Args:
          param1 (type): Description.

      Returns:
          type: Description.
      """
  ```

- **Comment non-obvious code** and ensure everything is understandable to a mid-level developer
- When writing complex logic, **add an inline `# Reason:` comment** explaining the why, not just the what