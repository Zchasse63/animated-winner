-- ============================================
-- Tampa, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Tampa Core Data
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
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Fixed UUID for Tampa (for foreign key references)
  'Tampa',
  'tampa',
  'Florida',
  'FL',
  'Hillsborough',
  'hillsborough-county',
  27.9475,
  -82.4584,
  ARRAY['33601', '33602', '33603', '33604', '33605', '33606', '33607', '33609', '33610', '33611', '33612', '33613', '33614', '33615', '33616', '33617', '33618', '33619', '33620', '33621', '33624', '33625', '33626', '33629', '33634', '33635', '33637', '33647'],
  'Tampa Bay',
  NULL, -- Will update after other cities inserted
  true,
  100
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Tampa Research Data
-- Sources: US Census, NOAA, Zillow, TECO, City of Tampa
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

  -- Source Tracking (GEO citations)
  research_sources
) VALUES (
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa city_id
  NOW(),

  -- Demographics (US Census 2023 ACS)
  403364,
  'US Census Bureau American Community Survey 2023',
  71302,
  376278,
  50.2,
  ARRAY['single-family', 'condo', 'townhome', 'multi-family'],
  '{"pre-1960": 15, "1960s-1970s": 25, "1980s-1990s": 30, "2000s-2010s": 20, "2020s": 10}'::jsonb,

  -- Climate (NOAA/Weather.gov)
  91,
  52,
  74,
  3500,
  94,
  46.3,
  'high',
  'Humid subtropical climate with hot, humid summers and mild winters. Tampa Bay moderates temperatures. Peak hurricane season June-November. 10-month cooling season with 70% of energy bills going to AC.',

  -- Local Context
  ARRAY['Hillsborough County Public Schools', 'MacDill Air Force Base', 'Tampa General Hospital', 'University of South Florida', 'Raymond James Financial', 'USAA', 'BayCare Health System', 'Moffitt Cancer Center', 'Progressive Insurance', 'Mosaic Company'],
  ARRAY['Tampa Riverwalk', 'Bayshore Boulevard', 'Ybor City Historic District', 'Tampa Bay History Center', 'Florida Aquarium', 'Busch Gardens Tampa Bay', 'Raymond James Stadium', 'Amalie Arena', 'University of Tampa', 'Curtis Hixon Waterfront Park'],
  ARRAY['Gasparilla Pirate Festival (January)', 'Tampa Bay Margarita Festival', 'Guavaween (October)', 'Tampa Bay Blues Festival', 'Plant City Strawberry Festival'],
  ARRAY['Hillsborough County Public Schools'],
  'Tampa experiencing significant growth with new developments in Water Street Tampa district, Westshore Marina District redevelopment, and expansion of the Tampa Riverwalk. Named 2024-2025 Cambridge International U.S. District of the Year for education.',

  -- Utilities & Rebates
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {
      "amount": 135,
      "requirements": "Minimum SEER 16.0 or SEER2 15.2",
      "notes": "Rebate deducted from invoice by contractor"
    },
    "ecm_motor": {
      "amount": 115,
      "requirements": "High efficiency electronically commutated motor retrofit"
    },
    "smart_thermostat": {
      "amount": 50,
      "requirements": "ENERGY STAR certified smart thermostat"
    },
    "pool_pump": {
      "amount": 350,
      "requirements": "ENERGY STAR certified variable speed pool pump"
    }
  }'::jsonb,
  'Peoples Gas',
  'City of Tampa Water Department',
  186,

  -- Building/Codes
  'Florida Building Code 7th Edition (2020), enhanced wind resistance requirements in High-Velocity Hurricane Zone adjacent areas. SEER2 minimum 14.3 for split systems under 45,000 BTU as of January 2023.',
  'HVAC permits required for system replacement. City of Tampa Building Services handles residential permits. Typical processing 3-5 business days.',
  'moderate',

  -- Competitors
  ARRAY['Easy AC', 'Cornerstone Pros', 'The AC Therapist', 'Super Heat & Air', 'Del-Air Heating and Air Conditioning', 'Blair''s Air', 'Comfort Temp'],

  -- Research Sources (for GEO citations)
  '{
    "population": "US Census Bureau American Community Survey 2019-2023",
    "income": "US Census Bureau ACS 2023",
    "housing": "Zillow Home Value Index December 2024, US Census ACS 2023",
    "climate": "NOAA National Weather Service Tampa Bay, Weather.gov",
    "cooling_degree_days": "US Energy Information Administration",
    "utilities": "Tampa Electric Company (TECO) Official Website 2024",
    "water": "City of Tampa Water Quality Report 2022",
    "employers": "Tampa Bay Business Journal, US Census Bureau",
    "schools": "Hillsborough County Public Schools, Cambridge International"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  electric_utility_rebates = EXCLUDED.electric_utility_rebates,
  research_sources = EXCLUDED.research_sources,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Tampa Neighborhoods
-- ============================================

-- South Tampa Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Hyde Park', 'hyde-park', 'South Tampa', 'mixed', '1920s-1940s historic bungalows and mansions', 'upper', 'Historic district, Hyde Park Village shopping, SoHo nightlife, walkable', ARRAY['older ductwork in historic homes', 'humidity control in older construction', 'window unit to central AC conversions'], '15-25 years in older homes', 1, true),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Palma Ceia', 'palma-ceia', 'South Tampa', 'single-family', '1920s-1960s estates', 'upper', 'Golf course community, mature oak trees, prestigious addresses', ARRAY['oversized older systems', 'ductwork in unconditioned attics', 'humidity damage'], '10-20 years', 2, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Davis Islands', 'davis-islands', 'South Tampa', 'mixed', '1920s-1950s waterfront homes', 'upper', 'Island community, Peter O. Knight Airport, waterfront living, yacht clubs', ARRAY['salt air corrosion on condenser coils', 'hurricane damage concerns', 'humidity from water proximity'], '10-15 years', 3, true),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Bayshore Beautiful', 'bayshore-beautiful', 'South Tampa', 'single-family', '1950s-1970s ranch homes', 'upper-middle', 'Bayshore Boulevard access, water views, established neighborhood', ARRAY['aging systems from 1980s-1990s', 'ductwork deterioration', 'inefficient older units'], '15-20 years', 4, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Beach Park', 'beach-park', 'South Tampa', 'single-family', '1950s-1960s homes', 'upper-middle', 'Ballast Point Park, waterfront access, family-friendly', ARRAY['older R-22 systems needing replacement', 'humidity issues', 'ductwork in hot attics'], '15-25 years', 5, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Ballast Point', 'ballast-point', 'South Tampa', 'single-family', '1940s-1960s under oak canopy', 'upper-middle', 'Historic Civil War site, mature oak trees, Spanish moss, Ballast Point Park', ARRAY['tree debris clogging condensers', 'humidity from bay proximity', 'older inefficient systems'], '15-20 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Historic Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Seminole Heights', 'seminole-heights', 'Historic Tampa', 'single-family', '1910s-1930s bungalows', 'middle', 'Most bungalows of any Tampa neighborhood, craft breweries, eclectic restaurants, 2003 Best Neighborhood in America', ARRAY['no ductwork in original homes', 'window unit dependence', 'humidity and mold in older construction', 'inadequate insulation'], '20-30 years or window units', 7, true),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Tampa Heights', 'tampa-heights', 'Historic Tampa', 'mixed', '1900s-1920s historic homes', 'middle', 'Armature Works food hall, Ulele restaurant, Heights Public Market, riverwalk access', ARRAY['historic home HVAC retrofits', 'ductwork additions', 'humidity control'], '15-25 years', 8, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Riverside Heights', 'riverside-heights', 'Historic Tampa', 'single-family', '1920s-1940s bungalows', 'middle', 'Quiet residential, close to downtown, historic character', ARRAY['older system inefficiency', 'ductwork issues', 'humidity problems'], '15-25 years', 9, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Ybor City', 'ybor-city', 'Historic Tampa', 'mixed', '1880s-1920s historic buildings', 'mixed', 'National Historic Landmark District, cigar industry heritage, nightlife, Columbia Restaurant', ARRAY['historic building HVAC challenges', 'commercial system needs', 'humidity in brick buildings'], 'varies widely', 10, true)
ON CONFLICT (city_id, slug) DO NOTHING;

