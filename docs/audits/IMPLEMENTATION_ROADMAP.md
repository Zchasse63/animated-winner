# HVAC Lead Generation Platform - Implementation Roadmap

**Audit Date:** January 20, 2026  
**Total Effort:** 261 hours (~6.5 weeks for 1 developer)  
**Sprints:** 4 weeks (2-week sprints)

---

## Executive Summary

This roadmap breaks down the 47 issues identified in the audit into sprint-ready tasks across 4 weeks. Tasks are prioritized by risk and business impact, with CRITICAL security and revenue blockers addressed first.

**Week 1 Focus:** Security, database fixes, monitoring  
**Week 2 Focus:** Testing infrastructure, revenue integration (ping/post)  
**Week 3 Focus:** AI scoring, enrichment pipeline, DevOps  
**Week 4 Focus:** UX improvements, compliance, polish

---

## Week 1: Security & Foundation (67 hours)

### Goals
- Fix critical security vulnerabilities
- Resolve database schema issues
- Establish monitoring infrastructure
- Enable core compliance features

### Tasks

#### Day 1-2: Database & Security Foundations (18 hours)

**CRIT-006: Fix Database Schema Mismatch** (2 hours)
- File: src/pages/api/leads.ts:29-30
- Action: Remove first_name/last_name split, use single `name` field
- Testing: Verify lead submission works with updated code
- Priority: BLOCKING BUG

**CRIT-004: Implement Rate Limiting** (8 hours)
- Files: src/middleware/rateLimiter.ts (new), src/pages/api/leads.ts, calls.ts
- Library: rate-limiter-flexible
- Configuration:
  - /api/leads: 10 requests/minute per IP
  - /api/calls: 100 requests/minute per IP
  - /api/health: 60 requests/minute per IP
- Return 429 with Retry-After header
- Testing: Use k6 or Apache Bench to verify limits

**CRIT-002: Add CSRF Protection** (6 hours)
- Files: src/middleware/csrf.ts (new), src/components/LeadForm.tsx
- Method: SameSite=Strict cookies + double-submit token pattern
- Implementation:
  - Generate CSRF token on page load
  - Include in form as hidden field
  - Validate token server-side before processing
- Testing: Attempt CSRF attack from different origin

**CRIT-010: Enable Webhook Signature Validation** (2 hours)
- File: src/pages/api/calls.ts:9-10
- Action: Implement HMAC SHA-256 validation per Ringba docs
- Environment: Add RINGBA_WEBHOOK_SECRET
- Testing: Send valid and invalid webhooks, verify rejection of invalid

#### Day 3-4: Monitoring & Compliance (20 hours)

**CRIT-005: Set Up Error Monitoring** (6 hours)
- Library: @sentry/astro
- Files: src/lib/monitoring.ts (new), astro.config.mjs
- Configuration:
  - Sentry DSN from environment
  - Source maps upload
  - User context capture (anonymous ID)
  - Breadcrumbs for debugging
- Integration: Error boundaries in React components
- Testing: Throw test error, verify Sentry capture

**CRIT-011: Replace Console Statements with Structured Logging** (4 hours)
- Library: Pino
- Files: src/lib/logger.ts (new), replace 7 console.* calls
- Configuration:
  - JSON output in production
  - Pretty print in development
  - Log levels: debug, info, warn, error
  - Request correlation IDs
- Testing: Generate logs, verify output format

**CRIT-012: Load TrustedForm Script** (3 hours)
- File: src/layouts/BaseLayout.astro
- Action: Add TrustedForm JavaScript snippet with account ID
- Verification: Submit form, check trustedform_cert_url populated
- Testing: Verify certificate in TrustedForm portal

**HIGH-002: Load Ringba Call Tracking Script** (4 hours)
- File: src/layouts/BaseLayout.astro
- Action: Add Ringba script with campaign IDs
- Update: ClickToCallIsland.tsx with Ringba data attributes
- Configuration: Map vertical to campaign ID
- Testing: Click phone number, verify call tracking in Ringba dashboard

