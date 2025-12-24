# Astro + Supabase Lead Generation Platform
## Updated Build Guide with Ringba & Service Direct Integration

**Goal:** Autonomous HVAC/Plumbing/Roofing lead generation platform for the Southeast US

**Target Revenue:** $10,000 - $40,000/month

**Launch Market:** Florida (expanding to full Southeast)

**Monthly Cost:** ~$700-900 (including call tracking)

**Performance Target:** Lighthouse 95-100, sub-1-second Time to Interactive

---

## What Changed From Original

| Component | Original | Updated |
|-----------|----------|---------|
| Lead Monetization | Boberdoo (middleware) | **Service Direct API** (direct) |
| Call Tracking | None | **Ringba** ($99/mo + usage) |
| Lead Model | Enrich-first | **Ping/Post** (enrich after sale) |
| Geographic Scope | Single market | **Southeast US** (FL → GA, AL, SC, NC, TN) |
| Compliance | Basic | **TCPA + TrustedForm** |
| Verticals | HVAC only | **HVAC, Plumbing, Roofing** |

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           LANDING PAGES (Astro)                             │
│  ┌───────────────────────────────────────────────────────────────────────┐ │
│  │  Static HTML: Header, Hero, Trust Badges, FAQs, Footer                │ │
│  │  → Zero JavaScript (except islands)                                    │ │
│  └───────────────────────────────────────────────────────────────────────┘ │
│                              │                              │               │
│  ┌──────────────────────────────────────┐  ┌──────────────────────────┐   │
│  │  React Island: Multi-Step Lead Form  │  │  Click-to-Call Button    │   │
│  │  → TCPA consent capture              │  │  → Ringba DNI            │   │
│  │  → TrustedForm certificate           │  │  → Local area codes      │   │
│  └──────────────────────────────────────┘  └──────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
                    │                                    │
                    ▼                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          SUPABASE BACKEND                                   │
│  ┌────────────────┐  ┌─────────────────┐  ┌───────────────────────────┐   │
│  │  PostgreSQL    │  │  Edge Functions │  │  Realtime Triggers        │   │
│  │  - leads       │  │  - process-lead │  │  - on lead insert         │   │
│  │  - calls       │  │  - sd-ping      │  │  - invoke enrichment      │   │
│  │  - daily_stats │  │  - sd-post      │  │                           │   │
│  │  - buyers      │  │  - ringba-hook  │  │                           │   │
│  │  - pages       │  │  - score-lead   │  │                           │   │
│  │  - cache       │  │  - notify       │  │                           │   │
│  └────────────────┘  └─────────────────┘  └───────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
                    │                                    │
                    ▼                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                         EXTERNAL SERVICES                                   │
│                                                                             │
│  ENRICHMENT (Light - Before Ping)         ENRICHMENT (Full - After Sale)  │
│  ┌────────────┐ ┌────────────┐           ┌────────────┐ ┌─────────────┐   │
│  │  Smarty    │ │  Shovels   │           │  RentCast  │ │  Census     │   │
│  │  (address) │ │  (permits) │           │  (property)│ │  (demo)     │   │
│  └────────────┘ └────────────┘           └────────────┘ └─────────────┘   │
│                                                                             │
│  MONETIZATION                              COMMUNICATION                   │
│  ┌────────────────┐ ┌────────────────┐   ┌────────────┐ ┌─────────────┐   │
│  │ Service Direct │ │    Ringba      │   │   Twilio   │ │   Resend    │   │
│  │ (web leads)    │ │    (calls)     │   │   (SMS)    │ │   (email)   │   │
│  └────────────────┘ └────────────────┘   └────────────┘ └─────────────┘   │
│                                                                             │
│  AI & COMPLIANCE                                                           │
│  ┌────────────┐ ┌────────────┐ ┌────────────┐                             │
│  │  Gemini    │ │ TrustedForm│ │  HailTrace │                             │
│  │  (scoring) │ │  (consent) │ │  (roofing) │                             │
│  └────────────┘ └────────────┘ └────────────┘                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Frontend** | Astro 4.x | Static-first with islands architecture |
| **Form Island** | React + React Hook Form + Zod | Multi-step form with validation |
| **Styling** | Tailwind CSS | Utility-first, purged to minimal CSS |
| **Database** | Supabase (PostgreSQL) | Leads, calls, pages, buyers, cache |
| **Backend Logic** | Supabase Edge Functions | API orchestration, ping/post, routing |
| **Hosting** | Vercel | Edge deployment, global CDN |
| **Call Tracking** | Ringba Professional | Pay-per-call, IVR, RTB routing |
| **Lead Buyer** | Service Direct Earn API | Primary monetization (ping/post) |
| **SMS** | Twilio | Lead confirmation texts |
| **Email** | Resend | Confirmation emails, alerts |
| **Enrichment** | Smarty, RentCast, Shovels, Census | Property + demographic data |
| **AI Scoring** | Google Gemini Flash | Lead scoring 0-100 |
| **Compliance** | TrustedForm | TCPA consent certificates |
| **Storm Data** | HailTrace (future) | Roofing lead enrichment |

---

## Geographic Coverage

### Southeast US Markets

| State | Abbr | Major Metros | Area Codes | Launch Phase |
|-------|------|--------------|------------|--------------|
| **Florida** | FL | Miami, Tampa, Orlando, Jacksonville | 305, 813, 407, 904, 954, 561, 727 | Phase 1 |
| **Georgia** | GA | Atlanta, Savannah, Augusta | 404, 770, 912, 706 | Phase 2 |
| **Alabama** | AL | Birmingham, Mobile, Huntsville | 205, 251, 256 | Phase 2 |
| **South Carolina** | SC | Charleston, Columbia, Greenville | 843, 803, 864 | Phase 2 |
| **North Carolina** | NC | Charlotte, Raleigh, Greensboro | 704, 919, 336 | Phase 3 |
| **Tennessee** | TN | Nashville, Memphis, Knoxville | 615, 901, 865 | Phase 3 |
| **Mississippi** | MS | Jackson, Gulfport | 601, 228 | Phase 3 |
| **Louisiana** | LA | New Orleans, Baton Rouge | 504, 225 | Phase 3 |

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

## Project Structure (Updated)

