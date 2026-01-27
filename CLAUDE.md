# CLAUDE.md - Project Context

## Project Overview

**HVAC/Plumbing/Roofing Lead Generation Monorepo** for the Southeast US market. This is a production lead generation system with separate apps per vertical, capturing web form submissions and call tracking data, scoring leads, and selling them to service contractors.

- **Architecture**: pnpm monorepo with shared packages
- **Framework**: Astro 5.x with React 19 for interactive components
- **Database**: Supabase (PostgreSQL)
- **Deployment**: Netlify (SSR with Netlify Functions) - one site per vertical
- **Primary Market**: Florida (82+ cities seeded), expanding to GA, AL, SC, NC, TN

---

## Quick Reference

```bash
# Development
pnpm dev:hvac            # Start HVAC dev server at localhost:4321
pnpm dev:plumbing        # Start Plumbing dev server at localhost:4322
pnpm dev:roofing         # Start Roofing dev server at localhost:4323

# Build
pnpm build:hvac          # Build HVAC app
pnpm build:plumbing      # Build Plumbing app
pnpm build:roofing       # Build Roofing app
pnpm build:all           # Build all apps

# Database
npm run seed:pages       # Generate page records in Supabase

# Utilities
npm run generate:sitemap # Generate XML sitemap
```

---

## Monorepo Architecture

### Directory Structure

```
/
├── apps/
│   ├── hvac/                    # HVAC vertical app
│   │   ├── src/
│   │   │   ├── config/
│   │   │   │   ├── vertical.ts  # HVAC services (14 services)
│   │   │   │   └── brand.ts     # GetQuickCool branding
│   │   │   └── pages/
│   │   │       ├── api/         # API routes (leads, calls, health)
│   │   │       └── [state]/[city]/[service].astro
│   │   ├── astro.config.mjs
│   │   ├── netlify.toml
│   │   └── package.json
│   │
│   ├── plumbing/                # Plumbing vertical app (11 services)
│   └── roofing/                 # Roofing vertical app (11 services)
│
├── packages/
│   └── shared/                  # Shared code
│       ├── src/
│       │   ├── components/      # Astro + React components
│       │   ├── layouts/         # Page layouts
│       │   ├── lib/             # Utilities (supabase, validation, phone)
│       │   ├── config/          # Geo config (states, cities)
│       │   └── styles/          # Global CSS (Tailwind)
│       └── package.json
│
├── src/                         # Original monolith (preserved for rollback)
├── supabase/                    # Database migrations and seeds
├── scripts/                     # Build utilities
├── pnpm-workspace.yaml
└── tsconfig.base.json
```

### Workspace Packages

| Package | Path | Purpose |
|---------|------|---------|
| `@leadgen/hvac` | `apps/hvac` | HVAC lead gen app |
| `@leadgen/plumbing` | `apps/plumbing` | Plumbing lead gen app |
| `@leadgen/roofing` | `apps/roofing` | Roofing lead gen app |
| `@leadgen/shared` | `packages/shared` | Shared components, lib, config |

### Import Aliases

```typescript
// In apps, import from shared package:
import { supabase, createServerClient } from '@leadgen/shared';
import { leadFormSchema } from '@leadgen/shared';

// Or use path aliases:
import Header from '@shared/components/Header.astro';
import { vertical } from '@/config/vertical';  // App-specific
```

---

## Tech Stack

| Layer | Technology | Version |
|-------|------------|---------|
| Frontend | Astro | 5.16.15 |
| Interactivity | React | 19.2.3 |
| Forms | React Hook Form + Zod | 7.69.0 / 3.25.76 |
| Styling | Tailwind CSS | 3.4.19 |
| Database | Supabase | 2.89.0 |
| Deployment | Netlify | 6.6.4 adapter |
| Package Manager | pnpm | 10.x |
| Runtime | Node.js | 20 |

---

## Verticals & Services

