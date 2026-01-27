# CLAUDE.md - Project Context

## Project Overview

**HVAC/Plumbing/Roofing Lead Generation Platform** for the Southeast US market. This is a production lead generation system that captures web form submissions and call tracking data, scores leads, and sells them to service contractors.

- **Framework**: Astro 5.x with React 19 for interactive components
- **Database**: Supabase (PostgreSQL)
- **Deployment**: Netlify (SSR with Netlify Functions)
- **Primary Market**: Florida (82+ cities seeded), expanding to GA, AL, SC, NC, TN, MS, LA

---

## Quick Reference

```bash
# Development
npm run dev              # Start dev server at localhost:4321
npm run build            # Build for production
npm run preview          # Preview production build

# Database
npm run seed:pages       # Generate page records in Supabase

# Utilities
npm run generate:sitemap # Generate XML sitemap
```

---

## Architecture

### Directory Structure

```
/src
  /components            # UI components (Astro + React)
    /FormSteps           # Multi-step form components
  /config                # Business logic configuration
  /layouts               # Page layouts
  /lib                   # Utilities and clients
  /pages                 # Routes and API endpoints
    /api                 # API routes (leads, calls, health)
    /[state]/[city]/...  # Dynamic landing pages
  /styles                # Global CSS (Tailwind)

/supabase
  /migrations            # SQL schema (5 migration files)
  /seed                  # City-specific seed data (82+ Florida cities)

/scripts                 # Build utilities
/docs                    # Documentation and audits
```

### Tech Stack

| Layer | Technology | Version |
|-------|------------|---------|
| Frontend | Astro | 5.16.6 |
| Interactivity | React | 19.2.3 |
| Forms | React Hook Form + Zod | 7.69.0 / 3.25.76 |
| Styling | Tailwind CSS | 3.4.19 |
| Database | Supabase | 2.89.0 |
| Deployment | Netlify | 6.6.4 adapter |
| Runtime | Node.js | 20 |

---

## Database Schema

### Core Tables

#### `leads` - Web form submissions
Primary table for lead capture. Contains contact info, property details, attribution, compliance, and scoring data.

Key fields:
- `id` (UUID), `created_at`
- Contact: `name`, `email`, `phone`
- Location: `address`, `city`, `state`, `zip`
- Service: `vertical` (hvac/plumbing/roofing), `service_type`, `urgency`
- Scoring: `raw_score` (0-100), `score_tier` (premium/good/standard/nurture)
- Status: `status` (new/processing/sold/rejected/nurture)
- Compliance: `trustedform_cert_url`, `tcpa_consent_timestamp`

#### `calls` - Call tracking (TrackDrive)
Webhook-populated table for inbound call tracking.

Key fields:
- `trackdrive_call_id` (unique)
- `caller_phone`, `duration_seconds`, `converted`, `revenue`
- `vertical`, `city`, `state`, `campaign`

#### `daily_stats` - Unified analytics
Aggregated metrics for reporting dashboards.

Key fields:
- `date`, `state`, `vertical`, `source`
- Web: `web_leads_total`, `web_leads_sold`, `web_leads_revenue`
- Calls: `calls_total`, `calls_converted`, `calls_revenue`

#### `pages` - CMS page data
SEO content and configuration per landing page.

#### `buyers` - Lead buyer configuration
API endpoints, coverage areas, and purchasing limits.

#### `property_cache` - Enrichment API cache (30-day TTL)
#### `enrichment_logs` - API call debugging

### Row Level Security (RLS)

- **Anonymous users**: Can INSERT to `leads` table only
- **Service role**: Full access to all tables
- **Public read**: Active `pages` only

---

## API Endpoints

### `POST /api/leads`
Lead form submission endpoint.

```typescript
// Request body (validated by Zod)
{
  serviceType: 'ac-repair' | 'heating-repair' | ...,
  urgency: 'emergency' | 'urgent' | 'planned',
  propertyType: 'single-family' | 'condo' | ...,
  address: string,
  city: string,
  state: string,
  zip: string,
  name: string,
  email: string,
  phone: string,  // Format: (XXX) XXX-XXXX
  tcpaConsent: true
}

// Response
{ success: true, leadId: string, message: string }
```

### `POST /api/calls`
TrackDrive webhook endpoint for call tracking.

### `GET /api/health`
Health check returning Supabase connection status.

---

## Environment Variables