```
leadgen-platform/
├── src/
│   ├── pages/
│   │   ├── index.astro                          # Homepage
│   │   ├── [state]/
│   │   │   ├── index.astro                      # State hub: /florida
│   │   │   └── [city]/
│   │   │       ├── index.astro                  # City hub: /florida/tampa
│   │   │       └── [vertical]/
│   │   │           ├── index.astro              # Vertical: /florida/tampa/hvac
│   │   │           └── [service].astro          # Service: /florida/tampa/hvac/ac-repair
│   │   └── api/
│   │       ├── leads.ts                         # POST endpoint for web forms
│   │       └── ringba-webhook.ts                # Ringba call data webhook
│   │
│   ├── components/
│   │   ├── LeadForm.tsx                         # React island (multi-step)
│   │   ├── FormSteps/
│   │   │   ├── ServiceStep.tsx                  # Step 1: Service type
│   │   │   ├── PropertyStep.tsx                 # Step 2: Property info
│   │   │   ├── ContactStep.tsx                  # Step 3: Contact info
│   │   │   └── ConfirmationStep.tsx             # Step 4: Success
│   │   ├── ClickToCall.astro                    # Click-to-call with Ringba DNI
│   │   ├── ClickToCallIsland.tsx                # React version for dynamic behavior
│   │   ├── TCPAConsent.astro                    # TCPA disclosure component
│   │   ├── TrustedFormScript.astro              # TrustedForm certificate capture
│   │   ├── Header.astro                         # Static header
│   │   ├── Hero.astro                           # Static hero section
│   │   ├── TrustBadges.astro                    # Static trust signals
│   │   ├── ServiceAreas.astro                   # Static service area list
│   │   ├── FAQ.astro                            # Static FAQ accordion
│   │   ├── Footer.astro                         # Static footer
│   │   └── LocalSchema.astro                    # JSON-LD structured data
│   │
│   ├── layouts/
│   │   ├── BaseLayout.astro                     # Base layout with Ringba + TrustedForm
│   │   └── LandingPage.astro                    # Landing page layout with SEO
│   │
│   ├── lib/
│   │   ├── supabase.ts                          # Supabase client
│   │   ├── database.types.ts                    # TypeScript types
│   │   ├── validation.ts                        # Zod schemas
│   │   ├── geo/
│   │   │   ├── states.ts                        # Southeast state data
│   │   │   ├── cities.ts                        # City data with area codes
│   │   │   └── area-codes.ts                    # Area code to region mapping
│   │   ├── ringba/
│   │   │   ├── config.ts                        # Campaign IDs, number pools
│   │   │   └── tags.ts                          # Tag helpers for attribution
│   │   ├── service-direct/
│   │   │   ├── client.ts                        # API client
│   │   │   ├── categories.ts                    # Service category mappings
│   │   │   └── types.ts                         # TypeScript types
│   │   └── enrichment/
│   │       ├── smarty.ts                        # Address validation
│   │       ├── shovels.ts                       # Permit data
│   │       ├── rentcast.ts                      # Property data
│   │       └── census.ts                        # Demographics
│   │
│   ├── config/
│   │   ├── verticals.ts                         # HVAC, Plumbing, Roofing config
│   │   ├── services.ts                          # Services per vertical
│   │   └── ringba-campaigns.ts                  # Campaign IDs per vertical/state
│   │
│   └── styles/
│       └── global.css                           # Tailwind imports
│
├── supabase/
│   ├── migrations/
│   │   ├── 001_initial_schema.sql               # Core tables
│   │   ├── 002_calls_table.sql                  # Ringba call tracking
│   │   ├── 003_daily_stats.sql                  # Unified reporting
│   │   └── 004_ping_post_fields.sql             # Service Direct fields
│   └── functions/
│       ├── process-lead/
│       │   └── index.ts                         # Main lead processing (ping/post)
│       ├── service-direct-ping/
│       │   └── index.ts                         # Ping Service Direct for bid
│       ├── service-direct-post/
│       │   └── index.ts                         # Post lead after acceptance
│       ├── ringba-webhook/
│       │   └── index.ts                         # Handle Ringba call data
│       ├── enrich-lead/
│       │   └── index.ts                         # Full enrichment (after sale)
│       ├── score-lead/
│       │   └── index.ts                         # Gemini scoring
│       └── notify/
│           └── index.ts                         # Slack/email notifications
│
├── scripts/
│   ├── seed-pages.ts                            # Generate city/service pages
│   ├── seed-florida.ts                          # Florida-specific seed
│   ├── test-service-direct.ts                   # Test SD API integration
│   ├── test-ringba-webhook.ts                   # Test Ringba webhook
│   └── generate-sitemap.ts                      # Dynamic sitemap generation
│
├── tests/
│   ├── mocks/
│   │   ├── smarty-response.json
│   │   ├── shovels-response.json
│   │   ├── service-direct-ping.json
│   │   └── ringba-webhook.json
│   └── payloads/
│       ├── web-lead.json
│       └── call-complete.json
│
├── docs/
│   ├── RINGBA_SETUP.md                          # Ringba configuration guide
│   ├── SERVICE_DIRECT_API.md                    # Service Direct integration
│   ├── TCPA_COMPLIANCE.md                       # Compliance requirements
│   └── EXPANSION_PLAYBOOK.md                    # Adding new states/markets
│
├── .env.example
├── .github/workflows/deploy.yml
├── astro.config.mjs
├── tailwind.config.mjs
├── tsconfig.json
├── package.json
├── vercel.json
├── DEPLOYMENT.md
└── ROADMAP.md
```

---

## Monthly Cost Breakdown (Updated)

### Phase 1: Florida Launch (500 calls + 2,000 web leads/month)

| Service | Plan | Monthly Cost |
|---------|------|--------------|
| **Vercel** | Pro | $20 |
| **Supabase** | Pro | $25 |
| **Ringba** | Professional | $99 |
| **Ringba Numbers** | 7 local FL | $14 |
| **Ringba Minutes** | 2,500 min @ $0.05 | $125 |
| **Ringba Recording** | 2,500 min @ $0.005 | $12.50 |
| **Light Enrichment** | 2,500 leads @ $0.02 | $50 |
| **Full Enrichment** | 1,500 sold @ $0.15 | $225 |
| **Gemini Flash** | Usage-based | $15 |
| **Twilio SMS** | Usage-based | $20 |
| **TrustedForm** | Usage-based | $50 |
| **Resend Email** | Free tier | $0 |
| **Domain** | Annual / 12 | $2 |
| **TOTAL** | | **~$658/mo** |

### Phase 2: Southeast Expansion (1,500 calls + 5,000 web leads/month)

| Service | Plan | Monthly Cost |
|---------|------|--------------|
| **Vercel** | Pro | $20 |
| **Supabase** | Pro | $25 |
| **Ringba** | Professional | $99 |
| **Ringba Numbers** | 21 local (3 states) | $42 |
| **Ringba Minutes** | 7,500 min @ $0.05 | $375 |
| **Light Enrichment** | 6,500 leads @ $0.02 | $130 |
| **Full Enrichment** | 4,000 sold @ $0.15 | $600 |
| **Gemini Flash** | Higher usage | $40 |
| **Twilio SMS** | Higher usage | $50 |
| **TrustedForm** | Higher usage | $150 |
| **TOTAL** | | **~$1,531/mo** |

---

## Revenue Projections

### Phase 1: Florida Only

