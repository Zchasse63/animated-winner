# Monorepo Restructure: Split Verticals into Separate Deployable Apps

## Current State

Single Astro app generating pages for all verticals (HVAC, Plumbing, Roofing) via:
- Route: `src/pages/[state]/[city]/[vertical]/[service].astro`
- Config: `src/config/verticals.ts` and `src/config/services.ts` define all verticals/services
- Single Netlify deployment

## Target State

Monorepo with 3 separate Astro apps, each deploying to its own domain:
- apps/hvac/ → coolmequick.com (or similar)
- apps/plumbing/ → [plumbing domain]
- apps/roofing/ → [roofing domain]

Shared code in packages/shared/ imported as workspace dependency.

## Target Directory Structure

```
hvac-leadgen-platform/
├── package.json                    # Root workspace config
├── pnpm-workspace.yaml             # Workspace definition
├── tsconfig.base.json              # Shared TS config
├── .env.example
├── .gitignore
├── CLAUDE.md
│
├── packages/
│   └── shared/
│       ├── package.json
│       ├── tsconfig.json
│       ├── src/
│       │   ├── components/         # All .astro and .tsx components
│       │   │   ├── Header.astro
│       │   │   ├── Footer.astro
│       │   │   ├── Hero.astro
│       │   │   ├── TrustBadges.astro
│       │   │   ├── HowItWorks.astro
│       │   │   ├── WhyChooseUs.astro
│       │   │   ├── FAQ.astro
│       │   │   ├── ServiceAreas.astro
│       │   │   ├── FinalCTA.astro
│       │   │   ├── LocalSchema.astro
│       │   │   ├── LeadForm.tsx
│       │   │   ├── ClickToCallIsland.tsx
│       │   │   └── FormSteps/
│       │   │       └── (all form step components)
│       │   ├── layouts/
│       │   │   ├── BaseLayout.astro
│       │   │   └── LandingPage.astro
│       │   ├── lib/
│       │   │   ├── supabase.ts
│       │   │   ├── validation.ts
│       │   │   ├── phone.ts
│       │   │   └── database.types.ts
│       │   ├── config/
│       │   │   ├── geo.ts          # Shared - all cities/states
│       │   │   └── index.ts
│       │   └── styles/
│       │       └── global.css
│       └── index.ts                # Main exports
│
├── apps/
│   ├── hvac/
│   │   ├── package.json
│   │   ├── tsconfig.json
│   │   ├── astro.config.mjs
│   │   ├── netlify.toml
│   │   ├── tailwind.config.mjs
│   │   ├── .env.example
│   │   └── src/
│   │       ├── config/
│   │       │   ├── vertical.ts     # HVAC-specific: vertical info + services
│   │       │   └── brand.ts        # Brand name, colors, phone numbers
│   │       ├── pages/
│   │       │   ├── index.astro
│   │       │   ├── 404.astro
│   │       │   ├── api/
│   │       │   │   ├── leads.ts
│   │       │   │   ├── calls.ts
│   │       │   │   └── health.ts
│   │       │   └── [state]/
│   │       │       └── [city]/
│   │       │           └── [service].astro   # NOTE: No [vertical] - it's implicit
│   │       └── env.d.ts
│   │
│   ├── plumbing/
│   │   └── (same structure as hvac/)
│   │
│   └── roofing/
│       └── (same structure as hvac/)
│
├── supabase/                       # Keep at root - shared across all apps
│   ├── migrations/
│   └── seed/
│
├── scripts/                        # Keep at root - shared utilities
│   └── (existing scripts)
│
└── docs/                           # Keep at root
    └── (existing docs)
```

---

## Step-by-Step Instructions

### Step 1: Create workspace configuration

Create root `pnpm-workspace.yaml`:

```yaml
packages:
  - 'packages/*'
  - 'apps/*'
```

Update root `package.json` to be a workspace root (remove astro deps, add workspace scripts):

