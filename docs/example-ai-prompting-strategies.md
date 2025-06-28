# AI Prompting Strategies for Agentic Development

This document provides copy-pasteable prompt templates for working with AI agents using the Agentic Development Framework (ADF). These prompts implement the "Explore, Plan, Code, Commit" cycle outlined in the research document.

## 🚀 Session Initialization Prompt

Use this at the start of every new development session:

```
You are an expert full-stack developer working in an AI-assisted development workflow using the Agentic Development Framework (ADF).

CRITICAL FIRST STEPS:
1. Say "Remembering..." and retrieve any relevant context from your memory
2. Read PROJECT_CONTEXT.md to understand the project's architecture, standards, and constraints
3. Check AGENT_WORKFLOW.md to see if there's any work in progress
4. Review the current state of CHANGELOG.md to understand what's been completed

DEVELOPMENT CONTEXT:
- This is a monorepo with Vue.js frontend (apps/frontend) and FastAPI backend (apps/api)
- Follow all coding standards in PROJECT_CONTEXT.md strictly
- Use the memory server to track decisions and patterns throughout our work
- Always use Context7 MCP server for accurate library documentation (start with 5000 tokens, increase to 20000 if needed)

WORKFLOW RULES:
- Update AGENT_WORKFLOW.md as your primary state management tool
- Never skip the analysis phase - always understand before planning
- Get explicit approval before implementing any plan
- Log all actions in the Action_Log as you work
- Include comprehensive testing (positive, negative, edge cases)

Are you ready to begin? Please confirm you've read the context files and tell me what you understand about the current project state.
```

## 📋 Phase 1: Exploration & Analysis

Use this prompt to start analysis of a new feature:

```
PHASE 1: EXPLORATION & ANALYSIS

New task: "[INSERT YOUR FEATURE DESCRIPTION HERE]"

Please update AGENT_WORKFLOW.md as follows:
1. Set Current_State to: ANALYZING
2. Populate High_Level_Task with the task description above
3. Read these relevant files for context: [LIST SPECIFIC FILES TO EXAMINE]

In the Scratchpad section, provide a comprehensive analysis including:
- How this feature fits into the existing architecture
- Database schema impacts (if any)
- API endpoints that need to be created/modified
- Frontend components and pages affected
- Security considerations
- Performance implications
- Testing strategy overview

IMPORTANT: Do not create a plan yet. Focus only on understanding and analysis.
After your analysis, wait for my feedback before proceeding to planning.
```

## 🎯 Phase 2: Planning & Approval

After reviewing the analysis, use this prompt for planning:

```
PHASE 2: PLANNING

Your analysis looks good. Now proceed to detailed planning:

1. Update Current_State to: PLANNING
2. In The_Plan section, create a detailed step-by-step implementation plan

PLAN REQUIREMENTS:
- Break down into logical, discrete steps (aim for 6-10 steps)
- Specify exact files to be created/modified for each step
- Include database migrations if needed
- Plan the testing approach for each component
- Consider dependencies between steps
- Include both backend and frontend implementation

PLAN TEMPLATE:
- Step 1: [Database] Description - files: schema.py, migration
- Step 2: [Backend] Description - files: models/, routers/, services/
- Step 3: [Backend] Description - files: specific files
- Step 4: [Frontend] Description - files: components/, stores/, views/
- Step 5: [Frontend] Description - files: specific files  
- Step 6: [Testing] Description - files: test files for backend
- Step 7: [Testing] Description - files: test files for frontend
- Step 8: [Integration] End-to-end testing and validation

After creating the plan:
3. Set Current_State to: AWAITING_APPROVAL
4. Present the plan for my review and approval
```

## ⚡ Phase 3: Implementation

Once the plan is approved, use this prompt to begin implementation:

```
PHASE 3: IMPLEMENTATION

The plan is approved. Begin implementation following these rules:

1. Update Current_State to: IMPLEMENTING
2. Execute the plan step by step, in order
3. For EACH step:
   - Log the action in Action_Log BEFORE taking it
   - Implement the step completely
   - If tests exist for the modified code, run them
   - If tests fail: Change state to DEBUGGING, fix in Scratchpad, retry
   - Log completion of the step

IMPLEMENTATION STANDARDS:
- Follow all coding standards from PROJECT_CONTEXT.md
- Include proper error handling and validation
- Add comprehensive docstrings/comments
- Never use placeholder code or TODO comments
- Ensure type safety (TypeScript strict mode, Python type hints)

TESTING REQUIREMENTS:
For each new function/component, create tests covering:
- Positive case: Expected behavior with valid inputs
- Negative case: Error handling with invalid inputs  
- Edge case: Boundary conditions and unusual but valid scenarios

Continue working through all steps. If you encounter any blocking issues, set state to BLOCKED and ask for guidance.
```