**HIGH-009: Add CAPTCHA Protection** (3 hours)
- Library: Cloudflare Turnstile (or hCaptcha)
- Files: src/components/LeadForm.tsx, src/pages/api/leads.ts
- Implementation:
  - Add CAPTCHA widget before submit button
  - Generate token on form submission
  - Verify token server-side
  - Reject score < 0.5
- Testing: Submit with and without CAPTCHA, verify rejection

#### Day 5: DevOps & Deployment (13 hours)

**CRIT-007: Create Deployment Configuration** (3 hours)
- File: vercel.json (new)
- Configuration:
  ```json
  {
    "buildCommand": "npm run build",
    "outputDirectory": "dist",
    "framework": "astro",
    "regions": ["iad1"],
    "functions": {
      "api/**/*.ts": {
        "memory": 1024,
        "maxDuration": 10
      }
    }
  }
  ```
- Testing: Deploy to Vercel staging

**HIGH-011: Set Up CI/CD Pipeline** (8 hours)
- File: .github/workflows/ci.yml (new)
- Jobs:
  1. Install dependencies
  2. Type check (tsc --noEmit)
  3. Lint (ESLint - after configured)
  4. Test (Vitest - after tests written)
  5. Build (astro build)
  6. Deploy (Vercel CLI on main branch)
- Triggers: Pull requests, pushes to main
- Testing: Create PR, verify workflow runs

**MED-010: Validate Environment Variables on Startup** (2 hours)
- File: src/lib/env.ts (new)
- Implementation: Zod schema for all env vars
- Check on server startup, fail fast with helpful message
- Testing: Remove required env var, verify error

#### Day 5: Documentation (4 hours)

**MED-002: Create Root README.md** (3 hours)
- File: README.md (new)
- Sections:
  - Project overview
  - Tech stack
  - Quick start (clone, install, env setup)
  - Database migrations
  - npm scripts
  - Deployment guide
  - Contributing guidelines
- Testing: Follow README from scratch

**MED-003: Create API Documentation** (4 hours)
- File: openapi.yaml (new)
- Document: 3 endpoints (leads, calls, health)
- Include: Request/response schemas, authentication
- Tool: Swagger UI at /api/docs
- Testing: Verify interactive docs work

### Week 1 Deliverables
✅ All CRITICAL security issues resolved  
✅ Database schema fixed  
✅ Error monitoring active  
✅ TCPA and call tracking scripts loaded  
✅ Deployment configuration created  
✅ CI/CD pipeline established  
✅ Root README and API docs complete

---

## Week 2: Testing & Revenue (84 hours)

### Goals
- Establish comprehensive test coverage
- Implement core revenue functionality (Service Direct ping/post)
- Build email notification system

### Tasks

#### Day 1-3: Testing Infrastructure (28 hours)

**CRIT-001: Set Up Testing Framework and Write Tests** (24 hours)

**Phase 1: Framework Setup** (2 hours)
- Install: vitest, @vitest/ui, @testing-library/react
- File: vitest.config.ts (new)
- Configuration: TypeScript support, coverage reporting
- Scripts: Add "test" and "test:ui" to package.json

**Phase 2: Unit Tests** (8 hours)
- File: src/lib/validation.test.ts (new)
- Tests:
  - leadFormSchema validation (valid and invalid inputs)
  - Phone number formatting (formatPhoneNumber)
  - Email validation edge cases
  - ZIP code validation
  - serviceStepSchema, propertyStepSchema, contactStepSchema
- Target: 100% coverage on validation.ts

**Phase 3: API Integration Tests** (10 hours)
- Files: src/pages/api/leads.test.ts, calls.test.ts, health.test.ts (new)
- Tests:
  - POST /api/leads with valid payload (201 response)
  - POST /api/leads with invalid payload (400 response)
  - POST /api/leads updates daily_stats
  - POST /api/calls with Ringba payload (200 response)
  - POST /api/calls with invalid signature (401 response)
  - GET /api/health returns ok when database healthy
  - GET /api/health returns degraded when database down
- Mocking: Supabase client
- Target: 80% coverage on API endpoints

**Phase 4: Component Tests** (4 hours)
- File: src/components/LeadForm.test.tsx (new)
- Tests:
  - Multi-step form progression
  - Form validation errors displayed
  - Successful submission shows confirmation
  - CAPTCHA required before submission
