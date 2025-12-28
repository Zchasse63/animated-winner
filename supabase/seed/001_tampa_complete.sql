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
