# ADF - Agentic Development Framework

> A comprehensive template for AI-enabled full-stack development with modern best practices

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![Node.js 18+](https://img.shields.io/badge/node-18+-green.svg)](https://nodejs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?logo=typescript&logoColor=white)](https://www.typescriptlang.org/)

## 🎯 Overview

The **Agentic Development Framework (ADF)** is a production-ready template for building modern, AI-enabled web applications. It provides a solid foundation for rapid development with industry best practices, comprehensive tooling, and a well-structured monorepo architecture.

This framework is designed to accelerate development by providing:
- **Pre-configured tech stack** with modern tools and frameworks
- **AI-assisted development** with built-in instruction files and MCP server configurations  
- **Comprehensive testing** setup and standards
- **Development workflow** optimizations for team collaboration
- **Production-ready** architecture patterns

## 🏗️ Architecture

**Multi-app Monorepo Structure** with clear separation of concerns:

```
🎯 Frontend (Vue.js 3 + TypeScript) ─────┐
                                          │
🔄 API Layer (FastAPI + Python)  ────────┼─── 📦 Shared Packages
                                          │
🗄️ Database (PostgreSQL + SQLModel) ─────┘
```

### Tech Stack

#### Frontend
- **Vue.js 3** with Composition API (`<script setup>`)
- **TypeScript** in strict mode
- **Tailwind CSS** for styling
- **Pinia** for state management
- **Vite** for build tooling
- **Vitest** for testing

#### Backend  
- **FastAPI** for high-performance APIs
- **Python 3.11+** with type hints
- **SQLModel** (built on SQLAlchemy) for database ORM
- **PostgreSQL** for data persistence
- **Pytest** for comprehensive testing
- **UV** for fast Python package management

#### Development Tools
- **Docker & Docker Compose** for containerization
- **GitHub Actions** for CI/CD
- **ESLint + Prettier** (Frontend) / **Black + isort** (Backend)
- **Memory MCP Server** & **Context7 MCP Server** for AI assistance

## 🚀 Quick Start

### Prerequisites

Ensure you have these tools installed:
- **Node.js 18+** and **pnpm**
- **Python 3.11+** and **uv**
- **Docker** and **Docker Compose**
- **Git**

### Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd adf
   ```

2. **Run the setup script**
   ```bash
   chmod +x setup-script.sh
   ./setup-script.sh
   ```

3. **Start development servers**
   ```bash
   # Start all services with Docker Compose
   docker-compose up --build
   
   # Or run individually:
   # Frontend (http://localhost:3000)
   cd apps/frontend && pnpm dev
   
   # Backend API (http://localhost:8000)
   cd apps/api && uv run fastapi dev
   ```

## 📁 Project Structure

```
adf/
├── 🏢 apps/
│   ├── frontend/           # Vue.js application
│   └── api/               # FastAPI backend
├── 📦 packages/           # Shared libraries
│   ├── shared-types/      # Common TypeScript types
│   ├── ui-components/     # Reusable Vue components
│   └── python-utils/      # Shared Python utilities
├── 📚 docs/               # Project documentation
├── 🐳 docker/             # Docker configurations
├── 🔧 scripts/            # Development scripts
├── 🤖 .github/            # AI instructions & workflows
│   └── instructions/      # Development guidelines for AI
└── 📋 Project files       # Config, docs, and setup files
```

## 🧪 Testing

The project follows comprehensive testing standards:

- **Unit Tests**: For all business logic and components
- **Integration Tests**: For API endpoints and database operations  
- **End-to-End Tests**: For critical user workflows

```bash
# Run all tests
./scripts/run-tests.sh

# Frontend tests
cd apps/frontend && pnpm test

# Backend tests  
cd apps/api && uv run pytest
```

## 🛠️ Development Guidelines

### Code Standards
- **Python**: PEP8, Black formatting, type hints required
- **TypeScript**: Strict mode, ESLint + Prettier
- **Git**: Conventional commits, feature branches
- **Testing**: Minimum 3 test cases per feature (happy path, edge case, error case)

### AI-Assisted Development
The `.github/instructions/` directory contains specialized instruction files for:
- Python backend development
- Vue.js frontend development  
- Testing standards
- Documentation research
- Memory usage optimization

These files guide AI assistants to maintain code quality and consistency.

## 📚 Documentation

- **[Architecture Overview](docs/architecture/)** - System design and patterns
- **[API Documentation](docs/api/)** - REST API endpoints and schemas
- **[Development Guide](docs/development/)** - Setup and workflow instructions
- **[Deployment Guide](docs/deployment/)** - Production deployment strategies

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Follow the coding standards and write tests
4. Commit using conventional commits (`git commit -m 'feat: add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by Google's deep research on agentic development patterns
- Built with modern web development best practices
- Designed for AI-assisted development workflows

---

**Ready to build something amazing?** 🚀

Get started by running `./setup-script.sh` and dive into the `apps/` directory to begin development!