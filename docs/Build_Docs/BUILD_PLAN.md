# HVAC Lead Generation Platform - Build Plan

## Overview

**Goal:** Autonomous HVAC/Plumbing/Roofing lead generation platform for the Southeast US
**Target Revenue:** $10,000 - $40,000/month
**Launch Market:** Florida (expanding to full Southeast)
**Tech Stack:** Astro 4.x + React + Tailwind + Supabase + Vercel

---

## Phase 1: Project Foundation

| Status | Task | Description |
|:------:|------|-------------|
| ✅ | 1.1 | Initialize Astro project with React, Tailwind, TypeScript |
| ✅ | 1.2 | Configure Tailwind with design system (colors, typography, spacing) |
| ✅ | 1.3 | Set up Supabase project and configure local dev environment |
| ✅ | 1.4 | Create base layouts (`BaseLayout.astro`, `LandingPage.astro`) |
| ✅ | 1.5 | Set up environment variables structure (`.env.example`) |

### Design System Reference
```
Colors:
├── Navy (Primary):     #0f172a
├── Teal (Secondary):   #0891b2
├── Orange (CTA):       #f97316
├── Green (Success):    #22c55e
├── Slate (Text):       #334155
├── Gray (Light BG):    #f8fafc
└── White:              #ffffff

Typography:
├── Font: Inter
├── H1: 48px/700
├── H2: 32px/700
├── Body: 18px/400
└── Small: 14px/400
```

---

## Phase 2: Database & Backend

| Status | Task | Description |
|:------:|------|-------------|
| ✅ | 2.1 | Create and run `001_initial_schema.sql` (leads table) |
| ✅ | 2.2 | Create and run `002_calls_table.sql` (Ringba calls) |
| ✅ | 2.3 | Create and run `003_daily_stats.sql` (unified reporting) |
| ✅ | 2.4 | Create and run `004_supporting_tables.sql` (pages, buyers, cache) |
| ✅ | 2.5 | Set up TypeScript types (`database.types.ts`) |
| ✅ | 2.6 | Create Supabase client library (`lib/supabase.ts`) |

### Tables Created
- `leads` - Web form submissions with ping/post tracking
- `calls` - Ringba call tracking data
- `daily_stats` - Unified reporting (web + calls)
- `pages` - CMS-like page generation
- `buyers` - Lead buyer configuration
- `property_cache` - Avoid redundant API calls
- `enrichment_logs` - Debugging/optimization

---

## Phase 3: Static Components

| Status | Task | Description |
|:------:|------|-------------|
| ✅ | 3.1 | Build `Header.astro` (sticky, logo, phone, CTA button) |
| ⬜ | 3.2 | Build `Hero.astro` (navy bg, rating badge, H1, trust badges, CTA) |
| ⬜ | 3.3 | Build `TrustBadges.astro` (4 badge variants for different contexts) |
| ⬜ | 3.4 | Build `FAQ.astro` (accordion with JSON-LD schema generation) |
| ✅ | 3.5 | Build `Footer.astro` (navy bg, contact, TCPA disclosure) |
| ⬜ | 3.6 | Build `ServiceAreas.astro` (city grid display) |
| ⬜ | 3.7 | Build `LocalSchema.astro` (JSON-LD structured data) |
| ⬜ | 3.8 | Build `HowItWorks.astro` (3-step process section) |
| ⬜ | 3.9 | Build `WhyChooseUs.astro` (benefits section) |

---

## Phase 4: Lead Form (React Island)

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 4.1 | Set up React Hook Form + Zod validation schemas (`lib/validation.ts`) |
| ⬜ | 4.2 | Build `FormSteps/ServiceStep.tsx` (service type + urgency cards) |
| ⬜ | 4.3 | Build `FormSteps/PropertyStep.tsx` (property type, address fields) |
| ⬜ | 4.4 | Build `FormSteps/ContactStep.tsx` (name, email, phone, TCPA) |
| ⬜ | 4.5 | Build `FormSteps/ConfirmationStep.tsx` (success animation, summary) |
| ⬜ | 4.6 | Build `LeadForm.tsx` (orchestrates steps, progress bar, transitions) |
| ⬜ | 4.7 | Build `TCPAConsent.astro` (disclosure component) |
| ⬜ | 4.8 | Build `TrustedFormScript.astro` (certificate capture) |

### Form Flow
```
Step 1: Service Selection
├── Service Type (4 cards: AC Repair, Heating, Install, Maintenance)
└── Urgency (3 options: Emergency, Soon, Planning)

Step 2: Property Information
├── Property Type (3 cards: Single Family, Townhouse, Commercial)
├── Street Address
├── City (pre-filled)
├── State (dropdown)
└── ZIP Code (validated)

Step 3: Contact Information
├── Full Name
├── Email (validated)
├── Phone (formatted mask)
├── Best Time to Call
└── TCPA Consent (required checkbox)

Step 4: Confirmation
├── Success checkmark animation
├── "Thank You, [Name]!"
├── Summary of request
└── Phone number for urgent help
```