| Channel | Volume | Conversion | Avg Price | Revenue |
|---------|--------|------------|-----------|---------|
| **Calls** | 500 | 40% (200) | $75 | $15,000 |
| **Web Leads** | 2,000 | 60% (1,200) | $40 | $48,000 |
| **TOTAL** | | | | **$63,000/mo** |

**Costs:** ~$658 + Ad Spend (~$5,000) = $5,658
**Gross Profit:** ~$57,342/mo (91% margin before ad spend impact)

### Phase 2: Southeast (3 States)

| Channel | Volume | Conversion | Avg Price | Revenue |
|---------|--------|------------|-----------|---------|
| **Calls** | 1,500 | 40% (600) | $75 | $45,000 |
| **Web Leads** | 5,000 | 60% (3,000) | $40 | $120,000 |
| **TOTAL** | | | | **$165,000/mo** |

---

## Data Flow: Web Lead (Ping/Post Model)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         WEB LEAD FLOW (PING/POST)                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1. FORM SUBMISSION                                                        │
│     └─→ Capture: name, phone, email, address, service_type, urgency        │
│     └─→ Capture: TrustedForm certificate URL                               │
│     └─→ Capture: UTM params, landing page, referrer                        │
│                                                                             │
│  2. LIGHT VALIDATION (~$0.02)                                              │
│     └─→ Smarty: Standardize address, verify deliverability                 │
│     └─→ Phone validation: Check if real, mobile vs landline                │
│     └─→ Save raw lead to database (status: 'pending_ping')                 │
│                                                                             │
│  3. PING SERVICE DIRECT (No PII sent)                                      │
│     └─→ Send: zip_code, service_category, caller_id (optional)             │
│     └─→ Receive: available_buyer, request_id, bid amount, min_duration     │
│     └─→ If no bid → Save lead for future nurture, exit                     │
│                                                                             │
│  4. LIGHT ENRICHMENT (~$0.05) - Only if bid received                       │
│     └─→ Shovels: Get permit history (key signal: no HVAC permit 10+ yrs)   │
│     └─→ Calculate property_age from address                                │
│                                                                             │
│  5. ACCEPT BID & GET FORWARDING NUMBER                                     │
│     └─→ POST to Service Direct with request_id                             │
│     └─→ Receive: phone_number (contractor's number)                        │
│     └─→ Update lead status: 'sold'                                         │
│                                                                             │
│  6. FULL ENRICHMENT (~$0.15) - Only on sold leads                          │
│     └─→ RentCast: Property details, value, sqft, beds/baths                │
│     └─→ Census: Demographics, income estimates                             │
│     └─→ Store enriched data for reporting/optimization                     │
│                                                                             │
│  7. NOTIFY & CONFIRM                                                       │
│     └─→ SMS to homeowner: "A technician will call you shortly"             │
│     └─→ Slack notification: Lead sold, price, buyer                        │
│     └─→ Update daily_stats table                                           │
│                                                                             │
│  TOTAL COST PER LEAD:                                                      │
│  - Unsold lead: ~$0.02 (validation only)                                   │
│  - Sold lead: ~$0.22 (validation + light + full enrichment)                │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Data Flow: Phone Call (Ringba)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         PHONE CALL FLOW (RINGBA)                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1. PAGE LOAD                                                              │
│     └─→ Ringba JS snippet loads async                                      │
│     └─→ DNI swaps fallback number with tracking number                     │
│     └─→ Tags captured: vertical, city, state, source, landing_page         │
│                                                                             │
│  2. VISITOR CLICKS/CALLS                                                   │
│     └─→ Call routes to Ringba                                              │
│     └─→ Ringba captures: caller_id, geo, timestamp                         │
│                                                                             │
│  3. IVR QUALIFICATION (~15 seconds)                                        │
│     └─→ "This call may be recorded for quality purposes."                  │
│     └─→ "Press 1 for emergency service"                                    │
│     └─→ "Press 2 for repair"                                               │
│     └─→ "Press 3 for free estimate on new system"                          │
│                                                                             │
│  4. RING TREE / RTB                                                        │
│     └─→ Ringba pings Service Direct (if integrated as target)              │
│     └─→ OR routes to configured buyer based on:                            │
│         - Geographic location (caller area code)                           │
│         - Time of day (business hours)                                     │
│         - IVR selection (emergency = higher payout)                        │
│         - Buyer capacity                                                   │
│                                                                             │
│  5. CALL CONNECTED                                                         │
│     └─→ Caller speaks with contractor                                      │
│     └─→ Ringba tracks: duration, connection_duration                       │
│     └─→ Conversion tracked if duration > min_duration (usually 90s)        │
│                                                                             │
│  6. CALL COMPLETE → WEBHOOK                                                │
│     └─→ Ringba sends POST to: /api/ringba-webhook                          │
│     └─→ Payload: call_id, caller_number, duration, converted, revenue      │
│     └─→ Payload: target_name, campaign_name, all tags                      │
│                                                                             │
│  7. WEBHOOK HANDLER (Supabase Edge Function)                               │
│     └─→ Insert into `calls` table                                          │
│     └─→ Update `daily_stats` table                                         │
│     └─→ Send Slack notification if high-value conversion                   │
│                                                                             │
│  COST PER CALL:                                                            │
│  - Platform: $0.05/min × 5 min avg = $0.25                                 │
│  - Recording: $0.005/min × 5 min = $0.025                                  │
│  - Number: $2/mo ÷ 70 calls = $0.03                                        │
│  - TOTAL: ~$0.31 per call                                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Database Schema (Updated)

### Core Tables

```sql
-- supabase/migrations/001_initial_schema.sql

-- Leads table (web form submissions)
CREATE TABLE leads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Contact info
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  
  -- Location
  address TEXT,
  address_standardized TEXT,
  city TEXT NOT NULL,
  state TEXT NOT NULL,  -- 2 char: FL, GA, etc.
  zip TEXT NOT NULL,
  
  -- Service details
  vertical TEXT NOT NULL,  -- hvac, plumbing, roofing
  service_type TEXT NOT NULL,  -- ac-repair, drain-cleaning, etc.
  urgency TEXT NOT NULL,  -- emergency, urgent, planned
  property_type TEXT,  -- single-family, multi-family, commercial
  issue_description TEXT,
  
  -- Attribution
  source_page TEXT,
  utm_source TEXT,
  utm_medium TEXT,
  utm_campaign TEXT,
  utm_content TEXT,
  referrer TEXT,
  
  -- Compliance
  trustedform_cert_url TEXT,
  tcpa_consent_timestamp TIMESTAMPTZ,
  ip_address TEXT,
  
  -- Ping/Post tracking
  ping_status TEXT DEFAULT 'pending',  -- pending, sent, bid_received, no_bid
  ping_request_id TEXT,
  ping_bid_amount DECIMAL(10,2),
  ping_buyer_id TEXT,
  ping_timestamp TIMESTAMPTZ,
  
  post_status TEXT,  -- pending, accepted, rejected
  post_phone_number TEXT,  -- forwarding number from buyer
  post_timestamp TIMESTAMPTZ,
  
  -- Enrichment (light - before ping)
  address_valid BOOLEAN,
  phone_valid BOOLEAN,
  phone_type TEXT,  -- mobile, landline
  
  -- Enrichment (full - after sale)
  enrichment_data JSONB,
  property_year_built INTEGER,
  property_sqft INTEGER,
  property_value INTEGER,
  last_hvac_permit_date DATE,
  years_since_hvac_permit INTEGER,
  
  -- Scoring
  raw_score INTEGER,  -- 0-100
  score_tier TEXT,  -- premium, good, standard, nurture
  score_factors JSONB,
  
  -- Sale tracking
  status TEXT DEFAULT 'new',  -- new, processing, sold, rejected, nurture
  sold_to TEXT,
  sold_price DECIMAL(10,2),
  sold_at TIMESTAMPTZ
);

-- Indexes
CREATE INDEX idx_leads_created_at ON leads(created_at DESC);
CREATE INDEX idx_leads_state ON leads(state);
CREATE INDEX idx_leads_vertical ON leads(vertical);
CREATE INDEX idx_leads_status ON leads(status);
CREATE INDEX idx_leads_zip ON leads(zip);
```

### Calls Table (Ringba)

```sql
-- supabase/migrations/002_calls_table.sql

CREATE TABLE calls (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Ringba identifiers
  ringba_call_id TEXT UNIQUE NOT NULL,
  call_uuid TEXT,
  
  -- Caller information
  caller_phone TEXT,
  caller_city TEXT,
  caller_state TEXT,
  caller_zip TEXT,
  
  -- Call metrics
  duration_seconds INTEGER,
  connection_seconds INTEGER,
  ring_duration_seconds INTEGER,
  status TEXT,  -- completed, missed, voicemail
  
  -- Conversion/Revenue
  converted BOOLEAN DEFAULT FALSE,
  revenue DECIMAL(10,2) DEFAULT 0,
  payout DECIMAL(10,2) DEFAULT 0,
  
  -- Routing
  buyer_name TEXT,
  buyer_number TEXT,
  campaign TEXT,
  
  -- Attribution (from Ringba tags)
  vertical TEXT,
  city TEXT,
  state TEXT,
  source TEXT,
  landing_page TEXT,
  keyword TEXT,
  
  -- IVR
  ivr_selection TEXT,  -- emergency, repair, estimate
  
  -- Timestamps
  call_start TIMESTAMPTZ,
  call_end TIMESTAMPTZ,
  
  -- Raw data
  raw_payload JSONB
);

-- Indexes
CREATE INDEX idx_calls_created_at ON calls(created_at DESC);
CREATE INDEX idx_calls_state ON calls(state);
CREATE INDEX idx_calls_vertical ON calls(vertical);
CREATE INDEX idx_calls_converted ON calls(converted);
CREATE INDEX idx_calls_buyer ON calls(buyer_name);
CREATE INDEX idx_calls_ringba_id ON calls(ringba_call_id);
```

### Unified Daily Stats

```sql
-- supabase/migrations/003_daily_stats.sql

CREATE TABLE daily_stats (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date DATE NOT NULL,
  state TEXT NOT NULL,
  vertical TEXT NOT NULL,
  source TEXT NOT NULL,  -- organic, google_ads, facebook, direct
  
  -- Web lead metrics
  web_leads_total INTEGER DEFAULT 0,
  web_leads_sold INTEGER DEFAULT 0,
  web_leads_revenue DECIMAL(10,2) DEFAULT 0,
  web_avg_score INTEGER DEFAULT 0,
  
  -- Call metrics
  calls_total INTEGER DEFAULT 0,
  calls_converted INTEGER DEFAULT 0,
  calls_revenue DECIMAL(10,2) DEFAULT 0,
  calls_avg_duration INTEGER DEFAULT 0,
  
  -- Combined
  total_leads INTEGER GENERATED ALWAYS AS (web_leads_total + calls_total) STORED,
  total_sold INTEGER GENERATED ALWAYS AS (web_leads_sold + calls_converted) STORED,
  total_revenue DECIMAL(10,2) GENERATED ALWAYS AS (web_leads_revenue + calls_revenue) STORED,
  
  -- Conversion rates
  web_conversion_rate DECIMAL(5,2) GENERATED ALWAYS AS (
    CASE WHEN web_leads_total > 0 
    THEN (web_leads_sold::DECIMAL / web_leads_total * 100) 
    ELSE 0 END
  ) STORED,
  call_conversion_rate DECIMAL(5,2) GENERATED ALWAYS AS (
    CASE WHEN calls_total > 0 
    THEN (calls_converted::DECIMAL / calls_total * 100) 
    ELSE 0 END
  ) STORED,
  
  UNIQUE(date, state, vertical, source)
);

CREATE INDEX idx_daily_stats_date ON daily_stats(date DESC);
CREATE INDEX idx_daily_stats_state ON daily_stats(state);
CREATE INDEX idx_daily_stats_vertical ON daily_stats(vertical);

-- Function to update daily stats
CREATE OR REPLACE FUNCTION update_daily_stats(
  p_date DATE,
  p_state TEXT,
  p_vertical TEXT,
  p_source TEXT,
  p_web_leads INTEGER DEFAULT 0,
  p_web_sold INTEGER DEFAULT 0,
  p_web_revenue DECIMAL DEFAULT 0,
  p_calls INTEGER DEFAULT 0,
  p_calls_converted INTEGER DEFAULT 0,
  p_calls_revenue DECIMAL DEFAULT 0
)
RETURNS VOID AS $$
BEGIN
  INSERT INTO daily_stats (
    date, state, vertical, source,
    web_leads_total, web_leads_sold, web_leads_revenue,
    calls_total, calls_converted, calls_revenue
  )
  VALUES (
    p_date, p_state, p_vertical, p_source,
    p_web_leads, p_web_sold, p_web_revenue,
    p_calls, p_calls_converted, p_calls_revenue
  )
  ON CONFLICT (date, state, vertical, source)
  DO UPDATE SET
    web_leads_total = daily_stats.web_leads_total + p_web_leads,
    web_leads_sold = daily_stats.web_leads_sold + p_web_sold,
    web_leads_revenue = daily_stats.web_leads_revenue + p_web_revenue,
    calls_total = daily_stats.calls_total + p_calls,
    calls_converted = daily_stats.calls_converted + p_calls_converted,
    calls_revenue = daily_stats.calls_revenue + p_calls_revenue;
END;
$$ LANGUAGE plpgsql;
```

### Supporting Tables

```sql
-- supabase/migrations/004_supporting_tables.sql

-- Pages table (for CMS-like page generation)
CREATE TABLE pages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- URL structure
  slug TEXT UNIQUE NOT NULL,  -- florida/tampa/hvac/ac-repair
  state TEXT NOT NULL,
  city TEXT NOT NULL,
  vertical TEXT NOT NULL,
  service TEXT,  -- null for city/vertical hub pages
  
  -- SEO
  title TEXT NOT NULL,
  meta_description TEXT,
  h1 TEXT NOT NULL,
  intro_paragraph TEXT,
  
  -- Content
  faq_content JSONB,
  service_areas JSONB,
  
  -- Status
  is_active BOOLEAN DEFAULT TRUE,
  
  -- Ringba
  ringba_campaign_id TEXT,
  fallback_phone TEXT
);

CREATE INDEX idx_pages_slug ON pages(slug);
CREATE INDEX idx_pages_state ON pages(state);
CREATE INDEX idx_pages_active ON pages(is_active);

-- Buyers table
CREATE TABLE buyers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  name TEXT NOT NULL,
  type TEXT NOT NULL,  -- service_direct, elocal, direct
  
  -- API config
  api_endpoint TEXT,
  api_key TEXT,
  
  -- Coverage
  active_states TEXT[],
  active_verticals TEXT[],
  active_zips TEXT[],  -- empty = all zips
  
  -- Limits
  min_score INTEGER DEFAULT 0,
  max_daily_leads INTEGER,
  current_daily_count INTEGER DEFAULT 0,
  
  -- Status
  is_active BOOLEAN DEFAULT TRUE,
  
  -- Contact
  contact_email TEXT,
  payment_terms TEXT
);

-- Property cache (avoid redundant API calls)
CREATE TABLE property_cache (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  address_hash TEXT UNIQUE NOT NULL,  -- MD5 of standardized address
  
  -- Cached data
  smarty_data JSONB,
  shovels_data JSONB,
  rentcast_data JSONB,
  census_data JSONB,
  
  -- Timestamps
  cached_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '30 days')
);

CREATE INDEX idx_property_cache_hash ON property_cache(address_hash);
CREATE INDEX idx_property_cache_expires ON property_cache(expires_at);

-- Enrichment logs (debugging/optimization)
CREATE TABLE enrichment_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  lead_id UUID REFERENCES leads(id),
  call_id UUID REFERENCES calls(id),
  
  step TEXT NOT NULL,  -- smarty, shovels, rentcast, census, gemini
  status TEXT NOT NULL,  -- success, error, cached
  
  request_data JSONB,
  response_data JSONB,
  error_message TEXT,
  
  duration_ms INTEGER,
  cost_cents INTEGER
);

CREATE INDEX idx_enrichment_logs_lead ON enrichment_logs(lead_id);
CREATE INDEX idx_enrichment_logs_step ON enrichment_logs(step);
```

---

## Key Components

### BaseLayout.astro (with Ringba + TrustedForm)

```astro
---
// src/layouts/BaseLayout.astro
interface Props {
  title: string;
  description?: string;
  vertical: 'hvac' | 'plumbing' | 'roofing';
  state: string;
  city: string;
}

const { title, description, vertical, state, city } = Astro.props;

// Ringba campaign IDs by vertical
const RINGBA_CAMPAIGNS = {
  hvac: import.meta.env.RINGBA_HVAC_CAMPAIGN_ID,
  plumbing: import.meta.env.RINGBA_PLUMBING_CAMPAIGN_ID,
  roofing: import.meta.env.RINGBA_ROOFING_CAMPAIGN_ID,
};

const campaignId = RINGBA_CAMPAIGNS[vertical];
---

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title}</title>
  {description && <meta name="description" content={description} />}
  
  <!-- Ringba Call Tracking -->
  <script src={`//b-js.ringba.com/${campaignId}`} async></script>
  <script define:vars={{ vertical, state, city }}>
    window._rgba_tags = window._rgba_tags || [];
    window._rgba_tags.push({ vertical });
    window._rgba_tags.push({ state });
    window._rgba_tags.push({ city });
    window._rgba_tags.push({ landing_page: window.location.pathname });
  </script>
  
  <!-- TrustedForm -->
  <script type="text/javascript">
    (function() {
      var tf = document.createElement('script');
      tf.type = 'text/javascript'; tf.async = true;
      tf.src = ("https:" == document.location.protocol ? 'https' : 'http') + 
               "://api.trustedform.com/trustedform.js?field=xxTrustedFormCertUrl&ping_field=xxTrustedFormPingUrl&l=" + 
               new Date().getTime() + Math.random();
      var s = document.getElementsByTagName('script')[0]; 
      s.parentNode.insertBefore(tf, s);
    })();
  </script>
  <noscript>
    <img src="https://api.trustedform.com/ns.gif" />
  </noscript>
  
  <slot name="head" />
</head>
<body>
  <slot />
</body>
</html>
```

### ClickToCall.astro

```astro
---
// src/components/ClickToCall.astro
interface Props {
  fallbackNumber: string;
  ctaText?: string;
  className?: string;
  showOnMobile?: boolean;
  showOnDesktop?: boolean;
}

const { 
  fallbackNumber, 
  ctaText = "Call Now - Free Estimate",
  className = "",
  showOnMobile = true,
  showOnDesktop = true
} = Astro.props;

// Format display number
const formatPhone = (num: string) => {
  const cleaned = num.replace(/\D/g, '');
  return `(${cleaned.slice(0,3)}) ${cleaned.slice(3,6)}-${cleaned.slice(6)}`;
};

const displayNumber = formatPhone(fallbackNumber);
---

<div class={`click-to-call ${className}`}>
  <!-- Mobile: Large tap target -->
  {showOnMobile && (
    <a 
      href={`tel:${fallbackNumber}`}
      class="ringba_phone_number mobile-cta md:hidden flex items-center justify-center gap-2 w-full py-4 px-6 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-bold text-lg rounded-lg shadow-lg hover:shadow-xl transition-all"
    >
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
      </svg>
      <span>{ctaText}</span>
    </a>
  )}
  
  <!-- Desktop: Prominent display -->
  {showOnDesktop && (
    <div class="hidden md:block text-center">
      <p class="text-sm text-gray-600 mb-1">{ctaText}</p>
      <a 
        href={`tel:${fallbackNumber}`}
        class="ringba_phone_number text-3xl font-bold text-orange-600 hover:text-orange-700 transition-colors"
      >
        {displayNumber}
      </a>
    </div>
  )}
</div>
```

### TCPAConsent.astro

```astro
---
// src/components/TCPAConsent.astro
interface Props {
  companyName?: string;
  partnerCount?: number;
}

const { 
  companyName = "HomeService Leads",
  partnerCount = 4
} = Astro.props;
---

<div class="tcpa-consent text-xs text-gray-500 mt-4 leading-relaxed">
  <p>
    By clicking "Get Quote" and submitting this form, I consent to receive calls 
    and text messages at the phone number provided, including by autodialer and 
    prerecorded message, from <strong>{companyName}</strong> and up to 
    <strong>{partnerCount}</strong> home service providers regarding my inquiry. 
    I understand that consent is not a condition of purchase. Message and data 
    rates may apply. I can opt out at any time by replying STOP.
  </p>
  <p class="mt-2">
    <a href="/privacy" class="underline hover:text-gray-700">Privacy Policy</a> | 
    <a href="/terms" class="underline hover:text-gray-700">Terms of Service</a>
  </p>
</div>

<!-- Hidden field for TrustedForm certificate -->
<input type="hidden" name="xxTrustedFormCertUrl" id="xxTrustedFormCertUrl" />
```

---

## Service Direct Integration

### Client Library

```typescript
// src/lib/service-direct/client.ts

interface PingRequest {
  zip_code: string;
  service_category: string | number;
  caller_id?: string;
  source?: string;
  tracking_id?: string;
  test_mode?: boolean;
}

interface PingResponse {
  data: {
    available_buyer: boolean;
    request_id?: number;
    bid?: number;
    min_duration?: number;
    buyer_id?: string;
  };
  errors?: Array<{ message: string }>;
}

interface PostResponse {
  data: {
    phone_number?: string;
    success: boolean;
  };
  errors?: Array<{ message: string }>;
}

const SD_API_BASE = 'https://api.servicedirect.com';

export class ServiceDirectClient {
  private apiKey: string;
  
  constructor(apiKey: string) {
    this.apiKey = apiKey;
  }
  
  async ping(request: PingRequest): Promise<PingResponse> {
    const response = await fetch(`${SD_API_BASE}/partners/request`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sd_api_key: this.apiKey,
        ...request
      })
    });
    
    if (!response.ok) {
      throw new Error(`Service Direct ping failed: ${response.status}`);
    }
    
    return response.json();
  }
  
  async post(requestId: number): Promise<PostResponse> {
    const response = await fetch(`${SD_API_BASE}/partners/request/${requestId}/accept`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sd_api_key: this.apiKey
      })
    });
    
    if (!response.ok) {
      throw new Error(`Service Direct post failed: ${response.status}`);
    }
    
    return response.json();
  }
  
  async reportSoldPrice(requestId: number, price: number): Promise<void> {
    await fetch(`${SD_API_BASE}/partners/request/${requestId}/sold_price`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sd_api_key: this.apiKey,
        sold_price: price
      })
    });
  }
}