### Required (Supabase 2025-2026 API Key Format)

```bash
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_...  # Client-safe, respects RLS
SUPABASE_SECRET_KEY=sb_secret_...                   # Server-only, bypasses RLS

PUBLIC_SITE_URL=https://your-domain.com
PUBLIC_COMPANY_NAME=HomeService Leads
PUBLIC_DEFAULT_PHONE=8135551234
```

### Optional (Third-Party APIs)

```bash
# Call Tracking
TRACKDRIVE_API_KEY=

# Lead Buyers
SERVICE_DIRECT_API_KEY=

# Address Validation
SMARTY_AUTH_ID=
SMARTY_AUTH_TOKEN=

# Property Data Enrichment
RENTCAST_API_KEY=
SHOVELS_API_KEY=
CENSUS_API_KEY=

# Email
RESEND_API_KEY=

# AI Scoring
GEMINI_API_KEY=

# Compliance
TRUSTEDFORM_ACCOUNT_ID=
```

**Note**: Supabase migrated from JWT-based keys (`anon`/`service_role`) to `sb_publishable_`/`sb_secret_` format in 2025-2026.

---

## Component Architecture

### Astro Components (Server-Rendered)

| Component | Purpose |
|-----------|---------|
| `Header.astro` | Navigation with phone CTA |
| `Hero.astro` | Hero section with service info |
| `TrustBadges.astro` | Social proof badges |
| `HowItWorks.astro` | 3-step process explainer |
| `WhyChooseUs.astro` | Vertical-specific benefits |
| `FAQ.astro` | Dynamic FAQ sections |
| `ServiceAreas.astro` | Geographic coverage display |
| `FinalCTA.astro` | Final call-to-action |
| `LocalSchema.astro` | JSON-LD structured data |
| `Footer.astro` | Footer with legal links |

### React Components (Interactive)

| Component | Purpose |
|-----------|---------|
| `LeadForm.tsx` | Multi-step form (3 steps) |
| `ServiceStep.tsx` | Service type & urgency |
| `PropertyStep.tsx` | Address & property type |
| `ContactStep.tsx` | Contact info & TCPA consent |
| `ConfirmationStep.tsx` | Success state |
| `ClickToCallIsland.tsx` | Interactive phone with analytics |

### Component Hydration

React components use `client:load` directive for immediate hydration:
```astro
<LeadForm client:load vertical={vertical} city={city} />
```

---

## Routing & Page Generation

### Dynamic Routes

```
/                                          # Homepage
/[state]/[city]/[vertical]/[service]/      # Landing pages
```

Example: `/fl/tampa/hvac/ac-repair/`

### Static Generation

Pages are prerendered at build time via `getStaticPaths()`:
- 8 states × 35+ cities × 3 verticals × 4 services = 1000+ pages
- All pages have unique SEO metadata and Schema markup

---

## Configuration

### Verticals (`src/config/verticals.ts`)

```typescript
verticals: ['hvac', 'plumbing', 'roofing']
```

### Services (`src/config/services.ts`)

```typescript
// HVAC
'ac-repair', 'heating-repair', 'hvac-installation', 'maintenance'

// Plumbing
'drain-cleaning', 'water-heater', 'leak-repair', 'pipe-repair'

// Roofing
'roof-repair', 'roof-replacement', 'roof-inspection', 'storm-damage'
```

Each service has: `slug`, `name`, `description`, `avgLeadValue`, `keywords[]`, `urgencyWeight`

### Geography (`src/config/geo.ts`)

- **Enabled States**: FL (primary), GA, AL, SC, NC, TN, MS, LA
- **Florida Cities**: 82+ cities seeded with population and metro data
- Helper functions: `getState()`, `getCity()`, `getCitiesByState()`, `isValidState()`, `isValidCity()`

---

## Styling

### Design System Colors

```css
--navy: #0f172a       /* Primary, trust */
--teal: #0891b2       /* Secondary, action */
--orange: #f97316     /* CTA, urgency */
```

### Custom Tailwind Classes

- `.btn-primary`, `.btn-secondary`, `.btn-cta` - Button variants
- `.card` - Card container with shadow
- `.trust-badge` - Trust indicator pill
- `.selection-card` - Selectable option card

### Animations

- `animate-fade-in` - Opacity fade
- `animate-slide-up` - Vertical slide with fade
- `animate-pulse-slow` - Slow pulse for CTAs

