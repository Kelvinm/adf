#!/bin/bash
# setup-dev.sh - Development Environment Setup Script

set -e

echo "🚀 Setting up Agentic Development Framework project..."

# Check if required tools are installed
check_tool() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $1 is not installed. Please install it first."
        exit 1
    fi
}

echo "📋 Checking required tools..."
check_tool "node"
check_tool "python3"
check_tool "docker"
check_tool "pnpm"

# Check if uv is installed for Python package management
if ! command -v uv &> /dev/null; then
    echo "📦 Installing uv for Python package management..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source $HOME/.cargo/env
fi

echo "✅ All required tools found!"

# Initialize pnpm workspace if not already done
if [ ! -f "pnpm-workspace.yaml" ]; then
    echo "📦 Setting up pnpm workspace..."
    cat > pnpm-workspace.yaml << EOF
packages:
  - 'apps/*'
  - 'packages/*'
EOF
fi

# Create root package.json if not exists
if [ ! -f "package.json" ]; then
    echo "📝 Creating root package.json..."
    cat > package.json << EOF
{
  "name": "agentic-project-root",
  "version": "1.0.0",
  "private": true,
  "description": "Agentic Development Framework project",
  "scripts": {
    "dev": "concurrently \"pnpm --filter frontend dev\" \"pnpm --filter api dev\"",
    "build": "pnpm --filter frontend build && pnpm --filter api build",
    "test": "pnpm --filter frontend test && pnpm --filter api test",
    "test:watch": "concurrently \"pnpm --filter frontend test:watch\" \"pnpm --filter api test:watch\"",
    "lint": "pnpm --filter frontend lint && pnpm --filter api lint",
    "type-check": "pnpm --filter frontend type-check"
  },
  "devDependencies": {
    "concurrently": "^8.2.2"
  },
  "engines": {
    "node": ">=18.0.0",
    "pnpm": ">=8.0.0"
  }
}
EOF
fi

# Setup frontend application
echo "🎨 Setting up frontend application..."
if [ ! -d "apps/frontend" ]; then
    mkdir -p apps/frontend
    cd apps/frontend
    
    # Create Vue.js app with TypeScript and Tailwind
    pnpm create vue@latest . --typescript --router --pinia --vitest --eslint --prettier
    
    # Install additional dependencies
    pnpm add @vueuse/core @vueuse/head
    pnpm add -D @types/node tailwindcss postcss autoprefixer
    
    # Initialize Tailwind CSS
    npx tailwindcss init -p
    
    cd ../..
else
    echo "✅ Frontend already exists, installing dependencies..."
    cd apps/frontend && pnpm install && cd ../..
fi

# Setup backend API
echo "🔧 Setting up backend API..."
if [ ! -d "apps/api" ]; then
    mkdir -p apps/api
    cd apps/api
    
    # Initialize Python project with uv
    uv init --python 3.11
    
    # Add common dependencies
    uv add fastapi uvicorn sqlmodel psycopg2-binary alembic python-dotenv pydantic-settings
    uv add --dev pytest pytest-asyncio httpx black isort mypy
    
    cd ../..
else
    echo "✅ Backend already exists, installing dependencies..."
    cd apps/api && uv install && cd ../..
fi

# Setup shared packages
echo "📦 Setting up shared packages..."

# Shared types package
if [ ! -d "packages/shared-types" ]; then
    mkdir -p packages/shared-types/src
    cd packages/shared-types
    
    cat > package.json << EOF
{
  "name": "@project/shared-types",
  "version": "1.0.0",
  "type": "module",
  "main": "./src/index.ts",
  "types": "./src/index.ts",
  "exports": {
    ".": "./src/index.ts"
  },
  "devDependencies": {
    "typescript": "^5.0.0"
  }
}
EOF
    
    cat > tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "declaration": true,
    "strict": true,
    "skipLibCheck": true,
    "esModuleInterop": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
EOF
    
    cat > src/index.ts << EOF
// Common types shared between frontend and backend
export interface User {
  id: string;
  email: string;
  created_at: string;
  updated_at: string;
}

export interface ApiResponse<T> {
  data: T;
  message?: string;
  success: boolean;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  per_page: number;
  total_pages: number;
}
EOF
    
    cd ../..
fi

