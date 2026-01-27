# Production Readiness Checklist

**Last Updated:** 2026-01-20
**Total Items:** 39

---

## Must Have (Blocks Production) - 13 Items

These items are **absolute requirements** for production deployment. Launching without these would result in broken functionality, security vulnerabilities, or inability to monetize leads.

### Security & Compliance
- [ ] **Enable webhook signature validation** (src/pages/api/calls.ts:9-10)
  - Implement HMAC signature verification per Ringba documentation
  - Prevent forged webhook requests
  - Test with valid and invalid signatures
  - **Effort:** 2 hours

- [ ] **Add rate limiting to all API endpoints** (src/pages/api/leads.ts, calls.ts)
  - Implement rate limiting middleware (Redis or in-memory)
  - Configure limits: 10 requests/minute per IP for /api/leads, 100 requests/minute for /api/calls
  - Return 429 Too Many Requests with Retry-After header
  - **Effort:** 4 hours

- [ ] **Add CAPTCHA to prevent spam** (src/components/LeadForm.tsx)
  - Integrate Cloudflare Turnstile or hCaptcha
  - Validate CAPTCHA token on server-side
  - Handle CAPTCHA errors gracefully
  - **Effort:** 3 hours

- [ ] **Load TrustedForm script for TCPA compliance** (src/layouts/BaseLayout.astro)
  - Add TrustedForm JavaScript snippet to BaseLayout.astro
  - Verify certificate URL capture on form submission
  - Test certificate validation in TrustedForm portal
  - **Effort:** 2 hours

### Core Features
- [ ] **Implement Service Direct ping/post integration** (src/lib/service-direct/)
  - Build API client (client.ts)
  - Implement ping logic (ping.ts)
  - Implement post logic (post.ts)
  - Build buyer routing system (router.ts)
  - Update leads table and daily_stats with revenue tracking
  - Test with Service Direct sandbox
  - **Effort:** 32 hours

- [ ] **Implement AI lead scoring (Gemini)** (src/lib/scoring/)
  - Build Gemini API client (gemini.ts)
  - Develop scoring prompt (scoring criteria based on enrichment data)
  - Implement score calculation logic (calculate.ts)
  - Update leads.raw_score, leads.score_tier, leads.score_factors
  - Test with sample leads across quality spectrum
  - **Effort:** 14 hours

- [ ] **Build data enrichment pipeline** (src/lib/enrichment/)
  - Smarty address validation (smarty.ts)
  - Shovels permit data (shovels.ts)
  - RentCast property data (rentcast.ts)
  - Census demographics (census.ts)
  - Property cache integration (use property_cache table)
  - Enrichment orchestrator (index.ts)
  - Test complete pipeline with real addresses
  - **Effort:** 28 hours

### Testing & Monitoring
- [ ] **Write comprehensive test suite** (tests/)
  - Set up Vitest (vitest.config.ts)
  - Write API endpoint tests (leads.ts, calls.ts, health.ts)
  - Write Zod schema validation tests (validation.ts)
  - Write component tests (LeadForm, form steps)
  - Achieve minimum 70% code coverage on critical paths
  - **Effort:** 24 hours

- [ ] **Add monitoring and alerting** (Sentry/Datadog)
  - Integrate Sentry for error tracking
  - Configure source maps for stack traces
  - Set up error alerts to Slack
  - Add performance monitoring
  - Test error capture and alerting
  - **Effort:** 4 hours

### User Experience
- [ ] **Implement email notifications** (src/lib/email/)
  - Build Resend email client (client.ts)
  - Create email templates (confirmation, internal alerts)
  - Send confirmation email to users on lead submission
  - Send internal alert to team on new leads
  - Test email delivery and formatting
  - **Effort:** 12 hours

- [ ] **Load Ringba script for call tracking** (src/layouts/BaseLayout.astro)
  - Add Ringba JavaScript snippet to BaseLayout.astro
  - Configure campaign IDs per city/vertical
  - Update ClickToCallIsland.tsx with Ringba tracking
  - Test call tracking in Ringba dashboard
  - **Effort:** 4 hours

### Infrastructure
- [ ] **Configure deployment target** (Vercel/AWS/self-hosted)
  - Choose deployment platform (recommend Vercel for Astro SSR)
  - Create deployment configuration (vercel.json or Dockerfile)
  - Configure environment variables in deployment platform
  - Test deployment to staging environment
  - Document deployment process
  - **Effort:** 6 hours

- [ ] **Build admin dashboard for lead management** (src/pages/admin/)
  - Implement admin authentication (Supabase Auth)
  - Create lead listing page with filters (table with pagination)
  - Create lead detail page (view full lead data)
  - Build daily stats dashboard (charts and metrics)
  - Build buyer management UI (CRUD for buyers table)
  - Test all admin functionality
  - **Effort:** 32 hours

