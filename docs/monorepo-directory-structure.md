# Monorepo Directory Structure

```
project-root/
├── .github/
│   ├── instructions/           # AI instruction files for consistent development
│   │   ├── memory-usage.instructions.md
│   │   ├── documentation-research.instructions.md
│   │   ├── python-style.instructions.md
│   │   ├── javascript-frontend.instructions.md
│   │   ├── project-workflow.instructions.md
│   │   └── testing.instructions.md
│   └── workflows/             # GitHub Actions CI/CD
│       └── ci.yml
├── apps/
│   ├── frontend/              # Vue.js frontend application
│   │   ├── src/
│   │   │   ├── components/    # Vue components
│   │   │   ├── composables/   # Vue composables for reusable logic
│   │   │   ├── stores/        # Pinia stores for state management
│   │   │   ├── views/         # Page-level components
│   │   │   ├── router/        # Vue Router configuration
│   │   │   ├── assets/        # Static assets
│   │   │   ├── types/         # TypeScript type definitions
│   │   │   └── main.ts        # Application entry point
│   │   ├── tests/
│   │   │   ├── components/    # Component tests
│   │   │   ├── composables/   # Composable tests
│   │   │   ├── integration/   # Integration tests
│   │   │   └── fixtures/      # Test data and utilities
│   │   ├── public/            # Public assets
│   │   ├── package.json
│   │   ├── vite.config.ts     # Vite configuration
│   │   ├── tailwind.config.js # Tailwind CSS configuration
│   │   ├── tsconfig.json      # TypeScript configuration
│   │   └── vitest.config.ts   # Testing configuration
│   └── api/                   # FastAPI backend application
│       ├── app/
│       │   ├── models/        # SQLModel database models
│       │   ├── routers/       # FastAPI route handlers
│       │   ├── services/      # Business logic layer
│       │   ├── dependencies/  # Dependency injection
│       │   ├── core/          # Core utilities and configuration
│       │   │   ├── config.py  # Application settings
│       │   │   ├── database.py # Database connection
│       │   │   └── security.py # Security utilities
│       │   ├── schemas/       # Pydantic schemas for API
│       │   └── main.py        # FastAPI application entry point
│       ├── tests/
│       │   ├── test_models/   # Model tests
│       │   ├── test_routers/  # API endpoint tests
│       │   ├── test_services/ # Business logic tests
│       │   ├── integration/   # Integration tests
│       │   ├── fixtures/      # Test data and utilities
│       │   └── conftest.py    # Pytest configuration
│       ├── alembic/           # Database migrations
│       │   ├── versions/
│       │   └── alembic.ini
│       ├── pyproject.toml     # Python project configuration
│       ├── uv.lock           # Python dependency lock file
│       └── .env.example       # Environment variables template
├── packages/                  # Shared libraries and utilities
│   ├── shared-types/          # TypeScript types shared between frontend and backend
│   │   ├── src/
│   │   │   ├── api/          # API request/response types
│   │   │   ├── entities/     # Domain entity types
│   │   │   └── common/       # Common utility types
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── ui-components/         # Reusable Vue components
│   │   ├── src/
│   │   │   ├── components/   # Base UI components
│   │   │   ├── composables/  # Shared composables
│   │   │   └── index.ts      # Component exports
│   │   ├── tests/
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── python-utils/          # Shared Python utilities
│       ├── src/
│       │   ├── database/     # Database utilities
│       │   ├── security/     # Security utilities
│       │   ├── validation/   # Common validators
│       │   └── __init__.py
│       ├── tests/
│       └── pyproject.toml
├── docs/                      # Project documentation
│   ├── api/                  # API documentation
│   ├── deployment/           # Deployment guides
│   ├── development/          # Development setup guides
│   └── architecture/         # System architecture documentation
├── scripts/                   # Development and deployment scripts
│   ├── setup-dev.sh          # Development environment setup
│   ├── run-tests.sh          # Test execution script
│   └── deploy.sh             # Deployment script
├── docker/                    # Docker configuration files
│   ├── frontend.Dockerfile
│   ├── api.Dockerfile
│   └── postgres.Dockerfile
├── .vscode/                   # VS Code configuration (if using)
│   ├── settings.json
│   ├── launch.json
│   └── mcp.json              # MCP server configuration
├── PROJECT_CONTEXT.md         # ADF: Project constitution and guidelines
├── AGENT_WORKFLOW.md          # ADF: Dynamic task management
├── CHANGELOG.md               # ADF: Completed work tracking
├── README.md                  # Project overview and setup instructions
├── docker-compose.yml         # Development environment
├── docker-compose.prod.yml    # Production environment
├── package.json               # Root package.json for pnpm workspace
├── pnpm-workspace.yaml        # pnpm workspace configuration
├── .gitignore                 # Git ignore rules
├── .env.example               # Environment variables template
└── LICENSE                    # Project license
```

## Key Directory Explanations

### `/apps/` - Application Layer
Contains the main applications (frontend and backend). Each app is self-contained but can import from shared packages.

### `/packages/` - Shared Code
Reusable libraries and utilities that can be used across multiple apps. This promotes DRY principles and maintains consistency.

### `/.github/instructions/` - AI Instructions
Your existing instruction files that guide AI behavior for different aspects of development (memory usage, coding standards, testing, etc.).

### `/docs/` - Documentation
Comprehensive project documentation including API specs, deployment guides, and architectural decisions.

### `/scripts/` - Automation
Helper scripts for common development tasks, testing, and deployment.

### Root Level Files
- **PROJECT_CONTEXT.md**: The ADF "constitution" - foundational guidelines for AI agents
- **AGENT_WORKFLOW.md**: Dynamic task management for current development work
- **CHANGELOG.md**: Long-term memory of completed features and changes

## Development Workflow Integration

This structure is optimized for:
1. **AI-assisted development** with clear context boundaries
2. **Independent development** of frontend and backend
3. **Shared code reuse** through the packages system
4. **Testing at multiple levels** (unit, integration, e2e)
5. **Easy deployment** with Docker containerization
6. **MCP server integration** for memory and documentation lookup

## Getting Started

1. Copy this structure to your new project
2. Update PROJECT_CONTEXT.md with your specific project details
3. Configure MCP servers in `.vscode/mcp.json` or equivalent
4. Initialize development environment with `scripts/setup-dev.sh`
5. Start your first feature using AGENT_WORKFLOW.md guidance