- Target: 70% coverage on LeadForm

**E2E Testing Setup** (4 hours)
- Install: playwright
- File: playwright.config.ts (new)
- Tests: tests/e2e/lead-submission.spec.ts (new)
  - Navigate to landing page
  - Fill out multi-step form
  - Submit successfully
  - Verify confirmation message
- Target: Happy path covered

#### Day 3-5: Core Revenue Implementation (32 hours)

**CRIT-003: Implement Service Direct Ping/Post Integration** (32 hours)

**Phase 1: API Client** (6 hours)
- File: src/lib/service-direct/client.ts (new)
- Functions:
  - createClient(apiKey): Client instance
  - ping(lead): Send lead preview, return bids
  - post(lead, buyerId): Send full lead, return confirmation
- Error handling: Retry logic, timeout handling
- Testing: Mock API responses

**Phase 2: Buyer Routing Logic** (8 hours)
- File: src/lib/service-direct/router.ts (new)
- Functions:
  - matchBuyers(lead): Query buyers table for active buyers matching geo/vertical
  - selectWinner(bids): Choose highest bidder
  - checkDailyCap(buyerId): Verify buyer hasn't hit daily limit
- Database: Update buyers.current_daily_count on sale
- Testing: Unit tests for routing logic

**Phase 3: Ping Flow** (8 hours)
- File: src/lib/service-direct/ping.ts (new)
- Workflow:
  1. Match buyers for lead
  2. Send ping requests to Service Direct
  3. Parse bid responses
  4. Update leads.ping_status, ping_bid_amount, ping_buyer_id
  5. Log to enrichment_logs
- Testing: Integration test with Service Direct sandbox

**Phase 4: Post Flow** (8 hours)
- File: src/lib/service-direct/post.ts (new)
- Workflow:
  1. Select winning bidder
  2. Send full lead data to Service Direct
  3. Receive forwarding phone number
  4. Update leads.post_status, post_phone_number, sold_price, sold_to
  5. Update daily_stats.web_leads_sold, web_leads_revenue
  6. Send confirmation email (if Resend configured)
- Testing: End-to-end test with sandbox

**Phase 5: Integration into leads.ts** (2 hours)
- File: src/pages/api/leads.ts:71-72
- Action: Replace TODO with ping/post calls
- Workflow:
  1. Insert lead
  2. Run light enrichment (address, phone validation)
  3. Call pingBuyers(lead)
  4. If bid received, call postLead(lead, buyer)
  5. Update daily_stats
  6. Return success
- Testing: Submit lead, verify full flow

#### Day 5: Email Notifications (16 hours)

**CRIT-009: Implement Email Notifications** (16 hours)

**Phase 1: Resend Integration** (4 hours)
- Library: resend
- File: src/lib/email/client.ts (new)
- Configuration: API key from environment
- Function: sendEmail(to, subject, html, text)
- Testing: Send test email

**Phase 2: Email Templates** (6 hours)
- Files:
  - src/lib/email/templates/confirmation.tsx (React Email component)
  - src/lib/email/templates/internal-alert.tsx
- Confirmation Email:
  - Subject: "We received your {vertical} request"
  - Body: Name, service, urgency, next steps
  - CTA: Call {post_phone_number} now
- Internal Alert:
  - Subject: "New {score_tier} lead: {name}"
  - Body: Lead details, score, enrichment data
  - CTA: View in admin dashboard
- Testing: Render templates, verify styling

**Phase 3: Integration** (4 hours)
- File: src/pages/api/leads.ts
- Trigger: After successful post (if sold)
- Send: Confirmation to user, alert to team
- Error handling: Log email failures, don't block lead submission
- Testing: Submit lead, verify emails received

**HIGH-007: Add Slack Notifications** (2 hours)
- File: src/lib/slack/notify.ts (new)
- Configuration: Webhook URL from environment
- Function: notifySlack(lead)
- Format: Slack Block Kit message
- Trigger: Premium leads (score_tier = 'premium') or emergency urgency
- Testing: Submit premium lead, verify Slack message

