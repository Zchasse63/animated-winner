# LeadGen Monorepo

A multi-vertical lead generation platform for home services (HVAC, Plumbing, Roofing) built with Astro, React, and Supabase.

## Overview

This monorepo contains three separate lead generation apps, one per vertical, sharing common components and utilities. Each app deploys to its own domain and generates hundreds of SEO-optimized landing pages.

| Vertical | App | Services | Example Domain |
|----------|-----|----------|----------------|
| HVAC | `apps/hvac` | 14 services | getquickcool.com |
| Plumbing | `apps/plumbing` | 11 services | yourplumbingdomain.com |
| Roofing | `apps/roofing` | 11 services | yourroofingdomain.com |

## Tech Stack

- **Framework**: Astro 5.x with React 19 islands
- **Database**: Supabase (PostgreSQL)
- **Styling**: Tailwind CSS
- **Deployment**: Netlify (SSR)
- **Package Manager**: pnpm

## Quick Start

```bash
# Install dependencies
pnpm install

# Start development server (pick one)
pnpm dev:hvac        # localhost:4321
pnpm dev:plumbing    # localhost:4322
pnpm dev:roofing     # localhost:4323

# Build for production
pnpm build:hvac
pnpm build:plumbing
pnpm build:roofing
pnpm build:all       # Build all apps
```

## Project Structure

```
├── apps/
│   ├── hvac/           # HVAC lead gen app
│   ├── plumbing/       # Plumbing lead gen app
│   └── roofing/        # Roofing lead gen app
│
├── packages/
│   └── shared/         # Shared components, lib, config
│       ├── components/ # Astro + React components
│       ├── layouts/    # Page layouts
│       ├── lib/        # Utilities (supabase, validation)
│       ├── config/     # Geo config (states, cities)
│       └── styles/     # Global CSS
│
├── supabase/           # Database migrations and seeds
├── scripts/            # Build utilities
└── src/                # Original code (preserved for rollback)
```

## Environment Variables

Create a `.env.local` file in the root with:

```bash
# Required
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_...
SUPABASE_SECRET_KEY=sb_secret_...
PUBLIC_SITE_URL=https://your-domain.com
PUBLIC_COMPANY_NAME=Your Company
PUBLIC_DEFAULT_PHONE=8135551234

# Optional
TRACKDRIVE_API_KEY=
SERVICE_DIRECT_API_KEY=
SMARTY_AUTH_ID=
SMARTY_AUTH_TOKEN=
```

## Route Structure

Each app uses a 3-level route structure (vertical is implicit per domain):

```
/[state]/[city]/[service]/
```

Examples:
- `/fl/tampa/ac-repair/` (HVAC)
- `/fl/tampa/drain-cleaning/` (Plumbing)
- `/fl/tampa/roof-repair/` (Roofing)

## Features

- Multi-step lead capture forms with Zod validation
- Call tracking integration (TrackDrive)
- SEO-optimized pages with JSON-LD schema
- CSRF protection and request validation
- Content Security Policy headers
- Daily analytics aggregation

## Deployment

Each app deploys to its own Netlify site. Configure in the Netlify dashboard:

1. Set the build command (e.g., `pnpm build:hvac`)
2. Set publish directory to `apps/hvac/dist`
3. Add environment variables
4. Enable rate limiting for `/api/*` endpoints

## Documentation

See [CLAUDE.md](./CLAUDE.md) for detailed project documentation including:
- Complete architecture details
- Database schema
- API endpoints
- Component reference
- Common tasks
- Troubleshooting

## License

Proprietary - All rights reserved