```json
{
  "name": "leadgen-monorepo",
  "private": true,
  "scripts": {
    "dev:hvac": "pnpm --filter @leadgen/hvac dev",
    "dev:plumbing": "pnpm --filter @leadgen/plumbing dev",
    "dev:roofing": "pnpm --filter @leadgen/roofing dev",
    "build:all": "pnpm -r build",
    "build:hvac": "pnpm --filter @leadgen/hvac build",
    "build:plumbing": "pnpm --filter @leadgen/plumbing build",
    "build:roofing": "pnpm --filter @leadgen/roofing build"
  },
  "devDependencies": {
    "tsx": "^4.21.0",
    "typescript": "^5.9.3"
  }
}
```

---

### Step 2: Create packages/shared

1. Create `packages/shared/package.json`:

```json
{
  "name": "@leadgen/shared",
  "version": "1.0.0",
  "type": "module",
  "exports": {
    ".": "./src/index.ts",
    "./components/*": "./src/components/*",
    "./layouts/*": "./src/layouts/*",
    "./lib/*": "./src/lib/*",
    "./config/*": "./src/config/*",
    "./styles/*": "./src/styles/*"
  },
  "dependencies": {
    "@supabase/supabase-js": "^2.89.0",
    "zod": "^3.25.76"
  },
  "peerDependencies": {
    "astro": "^5.0.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0"
  }
}
```

2. Create `packages/shared/tsconfig.json`:

```json
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "baseUrl": ".",
    "outDir": "./dist",
    "rootDir": "./src"
  },
  "include": ["src/**/*"]
}
```

3. Move these directories to packages/shared/src/:
   - `src/components/` → `packages/shared/src/components/`
   - `src/layouts/` → `packages/shared/src/layouts/`
   - `src/lib/` → `packages/shared/src/lib/`
   - `src/styles/` → `packages/shared/src/styles/`
   - `src/config/geo.ts` → `packages/shared/src/config/geo.ts`
   - `src/config/index.ts` → `packages/shared/src/config/index.ts`

4. Create `packages/shared/src/index.ts`:

```typescript
// Re-export all shared modules
export * from './config/geo';
export * from './lib/supabase';
export * from './lib/validation';
export * from './lib/phone';
```

---

### Step 3: Create apps/hvac

1. Create directory structure:

```
apps/hvac/
├── package.json
├── tsconfig.json
├── astro.config.mjs
├── netlify.toml
├── tailwind.config.mjs
├── .env.example
└── src/
    ├── config/
    │   ├── vertical.ts
    │   └── brand.ts
    ├── pages/
    │   ├── index.astro
    │   ├── 404.astro
    │   ├── api/
    │   │   ├── leads.ts
    │   │   ├── calls.ts
    │   │   └── health.ts
    │   └── [state]/
    │       └── [city]/
    │           └── [service].astro
    └── env.d.ts
```

2. Create `apps/hvac/package.json`:

```json
{
  "name": "@leadgen/hvac",
  "type": "module",
  "version": "1.0.0",
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview"
  },
  "dependencies": {
    "@astrojs/netlify": "^6.6.4",
    "@astrojs/react": "^4.4.2",
    "@astrojs/tailwind": "^6.0.2",
    "@hookform/resolvers": "^5.2.2",
    "@leadgen/shared": "workspace:*",
    "astro": "^5.16.6",
    "react": "^19.2.3",
    "react-dom": "^19.2.3",
    "react-hook-form": "^7.69.0",
    "tailwindcss": "^3.4.19"
  }
}
```

3. Create `apps/hvac/tsconfig.json`:

```json
{
  "extends": "astro/tsconfigs/strict",
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@shared/*": ["../../packages/shared/src/*"]
    },
    "jsx": "react-jsx",
    "jsxImportSource": "react"
  }
}
```

4. Create `apps/hvac/astro.config.mjs`:

```javascript
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';
import tailwind from '@astrojs/tailwind';
import netlify from '@astrojs/netlify';

export default defineConfig({
  output: 'server',
  adapter: netlify(),
  site: 'https://getquickcool.com', // HVAC domain - UPDATE THIS
  integrations: [
    react(),
    tailwind({ applyBaseStyles: false }),
  ],
  vite: {
    ssr: {
      noExternal: ['react-hook-form'],
    },
  },
});
```