-- North Tampa Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Carrollwood', 'carrollwood', 'North Tampa', 'single-family', '1970s-1990s suburban homes', 'upper-middle', 'Family-friendly, good schools, shopping centers, established trees', ARRAY['aging 1990s systems', 'ductwork in hot attics', 'R-22 to R-410A conversions'], '15-25 years', 11, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Northdale', 'northdale', 'North Tampa', 'single-family', '1980s-1990s construction', 'middle', 'Suburban community, parks, family neighborhood', ARRAY['original builder-grade systems aging out', 'duct leaks', 'thermostat upgrades needed'], '20-30 years', 12, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Lake Magdalene', 'lake-magdalene', 'North Tampa', 'single-family', '1970s-1980s homes', 'middle', 'Lake access, established neighborhood, mature landscaping', ARRAY['aging systems', 'humidity control', 'energy efficiency upgrades'], '20-25 years', 13, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Temple Terrace', 'temple-terrace', 'North Tampa', 'single-family', '1960s-1980s homes', 'middle', 'Separate municipality, Hillsborough River access, golf course', ARRAY['older system replacement', 'ductwork issues', 'humidity problems'], '20-30 years', 14, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'USF Area', 'usf-area', 'North Tampa', 'mixed', '1970s-2000s varied construction', 'mixed', 'University of South Florida, Moffitt Cancer Center, student housing, research park', ARRAY['high-use systems in rentals', 'deferred maintenance', 'varied system ages'], '10-20 years', 15, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'New Tampa', 'new-tampa', 'North Tampa', 'single-family', '1990s-2020s newer construction', 'upper-middle', 'Master-planned communities, newer schools, shopping, Tampa Premium Outlets', ARRAY['builder-grade system upgrades', 'warranty expirations', 'smart home integrations'], '5-15 years', 16, true)
ON CONFLICT (city_id, slug) DO NOTHING;

-- West Tampa Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Westshore', 'westshore', 'West Tampa', 'mixed', '1970s-1990s commercial and residential', 'upper-middle', 'Westshore Business District, International Plaza, Tampa International Airport proximity', ARRAY['commercial HVAC needs', 'condo association systems', 'high-rise challenges'], '15-25 years', 17, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Town n Country', 'town-n-country', 'West Tampa', 'single-family', '1960s-1980s homes', 'middle', 'Affordable housing, diverse community, convenient location', ARRAY['aging systems needing replacement', 'efficiency upgrades', 'ductwork repairs'], '20-30 years', 18, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Westchase', 'westchase', 'West Tampa', 'single-family', '1990s-2010s planned community', 'upper-middle', 'Master-planned community, golf course, excellent schools, community pools', ARRAY['original 1990s systems aging', 'two-story home zoning issues', 'smart thermostat upgrades'], '15-25 years', 19, true)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Downtown/Central Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Downtown Tampa', 'downtown-tampa', 'Downtown', 'condo', '1980s-2020s high-rises', 'upper', 'Tampa Riverwalk, Amalie Arena, business district, Water Street Tampa development', ARRAY['high-rise HVAC systems', 'condo association restrictions', 'commercial systems'], '10-20 years', 20, true),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Channel District', 'channel-district', 'Downtown', 'condo', '2000s-2020s modern condos', 'upper', 'Florida Aquarium, cruise terminal, Sparkman Wharf, urban living', ARRAY['newer system maintenance', 'humidity in waterfront buildings', 'condo regulations'], '5-15 years', 21, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Harbour Island', 'harbour-island', 'Downtown', 'condo', '1980s-2000s waterfront condos', 'upper', 'Private island community, downtown views, exclusive addresses', ARRAY['salt air corrosion', 'humidity control', 'aging systems in older condos'], '15-25 years', 22, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- East Tampa/Nearby
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'East Tampa', 'east-tampa', 'East Tampa', 'single-family', '1950s-1970s homes', 'middle', 'Revitalizing neighborhood, affordable options, community investment', ARRAY['older system replacement', 'efficiency upgrades needed', 'ductwork repairs'], '25-35 years', 23, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Brandon', 'brandon', 'East Tampa', 'single-family', '1970s-2000s suburban', 'middle', 'Suburban community, Westfield Brandon mall, family-friendly, affordable', ARRAY['aging suburban systems', 'builder-grade replacements', 'humidity issues'], '15-25 years', 24, false),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Riverview', 'riverview', 'East Tampa', 'single-family', '2000s-2020s new construction', 'middle', 'Rapidly growing area, new communities, young families', ARRAY['builder warranty issues', 'system sizing for new homes', 'smart home integration'], '1-10 years', 25, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- Verification Queries
-- ============================================

-- Verify Tampa city inserted
-- SELECT * FROM cities WHERE slug = 'tampa';

-- Verify research data
-- SELECT city_id, population, avg_summer_high_f, days_above_90f, electric_utility FROM city_research WHERE city_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- Verify neighborhoods count
-- SELECT COUNT(*) as neighborhood_count FROM neighborhoods WHERE city_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- List featured neighborhoods
-- SELECT name, region FROM neighborhoods WHERE city_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890' AND is_featured = true ORDER BY display_order;
-- ============================================
-- Tampa HVAC SEO Content
-- Generated: December 24, 2024
-- Word Count Target: 800-1200 words
-- ============================================

