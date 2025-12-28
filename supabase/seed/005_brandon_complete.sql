-- ============================================
-- Brandon, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- Note: Brandon is a CDP (Census Designated Place), not incorporated city
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Brandon Core Data
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
  'd4e5f6a7-b8c9-0123-def0-456789012345', -- Fixed UUID for Brandon
  'Brandon',
  'brandon',
  'Florida',
  'FL',
  'Hillsborough',
  'hillsborough-county',
  27.9378,
  -82.2859,
  ARRAY['33508', '33509', '33510', '33511', '33527', '33534', '33569', '33578', '33579', '33584', '33594', '33596'],
  'Tampa Bay',
  ARRAY['a1b2c3d4-e5f6-7890-abcd-ef1234567890']::uuid[], -- Tampa
  true,
  80
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Brandon Research Data
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
  'd4e5f6a7-b8c9-0123-def0-456789012345',
  NOW(),

  -- Demographics
  118805,
  'US Census Bureau 2024 Estimate',
  77068,
  296800,
  67.0,
  ARRAY['single-family', 'townhome', 'condo'],
  '{"pre-1980": 15, "1980s-1990s": 35, "2000s-2010s": 35, "2020s": 15}'::jsonb,

  -- Climate (similar to Tampa - 12 miles east)
  91,
  52,
  74,
  3500,
  92,
  46.0,
  'moderate',
  'Inland location slightly warmer than coastal Tampa Bay. Less salt air exposure. Humid subtropical climate with afternoon thunderstorms in summer. Hurricane risk moderate but inland position provides some protection from storm surge.',

  -- Local Context
  ARRAY['Brandon Regional Hospital', 'Westfield Brandon', 'Hillsborough County Schools', 'Amazon Distribution', 'Publix Distribution', 'Walmart', 'Target', 'Progressive Insurance (Riverview)'],
  ARRAY['Westfield Brandon Mall', 'TopGolf Tampa', 'Hillsborough River State Park', 'Alafia River State Park', 'FishHawk Ranch', 'Brandon Parkway Trail'],
  ARRAY['Brandon Independence Day Parade', 'Brandon Balloon Classic', 'Riverfest', 'Strawberry Festival (Plant City nearby)'],
  ARRAY['Hillsborough County Public Schools'],
  'Largest unincorporated community in Florida. Rapid growth in Riverview, Valrico, and FishHawk Ranch areas. New master-planned communities. Major retail expansion along SR-60 corridor.',

  -- Utilities & Rebates (TECO serves Brandon/Hillsborough)
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {
      "amount": 135,
      "requirements": "Minimum SEER 16.0 or SEER2 15.2",
      "notes": "Rebate deducted from invoice by contractor"
    },
    "ecm_motor": {
      "amount": 115,
      "requirements": "High efficiency ECM motor retrofit"
    },
    "smart_thermostat": {
      "amount": 50,
      "requirements": "ENERGY STAR certified smart thermostat"
    }
  }'::jsonb,
  'TECO Peoples Gas',
  'Hillsborough County Utilities',
  195,

  -- Building/Codes
  'Florida Building Code 7th Edition, Hillsborough County amendments. SEER2 minimum 14.3 for split systems.',
  'Permits required for HVAC replacement. Hillsborough County Building Services. Online applications through eTRAKiT system.',
  'high',

  -- Competitors
  ARRAY['Easy AC', 'Cornerstone Pros', 'Del-Air', 'Super Heat & Air', 'Climate Masters', 'Air Rescue'],

  -- Research Sources
  '{
    "population": "US Census Bureau 2024",
    "income": "US Census Bureau ACS 2023",
    "housing": "US Census, City-Data.com",
    "climate": "NOAA, derived from Tampa data",
    "utilities": "Tampa Electric Company (TECO)",
    "neighborhoods": "Local real estate sources, Wikipedia"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Brandon Area Neighborhoods
-- ============================================