// Service category mappings
export const SERVICE_CATEGORIES = {
  hvac: {
    'ac-repair': 2,        // Air Conditioning
    'heating-repair': 2,   // Also Air Conditioning (covers HVAC)
    'hvac-installation': 2,
    'maintenance': 2
  },
  plumbing: {
    'drain-cleaning': 20,
    'water-heater': 20,
    'leak-repair': 20,
    'pipe-repair': 20
  },
  roofing: {
    'roof-repair': 6,
    'roof-replacement': 6,
    'roof-inspection': 6,
    'storm-damage': 6
  }
} as const;
```

### Process Lead Edge Function

```typescript
// supabase/functions/process-lead/index.ts

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
);

const SD_API_KEY = Deno.env.get('SERVICE_DIRECT_API_KEY')!;
const SD_API_BASE = 'https://api.servicedirect.com';

interface LeadInput {
  name: string;
  email: string;
  phone: string;
  address: string;
  city: string;
  state: string;
  zip: string;
  vertical: string;
  service_type: string;
  urgency: string;
  property_type?: string;
  issue_description?: string;
  source_page: string;
  utm_source?: string;
  utm_medium?: string;
  utm_campaign?: string;
  trustedform_cert_url?: string;
}

serve(async (req) => {
  try {
    const lead: LeadInput = await req.json();
    
    // ==========================================
    // STEP 1: Light Validation (~$0.02)
    // ==========================================
    
    // Validate phone (basic check - expand with Numverify/Twilio Lookup)
    const phoneClean = lead.phone.replace(/\D/g, '');
    if (phoneClean.length !== 10) {
      return new Response(
        JSON.stringify({ error: 'Invalid phone number' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }
    
    // Standardize address (would call Smarty here)
    // For now, just save the raw address
    
    // Save raw lead
    const { data: savedLead, error: saveError } = await supabase
      .from('leads')
      .insert({
        ...lead,
        phone: phoneClean,
        status: 'processing',
        ping_status: 'pending'
      })
      .select()
      .single();
    
    if (saveError) throw saveError;
    
    // ==========================================
    // STEP 2: Ping Service Direct
    // ==========================================
    
    const serviceCategory = getServiceCategory(lead.vertical, lead.service_type);
    
    const pingResponse = await fetch(`${SD_API_BASE}/partners/request`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sd_api_key: SD_API_KEY,
        zip_code: lead.zip,
        service_category: serviceCategory,
        caller_id: phoneClean,
        source: lead.utm_source || 'organic',
        tracking_id: savedLead.id
      })
    });
    
    const pingResult = await pingResponse.json();
    
    // Update lead with ping result
    if (!pingResult.data?.available_buyer) {
      await supabase
        .from('leads')
        .update({
          ping_status: 'no_bid',
          status: 'nurture'
        })
        .eq('id', savedLead.id);
      
      return new Response(
        JSON.stringify({ 
          success: true, 
          lead_id: savedLead.id,
          status: 'no_buyer_available'
        }),
        { headers: { 'Content-Type': 'application/json' } }
      );
    }
    
    // ==========================================
    // STEP 3: Accept Bid & Get Forwarding Number
    // ==========================================
    
    const { request_id, bid } = pingResult.data;
    
    await supabase
      .from('leads')
      .update({
        ping_status: 'bid_received',
        ping_request_id: String(request_id),
        ping_bid_amount: bid,
        ping_timestamp: new Date().toISOString()
      })
      .eq('id', savedLead.id);
    
    const postResponse = await fetch(`${SD_API_BASE}/partners/request/${request_id}/accept`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sd_api_key: SD_API_KEY })
    });
    
    const postResult = await postResponse.json();
    
    if (!postResult.data?.phone_number) {
      await supabase
        .from('leads')
        .update({
          post_status: 'rejected',
          status: 'nurture'
        })
        .eq('id', savedLead.id);
      
      return new Response(
        JSON.stringify({ 
          success: true, 
          lead_id: savedLead.id,
          status: 'post_rejected'
        }),
        { headers: { 'Content-Type': 'application/json' } }
      );
    }
    
    // ==========================================
    // STEP 4: Lead Sold - Update & Enrich
    // ==========================================
    
    await supabase
      .from('leads')
      .update({
        post_status: 'accepted',
        post_phone_number: postResult.data.phone_number,
        post_timestamp: new Date().toISOString(),
        status: 'sold',
        sold_to: 'service_direct',
        sold_price: bid,
        sold_at: new Date().toISOString()
      })
      .eq('id', savedLead.id);
    
    // Trigger full enrichment (async - don't wait)
    fetch(`${Deno.env.get('SUPABASE_URL')}/functions/v1/enrich-lead`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')}`
      },
      body: JSON.stringify({ lead_id: savedLead.id })
    });
    
    // Update daily stats
    const today = new Date().toISOString().split('T')[0];
    await supabase.rpc('update_daily_stats', {
      p_date: today,
      p_state: lead.state,
      p_vertical: lead.vertical,
      p_source: lead.utm_source || 'organic',
      p_web_leads: 1,
      p_web_sold: 1,
      p_web_revenue: bid
    });
    
    // Send notifications
    await sendSlackNotification({
      text: `💰 Lead sold for $${bid}!`,
      blocks: [{
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `*Lead Sold!*\n• Price: $${bid}\n• Vertical: ${lead.vertical}\n• Location: ${lead.city}, ${lead.state}\n• Service: ${lead.service_type}`
        }
      }]
    });
    
    return new Response(
      JSON.stringify({ 
        success: true, 
        lead_id: savedLead.id,
        status: 'sold',
        sold_price: bid,
        contractor_phone: postResult.data.phone_number
      }),
      { headers: { 'Content-Type': 'application/json' } }
    );
    
  } catch (error) {
    console.error('Process lead error:', error);
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});