5. Create `apps/hvac/netlify.toml`:

```toml
[build]
  command = "npm run build"
  publish = "dist"

[build.environment]
  NODE_VERSION = "20"

[functions]
  directory = ".netlify/functions"
  node_bundler = "esbuild"

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "/_astro/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
```

6. Create `apps/hvac/tailwind.config.mjs`:

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}',
    '../../packages/shared/src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
```

7. Create `apps/hvac/src/config/vertical.ts`:

```typescript
// HVAC-specific vertical configuration
export const vertical = {
  id: 'hvac' as const,
  name: 'HVAC',
  slug: 'hvac',
  description: 'Heating, Ventilation, and Air Conditioning',
};

export type VerticalId = typeof vertical.id;

export interface Service {
  id: string;
  name: string;
  slug: string;
  vertical: string;
  description?: string;
}

export const services: Service[] = [
  { id: 'ac-repair', name: 'AC Repair', slug: 'ac-repair', vertical: 'hvac' },
  { id: 'ac-installation', name: 'AC Installation', slug: 'ac-installation', vertical: 'hvac' },
  { id: 'ac-maintenance', name: 'AC Maintenance', slug: 'ac-maintenance', vertical: 'hvac' },
  { id: 'heating-repair', name: 'Heating Repair', slug: 'heating-repair', vertical: 'hvac' },
  { id: 'heating-installation', name: 'Heating Installation', slug: 'heating-installation', vertical: 'hvac' },
  { id: 'furnace-repair', name: 'Furnace Repair', slug: 'furnace-repair', vertical: 'hvac' },
  { id: 'furnace-installation', name: 'Furnace Installation', slug: 'furnace-installation', vertical: 'hvac' },
  { id: 'heat-pump-repair', name: 'Heat Pump Repair', slug: 'heat-pump-repair', vertical: 'hvac' },
  { id: 'heat-pump-installation', name: 'Heat Pump Installation', slug: 'heat-pump-installation', vertical: 'hvac' },
  { id: 'duct-cleaning', name: 'Duct Cleaning', slug: 'duct-cleaning', vertical: 'hvac' },
  { id: 'duct-repair', name: 'Duct Repair', slug: 'duct-repair', vertical: 'hvac' },
  { id: 'thermostat-installation', name: 'Thermostat Installation', slug: 'thermostat-installation', vertical: 'hvac' },
  { id: 'indoor-air-quality', name: 'Indoor Air Quality', slug: 'indoor-air-quality', vertical: 'hvac' },
  { id: 'emergency-hvac', name: 'Emergency HVAC Service', slug: 'emergency-hvac', vertical: 'hvac' },
];

export function getService(slug: string): Service | undefined {
  return services.find(s => s.slug === slug);
}

export function isValidService(slug: string): boolean {
  return services.some(s => s.slug === slug);
}

export function getAllServices(): Service[] {
  return services;
}
```

8. Create `apps/hvac/src/config/brand.ts`:

```typescript
// HVAC brand configuration
export const brand = {
  name: 'GetQuickCool',
  legalName: 'GetQuickCool LLC',
  tagline: 'Fast, Reliable HVAC Service',
  phone: '(813) 555-1234', // UPDATE THIS
  phoneRaw: '8135551234',
  email: 'info@getquickcool.com',
  domain: 'getquickcool.com',
  
  colors: {
    primary: '#2563eb',    // Blue
    secondary: '#1e40af',  // Darker blue
    accent: '#f97316',     // Orange
    background: '#ffffff',
    text: '#1f2937',
  },
  
  social: {
    facebook: '',
    instagram: '',
    twitter: '',
    youtube: '',
  },
};