### Week 2 Deliverables
✅ 70%+ test coverage on critical paths  
✅ Service Direct ping/post integration complete  
✅ Email confirmation and alerts working  
✅ Slack notifications for premium leads  
✅ Continuous integration running tests on PRs

---

## Week 3: AI & Enrichment (56 hours)

### Goals
- Implement AI lead scoring (core value proposition)
- Build data enrichment pipeline
- Optimize database performance

### Tasks

#### Day 1-2: AI Lead Scoring (16 hours)

**CRIT-008: Implement Gemini AI Scoring** (14 hours)

**Phase 1: Gemini Client** (4 hours)
- Library: @google/generative-ai
- File: src/lib/gemini/client.ts (new)
- Configuration: API key, model (gemini-1.5-flash)
- Function: generateContent(prompt, data): JSON response
- Testing: Simple scoring prompt

**Phase 2: Scoring Logic** (6 hours)
- File: src/lib/gemini/score.ts (new)
- Prompt: src/lib/gemini/scoring-prompt.txt (new)
- Factors:
  - Urgency (emergency = high score)
  - Property value (higher = higher score)
  - Years since last HVAC permit (older = higher score)
  - Demographics (income, homeownership)
  - Vertical profitability (HVAC > plumbing > roofing)
- Output: JSON with score (0-100), tier (premium/good/standard/nurture), factors
- Testing: Score 10 sample leads, verify consistency

**Phase 3: Integration** (4 hours)
- File: src/pages/api/leads.ts
- Workflow:
  1. Insert lead
  2. Run enrichment pipeline (get property data)
  3. Call scoreLead(lead, enrichmentData)
  4. Update leads.raw_score, score_tier, score_factors
  5. Use score to filter buyers (min_score threshold)
- Testing: Submit lead, verify score calculated

**Phase 4: Buyer Routing Enhancement** (2 hours)
- File: src/lib/service-direct/router.ts
- Filter: Only send to buyers where lead score >= buyer.min_score
- Priority: Premium leads sent first
- Testing: Submit low-score lead, verify no bids if all buyers have high min_score

#### Day 2-4: Data Enrichment Pipeline (28 hours)

**CRIT-006: Implement Data Enrichment** (28 hours)

**Phase 1: Smarty Address Validation** (6 hours)
- File: src/lib/enrichment/smarty.ts (new)
- API: https://us-street.api.smartystreets.com/street-address
- Function: validateAddress(address, city, state, zip): standardized address
- Fields Updated: address_standardized, address_valid
- Caching: Check property_cache first
- Testing: Validate 5 addresses, verify standardization

**Phase 2: Shovels Permit Data** (6 hours)
- File: src/lib/enrichment/shovels.ts (new)
- API: https://api.shovels.ai/permits
- Function: getPermitHistory(address): permit records
- Fields Updated: last_hvac_permit_date, years_since_hvac_permit
- Caching: Store in property_cache.shovels_data
- Testing: Check 3 addresses with known permits

**Phase 3: RentCast Property Data** (6 hours)
- File: src/lib/enrichment/rentcast.ts (new)
- API: https://api.rentcast.io/v1/properties
- Function: getPropertyData(address): property details
- Fields Updated: property_year_built, property_sqft, property_value
- Caching: Store in property_cache.rentcast_data
- Testing: Lookup 3 properties, verify valuations

**Phase 4: Census Demographics** (6 hours)
- File: src/lib/enrichment/census.ts (new)
- API: https://api.census.gov/data
- Function: getDemographics(zip): neighborhood data
- Fields Updated: enrichment_data.demographics (JSONB)
- Data: Median income, homeownership rate, population density
- Testing: Query 3 ZIP codes, verify demographics

**Phase 5: Enrichment Orchestrator** (4 hours)
- File: src/lib/enrichment/index.ts (new)
- Function: enrichLead(lead): enriched data
- Workflow:
  1. Check property_cache for existing data
  2. Run Smarty (required)
  3. Run Shovels, RentCast, Census in parallel
  4. Store results in property_cache
  5. Log to enrichment_logs (duration, cost, status)
  6. Return enriched data
- Error handling: Continue if individual API fails
- Testing: Enrich 3 leads, verify all data sources called

#### Day 4-5: Performance & DevOps (12 hours)