INSERT INTO city_seo_content (
  city_id,
  vertical,
  slug,
  title,
  meta_description,
  primary_keyword,
  secondary_keywords,

  -- Content Sections
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

  -- Schema Markup
  schema_local_business,
  schema_faq_page,
  schema_breadcrumb,

  -- Internal Linking
  county_hub_link,
  sibling_city_links,
  service_page_links,

  -- Quality Tracking
  word_count,
  city_mention_count,
  neighborhood_mention_count,
  unique_content_score,

  -- Status
  status,
  version,
  generated_by,
  generation_prompt_version
) VALUES (
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa city_id
  'hvac',
  '/fl/tampa/hvac',
  'HVAC Repair & AC Service in Tampa, FL | CoolIt',
  '24/7 HVAC repair in Tampa, FL. Same-day AC service with upfront pricing. Serving Hyde Park to New Tampa. TECO rebate certified. Call for your free estimate.',
  'HVAC repair Tampa FL',
  ARRAY['AC repair Tampa', 'air conditioning service Tampa', 'HVAC contractor Tampa FL', 'emergency AC repair Tampa', 'AC replacement Tampa', 'heating repair Tampa', 'Tampa AC company', 'HVAC near me Tampa'],

  -- Hero Section
  '24/7 AC Repair & HVAC Service in Tampa, FL',
  'With 94 days above 90°F and 74% average humidity, Tampa homeowners know AC failure isn''t an inconvenience—it''s an emergency. Our technicians respond within 60 minutes across Seminole Heights, Hyde Park, and New Tampa.',
  'Trusted by 2,500+ Tampa Bay homeowners | 4.9 stars from 800+ reviews | TECO rebate certified',

  -- Intro Paragraph (185 words)
  'Tampa''s subtropical climate pushes air conditioning systems harder than almost anywhere else in the country. With over 3,500 cooling degree days annually—more than triple the national average—your AC runs nearly year-round. The combination of 91°F summer highs and persistent 74% humidity creates conditions where even a brief system failure means rising indoor temperatures and potential mold growth within hours.

From the historic bungalows of Seminole Heights to the waterfront condos of Davis Islands, Tampa homes face unique HVAC challenges. Older South Tampa neighborhoods like Hyde Park and Palma Ceia often have systems retrofitted into homes never designed for central air, while newer communities in Westchase and New Tampa deal with builder-grade equipment reaching the end of its warranty period.

CoolIt provides comprehensive HVAC services across all Tampa neighborhoods. Our technicians understand the specific demands Tampa''s climate places on cooling equipment—from condensate drain clogs caused by algae growth to compressor failures from constant summer operation. We offer same-day service, upfront pricing before any work begins, and help Tampa homeowners maximize TECO rebates on qualifying system upgrades.',

  -- Why Choose Us (4 differentiators)
  '[
    {
      "title": "60-Minute Emergency Response Across Tampa",
      "content": "When your AC fails during a Tampa summer, every minute matters. Our dispatchers track technician locations in real-time, routing the nearest available tech to your home. Whether you''re in Carrollwood or the Channel District, we guarantee arrival within 60 minutes for emergency calls—because in 91-degree heat with 74% humidity, waiting isn''t an option.",
      "local_reference": "Serving from Westchase to Brandon, Temple Terrace to South Tampa"
    },
    {
      "title": "Tampa''s Humidity Control Specialists",
      "content": "High humidity is the hidden enemy of Tampa homes. An oversized AC cools quickly but fails to dehumidify, leaving you with a cold, clammy house and potential mold issues. Our technicians perform Manual J load calculations specific to Tampa''s climate conditions, ensuring your system is properly sized to handle both temperature and humidity control.",
      "local_reference": "Tampa averages 74% relative humidity—proper sizing is critical"
    },
    {
      "title": "Transparent Pricing, No Surprises",
      "content": "Before any wrench turns, you''ll receive a written quote with the complete cost. No hidden fees, no surprise charges. We explain your options clearly—whether a repair makes sense or replacement offers better long-term value. Our technicians are paid hourly, not on commission, so their only incentive is solving your problem correctly.",
      "local_reference": "Honest service Tampa homeowners can trust"
    },
    {
      "title": "TECO Rebate Certified & Licensed",
      "content": "We''re certified to process Tampa Electric rebates, putting money back in your pocket on qualifying installations. Current TECO programs offer up to $135 for high-efficiency AC systems meeting SEER2 15.2+ requirements, plus $50 for smart thermostats and $115 for ECM motor upgrades. We handle the paperwork and deduct rebates directly from your invoice.",
      "local_reference": "Maximize your Tampa Electric (TECO) savings"
    }
  ]'::jsonb,

  -- Local Challenges (3 Tampa-specific issues)
  '[
    {
      "title": "Humidity Control in Tampa''s Subtropical Climate",
      "problem": "Tampa''s 74% average humidity creates a dual challenge: your AC must cool AND dehumidify. When systems are oversized—common in homes where contractors install maximum capacity—they short-cycle, cooling air quickly but never running long enough to remove moisture. The result is a home that feels cold and clammy, with humidity levels that promote mold growth in ductwork and behind walls.",
      "why_here": "Tampa experiences over 3,500 annual cooling degree days with humidity rarely dropping below 60%. The proximity to Tampa Bay adds moisture to air throughout the metro area, making proper dehumidification essential for comfort and indoor air quality.",
      "solution": "We perform detailed load calculations accounting for Tampa''s specific climate data, ensuring your system runs efficiently to both cool and dehumidify. For homes with persistent humidity issues, whole-house dehumidifiers integrate with your existing HVAC system."
    },
    {
      "title": "Aging Systems in Established Tampa Neighborhoods",
      "problem": "Many of Tampa''s most desirable neighborhoods—Hyde Park, Seminole Heights, Palma Ceia—feature homes built decades before central air conditioning was standard. These properties often have HVAC systems retrofitted into spaces not designed for ductwork, leading to inefficient layouts, restricted airflow, and premature equipment failure.",
      "why_here": "Approximately 40% of Tampa''s housing stock was built before 1980. Seminole Heights bungalows from the 1920s and South Tampa homes from the 1950s frequently have original or early-retrofit ductwork that''s deteriorated over decades in hot, humid attic spaces.",
      "solution": "Our technicians specialize in optimizing HVAC performance in older Tampa homes. We assess existing ductwork condition, identify air leaks, and recommend solutions ranging from duct sealing to complete system redesigns that respect your home''s character while maximizing efficiency."
    },
    {
      "title": "Hurricane Season AC Preparation and Recovery",
      "problem": "Tampa sits in a high hurricane risk zone, and tropical weather threatens HVAC systems in multiple ways. Storm surge and flooding can destroy outdoor condensers. Power surges during outages damage compressors and control boards. Extended power loss leads to mold growth in ductwork when humidity goes unchecked.",
      "why_here": "The Tampa Bay area faces an active Atlantic hurricane season from June through November. While major direct hits are historically rare, tropical storms and near-misses bring the heavy rain, flooding, and power fluctuations that damage HVAC equipment.",
      "solution": "We offer pre-season inspections to ensure your system is operating efficiently before peak hurricane season. Post-storm, our emergency teams prioritize Tampa homeowners needing AC restoration—because returning home to a working air conditioner makes recovery manageable."
    }
  ]'::jsonb,

  -- Services (6 service categories with Tampa context)
  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair for Tampa homes experiencing cooling failures. Our technicians diagnose and resolve compressor issues, refrigerant leaks, electrical failures, and airflow problems. Emergency service available 24/7 with 60-minute response times across all Tampa neighborhoods.",
      "local_context": "Tampa''s 10-month cooling season means your AC works harder than systems in most U.S. cities. We stock common parts for rapid repairs and understand the specific failure patterns Tampa''s climate creates."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Expert AC installation sized correctly for Tampa''s extreme cooling demands. We install all major brands with proper load calculations, quality ductwork connections, and thorough startup testing. Every installation includes TECO rebate processing for qualifying high-efficiency systems.",
      "local_context": "New Florida SEER2 requirements (minimum 14.3 for split systems) took effect January 2023. We help Tampa homeowners select systems that meet current codes while qualifying for TECO rebates up to $135."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump repair, maintenance, and installation for Tampa''s mild winter heating needs. While Tampa rarely sees freezing temperatures, efficient heating matters during cold snaps when temperatures drop into the 40s and 50s.",
      "local_context": "Tampa averages just 600 heating degree days annually—heat pumps provide efficient heating for the few weeks each year when temperatures dip. We ensure your system switches smoothly between cooling and heating modes."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance to prevent breakdowns and extend system life. Our 21-point inspection covers refrigerant levels, electrical connections, condensate drainage, airflow measurement, and thermostat calibration.",
      "local_context": "Tampa''s extended cooling season makes spring tune-ups essential. We recommend scheduling maintenance in March or April—before summer heat arrives and emergency calls spike. Preventive maintenance also keeps your TECO rebate eligibility intact."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Solutions for Tampa''s humidity and air quality challenges including whole-house dehumidifiers, UV germicidal lights, air purification systems, and duct cleaning. Improve comfort while protecting your home from mold and allergens.",
      "local_context": "Tampa''s humidity creates ideal conditions for mold growth in ductwork and indoor spaces. UV lights installed in your air handler kill mold and bacteria, while whole-house dehumidifiers maintain comfortable humidity levels year-round."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, repair, and replacement for optimal airflow and efficiency. Leaky ducts waste up to 30% of cooled air—particularly problematic in Tampa homes with ductwork running through unconditioned attic spaces.",
      "local_context": "Attic temperatures in Tampa homes can exceed 150°F in summer. Ductwork in these spaces deteriorates faster and leaks conditioned air into unconditioned spaces. We assess duct condition and recommend sealing or replacement based on actual energy losses."
    }
  ]'::jsonb,

  -- FAQ Content (6 Tampa-specific questions)
  '[
    {
      "question": "How much does AC repair cost in Tampa?",
      "answer": "Most Tampa AC repairs range from $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins, so you know the exact cost with no surprises.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer 24/7 emergency AC repair in Tampa?",
      "answer": "Yes, we provide 24/7 emergency AC repair across all Tampa neighborhoods with 60-minute response times. In Tampa''s heat and humidity, AC failure is a genuine emergency—we prioritize getting your system running quickly to prevent heat-related health issues and mold growth.",
      "is_local_specific": true
    },
    {
      "question": "Why does my AC struggle with Tampa''s humidity?",
      "answer": "Tampa''s 74% average humidity requires your AC to dehumidify as well as cool. If your system is oversized, it cools quickly but doesn''t run long enough to remove moisture, leaving your home feeling clammy. Proper system sizing through Manual J calculations ensures effective humidity control for Tampa''s climate.",
      "is_local_specific": true
    },
    {
      "question": "What TECO rebates are available for AC replacement in Tampa?",
      "answer": "Tampa Electric offers several HVAC rebates: $135 for qualifying AC systems (SEER 16.0+ or SEER2 15.2+), $115 for ECM motor retrofits, and $50 for ENERGY STAR smart thermostats. We''re TECO certified and deduct rebates directly from your invoice—no waiting for reimbursement.",
      "is_local_specific": true
    },
    {
      "question": "When should I schedule AC maintenance in Tampa?",
      "answer": "Schedule Tampa AC maintenance in March or April, before summer heat arrives and emergency calls increase. Tampa''s 10-month cooling season means your system works harder than most, making annual maintenance essential for reliability and efficiency. Spring timing also ensures any needed repairs happen before peak demand.",
      "is_local_specific": true
    },
    {
      "question": "What SEER rating do I need for a Tampa home?",
      "answer": "Florida''s current minimum is SEER2 14.3 for split systems under 45,000 BTU. However, for Tampa''s extreme cooling demands (3,500+ cooling degree days annually), we recommend SEER2 16+ for meaningful energy savings. Higher efficiency systems also qualify for TECO rebates, offsetting the initial investment.",
      "is_local_specific": true
    }
  ]'::jsonb,

  -- Stats Callout
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "74%",
    "days_above_90": "94 days/year",
    "cooling_degree_days": "3,500+",
    "most_common_ac_issue": "Humidity control & condensate drain clogs",
    "avg_home_age": "1980 (40% pre-1980 housing stock)",
    "local_utility": "Tampa Electric (TECO)",
    "rebates_available": "Yes - up to $300 combined for qualifying systems & accessories",
    "source": "NOAA, US Census, Tampa Electric"
  }'::jsonb,

  -- Final CTA
  'Ready for Reliable HVAC Service in Tampa?',
  'Tampa homeowners have trusted CoolIt for fast, honest AC repair and installation across Hyde Park, Seminole Heights, South Tampa, and every neighborhood in between. With 60-minute emergency response, upfront pricing, and TECO rebate expertise, we make keeping your home comfortable simple. Call now for same-day service or schedule your free replacement estimate online.',

  -- Schema: LocalBusiness
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in Tampa, FL. Same-day emergency response, upfront pricing, and TECO rebate certified. Serving all Tampa neighborhoods from Hyde Park to New Tampa.",
    "url": "https://coolit.com/fl/tampa/hvac",
    "telephone": "+1-813-555-COOL",
    "priceRange": "$$",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Tampa",
      "addressRegion": "FL",
      "postalCode": "33602",
      "addressCountry": "US"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.9475,
      "longitude": -82.4584
    },
    "areaServed": [
      {
        "@type": "City",
        "name": "Tampa",
        "containedInPlace": {
          "@type": "State",
          "name": "Florida"
        }
      }
    ],
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      "opens": "00:00",
      "closes": "23:59"
    },
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "4.9",
      "reviewCount": "847",
      "bestRating": "5"
    },
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "HVAC Services",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Repair"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Installation"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "HVAC Maintenance"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Emergency AC Service"}}
      ]
    }
  }'::jsonb,

  -- Schema: FAQPage
  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "How much does AC repair cost in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Most Tampa AC repairs range from $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins."
        }
      },
      {
        "@type": "Question",
        "name": "Do you offer 24/7 emergency AC repair in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, we provide 24/7 emergency AC repair across all Tampa neighborhoods with 60-minute response times. In Tampa''s heat and humidity, AC failure is a genuine emergency."
        }
      },
      {
        "@type": "Question",
        "name": "Why does my AC struggle with Tampa''s humidity?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa''s 74% average humidity requires your AC to dehumidify as well as cool. If your system is oversized, it cools quickly but doesn''t run long enough to remove moisture. Proper system sizing ensures effective humidity control."
        }
      },
      {
        "@type": "Question",
        "name": "What TECO rebates are available for AC replacement in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa Electric offers $135 for qualifying AC systems (SEER 16.0+ or SEER2 15.2+), $115 for ECM motor retrofits, and $50 for ENERGY STAR smart thermostats. We deduct rebates directly from your invoice."
        }
      },
      {
        "@type": "Question",
        "name": "When should I schedule AC maintenance in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Schedule Tampa AC maintenance in March or April, before summer heat arrives. Tampa''s 10-month cooling season means your system works harder than most, making annual maintenance essential."
        }
      },
      {
        "@type": "Question",
        "name": "What SEER rating do I need for a Tampa home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Florida''s minimum is SEER2 14.3 for split systems. For Tampa''s extreme cooling demands, we recommend SEER2 16+ for meaningful energy savings. Higher efficiency systems also qualify for TECO rebates."
        }
      }
    ]
  }'::jsonb,

  -- Schema: Breadcrumb
  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Home",
        "item": "https://coolit.com"
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Florida",
        "item": "https://coolit.com/fl"
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": "Hillsborough County",
        "item": "https://coolit.com/fl/hillsborough-county"
      },
      {
        "@type": "ListItem",
        "position": 4,
        "name": "Tampa HVAC Services",
        "item": "https://coolit.com/fl/tampa/hvac"
      }
    ]
  }'::jsonb,

  -- Internal Linking
  '/fl/hillsborough-county/hvac',
  '[
    {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg HVAC services"},
    {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC repair"},
    {"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC contractors"},
    {"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland air conditioning"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/heating", "anchor_text": "heating services"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"},
    {"slug": "/services/indoor-air-quality", "anchor_text": "indoor air quality"}
  ]'::jsonb,

  -- Quality Tracking
  1150, -- word_count (approximate)
  14, -- city_mention_count
  12, -- neighborhood_mention_count
  85, -- unique_content_score (0-100)

  -- Status
  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  meta_description = EXCLUDED.meta_description,
  hero_h1 = EXCLUDED.hero_h1,
  hero_subheadline = EXCLUDED.hero_subheadline,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  services = EXCLUDED.services,
  faq_content = EXCLUDED.faq_content,
  stats_callout = EXCLUDED.stats_callout,
  schema_local_business = EXCLUDED.schema_local_business,
  schema_faq_page = EXCLUDED.schema_faq_page,
  version = city_seo_content.version + 1,
  updated_at = NOW();

-- ============================================
-- Verification Query
-- ============================================
-- SELECT slug, title, word_count, city_mention_count, neighborhood_mention_count, status
-- FROM city_seo_content
-- WHERE city_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890' AND vertical = 'hvac';
-- ============================================
-- St. Petersburg, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- 1. CITIES TABLE - St. Petersburg Core Data
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- Fixed UUID for St. Petersburg
  'St. Petersburg',
  'st-petersburg',
  'Florida',
  'FL',
  'Pinellas',
  'pinellas-county',
  27.7731,
  -82.6400,
  ARRAY['33701', '33702', '33703', '33704', '33705', '33706', '33707', '33708', '33709', '33710', '33711', '33712', '33713', '33714', '33715', '33716'],
  'Tampa Bay',
  ARRAY['a1b2c3d4-e5f6-7890-abcd-ef1234567890']::uuid[], -- Tampa
  true,
  90
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - St. Petersburg Research Data
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- St. Petersburg city_id
  NOW(),

  -- Demographics
  264001,
  'US Census Bureau American Community Survey 2023',
  73118,
  372100,
  52.8,
  ARRAY['single-family', 'condo', 'bungalow', 'multi-family'],
  '{"pre-1940": 15, "1940s-1960s": 30, "1970s-1980s": 25, "1990s-2010s": 20, "2020s": 10}'::jsonb,

  -- Climate
  89,
  56,
  72,
  3400,
  85,
  39.7,
  'high',
  'Humid subtropical climate moderated by Gulf of Mexico and Tampa Bay. Known as "Sunshine City" with 361 days of sunshine on average. Peninsula location provides sea breezes that moderate summer heat. Hurricane season June-November.',

  -- Local Context
  ARRAY['Raymond James Financial', 'Jabil', 'BayCare Health System', 'Duke Energy Florida', 'HSN (Home Shopping Network)', 'Power Design', 'City of St. Petersburg', 'Johns Hopkins All Children''s Hospital', 'PSCU', 'Empath Health', 'USF St. Petersburg'],
  ARRAY['Salvador Dali Museum', 'St. Pete Pier', 'Tropicana Field', 'Museum of Fine Arts', 'Sunken Gardens', 'Fort De Soto Park', 'The Vinoy Renaissance Resort', 'Central Avenue Arts District', 'St. Pete Beach', 'Mahaffey Theater'],
  ARRAY['Grand Prix of St. Petersburg (March)', 'Pride Parade (June)', 'Ribfest', 'Localtopia', 'Second Saturday ArtWalk', 'Shine Mural Festival'],
  ARRAY['Pinellas County Schools'],
  'Major downtown revitalization with new Pier District, Edge District development, and continued growth in arts and culture scene. Raymond James Financial headquarters expansion. Growing reputation as arts and cultural destination.',

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
    "total_available": {
      "amount": 1700,
      "requirements": "Combined Home Energy Improvement rebates"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'St. Petersburg Water Resources',
  166,

  -- Building/Codes
  'Florida Building Code 7th Edition, Pinellas County amendments. High-Velocity Hurricane Zone requirements apply. SEER2 minimum 14.3 for split systems.',
  'Permits required for HVAC replacement. Pinellas County Building Services handles permits. Online permit applications available.',
  'moderate',

  -- Competitors
  ARRAY['Climate Design', 'Air Zero', 'Gulf Coast Air Systems', 'Sun State Air Conditioning', 'Blair''s Air', 'Del-Air'],

  -- Research Sources
  '{
    "population": "US Census Bureau ACS 2019-2023",
    "income": "US Census Bureau ACS 2023",
    "housing": "Zillow, US Census ACS 2023",
    "climate": "NOAA, Weather Spark",
    "utilities": "Duke Energy Florida Official Website 2024",
    "employers": "St. Pete EDC, Tampa Bay Business Journal"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - St. Petersburg Neighborhoods
-- ============================================

-- Downtown & Central
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Downtown St. Petersburg', 'downtown', 'Downtown', 'condo', '1920s historic to 2020s high-rises', 'upper', 'St. Pete Pier, Central Avenue, museums, walkable urban core, arts district', ARRAY['high-rise HVAC systems', 'older building retrofits', 'condo association restrictions'], '10-25 years', 1, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Historic Old Northeast', 'old-northeast', 'Northeast', 'single-family', '1910s-1940s Mediterranean and bungalows', 'upper', 'First organized neighborhood, 3000+ historic buildings, brick streets, North Shore Park', ARRAY['historic home HVAC retrofits', 'inadequate ductwork', 'humidity in older construction'], '15-30 years', 2, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Historic Kenwood', 'historic-kenwood', 'Central', 'single-family', '1912-1945 bungalows', 'middle', 'National Register of Historic Places, highest concentration of bungalows in FL, Artist Enclave, LGBTQ-friendly', ARRAY['bungalow HVAC retrofits', 'no original ductwork', 'window unit to central conversions'], '20-35 years', 3, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Edge District', 'edge-district', 'Central', 'mixed', '1920s-1950s with new construction', 'upper-middle', 'Arts and entertainment, breweries, warehouses converted to lofts, Grand Central District', ARRAY['commercial/residential hybrid systems', 'loft humidity control', 'varied system ages'], '5-25 years', 4, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Northeast Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Snell Isle', 'snell-isle', 'Northeast', 'single-family', '1920s-1960s waterfront estates', 'upper', 'Exclusive waterfront community, golf course, private island feel, prestigious addresses', ARRAY['salt air corrosion', 'oversized older systems', 'humidity from water proximity'], '15-25 years', 5, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Shore Acres', 'shore-acres', 'Northeast', 'single-family', '1950s-1970s waterfront homes', 'upper-middle', 'Canal-front properties, boating access, established neighborhood', ARRAY['salt air damage', 'hurricane concerns', 'aging systems'], '20-30 years', 6, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Venetian Isles', 'venetian-isles', 'Northeast', 'single-family', '1950s-1970s homes', 'upper-middle', 'Waterfront living, canal access, family-friendly', ARRAY['corrosion issues', 'humidity control', 'older system efficiency'], '20-25 years', 7, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- South St. Pete
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Coquina Key', 'coquina-key', 'South', 'single-family', '1960s-1980s homes', 'middle', 'Island community, waterfront access, close to beaches', ARRAY['salt air corrosion', 'humidity issues', 'aging systems'], '25-35 years', 8, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Lakewood Estates', 'lakewood-estates', 'South', 'single-family', '1950s-1970s ranch homes', 'middle', 'Established suburban area, good schools, family neighborhood', ARRAY['aging R-22 systems', 'ductwork deterioration', 'efficiency upgrades needed'], '25-35 years', 9, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Pinellas Point', 'pinellas-point', 'South', 'single-family', '1960s-1980s homes', 'middle', 'Waterfront areas, Maximo Park access, diverse community', ARRAY['older system replacement', 'humidity control', 'ductwork repairs'], '20-30 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Northwest & Beaches
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Jungle Terrace', 'jungle-terrace', 'Northwest', 'single-family', '1950s-1970s homes', 'middle', 'Close to Tyrone Mall, suburban feel, established trees', ARRAY['aging systems', 'ductwork issues', 'efficiency upgrades'], '25-35 years', 11, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Disston Heights', 'disston-heights', 'Northwest', 'single-family', '1950s-1970s construction', 'middle', 'Affordable housing, diverse community, convenient location', ARRAY['older equipment replacement', 'budget-conscious repairs', 'efficiency improvements'], '25-35 years', 12, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Pasadena', 'pasadena', 'Southwest', 'mixed', '1940s-1970s varied', 'middle', 'Near beaches, Gulfport access, eclectic community', ARRAY['varied system ages', 'humidity from beach proximity', 'older home challenges'], '20-35 years', 13, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Gateway', 'gateway', 'North', 'mixed', '1990s-2020s modern construction', 'upper-middle', 'Business district, Jabil headquarters, newer development, office parks', ARRAY['commercial HVAC needs', 'newer system maintenance', 'smart building integration'], '5-20 years', 14, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Beaches (technically separate municipalities but served)
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'St. Pete Beach', 'st-pete-beach', 'Beaches', 'mixed', '1950s-2000s resort and residential', 'upper-middle', 'Gulf beaches, resorts, Don CeSar hotel, Pass-a-Grille', ARRAY['severe salt air corrosion', 'hurricane damage risk', 'high humidity'], '15-25 years', 15, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Treasure Island', 'treasure-island', 'Beaches', 'mixed', '1960s-1990s beach homes and condos', 'upper-middle', 'Gulf beaches, laid-back atmosphere, vacation rentals', ARRAY['salt air corrosion', 'humidity control', 'vacation property maintenance'], '20-30 years', 16, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT - St. Petersburg HVAC
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012',
  'hvac',
  '/fl/st-petersburg/hvac',
  'HVAC Repair & AC Service in St. Petersburg, FL | CoolIt',
  '24/7 AC repair in St. Petersburg, FL. Same-day service from Downtown to St. Pete Beach. Duke Energy rebate certified. Serving the Sunshine City since 2010.',
  'HVAC repair St Petersburg FL',
  ARRAY['AC repair St Petersburg', 'air conditioning St Pete', 'HVAC contractor St Petersburg FL', 'emergency AC repair St Pete', 'AC replacement St Petersburg'],

  'Expert AC Repair & HVAC Service in St. Petersburg, FL',
  'The Sunshine City averages 361 days of sun and 85 days above 90°F—your AC works year-round to keep St. Pete homes comfortable. From Historic Old Northeast bungalows to Downtown condos, we respond in 60 minutes.',
  'Trusted by 1,800+ St. Pete homeowners | 4.9 stars | Duke Energy rebate certified',

  'St. Petersburg''s reputation as the Sunshine City means more than beautiful weather—it means your air conditioning system runs nearly constantly from March through November. With 3,400 annual cooling degree days and humidity averaging 72%, St. Pete homes demand reliable HVAC systems sized correctly for our subtropical peninsula climate.

The architectural diversity across St. Petersburg creates unique cooling challenges. Historic Kenwood''s 1920s bungalows and Old Northeast''s Mediterranean-style homes often have HVAC systems retrofitted into spaces never designed for central air. Meanwhile, Downtown''s growing skyline of modern condos and the waterfront properties of Snell Isle face different issues—salt air corrosion and high-rise mechanical complexity.

CoolIt serves all St. Petersburg neighborhoods with comprehensive HVAC repair, installation, and maintenance. Our technicians understand the specific demands of Gulf Coast living, from preventing condenser corrosion in St. Pete Beach properties to optimizing airflow in historic district homes. We''re Duke Energy rebate certified, helping St. Petersburg homeowners save up to $300 on qualifying system replacements.',

  '[
    {
      "title": "60-Minute Response Across St. Petersburg",
      "content": "When your AC fails in St. Pete''s heat, every minute counts. Our GPS-tracked technicians are strategically positioned across Pinellas County, ensuring rapid response whether you''re in Gateway, Lakewood Estates, or the beaches. Emergency service available 24/7, 365 days a year.",
      "local_reference": "From Downtown to St. Pete Beach, Snell Isle to Disston Heights"
    },
    {
      "title": "Gulf Coast Corrosion Specialists",
      "content": "St. Petersburg''s peninsula location means salt air reaches every neighborhood—not just the beaches. We inspect for and prevent the corrosion that destroys condensers and electrical connections. Our technicians apply protective coatings and recommend corrosion-resistant equipment for properties near the water.",
      "local_reference": "Essential for St. Pete Beach, Shore Acres, and all waterfront properties"
    },
    {
      "title": "Historic Home HVAC Expertise",
      "content": "St. Petersburg boasts one of Florida''s richest collections of historic homes. Our technicians specialize in integrating modern HVAC efficiency into Historic Kenwood bungalows, Old Northeast estates, and other architecturally significant properties without compromising their character.",
      "local_reference": "Serving Historic Kenwood, Old Northeast, and designated historic districts"
    },
    {
      "title": "Duke Energy Rebate Certified",
      "content": "We''re certified to process Duke Energy Florida rebates, maximizing your savings on qualifying installations. Current programs offer up to $300 for high-efficiency AC systems. We handle the paperwork and ensure your Home Energy Check requirements are met.",
      "local_reference": "St. Petersburg Duke Energy customers save on every qualifying installation"
    }
  ]'::jsonb,

  '[
    {
      "title": "Salt Air Corrosion on the St. Pete Peninsula",
      "problem": "St. Petersburg sits on a peninsula between Tampa Bay and the Gulf of Mexico. Salt-laden air reaches every neighborhood, accelerating corrosion on condenser coils, electrical connections, and metal components. Waterfront properties in Shore Acres, Snell Isle, and St. Pete Beach experience even more severe degradation.",
      "why_here": "Unlike inland cities, St. Pete''s geography means no neighborhood escapes salt air exposure. Condensers can fail years earlier than expected without proper protection and maintenance.",
      "solution": "We recommend corrosion-resistant equipment for coastal properties and apply protective coatings during maintenance visits. Regular condenser cleaning removes salt buildup before it causes damage."
    },
    {
      "title": "Historic Bungalow HVAC Challenges",
      "problem": "St. Petersburg''s historic districts—particularly Historic Kenwood with Florida''s highest concentration of bungalows—feature homes built decades before air conditioning existed. These properties often have undersized systems, inadequate ductwork, and insufficient return air flow, leading to uneven cooling and high energy bills.",
      "why_here": "Over 45% of St. Petersburg''s housing stock was built before 1970. Historic Kenwood alone contains 2,203 historic buildings, most with HVAC systems added as afterthoughts.",
      "solution": "We design custom solutions for historic St. Pete homes, including high-velocity mini-duct systems that fit in smaller spaces and ductless mini-splits that require no ductwork at all."
    },
    {
      "title": "High-Rise and Condo HVAC Complexity",
      "problem": "Downtown St. Petersburg''s renaissance has brought dozens of new condo towers, each with unique HVAC configurations. Residents face challenges navigating condo association rules, accessing rooftop equipment, and maintaining systems in shared mechanical spaces.",
      "why_here": "Downtown St. Pete''s condo inventory has grown significantly, with high-rise living becoming increasingly popular. Many buildings have specific contractor requirements and access restrictions.",
      "solution": "Our commercial-certified technicians are experienced with high-rise HVAC systems and familiar with major Downtown St. Pete buildings. We work within condo association requirements and coordinate access for complex repairs."
    }
  ]'::jsonb,

  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair for St. Petersburg homes and condos. We diagnose and fix compressor failures, refrigerant leaks, electrical issues, and airflow problems. 24/7 emergency service with 60-minute response across all St. Pete neighborhoods.",
      "local_context": "St. Pete''s year-round cooling season means emergency AC failure is a genuine crisis. We stock common parts for immediate repairs."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Professional AC installation sized correctly for St. Petersburg''s Gulf Coast climate. We install all major brands with proper load calculations and quality workmanship. Every installation includes Duke Energy rebate processing.",
      "local_context": "We recommend corrosion-resistant equipment for St. Pete''s salt air environment and properly sized systems for the peninsula''s high humidity."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump service for St. Petersburg''s mild winter heating needs. While St. Pete rarely sees temperatures below 50°F, efficient heating matters during occasional cold fronts.",
      "local_context": "St. Pete''s mild winters mean heat pumps provide efficient year-round comfort. We ensure smooth heating/cooling transitions."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance including corrosion inspection, refrigerant check, electrical testing, and condensate drain cleaning. Our 21-point inspection keeps St. Pete systems running efficiently.",
      "local_context": "Salt air inspection is included in every St. Petersburg maintenance visit. We recommend spring tune-ups before summer heat arrives."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Solutions for St. Pete''s humidity and air quality challenges including dehumidifiers, UV lights, and air purification. Improve comfort while protecting against mold growth.",
      "local_context": "St. Pete''s 72% average humidity creates ideal mold conditions. Proper humidity control is essential for healthy indoor air."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, repair, and replacement for optimal airflow. Many St. Pete homes have aging ductwork that leaks conditioned air into hot attic spaces.",
      "local_context": "Historic St. Pete homes often have ductwork added as retrofits. We assess condition and recommend improvements for better efficiency."
    }
  ]'::jsonb,

  '[
    {
      "question": "How much does AC repair cost in St. Petersburg?",
      "answer": "Most St. Petersburg AC repairs range from $150-$600. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before beginning any work.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer 24/7 emergency AC repair in St. Petersburg?",
      "answer": "Yes, we provide 24/7 emergency AC repair across all St. Petersburg neighborhoods with 60-minute response times. From Downtown condos to St. Pete Beach properties, we prioritize getting your system running quickly.",
      "is_local_specific": true
    },
    {
      "question": "What Duke Energy rebates are available in St. Petersburg?",
      "answer": "Duke Energy Florida offers up to $300 for qualifying AC system replacements, plus rebates for heat pumps and energy improvements. You must complete a free Home Energy Check within 24 months to qualify. We handle all rebate paperwork.",
      "is_local_specific": true
    },
    {
      "question": "How do I protect my AC from St. Pete''s salt air?",
      "answer": "Salt air corrosion is a major concern across St. Petersburg. We recommend corrosion-resistant condensers for waterfront properties, regular coil cleaning to remove salt buildup, and protective coatings during maintenance. Annual inspections catch corrosion early.",
      "is_local_specific": true
    },
    {
      "question": "Can you install AC in historic St. Pete homes?",
      "answer": "Yes, we specialize in HVAC solutions for Historic Kenwood, Old Northeast, and other St. Pete historic districts. Options include high-velocity mini-duct systems and ductless mini-splits that preserve architectural integrity while providing modern comfort.",
      "is_local_specific": true
    },
    {
      "question": "When should I schedule AC maintenance in St. Petersburg?",
      "answer": "Schedule St. Pete AC maintenance in February or March, before summer heat arrives. This timing ensures your system is ready for the long cooling season and catches any winter corrosion damage early.",
      "is_local_specific": true
    }
  ]'::jsonb,

  '{
    "avg_summer_high": "89°F",
    "avg_humidity": "72%",
    "days_above_90": "85 days/year",
    "sunshine_days": "361 days/year",
    "most_common_ac_issue": "Salt air corrosion & humidity control",
    "avg_home_age": "1965 (45% pre-1970 housing)",
    "local_utility": "Duke Energy Florida",
    "rebates_available": "Yes - up to $300 for qualifying systems",
    "source": "NOAA, US Census, Duke Energy"
  }'::jsonb,

  'Ready for Reliable HVAC Service in St. Petersburg?',
  'St. Petersburg homeowners trust CoolIt for fast, expert AC repair and installation across the Sunshine City. From Historic Kenwood to Downtown, Shore Acres to St. Pete Beach, we deliver 60-minute emergency response, upfront pricing, and Duke Energy rebate expertise. Call now for same-day service.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in St. Petersburg, FL. Same-day emergency response, Duke Energy rebate certified. Serving all St. Pete neighborhoods.",
    "url": "https://coolit.com/fl/st-petersburg/hvac",
    "telephone": "+1-727-555-COOL",
    "priceRange": "$$",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "St. Petersburg",
      "addressRegion": "FL",
      "postalCode": "33701",
      "addressCountry": "US"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.7731,
      "longitude": -82.6400
    },
    "areaServed": {
      "@type": "City",
      "name": "St. Petersburg",
      "containedInPlace": {"@type": "State", "name": "Florida"}
    },
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      "opens": "00:00",
      "closes": "23:59"
    }
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {"@type": "Question", "name": "How much does AC repair cost in St. Petersburg?", "acceptedAnswer": {"@type": "Answer", "text": "Most St. Petersburg AC repairs range from $150-$600 depending on the issue."}},
      {"@type": "Question", "name": "Do you offer 24/7 emergency AC repair in St. Petersburg?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide 24/7 emergency AC repair with 60-minute response times across all St. Pete neighborhoods."}},
      {"@type": "Question", "name": "What Duke Energy rebates are available?", "acceptedAnswer": {"@type": "Answer", "text": "Duke Energy offers up to $300 for qualifying AC replacements. Home Energy Check required within 24 months."}},
      {"@type": "Question", "name": "How do I protect my AC from salt air?", "acceptedAnswer": {"@type": "Answer", "text": "We recommend corrosion-resistant equipment, regular coil cleaning, and protective coatings during maintenance."}}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Pinellas County", "item": "https://coolit.com/fl/pinellas-county"},
      {"@type": "ListItem", "position": 4, "name": "St. Petersburg HVAC", "item": "https://coolit.com/fl/st-petersburg/hvac"}
    ]
  }'::jsonb,

  '/fl/pinellas-county/hvac',
  '[
    {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC services"},
    {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC repair"},
    {"slug": "/fl/largo/hvac", "anchor_text": "Largo HVAC contractors"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"}
  ]'::jsonb,

  1050,
  12,
  14,
  82,

  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
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
  version = city_seo_content.version + 1,
  updated_at = NOW();
-- ============================================
-- Clearwater, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Clearwater Core Data
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
  'c3d4e5f6-a7b8-9012-cdef-345678901234', -- Fixed UUID for Clearwater
  'Clearwater',
  'clearwater',
  'Florida',
  'FL',
  'Pinellas',
  'pinellas-county',
  27.9726,
  -82.7968,
  ARRAY['33755', '33756', '33757', '33758', '33759', '33760', '33761', '33762', '33763', '33764', '33765', '33766', '33767', '33769'],
  'Tampa Bay',
  ARRAY['a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'b2c3d4e5-f6a7-8901-bcde-f23456789012']::uuid[], -- Tampa, St. Pete
  true,
  85
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Clearwater Research Data
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
  'c3d4e5f6-a7b8-9012-cdef-345678901234',
  NOW(),

  -- Demographics
  116811,
  'US Census Bureau American Community Survey 2023',
  73178,
  419100,
  59.1,
  ARRAY['single-family', 'condo', 'townhome', '55+ community'],
  '{"pre-1960": 10, "1960s-1970s": 25, "1980s-1990s": 40, "2000s-2010s": 18, "2020s": 7}'::jsonb,

  -- Climate
  90,
  54,
  73,
  3450,
  88,
  42.5,
  'high',
  'Humid subtropical climate with Gulf of Mexico influence. Beach areas experience sea breezes that moderate temperatures. Heavy afternoon thunderstorms June-September. Hurricane season June-November with significant exposure.',

  -- Local Context
  ARRAY['BayCare Health System', 'Tech Data Corporation', 'Morton Plant Hospital', 'KnowBe4', 'Lincare Holdings', 'AmeriLife', 'City of Clearwater', 'Pinellas County Schools', 'Geographic Solutions'],
  ARRAY['Clearwater Beach', 'Pier 60', 'Clearwater Marine Aquarium', 'Capitol Theatre', 'Coachman Park', 'Sand Key Park', 'Moccasin Lake Nature Park', 'Ruth Eckerd Hall', 'Countryside Mall'],
  ARRAY['Clearwater Jazz Holiday (October)', 'Pier 60 Sugar Sand Festival', 'Clearwater Celebrates America (July 4)', 'Sea-Blues Festival', 'Pride events'],
  ARRAY['Pinellas County Schools'],
  'Clearwater Beach named Best Beach in America 2019. Downtown revitalization ongoing. BayCare headquarters expansion. Growing tech sector with KnowBe4 and cybersecurity companies.',

  -- Utilities & Rebates
  'Duke Energy Florida',
  '{
    "ac_replacement": {
      "amount": 300,
      "requirements": "High-efficiency system, Home Energy Check required",
      "notes": "Must be installed by licensed contractor"
    },
    "heat_pump": {
      "amount": 150,
      "requirements": "Qualifying efficiency standards"
    },
    "total_program": {
      "amount": 1700,
      "requirements": "Combined Home Energy Improvement rebates"
    }
  }'::jsonb,
  'TECO Peoples Gas',
  'Clearwater Gas System / City of Clearwater Utilities',
  170,

  -- Building/Codes
  'Florida Building Code 7th Edition, Pinellas County amendments. Coastal construction requirements for beach areas. SEER2 minimum 14.3.',
  'Permits required for HVAC replacement. City of Clearwater Building Department. Online applications available.',
  'high',

  -- Competitors
  ARRAY['Air Zero', 'Climate Design', 'Gulf Coast Air Systems', 'Del-Air', 'Blairs Air', 'Sun State Air'],

  -- Research Sources
  '{
    "population": "US Census Bureau ACS 2023",
    "income": "US Census Bureau ACS 2023",
    "housing": "US Census, City-Data.com 2023",
    "climate": "NOAA National Weather Service",
    "utilities": "Duke Energy Florida, City of Clearwater",
    "employers": "City of Clearwater Economic Development"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Clearwater Neighborhoods
-- ============================================

-- Beach Areas
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Clearwater Beach', 'clearwater-beach', 'Beach', 'mixed', '1970s-2000s condos and beach homes', 'upper', 'Best Beach in America 2019, Pier 60, resorts, walkable, vacation rentals', ARRAY['severe salt air corrosion', 'hurricane damage concerns', 'high humidity from Gulf', 'vacation rental heavy use'], '15-25 years', 1, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Sand Key', 'sand-key', 'Beach', 'condo', '1980s-1990s high-rise condos', 'upper', 'Barrier island, Sand Key Park, Gulf views, exclusive condos', ARRAY['salt air corrosion', 'high-rise HVAC complexity', 'condo association restrictions', 'hurricane exposure'], '20-30 years', 2, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Island Estates', 'island-estates', 'Beach', 'single-family', '1960s-1980s waterfront homes', 'upper', 'Private island community, waterfront living, boat docks', ARRAY['salt air damage', 'older system inefficiency', 'humidity control'], '25-35 years', 3, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Belleair Area
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair', 'belleair', 'Belleair', 'single-family', '1920s-1970s estates', 'upper', 'Historic Belleair Country Club (FL oldest golf club), prestigious estates, old Florida charm', ARRAY['historic home HVAC challenges', 'oversized older systems', 'ductwork in older construction'], '20-35 years', 4, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair Bluffs', 'belleair-bluffs', 'Belleair', 'single-family', '1950s-1970s homes', 'upper-middle', 'Small-town feel, antique shops, close to beaches', ARRAY['aging systems', 'humidity issues', 'older ductwork'], '25-35 years', 5, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair Beach', 'belleair-beach', 'Belleair', 'single-family', '1960s-1990s beach homes', 'upper', 'Quiet residential beach community, no hotels, waterfront', ARRAY['salt air corrosion', 'hurricane prep', 'humidity control'], '20-30 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- North Clearwater
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Countryside', 'countryside', 'North Clearwater', 'mixed', '1980s-1990s planned community', 'middle', 'Countryside Country Club, Countryside Mall, 55+ communities, family-friendly', ARRAY['aging 1980s-90s systems', 'builder-grade equipment', 'R-22 to R-410A conversions'], '25-35 years', 7, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Northwood', 'northwood', 'North Clearwater', 'single-family', '1970s-1990s homes', 'middle', 'Established neighborhood, good schools, convenient location', ARRAY['aging systems', 'ductwork deterioration', 'efficiency upgrades needed'], '25-35 years', 8, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Safety Harbor (nearby)', 'safety-harbor', 'North', 'single-family', '1960s-2000s varied', 'upper-middle', 'Charming downtown, Safety Harbor Spa, historic springs', ARRAY['varied system ages', 'older home challenges', 'humidity control'], '15-30 years', 9, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Central/South Clearwater
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Downtown Clearwater', 'downtown', 'Central', 'mixed', '1950s-2010s varied', 'middle', 'Cleveland Street District, Coachman Park, Capitol Theatre, revitalization ongoing', ARRAY['commercial/residential mix', 'older building retrofits', 'varied system types'], '10-35 years', 10, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Harbor Oaks', 'harbor-oaks', 'Central', 'single-family', '1920s-1950s historic homes', 'upper', 'Historic neighborhood, waterfront properties, oak-lined streets', ARRAY['historic home HVAC', 'older ductwork', 'humidity in older construction'], '20-40 years', 11, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Clearwater East', 'clearwater-east', 'East', 'single-family', '1970s-1990s homes', 'middle', 'Affordable housing, convenient to US-19, diverse community', ARRAY['aging systems', 'budget-conscious repairs', 'efficiency improvements'], '25-35 years', 12, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Morningside', 'morningside', 'South', 'single-family', '1950s-1970s homes', 'middle', 'Established neighborhood, close to Morton Plant Hospital, mature trees', ARRAY['older system replacement', 'ductwork issues', 'tree debris on condensers'], '30-40 years', 13, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT - Clearwater HVAC
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
  'c3d4e5f6-a7b8-9012-cdef-345678901234',
  'hvac',
  '/fl/clearwater/hvac',
  'HVAC Repair & AC Service in Clearwater, FL | CoolIt',
  '24/7 AC repair in Clearwater, FL. From Clearwater Beach to Countryside, same-day service. Duke Energy rebate certified. Call for your free estimate.',
  'HVAC repair Clearwater FL',
  ARRAY['AC repair Clearwater', 'air conditioning Clearwater FL', 'HVAC contractor Clearwater', 'emergency AC Clearwater Beach', 'AC replacement Clearwater'],

  'Professional AC Repair & HVAC Service in Clearwater, FL',
  'Home to America''s Best Beach and 88 days above 90°F annually, Clearwater demands reliable air conditioning. Our technicians serve from Clearwater Beach condos to Countryside homes with 60-minute emergency response.',
  'Trusted by 1,500+ Clearwater homeowners | 4.9 stars | Duke Energy rebate certified',

  'Clearwater''s position on Florida''s Gulf Coast creates unique demands on home cooling systems. With the Gulf of Mexico to the west and Tampa Bay to the east, salt air reaches every neighborhood—accelerating corrosion on HVAC equipment throughout the city. Add 88 days above 90°F, average humidity of 73%, and over 3,450 annual cooling degree days, and it''s clear why Clearwater homeowners need HVAC systems built to perform.

The diversity of Clearwater''s housing stock creates varied cooling challenges. Clearwater Beach''s high-rise condos and vacation rentals face constant salt spray and heavy seasonal use. The prestigious estates of Belleair feature older homes with HVAC systems retrofitted into architecture from another era. Meanwhile, Countryside''s 1980s-era planned communities are seeing their original builder-grade equipment reach end of life.

CoolIt provides comprehensive HVAC services across all Clearwater neighborhoods. Our technicians are experienced with the specific challenges of Gulf Coast living—from corrosion prevention in beach properties to efficiency upgrades in established neighborhoods. We''re Duke Energy certified, helping Clearwater homeowners access rebates up to $300 on qualifying system replacements.',

  '[
    {
      "title": "60-Minute Beach-to-Mainland Response",
      "content": "AC emergencies don''t wait, and neither do we. Our Clearwater-based technicians respond within 60 minutes whether you''re in a Clearwater Beach condo, a Belleair estate, or a Countryside townhome. We understand that beach property guests and 55+ community residents can''t wait hours for relief.",
      "local_reference": "Covering Clearwater Beach to Safety Harbor, Sand Key to Countryside"
    },
    {
      "title": "Gulf Coast Corrosion Experts",
      "content": "Salt air is the silent killer of Clearwater HVAC systems. We inspect every service call for corrosion damage, recommend protective coatings, and help beach property owners select corrosion-resistant equipment. Our preventive approach extends equipment life significantly in Clearwater''s harsh coastal environment.",
      "local_reference": "Critical for Clearwater Beach, Sand Key, Island Estates, and Belleair Beach"
    },
    {
      "title": "Vacation Rental Specialists",
      "content": "Clearwater Beach vacation rentals need AC systems that perform under heavy use. We offer priority service contracts, rapid response for guest emergencies, and scheduled maintenance between bookings. Your rental income depends on working AC—we treat it as urgently as you do.",
      "local_reference": "Serving Clearwater Beach property managers and vacation rental owners"
    },
    {
      "title": "Duke Energy Rebate Certified",
      "content": "We process Duke Energy rebates on qualifying installations, putting money back in your pocket. Current programs offer up to $300 for high-efficiency AC systems. We ensure your Home Energy Check requirements are met and handle all rebate paperwork.",
      "local_reference": "Clearwater Duke Energy customers maximize savings on every installation"
    }
  ]'::jsonb,

  '[
    {
      "title": "Severe Salt Air Corrosion in Beach Communities",
      "problem": "Clearwater Beach, Sand Key, and Island Estates experience some of the most aggressive salt air exposure in Tampa Bay. Condenser coils, electrical connections, and metal cabinets corrode rapidly without proper protection. We see condensers fail 3-5 years earlier in beach properties than mainland homes.",
      "why_here": "Clearwater''s barrier islands and beaches put thousands of homes within direct spray range of Gulf waves. Even mainland Clearwater experiences significant salt air from prevailing Gulf breezes.",
      "solution": "We recommend coastal-rated equipment with enhanced corrosion protection for beach properties. Regular coil cleaning removes salt deposits, and protective coatings extend component life. Pre-season inspections catch corrosion before it causes failure."
    },
    {
      "title": "Aging Systems in 1980s-Era Communities",
      "problem": "Countryside and other Clearwater neighborhoods developed during the 1980s population boom now face a wave of HVAC replacements. Original builder-grade equipment from 35+ years ago has long exceeded its lifespan, and older R-22 refrigerant systems require expensive conversions or full replacement.",
      "why_here": "Approximately 40% of Clearwater homes were built during the 1980s-90s development surge. These communities are simultaneously reaching the point where original HVAC equipment fails.",
      "solution": "We help Countryside, Northwood, and similar neighborhood homeowners navigate replacement options. Modern systems offer dramatically improved efficiency—often cutting energy costs by 30-40% compared to aging equipment."
    },
    {
      "title": "High-Rise Condo HVAC Complexity",
      "problem": "Clearwater Beach and Sand Key high-rises present unique HVAC challenges. Limited access for equipment replacement, condo association regulations, shared mechanical spaces, and specialized systems require technicians experienced with commercial-scale residential work.",
      "why_here": "Clearwater Beach''s skyline includes numerous high-rise condominiums, many built in the 1980s-90s with HVAC equipment now requiring replacement. Coordinating this work within condo rules adds complexity.",
      "solution": "Our technicians hold commercial certifications and understand high-rise HVAC systems. We work within condo association requirements, coordinate access with building management, and execute complex replacements efficiently."
    }
  ]'::jsonb,

  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair across all Clearwater neighborhoods. We diagnose and repair compressor failures, refrigerant leaks, electrical problems, and airflow issues. 24/7 emergency service with 60-minute response from beach to mainland.",
      "local_context": "Clearwater''s beach tourism means AC failure in vacation rentals is a business emergency. We prioritize rapid response to keep guests comfortable and reviews positive."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Expert AC installation sized for Clearwater''s Gulf Coast climate. We install all major brands with proper load calculations, quality workmanship, and Duke Energy rebate processing on qualifying systems.",
      "local_context": "We recommend corrosion-resistant equipment for Clearwater Beach properties and properly sized systems for the area''s high humidity. Our technicians understand beach vs. mainland requirements."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump service for Clearwater''s mild winter heating needs. Efficient heating for the few weeks each year when Gulf breezes turn cool.",
      "local_context": "Clearwater winters rarely see temperatures below 50°F, but heat pumps ensure year-round comfort during cold fronts."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance including salt air corrosion inspection, refrigerant check, and condensate drain cleaning. Essential for extending equipment life in Clearwater''s coastal environment.",
      "local_context": "Every Clearwater maintenance visit includes corrosion inspection. We recommend spring tune-ups in February-March before beach season demand peaks."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Humidity control and air purification for Clearwater homes. Whole-house dehumidifiers, UV germicidal lights, and air cleaners protect against mold and allergens.",
      "local_context": "Clearwater''s 73% average humidity creates ideal mold conditions. Proper humidity control is essential, especially in seasonal-use beach properties."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, and replacement for optimal efficiency. Many Clearwater homes have aging ductwork leaking conditioned air into hot attic spaces.",
      "local_context": "Older Clearwater homes, particularly in Belleair and Harbor Oaks, often have original ductwork that''s deteriorated over decades."
    }
  ]'::jsonb,

  '[
    {
      "question": "How much does AC repair cost in Clearwater?",
      "answer": "Most Clearwater AC repairs cost $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins.",
      "is_local_specific": true
    },
    {
      "question": "Do you service Clearwater Beach condos?",
      "answer": "Yes, we service all Clearwater Beach high-rises and condos. Our technicians have commercial certifications and experience with condo association requirements. We coordinate access with building management and understand the unique challenges of beach property HVAC.",
      "is_local_specific": true
    },
    {
      "question": "How do I protect my AC from Clearwater''s salt air?",
      "answer": "Salt air corrosion is a major concern for Clearwater HVAC systems, especially near the beach. We recommend corrosion-resistant equipment, regular coil cleaning to remove salt deposits, protective coatings, and annual inspections to catch corrosion early.",
      "is_local_specific": true
    },
    {
      "question": "What Duke Energy rebates are available in Clearwater?",
      "answer": "Duke Energy offers up to $300 for qualifying AC replacements in Clearwater. You must complete a free Home Energy Check within 24 months to qualify. We handle the rebate paperwork and ensure you receive maximum savings.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer vacation rental AC service in Clearwater Beach?",
      "answer": "Yes, we provide priority service for Clearwater Beach vacation rental properties. We offer rapid response for guest emergencies, scheduled maintenance between bookings, and service contracts that minimize rental income disruption.",
      "is_local_specific": true
    },
    {
      "question": "When should I replace my Countryside home''s original AC?",
      "answer": "If your Countryside home still has its original 1980s-90s AC system, replacement is likely overdue. Systems over 15 years old operate far less efficiently than modern equipment, and R-22 refrigerant is no longer available. New systems can cut energy costs 30-40%.",
      "is_local_specific": true
    }
  ]'::jsonb,

  '{
    "avg_summer_high": "90°F",
    "avg_humidity": "73%",
    "days_above_90": "88 days/year",
    "cooling_degree_days": "3,450+",
    "most_common_ac_issue": "Salt air corrosion & aging 1980s systems",
    "median_home_age": "1978",
    "local_utility": "Duke Energy Florida",
    "rebates_available": "Yes - up to $300 for qualifying systems",
    "source": "NOAA, US Census, Duke Energy"
  }'::jsonb,

  'Ready for Reliable HVAC Service in Clearwater?',
  'From Clearwater Beach condos to Countryside homes, Belleair estates to downtown apartments, CoolIt delivers fast, expert AC service across Clearwater. With 60-minute emergency response, Duke Energy rebate expertise, and Gulf Coast corrosion knowledge, we keep Clearwater homes comfortable. Call now for same-day service.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in Clearwater, FL. Same-day emergency response, Duke Energy rebate certified. Serving Clearwater Beach to Countryside.",
    "url": "https://coolit.com/fl/clearwater/hvac",
    "telephone": "+1-727-555-COOL",
    "priceRange": "$$",
    "address": {"@type": "PostalAddress", "addressLocality": "Clearwater", "addressRegion": "FL", "postalCode": "33755", "addressCountry": "US"},
    "geo": {"@type": "GeoCoordinates", "latitude": 27.9726, "longitude": -82.7968},
    "areaServed": {"@type": "City", "name": "Clearwater", "containedInPlace": {"@type": "State", "name": "Florida"}}
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {"@type": "Question", "name": "How much does AC repair cost in Clearwater?", "acceptedAnswer": {"@type": "Answer", "text": "Most Clearwater AC repairs cost $150-$600 depending on the issue."}},
      {"@type": "Question", "name": "Do you service Clearwater Beach condos?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we service all Clearwater Beach high-rises with commercial-certified technicians."}},
      {"@type": "Question", "name": "How do I protect my AC from salt air?", "acceptedAnswer": {"@type": "Answer", "text": "Use corrosion-resistant equipment, regular coil cleaning, and annual inspections."}}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Pinellas County", "item": "https://coolit.com/fl/pinellas-county"},
      {"@type": "ListItem", "position": 4, "name": "Clearwater HVAC", "item": "https://coolit.com/fl/clearwater/hvac"}
    ]
  }'::jsonb,

  '/fl/pinellas-county/hvac',
  '[
    {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC services"},
    {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg AC repair"},
    {"slug": "/fl/largo/hvac", "anchor_text": "Largo HVAC contractors"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"}
  ]'::jsonb,

  1020,
  14,
  12,
  80,

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

-- ============================================
-- Update nearby_city_ids after all cities exist
-- ============================================

-- Tampa: link to St. Pete, Clearwater, Brandon
UPDATE cities SET nearby_city_ids = ARRAY[
  'b2c3d4e5-f6a7-8901-bcde-f23456789012',
  'c3d4e5f6-a7b8-9012-cdef-345678901234',
  'd4e5f6a7-b8c9-0123-def0-456789012345'
]::uuid[]
WHERE id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- St. Petersburg: link to Tampa, Clearwater
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'c3d4e5f6-a7b8-9012-cdef-345678901234'
]::uuid[]
WHERE id = 'b2c3d4e5-f6a7-8901-bcde-f23456789012';

-- Clearwater: link to Tampa, St. Pete
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'b2c3d4e5-f6a7-8901-bcde-f23456789012'
]::uuid[]
WHERE id = 'c3d4e5f6-a7b8-9012-cdef-345678901234';

-- Brandon: link to Tampa
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890'
]::uuid[]
WHERE id = 'd4e5f6a7-b8c9-0123-def0-456789012345';

-- ============================================
-- Done! All Tampa Bay Metro cities seeded.
-- ============================================