### HVAC (14 services)
```
ac-repair, ac-installation, ac-maintenance, heating-repair,
heating-installation, furnace-repair, furnace-installation,
heat-pump-repair, heat-pump-installation, duct-cleaning,
duct-repair, thermostat-installation, indoor-air-quality, emergency-hvac
```

### Plumbing (11 services)
```
drain-cleaning, leak-repair, pipe-repair, water-heater-repair,
water-heater-installation, toilet-repair, faucet-repair,
sewer-line-repair, garbage-disposal, sump-pump, emergency-plumbing
```

### Roofing (11 services)
```
roof-repair, roof-replacement, roof-inspection, shingle-repair,
metal-roofing, flat-roof-repair, roof-leak-repair,
gutter-installation, gutter-repair, storm-damage, emergency-roofing
```

---

## Route Structure

Routes use a **3-level structure** (vertical is implicit per domain):

```
/[state]/[city]/[service]/
```

Examples:
- `https://getquickcool.com/fl/tampa/ac-repair/` (HVAC)
- `https://yourplumbingdomain.com/fl/tampa/drain-cleaning/` (Plumbing)
- `https://yourroofingdomain.com/fl/tampa/roof-repair/` (Roofing)

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

#### `daily_stats` - Unified analytics
Aggregated metrics for reporting dashboards.

#### `pages` - CMS page data
SEO content and configuration per landing page.

#### `buyers` - Lead buyer configuration
API endpoints, coverage areas, and purchasing limits.

### Row Level Security (RLS)

- **Anonymous users**: Can INSERT to `leads` table only
- **Service role**: Full access to all tables
- **Public read**: Active `pages` only

---

## API Endpoints

Each app has its own API routes at `/api/*`:

### `POST /api/leads`
Lead form submission endpoint with CSRF protection, request size limits, and Zod validation.

```typescript
// Request body
{
  serviceType: 'ac-repair' | ...,
  urgency: 'emergency' | 'urgent' | 'planned',
  propertyType: 'single-family' | ...,
  address, city, state, zip, name, email, phone,
  tcpaConsent: true
}

// Response
{ success: true, leadId: string, message: string }
```

### `POST /api/calls`
TrackDrive webhook endpoint for call tracking with HMAC signature verification.

### `GET /api/health`
Health check returning Supabase connection status.

---

## Environment Variables

### Required (Supabase 2025-2026 API Key Format)

```bash
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_...  # Client-safe, respects RLS
SUPABASE_SECRET_KEY=sb_secret_...                   # Server-only, bypasses RLS

PUBLIC_SITE_URL=https://your-domain.com             # REQUIRED for CSRF protection
PUBLIC_COMPANY_NAME=HomeService Leads
PUBLIC_DEFAULT_PHONE=8135551234
```

### Optional (Third-Party APIs)

```bash
TRACKDRIVE_API_KEY=         # Call Tracking
SERVICE_DIRECT_API_KEY=     # Lead Buyers
SMARTY_AUTH_ID=             # Address Validation
SMARTY_AUTH_TOKEN=
RENTCAST_API_KEY=           # Property Data
SHOVELS_API_KEY=
CENSUS_API_KEY=
RESEND_API_KEY=             # Email
GEMINI_API_KEY=             # AI Scoring
TRUSTEDFORM_ACCOUNT_ID=     # Compliance
```

---

## Security Features

### API Security
- **CSRF Protection**: Origin/Referer validation with fail-closed behavior
- **Request Size Limits**: 10KB max for lead submissions
- **JSON Parse Protection**: Try-catch wrapper prevents crashes from malformed JSON
- **Error Sanitization**: Generic error messages, no env var exposure

### HTTP Headers (netlify.toml)
- `Content-Security-Policy` - XSS protection
- `Strict-Transport-Security` - HSTS enabled
- `X-Frame-Options: DENY` - Clickjacking protection
- `X-Content-Type-Options: nosniff` - MIME sniffing prevention

### Rate Limiting
Configure in Netlify Dashboard > Site Settings > Security > Rate limiting:
- `/api/leads`: 10 requests/minute per IP
- `/api/calls`: 20 requests/minute per IP