**HIGH-001: Fix N+1 Query in Daily Stats** (3 hours)
- Files: src/pages/api/leads.ts:104-142, calls.ts:69-111
- Action: Replace SELECT + UPDATE/INSERT with supabase.rpc('update_daily_stats', {...})
- Testing: Submit 10 leads, verify single query per lead

**HIGH-009: Add GIN Indexes for JSONB** (4 hours)
- File: supabase/migrations/006_jsonb_indexes.sql (new)
- Indexes:
  - CREATE INDEX idx_leads_enrichment_data ON leads USING GIN (enrichment_data);
  - CREATE INDEX idx_leads_score_factors ON leads USING GIN (score_factors);
  - CREATE INDEX idx_city_seo_faq ON city_seo_content USING GIN (faq_content);
- Testing: Query JSONB fields, verify performance improvement

**HIGH-010: Configure HTTP Caching** (3 hours)
- File: astro.config.mjs
- Configuration:
  - Static assets: max-age=31536000, immutable
  - Dynamic pages: no-cache, ETag
- Testing: Check headers with curl, verify cache hits

**MED-004: Configure Database Connection Pooling** (2 hours)
- File: src/lib/supabase.ts
- Configuration: Supabase pooling settings (max connections)
- Testing: Load test with 100 concurrent requests

### Week 3 Deliverables
✅ AI lead scoring operational  
✅ 4 enrichment APIs integrated  
✅ Database performance optimized  
✅ Property caching working  
✅ HTTP caching configured

---

## Week 4: UX & Polish (54 hours)

### Goals
- Improve accessibility and user experience
- Build admin dashboard
- Complete documentation
- Final testing and launch prep

### Tasks

#### Day 1-2: Accessibility & UX (18 hours)

**HIGH-008: Fix Accessibility Gaps** (12 hours)

**Phase 1: ARIA Labels** (4 hours)
- Files: All form components (ServiceStep, PropertyStep, ContactStep)
- Add:
  - aria-label to all inputs
  - aria-describedby for error messages
  - aria-required for required fields
  - role attributes for custom controls
- Testing: Validate with axe-core

**Phase 2: Keyboard Navigation** (4 hours)
- File: src/components/LeadForm.tsx
- Implement:
  - Focus management on step transitions
  - Keyboard shortcuts (Enter to proceed, Escape to cancel)
  - Focus trap in modals
  - Skip navigation links
- Testing: Navigate form with keyboard only

**Phase 3: Screen Reader Testing** (4 hours)
- Tools: NVDA (Windows), VoiceOver (Mac)
- Tests:
  - Form labels announced correctly
  - Error messages read aloud
  - Multi-step progress announced
  - FAQ accordion state announced (aria-expanded)
- Fixes: Address critical issues found
- Documentation: Create accessibility testing runbook

**MED-017: Add Loading Skeletons** (4 hours)
- Files: src/components/Skeleton.tsx (new), LeadForm.tsx
- Implementation:
  - Replace loading spinners with skeleton screens
  - Animate skeleton with shimmer effect
- Testing: Verify perceived performance improvement

**MED-018: Implement Focus Management** (2 hours)
- File: src/components/LeadForm.tsx
- Action: Focus first input of each step on transition
- Testing: Tab through form, verify focus behavior

#### Day 2-4: Admin Dashboard (32 hours)

**CRIT-010: Build Admin Dashboard** (32 hours)

**Phase 1: Authentication** (6 hours)
- Library: Supabase Auth
- Files: src/pages/admin/login.astro (new), src/middleware/auth.ts (new)
- Implementation:
  - Email/password login
  - Session management
  - Protected routes (redirect to /admin/login if not authenticated)
- Testing: Login, verify session persists

**Phase 2: Lead Listing** (10 hours)
- File: src/pages/admin/leads/index.astro (new)
- Features:
  - Table with leads (name, phone, vertical, status, score, created_at)
  - Pagination (50 per page)
  - Filters: date range, vertical, state, status, score tier
  - Search: by name, phone, email
  - Sort: by created_at, score
  - Export: Download CSV
- Testing: Filter and sort leads, verify pagination