## 🧪 Phase 4: Testing & Validation

Use this when implementation is complete:

```
PHASE 4: TESTING & VALIDATION

Implementation phase complete. Now perform comprehensive testing:

1. Update Current_State to: TESTING
2. Run the full test suite for both backend and frontend
3. Verify all three test types pass for new code:
   - Positive tests (happy path)
   - Negative tests (error conditions)
   - Edge case tests (boundary conditions)

TESTING CHECKLIST:
- [ ] All unit tests pass
- [ ] Integration tests pass  
- [ ] New feature works end-to-end
- [ ] No regressions in existing functionality
- [ ] Performance is acceptable
- [ ] Security requirements met

If any tests fail:
- Set Current_State to: DEBUGGING
- Analyze failures in Scratchpad
- Fix issues and re-run tests
- Return to TESTING state

Log all test results in Action_Log with specific details about what was tested and the outcomes.
```

## ✅ Phase 5: Completion

Use this to wrap up a completed feature:

```
PHASE 5: COMPLETION

All testing complete and passing. Time to finalize:

1. Update Current_State to: COMPLETED
2. Perform final quality check using the checklist in AGENT_WORKFLOW.md
3. Generate a comprehensive summary of what was implemented
4. Update CHANGELOG.md with a new entry following the template format:
   - Include date, feature title, detailed description
   - List impact on users/system
   - Note key files changed
   - Describe test coverage added

5. Update your memory with key decisions and patterns from this work
6. Clear AGENT_WORKFLOW.md content to prepare for next task
7. Set Current_State back to: READY

SUMMARY FORMAT:
Provide a concise but complete summary of:
- What was built and why
- Key technical decisions made  
- How it integrates with existing code
- Test coverage provided
- Any follow-up work needed
```

## 🚨 Emergency & Debugging Prompts

### When AI Gets Stuck
```
You seem to be stuck. Please:
1. Set Current_State to: BLOCKED
2. In Scratchpad, clearly document:
   - What you were trying to do
   - What error/issue you encountered
   - What you've already attempted
   - Specific question or guidance you need
3. Stop implementation until I provide guidance
```

### When Tests Are Failing
```
I see tests are failing. Please:
1. Set Current_State to: DEBUGGING  
2. In Scratchpad, analyze:
   - Which specific tests are failing
   - What the error messages indicate
   - Root cause analysis of why tests are failing
   - Proposed fix with reasoning
3. Implement the fix
4. Re-run tests
5. If still failing, repeat analysis
6. Once fixed, return to IMPLEMENTING or TESTING state
```

### For Complex Debugging
```
For complex issues requiring deep analysis:
1. Set Current_State to: DEBUGGING
2. Use Scratchpad for systematic debugging:
   - Reproduce the issue step by step
   - Examine logs and error messages
   - Check related code for potential conflicts
   - Consider multiple solution approaches
   - Document your reasoning process
3. Implement the most promising solution
4. Verify the fix doesn't break anything else
```

## 🔄 Context Refresh Prompts

### Mid-Session Context Refresh
```
We've been working for a while. Please refresh context:
1. Re-read PROJECT_CONTEXT.md to ensure we're still following standards
2. Review current AGENT_WORKFLOW.md state
3. Check Action_Log for recent progress
4. Update your memory with any new patterns or decisions
5. Confirm we're still on track with the original plan

Summarize current status and next steps.
```

### When Returning to Abandoned Work
```
I'm returning to work that was started previously. Please:
1. Say "Remembering..." and check your memory for this project
2. Read AGENT_WORKFLOW.md to understand where we left off
3. Check CHANGELOG.md for completed work
4. Review Action_Log for the last actions taken
5. In Scratchpad, analyze:
   - What was completed
   - What was in progress
   - What still needs to be done
   - Any potential issues from the gap in work

Recommend how to proceed based on the current state.
```

## 🎨 Feature-Specific Prompt Templates

### Database Schema Changes
```
Task: Implement database schema changes for [FEATURE]

Special considerations for database work:
1. Always create Alembic migrations for schema changes
2. Consider backward compatibility
3. Plan for data migration if existing data affected
4. Update SQLModel models with proper relationships
5. Test migrations on sample data
6. Document any breaking changes

Proceed with standard ADF workflow, paying special attention to database impacts.
```

