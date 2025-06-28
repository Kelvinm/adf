# Documentation & Research Instructions

---
description: Guidelines for using Context7 and research tools for accurate documentation
applyTo: '**'
---

## Context7 Usage

- **Always use the context7 MCP server** to reference documentation for libraries and packages
- For tokens, **start with 5000** but increase to **20000** if your first search didn't give relevant documentation
- If you don't get what you need with Context7, use the Brave MCP server to perform a wider search
- Never hallucinate libraries or functions – only use known, verified Python packages after checking documentation

## AI Behavior Rules

- **Never assume missing context. Ask questions if uncertain.**
- **Always confirm file paths and module names** exist before referencing them in code or tests
- **Never delete or overwrite existing code** unless explicitly instructed to or if part of a task 