function getServiceCategory(vertical: string, serviceType: string): number {
  const categories: Record<string, Record<string, number>> = {
    hvac: { 'ac-repair': 2, 'heating-repair': 2, 'hvac-installation': 2, 'maintenance': 2 },
    plumbing: { 'drain-cleaning': 20, 'water-heater': 20, 'leak-repair': 20, 'pipe-repair': 20 },
    roofing: { 'roof-repair': 6, 'roof-replacement': 6, 'roof-inspection': 6, 'storm-damage': 6 }
  };
  return categories[vertical]?.[serviceType] || categories[vertical]?.['ac-repair'] || 2;
}

async function sendSlackNotification(message: any) {
  const webhookUrl = Deno.env.get('SLACK_WEBHOOK_URL');
  if (!webhookUrl) return;
  
  await fetch(webhookUrl, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(message)
  });
}
```

---

## Ringba Webhook Handler

```typescript
// supabase/functions/ringba-webhook/index.ts

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
);

interface RingbaPayload {
  inboundCallId: string;
  callUUID: string;
  callerNumber: string;
  callerCity: string;
  callerState: string;
  callerZip: string;
  callDuration: number;
  connectionDuration: number;
  ringDuration: number;
  callStatus: string;
  converted: boolean;
  conversionAmount: number;
  payoutAmount: number;
  targetName: string;
  targetNumber: string;
  campaignName: string;
  callStartTime: string;
  callEndTime: string;
  // Custom tags from landing page
  vertical?: string;
  city?: string;
  state?: string;
  source?: string;
  landing_page?: string;
  keyword?: string;
  ivr_selection?: string;
}