### API Endpoint Development
```
Task: Create new API endpoints for [FEATURE]

API Development Standards:
1. Follow RESTful principles
2. Use proper HTTP status codes
3. Include comprehensive input validation with Pydantic
4. Implement proper error handling and responses
5. Add OpenAPI documentation with examples
6. Include authentication/authorization as needed
7. Test all endpoints with positive, negative, and edge cases

Follow ADF workflow with emphasis on API design consistency.
```

### Frontend Component Development
```
Task: Create frontend components for [FEATURE]

Frontend Development Focus:
1. Use Vue 3 Composition API with <script setup>
2. Implement proper TypeScript typing
3. Follow Tailwind CSS utility-first approach
4. Create reusable composables for business logic
5. Use Pinia for state management if needed
6. Ensure mobile responsiveness
7. Test user interactions and edge cases
8. Follow accessibility best practices

Proceed with ADF workflow, emphasizing component reusability and user experience.
```

### Full-Stack Feature Development
```
Task: Implement complete full-stack feature for [FEATURE]

Full-Stack Coordination:
1. Start with database schema and backend API
2. Ensure API contracts are well-defined before frontend work
3. Use shared TypeScript types from packages/shared-types
4. Test backend thoroughly before connecting frontend
5. Implement frontend with proper error handling for API calls
6. Create end-to-end tests for complete user workflows
7. Verify security throughout the stack

Follow ADF workflow with careful attention to integration points.
```

## 🔧 Advanced Prompting Techniques

### Chain-of-Thought for Complex Problems
```
For this complex feature, use enhanced reasoning:

1. In Scratchpad, work through the problem systematically:
   - Break down the problem into sub-problems
   - Consider multiple solution approaches
   - Evaluate trade-offs for each approach
   - Choose the best approach with clear reasoning
   - Anticipate potential issues and edge cases

2. Only after thorough analysis, proceed with planning
3. Reference your reasoning when implementing
4. Update memory with key architectural decisions
```

### Test-Driven Development Approach
```
Use AI-TDD approach for this feature:

1. ANALYSIS: Understand requirements completely
2. TEST DESIGN: Create comprehensive test cases first
   - Design tests for expected behavior (positive)
   - Design tests for error conditions (negative)  
   - Design tests for edge cases and boundaries
3. IMPLEMENT: Write code to make tests pass
4. REFACTOR: Improve code while keeping tests green
5. INTEGRATE: Ensure new code works with existing system

Start by creating the test suite, then implement to satisfy tests.
```

### Performance-Critical Features
```
This feature has performance requirements. Enhanced workflow:

1. ANALYSIS: Include performance impact assessment
2. PLANNING: Include performance testing strategy
3. IMPLEMENTATION: 
   - Profile code as you build
   - Use efficient algorithms and data structures
   - Monitor database query performance
   - Consider caching strategies
4. TESTING: Include performance benchmarks
5. VALIDATION: Verify performance meets requirements

Document performance decisions in memory for future reference.
```

## 💡 Best Practices for Prompt Effectiveness

### Do's:
- ✅ Always start with context retrieval ("Remembering...")
- ✅ Be specific about which files to examine
- ✅ Use the state management system consistently
- ✅ Request explicit approval before major changes
- ✅ Include comprehensive testing requirements
- ✅ Reference PROJECT_CONTEXT.md standards
- ✅ Use the Action_Log for traceability

### Don'ts:
- ❌ Skip the analysis phase
- ❌ Allow placeholder or TODO code
- ❌ Proceed without explicit approval
- ❌ Forget to update workflow state
- ❌ Skip testing any of the three test types
- ❌ Ignore existing coding standards
- ❌ Let the AI work without structured guidance

### Pro Tips:
- 🎯 Use specific file paths when referencing code
- 🎯 Break complex features into smaller, manageable tasks
- 🎯 Always validate AI understanding before implementation
- 🎯 Use the Scratchpad for complex reasoning
- 🎯 Update memory with important decisions and patterns
- 🎯 Regularly refresh context during long sessions

## 📚 Quick Reference Commands

```bash
# Start new feature
"Begin new feature: [DESCRIPTION]" + Phase 1 prompt

# Continue in-progress work  
"Resume work on current feature" + Context refresh prompt

# Debug failing tests
"Tests are failing" + Debugging prompt  

# Complete feature
"Implementation complete, begin testing" + Phase 4 prompt

# Emergency stop
"Stop current work, need to change direction" + Emergency prompt
```

This comprehensive prompting guide ensures consistent, high-quality AI-assisted development using the Agentic Development Framework!