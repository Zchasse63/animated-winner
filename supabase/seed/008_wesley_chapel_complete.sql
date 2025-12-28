-- ============================================
-- Wesley Chapel, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Wesley Chapel Core Data
-- ============================================

INSERT INTO cities (
  id,
  name,
  slug,
  state,
  state_abbrev,
  county,
  county_slug,
  latitude,
  longitude,
  zip_codes,
  metro_area,
  nearby_city_ids,
  is_active,
  priority
) VALUES (
  'a7b8c9d0-e1f2-3456-0123-789012345678', -- Fixed UUID for Wesley Chapel
  'Wesley Chapel',
  'wesley-chapel',
  'Florida',
  'FL',
  'Pasco',
  'pasco-county',
  28.2397,
  -82.3275,
  ARRAY['33543', '33544', '33545', '33559'],
  'Tampa Bay',
  ARRAY[
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890'  -- Tampa
  ]::uuid[],
  true,
  87
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Wesley Chapel Research Data
-- ============================================

INSERT INTO city_research (
  city_id,
  researched_at,

  -- Demographics
  population,
  population_source,
  median_household_income,
  median_home_value,
  homeownership_rate,
  primary_housing_types,
  housing_construction_eras,

  -- Climate
  avg_summer_high_f,
  avg_winter_low_f,
  avg_humidity_percent,
  annual_cooling_degree_days,
  days_above_90f,
  annual_rainfall_inches,
  hurricane_risk_level,
  climate_notes,

  -- Local Context
  major_employers,
  notable_landmarks,
  local_events,
  school_districts,
  recent_developments,

  -- Utilities & Rebates
  electric_utility,
  electric_utility_rebates,
  gas_utility,
  water_utility,
  water_hardness_ppm,

  -- Building/Codes
  local_building_codes,
  permit_requirements,
  hoa_prevalence,

  -- Competitive Landscape
  top_hvac_competitors,

  -- Source Tracking
  research_sources
) VALUES (
  'a7b8c9d0-e1f2-3456-0123-789012345678', -- Wesley Chapel city_id
  NOW(),

  -- Demographics
  93700,
  'US Census Bureau American Community Survey 2023 with 2024 projections',
  107004,
  368600,
  76.6,
  ARRAY['single-family', 'townhouse', 'new-construction', 'luxury-home'],
  '{"pre-2000": 10, "2000s": 25, "2010s": 35, "2020s": 30}'::jsonb,

  -- Climate
  92,
  51,
  72,
  3500,
  100,
  54.2,
  'moderate',
  'Humid subtropical climate with hot, humid summers. Slightly inland location results in higher summer temperatures than coastal areas. Afternoon thunderstorms common in summer months. Hurricane risk moderate but still significant.',

  -- Local Context
  ARRAY['Florida Hospital Wesley Chapel', 'Pasco County Schools', 'Tampa Premium Outlets', 'Wiregrass Ranch businesses', 'The Grove at Wesley Chapel', 'Epperson Lagoon', 'Amazon Fulfillment', 'Medical facilities along SR-56', 'Publix Regional', 'Saddlebrook Resort'],
  ARRAY['The Shops at Wiregrass', 'Tampa Premium Outlets', 'Epperson Lagoon', 'Seven Oaks Sports Club', 'Saddlebrook Resort', 'Wesley Chapel District Park', 'Meadow Pointe Clubhouse', 'The Grove at Wesley Chapel', 'Florida Hospital Wesley Chapel'],
  ARRAY['Wesley Chapel Festival', 'Trick or Treat at The Shops at Wiregrass', 'Holiday celebrations at Epperson', 'Seven Oaks community events', 'Meadow Pointe Pool parties', 'Food Truck Thursdays'],
  ARRAY['Pasco County Schools'],
  'Explosive growth continues with new master-planned communities. Epperson with Florida''s first crystal lagoon. The Grove mixed-use development. Continued expansion along SR-56 corridor. New medical facilities and retail centers.',

  -- Utilities & Rebates
  'Withlacoochee River Electric Cooperative (WREC)',
  '{
    "ac_replacement": {
      "amount": 350,
      "requirements": "High-efficiency system meeting WREC standards",
      "notes": "Member-owned cooperative with competitive rates"
    },
    "heat_pump": {
      "amount": 500,
      "requirements": "Qualifying heat pump system installation"
    },
    "programmable_thermostat": {
      "amount": 50,
      "requirements": "ENERGY STAR certified thermostat"
    },
    "energy_audit": {
      "amount": "Free",
      "requirements": "Available to all WREC members"
    },
    "total_available": {
      "amount": 1500,
      "requirements": "Combined energy efficiency rebates through WREC"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'Pasco County Utilities',
  250,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), Pasco County amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "hoa_approval": "Nearly all communities require HOA approval"
  }'::jsonb,
  'extremely high',

  -- Competitive Landscape
  ARRAY['Comfort Temp', 'One Hour Heating & Air', 'A/C Warehouse', 'Easy A/C', 'Cornerstone Pros'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, World Population Review 2024",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Withlacoochee River Electric Cooperative website",
    "employers": "Pasco County Economic Development Council",
    "research_date": "2024-12-26"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  electric_utility_rebates = EXCLUDED.electric_utility_rebates,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Wesley Chapel Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Seven Oaks
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Seven Oaks', 'seven-oaks', 'South', 'single-family', '2000s-2010s', 'Upper middle income', 'Master-planned with sports complex and amenities', ARRAY['large home zoning', 'sports club humidity', 'multi-zone requirements', 'smart home integration'], '8-18 years', 1, true),
  -- Meadow Pointe
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Meadow Pointe', 'meadow-pointe', 'Central', 'mixed', '1990s-2000s', 'Middle income', 'One of first Wesley Chapel communities', ARRAY['1990s era system replacements', 'conservation area humidity', 'townhome HVAC', 'pool area dehumidification'], '15-28 years', 2, true),
  -- Epperson
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Epperson', 'epperson', 'East', 'single-family', '2010s-2020s', 'Upper middle income', 'Crystal lagoon community with modern homes', ARRAY['lagoon proximity humidity', 'new construction systems', 'smart home ready', 'energy code compliance'], '2-10 years', 3, true),
  -- Wiregrass Ranch
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Wiregrass Ranch', 'wiregrass-ranch', 'West', 'single-family', '2010s-2020s', 'Upper income', 'Premium development near Wiregrass Mall', ARRAY['premium system demands', 'large square footage', 'multi-story cooling', 'home theater climate control'], '3-12 years', 4, false),
  -- Saddlebrook
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Saddlebrook', 'saddlebrook', 'North', 'mixed', '1980s-2000s', 'Upper middle income', 'Golf and tennis resort community', ARRAY['resort area systems', 'golf course humidity', 'villa HVAC', 'vacation rental demands'], '12-35 years', 5, false),
  -- The Ridge
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'The Ridge', 'the-ridge', 'East', 'single-family', '2010s-2020s', 'Upper middle income', 'Elevated terrain newer development', ARRAY['newer construction', 'elevation considerations', 'premium efficiency needs', 'whole-home automation'], '3-12 years', 6, false),
  -- Lexington Oaks
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Lexington Oaks', 'lexington-oaks', 'South', 'single-family', '2000s-2010s', 'Middle income', 'Golf community with mature landscaping', ARRAY['golf community humidity', 'mature tree shading', 'system aging from 2000s builds', 'efficiency upgrades'], '10-20 years', 7, false),
  -- Bridgewater
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Bridgewater', 'bridgewater', 'Central', 'single-family', '2000s-2010s', 'Middle income', 'Family-oriented with water features', ARRAY['water feature humidity', 'HOA equipment standards', 'family home sizing', 'ductwork in Florida rooms'], '10-18 years', 8, false),
  -- Estancia at Wiregrass
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Estancia at Wiregrass', 'estancia-wiregrass', 'West', 'townhouse', '2010s-2020s', 'Middle income', 'Modern townhome community near shopping', ARRAY['townhome HVAC limitations', 'shared wall noise concerns', 'compact equipment needs', 'patio unit placement'], '3-12 years', 9, false),
  -- Watergrass
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Watergrass', 'watergrass', 'Northeast', 'single-family', '2010s-2020s', 'Upper income', 'Luxury community near nature preserves', ARRAY['luxury home demands', 'preserve humidity', 'outdoor living climate', 'whole-home solutions'], '2-10 years', 10, false),
  -- Connerton
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Connerton', 'connerton', 'North', 'single-family', '2010s-2020s', 'Middle income', 'Active lifestyle community with trails', ARRAY['newer build systems', 'builder warranty issues', 'smart thermostat setup', 'Florida room additions'], '3-12 years', 11, false),
  -- Quail Hollow
  ('a7b8c9d0-e1f2-3456-0123-789012345678', 'Quail Hollow', 'quail-hollow', 'South', 'single-family', '1990s-2000s', 'Moderate income', 'Established community with affordable homes', ARRAY['established home updates', 'older system replacements', 'duct cleaning needs', 'efficiency improvements'], '18-30 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Wesley Chapel HVAC Content
-- ============================================

INSERT INTO city_seo_content (
  city_id,
  vertical,
  slug,
  title,
  meta_description,
  primary_keyword,
  secondary_keywords,

  hero_h1,
  hero_subheadline,
  hero_trust_bar,
  intro_paragraph,

  why_choose_us,
  local_challenges,
  services,
  faq_content,
  stats_callout,

  final_cta_headline,
  final_cta_body,

  schema_local_business,
  schema_faq_page,
  schema_breadcrumb,

  county_hub_link,
  sibling_city_links,
  service_page_links,

  word_count,
  city_mention_count,
  neighborhood_mention_count,
  unique_content_score,

  status,
  version,
  generated_by,
  generation_prompt_version
) VALUES (
  'a7b8c9d0-e1f2-3456-0123-789012345678',
  'hvac',
  '/fl/wesley-chapel/hvac',
  'HVAC Services in Wesley Chapel, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Wesley Chapel''s 90,000+ residents. WREC utility rebates available. Serving Seven Oaks, Meadow Pointe, Epperson & all master-planned communities.',
  'HVAC Wesley Chapel FL',
  ARRAY['AC repair Wesley Chapel', 'air conditioning Wesley Chapel FL', 'HVAC contractor Wesley Chapel', 'Seven Oaks HVAC', 'WREC rebates', 'Pasco County HVAC'],

  'Wesley Chapel''s HVAC Experts',
  'Serving Florida''s fastest-growing community since 2005',
  'Licensed & Insured | WREC Certified | Same-Day Service',
  'Wesley Chapel represents the best of Florida living—beautiful master-planned communities, top-rated schools, and household incomes well above the state average. With over 50 distinct neighborhoods and median home values approaching $370,000, Wesley Chapel homeowners expect premium service. Our team specializes in the unique needs of this rapidly growing area, from the crystal lagoon community of Epperson to the established luxury of Seven Oaks. We''re certified with Withlacoochee River Electric Cooperative (WREC) to help you access available rebates and keep your home comfortable year-round.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Wesley Chapel Homeowners Choose Us",
    "reasons": [
      {
        "title": "WREC Rebate Certified",
        "description": "As WREC members, Wesley Chapel homeowners qualify for up to $500 in heat pump rebates and $350 for AC systems. We handle all cooperative paperwork and ensure you receive every available incentive."
      },
      {
        "title": "Master-Planned Community Specialists",
        "description": "From Seven Oaks to Epperson, we work with over 50 Wesley Chapel HOAs. We understand equipment placement rules, noise ordinances, and aesthetic requirements across all communities."
      },
      {
        "title": "New Construction Expertise",
        "description": "With 65% of Wesley Chapel homes built since 2010, we specialize in upgrading builder-grade systems, honoring warranties, and optimizing new home HVAC performance."
      },
      {
        "title": "Premium Home Solutions",
        "description": "Wesley Chapel''s larger homes—many exceeding 3,000 square feet—require sophisticated multi-zone systems. We design custom solutions that deliver consistent comfort throughout your home."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Wesley Chapel",
    "intro": "Wesley Chapel''s location and rapid development create specific demands on cooling systems:",
    "challenges": [
      {
        "title": "Intense Summer Heat",
        "description": "Wesley Chapel''s inland location means summer highs reach 92°F regularly—among the hottest in Tampa Bay. Your system works harder here, requiring robust equipment rated for extreme conditions."
      },
      {
        "title": "HOA Equipment Standards",
        "description": "Nearly every Wesley Chapel community has specific HVAC requirements—equipment placement, screening, noise levels, and approved manufacturers. We navigate these daily."
      },
      {
        "title": "Larger Home Challenges",
        "description": "With median home values near $370,000 and many homes exceeding 3,000 square feet, single-zone systems often struggle. Multi-zone solutions are frequently the answer."
      },
      {
        "title": "New Construction Issues",
        "description": "Many Wesley Chapel homes have builder-grade equipment that underperforms. We specialize in identifying and upgrading these systems while protecting your warranty."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Wesley Chapel",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, expert AC repairs throughout Wesley Chapel. We stock common parts for same-day fixes and service all major brands.",
        "features": ["Same-day service available", "All brands serviced", "90-day repair warranty", "Upfront pricing"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Premium AC installations with Manual J load calculations. We properly size systems for Wesley Chapel''s demanding climate and your home''s specific requirements.",
        "features": ["Manual J calculations", "WREC rebate up to $350", "Up to 22 SEER2 efficiency", "10-year warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps provide efficient year-round comfort in Wesley Chapel''s climate. WREC offers up to $500 in rebates for qualifying installations.",
        "features": ["$500 WREC rebate available", "Year-round efficiency", "Lower operating costs", "Quiet operation"]
      },
      {
        "name": "Multi-Zone Systems",
        "slug": "zoning",
        "description": "Essential for Wesley Chapel''s larger homes. Zoned systems deliver customized comfort to each area while dramatically reducing energy waste.",
        "features": ["Room-by-room control", "20-30% energy savings", "Ideal for 2-story homes", "Smart thermostat compatible"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "New construction homes are built tight, trapping pollutants inside. Our IAQ solutions ensure healthy air throughout your Wesley Chapel home.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Fresh air ventilation"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with bi-annual maintenance. Critical for maintaining warranty coverage and preventing expensive breakdowns.",
        "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Warranty protection"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "What utility rebates are available for Wesley Chapel homeowners?",
        "answer": "Withlacoochee River Electric Cooperative (WREC) offers up to $500 for heat pump installations, $350 for high-efficiency AC systems, and $50 for programmable thermostats. They also provide free energy audits for members."
      },
      {
        "question": "How do I handle HOA approval for new HVAC equipment?",
        "answer": "We''re familiar with Wesley Chapel''s many HOA requirements and can help you prepare the necessary documentation. Most communities require approval for outdoor unit placement and sometimes equipment screening."
      },
      {
        "question": "What size AC system do I need for my Wesley Chapel home?",
        "answer": "Wesley Chapel homes are larger than average—we use Manual J load calculations to properly size your system. For a typical 2,500 sq ft home in our climate, expect a 4-5 ton system, but every home is different."
      },
      {
        "question": "Should I upgrade my builder-grade HVAC system?",
        "answer": "Many Wesley Chapel homes came with 14 SEER builder systems. Upgrading to 16-18 SEER can reduce cooling costs 20-30% and often qualifies for WREC rebates that offset the investment."
      },
      {
        "question": "Why is my new Wesley Chapel home so humid inside?",
        "answer": "Modern energy-efficient homes are built extremely tight, which can trap humidity. This is common in newer Wesley Chapel communities. A whole-home dehumidifier integrated with your HVAC system is often the best solution."
      },
      {
        "question": "Do you service Seven Oaks and Epperson areas?",
        "answer": "Absolutely. We serve all Wesley Chapel communities including Seven Oaks, Epperson, Meadow Pointe, Wiregrass Ranch, Saddlebrook, and all surrounding areas. Same-day service is available."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "92°F",
    "avg_humidity": "72%",
    "cooling_degree_days": "3,500",
    "days_above_90": "100+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Wesley Chapel Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access WREC rebates and find the perfect system for your Seven Oaks, Epperson, or Meadow Pointe home.',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Wesley Chapel",
    "description": "Professional HVAC services in Wesley Chapel, FL including AC repair, installation, and maintenance for residential customers in Seven Oaks, Meadow Pointe, Epperson and all communities.",
    "url": "https://coolit-hvac.com/wesley-chapel-fl",
    "telephone": "+1-813-555-COOL",
    "email": "wesleychapel@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Wesley Chapel",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 28.2397,
      "longitude": -82.3275
    },
    "openingHoursSpecification": [
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        "opens": "07:00",
        "closes": "19:00"
      },
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": "Saturday",
        "opens": "08:00",
        "closes": "17:00"
      }
    ],
    "priceRange": "$$",
    "paymentAccepted": ["Cash", "Credit Card", "Financing Available"],
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "HVAC Services",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Repair"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Installation"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Heat Pump Services"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Multi-Zone Systems"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Maintenance Plans"}}
      ]
    }
  }'::jsonb,

  -- Schema - FAQ Page (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "What utility rebates are available for Wesley Chapel homeowners?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Withlacoochee River Electric Cooperative (WREC) offers up to $500 for heat pump installations, $350 for high-efficiency AC systems, and $50 for programmable thermostats."
        }
      },
      {
        "@type": "Question",
        "name": "How do I handle HOA approval for new HVAC equipment?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "We are familiar with Wesley Chapel''s many HOA requirements and can help you prepare the necessary documentation for outdoor unit placement and equipment screening."
        }
      },
      {
        "@type": "Question",
        "name": "What size AC system do I need for my Wesley Chapel home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Wesley Chapel homes are larger than average. For a typical 2,500 sq ft home in our climate, expect a 4-5 ton system, but proper Manual J calculations are essential."
        }
      }
    ]
  }'::jsonb,

  -- Schema - Breadcrumb (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Wesley Chapel", "item": "https://coolit-hvac.com/fl/wesley-chapel"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/pasco-county',
  '[{"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC Services"}, {"slug": "/fl/land-o-lakes/hvac", "anchor_text": "Land O'' Lakes AC Repair"}, {"slug": "/fl/lutz/hvac", "anchor_text": "Lutz HVAC"}, {"slug": "/fl/new-tampa/hvac", "anchor_text": "New Tampa AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/heat-pumps", "anchor_text": "Heat Pumps"}, {"slug": "/services/zoning", "anchor_text": "Zoning"}]'::jsonb,

  -- Content Metrics
  1880,
  28,
  16,
  86,

  'published',
  1,
  'claude',
  'phase2-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  meta_description = EXCLUDED.meta_description,
  hero_h1 = EXCLUDED.hero_h1,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  services = EXCLUDED.services,
  faq_content = EXCLUDED.faq_content,
  schema_local_business = EXCLUDED.schema_local_business,
  schema_faq_page = EXCLUDED.schema_faq_page,
  status = 'published',
  version = city_seo_content.version + 1,
  updated_at = NOW();