serve(async (req) => {
  try {
    const payload: RingbaPayload = await req.json();
    
    // Insert call record
    const { data: callRecord, error: insertError } = await supabase
      .from('calls')
      .insert({
        ringba_call_id: payload.inboundCallId,
        call_uuid: payload.callUUID,
        caller_phone: payload.callerNumber,
        caller_city: payload.callerCity,
        caller_state: payload.callerState,
        caller_zip: payload.callerZip,
        duration_seconds: payload.callDuration,
        connection_seconds: payload.connectionDuration,
        ring_duration_seconds: payload.ringDuration,
        status: payload.callStatus,
        converted: payload.converted,
        revenue: payload.conversionAmount,
        payout: payload.payoutAmount,
        buyer_name: payload.targetName,
        buyer_number: payload.targetNumber,
        campaign: payload.campaignName,
        vertical: payload.vertical,
        city: payload.city,
        state: payload.state,
        source: payload.source,
        landing_page: payload.landing_page,
        keyword: payload.keyword,
        ivr_selection: payload.ivr_selection,
        call_start: payload.callStartTime,
        call_end: payload.callEndTime,
        raw_payload: payload
      })
      .select()
      .single();
    
    if (insertError) throw insertError;
    
    // Update daily stats
    const today = new Date().toISOString().split('T')[0];
    await supabase.rpc('update_daily_stats', {
      p_date: today,
      p_state: payload.state || payload.callerState,
      p_vertical: payload.vertical || 'unknown',
      p_source: payload.source || 'direct',
      p_calls: 1,
      p_calls_converted: payload.converted ? 1 : 0,
      p_calls_revenue: payload.conversionAmount || 0
    });
    
    // Notify on high-value conversions
    if (payload.converted && payload.conversionAmount >= 75) {
      await sendSlackNotification({
        text: `📞 High-value call converted!`,
        blocks: [{
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: `*Call Sold for $${payload.conversionAmount}!*\n` +
                  `• Buyer: ${payload.targetName}\n` +
                  `• Duration: ${Math.floor(payload.callDuration / 60)}m ${payload.callDuration % 60}s\n` +
                  `• Location: ${payload.callerCity}, ${payload.callerState}\n` +
                  `• Vertical: ${payload.vertical || 'N/A'}`
          }
        }]
      });
    }
    
    return new Response(
      JSON.stringify({ success: true, call_id: callRecord.id }),
      { headers: { 'Content-Type': 'application/json' } }
    );
    
  } catch (error) {
    console.error('Ringba webhook error:', error);
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});

