# Tampa, FL - SEO/GEO City Page Implementation Plan
## Trial City for CoolIt HVAC Landing Page Optimization

---

## OVERVIEW

This document serves as the working implementation plan for Tampa, Florida - our trial city before full sitewide rollout. Data will be stored in the new normalized schema:

- `cities` → Core Tampa identifiers
- `city_research` → Demographics, climate, utilities, competitors
- `neighborhoods` → Tampa neighborhoods with characteristics
- `city_seo_content` → Generated HVAC page content

**Target URL:** `/fl/tampa/hvac`
**Brand:** CoolIt
**Target Word Count:** 800-1200 words
**Unique Content Goal:** 60%+ unique to Tampa

---

## PHASE 1: CITIES TABLE DATA

```sql
INSERT INTO cities (
  name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids,
  is_active, priority
) VALUES (
  'Tampa',
  'tampa',
  'Florida',
  'FL',
  'Hillsborough',
  'hillsborough-county',
  [LATITUDE],        -- TO RESEARCH
  [LONGITUDE],       -- TO RESEARCH
  ARRAY['33601', '33602', '33603', '33604', '33605', '33606', '33607', '33609', '33610', '33611', '33612', '33613', '33614', '33615', '33616', '33617', '33618', '33619', '33620', '33621', '33624', '33625', '33626', '33629', '33634', '33635', '33637', '33647'],
  'Tampa Bay',
  NULL,  -- Will update after other cities are inserted
  true,
  100    -- High priority for trial
);
```

---

## PHASE 2: CITY_RESEARCH DATA

### 2.1 Demographics (TO RESEARCH)

| Field | Value | Source |
|-------|-------|--------|
| population | [TO RESEARCH] | US Census |
| population_source | 'US Census Bureau 2023' | |
| median_household_income | [TO RESEARCH] | Census ACS |
| median_home_value | [TO RESEARCH] | Zillow/Census |
| homeownership_rate | [TO RESEARCH] | Census |
| primary_housing_types | ['single-family', 'condo', 'townhome'] | |
| housing_construction_eras | [TO RESEARCH] | County Appraiser |

### 2.2 Climate Data (TO RESEARCH)

| Field | Value | Source |
|-------|-------|--------|
| avg_summer_high_f | [TO RESEARCH] | NOAA |
| avg_winter_low_f | [TO RESEARCH] | NOAA |
| avg_humidity_percent | [TO RESEARCH] | Weather.gov |
| annual_cooling_degree_days | [TO RESEARCH] | EIA |
| days_above_90f | [TO RESEARCH] | NOAA |
| annual_rainfall_inches | [TO RESEARCH] | NOAA |
| hurricane_risk_level | 'high' | NOAA |
| climate_notes | [TO RESEARCH] | |

### 2.3 Local Context (TO RESEARCH)

| Field | Value |
|-------|-------|
| major_employers | [TO RESEARCH] |
| notable_landmarks | [TO RESEARCH] |
| local_events | [TO RESEARCH] |
| school_districts | [TO RESEARCH] |
| recent_developments | [TO RESEARCH] |

### 2.4 Utilities & Rebates (TO RESEARCH)

| Field | Value | Source |
|-------|-------|--------|
| electric_utility | 'Tampa Electric (TECO)' | |
| electric_utility_rebates | [TO RESEARCH TECO programs] | TECO website |
| gas_utility | [TO RESEARCH] | |
| water_utility | [TO RESEARCH] | |
| water_hardness_ppm | [TO RESEARCH] | |

### 2.5 Building/Codes

| Field | Value |
|-------|-------|
| local_building_codes | [TO RESEARCH] |
| permit_requirements | [TO RESEARCH] |
| hoa_prevalence | [TO RESEARCH] |

### 2.6 Competitive Landscape (TO RESEARCH)

| Field | Value |
|-------|-------|
| top_hvac_competitors | [TO RESEARCH - top 5-7 Tampa HVAC companies] |

### 2.7 Research Sources JSONB

```json
{
  "population": "US Census Bureau 2023",
  "climate": "NOAA National Weather Service",
  "housing": "Zillow Research, Hillsborough County Property Appraiser",
  "utilities": "Tampa Electric Company (TECO)",
  "demographics": "US Census American Community Survey 2022"
}
```