---

## Form Validation

### Zod Schemas (`src/lib/validation.ts`)

```typescript
// Step 1: Service
serviceType: z.enum([...services])
urgency: z.enum(['emergency', 'urgent', 'planned'])

// Step 2: Property
propertyType: z.enum(['single-family', 'condo', 'townhouse', 'mobile-home', 'multi-family', 'commercial'])
address: z.string().min(5)
city: z.string().min(2)
state: z.string().length(2)
zip: z.string().regex(/^\d{5}(-\d{4})?$/)

// Step 3: Contact
name: z.string().min(2)
email: z.string().email()
phone: z.string().regex(/^\(\d{3}\) \d{3}-\d{4}$/)
tcpaConsent: z.literal(true)
```

---

## Supabase Client Usage

### Browser Client (respects RLS)
```typescript
import { supabase } from '@lib/supabase';

const { data } = await supabase.from('pages').select('*');
```

### Server Client (bypasses RLS)
```typescript
import { createServerClient } from '@lib/supabase';

const supabase = createServerClient();
const { data } = await supabase.from('leads').insert(leadData);
```

---

## Deployment (Netlify)

### Build Configuration

```toml
[build]
  command = "npm run build"
  publish = "dist"

[build.environment]
  NODE_VERSION = "20"
```

### Security Headers

- `X-Frame-Options: DENY`
- `X-Content-Type-Options: nosniff`
- `Referrer-Policy: strict-origin-when-cross-origin`

### Caching

- `/_astro/*` - 1 year immutable cache

---

## Key Patterns

### Lead Capture Flow

1. User lands on `/fl/tampa/hvac/ac-repair/`
2. Completes 3-step form with validation
3. Form POSTs to `/api/leads`
4. API validates → inserts to Supabase → updates `daily_stats`
5. (Future) Ping/post workflow to buyers

### Phone Tracking

- `.tracking-phone` class marks phone links for call tracking
- `src/lib/phone.ts` provides formatting utilities
- Analytics tracked via GA4 and Facebook Pixel

### TypeScript Conventions

- **Files**: kebab-case (`lead-form.tsx`)
- **Types/Components**: PascalCase (`LeadForm`)
- **Constants**: UPPER_SNAKE_CASE or camelCase
- **Path aliases**: `@components/*`, `@lib/*`, `@config/*`

---

## Common Tasks

### Add a New City

1. Add to `src/config/geo.ts` in the appropriate state
2. Run `npm run seed:pages` to generate page records
3. Run `npm run generate:sitemap` to update sitemap

### Add a New Service

1. Add to `src/config/services.ts`
2. Update `src/lib/validation.ts` schema
3. Rebuild to generate new pages

### Update Database Schema

1. Create new migration in `supabase/migrations/`
2. Apply via Supabase CLI or dashboard
3. Regenerate types if needed

---

## Known Limitations / TODOs

- **Enrichment APIs**: Smarty, Shovels, RentCast, Census integrations not yet implemented
- **AI Scoring**: Gemini scoring not yet implemented
- **Ping/Post**: Lead buyer integration not yet implemented
- **TrackDrive**: Webhook field mapping may need adjustment for actual API format
- **Email**: Resend notifications not yet implemented

---

## File Reference

| File | Purpose |
|------|---------|
| `src/lib/supabase.ts` | Supabase client initialization |
| `src/lib/phone.ts` | Phone formatting and tracking utilities |
| `src/lib/validation.ts` | Zod schemas for form validation |
| `src/lib/database.types.ts` | Auto-generated Supabase types |
| `src/config/index.ts` | Consolidated config exports |
| `src/pages/api/leads.ts` | Lead submission API |
| `src/pages/api/calls.ts` | Call tracking webhook |
| `astro.config.mjs` | Astro configuration |
| `tailwind.config.mjs` | Tailwind customization |
| `netlify.toml` | Deployment configuration |

---

## Troubleshooting

### Build Errors

- **Missing env vars**: Ensure all `PUBLIC_*` vars are set
- **Type errors**: Run `npx supabase gen types` to regenerate database types

### Database Issues

- **RLS errors**: Ensure using correct client (browser vs server)
- **Insert failures**: Check TCPA consent and required fields

### Deployment Issues

- **Netlify function errors**: Check Node version (requires 20)
- **SSR failures**: Verify Netlify adapter configuration
