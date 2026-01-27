# Zeroshot Audit Prompt

This prompt is optimized for zeroshot's multi-agent architecture.

---

## THE PROMPT

```
Perform a comprehensive autonomous audit of this entire codebase.
Do NOT modify any code - this is a RESEARCH/AUDIT task only.

CONTEXT:
- This is an HVAC leads project
- Explore the ENTIRE codebase systematically - leave no directory unexamined
- Be brutally honest about the state of things - this audit is about reality, not optimism
- When you encounter unknowns, flag them for research rather than guessing

## PHASE 0: AUTONOMOUS DISCOVERY

### 0.1 Project Identity
Discover and document:
- Project name (from package.json or folder)
- Repository type (monorepo/single-app/multi-service)
- Primary language
- Package manager (npm/yarn/pnpm/bun)
- Node version requirements

### 0.2 Complete Tech Stack Discovery

**Frontend:** Framework, meta-framework, styling, UI library, state management, forms, routing
**Backend:** Runtime, framework, API style, validation
**Database:** Type, provider, ORM, migrations
**AI/ML:** SDK, providers, tool calling, embeddings, vector DB
**Auth:** Provider, methods
**External Services:** Payment, email, storage, analytics, monitoring
**Infrastructure:** Hosting, CI/CD, containerization

### 0.3 Directory Structure
Map ALL directories with brief annotations explaining purpose.

### 0.4 Document Inventory
Find ALL markdown, txt, planning docs. Categorize as:
- Current (accurate)
- Outdated (needs updates)
- Stale (no longer relevant)

### 0.5 Environment Configuration
Document ALL env variables with: name, usage location, required/optional, documented status.

## PHASE 1: COMPREHENSIVE AUDIT

### 1.1 Database & Data Layer
- Document each table/model with fields, relationships, indexes
- Check: foreign keys, indexes, defaults, timestamps, RLS policies
- If Supabase: RLS, storage policies, edge functions, webhooks

### 1.2 API & Routing
- Document EVERY endpoint: path, method, auth, validation, rate limiting, test status
- Check: input validation, error handling, consistent responses, CORS

### 1.3 AI Tooling & SDK (CRITICAL)
- Find ALL AI integrations
- Document: providers, SDK versions, API key env vars
- For each tool: name, parameters, validation, error handling, test status
- Check: rate limiting, cost tracking, streaming, prompt injection protection

### 1.4 Security Audit
- Document complete auth flow
- Check: password hashing, rate limiting, CSRF, cookies, authorization
- Check: data encryption, input sanitization, SQL injection, XSS prevention
- Check: security headers, dependency vulnerabilities, secrets management

### 1.5 UI/UX Completeness
- Inventory all components
- For each feature area: components exist, styled, responsive, accessible, loading/error states

### 1.6 Code Quality
- Check: separation of concerns, naming conventions, circular dependencies
- Inventory ALL TODO/FIXME/HACK comments with location

### 1.7 Testing Coverage
- Find all test files and configurations
- Document coverage by area: unit, integration, e2e, percentage
- List critical paths WITHOUT test coverage

### 1.8 Performance
- Check: image optimization, code splitting, lazy loading, N+1 queries, caching, bundle size

### 1.9 Deployment & DevOps
- Document current deployment setup
- List what's missing for production

## PHASE 2: SYNTHESIS

### 2.1 Health Scores (X/10)
Rate each: Database, API, AI Tooling, Security, UI/UX, Code Quality, Testing, Performance, DevOps

### 2.2 Issues Registry
Compile ALL issues into prioritized categories:
- CRITICAL (blocks production)
- HIGH (fix before production)
- MEDIUM (fix soon after)
- LOW (nice to have)

Include: area, issue description, file:line location, effort estimate

### 2.3 Production Readiness Checklist
Must Have / Should Have / Nice to Have items

### 2.4 Implementation Roadmap
- Wave 1: Critical Fixes (Week 1)
- Wave 2: High Priority (Week 2-3)
- Wave 3: Production Prep (Week 4)
- Wave 4: Post-Launch (Week 5+)

## OUTPUT FILES (CREATE ALL OF THESE)

1. **docs/audits/AUDIT_SUMMARY.md** - Executive summary, health scores, tech stack overview
2. **docs/audits/ISSUES_REGISTRY.md** - Complete prioritized issues with file:line references
3. **docs/audits/PRODUCTION_CHECKLIST.md** - Checklist for production readiness
4. **docs/audits/TECH_STACK.md** - Complete technology inventory
5. **docs/audits/IMPLEMENTATION_ROADMAP.md** - Sprint-ready task breakdown by wave

IMPORTANT:
- Include specific file:line references for ALL issues found
- Do NOT guess - flag unknowns for research
- Be thorough - scan every directory
- Create actionable outputs ready for sprint planning
```

---

## Expected Classification

This prompt should be classified as **STANDARD:INQUIRY** which uses:
- Planner (Sonnet/Opus)
- 3 Validators (requirements, code, tester)

## Expected Duration & Cost

- Duration: 15-30 minutes
- Cost: $6-15 (based on similar audit examples)

## Monitoring Commands

```bash
# Watch progress
zeroshot logs <cluster-id> -f

# Check status
zeroshot status <cluster-id>

# TUI dashboard
zeroshot watch
```