# UI components package
if [ ! -d "packages/ui-components" ]; then
    mkdir -p packages/ui-components/src
    cd packages/ui-components
    
    cat > package.json << EOF
{
  "name": "@project/ui-components",
  "version": "1.0.0",
  "type": "module",
  "main": "./src/index.ts",
  "types": "./src/index.ts",
  "exports": {
    ".": "./src/index.ts"
  },
  "dependencies": {
    "vue": "^3.4.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@vitejs/plugin-vue": "^5.0.0"
  }
}
EOF
    
    mkdir -p src/components
    cat > src/index.ts << EOF
// Export all UI components
export { default as BaseButton } from './components/BaseButton.vue';
export { default as BaseInput } from './components/BaseInput.vue';
export { default as LoadingSpinner } from './components/LoadingSpinner.vue';
EOF
    
    cd ../..
fi

# Create environment files
echo "🔐 Setting up environment configuration..."
if [ ! -f ".env.example" ]; then
    cat > .env.example << EOF
# Database Configuration
DATABASE_URL=postgresql://postgres:password@localhost:5432/project_db
TEST_DATABASE_URL=postgresql://postgres:password@localhost:5432/project_test_db

# API Configuration  
API_HOST=localhost
API_PORT=8000
SECRET_KEY=your-secret-key-here

# Frontend Configuration
VITE_API_URL=http://localhost:8000

# Third-party Services
CONTEXT7_API_KEY=your-context7-api-key
BRAVE_API_KEY=your-brave-search-api-key
EOF
fi

# Setup Docker development environment
echo "🐳 Setting up Docker development environment..."
if [ ! -f "docker-compose.yml" ]; then
    cat > docker-compose.yml << EOF
version: '3.8'

services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: project_db
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./scripts/init-test-db.sql:/docker-entrypoint-initdb.d/init-test-db.sql

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

volumes:
  postgres_data:
  redis_data:
EOF
fi

# Create test database initialization script
mkdir -p scripts
cat > scripts/init-test-db.sql << EOF
-- Create test database
CREATE DATABASE project_test_db;
GRANT ALL PRIVILEGES ON DATABASE project_test_db TO postgres;
EOF

# Setup testing scripts
cat > scripts/run-tests.sh << 'EOF'
#!/bin/bash
set -e

echo "🧪 Running comprehensive test suite..."

# Start test database if not running
if ! docker ps | grep -q postgres; then
    echo "🐳 Starting test database..."
    docker-compose up -d postgres
    sleep 5
fi

# Run backend tests
echo "🔧 Running backend tests..."
cd apps/api
uv run pytest tests/ -v --cov=app --cov-report=term-missing
cd ../..

# Run frontend tests  
echo "🎨 Running frontend tests..."
cd apps/frontend
pnpm test:unit
cd ../..

# Run type checking
echo "📝 Running type checks..."
cd apps/frontend
pnpm type-check
cd ../..

echo "✅ All tests passed!"
EOF

chmod +x scripts/run-tests.sh

# Install root dependencies
echo "📦 Installing root dependencies..."
pnpm install

# Setup git hooks (if git repo exists)
if [ -d ".git" ]; then
    echo "🪝 Setting up git hooks..."
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
echo "🔍 Running pre-commit checks..."
pnpm lint
pnpm type-check
echo "✅ Pre-commit checks passed!"
EOF
    chmod +x .git/hooks/pre-commit
fi

echo ""
echo "🎉 Setup complete! Your Agentic Development Framework project is ready."
echo ""
echo "📋 Next steps:"
echo "1. Copy .env.example to .env and configure your environment variables"
echo "2. Start the development environment: docker-compose up -d"
echo "3. Run the development servers: pnpm dev"
echo "4. Start your first feature using AGENT_WORKFLOW.md"
echo ""
echo "🔧 Available commands:"
echo "  pnpm dev          - Start development servers"
echo "  pnpm test         - Run all tests"
echo "  pnpm lint         - Run linting"
echo "  ./scripts/run-tests.sh - Comprehensive test suite"
echo ""
echo "📚 Documentation:"
echo "  PROJECT_CONTEXT.md - Project guidelines and standards"
echo "  AGENT_WORKFLOW.md  - Current task management"
echo "  CHANGELOG.md       - Completed work history"
echo ""