**Phase 3: Lead Detail** (6 hours)
- File: src/pages/admin/leads/[id].astro (new)
- Sections:
  - Contact info
  - Property details
  - Enrichment data (formatted nicely)
  - Scoring breakdown
  - Ping/post history
  - Timeline of events
- Actions:
  - Manual status update
  - Resend to buyers
  - Add notes
- Testing: View lead, update status

**Phase 4: Daily Stats Dashboard** (6 hours)
- File: src/pages/admin/dashboard.astro (new)
- Charts:
  - Leads over time (line chart)
  - Conversion rate by vertical (bar chart)
  - Revenue by state (map)
  - Top buyers (table)
- Filters: Date range, vertical, state
- Library: Chart.js or Recharts
- Testing: View dashboard, verify data accuracy

**Phase 5: Buyer Management** (4 hours)
- File: src/pages/admin/buyers/index.astro (new)
- Features:
  - List buyers
  - Create/edit buyer (form with all fields)
  - Activate/deactivate buyer
  - Set min_score threshold
  - Configure geo/vertical coverage
- Testing: CRUD operations on buyers

#### Day 4-5: Final Testing & Documentation (4 hours)

**MED-005: Add Bundle Size Analysis** (3 hours)
- Library: vite-bundle-visualizer
- File: package.json (add "analyze" script)
- Action: Run analysis, document bundle size
- Optimization: Lazy load heavy components if needed

**MED-006: Run Lighthouse Audit** (4 hours)
- Tool: Lighthouse CLI
- Pages: Home, Tampa HVAC, lead form
- Targets: 90+ performance, 100 accessibility, 100 SEO
- Action: Address issues below 90
- Documentation: Save reports to docs/audits/lighthouse/

**MED-011: Set Up Uptime Monitoring** (2 hours)
- Service: UptimeRobot (free tier)
- Endpoint: /api/health
- Interval: 1 minute
- Alerts: Slack channel on downtime
- Testing: Stop server, verify alert

**MED-012: Verify Database Backups** (3 hours)
- Documentation: docs/ops/BACKUP_RESTORE.md (new)
- Process:
  1. Document Supabase automatic backup schedule
  2. Test point-in-time recovery
  3. Create manual backup script
  4. Document restore procedure
- Testing: Restore from backup, verify data integrity

#### Day 5: Launch Prep (4 hours)

**Final Checklist:**
- [ ] All CRITICAL issues resolved (verify with ISSUES_REGISTRY.md)
- [ ] All MUST HAVE items checked (verify with PRODUCTION_CHECKLIST.md)
- [ ] Test coverage ≥70% on critical paths
- [ ] Lighthouse scores ≥90 (performance, accessibility, SEO)
- [ ] Security scan completed (OWASP ZAP or Snyk)
- [ ] Load testing passed (k6: 100 concurrent users)
- [ ] Deployment to staging successful
- [ ] QA testing completed (happy path + edge cases)
- [ ] Environment variables configured in production
- [ ] Monitoring and alerting active
- [ ] Runbooks documented (deployment, rollback, incident response)

**Deploy to Production:**
1. Merge main branch to production
2. Verify CI/CD pipeline runs
3. Monitor error rates for 2 hours
4. Test lead submission on production
5. Verify webhook receiving calls
6. Check email delivery
7. Monitor Sentry for errors

### Week 4 Deliverables
✅ Accessibility compliance (WCAG 2.1 AA)  
✅ Admin dashboard operational  
✅ Performance optimized (Lighthouse 90+)  
✅ Load testing passed  
✅ Production deployment successful  
✅ Monitoring and alerting active

---

## Sprint Planning Summary

### Sprint 1 (Week 1-2): Foundation & Revenue
**Duration:** 2 weeks  
**Effort:** 151 hours  
**Focus:** Security, testing, ping/post integration  
**Goal:** Production-ready core functionality

**Key Milestones:**
- Week 1 End: Security hardened, monitoring live
- Week 2 End: Testing framework complete, revenue integration working

### Sprint 2 (Week 3-4): Intelligence & Scale
**Duration:** 2 weeks  
**Effort:** 110 hours  
**Focus:** AI scoring, enrichment, admin dashboard  
**Goal:** Full-featured platform with AI intelligence

