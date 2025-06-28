# Project Constitution: [Project Name]

## 1. Project Objective

This project, **[Project Name]**, is designed to solve **[core problem description]** for **[target audience]**. The primary business objective is to **[specific measurable goal, e.g., "streamline workflow efficiency by 40%", "provide real-time data analytics for decision making"]**.

### Target Users
- **Primary:** [e.g., Small to medium business teams, Data analysts, etc.]
- **Secondary:** [e.g., Enterprise administrators, End consumers, etc.]

## 2. Architecture Overview

This is a **multi-app monorepo** structure with clear separation of concerns:

- **Frontend (apps/frontend/):** User-facing web application
- **Backend API (apps/api/):** Core business logic and data access layer  
- **Database Layer:** Data persistence and management
- **Shared Libraries (packages/):** Common utilities, types, and components

## 3. Tech Stack

### Frontend Application
- **Language:** TypeScript
- **Framework:** Vue.js 3 with Composition API
- **State Management:** Pinia
- **Styling:** Tailwind CSS
- **Build Tool:** Vite
- **Testing:** Vitest, Vue Test Utils
- **Package Manager:** pnpm

### Backend API
- **Language:** Python 3.11+
- **Framework:** FastAPI
- **Database ORM:** SQLModel (built on SQLAlchemy)
- **Database:** PostgreSQL
- **Testing:** Pytest
- **Package Manager:** uv
- **Data Validation:** Pydantic
- **Environment Management:** python-dotenv

### Infrastructure & DevOps
- **Containerization:** Docker & Docker Compose
- **Database:** PostgreSQL 15+
- **Development:** Hot-reload for both frontend and backend
- **CI/CD:** GitHub Actions (template included)

### Development Tools
- **Memory & Context:** Memory MCP Server, Context7 MCP Server
- **Code Quality:** ESLint, Prettier (Frontend), Black, isort (Backend)
- **Type Checking:** TypeScript (Frontend), mypy (Backend)

## 4. Core Architectural Principles

### Separation of Concerns
- **Frontend:** Handles only UI/UX logic and user interactions
- **Backend:** Contains all business logic, data validation, and API endpoints
- **Database:** Pure data storage with well-defined schemas
- **Shared:** Common types, utilities, and constants

### Modularity & Reusability
- Code organized into feature-based modules with clear interfaces
- Shared components and utilities in dedicated packages
- Each app can be developed, tested, and deployed independently

### API-First Design
- All inter-app communication through well-defined REST APIs
- OpenAPI/Swagger documentation for all endpoints
- Consistent error handling and response formats

### SOLID Principles
- Especially critical in backend Python code
- Dependency injection where appropriate
- Interface segregation for better testability

### DRY (Don't Repeat Yourself)
- Business logic centralized in backend
- Shared types and interfaces in packages/shared
- Reusable UI components in packages/ui-components

## 5. Critical Coding Standards

### Python Backend Standards
- **Style:** Follow PEP8, use Black for formatting, isort for imports
- **Type Hints:** Required for all function signatures and class attributes
- **Docstrings:** Google-style docstrings for all public functions and classes
- **Error Handling:** Structured exception handling with custom exception classes
- **Security:** All inputs validated with Pydantic models, parameterized queries only

### Vue.js Frontend Standards  
- **Composition API:** Use `<script setup>` syntax exclusively
- **TypeScript:** Strict mode enabled, no `any` types without justification
- **Component Naming:** PascalCase for components, camelCase for composables
- **Styling:** Tailwind utility classes, minimal custom CSS
- **State Management:** Pinia stores for complex state, refs/reactive for local state

### General Standards
- **Naming:** Descriptive names, avoid abbreviations
- **Comments:** Explain "why" not "what", especially for complex business logic
- **File Organization:** Feature-based structure, max 500 lines per file
- **Git:** Conventional commits, feature branches, no direct main commits

## 6. Testing Requirements

### Comprehensive Test Coverage
All new code must include **minimum 3 test scenarios:**
1. **Positive Test:** Expected/happy path behavior
2. **Negative Test:** Error conditions and invalid inputs  
3. **Edge Case Test:** Boundary conditions and unusual but valid inputs

### Backend Testing (Pytest)
- **Unit Tests:** Individual functions and classes
- **Integration Tests:** API endpoints with database interactions
- **Test Database:** Separate test database with fixture data
- **Coverage:** Minimum 80% code coverage for business logic

### Frontend Testing (Vitest)
- **Component Tests:** User interactions and prop handling
- **Composable Tests:** Business logic in Vue composables
- **Integration Tests:** Component integration and API calls
- **E2E Tests:** Critical user journeys (when applicable)

## 7. Key Constraints & Non-Functional Requirements

### Performance
- **API Response Time:** P95 under 200ms for standard queries
- **Frontend Loading:** First Contentful Paint under 1.5s
- **Database:** Proper indexing for frequent queries

### Security
- **Authentication:** JWT-based authentication for API access
- **Data Validation:** All user inputs validated on backend
- **SQL Injection:** Only parameterized queries via SQLModel
- **XSS Prevention:** All output properly escaped/sanitized
- **Environment Variables:** Sensitive data in .env files, never committed

### Browser Support
- **Modern Browsers:** Latest 2 versions of Chrome, Firefox, Safari, Edge
- **Mobile Responsive:** Mobile-first design approach

### Data Privacy
- **Logging:** No PII in application logs
- **Data Retention:** Clear policies for user data
- **GDPR Compliance:** When applicable to user base

## 8. Development Workflow Integration

### MCP Server Configuration
This project integrates with:
- **Memory Server:** For persistent context across development sessions
- **Context7:** For accurate library documentation lookup
- **Custom Instructions:** Located in `.github/instructions/` directory

### AI-Assisted Development
- Follow the Agentic Development Framework (ADF)
- Use AGENT_WORKFLOW.md for complex feature development
- Maintain CHANGELOG.md for completed work tracking
- Reference this PROJECT_CONTEXT.md at the start of all AI sessions

### Quality Gates
- **Pre-commit:** Linting, type checking, basic tests
- **CI Pipeline:** Full test suite, security scanning, build verification
- **Code Review:** Required for all changes to main branch