---

## Should Have (Before Launch) - 13 Items

These items are **highly recommended** before production launch. While not absolute blockers, skipping these increases risk and reduces quality.

### Security
- [ ] **Configure CORS policy** (astro.config.mjs)
  - Add CORS middleware with allowed origins
  - Configure for production domain and localhost (dev)
  - Test cross-origin requests
  - **Effort:** 2 hours

### Observability
- [ ] **Add analytics tracking** (GA4, Facebook Pixel)
  - Integrate Google Analytics 4 (BaseLayout.astro)
  - Add Facebook Pixel for conversion tracking
  - Configure conversion events (lead submission, call click)
  - Set up server-side Google Tag Manager
  - Test event tracking in GA4 and Facebook Events Manager
  - **Effort:** 6 hours

- [ ] **Add structured logging** (Winston/Pino)
  - Integrate Pino or Winston for structured logging
  - Replace all console.log/console.error with logger
  - Configure log levels (debug, info, warn, error)
  - Add request ID correlation
  - Test log output and searching
  - **Effort:** 4 hours

- [ ] **Implement error tracking** (Sentry)
  - Already in Must Have section (duplicate - remove from Should Have)
  - **Effort:** 0 hours (covered above)

### Performance
- [ ] **Optimize JSONB queries with GIN indexes** (supabase/migrations/)
  - Create migration with GIN indexes on leads.enrichment_data, leads.score_factors
  - Add GIN index on city_seo_content.faq_content
  - Test query performance before/after
  - **Effort:** 4 hours

- [ ] **Configure HTTP caching headers** (astro.config.mjs)
  - Set Cache-Control headers for static assets (1 year)
  - Set Cache-Control for dynamic pages (no-cache with ETag)
  - Configure Astro build caching
  - Test with Lighthouse
  - **Effort:** 3 hours

### DevOps
- [ ] **Set up CI/CD pipeline** (GitHub Actions)
  - Create GitHub Actions workflow (.github/workflows/ci.yml)
  - Add steps: install → lint → test → build → deploy
  - Configure deployment to staging on PR, production on merge to main
  - Add status checks required for merge
  - Test full pipeline
  - **Effort:** 8 hours

- [ ] **Implement secrets management** (Vault/Secrets Manager)
  - Integrate AWS Secrets Manager or Vault
  - Migrate secrets from .env.local to secrets manager
  - Add environment variable validation on startup
  - Document secret rotation process
  - **Effort:** 4 hours

- [ ] **Remove console statements from production builds** (various files)
  - Replace console.error with structured logger
  - Configure build to strip console statements in production
  - Test production build for console pollution
  - **Effort:** 2 hours

### Code Quality
- [ ] **Implement error boundaries** (src/components/)
  - Create ErrorBoundary component
  - Wrap React islands with error boundaries
  - Add fallback UI for error states
  - Test error scenarios
  - **Effort:** 3 hours

- [ ] **Fix accessibility gaps** (ARIA labels, keyboard nav)
  - Add aria-label to all form inputs
  - Implement focus management in multi-step form
  - Add aria-expanded to FAQ accordion
  - Test keyboard navigation
  - Run axe-core accessibility audit
  - **Effort:** 6 hours

### Documentation
- [ ] **Write README.md** (root directory)
  - Document project overview and architecture
  - Add setup instructions (clone, install, env vars, migrate)
  - Document npm scripts and development workflow
  - Add deployment instructions
  - Document environment variables
  - **Effort:** 3 hours

- [ ] **Create API documentation** (OpenAPI)
  - Generate OpenAPI 3.0 specification (openapi.yaml)
  - Document all 3 endpoints (leads, calls, health)
  - Add request/response schemas
  - Add Swagger UI for interactive docs
  - **Effort:** 4 hours

- [ ] **Configure database connection pooling** (src/lib/supabase.ts)
  - Configure Supabase connection pooling settings
  - Set max connections based on Supabase plan
  - Test under load
  - **Effort:** 3 hours

---

## Nice to Have (Post-Launch) - 13 Items

These items improve quality and developer experience but can be deferred until after initial production launch.

### Performance Optimization
- [ ] **Run Lighthouse audit** (target 90+)
  - Run Lighthouse on all page types (landing pages, form pages)
  - Document performance, accessibility, SEO, best practices scores
  - Create improvement plan for scores below 90
  - Re-run after optimizations
  - **Effort:** 4 hours

- [ ] **Analyze and optimize bundle size**
  - Add vite-bundle-visualizer to package.json
  - Run bundle analysis
  - Identify largest dependencies
  - Optimize or lazy-load heavy components
  - Document bundle size targets
  - **Effort:** 3 hours

