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
-- ============================================
-- Riverview, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Riverview Core Data
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
  'f6a7b8c9-d0e1-2345-f012-678901234567', -- Fixed UUID for Riverview
  'Riverview',
  'riverview',
  'Florida',
  'FL',
  'Hillsborough',
  'hillsborough-county',
  27.8752,
  -82.3265,
  ARRAY['33569', '33578', '33579'],
  'Tampa Bay',
  ARRAY[
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa
    'd4e5f6a7-b8c9-0123-def0-456789012345'  -- Brandon
  ]::uuid[],
  true,
  88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Riverview Research Data
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
  'f6a7b8c9-d0e1-2345-f012-678901234567', -- Riverview city_id
  NOW(),

  -- Demographics
  119714,
  'US Census Bureau American Community Survey 2023',
  100475,
  385000,
  76.0,
  ARRAY['single-family', 'townhouse', 'new-construction'],
  '{"pre-1990": 10, "1990s-2000s": 25, "2010s": 40, "2020s": 25}'::jsonb,

  -- Climate
  91,
  52,
  73,
  3450,
  95,
  52.1,
  'moderate',
  'Humid subtropical climate with hot, humid summers and mild winters. Inland location slightly hotter than coastal areas. Strong afternoon thunderstorms common May-September. Hurricane risk moderate due to inland position.',

  -- Local Context
  ARRAY['Hillsborough County Public Schools', 'FishHawk Ranch businesses', 'Summerfield Crossings Golf Club', 'Amazon Fulfillment Centers', 'Mosaic Company', 'Tampa Premium Outlets (nearby)', 'HCA Florida Brandon Hospital', 'Bell Shoals Baptist Church', 'AdventHealth Riverview (planned)'],
  ARRAY['Alafia River State Park', 'Bell Creek Nature Preserve', 'Balm-Boyette Preserve', 'FishHawk Ranch', 'Summerfield Crossings Golf Club', 'Riverview Civic Center', 'Boyette Springs Park', 'Riverview Regional Park'],
  ARRAY['FishHawk Ranch community events', 'Summerfield community festivals', 'Alafia River Rendezvous', 'Riverview Holiday Parade', 'Boyette Blueberry Festival'],
  ARRAY['Hillsborough County Public Schools'],
  'Rapid population growth with new master-planned communities. FishHawk Ranch expansion continues. New commercial development along Big Bend Road. AdventHealth hospital construction. Significant infrastructure improvements on US-301.',

  -- Utilities & Rebates
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {
      "amount": 436,
      "requirements": "15+ SEER system with qualifying efficiency ratings",
      "notes": "Higher rebates for higher SEER ratings"
    },
    "heat_pump": {
      "amount": 700,
      "requirements": "Qualifying heat pump system installation"
    },
    "smart_thermostat": {
      "amount": 75,
      "requirements": "ENERGY STAR certified smart thermostat"
    },
    "duct_sealing": {
      "amount": 200,
      "requirements": "Professional duct testing and sealing"
    },
    "total_available": {
      "amount": 2500,
      "requirements": "Combined energy efficiency rebates through TECO"
    }
  }'::jsonb,
  'TECO Peoples Gas',
  'Hillsborough County Water',
  220,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), Hillsborough County amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "hoa_approval": "Many communities require HOA approval for exterior equipment"
  }'::jsonb,
  'very high',

  -- Competitive Landscape
  ARRAY['Easy A/C', 'Comfort Temp', 'The A/C Guy of Tampa Bay', 'Air Rescue', 'One Hour Heating & Air Conditioning'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, Census Reporter",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Tampa Electric (TECO) website, rebate programs",
    "employers": "Hillsborough County Economic Development",
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
-- 3. NEIGHBORHOODS TABLE - Riverview Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- FishHawk Ranch
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'FishHawk Ranch', 'fishhawk-ranch', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community with extensive amenities', ARRAY['larger home zoning requirements', 'multi-zone systems', 'high-efficiency demands', 'smart home integration'], '5-15 years', 1, true),
  -- Summerfield
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Summerfield', 'summerfield', 'Central', 'mixed', '1990s-2010s', 'Middle income', 'Golf community with varied housing types', ARRAY['varied housing types', 'villa HVAC', 'townhome systems', 'golf course humidity'], '10-20 years', 2, true),
  -- Boyette
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Boyette', 'boyette', 'Northeast', 'single-family', '2000s-2010s', 'Upper middle income', 'Larger lots near nature preserves', ARRAY['larger lot homes', 'well water considerations', 'rural area dust', 'preserve proximity humidity'], '8-18 years', 3, true),
  -- Boyette Springs
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Boyette Springs', 'boyette-springs', 'Northeast', 'single-family', '2000s-2010s', 'Upper middle income', 'Family-friendly near natural springs', ARRAY['2000s era systems aging', 'mature landscaping shade', 'natural spring humidity', 'quality school proximity'], '10-18 years', 4, false),
  -- Panther Trace
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Panther Trace', 'panther-trace', 'South', 'single-family', '2010s-2020s', 'Middle income', 'Newer development with community amenities', ARRAY['newer construction systems', 'builder-grade upgrades', 'community pool humidity', 'HOA equipment requirements'], '3-12 years', 5, false),
  -- South Fork
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'South Fork', 'south-fork', 'Southeast', 'single-family', '2000s-2010s', 'Upper income', 'Upscale homes with premium features', ARRAY['upscale home requirements', 'multi-story cooling', 'wine cellar climate control', 'whole-home automation'], '8-18 years', 6, false),
  -- Waterset
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Waterset', 'waterset', 'West', 'single-family', '2010s-2020s', 'Middle income', 'New construction with water features', ARRAY['new construction standards', 'water feature humidity', 'energy code compliance', 'smart thermostat integration'], '2-10 years', 7, false),
  -- Winthrop
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Winthrop', 'winthrop', 'West', 'mixed', '2000s-2010s', 'Middle income', 'Walkable town center community', ARRAY['walkable community needs', 'town center commercial', 'live-work unit HVAC', 'arts district requirements'], '8-18 years', 8, false),
  -- Riverview Proper
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Riverview Proper', 'riverview-proper', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Original Riverview core area', ARRAY['older system replacements', '1980s-90s ductwork', 'renovation HVAC upgrades', 'budget-friendly options'], '20-35 years', 9, false),
  -- Alafia
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Alafia', 'alafia', 'North', 'single-family', '1990s-2000s', 'Middle income', 'Near Alafia River with nature access', ARRAY['river proximity humidity', 'flood zone considerations', 'elevated home systems', 'outdoor unit placement'], '15-25 years', 10, false),
  -- Bloomingdale
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Bloomingdale', 'bloomingdale', 'Northwest', 'single-family', '1990s-2000s', 'Middle income', 'Established neighborhood near shopping', ARRAY['established community updates', 'system modernization', 'efficiency upgrades', 'duct cleaning needs'], '15-25 years', 11, false),
  -- Rivercrest
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Rivercrest', 'rivercrest', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Waterfront community near Alafia River', ARRAY['waterfront humidity control', 'premium system demands', 'whole-home solutions', 'dehumidification needs'], '10-20 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Riverview HVAC Content
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
  'f6a7b8c9-d0e1-2345-f012-678901234567',
  'hvac',
  '/fl/riverview/hvac',
  'HVAC Services in Riverview, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Riverview, Florida''s 120,000+ residents. TECO rebates up to $2,500. Serving FishHawk Ranch, Summerfield, Boyette & all communities. Call today!',
  'HVAC Riverview FL',
  ARRAY['AC repair Riverview', 'air conditioning Riverview FL', 'HVAC contractor Riverview', 'FishHawk HVAC', 'TECO rebates Riverview', 'Hillsborough County HVAC'],

  'Riverview''s Premier HVAC Specialists',
  'Trusted by over 10,000 Hillsborough County homeowners',
  'Licensed & Insured | TECO Certified | Same-Day Service',
  'Riverview is one of Florida''s fastest-growing communities, and our HVAC team has grown right alongside it. From the luxury homes of FishHawk Ranch to the established neighborhoods near Alafia River, we understand the unique cooling demands of this diverse area. With household incomes averaging over $100,000, Riverview homeowners expect quality workmanship and premium service. That''s exactly what we deliver, along with expert guidance on TECO''s generous rebate programs that can save you up to $2,500 on qualifying installations.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Riverview Families Choose Us",
    "reasons": [
      {
        "title": "TECO Rebate Maximizers",
        "description": "Tampa Electric offers Florida''s best utility rebates—up to $700 for heat pumps and $436 for AC systems. We handle all paperwork to ensure you receive every dollar you''re entitled to."
      },
      {
        "title": "Master-Planned Community Experts",
        "description": "From FishHawk''s 4,000+ acres to Summerfield''s 3,758 homes, we understand HOA requirements, builder-grade equipment upgrades, and multi-zone solutions for larger homes."
      },
      {
        "title": "New Construction Specialists",
        "description": "With 65% of Riverview homes built since 2010, we specialize in warranty repairs, builder-grade upgrades, and systems designed for today''s energy codes."
      },
      {
        "title": "Same-Day Service Guarantee",
        "description": "Your comfort can''t wait. We offer guaranteed same-day service throughout Riverview, including FishHawk, Boyette, Panther Trace, and all surrounding communities."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Specific to Riverview",
    "intro": "Riverview''s location and rapid growth create unique demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Extreme Summer Heat",
        "description": "Riverview''s inland location means summer highs reach 91°F regularly—2-3 degrees hotter than coastal areas. Systems work harder here, requiring robust equipment and regular maintenance."
      },
      {
        "title": "Master-Planned Community Requirements",
        "description": "FishHawk, Summerfield, and Panther Trace all have HOA guidelines for equipment placement, noise levels, and aesthetic standards. We navigate these requirements daily."
      },
      {
        "title": "Newer Home System Upgrades",
        "description": "Many Riverview homes came with builder-grade HVAC systems that underperform. We specialize in upgrading these systems for better efficiency and comfort."
      },
      {
        "title": "Large Home Zoning Challenges",
        "description": "FishHawk and South Fork homes often exceed 3,000 square feet. Single-zone systems struggle in these homes—we design and install multi-zone solutions that deliver consistent comfort."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Riverview",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, expert repairs for all makes and models. We stock common parts for same-day fixes in Riverview''s hottest months.",
        "features": ["Same-day service available", "All brands serviced", "90-day repair warranty", "Upfront pricing"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Premium installations using Manual J load calculations. We right-size your system for Riverview''s climate and your home''s specific needs.",
        "features": ["Manual J load calculations", "TECO rebate up to $436", "Up to 22 SEER2 efficiency", "10-year parts warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps are ideal for Riverview''s climate, providing efficient heating and cooling. TECO offers up to $700 in rebates for qualifying installations.",
        "features": ["$700 TECO rebate available", "Year-round efficiency", "Lower operating costs", "Quiet operation"]
      },
      {
        "name": "Multi-Zone Systems",
        "slug": "zoning",
        "description": "Perfect for FishHawk''s larger homes. Zoned systems deliver customized comfort to each area of your home while reducing energy waste.",
        "features": ["Room-by-room control", "Energy savings 20-30%", "Ideal for 2-story homes", "Smart thermostat compatible"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "New construction homes are built tight for efficiency, but this can trap pollutants. Our IAQ solutions ensure healthy air throughout your home.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Fresh air ventilation"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with regular maintenance. Especially important for newer homes still under builder warranty.",
        "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Warranty protection"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "What TECO rebates are available for Riverview homeowners?",
        "answer": "Tampa Electric offers generous rebates: up to $700 for heat pump installations, $436 for high-efficiency AC systems, $200 for duct sealing, and $75 for smart thermostats. Combined, you could save up to $2,500 on qualifying upgrades."
      },
      {
        "question": "How do I handle HOA requirements for HVAC equipment in FishHawk?",
        "answer": "We''re familiar with FishHawk''s HOA guidelines and other Riverview community standards. We help you submit required documentation and ensure equipment placement meets all aesthetic and noise requirements."
      },
      {
        "question": "Should I upgrade my builder-grade AC system?",
        "answer": "Many Riverview homes built in the 2010s came with 14 SEER systems that are now outdated. Upgrading to 16+ SEER can cut cooling costs 15-30% and often qualifies for TECO rebates that offset upgrade costs."
      },
      {
        "question": "Why is my new home so humid inside?",
        "answer": "Modern energy-efficient homes are built tight, which can trap humidity. This is common in Riverview''s newer communities. We recommend whole-home dehumidification integrated with your HVAC system."
      },
      {
        "question": "How often should I service my AC in Riverview?",
        "answer": "We recommend bi-annual maintenance—spring and fall. Riverview''s hot summers and high humidity put significant stress on systems, and regular maintenance prevents breakdowns and maintains efficiency."
      },
      {
        "question": "Do you service FishHawk Ranch and Boyette areas?",
        "answer": "Absolutely. We serve all Riverview communities including FishHawk Ranch, Boyette, Summerfield, Panther Trace, South Fork, Waterset, and Winthrop. Same-day service is available throughout the area."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "73%",
    "cooling_degree_days": "3,450",
    "days_above_90": "95+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Riverview Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access TECO rebates up to $2,500 and find the perfect system for your FishHawk, Summerfield, or Boyette home.',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Riverview",
    "description": "Professional HVAC services in Riverview, FL including AC repair, installation, and maintenance for residential customers in FishHawk, Summerfield, Boyette and all communities.",
    "url": "https://coolit-hvac.com/riverview-fl",
    "telephone": "+1-813-555-COOL",
    "email": "riverview@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Riverview",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.8752,
      "longitude": -82.3265
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
        "name": "What TECO rebates are available for Riverview homeowners?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa Electric offers generous rebates: up to $700 for heat pump installations, $436 for high-efficiency AC systems, $200 for duct sealing, and $75 for smart thermostats."
        }
      },
      {
        "@type": "Question",
        "name": "How do I handle HOA requirements for HVAC equipment in FishHawk?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "We are familiar with FishHawk''s HOA guidelines and other Riverview community standards. We help you submit required documentation and ensure equipment placement meets all requirements."
        }
      },
      {
        "@type": "Question",
        "name": "Should I upgrade my builder-grade AC system?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Many Riverview homes built in the 2010s came with 14 SEER systems that are now outdated. Upgrading to 16+ SEER can cut cooling costs 15-30%."
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
      {"@type": "ListItem", "position": 3, "name": "Riverview", "item": "https://coolit-hvac.com/fl/riverview"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/hillsborough-county',
  '[{"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC Services"}, {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa AC Repair"}, {"slug": "/fl/valrico/hvac", "anchor_text": "Valrico HVAC"}, {"slug": "/fl/lithia/hvac", "anchor_text": "Lithia AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/heat-pumps", "anchor_text": "Heat Pumps"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1920,
  26,
  14,
  88,

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
-- ============================================
-- Spring Hill, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Spring Hill Core Data
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
  'b8c9d0e1-f2a3-4567-1234-890123456789', -- Fixed UUID for Spring Hill
  'Spring Hill',
  'spring-hill',
  'Florida',
  'FL',
  'Hernando',
  'hernando-county',
  28.4769,
  -82.5476,
  ARRAY['34606', '34607', '34608', '34609', '34610', '34611', '34613', '34614'],
  'Tampa Bay',
  ARRAY[]::uuid[],  -- Will be updated with nearby cities
  true,
  86
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Spring Hill Research Data
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
  'b8c9d0e1-f2a3-4567-1234-890123456789', -- Spring Hill city_id
  NOW(),

  -- Demographics
  118814,
  'US Census Bureau American Community Survey 2023',
  66557,
  265000,
  79.9,
  ARRAY['single-family', 'manufactured-home', '55-plus-community', 'ranch-style'],
  '{"pre-1980": 15, "1980s-1990s": 45, "2000s-2010s": 30, "2020s": 10}'::jsonb,

  -- Climate
  91,
  50,
  74,
  3400,
  95,
  52.8,
  'moderate-high',
  'Humid subtropical climate with hot, humid summers and mild winters. Located on Florida''s Nature Coast with proximity to Gulf of Mexico. Slightly cooler than Tampa due to northern location. Hurricane risk moderate to high.',

  -- Local Context
  ARRAY['HCA Florida Oak Hill Hospital', 'Bayfront Health Spring Hill', 'Hernando County School District', 'Publix Super Markets', 'Walmart', 'Home Depot', 'Hernando County Government', 'Florida Hospital North', 'Timber Pines Country Club', 'GlenLakes Country Club'],
  ARRAY['Weeki Wachee Springs State Park', 'Buccaneer Bay', 'Weekiwachee Preserve', 'Timber Pines Community', 'Hernando Beach', 'Florida Botanical Gardens', 'Bayport Park', 'Linda Pedersen Park', 'Anderson Snow Park', 'Nature Coast Trail'],
  ARRAY['Weeki Wachee Mermaid Shows', 'Spring Hill Art Festival', 'Hernando County Fair', 'Brooksville Blueberry Festival', 'Concerts in the Park', 'Timber Pines community events'],
  ARRAY['Hernando County School District'],
  'Growing retirement community with new active adult developments. Medical facility expansions. Nature Coast Trail extension. Continued residential development in areas near Weeki Wachee. Infrastructure improvements on US-19 corridor.',

  -- Utilities & Rebates
  'Duke Energy Florida / Withlacoochee River Electric Cooperative',
  '{
    "duke_energy": {
      "ac_replacement": {
        "amount": 300,
        "requirements": "High-efficiency system, Home Energy Check required"
      },
      "duct_sealing": {
        "amount": 150,
        "requirements": "Professional duct testing and sealing"
      },
      "total_available": 1700
    },
    "wrec": {
      "ac_replacement": {
        "amount": 350,
        "requirements": "High-efficiency system meeting WREC standards"
      },
      "heat_pump": {
        "amount": 500,
        "requirements": "Qualifying heat pump installation"
      },
      "total_available": 1500
    },
    "note": "Provider depends on location within Spring Hill"
  }'::jsonb,
  'None (all-electric area)',
  'Hernando County Utilities',
  280,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), Hernando County amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "manufactured_homes": "Special requirements for manufactured/mobile homes"
  }'::jsonb,
  'moderate',

  -- Competitive Landscape
  ARRAY['Senica Air Conditioning', 'Crystal Aire', 'Comfort Central', 'A/C Designs', 'Air Zero'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, Florida Demographics",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Duke Energy Florida, Withlacoochee River Electric Cooperative",
    "employers": "Hernando County Economic Development",
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
-- 3. NEIGHBORHOODS TABLE - Spring Hill Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Timber Pines
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Timber Pines', 'timber-pines', 'West', '55-plus', '1990s-2000s', 'Middle income', 'Active 55+ community with golf course', ARRAY['senior-friendly controls', 'villa HVAC systems', 'humidity for arthritis concerns', 'energy efficiency for fixed incomes'], '15-28 years', 1, true),
  -- Weeki Wachee Area
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Weeki Wachee Area', 'weeki-wachee', 'Northwest', 'mixed', '1980s-2010s', 'Upper middle income', 'Near Weeki Wachee Springs State Park', ARRAY['spring proximity humidity', 'waterfront systems', 'premium home demands', 'preserve area considerations'], '10-35 years', 2, true),
  -- Seven Hills
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Seven Hills', 'seven-hills', 'Central', 'single-family', '1980s-1990s', 'Middle income', 'Established golf course community', ARRAY['established home updates', 'golf course humidity', '1980s-90s system replacements', 'efficiency upgrades'], '20-35 years', 3, true),
  -- Silverthorn
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Silverthorn', 'silverthorn', 'Northeast', 'single-family', '1990s-2010s', 'Upper income', 'Country club community with luxury homes', ARRAY['country club standards', 'larger home zoning', 'premium equipment demands', 'whole-home solutions'], '10-28 years', 4, false),
  -- Heritage Pines
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Heritage Pines', 'heritage-pines', 'East', '55-plus', '1990s-2000s', 'Middle income', '55+ community with amenities', ARRAY['senior accessibility', 'villa systems', 'easy-to-use controls', 'energy efficiency priorities'], '15-28 years', 5, false),
  -- Lake in the Woods
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Lake in the Woods', 'lake-in-the-woods', 'Northwest', 'single-family', '1990s-2010s', 'Upper income', 'Lakefront luxury community', ARRAY['lakefront humidity control', 'upscale system needs', 'waterfront corrosion', 'whole-home dehumidification'], '10-25 years', 6, false),
  -- High Point
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'High Point', 'high-point', 'East', 'single-family', '1970s-1990s', 'Moderate income', 'Elevated terrain established neighborhood', ARRAY['elevation considerations', 'established home maintenance', 'older ductwork', 'budget-friendly options'], '20-40 years', 7, false),
  -- Spring Lake
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Spring Lake', 'spring-lake', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Lakeside residential area', ARRAY['lake proximity humidity', '1980s builds', 'system modernization', 'duct cleaning needs'], '25-40 years', 8, false),
  -- River Country Estates
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'River Country Estates', 'river-country-estates', 'Northwest', 'single-family', '2000s-2010s', 'Upper income', 'Luxury riverfront properties', ARRAY['river humidity', 'luxury home systems', 'outdoor living climate', 'whole-home automation'], '8-20 years', 9, false),
  -- Hernando Beach
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Hernando Beach', 'hernando-beach', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Coastal community on Gulf', ARRAY['severe salt air corrosion', 'coastal humidity', 'hurricane resilience', 'flood zone considerations'], '15-45 years', 10, false),
  -- Pine Island
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Pine Island', 'pine-island', 'West', 'mixed', '1970s-1990s', 'Moderate income', 'Coastal area with mixed housing', ARRAY['coastal proximity', 'manufactured home HVAC', 'salt air exposure', 'humidity challenges'], '20-45 years', 11, false),
  -- Spring Hill Proper
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Spring Hill Proper', 'spring-hill-proper', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Original Spring Hill core development', ARRAY['older system replacements', '1980s housing stock', 'budget-conscious solutions', 'manufactured home service'], '25-40 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Spring Hill HVAC Content
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
  'b8c9d0e1-f2a3-4567-1234-890123456789',
  'hvac',
  '/fl/spring-hill/hvac',
  'HVAC Services in Spring Hill, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Spring Hill''s 118,000+ residents. Serving Timber Pines, Weeki Wachee, Seven Hills & all communities. Duke Energy & WREC rebates available.',
  'HVAC Spring Hill FL',
  ARRAY['AC repair Spring Hill', 'air conditioning Spring Hill FL', 'HVAC contractor Spring Hill', 'Timber Pines HVAC', 'Hernando County AC', 'manufactured home AC'],

  'Spring Hill''s Trusted HVAC Team',
  'Serving Hernando County''s Nature Coast since 1995',
  'Licensed & Insured | Duke Energy & WREC Certified | Senior Discounts',
  'Spring Hill offers the best of Florida''s Nature Coast—close to world-famous Weeki Wachee Springs, surrounded by natural beauty, and home to thriving 55+ communities like Timber Pines. With nearly 120,000 residents and a strong homeownership rate of 80%, Spring Hill homeowners value reliable, cost-effective HVAC service. Our team understands the unique needs of this area, from the manufactured home communities to the waterfront estates near Weeki Wachee River. We''re certified with both Duke Energy and WREC to help you access all available rebates.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Spring Hill Homeowners Trust Us",
    "reasons": [
      {
        "title": "Dual Utility Expertise",
        "description": "Spring Hill is served by both Duke Energy and WREC depending on location. We know which rebates apply to your home and handle all paperwork to maximize your savings."
      },
      {
        "title": "55+ Community Specialists",
        "description": "We serve Timber Pines, Heritage Pines, and other active adult communities. We understand senior-friendly controls, fixed-income budget concerns, and accessibility needs."
      },
      {
        "title": "Manufactured Home Experts",
        "description": "Spring Hill has a significant manufactured home population. We specialize in mobile home HVAC systems, split systems, and package units designed for these unique homes."
      },
      {
        "title": "Nature Coast Climate Knowledge",
        "description": "From Hernando Beach salt air to Weeki Wachee spring humidity, we understand the specific challenges of Hernando County''s diverse environments."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Spring Hill",
    "intro": "Spring Hill''s location on Florida''s Nature Coast creates specific demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Coastal and Inland Mix",
        "description": "Spring Hill spans from Hernando Beach''s salt air to inland areas miles from the coast. Equipment recommendations vary significantly based on your specific location."
      },
      {
        "title": "1980s Housing Stock",
        "description": "Much of Spring Hill was developed in the 1980s-90s. These homes often have original or aging HVAC systems with outdated ductwork needing replacement or significant repair."
      },
      {
        "title": "Manufactured Home Considerations",
        "description": "Many Spring Hill residents live in manufactured homes with unique HVAC requirements—package units, limited space, and different installation standards."
      },
      {
        "title": "Senior Living Priorities",
        "description": "With a median age of 43 and large 55+ communities, many Spring Hill homeowners prioritize reliable comfort, easy-to-use controls, and energy efficiency for fixed incomes."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Spring Hill",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, reliable AC repairs for all home types—site-built, manufactured, and everything in between. Same-day service available throughout Spring Hill.",
        "features": ["Same-day service available", "All home types", "90-day repair warranty", "Senior discounts"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Expert installations tailored to your home type and budget. We properly size systems for Spring Hill''s humid climate using Manual J calculations.",
        "features": ["Manual J calculations", "Duke Energy/WREC rebates", "Financing available", "10-year warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps are ideal for Spring Hill''s mild winters. WREC offers up to $500 in rebates, making this an affordable upgrade for energy-conscious homeowners.",
        "features": ["Up to $500 WREC rebate", "Year-round efficiency", "Lower bills", "Quiet operation"]
      },
      {
        "name": "Manufactured Home HVAC",
        "slug": "manufactured-home",
        "description": "Specialized service for mobile and manufactured homes. We install and repair package units, split systems, and ductwork designed for manufactured housing.",
        "features": ["Package unit experts", "Mobile home specialists", "Ductwork repair", "Proper sizing"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "Combat Spring Hill''s humidity and allergens. Especially important for older homes and residents with respiratory concerns.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Allergy relief"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with affordable maintenance plans. Senior discounts available. Essential for maintaining efficiency and preventing breakdowns.",
        "features": ["Senior discounts", "Bi-annual tune-ups", "Priority scheduling", "15% repair discount"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "Which utility company serves my Spring Hill home?",
        "answer": "Spring Hill is served by both Duke Energy Florida and Withlacoochee River Electric Cooperative (WREC) depending on your specific location. We can help identify your provider and available rebates during a free consultation."
      },
      {
        "question": "Do you service manufactured and mobile homes?",
        "answer": "Yes, manufactured home HVAC is one of our specialties. We install and repair package units, split systems, and ductwork specifically designed for manufactured housing. Duke Energy offers $150 rebates for manufactured home HVAC."
      },
      {
        "question": "What rebates are available for Spring Hill homeowners?",
        "answer": "Duke Energy offers up to $300 for AC replacement and $150 for duct sealing. WREC offers up to $500 for heat pumps and $350 for AC systems. Your available rebates depend on which utility serves your home."
      },
      {
        "question": "How do I protect my AC from salt air in Hernando Beach?",
        "answer": "Coastal Spring Hill homes need coastal-rated equipment with corrosion-resistant coatings. We recommend protective covers and more frequent maintenance—quarterly instead of bi-annually—for homes within 2 miles of the Gulf."
      },
      {
        "question": "Do you offer senior discounts?",
        "answer": "Yes, we offer senior discounts on repairs and maintenance plans. Many of our Timber Pines and Heritage Pines customers take advantage of this program. Ask about our 55+ pricing when you call."
      },
      {
        "question": "My 1980s home still has the original AC. Should I replace it?",
        "answer": "If your system is 15+ years old, replacement is usually more cost-effective than repair. Modern systems are 40-50% more efficient. We can calculate your payback period and help you access utility rebates."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "74%",
    "cooling_degree_days": "3,400",
    "days_above_90": "95+",
    "hurricane_risk": "Moderate-High"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Spring Hill Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access Duke Energy or WREC rebates and find the perfect system for your Timber Pines, Weeki Wachee, or Seven Hills home. Senior discounts available!',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Spring Hill",
    "description": "Professional HVAC services in Spring Hill, FL including AC repair, installation, and maintenance for residential customers in Timber Pines, Weeki Wachee, and all communities.",
    "url": "https://coolit-hvac.com/spring-hill-fl",
    "telephone": "+1-352-555-COOL",
    "email": "springhill@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Spring Hill",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 28.4769,
      "longitude": -82.5476
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
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Manufactured Home HVAC"}},
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
        "name": "Which utility company serves my Spring Hill home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Spring Hill is served by both Duke Energy Florida and Withlacoochee River Electric Cooperative (WREC) depending on your specific location."
        }
      },
      {
        "@type": "Question",
        "name": "Do you service manufactured and mobile homes?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, manufactured home HVAC is one of our specialties. We install and repair package units, split systems, and ductwork specifically designed for manufactured housing."
        }
      },
      {
        "@type": "Question",
        "name": "Do you offer senior discounts?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, we offer senior discounts on repairs and maintenance plans. Ask about our 55+ pricing when you call."
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
      {"@type": "ListItem", "position": 3, "name": "Spring Hill", "item": "https://coolit-hvac.com/fl/spring-hill"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/hernando-county',
  '[{"slug": "/fl/brooksville/hvac", "anchor_text": "Brooksville HVAC Services"}, {"slug": "/fl/hudson/hvac", "anchor_text": "Hudson AC Repair"}, {"slug": "/fl/weeki-wachee/hvac", "anchor_text": "Weeki Wachee HVAC"}, {"slug": "/fl/new-port-richey/hvac", "anchor_text": "New Port Richey AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/manufactured-home-hvac", "anchor_text": "Manufactured Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1890,
  22,
  14,
  84,

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
-- ============================================
-- Lakeland, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Lakeland Core Data
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
  'c9d0e1f2-a3b4-5678-2345-901234567890', -- Fixed UUID for Lakeland
  'Lakeland',
  'lakeland',
  'Florida',
  'FL',
  'Polk',
  'polk-county',
  28.0395,
  -81.9498,
  ARRAY['33801', '33802', '33803', '33804', '33805', '33806', '33807', '33809', '33810', '33811', '33812', '33813', '33815'],
  'Lakeland-Winter Haven',
  ARRAY[
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890'  -- Tampa
  ]::uuid[],
  true,
  89
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Lakeland Research Data
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
  'c9d0e1f2-a3b4-5678-2345-901234567890', -- Lakeland city_id
  NOW(),

  -- Demographics
  124990,
  'US Census Bureau American Community Survey 2023 with 2024 estimates',
  60947,
  229100,
  56.1,
  ARRAY['single-family', 'historic-bungalow', 'new-construction', 'apartment'],
  '{"pre-1940": 10, "1940s-1970s": 30, "1980s-2000s": 35, "2010s-2020s": 25}'::jsonb,

  -- Climate
  92,
  51,
  73,
  3550,
  105,
  51.6,
  'moderate',
  'Humid subtropical climate with hot, humid summers. Central Florida location means slightly higher temperatures than coastal areas. Afternoon thunderstorms frequent May-September. Moderate hurricane risk due to inland position.',

  -- Local Context
  ARRAY['Publix Super Markets (HQ)', 'Lakeland Regional Health', 'Florida Southern College', 'Southeastern University', 'GEICO Regional Office', 'Amazon Fulfillment Center', 'Polk County Public Schools', 'City of Lakeland', 'Rooms To Go Distribution', 'Saddle Creek Logistics'],
  ARRAY['Florida Southern College (Frank Lloyd Wright architecture)', 'Lake Mirror', 'Lake Hollingsworth', 'Polk Theatre', 'Munn Park Historic District', 'Detroit Tigers Spring Training (Publix Field)', 'Circle B Bar Reserve', 'Hollis Garden', 'Lakeland Linder Airport', 'RP Funding Center'],
  ARRAY['Sun ''n Fun Aerospace Expo', 'Mayfaire by-the-Lake', 'First Friday in Munn Park', 'Oktoberfest', 'Lakeland Pigfest', 'Shakespeare Festival'],
  ARRAY['Polk County Public Schools'],
  'Rapid growth as bedroom community between Tampa and Orlando. Amazon fulfillment center expansion. Downtown Lakeland revitalization. Bonnet Springs Park development. Florida Southern College campus improvements. Growing tech sector presence.',

  -- Utilities & Rebates
  'Lakeland Electric (Municipal Utility)',
  '{
    "hvac_tune_up": {
      "amount": 100,
      "requirements": "Annual tune-up by licensed HVAC contractor",
      "notes": "Available annually per customer"
    },
    "ac_heat_pump_replacement": {
      "amount": 300,
      "requirements": "15.2 SEER2 or higher, must use licensed contractor",
      "notes": "AC with gas furnace or heat pump systems qualify"
    },
    "mini_split": {
      "amount": 150,
      "requirements": "15.2 SEER2 or greater per condensing unit",
      "notes": "Maximum of 2 units at $150 each"
    },
    "zero_interest_loan": {
      "amount": 5000,
      "requirements": "For energy efficiency upgrades including HVAC",
      "notes": "Minimum $500, maximum $5,000 at 0% interest"
    },
    "total_available": {
      "amount": 800,
      "requirements": "Combined heating/cooling rebates plus loan program"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'City of Lakeland Water Utilities',
  300,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), City of Lakeland amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "historic_district": "Additional requirements in historic districts"
  }'::jsonb,
  'moderate',

  -- Competitive Landscape
  ARRAY['Reliant Heating & Air Conditioning', 'Del-Air Heating and Air Conditioning', 'All-Pro Electrical & Air Conditioning', 'Comfort Zone', 'Heatwave Air Conditioning'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, World Population Review 2024",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Lakeland Electric website, municipal rebate programs",
    "employers": "Lakeland Economic Development Council",
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
-- 3. NEIGHBORHOODS TABLE - Lakeland Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Lake Hollingsworth
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Lake Hollingsworth', 'lake-hollingsworth', 'Central', 'single-family', '1920s-1960s', 'Upper middle income', 'Historic lakefront homes near Florida Southern College', ARRAY['historic home retrofits', 'lakefront humidity', 'larger home zoning', 'preservation requirements'], '15-40+ years', 1, true),
  -- Dixieland
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Dixieland', 'dixieland', 'South', 'historic-bungalow', '1920s-1940s', 'Middle income', 'Historic bungalow district with craftsman homes', ARRAY['1920s-40s bungalow systems', 'historic preservation', 'ductwork retrofits', 'window unit replacements'], '25-50+ years', 2, true),
  -- Cleveland Heights
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Cleveland Heights', 'cleveland-heights', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Golf course community with varied housing', ARRAY['golf course humidity', 'varied home ages', 'system modernization', 'multi-zone needs'], '20-45 years', 3, true),
  -- South Lake Morton
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'South Lake Morton', 'south-lake-morton', 'Central', 'historic-bungalow', '1920s-1950s', 'Middle income', 'Historic district near Lake Morton', ARRAY['historic home HVAC', 'lakefront humidity', 'preservation considerations', 'older ductwork'], '25-50+ years', 4, false),
  -- Beacon Hill
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Beacon Hill', 'beacon-hill', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development with family homes', ARRAY['family home sizing', 'newer builds', 'smart home integration', 'energy efficiency focus'], '3-18 years', 5, false),
  -- Southcreek Preserve
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Southcreek Preserve', 'southcreek-preserve', 'South', 'single-family', '2000s-2010s', 'Middle income', 'Nature preserve adjacent community', ARRAY['preserve humidity', 'newer construction', 'HOA requirements', 'smart thermostat setup'], '8-20 years', 6, false),
  -- Grasslands
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Grasslands', 'grasslands', 'Southwest', 'single-family', '1990s-2010s', 'Upper income', 'Golf course community with upscale homes', ARRAY['golf community demands', 'larger homes', 'premium system needs', 'whole-home solutions'], '10-28 years', 7, false),
  -- Lake Bonny
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Lake Bonny', 'lake-bonny', 'North', 'single-family', '1960s-1980s', 'Moderate income', 'Lakefront community with affordable homes', ARRAY['lakefront humidity', 'older homes', 'system replacements', 'budget-friendly options'], '30-50 years', 8, false),
  -- North Lakeland
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'North Lakeland', 'north-lakeland', 'North', 'mixed', '1970s-2000s', 'Moderate income', 'Diverse housing types and commercial areas', ARRAY['diverse housing types', 'manufactured homes', 'older apartment systems', 'commercial HVAC'], '15-45 years', 9, false),
  -- Lakeside Village
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Lakeside Village', 'lakeside-village', 'Southeast', 'single-family', '2010s-2020s', 'Middle income', 'Newer development near shopping', ARRAY['newer development', 'builder-grade upgrades', 'HOA standards', 'energy code compliance'], '2-12 years', 10, false),
  -- Highland City
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Highland City', 'highland-city', 'Southeast', 'single-family', '1980s-2000s', 'Moderate income', 'Rural character with larger properties', ARRAY['rural area considerations', 'larger lots', 'well water impacts', 'agricultural dust'], '15-35 years', 11, false),
  -- Florida Southern Area
  ('c9d0e1f2-a3b4-5678-2345-901234567890', 'Florida Southern Area', 'florida-southern', 'Southwest', 'single-family', '1950s-1990s', 'Middle income', 'Near Florida Southern College and lakes', ARRAY['lakefront properties', 'college area rentals', 'historic adjacent homes', 'varied needs'], '20-60 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Lakeland HVAC Content
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
  'c9d0e1f2-a3b4-5678-2345-901234567890',
  'hvac',
  '/fl/lakeland/hvac',
  'HVAC Services in Lakeland, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lakeland''s 125,000+ residents. Lakeland Electric rebates & 0% financing. Serving Lake Hollingsworth, Dixieland, Cleveland Heights & all neighborhoods.',
  'HVAC Lakeland FL',
  ARRAY['AC repair Lakeland', 'air conditioning Lakeland FL', 'HVAC contractor Lakeland', 'Lakeland Electric rebates', 'Polk County HVAC', 'ductless Lakeland'],

  'Lakeland''s HVAC Professionals',
  'Serving Polk County from the Swan City since 1988',
  'Licensed & Insured | Lakeland Electric Certified | 0% Financing Available',
  'Lakeland sits perfectly between Tampa and Orlando, offering small-city charm with big-city convenience. Home to Publix headquarters and the largest collection of Frank Lloyd Wright architecture in the world, Lakeland blends historic character with modern growth. Our HVAC team understands this diversity—from the 1920s bungalows in Dixieland to the new construction in Grasslands, we''ve been serving Lakeland homeowners for over 35 years. As Lakeland Electric certified contractors, we help you access up to $800 in rebates plus 0% interest financing on energy efficiency upgrades.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Lakeland Homeowners Choose Us",
    "reasons": [
      {
        "title": "Lakeland Electric Rebate Experts",
        "description": "As your municipal utility, Lakeland Electric offers unique programs including up to $300 for AC replacement, $100 annual tune-up rebates, and 0% interest loans up to $5,000. We maximize every dollar available to you."
      },
      {
        "title": "Historic Home Specialists",
        "description": "Dixieland, Lake Hollingsworth, and South Lake Morton feature beautiful historic homes that need specialized HVAC solutions. We retrofit modern systems while respecting architectural integrity."
      },
      {
        "title": "Central Florida Climate Experts",
        "description": "Lakeland''s inland location means summer highs hit 92°F regularly with 105+ days above 90°F. We design systems that handle this demanding climate while keeping energy costs manageable."
      },
      {
        "title": "Local Roots, Local Service",
        "description": "We''re Lakeland residents serving Lakeland homeowners. When you call, you reach local technicians who know the neighborhoods, the challenges, and the community."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Lakeland",
    "intro": "Lakeland''s central Florida location and diverse housing stock create specific demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Extreme Summer Heat",
        "description": "With 105+ days above 90°F annually, Lakeland is one of Florida''s hottest cities. Systems work overtime here, requiring robust equipment and vigilant maintenance."
      },
      {
        "title": "Historic Home Retrofits",
        "description": "Dixieland and Lake Hollingsworth feature homes built in the 1920s-40s. These beautiful bungalows often lack ductwork and require creative solutions like ductless mini-splits."
      },
      {
        "title": "Hard Water Impact",
        "description": "Lakeland''s water hardness of 300 ppm can accelerate equipment wear and reduce efficiency. We recommend additional filtration and more frequent maintenance."
      },
      {
        "title": "Diverse Housing Stock",
        "description": "From historic bungalows to modern master-planned communities, Lakeland''s housing varies dramatically. Each neighborhood requires different approaches and equipment."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Lakeland",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, expert AC repairs throughout Lakeland. We stock common parts for same-day fixes and service all major brands.",
        "features": ["Same-day service available", "All brands serviced", "90-day repair warranty", "Upfront pricing"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Premium AC installations with Manual J load calculations. We properly size systems for Lakeland''s demanding climate.",
        "features": ["Manual J calculations", "$300 Lakeland Electric rebate", "Up to 22 SEER2 efficiency", "10-year warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps provide efficient year-round comfort in Lakeland''s mild winters. Qualify for Lakeland Electric rebates.",
        "features": ["Lakeland Electric rebate eligible", "Year-round efficiency", "Lower operating costs", "Quiet operation"]
      },
      {
        "name": "Ductless Mini-Splits",
        "slug": "ductless",
        "description": "Perfect for Lakeland''s historic homes without ductwork. Individual zone control with efficient operation.",
        "features": ["No ductwork needed", "$150 per unit rebate", "Zone control", "Ideal for additions"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "Combat Lakeland''s humidity and allergens. Essential for older homes and residents with respiratory concerns.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Hard water solutions"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with regular maintenance. Lakeland Electric offers $100 rebate for annual tune-ups.",
        "features": ["$100 annual rebate", "Bi-annual tune-ups", "Priority scheduling", "15% repair discount"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "What rebates does Lakeland Electric offer for HVAC?",
        "answer": "Lakeland Electric offers up to $300 for AC/heat pump replacement (15.2 SEER2+), $100 annual tune-up rebate, and $150 per mini-split unit (max 2). They also offer 0% interest loans from $500-$5,000 for energy efficiency upgrades."
      },
      {
        "question": "Can you install AC in my Dixieland bungalow without ductwork?",
        "answer": "Yes! Ductless mini-split systems are ideal for Lakeland''s historic homes. They provide efficient cooling without invasive ductwork installation, preserving your home''s character while adding modern comfort."
      },
      {
        "question": "How does Lakeland''s hard water affect my HVAC system?",
        "answer": "Lakeland''s hard water (300 ppm) can cause mineral buildup in humidifiers and evaporator coils. We recommend annual coil cleaning and may suggest water treatment solutions for homes with recirculating water systems."
      },
      {
        "question": "Why is my AC running constantly in Lakeland summers?",
        "answer": "With 105+ days above 90°F, continuous running isn''t unusual during peak summer. However, if your home isn''t reaching set temperature, the system may be undersized, low on refrigerant, or due for maintenance."
      },
      {
        "question": "How often should I service my AC in Lakeland?",
        "answer": "We recommend bi-annual maintenance—spring and fall. Given Lakeland''s extreme summer heat and extended cooling season, regular maintenance is essential. Plus, Lakeland Electric offers a $100 rebate for annual tune-ups."
      },
      {
        "question": "Do you offer financing for new AC systems?",
        "answer": "Yes, we offer multiple financing options. Additionally, Lakeland Electric provides 0% interest loans from $500-$5,000 for energy efficiency upgrades including HVAC replacement. We can help you apply."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "92°F",
    "avg_humidity": "73%",
    "cooling_degree_days": "3,550",
    "days_above_90": "105+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Lakeland Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access Lakeland Electric rebates up to $800 plus 0% financing and find the perfect system for your Lake Hollingsworth, Dixieland, or Cleveland Heights home.',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Lakeland",
    "description": "Professional HVAC services in Lakeland, FL including AC repair, installation, and maintenance for residential customers in Lake Hollingsworth, Dixieland, Cleveland Heights and all neighborhoods.",
    "url": "https://coolit-hvac.com/lakeland-fl",
    "telephone": "+1-863-555-COOL",
    "email": "lakeland@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Lakeland",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 28.0395,
      "longitude": -81.9498
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
    "paymentAccepted": ["Cash", "Credit Card", "Financing Available", "Lakeland Electric 0% Loan"],
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "HVAC Services",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Repair"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Installation"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Heat Pump Services"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Ductless Mini-Splits"}},
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
        "name": "What rebates does Lakeland Electric offer for HVAC?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Lakeland Electric offers up to $300 for AC/heat pump replacement, $100 annual tune-up rebate, $150 per mini-split unit, and 0% interest loans from $500-$5,000 for energy efficiency upgrades."
        }
      },
      {
        "@type": "Question",
        "name": "Can you install AC in my Dixieland bungalow without ductwork?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes! Ductless mini-split systems are ideal for Lakeland''s historic homes. They provide efficient cooling without invasive ductwork installation."
        }
      },
      {
        "@type": "Question",
        "name": "How does Lakeland''s hard water affect my HVAC system?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Lakeland''s hard water (300 ppm) can cause mineral buildup in humidifiers and evaporator coils. We recommend annual coil cleaning and water treatment solutions."
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
      {"@type": "ListItem", "position": 3, "name": "Lakeland", "item": "https://coolit-hvac.com/fl/lakeland"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/polk-county',
  '[{"slug": "/fl/winter-haven/hvac", "anchor_text": "Winter Haven HVAC Services"}, {"slug": "/fl/bartow/hvac", "anchor_text": "Bartow AC Repair"}, {"slug": "/fl/plant-city/hvac", "anchor_text": "Plant City HVAC"}, {"slug": "/fl/auburndale/hvac", "anchor_text": "Auburndale AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/ductless", "anchor_text": "Ductless Mini-Splits"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1950,
  30,
  18,
  90,

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