-- Brandon Core
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Brandon Core', 'brandon-core', 'Central Brandon', 'mixed', '1970s-1990s established homes', 'middle', 'Westfield Brandon Mall, restaurants, convenient location, mature neighborhoods', ARRAY['aging 1980s-90s systems', 'R-22 refrigerant phase-out', 'ductwork deterioration'], '20-35 years', 1, true),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Providence Lakes', 'providence-lakes', 'Central Brandon', 'single-family', '1990s-2000s planned community', 'upper-middle', 'Master-planned community, lakes, community amenities, good schools', ARRAY['builder-grade systems aging', 'warranty expirations', 'efficiency upgrades needed'], '15-25 years', 2, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Heather Lakes', 'heather-lakes', 'Central Brandon', 'single-family', '1980s-1990s homes', 'middle', 'Established neighborhood, lakes, family-friendly', ARRAY['older system replacement', 'ductwork issues', 'humidity control'], '25-35 years', 3, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Kensington', 'kensington', 'Central Brandon', 'single-family', '1990s-2000s homes', 'upper-middle', 'Upscale community, quality homes, good schools', ARRAY['aging systems', 'smart thermostat upgrades', 'efficiency improvements'], '15-25 years', 4, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Valrico Area
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Valrico', 'valrico', 'East Brandon', 'single-family', '1990s-2010s suburban', 'upper-middle', 'Spanish for "rich valley", spacious lots, family-oriented, I-75 access', ARRAY['varied system ages', 'larger home zoning challenges', 'two-story airflow issues'], '10-25 years', 5, true),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Bloomingdale', 'bloomingdale', 'East Brandon', 'single-family', '1980s-2000s planned community', 'upper-middle', 'Master-planned, golf course, community pools, excellent schools', ARRAY['aging systems', 'HOA equipment requirements', 'efficiency upgrades'], '15-30 years', 6, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Buckhorn', 'buckhorn', 'East Brandon', 'single-family', '1990s-2000s homes', 'upper-middle', 'Growing area, newer schools, family community', ARRAY['builder-grade replacement', 'system sizing issues', 'smart home integration'], '15-25 years', 7, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'FishHawk Ranch', 'fishhawk-ranch', 'Southeast Brandon', 'single-family', '2000s-2020s master-planned', 'upper', 'Award-winning master-planned community, 25 miles of trails, A-rated schools, certified green community', ARRAY['newer system maintenance', 'smart home HVAC', 'warranty coordination'], '5-15 years', 8, true)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Riverview Area
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Riverview', 'riverview', 'South Brandon', 'single-family', '2000s-2020s new construction', 'middle', 'Rapidly growing area, new communities, young families, affordable new construction', ARRAY['builder-grade equipment', 'new home warranty issues', 'proper break-in maintenance'], '1-15 years', 9, true),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Panther Trace', 'panther-trace', 'South Brandon', 'single-family', '2000s-2010s planned community', 'upper-middle', 'Master-planned, community amenities, good schools', ARRAY['aging builder-grade systems', 'efficiency upgrades', 'smart thermostat adoption'], '10-20 years', 10, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Summerfield', 'summerfield', 'South Brandon', 'single-family', '1990s-2000s established community', 'middle', 'Established neighborhood, community pools, family-friendly', ARRAY['system replacement wave', 'ductwork aging', 'R-22 phase-out'], '15-25 years', 11, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'SouthFork', 'southfork', 'South Brandon', 'single-family', '2000s-2010s planned community', 'upper-middle', 'Master-planned, lakes, walking trails, newer homes', ARRAY['builder equipment aging', 'two-story challenges', 'humidity control'], '10-20 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- North/West Brandon
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Mango', 'mango', 'North Brandon', 'single-family', '1970s-1990s homes', 'middle', 'Established area, convenient to Tampa, affordable', ARRAY['older system replacement', 'ductwork issues', 'efficiency upgrades'], '25-40 years', 13, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Seffner', 'seffner', 'North Brandon', 'single-family', '1970s-1990s homes', 'middle', 'Rural feel, larger lots, affordable housing', ARRAY['older systems', 'well water impact on equipment', 'attic ductwork issues'], '25-35 years', 14, false),
  ('d4e5f6a7-b8c9-0123-def0-456789012345', 'Palm River-Clair Mel', 'palm-river', 'West Brandon', 'single-family', '1960s-1980s homes', 'middle', 'Close to Tampa, affordable, diverse community', ARRAY['aging equipment', 'older construction challenges', 'budget-conscious repairs'], '30-40 years', 15, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT - Brandon HVAC
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
  'd4e5f6a7-b8c9-0123-def0-456789012345',
  'hvac',
  '/fl/brandon/hvac',
  'HVAC Repair & AC Service in Brandon, FL | CoolIt',
  '24/7 AC repair in Brandon, FL. Serving Valrico, Riverview & FishHawk Ranch. Same-day service, TECO rebate certified. Florida''s largest unincorporated community.',
  'HVAC repair Brandon FL',
  ARRAY['AC repair Brandon', 'air conditioning Brandon FL', 'HVAC Valrico', 'AC repair Riverview FL', 'FishHawk Ranch HVAC', 'Brandon AC replacement'],

  'Trusted AC Repair & HVAC Service in Brandon, FL',
  'Florida''s largest unincorporated community sees 92 days above 90°F annually. From established Brandon neighborhoods to new construction in Riverview and FishHawk Ranch, we respond in 60 minutes with expert HVAC service.',
  'Trusted by 2,000+ Brandon area homeowners | 4.9 stars | TECO rebate certified',

  'Brandon and the surrounding communities of Valrico, Riverview, and FishHawk Ranch represent one of Tampa Bay''s fastest-growing regions—and one with diverse HVAC needs. With 118,000 residents making Brandon Florida''s largest unincorporated community, plus explosive growth in new construction to the south and east, the area presents a unique mix of aging 1980s systems and brand-new builder-grade equipment.

The inland location means Brandon homes experience slightly higher temperatures than coastal Tampa Bay, with 92 days above 90°F and similar humidity levels. Unlike beach communities, salt air corrosion isn''t a concern—but the concentration of homes built during the 1980s-90s development boom means many systems are simultaneously reaching end of life.

CoolIt serves the entire Brandon area including Valrico, Bloomingdale, FishHawk Ranch, Riverview, and surrounding communities. Whether you''re dealing with an aging system in established Brandon or optimizing a new installation in Riverview, our technicians understand the specific challenges of each neighborhood. We''re TECO certified, helping area homeowners maximize rebates on qualifying system upgrades.',

  '[
    {
      "title": "60-Minute Response Across Greater Brandon",
      "content": "Brandon''s sprawling geography—from Mango to FishHawk Ranch—requires technicians who know the area. Our Brandon-based team responds within 60 minutes whether you''re in core Brandon, Valrico, Riverview, or the newer communities. We navigate the growth traffic to get you comfortable fast.",
      "local_reference": "Covering Brandon, Valrico, Riverview, FishHawk, Bloomingdale, and surrounding areas"
    },
    {
      "title": "New Construction & Builder-Grade Specialists",
      "content": "Riverview and FishHawk Ranch''s new communities often come with builder-grade HVAC that may be undersized or poorly installed. We evaluate new home systems, catch warranty issues, and help homeowners understand when upgrades make sense. Don''t assume new means optimal.",
      "local_reference": "Essential for FishHawk Ranch, Riverview, and all new construction communities"
    },
    {
      "title": "1980s-90s System Replacement Experts",
      "content": "Core Brandon and established Valrico neighborhoods are experiencing a wave of HVAC replacements as original equipment fails. We help homeowners navigate the R-22 phase-out, understand modern efficiency options, and select right-sized systems for homes that may have been poorly sized originally.",
      "local_reference": "Serving Providence Lakes, Bloomingdale, Heather Lakes, and established Brandon"
    },
    {
      "title": "TECO Rebate Certified",
      "content": "Tampa Electric serves the entire Brandon area, and we''re certified to process TECO rebates on qualifying installations. Current programs offer $135 for high-efficiency systems, plus rebates for smart thermostats and ECM motor upgrades. We handle the paperwork.",
      "local_reference": "All Brandon/Hillsborough County TECO customers eligible"
    }
  ]'::jsonb,

  '[
    {
      "title": "1980s-90s Systems Reaching End of Life",
      "problem": "Brandon''s core neighborhoods—Providence Lakes, Heather Lakes, Bloomingdale—were developed during Florida''s 1980s-90s population boom. Original HVAC equipment from this era is now 25-40 years old, well past typical lifespan. These systems use R-22 refrigerant, which is no longer manufactured and increasingly expensive.",
      "why_here": "Approximately 35% of Brandon-area homes were built during this period. The simultaneous aging of equipment across these neighborhoods creates high demand for replacement services during peak summer months.",
      "solution": "We help homeowners evaluate repair vs. replacement for aging systems. Modern equipment offers 30-40% better efficiency than 1990s units, and TECO rebates offset upgrade costs. We explain R-22 conversion options honestly—sometimes full replacement is more economical."
    },
    {
      "title": "Builder-Grade Equipment in New Communities",
      "problem": "Riverview, FishHawk Ranch, and other rapidly-growing areas feature thousands of new homes with builder-installed HVAC. While new, this equipment is often the minimum quality needed to meet code—undersized for Florida''s demands, with basic thermostats and minimal warranties.",
      "why_here": "Brandon-area new construction has exploded, with Riverview among Florida''s fastest-growing communities. Homebuyers focused on price may not realize their ''new'' HVAC is already inadequate.",
      "solution": "We offer new home HVAC evaluations to identify sizing issues, installation defects, and upgrade opportunities. Many builder systems benefit from smart thermostat additions and proper commissioning that wasn''t done at installation."
    },
    {
      "title": "Two-Story Home Airflow Challenges",
      "problem": "Many Brandon-area homes, particularly in Valrico and newer communities, are two-story construction. Standard single-zone systems struggle to cool upstairs bedrooms, resulting in temperature differences of 5-10°F between floors and uncomfortable sleeping conditions.",
      "why_here": "Two-story homes are prevalent in Brandon''s planned communities. Florida''s intense afternoon sun heats upstairs spaces while single-zone systems struggle to distribute conditioned air effectively.",
      "solution": "We install zoning systems that independently control upstairs and downstairs temperatures. Smart thermostats with remote sensors optimize comfort across multi-level homes. Ductwork modifications can improve airflow to struggling second floors."
    }
  ]'::jsonb,

  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair across the greater Brandon area. We diagnose and fix compressor failures, refrigerant issues, electrical problems, and airflow restrictions. 24/7 emergency service with 60-minute response throughout Brandon, Valrico, and Riverview.",
      "local_context": "Brandon''s inland location means slightly higher temperatures than coastal Tampa Bay. AC failure in summer is a genuine emergency we prioritize."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Expert AC installation properly sized for Brandon-area homes. We install all major brands with load calculations tailored to your home''s construction and your family''s needs. Every installation includes TECO rebate processing.",
      "local_context": "We help Brandon homeowners replace aging 1980s-90s systems and evaluate builder-grade equipment in new construction communities."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump service for Brandon''s mild winter heating needs. Efficient supplemental heating for the few weeks each year when temperatures drop.",
      "local_context": "Brandon''s inland location can see slightly cooler winter nights than the coast. Heat pumps provide efficient comfort during cold snaps."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance including refrigerant check, electrical testing, condensate drain cleaning, and airflow verification. Our 21-point inspection catches problems before they become emergencies.",
      "local_context": "Annual maintenance is essential for Brandon systems working through 92+ days above 90°F. Spring tune-ups prevent summer breakdowns."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Humidity control and air purification for Brandon homes. Whole-house dehumidifiers, UV germicidal lights, and advanced filtration improve comfort and health.",
      "local_context": "Brandon''s 74% average humidity creates conditions for mold growth. Proper humidity control is essential for healthy indoor air."
    },
    {
      "name": "Zoning Systems",
      "description": "Multi-zone HVAC solutions for two-story and large Brandon homes. Independent temperature control for different areas eliminates hot spots and improves comfort.",
      "local_context": "Many Brandon and Valrico homes are two-story construction with temperature stratification issues. Zoning solves upstairs/downstairs comfort problems."
    }
  ]'::jsonb,

  '[
    {
      "question": "How much does AC repair cost in Brandon?",
      "answer": "Most Brandon AC repairs cost $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins.",
      "is_local_specific": true
    },
    {
      "question": "Do you serve Riverview and FishHawk Ranch?",
      "answer": "Yes, we serve the entire greater Brandon area including Riverview, FishHawk Ranch, Valrico, Bloomingdale, Lithia, and surrounding communities. Our Brandon-based technicians know the area well and respond within 60 minutes.",
      "is_local_specific": true
    },
    {
      "question": "Should I replace my 1990s Brandon home''s original AC?",
      "answer": "If your Brandon home still has its original 1980s-90s system, replacement is typically the best option. These systems use R-22 refrigerant (no longer manufactured), operate at far lower efficiency than modern equipment, and are well past typical 15-20 year lifespan. New systems can cut energy costs 30-40%.",
      "is_local_specific": true
    },
    {
      "question": "What TECO rebates are available for Brandon homeowners?",
      "answer": "Tampa Electric offers Brandon-area homeowners $135 for qualifying high-efficiency AC systems (SEER 16.0+ or SEER2 15.2+), $115 for ECM motor upgrades, and $50 for ENERGY STAR smart thermostats. We handle all rebate paperwork and deduct from your invoice.",
      "is_local_specific": true
    },
    {
      "question": "My FishHawk Ranch home is new—does the AC need service?",
      "answer": "Yes, even new FishHawk Ranch and Riverview homes benefit from professional HVAC evaluation. Builder-installed equipment may be undersized, improperly installed, or using basic controls. We catch issues before warranty expires and ensure your system is optimized.",
      "is_local_specific": true
    },
    {
      "question": "Why is my upstairs so much hotter than downstairs?",
      "answer": "Many two-story Brandon and Valrico homes have single-zone HVAC struggling to cool upstairs. Hot air rises, Florida sun heats roof spaces, and ductwork may not deliver adequate airflow upstairs. Solutions include zoning systems, ductwork modifications, and smart thermostats with remote sensors.",
      "is_local_specific": true
    }
  ]'::jsonb,

  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "74%",
    "days_above_90": "92 days/year",
    "cooling_degree_days": "3,500+",
    "most_common_ac_issue": "Aging 1980s-90s systems & new construction sizing",
    "median_home_age": "1995",
    "local_utility": "Tampa Electric (TECO)",
    "rebates_available": "Yes - up to $300 combined for qualifying systems & accessories",
    "source": "NOAA, US Census, Tampa Electric"
  }'::jsonb,

  'Ready for Reliable HVAC Service in Brandon?',
  'From established Brandon neighborhoods to new construction in Riverview and FishHawk Ranch, CoolIt delivers expert AC service across Florida''s largest unincorporated community. With 60-minute response, TECO rebate expertise, and knowledge of both aging systems and new home challenges, we keep Brandon-area homes comfortable. Call now for same-day service.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in Brandon, FL. Serving Brandon, Valrico, Riverview, FishHawk Ranch. TECO rebate certified.",
    "url": "https://coolit.com/fl/brandon/hvac",
    "telephone": "+1-813-555-COOL",
    "priceRange": "$$",
    "address": {"@type": "PostalAddress", "addressLocality": "Brandon", "addressRegion": "FL", "postalCode": "33511", "addressCountry": "US"},
    "geo": {"@type": "GeoCoordinates", "latitude": 27.9378, "longitude": -82.2859},
    "areaServed": [
      {"@type": "Place", "name": "Brandon, FL"},
      {"@type": "Place", "name": "Valrico, FL"},
      {"@type": "Place", "name": "Riverview, FL"},
      {"@type": "Place", "name": "FishHawk Ranch, FL"}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {"@type": "Question", "name": "How much does AC repair cost in Brandon?", "acceptedAnswer": {"@type": "Answer", "text": "Most Brandon AC repairs cost $150-$600 depending on the issue."}},
      {"@type": "Question", "name": "Do you serve Riverview and FishHawk Ranch?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we serve the entire greater Brandon area including Riverview, FishHawk Ranch, Valrico, and surrounding communities."}},
      {"@type": "Question", "name": "What TECO rebates are available?", "acceptedAnswer": {"@type": "Answer", "text": "TECO offers $135 for high-efficiency AC systems, $115 for ECM motors, and $50 for smart thermostats."}}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Hillsborough County", "item": "https://coolit.com/fl/hillsborough-county"},
      {"@type": "ListItem", "position": 4, "name": "Brandon HVAC", "item": "https://coolit.com/fl/brandon/hvac"}
    ]
  }'::jsonb,

  '/fl/hillsborough-county/hvac',
  '[
    {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC services"},
    {"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland AC repair"},
    {"slug": "/fl/plant-city/hvac", "anchor_text": "Plant City HVAC"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"},
    {"slug": "/services/zoning", "anchor_text": "zoning systems"}
  ]'::jsonb,

  1080,
  15,
  18,
  83,

  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  version = city_seo_content.version + 1,
  updated_at = NOW();