- [ ] **Implement database partitioning for leads/calls tables**
  - Design partitioning strategy (monthly partitions recommended)
  - Create migration for table partitioning
  - Test queries across partitions
  - Document partition maintenance process
  - **Effort:** 6 hours

- [ ] **Add cascade deletes to all foreign keys**
  - Audit all foreign keys
  - Add ON DELETE CASCADE where appropriate
  - Test deletion scenarios
  - Document cascading relationships
  - **Effort:** 3 hours

- [ ] **Configure HTTP caching headers**
  - Already in Should Have section (duplicate - remove from Nice to Have)
  - **Effort:** 0 hours (covered above)

- [ ] **Set up CDN** (Cloudflare/Vercel)
  - Configure Cloudflare or Vercel Edge CDN
  - Set up caching rules for static assets
  - Configure edge caching for dynamic content
  - Test global distribution and cache hit rates
  - **Effort:** 4 hours

### Code Quality
- [ ] **Add loading skeletons for better UX**
  - Create skeleton components (LeadFormSkeleton, StatsCardSkeleton)
  - Replace loading spinners with skeletons
  - Test perceived performance improvement
  - **Effort:** 4 hours

- [ ] **Implement focus management in forms**
  - Already in Should Have section (duplicate - remove from Nice to Have)
  - **Effort:** 0 hours (covered above)

- [ ] **Conduct screen reader testing**
  - Test with NVDA (Windows) and VoiceOver (Mac)
  - Document screen reader experience issues
  - Fix critical screen reader bugs
  - Create accessibility testing runbook
  - **Effort:** 4 hours

### Infrastructure
- [ ] **Validate environment variables on startup**
  - Create Zod schema for environment variables
  - Add startup validation check
  - Fail fast with helpful error messages if env vars missing
  - Document required vs. optional env vars
  - **Effort:** 2 hours

- [ ] **Set up uptime monitoring**
  - Configure UptimeRobot or Pingdom
  - Monitor /api/health endpoint (1-minute intervals)
  - Set up Slack alerts for downtime
  - Test alerting
  - **Effort:** 2 hours

- [ ] **Verify database backup process**
  - Document Supabase automatic backup schedule
  - Test point-in-time recovery
  - Create disaster recovery runbook
  - Schedule quarterly restore tests
  - **Effort:** 3 hours

- [ ] **Create infrastructure as code** (Terraform/CDK)
  - Choose IaC tool (Terraform or AWS CDK)
  - Write IaC for database, hosting, monitoring, CDN
  - Test infrastructure provisioning from scratch
  - Document IaC deployment process
  - **Effort:** 12 hours

---

## Checklist Status Summary

| Priority | Total Items | Estimated Effort |
|----------|-------------|------------------|
| Must Have | 13 | 165 hours |
| Should Have | 13 | 49 hours |
| Nice to Have | 13 | 47 hours |
| **Total** | **39** | **261 hours** |

**Note:** Effort estimates assume a single experienced developer. Actual time may vary based on team size, experience, and unforeseen complexity.

---

## Pre-Launch Gate Criteria

Before deploying to production, verify that **ALL Must Have items are checked**. Launching without these items will result in:
- ❌ Broken lead monetization (no revenue)
- ❌ Security vulnerabilities (spam, forged webhooks)
- ❌ Compliance issues (TCPA)
- ❌ Inability to diagnose production issues (no monitoring)
- ❌ Poor user experience (no confirmation emails)

**Recommended Launch Process:**
1. ✅ Complete ALL Must Have items (165 hours)
2. ✅ Complete Should Have items (49 hours) - **HIGHLY RECOMMENDED**
3. 🚀 Deploy to staging environment
4. ✅ Run full QA testing suite
5. ✅ Conduct load testing (Apache Bench, k6)
6. ✅ Security scan (OWASP ZAP, Snyk)
7. 🚀 Deploy to production
8. ✅ Monitor for 48 hours
9. ✅ Complete Nice to Have items post-launch (47 hours)

---

## Next Steps

1. **Review this checklist with team** - Discuss priorities and timelines
2. **Estimate team velocity** - Adjust timeline based on team size
3. **Create sprint plan** - See IMPLEMENTATION_ROADMAP.md for wave breakdown
4. **Assign ownership** - Assign each item to a team member
5. **Track progress** - Use this checklist to track completion (update checkboxes)

**Estimated Time to Production-Ready:**
- **Must Have only:** ~4 weeks (1 developer) or ~2 weeks (2 developers)
- **Must Have + Should Have:** ~5.5 weeks (1 developer) or ~3 weeks (2 developers)
- **All items:** ~6.5 weeks (1 developer) or ~3.5 weeks (2 developers)

---

**Last Updated:** 2026-01-20
**Document Version:** 1.0
**Owner:** Engineering Team