---

## PHASE 3: NEIGHBORHOODS DATA

### Tampa Neighborhoods to Research and Insert

| Region | Neighborhoods to Include |
|--------|-------------------------|
| **South Tampa** | Hyde Park, Palma Ceia, Davis Islands, Bayshore, Beach Park, Ballast Point |
| **North Tampa** | Carrollwood, Northdale, Lake Magdalene, Temple Terrace, USF Area |
| **Central/Downtown** | Downtown Tampa, Ybor City, Channel District, Harbour Island |
| **West Tampa** | Westshore, Town 'n' Country, Westchase |
| **East Tampa** | Brandon (nearby), Riverview, Seffner |
| **Historic** | Seminole Heights, Tampa Heights, Riverside Heights |

Each neighborhood needs:
- `name`, `slug`, `region`
- `housing_type` (single-family, mixed, condo)
- `avg_home_age` (e.g., "1920s bungalows", "1980s construction")
- `income_level` (upper, middle, mixed)
- `notable_features` (Historic district, Waterfront, etc.)
- `common_hvac_issues` (older ductwork, humidity issues, etc.)
- `is_featured` (true for hero section mentions)

---

## PHASE 4: CITY_SEO_CONTENT STRUCTURE

### 4.1 Page Metadata

```json
{
  "vertical": "hvac",
  "slug": "/fl/tampa/hvac",
  "title": "HVAC Repair & AC Service in Tampa, FL | CoolIt",
  "meta_description": "24/7 HVAC repair in Tampa, FL. Same-day AC service, upfront pricing. Trusted by Tampa Bay homeowners. Call now for a free estimate.",
  "primary_keyword": "HVAC repair Tampa FL",
  "secondary_keywords": [
    "AC repair Tampa",
    "air conditioning service Tampa",
    "HVAC contractor Tampa FL",
    "emergency AC repair Tampa",
    "AC replacement Tampa",
    "heating repair Tampa"
  ]
}
```

### 4.2 Content Sections

**hero_h1**: Include Tampa + primary service (50-70 chars)

**hero_subheadline**: Reference Tampa-specific climate stat (100-150 chars)

**hero_trust_bar**: Local trust signal

**intro_paragraph**: 150-200 words with:
- Tampa-specific pain point hook
- 2+ neighborhood names
- Climate statistic
- Subtle CTA

**why_choose_us** JSONB:
```json
[
  {
    "title": "60-Minute Response Across Tampa Bay",
    "content": "[Generated content about response times]",
    "local_reference": "From Westchase to Brandon"
  },
  {
    "title": "Tampa's Humidity Experts",
    "content": "[Generated content about humidity control]",
    "local_reference": "Tampa's 75% average humidity"
  },
  {
    "title": "Upfront Pricing, No Surprises",
    "content": "[Generated content about pricing]",
    "local_reference": "Tampa cost of living context"
  },
  {
    "title": "Licensed & TECO Rebate Certified",
    "content": "[Generated content about credentials]",
    "local_reference": "TECO rebate programs"
  }
]
```

**local_challenges** JSONB:
```json
[
  {
    "title": "Humidity Control in Tampa's Subtropical Climate",
    "problem": "[Description of humidity issues]",
    "why_here": "[Tampa-specific humidity stats]",
    "solution": "[Brief solution mention]"
  },
  {
    "title": "Aging AC Systems in Established Neighborhoods",
    "problem": "[Description of older system issues]",
    "why_here": "[Tampa housing age data]",
    "solution": "[Brief solution mention]"
  },
  {
    "title": "Hurricane Season AC Preparation",
    "problem": "[Description of storm-related issues]",
    "why_here": "[Tampa hurricane frequency]",
    "solution": "[Brief solution mention]"
  }
]
```

**services** JSONB:
```json
[
  {"name": "AC Repair & Emergency Service", "description": "...", "local_context": "..."},
  {"name": "AC Installation & Replacement", "description": "...", "local_context": "TECO rebates, SEER2 requirements"},
  {"name": "Heating Services", "description": "...", "local_context": "Tampa's mild winters"},
  {"name": "Maintenance & Tune-Ups", "description": "...", "local_context": "Pre-summer timing"},
  {"name": "Indoor Air Quality", "description": "...", "local_context": "Tampa humidity and mold"},
  {"name": "Ductwork Services", "description": "...", "local_context": "Older Tampa homes"}
]
```

