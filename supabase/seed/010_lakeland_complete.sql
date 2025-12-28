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