---

## Component Architecture

### Shared Astro Components (`packages/shared/src/components/`)

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

### Shared React Components (`packages/shared/src/components/`)

| Component | Purpose |
|-----------|---------|
| `LeadForm.tsx` | Multi-step form (3 steps) |
| `ServiceStep.tsx` | Service type & urgency |
| `PropertyStep.tsx` | Address & property type |
| `ContactStep.tsx` | Contact info & TCPA consent |
| `ConfirmationStep.tsx` | Success state |
| `ClickToCallIsland.tsx` | Interactive phone with analytics |

---

## App-Specific Configuration

### Brand Config (`apps/*/src/config/brand.ts`)

```typescript
export const brand = {
  name: 'GetQuickCool',           // Company name
  tagline: 'Fast HVAC Service',
  phone: '(813) 555-1234',
  domain: 'getquickcool.com',
  colors: {
    primary: '#2563eb',
    secondary: '#0891b2',
    accent: '#f97316',
  },
};
```

### Vertical Config (`apps/*/src/config/vertical.ts`)

Contains the vertical ID and all services for that vertical with helpers:
- `getService(slug)` - Get service by slug
- `isValidService(slug)` - Check if service exists
- `getServices()` - Get all services

---

## Deployment

### Per-App Netlify Sites

Each vertical deploys to its own Netlify site:

| App | Domain | Build Command |
|-----|--------|---------------|
| HVAC | getquickcool.com | `pnpm build:hvac` |
| Plumbing | yourplumbingdomain.com | `pnpm build:plumbing` |
| Roofing | yourroofingdomain.com | `pnpm build:roofing` |

### Netlify Configuration

Each app has its own `netlify.toml` with:
- Build command and publish directory
- Security headers (CSP, HSTS, etc.)
- CORS configuration for API endpoints
- Rate limiting documentation

---

## Common Tasks

### Add a New City

1. Add to `packages/shared/src/config/geo.ts`
2. Run `npm run seed:pages` to generate page records
3. Rebuild all apps

### Add a New Service to a Vertical

1. Add to `apps/[vertical]/src/config/vertical.ts`
2. Update validation if needed
3. Rebuild that app

### Update Shared Components

1. Edit in `packages/shared/src/`
2. Changes automatically available to all apps
3. Rebuild affected apps

### Update Database Schema

1. Create new migration in `supabase/migrations/`
2. Apply via Supabase CLI or dashboard
3. Regenerate types if needed

---

## TypeScript Configuration

### Path Aliases

```typescript
// In apps:
"@/*": ["./src/*"]
"@shared/*": ["../../packages/shared/src/*"]

// In shared package:
"@/*": ["./src/*"]
```

### Shared tsconfig.base.json

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "jsx": "react-jsx"
  }
}
```

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
| `pnpm-workspace.yaml` | Workspace configuration |
| `tsconfig.base.json` | Shared TypeScript config |
| `packages/shared/src/lib/supabase.ts` | Supabase client initialization |
| `packages/shared/src/lib/validation.ts` | Zod schemas for form validation |
| `packages/shared/src/config/geo.ts` | States and cities configuration |
| `apps/*/src/config/vertical.ts` | Per-app services configuration |
| `apps/*/src/config/brand.ts` | Per-app branding |
| `apps/*/netlify.toml` | Per-app deployment config |

---

## Troubleshooting

### Build Errors

- **Missing env vars**: Ensure all `PUBLIC_*` vars are set
- **Workspace resolution**: Run `pnpm install` from root
- **Type errors**: Run `npx supabase gen types` to regenerate database types

### Database Issues

- **RLS errors**: Ensure using correct client (browser vs server)
- **Insert failures**: Check TCPA consent and required fields
- **Stats query errors**: Use `maybeSingle()` instead of `single()` for daily_stats

### Deployment Issues

- **Netlify function errors**: Check Node version (requires 20)
- **SSR failures**: Verify Netlify adapter configuration
- **CORS errors**: Check Access-Control-Allow-Origin in netlify.toml
