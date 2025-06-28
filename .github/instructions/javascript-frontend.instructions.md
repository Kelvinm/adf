# JavaScript & Frontend Instructions

---
description: JavaScript, Vue.js, and frontend development standards and conventions
applyTo: '**/*.js,**/*.ts,**/*.vue,**/*.jsx,**/*.tsx'
---

## Language & Framework Standards

- **Use modern JavaScript (ES6+)** with proper async/await for asynchronous operations
- **Use TypeScript when possible** for better type safety and developer experience
- **Vue.js is the preferred frontend framework** - follow Vue 3 Composition API patterns
- **Use Tailwind CSS** for all styling - avoid custom CSS unless absolutely necessary
- **Use npm or pnpm** for package management (prefer pnpm for performance)

## Vue.js Specific Guidelines

- **Prefer Composition API** over Options API for new components
- **Use `<script setup>`** syntax for cleaner, more concise component code
- **Follow Vue's naming conventions**: 
  - PascalCase for component names
  - camelCase for props and emitted events
  - kebab-case for HTML attributes
- **Use Vue's reactivity system properly**: `ref()` for primitives, `reactive()` for objects
- **Structure components logically**:
  ```vue
  <script setup>
  // 1. Imports
  // 2. Props/emits definitions  
  // 3. Reactive state
  // 4. Computed properties
  // 5. Methods/functions
  // 6. Lifecycle hooks
  </script>

  <template>
    <!-- Clean, semantic HTML with Tailwind classes -->
  </template>
  ```

## Code Organization

- **Keep components under 300 lines** - split large components into smaller, focused ones
- **Use composables** (`use*.js` files) for reusable logic across components
- **Organize by feature**, not by file type:
  ```
  src/
    features/
      auth/
        components/
        composables/
        stores/
      dashboard/
        components/
        composables/
        stores/
  ```

## Styling with Tailwind

- **Use Tailwind utility classes** instead of custom CSS
- **Use Tailwind's responsive prefixes** (`sm:`, `md:`, `lg:`) for responsive design
- **Leverage Tailwind's color palette** and spacing scale consistently
- **Use `@apply` directive sparingly** - only for complex component styles that need extraction
- **Use Tailwind's component patterns** for common UI elements

## JavaScript Best Practices

- **Use const by default**, `let` only when reassignment is needed
- **Use arrow functions** for callbacks and short functions
- **Use destructuring** for objects and arrays when it improves readability
- **Use template literals** for string interpolation
- **Handle errors properly** with try/catch for async operations
- **Use optional chaining** (`?.`) and nullish coalescing (`??`) operators

## Testing (Flexible Framework)

- **Write tests for critical business logic** and complex components
- **Focus on user behavior** rather than implementation details
- **Test user interactions** (clicks, form submissions, navigation)
- **Use data-testid attributes** for reliable element selection in tests
- **Mock external dependencies** (APIs, third-party libraries)

## Documentation Standards

- **Document complex Vue components** with JSDoc comments:
  ```javascript
  /**
   * User profile component with editing capabilities
   * @component
   * @example
   * <UserProfile :user="currentUser" @update="handleUpdate" />
   */
  ```
- **Comment complex reactive logic** and explain why, not what
- **Use TypeScript interfaces** to document expected data structures
- **Keep README.md updated** with setup instructions and component usage examples