# Agent Workflow - Dynamic Task Management

## Current_State
READY

## High_Level_Task
*[This section will be populated with the current task description when starting new work]*

Example: "Implement user authentication system with JWT tokens, including login, logout, and protected route middleware"

---

## The_Plan
*[AI-generated implementation plan will appear here after analysis phase]*

**Instructions for AI Agent:**
1. Break down the high-level task into discrete, verifiable steps
2. Specify which files need to be created/modified for each step
3. Include testing requirements for each step
4. Consider dependencies between steps
5. Get explicit approval before proceeding to implementation

**Plan Structure Example:**
- Step 1: [Database] Create User model and auth tables in SQLModel
- Step 2: [Backend] Implement JWT token generation and validation utilities  
- Step 3: [Backend] Create authentication endpoints (login, logout, refresh)
- Step 4: [Backend] Add authentication middleware for protected routes
- Step 5: [Frontend] Create login/logout components and auth store
- Step 6: [Frontend] Implement route guards for protected pages
- Step 7: [Testing] Write comprehensive test suite for auth flow
- Step 8: [Integration] Test complete authentication flow end-to-end

---

## Action_Log
*[Append-only log of all actions taken during implementation]*

**Log Format:**
- `[TIMESTAMP] [ACTION_TYPE] [FILE/COMMAND] - Description`

**Action Types:**
- `CREATED` - New file created
- `MODIFIED` - Existing file changed  
- `DELETED` - File removed
- `COMMAND` - Terminal command executed
- `TEST` - Test command run
- `DEBUG` - Debugging action taken

**Example Entries:**
- `[2025-01-15 10:30] CREATED apps/api/models/user.py - User model with authentication fields`
- `[2025-01-15 10:35] MODIFIED apps/api/database.py - Added User table to database schema`
- `[2025-01-15 10:40] COMMAND uv add python-jose[cryptography] - Added JWT library dependency`
- `[2025-01-15 10:45] TEST pytest tests/test_auth.py -v - Authentication tests passing (3/3)`

---

## Scratchpad
*[AI reasoning space for analysis, debugging, and problem-solving]*

**Purpose:**
- Analyze requirements and constraints before planning
- Debug errors and think through solutions
- Consider alternative approaches
- Document decisions and trade-offs

**Template Sections:**

### Initial Analysis
*[Understanding of the task, context, and requirements]*

### Technical Considerations  
*[Database schema impacts, API design decisions, security implications]*

### Dependencies & Constraints
*[What exists, what needs to be built, what might conflict]*

### Alternative Approaches
*[Different ways to solve the problem, pros/cons]*

### Current Issues/Debugging
*[When debugging, document error analysis and solution attempts]*

---

## Workflow Commands for AI Agent

### Phase 1: Analysis & Planning
```
Update Current_State to: ANALYZING
1. Read PROJECT_CONTEXT.md for architectural guidelines
2. Examine existing codebase structure and relevant files
3. Document analysis in Scratchpad
4. Update Current_State to: PLANNING  
5. Generate detailed step-by-step plan
6. Update Current_State to: AWAITING_APPROVAL
```

### Phase 2: Implementation
```
Update Current_State to: IMPLEMENTING
For each step in the plan:
1. Log the action in Action_Log before taking it
2. Implement the step
3. Run relevant tests if they exist
4. If tests fail: Set Current_State to DEBUGGING
   - Analyze failure in Scratchpad
   - Fix the issue
   - Re-run tests
   - Return to IMPLEMENTING
5. Confirm step completion in Action_Log
```

### Phase 3: Testing & Validation
```
Update Current_State to: TESTING
1. Run comprehensive test suite
2. If failures occur, return to DEBUGGING state
3. Ensure all 3 test types pass (positive, negative, edge case)
4. Log all test results in Action_Log
```

### Phase 4: Completion
```
Update Current_State to: COMPLETED
1. Summarize completed work
2. Update CHANGELOG.md with feature summary
3. Clear this workflow file for next task
4. Update Current_State to: READY
```

---

## Quality Checklist

Before marking any task as COMPLETED, verify:

### Code Quality
- [ ] All code follows project coding standards
- [ ] Type hints included (Python) / TypeScript strict mode (Frontend)
- [ ] Proper error handling implemented
- [ ] No TODO comments or placeholder code left
- [ ] Code is properly documented

### Testing
- [ ] Positive test case implemented and passing
- [ ] Negative test case implemented and passing  
- [ ] Edge case test implemented and passing
- [ ] Integration tests pass (if applicable)
- [ ] No test failures in affected areas

### Security & Performance
- [ ] Input validation implemented
- [ ] Security best practices followed
- [ ] No performance regressions introduced
- [ ] Database queries optimized (if applicable)

### Documentation
- [ ] README.md updated if setup changed
- [ ] API documentation updated (if endpoints changed)  
- [ ] CHANGELOG.md entry added
- [ ] Comments explain complex business logic

---

## Emergency Procedures

### If Agent Gets Stuck
1. Set Current_State to: BLOCKED
2. Document the issue in Scratchpad
3. List what was attempted
4. Request human intervention with specific question

### If Critical Error Occurs
1. Set Current_State to: ERROR
2. Document full error details in Scratchpad
3. Do not continue implementation
4. Wait for human review and guidance

### If Requirements Change Mid-Task
1. Set Current_State to: REPLANNING
2. Document the change in Scratchpad
3. Revise The_Plan section
4. Get approval before continuing