---

## Phase 5: Call Tracking Integration

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 5.1 | Build `ClickToCall.astro` (static with `ringba_phone_number` class) |
| ⬜ | 5.2 | Build `ClickToCallIsland.tsx` (dynamic behavior for React) |
| ⬜ | 5.3 | Add Ringba script to `BaseLayout.astro` with tag injection |
| ⬜ | 5.4 | Create `lib/ringba/config.ts` (campaign IDs per vertical) |
| ⬜ | 5.5 | Create `lib/ringba/tags.ts` (tag helper functions) |
| ⬜ | 5.6 | Create `config/ringba-campaigns.ts` (campaign mappings) |

### Ringba Tags to Capture
- `vertical` (hvac, plumbing, roofing)
- `state` (FL, GA, etc.)
- `city` (tampa, miami, etc.)
- `landing_page` (current URL path)
- `source` (UTM source)
- `keyword` (if from paid search)

---

## Phase 6: Dynamic Page Routing

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 6.1 | Create `config/verticals.ts` (HVAC, Plumbing, Roofing definitions) |
| ⬜ | 6.2 | Create `config/services.ts` (services per vertical) |
| ⬜ | 6.3 | Create `lib/geo/states.ts` (Southeast state data) |
| ⬜ | 6.4 | Create `lib/geo/cities.ts` (city data with area codes) |
| ⬜ | 6.5 | Create `lib/geo/area-codes.ts` (area code to region mapping) |
| ⬜ | 6.6 | Build `pages/[state]/index.astro` (state hub page) |
| ⬜ | 6.7 | Build `pages/[state]/[city]/index.astro` (city hub page) |
| ⬜ | 6.8 | Build `pages/[state]/[city]/[vertical]/index.astro` (vertical hub) |
| ⬜ | 6.9 | Build `pages/[state]/[city]/[vertical]/[service].astro` (landing page) |

### URL Structure
```
/{state}/{city}/{vertical}/
/{state}/{city}/{vertical}/{service}/

Examples:
/florida/tampa/hvac/
/florida/tampa/hvac/ac-repair/
/georgia/atlanta/plumbing/
/georgia/atlanta/plumbing/drain-cleaning/
```

---

## Phase 7: API & Edge Functions

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 7.1 | Create `lib/service-direct/client.ts` (API client) |
| ⬜ | 7.2 | Create `lib/service-direct/types.ts` (TypeScript types) |
| ⬜ | 7.3 | Create `lib/service-direct/categories.ts` (service mappings) |
| ⬜ | 7.4 | Create `pages/api/leads.ts` (POST endpoint for form submissions) |
| ⬜ | 7.5 | Create `supabase/functions/process-lead/index.ts` (main ping/post) |
| ⬜ | 7.6 | Create `supabase/functions/service-direct-ping/index.ts` |
| ⬜ | 7.7 | Create `supabase/functions/service-direct-post/index.ts` |
| ⬜ | 7.8 | Create `pages/api/ringba-webhook.ts` (webhook receiver) |
| ⬜ | 7.9 | Create `supabase/functions/ringba-webhook/index.ts` |
| ⬜ | 7.10 | Create `supabase/functions/notify/index.ts` (Slack alerts) |

### Lead Flow (Ping/Post Model)
```
1. Form Submission → Capture all fields + TrustedForm cert
2. Light Validation (~$0.02) → Smarty address, phone check
3. Ping Service Direct → Send ZIP + service category (no PII)
4. If bid received → Light enrichment (Shovels permits)
5. Accept Bid → POST to Service Direct, get forwarding number
6. Full Enrichment (~$0.15) → RentCast, Census (only on sold leads)
7. Notify → SMS to homeowner, Slack notification
```

---

## Phase 8: Enrichment Pipeline (Post-MVP)

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 8.1 | Create `lib/enrichment/smarty.ts` (address validation) |
| ⬜ | 8.2 | Create `lib/enrichment/shovels.ts` (permit data) |
| ⬜ | 8.3 | Create `lib/enrichment/rentcast.ts` (property data) |
| ⬜ | 8.4 | Create `lib/enrichment/census.ts` (demographics) |
| ⬜ | 8.5 | Create `supabase/functions/enrich-lead/index.ts` |
| ⬜ | 8.6 | Create `supabase/functions/score-lead/index.ts` (Gemini AI scoring) |