async function sendSlackNotification(message: any) {
  const webhookUrl = Deno.env.get('SLACK_WEBHOOK_URL');
  if (!webhookUrl) return;
  
  await fetch(webhookUrl, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(message)
  });
}
```

---

## Environment Variables

```bash
# .env.example

# Supabase
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Ringba
RINGBA_HVAC_CAMPAIGN_ID=CA6e9fc732b2824bca934d001234567890
RINGBA_PLUMBING_CAMPAIGN_ID=CA7f8a9b0c1d2e3f4a5b6c7d8e9f012345
RINGBA_ROOFING_CAMPAIGN_ID=CA8a9b0c1d2e3f4a5b6c7d8e9f0123456

# Service Direct
SERVICE_DIRECT_API_KEY=your-sd-api-key

# Enrichment APIs
SMARTY_AUTH_ID=your-auth-id
SMARTY_AUTH_TOKEN=your-auth-token
RENTCAST_API_KEY=your-rentcast-key
SHOVELS_API_KEY=your-shovels-key
CENSUS_API_KEY=your-census-key

# Communication
TWILIO_ACCOUNT_SID=your-twilio-sid
TWILIO_AUTH_TOKEN=your-twilio-token
TWILIO_PHONE_NUMBER=+1234567890
RESEND_API_KEY=your-resend-key

# AI
GEMINI_API_KEY=your-gemini-key

# Compliance
TRUSTEDFORM_ACCOUNT_ID=your-trustedform-id

# Notifications
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxx

# Site
PUBLIC_SITE_URL=https://yourdomain.com
PUBLIC_COMPANY_NAME=HomeService Leads
```

---

## Implementation Phases

### Phase 1: Florida Launch (Weeks 1-4)

**Week 1: Foundation**
- [ ] Initialize Astro project with React, Tailwind
- [ ] Set up Supabase project and run migrations
- [ ] Create base layout with Ringba + TrustedForm scripts
- [ ] Build multi-step lead form component

**Week 2: Core Components**
- [ ] Create click-to-call component with DNI
- [ ] Build landing page templates (state → city → vertical → service)
- [ ] Implement Service Direct client library
- [ ] Create process-lead Edge Function

**Week 3: Integration & Testing**
- [ ] Set up Ringba account, campaigns, number pools
- [ ] Configure Ringba webhook → Supabase
- [ ] Apply for Service Direct Earn API access
- [ ] Test end-to-end flow with test data

**Week 4: Florida Content & Launch**
- [ ] Seed Florida cities (10 major metros)
- [ ] Generate 120 landing pages (10 cities × 3 verticals × 4 services)
- [ ] Deploy to Vercel
- [ ] Configure custom domain, SSL
- [ ] Run first paid traffic test ($200)

### Phase 2: Optimization (Weeks 5-8)

- [ ] Add full enrichment pipeline
- [ ] Implement AI scoring with Gemini
- [ ] Build reporting dashboard (Metabase or custom)
- [ ] A/B test form variations
- [ ] Optimize IVR based on conversion data

### Phase 3: Southeast Expansion (Weeks 9-16)

- [ ] Add Georgia markets (Atlanta, Savannah, Augusta)
- [ ] Add Alabama markets (Birmingham, Mobile)
- [ ] Add South Carolina markets (Charleston, Columbia)
- [ ] Scale to 500+ landing pages
- [ ] Add additional phone numbers per market

---

## Quick Reference: All Files

```
leadgen-platform/
├── .env.example
├── .github/workflows/deploy.yml
├── astro.config.mjs
├── tailwind.config.mjs
├── tsconfig.json
├── package.json
├── vercel.json
├── DEPLOYMENT.md
├── ROADMAP.md
│
├── src/
│   ├── styles/global.css
│   ├── layouts/
│   │   ├── BaseLayout.astro              ★ NEW: Ringba + TrustedForm
│   │   └── LandingPage.astro
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Hero.astro
│   │   ├── TrustBadges.astro
│   │   ├── ServiceAreas.astro
│   │   ├── FAQ.astro
│   │   ├── Footer.astro
│   │   ├── LocalSchema.astro
│   │   ├── ClickToCall.astro             ★ NEW
│   │   ├── ClickToCallIsland.tsx         ★ NEW
│   │   ├── TCPAConsent.astro             ★ NEW
│   │   ├── TrustedFormScript.astro       ★ NEW
│   │   ├── LeadForm.tsx
│   │   └── FormSteps/
│   │       ├── ServiceStep.tsx
│   │       ├── PropertyStep.tsx
│   │       ├── ContactStep.tsx
│   │       └── ConfirmationStep.tsx
│   ├── pages/
│   │   ├── index.astro
│   │   ├── [state]/
│   │   │   ├── index.astro               ★ NEW: State hub
│   │   │   └── [city]/
│   │   │       ├── index.astro           ★ NEW: City hub
│   │   │       └── [vertical]/
│   │   │           ├── index.astro       ★ NEW: Vertical hub
│   │   │           └── [service].astro
│   │   └── api/
│   │       ├── leads.ts
│   │       └── ringba-webhook.ts         ★ NEW
│   ├── lib/
│   │   ├── supabase.ts
│   │   ├── database.types.ts
│   │   ├── validation.ts
│   │   ├── geo/                          ★ NEW
│   │   │   ├── states.ts
│   │   │   ├── cities.ts
│   │   │   └── area-codes.ts
│   │   ├── ringba/                       ★ NEW
│   │   │   ├── config.ts
│   │   │   └── tags.ts
│   │   ├── service-direct/               ★ NEW
│   │   │   ├── client.ts
│   │   │   ├── categories.ts
│   │   │   └── types.ts
│   │   └── enrichment/
│   │       ├── smarty.ts
│   │       ├── shovels.ts
│   │       ├── rentcast.ts
│   │       └── census.ts
│   └── config/
│       ├── verticals.ts                  ★ NEW
│       ├── services.ts                   ★ NEW
│       └── ringba-campaigns.ts           ★ NEW
│
├── supabase/
│   ├── config.toml
│   ├── migrations/
│   │   ├── 001_initial_schema.sql
│   │   ├── 002_calls_table.sql           ★ NEW
│   │   ├── 003_daily_stats.sql           ★ NEW
│   │   └── 004_supporting_tables.sql     ★ NEW
│   └── functions/
│       ├── process-lead/index.ts         ★ UPDATED: Ping/Post
│       ├── service-direct-ping/index.ts  ★ NEW
│       ├── service-direct-post/index.ts  ★ NEW
│       ├── ringba-webhook/index.ts       ★ NEW
│       ├── enrich-lead/index.ts          ★ NEW
│       ├── score-lead/index.ts
│       └── notify/index.ts
│
├── scripts/
│   ├── seed-pages.ts
│   ├── seed-florida.ts                   ★ NEW
│   ├── test-service-direct.ts            ★ NEW
│   ├── test-ringba-webhook.ts            ★ NEW
│   └── generate-sitemap.ts
│
├── tests/
│   ├── mocks/
│   │   ├── smarty-response.json
│   │   ├── shovels-response.json
│   │   ├── service-direct-ping.json      ★ NEW
│   │   └── ringba-webhook.json           ★ NEW
│   └── payloads/
│       ├── web-lead.json
│       └── call-complete.json            ★ NEW
│
└── docs/
    ├── RINGBA_SETUP.md                   ★ NEW
    ├── SERVICE_DIRECT_API.md             ★ NEW
    ├── TCPA_COMPLIANCE.md                ★ NEW
    └── EXPANSION_PLAYBOOK.md             ★ NEW
```

---

## Next Steps

1. **Apply for Service Direct Earn API** → affiliates@servicedirect.com
2. **Sign up for Ringba Professional** → $99/mo
3. **Purchase 7 Florida phone numbers** → Priority metros
4. **Initialize Astro project** → Follow Phase 1, Week 1
5. **Deploy Supabase migrations** → Create all tables
6. **Build first landing page** → florida/tampa/hvac/ac-repair

---

## Key Differences Summary

| Original | Updated |
|----------|---------|
| Single city routes: `/[city]/[service]` | Multi-state: `/[state]/[city]/[vertical]/[service]` |
| Enrich all leads upfront | Ping/Post: Enrich only after sale |
| No call tracking | Ringba integration with DNI |
| Generic buyer routing | Service Direct API direct integration |
| Basic consent | Full TCPA + TrustedForm |
| HVAC only | HVAC + Plumbing + Roofing |
| Single market | Southeast US (8 states) |