export type Brand = typeof brand;
```

9. Create `apps/hvac/src/pages/[state]/[city]/[service].astro`:

```astro
---
import BaseLayout from '@shared/layouts/BaseLayout.astro';
import Header from '@shared/components/Header.astro';
import Footer from '@shared/components/Footer.astro';
import Hero from '@shared/components/Hero.astro';
import TrustBadges from '@shared/components/TrustBadges.astro';
import HowItWorks from '@shared/components/HowItWorks.astro';
import WhyChooseUs from '@shared/components/WhyChooseUs.astro';
import FAQ from '@shared/components/FAQ.astro';
import ServiceAreas from '@shared/components/ServiceAreas.astro';
import FinalCTA from '@shared/components/FinalCTA.astro';
import LocalSchema from '@shared/components/LocalSchema.astro';
import { LeadForm } from '@shared/components/LeadForm';

import { getState, getCity, getCitiesByState, isValidState, isValidCity, getEnabledCities } from '@shared/config/geo';
import { vertical, services, getService, isValidService } from '../../config/vertical';
import { brand } from '../../config/brand';

import type { GetStaticPaths } from 'astro';

export const prerender = true;

export const getStaticPaths: GetStaticPaths = async () => {
  const paths: { params: { state: string; city: string; service: string } }[] = [];

  for (const city of getEnabledCities()) {
    for (const service of services) {
      paths.push({
        params: {
          state: city.stateSlug,
          city: city.slug,
          service: service.slug,
        },
      });
    }
  }

  return paths;
};

const { state: stateSlug, city: citySlug, service: serviceSlug } = Astro.params;

// Validate params
if (!isValidState(stateSlug!) || !isValidCity(citySlug!, stateSlug!)) {
  return Astro.redirect('/404');
}

if (!isValidService(serviceSlug!)) {
  return Astro.redirect('/404');
}

const stateData = getState(stateSlug!)!;
const cityData = getCity(citySlug!, stateSlug!)!;
const serviceData = getService(serviceSlug!)!;

// Page content
const title = `${serviceData.name} in ${cityData.name}, ${stateData.abbreviation} | ${brand.name}`;
const description = `Need ${serviceData.name.toLowerCase()} in ${cityData.name}? Get free quotes from top-rated local ${vertical.name.toLowerCase()} pros. Fast response, no obligation!`;

const nearbyCities = getCitiesByState(stateSlug!).filter(c => c.slug !== citySlug).slice(0, 8);

const faqItems = [
  {
    question: `How much does ${serviceData.name.toLowerCase()} cost in ${cityData.name}?`,
    answer: `${serviceData.name} costs vary based on the specific issue and scope of work. Most ${cityData.name} homeowners pay between $150-$500 for standard repairs. Get free quotes from local pros to compare prices.`,
  },
  {
    question: `How quickly can I get ${serviceData.name.toLowerCase()} service?`,
    answer: `Most ${vertical.name} professionals in ${cityData.name} offer same-day or next-day service. For emergencies, many offer 24/7 availability.`,
  },
  {
    question: `Are your ${vertical.name.toLowerCase()} contractors licensed and insured?`,
    answer: `Yes! We only connect you with licensed, insured ${vertical.name.toLowerCase()} professionals in ${cityData.name} who have been vetted for quality and reliability.`,
  },
  {
    question: `Is the quote really free?`,
    answer: `Absolutely! Getting quotes through ${brand.name} is 100% free with no obligation. Compare prices and choose the best option for your needs.`,
  },
];
---

<BaseLayout title={title} description={description}>
  <Header phone={brand.phone} />
  
  <main>
    <Hero 
      city={cityData.name} 
      state={stateData.name} 
      stateAbbr={stateData.abbreviation}
      vertical={vertical.id}
      service={serviceSlug}
      phone={brand.phone}
    >
      <LeadForm 
        client:load 
        vertical={vertical.id}
        city={cityData.name} 
        state={stateData.abbreviation} 
        phone={brand.phone} 
      />
    </Hero>
    
    <TrustBadges />
    
    <HowItWorks />
    
    <WhyChooseUs vertical={vertical.id} />
    
    <FAQ 
      faqs={faqItems} 
      city={cityData.name} 
      vertical={vertical.id}
    />
    
    <ServiceAreas 
      state={stateData.name} 
      stateAbbr={stateData.abbreviation}
      cities={nearbyCities.map(c => c.name)} 
      vertical={vertical.id}
    />
    
    <FinalCTA 
      phone={brand.phone} 
      headline={`Get ${serviceData.name} in ${cityData.name} Today`}
      subheadline="Free quotes from licensed, insured professionals. No obligation."
    />
  </main>
  
  <Footer phone={brand.phone} />
  
  <LocalSchema 
    businessName={`${cityData.name} ${vertical.name} Pros`}
    city={cityData.name}
    state={stateData.name}
    stateAbbr={stateData.abbreviation}
    vertical={vertical.id}
    service={serviceSlug}
    phone={brand.phone}
  />