### Enrichment Cost Model
- Unsold lead: ~$0.02 (validation only)
- Sold lead: ~$0.22 (validation + light + full enrichment)

---

## Phase 9: Content Seeding & Deployment

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 9.1 | Create `scripts/seed-florida.ts` (10 major FL metros) |
| ⬜ | 9.2 | Create `scripts/seed-pages.ts` (generate page records) |
| ⬜ | 9.3 | Create `scripts/generate-sitemap.ts` (dynamic sitemap) |
| ⬜ | 9.4 | Configure `vercel.json` (routes, headers, redirects) |
| ⬜ | 9.5 | Set up `.github/workflows/deploy.yml` (CI/CD) |
| ⬜ | 9.6 | Deploy to Vercel |
| ⬜ | 9.7 | Configure custom domain + SSL |
| ⬜ | 9.8 | Run end-to-end tests with test traffic |
| ⬜ | 9.9 | First paid traffic test ($200 budget) |

### Florida Launch Cities (Phase 1)
1. Miami (305, 786)
2. Tampa (813)
3. Orlando (407)
4. Jacksonville (904)
5. Fort Lauderdale (954)
6. West Palm Beach (561)
7. St. Petersburg (727)
8. Clearwater (727)
9. Sarasota (941)
10. Naples (239)

### Pages Generated (Florida Launch)
- 10 cities × 3 verticals × 4 services = **120 landing pages**

---

## Phase 10: Southeast Expansion (Post-Launch)

| Status | Task | Description |
|:------:|------|-------------|
| ⬜ | 10.1 | Add Georgia markets (Atlanta, Savannah, Augusta) |
| ⬜ | 10.2 | Add Alabama markets (Birmingham, Mobile, Huntsville) |
| ⬜ | 10.3 | Add South Carolina markets (Charleston, Columbia, Greenville) |
| ⬜ | 10.4 | Add North Carolina markets (Charlotte, Raleigh, Greensboro) |
| ⬜ | 10.5 | Add Tennessee markets (Nashville, Memphis, Knoxville) |
| ⬜ | 10.6 | Scale to 500+ landing pages |
| ⬜ | 10.7 | Add additional Ringba numbers per market |
| ⬜ | 10.8 | Optimize IVR based on conversion data |

### Expansion Timeline
| Phase | States | Markets |
|-------|--------|---------|
| Phase 1 | FL | 10 cities |
| Phase 2 | GA, AL, SC | 9 cities |
| Phase 3 | NC, TN, MS, LA | 12 cities |

---

## Environment Variables Required

```bash
# Supabase
PUBLIC_SUPABASE_URL=
PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Ringba
RINGBA_HVAC_CAMPAIGN_ID=
RINGBA_PLUMBING_CAMPAIGN_ID=
RINGBA_ROOFING_CAMPAIGN_ID=

# Service Direct
SERVICE_DIRECT_API_KEY=

# Enrichment APIs
SMARTY_AUTH_ID=
SMARTY_AUTH_TOKEN=
RENTCAST_API_KEY=
SHOVELS_API_KEY=
CENSUS_API_KEY=

# Communication
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_PHONE_NUMBER=
RESEND_API_KEY=

# AI
GEMINI_API_KEY=

# Compliance
TRUSTEDFORM_ACCOUNT_ID=

# Notifications
SLACK_WEBHOOK_URL=

# Site
PUBLIC_SITE_URL=
PUBLIC_COMPANY_NAME=
```

---

## Monthly Cost Estimate (Phase 1: Florida)

| Service | Monthly Cost |
|---------|--------------|
| Vercel Pro | $20 |
| Supabase Pro | $25 |
| Ringba Professional | $99 |
| Ringba Numbers (7 FL) | $14 |
| Ringba Minutes (2,500) | $125 |
| Light Enrichment | $50 |
| Full Enrichment | $225 |
| Gemini Flash | $15 |
| Twilio SMS | $20 |
| TrustedForm | $50 |
| Domain | $2 |
| **TOTAL** | **~$658/mo** |

---

## Revenue Projections (Phase 1: Florida)

| Channel | Volume | Conversion | Avg Price | Revenue |
|---------|--------|------------|-----------|---------|
| Calls | 500 | 40% (200) | $75 | $15,000 |
| Web Leads | 2,000 | 60% (1,200) | $40 | $48,000 |
| **TOTAL** | | | | **$63,000/mo** |

---

## Status Legend

- ⬜ Not Started
- 🔄 In Progress
- ✅ Completed
- ⏸️ Blocked/Waiting

---

## Notes

_Add notes, blockers, and decisions here as we build:_

-

---

## Changelog

| Date | Update |
|------|--------|
| 2024-12-23 | Initial build plan created |
