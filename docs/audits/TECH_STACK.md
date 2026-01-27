# HVAC Lead Generation Platform - Complete Technology Stack

**Audit Date:** January 20, 2026  
**Project:** hvac-leadgen-platform v1.0.0

---

## Executive Summary

This document catalogs all technologies, dependencies, external services, and infrastructure components used in the HVAC lead generation platform. The stack is built on modern JavaScript/TypeScript with Astro SSR, React islands, Supabase PostgreSQL, and integration points for 11 external services (7 not yet implemented).

**Core Stack:** Astro 5.16.6 + React 19.2.3 + TypeScript 5.9.3 + Supabase 2.89.0 + Tailwind CSS 3.4.19

---

## Table of Contents
1. [Frontend Technologies](#frontend-technologies)
2. [Backend Technologies](#backend-technologies)
3. [Database & Data Layer](#database--data-layer)
4. [External Services & APIs](#external-services--apis)
5. [Development Tools](#development-tools)
6. [Infrastructure & Deployment](#infrastructure--deployment)
7. [Complete Dependency List](#complete-dependency-list)

---

## Frontend Technologies

### Core Framework
| Technology | Version | Purpose | Status |
|------------|---------|---------|--------|
| **Astro** | 5.16.6 | SSR framework, file-based routing | ✅ Configured |
| **React** | 19.2.3 | Interactive UI components (islands) | ✅ Configured |
| **React DOM** | 19.2.3 | DOM rendering for React | ✅ Configured |
| **TypeScript** | 5.9.3 | Type safety across codebase | ✅ Configured |

**Architecture Pattern:** Astro Islands (partial hydration)
- Static Astro components render to HTML
- React islands hydrate only interactive elements
- Reduces JavaScript bundle, improves performance

### UI & Styling
| Technology | Version | Purpose | Status |
|------------|---------|---------|--------|
| **Tailwind CSS** | 3.4.19 | Utility-first CSS framework | ✅ Configured |
| **@astrojs/tailwind** | 6.0.2 | Astro-Tailwind integration | ✅ Configured |
| Inter Font | - | Google Fonts typography | ✅ Loaded |

**Design System:**
- Colors: Navy (#0f172a), Teal (#0891b2), Orange (#f97316), Green (#22c55e)
- Typography: Inter font family, 16px-48px scale
- Breakpoints: sm (640px), md (768px), lg (1024px), xl (1280px)

### Form Management
| Technology | Version | Purpose | Status |
|------------|---------|---------|--------|
| **React Hook Form** | 7.69.0 | Form state, validation, submission | ✅ Configured |
| **@hookform/resolvers** | 5.2.2 | Zod schema resolver integration | ✅ Configured |
| **Zod** | 3.25.76 | Schema validation, TypeScript types | ✅ Configured |

**Form Architecture:**
- Multi-step wizard (4 steps: Service, Property, Contact, Confirmation)
- Zod schemas: serviceStepSchema, propertyStepSchema, contactStepSchema
- Phone number formatting helper (formatPhoneNumber)
- Real-time validation on blur

### Component Inventory
**Astro Components (11):**
- Hero.astro - Above-the-fold section
- Header.astro - Navigation (logo, phone number)
- Footer.astro - Site footer with links
- FAQ.astro - Accordion with Q&A
- TrustBadges.astro - Trust signals (BBB, licensing)
- ServiceAreas.astro - Geographic coverage map
- LocalSchema.astro - JSON-LD structured data
- HowItWorks.astro - 3-step process
- WhyChooseUs.astro - Value propositions
- ClickToCall.astro - Static phone CTA
- FinalCTA.astro - Bottom-of-page conversion

**React Components (6):**
- LeadForm.tsx - Multi-step form container
- ClickToCallIsland.tsx - Interactive phone button
- FormSteps/ServiceStep.tsx - Service type selection
- FormSteps/PropertyStep.tsx - Address and property info
- FormSteps/ContactStep.tsx - Contact details and TCPA consent
- FormSteps/ConfirmationStep.tsx - Success message

---

## Backend Technologies

### Runtime & Server
| Technology | Version | Purpose | Status |
|------------|---------|---------|--------|
| **Node.js** | ≥18.14.1 | Server-side JavaScript runtime | ✅ Required |
| **@astrojs/node** | 9.5.1 | Node adapter for Astro (standalone mode) | ✅ Configured |
| **@astrojs/react** | 4.4.2 | React integration for Astro | ✅ Configured |

**Server Configuration:**
```javascript
// astro.config.mjs
export default defineConfig({
  output: 'server',          // SSR mode
  adapter: node({
    mode: 'standalone',      // Self-contained server
  }),
});
```

### API Endpoints (3)
1. **POST /api/leads**
   - Purpose: Lead form submission
   - File: src/pages/api/leads.ts
   - Validation: Zod leadFormSchema
   - Operations: Insert lead, update daily_stats
   - Status: ✅ Implemented (TODO: ping/post at line 71)

2. **POST /api/calls**
   - Purpose: Ringba webhook receiver
   - File: src/pages/api/calls.ts
   - Operations: Parse webhook, insert call record, update daily_stats
   - Status: ⚠️ Implemented but signature validation disabled (line 9-10)

3. **GET /api/health**
   - Purpose: Health check for monitoring
   - File: src/pages/api/health.ts
   - Checks: Supabase connection
   - Status: ✅ Implemented

### Validation Layer
- **Library:** Zod 3.25.76
- **Schemas:** src/lib/validation.ts
- **Phone Validation:** (XXX) XXX-XXXX format
- **Email Validation:** RFC 5322 compliant
- **ZIP Validation:** 5-digit US ZIP codes
- **Address Validation:** Minimum 5 characters

---

## Database & Data Layer

### Primary Database
**Service:** Supabase (PostgreSQL)
- **SDK Version:** @supabase/supabase-js 2.89.0
- **Connection:** REST API + PostgREST
- **Authentication:** Service role key + anon key
- **Features Used:** Database, RLS, auto-generated types

### Schema Overview

**Core Tables (8):**

1. **leads** (74 fields)
   - Contact: name, email, phone, address, city, state, zip
   - Service: vertical, service_type, urgency, property_type
   - Attribution: source_page, utm_*, referrer
   - Compliance: trustedform_cert_url, tcpa_consent_timestamp, ip_address
   - Ping/Post: ping_status, ping_bid_amount, post_phone_number
   - Enrichment: address_valid, phone_valid, enrichment_data (JSONB)
   - Scoring: raw_score (0-100), score_tier, score_factors (JSONB)
   - Status: status, sold_to, sold_price, sold_at

2. **calls** (50 fields)
   - Ringba: ringba_call_id, call_uuid, campaign
   - Caller: caller_phone, caller_city, caller_state, caller_zip
   - Metrics: duration_seconds, connection_seconds, ring_duration_seconds
   - Revenue: converted, revenue, payout
   - Routing: buyer_name, buyer_number
   - Attribution: vertical, city, state, source, landing_page
   - IVR: ivr_selection
   - Raw: raw_payload (JSONB)

3. **daily_stats** (25 fields, 5 generated)
   - Dimensions: date, state, vertical, source
   - Web Metrics: web_leads_total, web_leads_sold, web_leads_revenue
   - Call Metrics: calls_total, calls_converted, calls_revenue
   - Generated: total_leads, total_sold, total_revenue, web_conversion_rate, call_conversion_rate
   - UNIQUE constraint: (date, state, vertical, source)

4. **pages** (32 fields)
   - URL: slug, state, city, vertical, service
   - SEO: title, meta_description, h1, intro_paragraph
   - Content: faq_content (JSONB), service_areas (JSONB)
   - Ringba: ringba_campaign_id, fallback_phone
   - Status: is_active

5. **buyers** (80 fields)
   - Info: name, type (service_direct, elocal, direct)
   - API: api_endpoint, api_key
   - Coverage: active_states[], active_verticals[], active_zips[]
   - Limits: min_score, max_daily_leads, current_daily_count
   - Contact: contact_email, payment_terms

6. **property_cache** (107 fields)
   - Key: address_hash (MD5 of standardized address)
   - Data: smarty_data, shovels_data, rentcast_data, census_data (all JSONB)
   - TTL: cached_at, expires_at (30-day default)

7. **enrichment_logs** (139 fields)
   - Reference: lead_id, call_id (foreign keys)
   - Step: step (smarty/shovels/rentcast/census/gemini), status
   - Data: request_data, response_data, error_message (all JSONB)
   - Metrics: duration_ms, cost_cents

8. **city_seo_tables** (Multiple tables, 82 Florida cities)
   - Pattern: city_{state}_{city_slug} (e.g., city_fl_tampa)
   - Fields: SEO content for each city/vertical/service combination
   - Status: 82 cities seeded (Jacksonville through St. Augustine)

### Indexes (34+)
- `idx_leads_created_at` - Chronological queries (DESC)
- `idx_leads_state` - Geographic filtering
- `idx_leads_vertical` - Service type filtering
- `idx_leads_status` - Status workflows
- `idx_leads_zip` - ZIP code lookups
- `idx_leads_ping_status` - Ping/post tracking
- `idx_calls_*` - Similar indexes on calls table
- `idx_daily_stats_date` - Time-series queries
- `idx_pages_slug` - URL routing (UNIQUE)
- `idx_property_cache_hash` - Cache lookups (UNIQUE)

### RLS Policies (13)
**leads table:**
- "Allow anonymous inserts" - anon role INSERT
- "Allow service role full access" - service_role ALL

**calls table:**
- "Allow service role full access" - service_role ALL

**daily_stats table:**
- "Allow service role full access" - service_role ALL

**pages table:**
- "Allow public read access" - anon role SELECT WHERE is_active = true
- "Allow service role full access" - service_role ALL

**buyers, property_cache, enrichment_logs:**
- "Allow service role full access" - service_role ALL

### Functions & Triggers
**update_daily_stats()** (PostgreSQL function)
```sql
-- Location: supabase/migrations/003_daily_stats.sql:57-90
-- Purpose: Upsert daily statistics (avoids N+1 queries)
-- Parameters: p_date, p_state, p_vertical, p_source, p_web_leads, p_web_sold, p_web_revenue, p_calls, p_calls_converted, p_calls_revenue
-- Logic: INSERT ... ON CONFLICT DO UPDATE (increments counters)
```

**Note:** API code (leads.ts:104-142, calls.ts:69-111) does NOT use this function (HIGH-001 issue)

### Migrations
**Core Migrations (5):**
- `001_initial_schema.sql` - Leads table definition
- `002_calls_table.sql` - Call tracking
- `003_daily_stats.sql` - Reporting aggregates + update_daily_stats()
- `004_supporting_tables.sql` - Pages, buyers, property_cache, enrichment_logs
- `005_city_seo_tables.sql` - City content tables

**Seed Files (96):**
- Location: supabase/seed/
- Total Lines: 31,666
- Cities Covered: 82 Florida cities (Jacksonville 001 through St. Augustine 082)
- Content: SEO-optimized content for city/vertical/service combinations

### Type Generation
- **File:** src/lib/database.types.ts
- **Method:** Supabase CLI auto-generation
- **Command:** `supabase gen types typescript --project-id <id> > src/lib/database.types.ts`
- **Types Generated:** Database, Tables, Enums, Functions
- **Status:** ✅ Present (comprehensive types for all tables)

---

## External Services & APIs

### 1. Ringba (Call Tracking)
**Purpose:** Dynamic phone number insertion, call tracking, IVR, buyer routing
- **Integration Status:** ⚠️ Partial
- **Webhook Implemented:** ✅ src/pages/api/calls.ts
- **Script Loaded:** ❌ Not in BaseLayout.astro
- **Signature Validation:** ❌ Disabled (calls.ts:9-10)
- **Environment Variables:**
  - `RINGBA_HVAC_CAMPAIGN_ID`
  - `RINGBA_PLUMBING_CAMPAIGN_ID`
  - `RINGBA_ROOFING_CAMPAIGN_ID`
- **Authentication:** Campaign IDs (no API key required for webhooks)
- **Cost:** Usage-based (per call)

### 2. Service Direct (Lead Monetization)
**Purpose:** Ping/post lead distribution to buyers
- **Integration Status:** 🔴 NOT IMPLEMENTED
- **Priority:** CRITICAL (blocks revenue)
- **API Endpoint:** https://api.servicedirect.com/v1/
- **Authentication:** API key
- **Workflow:**
  1. Ping: Send lead preview, receive bids
  2. Select: Choose highest bidder
  3. Post: Send full lead data, receive forwarding number
- **Environment Variables:**
  - `SERVICE_DIRECT_API_KEY`
- **Database Fields:** ping_status, ping_bid_amount, post_status (in leads table)
- **Cost:** Revenue share (typically 20-30% of lead price)

### 3. Smarty (Address Validation)
**Purpose:** Address standardization, validation, USPS verification
- **Integration Status:** ❌ NOT IMPLEMENTED
- **API Endpoint:** https://us-street.api.smartystreets.com/street-address
- **Authentication:** auth-id + auth-token
- **Response:** Standardized address, geocode, deliverability score
- **Environment Variables:**
  - `SMARTY_AUTH_ID`
  - `SMARTY_AUTH_TOKEN`
- **Database Fields:** address_standardized, address_valid (in leads table)
- **Cost:** $0.50 per 1,000 lookups

### 4. Shovels (Permit Data)
**Purpose:** HVAC permit history, last system replacement date
- **Integration Status:** ❌ NOT IMPLEMENTED
- **API Endpoint:** https://api.shovels.ai/permits
- **Authentication:** API key
- **Response:** Permit records with dates, contractor, system type
- **Environment Variables:**
  - `SHOVELS_API_KEY`
- **Database Fields:** last_hvac_permit_date, years_since_hvac_permit (in leads table)
- **Cost:** Custom pricing (contact sales)

### 5. RentCast (Property Data)
**Purpose:** Property valuations, square footage, ownership details
- **Integration Status:** ❌ NOT IMPLEMENTED
- **API Endpoint:** https://api.rentcast.io/v1/properties
- **Authentication:** API key
- **Response:** Property value, sqft, year built, owner details
- **Environment Variables:**
  - `RENTCAST_API_KEY`
- **Database Fields:** property_year_built, property_sqft, property_value (in leads table)
- **Cost:** $39/month (500 requests)

### 6. Census API (Demographics)
**Purpose:** Neighborhood demographics, income, homeownership rate
- **Integration Status:** ❌ NOT IMPLEMENTED
- **API Endpoint:** https://api.census.gov/data
- **Authentication:** API key (free)
- **Response:** Median income, population density, homeownership rate
- **Environment Variables:**
  - `CENSUS_API_KEY`
- **Database Fields:** enrichment_data.demographics (JSONB in leads table)
- **Cost:** Free

### 7. Google Gemini (AI Lead Scoring)
**Purpose:** AI-powered lead quality scoring (0-100)
- **Integration Status:** 🔴 NOT IMPLEMENTED
- **Priority:** CRITICAL (core value proposition)
- **SDK:** @google/generative-ai (not installed)
- **Model:** gemini-1.5-pro or gemini-1.5-flash
- **Prompt:** Score lead based on urgency, property value, geo, vertical, enrichment data
- **Environment Variables:**
  - `GEMINI_API_KEY`
- **Database Fields:** raw_score (INTEGER), score_tier (TEXT), score_factors (JSONB)
- **Cost:** $0.00025 per 1K tokens (gemini-1.5-flash)

### 8. TrustedForm (TCPA Compliance)
**Purpose:** TCPA consent certificate generation, legal compliance
- **Integration Status:** ⚠️ Partial
- **Script Loaded:** ❌ Not in BaseLayout.astro
- **Certificate Capture:** ⚠️ Database field exists (trustedform_cert_url)
- **Environment Variables:**
  - `TRUSTEDFORM_ACCOUNT_ID`
- **Authentication:** Account ID embedded in JavaScript snippet
- **Cost:** $0.05 per certificate

### 9. Resend (Email Notifications)
**Purpose:** Transactional emails (confirmations, alerts)
- **Integration Status:** ❌ NOT IMPLEMENTED
- **SDK:** resend (not installed)
- **API Endpoint:** https://api.resend.com
- **Authentication:** API key
- **Email Types:**
  - User confirmation (lead submitted)
  - Internal alert (new premium lead)
- **Environment Variables:**
  - `RESEND_API_KEY`
- **Cost:** $20/month (50,000 emails)

### 10. Slack (Internal Notifications)
**Purpose:** Real-time alerts for new premium leads
- **Integration Status:** ❌ NOT IMPLEMENTED
- **Method:** Incoming webhooks
- **API Endpoint:** webhook URL
- **Authentication:** Webhook secret in URL
- **Environment Variables:**
  - `SLACK_WEBHOOK_URL`
- **Cost:** Free (included in Slack plan)

### 11. Twilio (SMS Notifications) - OPTIONAL
**Purpose:** SMS confirmations, lead alerts
- **Integration Status:** ❌ NOT PLANNED
- **API Endpoint:** https://api.twilio.com
- **Authentication:** Account SID + Auth Token
- **Cost:** $0.0079 per SMS (US)

---

## Development Tools

### Package Manager
- **Tool:** npm (Node Package Manager)
- **Lock File:** package-lock.json (ensures deterministic installs)
- **Registry:** npmjs.com

### npm Scripts
```json
{
  "dev": "astro dev",                                // Start dev server (http://localhost:4321)
  "start": "astro dev",                              // Alias for dev
  "build": "astro build",                            // Production build (outputs to dist/)
  "preview": "astro preview",                        // Preview production build locally
  "seed:florida": "npx tsx scripts/seed-florida.ts", // Seed Florida cities
  "seed:pages": "npx tsx scripts/seed-pages.ts",     // Generate pages table entries
  "generate:sitemap": "npx tsx scripts/generate-sitemap.ts", // Generate sitemap.xml
  "test:sd": "npx tsx scripts/test-service-direct.ts",       // Test Service Direct API
  "test:ringba": "npx tsx scripts/test-ringba-webhook.ts"    // Test Ringba webhook
}
```

### TypeScript Configuration
**File:** tsconfig.json
- **Target:** ES2020
- **Module:** ESNext
- **JSX:** react-jsx
- **Strict Mode:** Enabled
- **Paths:** `src/*` aliases configured
- **Includes:** src/
- **Lib:** ES2020, DOM

### Missing Development Tools
**Code Quality:**
- ❌ ESLint - JavaScript/TypeScript linting
- ❌ Prettier - Code formatting
- ❌ Husky - Git hooks
- ❌ lint-staged - Pre-commit linting

**Testing:**
- ❌ Vitest - Unit/integration testing
- ❌ @vitest/ui - Test UI
- ❌ @testing-library/react - React component testing
- ❌ Playwright - E2E browser testing

**Build Analysis:**
- ❌ vite-bundle-visualizer - Bundle size analysis
- ❌ lighthouse-ci - Performance budgets

---

## Infrastructure & Deployment

### Deployment Configuration
**Status:** ❌ NOT CONFIGURED
- **Target:** Unknown (likely Vercel based on Node adapter)
- **Configuration Files:**
  - ❌ vercel.json - Missing
  - ❌ Dockerfile - Missing
  - ❌ .github/workflows/ - Empty

**Recommended Deployment:**
Platform: Vercel
- Native Astro support
- Node.js runtime
- Edge functions
- Automatic HTTPS
- Environment variable management

### CI/CD Pipeline
**Status:** ❌ NOT CONFIGURED
- **Platform:** GitHub Actions (recommended)
- **Workflow:** None
- **Jobs Needed:**
  - Lint (ESLint, Prettier)
  - Type Check (TypeScript)
  - Test (Vitest, Playwright)
  - Build (astro build)
  - Deploy (Vercel CLI)

### Monitoring & Observability

**Error Tracking:**
- **Status:** ❌ NOT CONFIGURED
- **Recommended:** Sentry (@sentry/astro)
- **Features:** Error aggregation, stack traces, user context

**Application Performance Monitoring (APM):**
- **Status:** ❌ NOT CONFIGURED
- **Options:** Datadog, New Relic, AppSignal

**Logging:**
- **Current:** console.log, console.error (7 occurrences)
- **Recommended:** Pino or Winston (structured logging)

**Uptime Monitoring:**
- **Status:** ❌ NOT CONFIGURED
- **Recommended:** UptimeRobot, Pingdom
- **Endpoint:** /api/health

**Analytics:**
- **Status:** ❌ NOT CONFIGURED
- **Web Analytics:** Google Analytics 4 (recommended)
- **Conversion Tracking:** Facebook Pixel

### Security Infrastructure

**Rate Limiting:**
- **Status:** ❌ NOT CONFIGURED
- **Recommended:** rate-limiter-flexible (with Redis backing)
- **Limits:** 10 req/min for /api/leads, 100 req/min for /api/calls

**CSRF Protection:**
- **Status:** ❌ NOT CONFIGURED
- **Method:** SameSite cookies or CSRF tokens

**CAPTCHA:**
- **Status:** ❌ NOT CONFIGURED
- **Recommended:** Cloudflare Turnstile or hCaptcha

**Security Headers:**
- **Status:** ❌ NOT CONFIGURED
- **Headers Needed:**
  - Content-Security-Policy
  - X-Frame-Options: DENY
  - X-Content-Type-Options: nosniff
  - Strict-Transport-Security
  - Referrer-Policy

**Secrets Management:**
- **Current:** .env.local (plaintext)
- **Recommended:** AWS Secrets Manager or Vault

### Caching Strategy

**HTTP Caching:**
- **Status:** ❌ NOT CONFIGURED
- **Recommended:**
  - Static assets: Cache-Control: public, max-age=31536000, immutable
  - Dynamic pages: Cache-Control: no-cache, ETag

**Database Caching:**
- **Property Cache:** ✅ Table exists (property_cache)
- **Status:** ❌ Not used (enrichment pipeline not implemented)

**CDN:**
- **Status:** ❌ NOT CONFIGURED
- **Options:** Vercel Edge Network, Cloudflare

---

## Complete Dependency List

### Production Dependencies (14)
```json
{
  "@astrojs/node": "^9.5.1",           // Node adapter for Astro SSR
  "@astrojs/react": "^4.4.2",          // React integration for islands
  "@astrojs/tailwind": "^6.0.2",       // Tailwind CSS integration
  "@hookform/resolvers": "^5.2.2",     // Form validation resolvers
  "@supabase/supabase-js": "^2.89.0",  // Supabase client SDK
  "@types/react": "^19.2.7",           // React TypeScript types
  "@types/react-dom": "^19.2.3",       // React DOM TypeScript types
  "astro": "^5.16.6",                  // Core Astro framework
  "react": "^19.2.3",                  // React UI library
  "react-dom": "^19.2.3",              // React DOM rendering
  "react-hook-form": "^7.69.0",        // Form state management
  "tailwindcss": "^3.4.19",            // CSS framework
  "typescript": "^5.9.3",              // TypeScript compiler
  "zod": "^3.25.76"                    // Schema validation
}
```

### Development Dependencies (1)
```json
{
  "tsx": "^4.21.0"                     // TypeScript execution for scripts
}
```

### Missing Dependencies (Should Install)
```bash
# Testing
npm install -D vitest @vitest/ui @testing-library/react playwright

# Code Quality
npm install -D eslint prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-prettier husky lint-staged

# Build Tools
npm install -D vite-bundle-visualizer

# External Services
npm install @google/generative-ai resend @sentry/astro

# Security & Performance
npm install rate-limiter-flexible
```

---

## Environment Variables Reference

### Required for Core Operations
```env
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here
PUBLIC_SITE_URL=https://yourdomain.com
PUBLIC_COMPANY_NAME=HomeService Leads
PUBLIC_DEFAULT_PHONE=8135551234
```

### Required for Revenue (NOT IMPLEMENTED)
```env
SERVICE_DIRECT_API_KEY=your-sd-api-key
```

### Required for AI Scoring (NOT IMPLEMENTED)
```env
GEMINI_API_KEY=your-gemini-api-key
```

### Required for Compliance
```env
TRUSTEDFORM_ACCOUNT_ID=your-trustedform-id
```

### Required for Call Tracking
```env
RINGBA_HVAC_CAMPAIGN_ID=CAxxxxxxxxxxxxxx
RINGBA_PLUMBING_CAMPAIGN_ID=CAxxxxxxxxxxxxxx
RINGBA_ROOFING_CAMPAIGN_ID=CAxxxxxxxxxxxxxx
```

### Optional Enrichment APIs
```env
SMARTY_AUTH_ID=your-auth-id
SMARTY_AUTH_TOKEN=your-auth-token
RENTCAST_API_KEY=your-rentcast-key
SHOVELS_API_KEY=your-shovels-key
CENSUS_API_KEY=your-census-key
```

### Optional Notifications
```env
RESEND_API_KEY=your-resend-key
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxx
```

---

## Technology Selection Rationale

### Why Astro?
1. **SEO Performance:** SSR + static HTML for fast first contentful paint
2. **Partial Hydration:** Islands architecture reduces JavaScript bundle
3. **React Compatibility:** Leverage existing React ecosystem
4. **Developer Experience:** File-based routing, TypeScript support

### Why Supabase?
1. **Rapid Development:** Instant PostgreSQL with REST API
2. **Security:** Built-in RLS policies for row-level access control
3. **Type Safety:** Auto-generate TypeScript types from schema
4. **Cost:** Free tier supports MVP, scales to production
5. **Future-Proof:** Can migrate to self-hosted PostgreSQL if needed

### Why Tailwind CSS?
1. **Velocity:** Utility classes accelerate development
2. **Consistency:** Design tokens enforce brand standards
3. **Performance:** PurgeCSS removes unused styles (small bundles)
4. **Responsive:** Mobile-first breakpoints built-in

### Why React Hook Form + Zod?
1. **Performance:** Uncontrolled components minimize re-renders
2. **Type Safety:** Zod schemas generate TypeScript types
3. **Validation:** Runtime validation with user-friendly errors
4. **Developer Experience:** Simple API, excellent documentation

---

## Known Limitations

1. **Single Tenant:** Platform designed for one business (not SaaS)
2. **No Authentication:** Public lead capture only (admin dashboard needs auth)
3. **No Real-Time:** No WebSocket features (could add Supabase Realtime)
4. **No Offline:** Requires internet connection (no PWA/service worker)
5. **No Mobile App:** Web-only (responsive design sufficient)
6. **US-Only:** Southeast US geographic focus
7. **English-Only:** No internationalization (i18n) support

---

## Future Technology Roadmap

### Q1 2026 (Next 3 Months)
- ✅ Testing framework (Vitest, Playwright)
- ✅ CI/CD pipeline (GitHub Actions)
- ✅ Error monitoring (Sentry)
- ✅ AI scoring (Gemini integration)
- ✅ Lead monetization (Service Direct)

### Q2 2026 (3-6 Months)
- Advanced analytics (Mixpanel or Amplitude)
- A/B testing (LaunchDarkly or Optimizely)
- CDN optimization (Cloudflare)
- Admin dashboard enhancements

### H2 2026 (6-12 Months)
- Multi-region expansion (GA, AL, SC, NC)
- CMS integration (Contentful or Sanity)
- GraphQL API (if admin complexity grows)
- Mobile app (React Native or Flutter)

---

**Document Version:** 1.0  
**Last Updated:** January 20, 2026  
**Next Review:** April 20, 2026 (quarterly)  
**Maintained By:** Engineering Team