**faq_content** JSONB:
```json
[
  {"question": "How much does AC repair cost in Tampa?", "answer": "...", "is_local_specific": true},
  {"question": "Do you offer 24/7 emergency AC repair in Tampa?", "answer": "...", "is_local_specific": true},
  {"question": "Why does my AC struggle with Tampa's humidity?", "answer": "...", "is_local_specific": true},
  {"question": "Are there utility rebates for AC replacement in Tampa?", "answer": "...", "is_local_specific": true},
  {"question": "When should I schedule AC maintenance in Tampa?", "answer": "...", "is_local_specific": true},
  {"question": "What SEER rating do I need for a Tampa home?", "answer": "...", "is_local_specific": true}
]
```

**stats_callout** JSONB:
```json
{
  "avg_summer_high": "[FROM RESEARCH]°F",
  "avg_humidity": "[FROM RESEARCH]%",
  "days_above_90": "[FROM RESEARCH] days/year",
  "most_common_ac_issue": "[FROM RESEARCH]",
  "avg_home_age": "[FROM RESEARCH]",
  "local_utility": "Tampa Electric (TECO)",
  "rebates_available": "Yes - up to $[X] for qualifying systems"
}
```

### 4.3 Schema Markup

**schema_local_business** JSONB:
```json
{
  "@context": "https://schema.org",
  "@type": "HVACBusiness",
  "name": "CoolIt",
  "description": "24/7 HVAC repair and AC service in Tampa, FL. Trusted by Tampa Bay homeowners for fast, reliable cooling solutions.",
  "url": "https://[DOMAIN]/fl/tampa/hvac",
  "telephone": "[TRACKING_NUMBER]",
  "areaServed": {
    "@type": "City",
    "name": "Tampa",
    "containedInPlace": {
      "@type": "State",
      "name": "Florida"
    }
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "[FROM RESEARCH]",
    "longitude": "[FROM RESEARCH]"
  },
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
    "opens": "00:00",
    "closes": "23:59"
  },
  "priceRange": "$$"
}
```

### 4.4 Internal Linking

```json
{
  "county_hub_link": "/fl/hillsborough-county/hvac",
  "sibling_city_links": [
    {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg HVAC services"},
    {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC repair"},
    {"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC contractors"}
  ],
  "service_page_links": [
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/heating", "anchor_text": "heating repair"}
  ]
}
```

---

## PHASE 5: QUALITY CHECKLIST

### Pre-Publication Review

- [ ] City name appears 10-15 times naturally
- [ ] At least 5 specific Tampa neighborhoods mentioned by name
- [ ] At least 3 local statistics cited (climate, demographics, housing)
- [ ] Zero banned phrases used
- [ ] Each section contains unique Tampa context
- [ ] Word count is 800-1200 words total
- [ ] All research findings incorporated
- [ ] Content could NOT be used for any other city without major rewrites
- [ ] FAQs include at least 3 Tampa-specific questions
- [ ] Nearby cities mentioned for internal linking

### GEO Optimization Checklist

- [ ] Citations to credible sources in research_sources
- [ ] Statistics and quantitative data present
- [ ] Direct, confident statements (no hedging)
- [ ] Q&A formatting in FAQs (sub-300 char answers)
- [ ] E-E-A-T signals present

---

## EXECUTION STATUS

| Phase | Status | Notes |
|-------|--------|-------|
| Phase 1: Cities table insert | NOT STARTED | Need coordinates |
| Phase 2: City research | NOT STARTED | Web research required |
| Phase 3: Neighborhoods | NOT STARTED | ~20-25 neighborhoods |
| Phase 4: SEO content generation | NOT STARTED | After research complete |
| Phase 5: Quality review | NOT STARTED | Final check |

---

## NEXT STEP

Execute web research to populate all [TO RESEARCH] fields, then generate SQL INSERT statements for each table.

---

*Document Created: December 24, 2024*
*Schema Version: 005_city_seo_tables.sql*