**Key Milestones:**
- Week 3 End: AI scoring operational, enrichment pipeline complete
- Week 4 End: Admin dashboard live, production launch

---

## Resource Planning

### 1 Developer (Solo)
- **Timeline:** 6.5 weeks (261 hours ÷ 40 hours/week)
- **Sprint 1:** 4 weeks
- **Sprint 2:** 2.5 weeks
- **Recommendation:** Focus on CRITICAL and HIGH issues first, defer MEDIUM/LOW to post-launch

### 2 Developers (Pair)
- **Timeline:** 3.5 weeks (261 hours ÷ 2 developers ÷ 40 hours/week)
- **Sprint 1:** 2 weeks
- **Sprint 2:** 1.5 weeks
- **Division:** Dev 1 (backend/API), Dev 2 (frontend/UX)

### 3+ Developers (Team)
- **Timeline:** 2.5 weeks (261 hours ÷ 3 developers ÷ 40 hours/week)
- **Sprint 1:** 1.5 weeks
- **Sprint 2:** 1 week
- **Division:**
  - Dev 1: Security, DevOps, monitoring
  - Dev 2: Revenue integration, enrichment, AI
  - Dev 3: Testing, UX, admin dashboard

---

## Risk Mitigation

### Technical Risks

**Risk:** External API failures (Gemini, Service Direct, enrichment)
- **Mitigation:** Graceful degradation, retry logic, fallback to basic scoring
- **Testing:** Simulate API failures, verify system continues

**Risk:** Database performance degradation at scale
- **Mitigation:** Indexes, connection pooling, partitioning strategy
- **Testing:** Load test with 10,000 leads, monitor query times

**Risk:** TCPA compliance gaps
- **Mitigation:** TrustedForm integration, consent checkbox required, audit trail
- **Testing:** Legal review of consent flow

### Timeline Risks

**Risk:** Service Direct integration complexity
- **Buffer:** Allocated 32 hours, may need 40+
- **Mitigation:** Start early, use sandbox for testing, read API docs thoroughly

**Risk:** AI scoring prompt engineering
- **Buffer:** Allocated 14 hours, may need 20+ for prompt tuning
- **Mitigation:** Prepare sample leads dataset, A/B test prompts

**Risk:** Testing infrastructure setup
- **Buffer:** Allocated 24 hours, may need 30+ for mocking strategy
- **Mitigation:** Use simple mocks initially, add complexity later

---

## Success Metrics

### Week 1 Targets
- ✅ Zero CRITICAL security vulnerabilities
- ✅ CI/CD pipeline passing
- ✅ Error monitoring capturing exceptions
- ✅ Deployment configuration complete

### Week 2 Targets
- ✅ 70%+ test coverage on API endpoints
- ✅ Lead submission → ping → post → email flow working
- ✅ 100% of leads processed successfully (no failures)

### Week 3 Targets
- ✅ AI scoring accuracy >80% (manual validation of 50 leads)
- ✅ Enrichment pipeline <5 seconds per lead
- ✅ Database query times <50ms (95th percentile)

### Week 4 Targets
- ✅ Lighthouse performance score ≥90
- ✅ Accessibility score 100
- ✅ Load test: 100 concurrent users, <200ms avg response time
- ✅ Production deployment successful

### Post-Launch (30 days)
- ✅ 95%+ uptime
- ✅ <1% error rate
- ✅ 100+ leads submitted
- ✅ 70%+ lead sell-through rate (to buyers)
- ✅ Zero TCPA complaints

---

## Post-Launch Roadmap (Months 2-3)

### Month 2: Optimization
- Multi-region expansion (Georgia, Alabama)
- A/B testing framework
- Advanced analytics (Mixpanel)
- Performance optimization (CDN, caching)

### Month 3: Scale
- Multi-tenancy (SaaS model)
- Advanced AI (GPT-4 scoring)
- Real-time bidding engine
- Mobile app (React Native)

---

**Roadmap Version:** 1.0  
**Last Updated:** January 20, 2026  
**Next Review:** End of Week 2 (adjust timeline based on progress)  
**Owner:** Engineering Team