</BaseLayout>
```

10. Create `apps/hvac/src/pages/index.astro`:

```astro
---
import BaseLayout from '@shared/layouts/BaseLayout.astro';
import Header from '@shared/components/Header.astro';
import Footer from '@shared/components/Footer.astro';
import { brand } from '../config/brand';
import { vertical } from '../config/vertical';
import { getEnabledStates, getCitiesByState } from '@shared/config/geo';

const states = getEnabledStates();
---

<BaseLayout 
  title={`${brand.name} | Professional ${vertical.name} Services`}
  description={`Find trusted ${vertical.name.toLowerCase()} professionals in your area. Free quotes, licensed contractors, fast service.`}
>
  <Header phone={brand.phone} />
  
  <main class="flex-1">
    <section class="bg-gradient-to-br from-blue-600 to-blue-800 text-white py-20">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">{brand.name}</h1>
        <p class="text-xl md:text-2xl mb-8">{brand.tagline}</p>
        <a 
          href={`tel:${brand.phoneRaw}`}
          class="inline-block bg-orange-500 hover:bg-orange-600 text-white font-bold py-4 px-8 rounded-lg text-xl transition-colors"
        >
          Call Now: {brand.phone}
        </a>
      </div>
    </section>
    
    <section class="py-16">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Service Areas</h2>
        
        {states.map(state => {
          const cities = getCitiesByState(state.slug);
          return (
            <div class="mb-12">
              <h3 class="text-2xl font-semibold mb-4">{state.name}</h3>
              <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {cities.slice(0, 12).map(city => (
                  <a 
                    href={`/${state.slug}/${city.slug}/ac-repair`}
                    class="text-blue-600 hover:text-blue-800 hover:underline"
                  >
                    {city.name}
                  </a>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </section>
  </main>
  
  <Footer phone={brand.phone} />
</BaseLayout>
```

11. Create `apps/hvac/src/pages/404.astro`:

```astro
---
import BaseLayout from '@shared/layouts/BaseLayout.astro';
import Header from '@shared/components/Header.astro';
import Footer from '@shared/components/Footer.astro';
import { brand } from '../config/brand';
---

<BaseLayout title={`Page Not Found | ${brand.name}`} noIndex={true}>
  <Header phone={brand.phone} />
  
  <main class="flex-1 flex items-center justify-center py-20">
    <div class="text-center">
      <h1 class="text-6xl font-bold text-gray-300 mb-4">404</h1>
      <h2 class="text-2xl font-semibold mb-4">Page Not Found</h2>
      <p class="text-gray-600 mb-8">The page you're looking for doesn't exist or has been moved.</p>
      <a 
        href="/"
        class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg transition-colors"
      >
        Go Home
      </a>
    </div>
  </main>
  
  <Footer phone={brand.phone} />
</BaseLayout>
```

12. Copy API routes from original `src/pages/api/` to `apps/hvac/src/pages/api/`:
    - `leads.ts`
    - `calls.ts`
    - `health.ts`

    Update imports to use `@shared/lib/...` paths.

---

### Step 4: Create apps/plumbing

Duplicate the entire `apps/hvac/` directory to `apps/plumbing/`.

Then modify these files:

1. `apps/plumbing/package.json` - Change name to `@leadgen/plumbing`

2. `apps/plumbing/astro.config.mjs` - Change site URL:
```javascript
site: 'https://yourplumbingdomain.com', // UPDATE THIS
```

3. `apps/plumbing/src/config/vertical.ts`:
```typescript
export const vertical = {
  id: 'plumbing' as const,
  name: 'Plumbing',
  slug: 'plumbing',
  description: 'Professional Plumbing Services',
};

export const services: Service[] = [
  { id: 'drain-cleaning', name: 'Drain Cleaning', slug: 'drain-cleaning', vertical: 'plumbing' },
  { id: 'leak-repair', name: 'Leak Repair', slug: 'leak-repair', vertical: 'plumbing' },
  { id: 'pipe-repair', name: 'Pipe Repair', slug: 'pipe-repair', vertical: 'plumbing' },
  { id: 'water-heater-repair', name: 'Water Heater Repair', slug: 'water-heater-repair', vertical: 'plumbing' },
  { id: 'water-heater-installation', name: 'Water Heater Installation', slug: 'water-heater-installation', vertical: 'plumbing' },
  { id: 'toilet-repair', name: 'Toilet Repair', slug: 'toilet-repair', vertical: 'plumbing' },
  { id: 'faucet-repair', name: 'Faucet Repair', slug: 'faucet-repair', vertical: 'plumbing' },
  { id: 'sewer-line-repair', name: 'Sewer Line Repair', slug: 'sewer-line-repair', vertical: 'plumbing' },
  { id: 'garbage-disposal', name: 'Garbage Disposal', slug: 'garbage-disposal', vertical: 'plumbing' },
  { id: 'sump-pump', name: 'Sump Pump Service', slug: 'sump-pump', vertical: 'plumbing' },
  { id: 'emergency-plumbing', name: 'Emergency Plumbing', slug: 'emergency-plumbing', vertical: 'plumbing' },
];
// ... rest of helper functions same as HVAC
```

4. `apps/plumbing/src/config/brand.ts`:
```typescript
export const brand = {
  name: 'YourPlumbingBrand',  // UPDATE THIS
  legalName: 'YourPlumbingBrand LLC',
  tagline: 'Fast, Reliable Plumbing Service',
  phone: '(813) 555-2345',    // UPDATE THIS
  phoneRaw: '8135552345',
  email: 'info@yourplumbingbrand.com',
  domain: 'yourplumbingbrand.com',
  
  colors: {
    primary: '#0891b2',    // Cyan/teal
    secondary: '#0e7490',
    accent: '#f97316',
    background: '#ffffff',
    text: '#1f2937',
  },
  
  social: {
    facebook: '',
    instagram: '',
    twitter: '',
    youtube: '',
  },
};
```

---

### Step 5: Create apps/roofing

Duplicate the entire `apps/hvac/` directory to `apps/roofing/`.

Then modify these files:

1. `apps/roofing/package.json` - Change name to `@leadgen/roofing`

2. `apps/roofing/astro.config.mjs` - Change site URL:
```javascript
site: 'https://yourroofingdomain.com', // UPDATE THIS
```

3. `apps/roofing/src/config/vertical.ts`:
```typescript
export const vertical = {
  id: 'roofing' as const,
  name: 'Roofing',
  slug: 'roofing',
  description: 'Professional Roofing Services',
};

export const services: Service[] = [
  { id: 'roof-repair', name: 'Roof Repair', slug: 'roof-repair', vertical: 'roofing' },
  { id: 'roof-replacement', name: 'Roof Replacement', slug: 'roof-replacement', vertical: 'roofing' },
  { id: 'roof-inspection', name: 'Roof Inspection', slug: 'roof-inspection', vertical: 'roofing' },
  { id: 'shingle-repair', name: 'Shingle Repair', slug: 'shingle-repair', vertical: 'roofing' },
  { id: 'metal-roofing', name: 'Metal Roofing', slug: 'metal-roofing', vertical: 'roofing' },
  { id: 'flat-roof-repair', name: 'Flat Roof Repair', slug: 'flat-roof-repair', vertical: 'roofing' },
  { id: 'roof-leak-repair', name: 'Roof Leak Repair', slug: 'roof-leak-repair', vertical: 'roofing' },
  { id: 'gutter-installation', name: 'Gutter Installation', slug: 'gutter-installation', vertical: 'roofing' },
  { id: 'gutter-repair', name: 'Gutter Repair', slug: 'gutter-repair', vertical: 'roofing' },
  { id: 'storm-damage', name: 'Storm Damage Repair', slug: 'storm-damage', vertical: 'roofing' },
  { id: 'emergency-roofing', name: 'Emergency Roofing', slug: 'emergency-roofing', vertical: 'roofing' },
];
// ... rest of helper functions same as HVAC
```

4. `apps/roofing/src/config/brand.ts`:
```typescript
export const brand = {
  name: 'YourRoofingBrand',  // UPDATE THIS
  legalName: 'YourRoofingBrand LLC',
  tagline: 'Trusted Roofing Professionals',
  phone: '(813) 555-3456',    // UPDATE THIS
  phoneRaw: '8135553456',
  email: 'info@yourroofingbrand.com',
  domain: 'yourroofingbrand.com',
  
  colors: {
    primary: '#dc2626',    // Red
    secondary: '#b91c1c',
    accent: '#f97316',
    background: '#ffffff',
    text: '#1f2937',
  },
  
  social: {
    facebook: '',
    instagram: '',
    twitter: '',
    youtube: '',
  },
};
```

---

### Step 6: Create root tsconfig.base.json

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "jsx": "react-jsx",
    "jsxImportSource": "react",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true
  }
}
```

---

### Step 7: Update shared component imports

In ALL shared components (`packages/shared/src/components/*.astro`), update any imports to use relative paths within the package:

Example - if a component imports from lib:
```astro
// BEFORE
import { supabase } from '@lib/supabase';

// AFTER
import { supabase } from '../lib/supabase';
```

Example - if a component imports from another component:
```astro
// BEFORE
import Button from '@components/Button.astro';

// AFTER
import Button from './Button.astro';
```

---

### Step 8: Update LeadForm.tsx and other React components

Update imports in React components to use relative paths:

```tsx
// BEFORE
import { validatePhone } from '@lib/validation';

// AFTER  
import { validatePhone } from '../lib/validation';
```

---

## Verification Checklist

After completing the restructure, verify:

- [ ] `pnpm install` works from root directory
- [ ] `pnpm dev:hvac` starts HVAC app on localhost:4321
- [ ] `pnpm dev:plumbing` starts Plumbing app on localhost:4321
- [ ] `pnpm dev:roofing` starts Roofing app on localhost:4321
- [ ] HVAC app only shows HVAC services in routes (no plumbing/roofing)
- [ ] Plumbing app only shows plumbing services
- [ ] Roofing app only shows roofing services
- [ ] Shared components render correctly in all apps
- [ ] Lead form submits work (check network tab)
- [ ] `pnpm build:hvac` builds successfully
- [ ] `pnpm build:plumbing` builds successfully
- [ ] `pnpm build:roofing` builds successfully

---

## DO NOT

- Do NOT delete the original src/ files until the restructure is verified working
- Do NOT modify the supabase/ directory structure
- Do NOT change the database schema or API contracts
- Do NOT rename environment variables (just copy them to app-specific .env files)
- Do NOT change the component props interfaces (they already accept vertical as a prop)

---

## Route Change Summary

| Before | After |
|--------|-------|
| `/fl/tampa/hvac/ac-repair` | `/fl/tampa/ac-repair` (on getquickcool.com) |
| `/fl/tampa/plumbing/drain-cleaning` | `/fl/tampa/drain-cleaning` (on plumbing domain) |
| `/fl/tampa/roofing/roof-repair` | `/fl/tampa/roof-repair` (on roofing domain) |

The vertical is now implicit based on which domain the user is visiting.

---

## After Restructure: Deployment Setup

Each app deploys to its own Netlify site:

1. Create 3 Netlify sites (one per vertical)
2. Point each site to its app directory: `apps/hvac`, `apps/plumbing`, `apps/roofing`
3. Set build command: `cd ../.. && pnpm build:hvac` (adjust per app)
4. Set publish directory: `apps/hvac/dist` (adjust per app)
5. Configure environment variables per site
6. Connect custom domains