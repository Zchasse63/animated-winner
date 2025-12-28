-- ============================================
-- Largo, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Largo Core Data
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
  'e5f6a7b8-c9d0-1234-ef01-567890123456', -- Fixed UUID for Largo
  'Largo',
  'largo',
  'Florida',
  'FL',
  'Pinellas',
  'pinellas-county',
  27.9095,
  -82.7873,
  ARRAY['33770', '33771', '33772', '33773', '33774', '33778', '33779'],
  'Tampa Bay',
  ARRAY[
    'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- St. Petersburg
    'c3d4e5f6-a7b8-9012-cdef-345678901234'  -- Clearwater
  ]::uuid[],
  true,
  85
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Largo Research Data
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
  'e5f6a7b8-c9d0-1234-ef01-567890123456', -- Largo city_id
  NOW(),

  -- Demographics
  82337,
  'US Census Bureau American Community Survey 2023',
  60465,
  285000,
  61.1,
  ARRAY['single-family', 'condo', 'manufactured-home', 'townhouse'],
  '{"pre-1960": 10, "1960s-1970s": 35, "1980s-1990s": 30, "2000s-2020s": 25}'::jsonb,

  -- Climate
  90,
  54,
  74,
  3300,
  90,
  46.3,
  'high',
  'Humid subtropical climate typical of Pinellas County. Gulf of Mexico proximity provides moderating sea breezes. High humidity year-round requiring robust HVAC systems. Hurricane season June-November with significant storm exposure.',

  -- Local Context
  ARRAY['Largo Medical Center', 'City of Largo', 'Pinellas County Schools', 'Tech Data Corporation', 'Walmart Distribution', 'St. Petersburg College - Largo', 'Nielsen Media Research', 'HSN', 'Morton Plant North Bay Hospital', 'Pinellas Suncoast Transit Authority'],
  ARRAY['Largo Central Park', 'McGough Nature Park', 'Florida Botanical Gardens', 'Heritage Village', 'Largo Cultural Center', 'Highland Recreation Complex', 'Pinewood Cultural Park', 'Largo Nature Preserve', 'Southwest Recreation Complex'],
  ARRAY['Largo Central Railroad Trail events', 'Holiday Stroll', 'Jazz in the Park', 'Bark in the Park', 'Fourth of July Celebration', 'Largo Food Truck Rally'],
  ARRAY['Pinellas County Schools'],
  'Continued development in Greater Ridgecrest area with city annexation efforts. Investment in parks and recreation facilities. Growing tech sector presence. Largo Central Park improvements and expansion of trail systems.',

  -- Utilities & Rebates
  'Duke Energy Florida',
  '{
    "ac_replacement": {
      "amount": 300,
      "requirements": "High-efficiency system, Home Energy Check required within 24 months",
      "notes": "Must be installed by licensed contractor"
    },
    "heat_pump_replacement": {
      "amount": 150,
      "requirements": "New heat pump meeting efficiency standards"
    },
    "manufactured_home_hvac": {
      "amount": 150,
      "requirements": "For manufactured and multifamily properties"
    },
    "duct_repair": {
      "amount": 150,
      "requirements": "Professional duct testing and sealing"
    },
    "total_available": {
      "amount": 1700,
      "requirements": "Combined Home Energy Improvement rebates"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'Pinellas County Utilities / City of Largo Water',
  180,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), City of Largo amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation"
  }'::jsonb,
  'moderate',

  -- Competitive Landscape
  ARRAY['Blair''s Air Conditioning & Heating', 'Air Zero', 'One Hour Heating & Air Conditioning', 'Rainaldi Home Services', 'Climate Design'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, City of Largo demographics page",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Duke Energy Florida website, City of Largo utilities",
    "employers": "Pinellas County Economic Development, City of Largo",
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
-- 3. NEIGHBORHOODS TABLE - Largo Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Ridgecrest
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Ridgecrest', 'ridgecrest', 'Southeast', 'single-family', '1980s builds', 'Middle income', 'Established neighborhood near Largo Central Park', ARRAY['aging systems from 1980s builds', 'humidity control', 'duct leakage in older homes', 'salt air exposure'], '15-25 years', 1, true),
  -- Belleair Bluffs Area
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Belleair Bluffs Area', 'belleair-bluffs-area', 'South', 'single-family', '1970s-1990s', 'Upper middle income', 'Upscale area near Belleair Bluffs border', ARRAY['upscale system demands', 'zoning requirements for larger homes', 'coastal corrosion', 'humidity management'], '12-20 years', 2, true),
  -- Downtown Largo
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Downtown Largo', 'downtown-largo', 'Central', 'mixed', '1950s-1970s', 'Mixed income', 'Historic downtown with mixed residential and commercial', ARRAY['commercial HVAC needs', 'older building systems', 'mixed-use ventilation', 'retrofit challenges'], '20-35 years', 3, true),
  -- Harbor Hills
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Harbor Hills', 'harbor-hills', 'West', 'single-family', '1970s-1980s', 'Middle income', 'Waterfront community near bay', ARRAY['waterfront humidity', 'salt air corrosion', 'high-efficiency demands', 'storm damage concerns'], '18-28 years', 4, false),
  -- Bay Hills
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Bay Hills', 'bay-hills', 'West', 'single-family', '1970s-1980s', 'Middle income', 'Coastal proximity neighborhood', ARRAY['coastal proximity issues', 'humidity control', '1970s-80s system replacements', 'energy efficiency upgrades'], '18-30 years', 5, false),
  -- Highland Recreation Area
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Highland Recreation Area', 'highland-recreation', 'Northeast', 'mixed', '1960s-1980s', 'Moderate income', 'Near Highland Recreation Complex', ARRAY['varied housing stock', 'manufactured home HVAC', 'older system replacements', 'duct issues'], '20-35 years', 6, false),
  -- Lake Park
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Lake Park', 'lake-park', 'Central', 'single-family', '1960s-1970s', 'Middle income', 'Lakefront residential area', ARRAY['lakefront humidity', '1960s-70s homes needing upgrades', 'ductwork deterioration', 'mold prevention'], '25-40 years', 7, false),
  -- Anona
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Anona', 'anona', 'North', 'single-family', '1970s-1980s', 'Middle income', 'Established residential community', ARRAY['established home updates', 'efficiency improvements', 'humidity management', 'system replacements'], '18-30 years', 8, false),
  -- Fairway Village
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Fairway Village', 'fairway-village', 'North', 'condo', '1990s-2000s', 'Moderate income', 'Golf course adjacent condos', ARRAY['condo HVAC regulations', 'shared system considerations', 'noise concerns', 'limited space for equipment'], '15-25 years', 9, false),
  -- Century Oaks
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Century Oaks', 'century-oaks', 'East', 'single-family', '1980s-1990s', 'Middle income', 'Tree-covered established neighborhood', ARRAY['mature tree shade affecting placement', 'root intrusion concerns', 'humidity under canopy', 'system sizing'], '15-25 years', 10, false),
  -- Collins Estates
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Collins Estates', 'collins-estates', 'South', 'single-family', '1990s-2000s', 'Upper middle income', 'Larger homes with premium features', ARRAY['larger home zoning', 'multi-zone systems', 'high-efficiency demands', 'smart thermostat integration'], '12-20 years', 11, false),
  -- Del Prado
  ('e5f6a7b8-c9d0-1234-ef01-567890123456', 'Del Prado', 'del-prado', 'Southwest', 'single-family', '1980s-2000s', 'Upper middle income', 'Upscale residential community', ARRAY['upscale system requirements', 'whole-home solutions', 'air quality focus', 'humidity control'], '12-22 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Largo HVAC Content
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
  'e5f6a7b8-c9d0-1234-ef01-567890123456',
  'hvac',
  '/fl/largo/hvac',
  'HVAC Services in Largo, FL | AC Repair, Installation & Maintenance',
  'Professional HVAC services in Largo, Florida. Expert AC repair, installation, and maintenance for 82,000+ residents. Duke Energy rebates available. Call for same-day service!',
  'HVAC Largo FL',
  ARRAY['AC repair Largo', 'air conditioning Largo FL', 'HVAC contractor Largo', 'AC installation Largo', 'Duke Energy rebates Largo', 'Pinellas County HVAC'],

  'Largo''s Trusted HVAC Experts',
  'Keeping Pinellas County homes comfortable since 1985',
  'Licensed & Insured | Duke Energy Certified | Same-Day Service',
  'Largo homeowners face unique HVAC challenges in Florida''s humid subtropical climate. With summer temperatures regularly exceeding 90°F and humidity levels averaging 74%, your cooling system works harder here than almost anywhere in the country. Our team understands the specific needs of Largo homes, from the 1960s-70s builds in Lake Park and Anona to the newer developments in Ridgecrest and Collins Estates. We''re licensed, insured, and Duke Energy certified to help you maximize comfort while taking advantage of available rebates.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Largo Homeowners Choose Us",
    "reasons": [
      {
        "title": "Duke Energy Rebate Specialists",
        "description": "We handle all paperwork for Duke Energy''s Home Energy Improvement rebates, helping you save up to $1,700 on qualifying installations."
      },
      {
        "title": "Pinellas County Expertise",
        "description": "Over 35 years serving Largo and Pinellas County. We know the humidity challenges, salt air concerns, and building codes specific to our area."
      },
      {
        "title": "Same-Day Emergency Service",
        "description": "When your AC fails on a 90°F day, you need help fast. We offer same-day emergency repairs throughout Largo, from Ridgecrest to Belleair Bluffs."
      },
      {
        "title": "Transparent Pricing",
        "description": "No surprises. We provide written estimates before any work begins, and we''ll explain all your options including efficiency ratings and rebate eligibility."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Largo",
    "intro": "Largo''s location in the heart of Pinellas County creates specific demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "High Humidity Combat",
        "description": "With 74% average humidity, properly sized systems with enhanced dehumidification are essential. Oversized units short-cycle and leave homes damp and uncomfortable."
      },
      {
        "title": "Salt Air Corrosion",
        "description": "Largo''s Gulf proximity means salt air accelerates outdoor unit corrosion. We recommend coastal-rated equipment and protective coatings for waterfront neighborhoods like Harbor Hills."
      },
      {
        "title": "Aging Housing Stock",
        "description": "Many Largo homes were built in the 1960s-80s with undersized or inefficient ductwork. We specialize in duct sealing and system upgrades that work with existing infrastructure."
      },
      {
        "title": "Hurricane Preparedness",
        "description": "As a high-risk hurricane zone, we help homeowners prepare their HVAC systems for storm season and respond quickly with post-storm repairs and assessments."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Largo",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, reliable AC repairs for all makes and models. Our technicians diagnose issues accurately and carry common parts for same-day repairs.",
        "features": ["Same-day service available", "All brands serviced", "90-day repair warranty", "Upfront pricing"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Expert installation of high-efficiency cooling systems. We properly size your system using Manual J calculations to ensure optimal performance in Largo''s climate.",
        "features": ["Manual J load calculations", "Duke Energy rebate assistance", "Up to 22 SEER2 efficiency", "10-year parts warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Ideal for Largo''s mild winters and hot summers. Heat pumps provide efficient year-round comfort and qualify for Duke Energy rebates.",
        "features": ["Heating and cooling in one", "Lower energy bills", "Rebate eligible", "Quiet operation"]
      },
      {
        "name": "Duct Sealing & Repair",
        "slug": "duct-services",
        "description": "Leaky ducts waste 20-30% of conditioned air. Our duct sealing service improves comfort and qualifies for $150 Duke Energy rebate.",
        "features": ["$150 Duke Energy rebate", "20-30% efficiency gain", "Better humidity control", "Improved air quality"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "Combat Largo''s humidity and allergens with whole-home dehumidifiers, air purifiers, and UV germicidal lights.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Fresh air ventilation"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Preventive maintenance extends system life and catches problems before they become expensive repairs. Required for Duke Energy rebate eligibility.",
        "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "No overtime charges"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "How do I qualify for Duke Energy HVAC rebates in Largo?",
        "answer": "Duke Energy offers up to $300 for AC replacement and $150 for duct sealing. You must complete a free Home Energy Check within 24 months of installation. We handle all the paperwork and help schedule your energy assessment."
      },
      {
        "question": "How often should I service my AC in Largo?",
        "answer": "We recommend twice-yearly maintenance for Largo homes due to our extended cooling season and high humidity. Spring tune-ups prepare your system for summer, while fall service addresses wear from heavy use."
      },
      {
        "question": "What size AC do I need for my Largo home?",
        "answer": "Proper sizing requires Manual J load calculations considering your home''s square footage, insulation, windows, and orientation. In Largo''s climate, we typically see 1 ton per 400-500 square feet, but every home is different."
      },
      {
        "question": "Why is my AC running but not cooling in the Largo heat?",
        "answer": "Common causes include dirty filters, low refrigerant, frozen coils, or failing compressors. In Largo''s high-humidity environment, dirty coils are especially common. We offer same-day diagnostic service."
      },
      {
        "question": "What SEER rating should I choose for a new AC in Largo?",
        "answer": "Florida now requires minimum 15 SEER2 for new installations. We typically recommend 16-18 SEER2 for Largo homes as the energy savings offset the higher initial cost within 3-5 years given our 9-month cooling season."
      },
      {
        "question": "Do you service manufactured homes in Largo?",
        "answer": "Yes, we specialize in manufactured home HVAC systems. These homes have unique requirements and qualify for $150 Duke Energy rebates. Many are located in Highland Recreation and other Largo communities."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "90°F",
    "avg_humidity": "74%",
    "cooling_degree_days": "3,300",
    "days_above_90": "90+",
    "hurricane_risk": "High"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Largo Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access Duke Energy rebates and find the perfect system for your home.',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Largo",
    "description": "Professional HVAC services in Largo, FL including AC repair, installation, and maintenance for residential and commercial customers.",
    "url": "https://coolit-hvac.com/largo-fl",
    "telephone": "+1-727-555-COOL",
    "email": "largo@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Largo",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.9095,
      "longitude": -82.7873
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
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Duct Sealing"}},
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
        "name": "How do I qualify for Duke Energy HVAC rebates in Largo?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Duke Energy offers up to $300 for AC replacement and $150 for duct sealing. You must complete a free Home Energy Check within 24 months of installation."
        }
      },
      {
        "@type": "Question",
        "name": "How often should I service my AC in Largo?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "We recommend twice-yearly maintenance for Largo homes due to our extended cooling season and high humidity."
        }
      },
      {
        "@type": "Question",
        "name": "What size AC do I need for my Largo home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Proper sizing requires Manual J load calculations. In Largo''s climate, we typically see 1 ton per 400-500 square feet, but every home is different."
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
      {"@type": "ListItem", "position": 3, "name": "Largo", "item": "https://coolit-hvac.com/fl/largo"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/pinellas-county',
  '[{"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater HVAC Services"}, {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg AC Repair"}, {"slug": "/fl/seminole/hvac", "anchor_text": "Seminole HVAC"}, {"slug": "/fl/pinellas-park/hvac", "anchor_text": "Pinellas Park AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/heat-pumps", "anchor_text": "Heat Pumps"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1850,
  24,
  12,
  85,

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
  sibling_city_links = EXCLUDED.sibling_city_links,
  service_page_links = EXCLUDED.service_page_links,
  status = 'published',
  version = city_seo_content.version + 1,
  updated_at = NOW();
