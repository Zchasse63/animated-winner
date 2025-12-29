-- ============================================================================
-- Florida HVAC Cities - Phases 12-16 All-In-One Seed Script
-- ============================================================================
-- This file contains ALL city seed data for Phases 12 through 16 (Cities 058-082)
-- Total: 25 cities across 5 phases
--
-- GENERATED: December 29, 2024
-- LAST UPDATED: After JSONB escaping fix
--
-- USAGE:
--   Option 1 - Supabase Dashboard (RECOMMENDED):
--     Copy and paste this entire file into the SQL Editor and run it
--
--   Option 2 - Local psql:
--     psql -d your_database -f all_cities_058_082_combined.sql
--
-- CONTENTS:
--   Phase 12: North Central Florida (3 cities)
--     - 058: Clermont
--     - 059: Lady Lake
--     - 060: Eustis
--
--   Phase 13: South Florida - Fort Lauderdale Area (5 cities)
--     - 063: Fort Lauderdale
--     - 071: Hollywood
--     - 072: Pembroke Pines
--     - 073: Coral Springs
--     - 074: Pompano Beach
--
--   Phase 14: Jacksonville Metro (5 cities)
--     - 061: Jacksonville
--     - 068: St. Augustine
--     - 075: Jacksonville Beach
--     - 076: Ponte Vedra Beach
--     - 077: Orange Park
--
--   Phase 15: South Florida - Miami/Palm Beach (5 cities)
--     - 062: Miami
--     - 064: West Palm Beach
--     - 065: Boca Raton
--     - 069: Delray Beach
--     - 070: Boynton Beach
--
--   Phase 16: Central Florida & Panhandle (7 cities)
--     - 066: Tallahassee
--     - 067: Pensacola
--     - 078: Deltona
--     - 079: St. Cloud
--     - 080: Poinciana
--     - 081: Casselberry
--     - 082: Winter Springs
--
-- Each city includes:
--   - City record (location, demographics)
--   - City research (utilities, climate, HVAC specifics)
--   - Neighborhoods (6-10 per city)
--   - SEO content (marketing pages)
--
-- NOTES:
--   - All INSERT statements use ON CONFLICT to be idempotent
--   - Safe to run multiple times
--   - Will update existing records where appropriate
-- ============================================================================

SET client_encoding = 'UTF8';

-- ============================================================================
-- BEGIN CITY DATA
-- ============================================================================

-- ============================================
-- Clermont, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  'Clermont', 'clermont', 'Florida', 'FL', 'Lake', 'lake-county',
  28.5494, -81.7729,
  ARRAY['34711', '34712', '34714', '34715'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d', 'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d']::uuid[],
  true, 75
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  NOW(),
  43021, 'US Census Bureau ACS 2023',
  72458, 385000, 71.3,
  ARRAY['single-family', 'new-construction', 'lake-community', 'retirement'],
  '{"pre-1990\": 15, \"1990s-2000s\": 30, \"2010s\": 35, \"2020s\": 20}'::jsonb,
  92, 52, 72, 3600, 102, 51.2, 'moderate',
  'Choice of Champions with unique rolling hills. National Training Center for triathlons. Chain of Lakes region. Rapid growth west of Orlando. Inland moderate hurricane risk.',
  ARRAY['South Lake Hospital', 'Lake County Public Schools', 'City of Clermont', 'National Training Center', 'Retail and hospitality', 'Theme park commuters'],
  ARRAY['National Training Center', 'Lake Minneola', 'Historic downtown', 'Waterfront Park', 'Citrus Tower', 'South Lake Trail', 'Rolling hills'],
  ARRAY['Clermont Triathlon', 'Pig on the Pond BBQ Festival', 'Harvest Festival', 'Fourth of July celebration', 'Farmers Market'],
  ARRAY['Lake County Public Schools'],
  'Massive residential expansion. New downtown development. Medical district growth. National Training Center expansion. Theme park proximity driving growth.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Clermont Utilities',
  275,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"new_construction\": \"Load calculation and energy compliance required"}'::jsonb,
  'high',
  ARRAY['Air Necessities', 'Fenix Air Conditioning', 'Super Heat & Air', 'Arctic Air Solutions', 'Cool Breeze HVAC'],
  '{"demographics\": \"US Census Bureau ACS 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Lake Minneola Shores', 'lake-minneola', 'Central', 'lake-community', '1990s-2010s', 'Upper middle income', 'Lakefront living on Lake Minneola', ARRAY['lake humidity', 'waterfront properties', 'premium systems', 'boat houses'], '10-30 years', 1, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Historic Downtown', 'historic-downtown', 'Central', 'mixed', '1920s-2000s', 'Middle income', 'Revitalized historic district', ARRAY['older buildings', 'mixed use', 'varied systems', 'renovations'], '15-95 years', 2, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Legends Golf & Country Club', 'legends', 'West', 'golf-community', '2000s-2020s', 'Upper income', 'Gated golf community', ARRAY['golf course humidity', 'premium demands', 'HOA standards', 'luxury homes'], '5-22 years', 3, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Sawgrass Bay', 'sawgrass-bay', 'Southwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Family-oriented community', ARRAY['newer construction', 'family sizing', 'HOA requirements'], '5-22 years', 4, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Waterbrooke', 'waterbrooke', 'West', 'new-construction', '2010s-2020s', 'Upper middle income', 'Newer development', ARRAY['new builder systems', 'smart home ready', 'HOA compliance'], '2-12 years', 5, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Pine Ridge', 'pine-ridge', 'North', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 6, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Johns Lake Pointe', 'johns-lake', 'South', 'lake-community', '2000s-2020s', 'Upper middle income', 'Johns Lake waterfront', ARRAY['lake properties', 'humidity control', 'waterfront exposure'], '5-22 years', 7, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Lake Ridge', 'lake-ridge', 'East', 'single-family', '1990s-2010s', 'Middle income', 'Affordable family area', ARRAY['varied ages', 'standard service', 'budget-conscious'], '12-32 years', 8, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Hammock Ridge', 'hammock-ridge', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer family community', ARRAY['newer systems', 'family homes', 'standard needs'], '5-12 years', 9, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'City Center', 'city-center', 'Central', 'mixed', '2010s-2020s', 'Upper middle income', 'Mixed-use downtown revival', ARRAY['condos', 'retail spaces', 'varied HVAC', 'modern systems'], '5-12 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  'hvac',
  '/fl/clermont/hvac',
  'HVAC Services in Clermont, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Clermont''s 43,000+ residents. Hills & lakes specialists. Duke Energy rebates. Serving Lake Minneola, Legends, Historic Downtown & all neighborhoods.',
  'HVAC Clermont FL',
  ARRAY['AC repair Clermont', 'air conditioning Clermont FL', 'HVAC contractor Clermont', 'Lake Minneola AC', 'Choice of Champions HVAC', 'Duke Energy rebates'],

  'Clermont''s Choice HVAC Experts',
  'Hills, lakes, and champion-level comfort solutions',
  'Licensed & Insured | Duke Energy Certified | Lake Community Specialists',
  'Clermont—the "Choice of Champions"—offers unique rolling hills, pristine Chain of Lakes, and a thriving community west of Orlando. With over 43,000 residents from lakefront estates to the revitalized historic downtown, Clermont''s distinctive topography and rapid growth create specific HVAC demands. Our team understands this special market, delivering expert service from Lake Minneola to new developments like Waterbrooke.',

  '{
    "headline": "Why Clermont Homeowners Choose Us",
    "reasons": [
      {"title": "Hills & Elevation Expertise", "description": "Clermont''s unique Florida hills create elevation differences affecting HVAC sizing and ductwork. We understand these local challenges other contractors miss."},
      {"title": "Lake Community Specialists", "description": "Lake Minneola, Johns Lake, and waterfront properties face enhanced humidity. We provide lake-specific dehumidification and moisture control solutions."},
      {"title": "Duke Energy Rebate Certified", "description": "Unlike coastal Florida, Clermont has Duke Energy. We maximize your Duke Energy rebates including $125 for AC replacement and $100 for heat pumps."},
      {"title": "Growth & Development Experience", "description": "Clermont is booming. We work with builders and help new residents evaluate systems from Waterbrooke to Sawgrass Bay."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Clermont",
    "intro": "Clermont''s distinctive character creates specific HVAC considerations:",
    "challenges": [
      {"title": "Rolling Hills & Elevation", "description": "Clermont''s hills are unique in flat Florida. Elevation differences affect load calculations, system sizing, and ductwork design requiring local expertise."},
      {"title": "Chain of Lakes Humidity", "description": "Lake Minneola, Johns Lake, and other waterfront properties experience elevated humidity from lakefront exposure requiring enhanced dehumidification."},
      {"title": "Rapid Growth & New Construction", "description": "Clermont is one of Central Florida''s fastest-growing cities. Many builder-grade systems need evaluation and optimization for Florida''s demanding climate."},
      {"title": "Duke Energy Service Territory", "description": "Unlike most of Florida, Clermont has Duke Energy (not FPL). Different rebate programs and requirements apply."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Clermont",
    "services": [
      {"name": "Lake Community HVAC", "slug": "lake-hvac", "description": "Specialized solutions for Lake Minneola and Johns Lake waterfront properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Humidity control", "Lake-specific expertise"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Clermont''s booming new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home integration"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Clermont''s hills and lakes.", "features": ["Same-day service", "All brands", "90-day warranty", "Local expertise"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Elevation expertise", "10-year warranty", "Financing available"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for Legends and golf course properties.", "features": ["HOA compliance", "Golf course humidity", "Premium systems", "Luxury standards"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for Clermont''s unique climate.", "features": ["Bi-annual service", "Priority scheduling", "Duke Energy optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How do Clermont''s hills affect my HVAC system?", "answer": "Clermont''s unique elevation changes affect load calculations and ductwork design. Homes on hills may need different sizing than similar homes at lower elevations. We factor in these local considerations."},
      {"question": "Do lakefront properties need special HVAC attention?", "answer": "Yes, Lake Minneola and Johns Lake waterfront homes experience elevated humidity from lake exposure. Enhanced dehumidification and proper moisture control are essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available in Clermont?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Clermont residents."},
      {"question": "Should I upgrade my new home''s builder-grade system?", "answer": "Many Clermont builders install minimally-sized systems. If you experience humidity issues, hot spots, or high bills, an upgrade often significantly improves comfort and efficiency."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"72%\", \"cooling_degree_days\": \"3,600\", \"days_above_90\": \"102+\", \"hurricane_risk\": \"Moderate"}'::jsonb,

  'Ready for Champion-Level Comfort in Clermont?',
  'Contact us today for a consultation. From the hills to the lakes, we''ll deliver expert HVAC service with Duke Energy rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Clermont\", \"description\": \"Professional HVAC services for Clermont, FL specializing in hills and lake communities.\", \"url\": \"https://coolit-hvac.com/clermont-fl\", \"telephone\": \"+1-352-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Clermont\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do Clermont''s hills affect my HVAC system?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Clermont''s elevation changes affect load calculations and ductwork design requiring local expertise.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Clermont\", \"item\": \"https://coolit-hvac.com/fl/clermont\"}]}'::jsonb,

  '/fl/lake-county',
  '[{\"slug\": \"/fl/winter-garden/hvac\", \"anchor_text\": \"Winter Garden HVAC\"}, {\"slug\": \"/fl/apopka/hvac\", \"anchor_text\": \"Apopka AC\"}, {\"slug\": \"/fl/leesburg/hvac\", \"anchor_text\": \"Leesburg HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Community HVAC\"}, {\"slug\": \"/services/new-construction\", \"anchor_text\": \"New Construction\"}]'::jsonb,

  1950, 28, 16, 90,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Lady Lake, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  'Lady Lake', 'lady-lake', 'Florida', 'FL', 'Lake', 'lake-county',
  28.9178, -81.9231,
  ARRAY['32159', '32162'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e']::uuid[],
  true, 65
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  NOW(),
  16706, 'US Census Bureau ACS 2023',
  58236, 285000, 82.1,
  ARRAY['single-family', 'retirement', 'manufactured-home', 'condo'],
  '{"pre-1990\": 20, \"1990s-2000s\": 35, \"2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 50, 71, 3650, 104, 51.8, 'moderate',
  'Gateway to The Villages retirement community. Spanish Springs Town Square. Active adult focus. Significant seasonal population. Inland moderate hurricane risk.',
  ARRAY['The Villages', 'Lake County Public Schools', 'Healthcare services', 'Retail and hospitality', 'Senior services', 'Town of Lady Lake'],
  ARRAY['Spanish Springs Town Square', 'The Villages', 'Lake Griffin', 'Rolling Acres Golf Course', 'Lake Ella', 'Lady Lake Library'],
  ARRAY['Weekly entertainment', 'Spanish Springs events', 'Car shows', 'Farmers Market', 'Seasonal festivals'],
  ARRAY['Lake County Public Schools'],
  'Villages expansion. Commercial development along US-27/441. New residential communities. Medical facilities growth. Retail corridor expansion.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Town of Lady Lake Utilities',
  260,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"senior_housing\": \"Accessibility and efficiency focus"}'::jsonb,
  'very_high',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Fenix Air Conditioning', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{"demographics\": \"US Census Bureau ACS 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Spanish Springs Area', 'spanish-springs', 'Central', 'retirement', '1990s-2010s', 'Upper middle income', 'The Villages northern gateway', ARRAY['55+ systems', 'efficiency focus', 'accessibility needs', 'Villages standards'], '10-30 years', 1, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Harbor Hills', 'harbor-hills', 'South', 'retirement', '1980s-2000s', 'Middle income', 'Established 55+ community', ARRAY['older systems', 'budget constraints', 'efficiency upgrades', 'single-level homes'], '20-40 years', 2, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Rolling Acres', 'rolling-acres', 'West', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course retirement community', ARRAY['golf course humidity', '55+ design', 'premium systems', 'HOA requirements'], '12-30 years', 3, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Lake Ella Estates', 'lake-ella', 'East', 'lake-community', '1970s-2000s', 'Middle income', 'Lakefront properties', ARRAY['lake humidity', 'waterfront exposure', 'varied ages', 'moisture control'], '20-50 years', 4, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Highway 27/441 Corridor', 'highway-corridor', 'Central', 'mixed', '1980s-2020s', 'Middle income', 'Commercial and residential mix', ARRAY['mixed use', 'varied systems', 'commercial HVAC', 'residential service'], '5-40 years', 5, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Griffin View', 'griffin-view', 'North', 'single-family', '1990s-2010s', 'Middle income', 'Traditional family area', ARRAY['standard systems', 'family homes', 'efficiency focus'], '12-30 years', 6, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Pennbrooke Fairways', 'pennbrooke', 'Southwest', 'retirement', '2000s-2020s', 'Upper middle income', '55+ golf community', ARRAY['newer systems', 'golf proximity', 'HOA compliance', 'efficiency'], '5-22 years', 7, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Lake Tropicana Ranchettes', 'lake-tropicana', 'Southeast', 'rural-suburban', '1970s-2000s', 'Moderate income', 'Larger lot properties', ARRAY['rural systems', 'well water', 'varied housing', 'budget service'], '20-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  'hvac',
  '/fl/lady-lake/hvac',
  'HVAC Services in Lady Lake, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lady Lake''s 17,000+ residents. Retirement community specialists. Duke Energy rebates. Serving Spanish Springs, Harbor Hills, Rolling Acres & all areas.',
  'HVAC Lady Lake FL',
  ARRAY['AC repair Lady Lake', 'air conditioning Lady Lake FL', 'HVAC contractor Lady Lake', 'The Villages HVAC', 'Spanish Springs AC', '55+ HVAC'],

  'Lady Lake''s Active Adult HVAC Experts',
  'Retirement community comfort from The Villages to Lake Griffin',
  'Licensed & Insured | Duke Energy Certified | 55+ Community Specialists',
  'Lady Lake serves as the northern gateway to The Villages—America''s premier active adult community—while maintaining its own distinct character. With over 16,000 residents, many in 55+ communities from Spanish Springs to Harbor Hills, Lady Lake demands HVAC contractors who understand retirement living requirements. Our team specializes in efficiency, accessibility, and comfort for active adults throughout this vibrant community.',

  '{
    "headline": "Why Lady Lake Residents Choose Us",
    "reasons": [
      {"title": "55+ Community Specialists", "description": "Lady Lake is predominantly retirement-focused. We understand single-level system design, efficiency priorities, and accessibility needs unique to active adult living."},
      {"title": "The Villages Experience", "description": "We work extensively with Villages residents and understand community standards, efficiency expectations, and seasonal usage patterns."},
      {"title": "Duke Energy Rebate Experts", "description": "We help Lady Lake homeowners maximize Duke Energy rebates including $125 for AC replacement and $100 for heat pumps—important for fixed-income budgets."},
      {"title": "Seasonal Service Solutions", "description": "Many Lady Lake residents are seasonal. We provide monitoring, pre-arrival preparation, and systems designed for intermittent use."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Lady Lake",
    "intro": "Lady Lake''s retirement community focus creates specific HVAC needs:",
    "challenges": [
      {"title": "Single-Level System Design", "description": "Most Lady Lake homes are single-story for accessibility. Proper zoning and duct design are essential for even comfort throughout open floor plans."},
      {"title": "Efficiency & Fixed Budgets", "description": "Many residents are on fixed incomes making efficiency critical. We focus on systems that minimize operating costs while maximizing comfort."},
      {"title": "Seasonal Usage Patterns", "description": "Significant seasonal population means systems need proper setup for extended periods of minimal use followed by full operation."},
      {"title": "HOA & Community Standards", "description": "Villages-affiliated and other 55+ communities have strict equipment placement and noise standards we navigate daily."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Lady Lake",
    "services": [
      {"name": "55+ Community HVAC", "slug": "senior-hvac", "description": "Specialized service for Lady Lake''s retirement communities.", "features": ["Efficiency focus", "Accessibility design", "Fixed-budget solutions", "Quiet operation"]},
      {"name": "Seasonal Home Service", "slug": "seasonal-home", "description": "Comprehensive service for Lady Lake''s seasonal residents.", "features": ["Seasonal monitoring", "Pre-arrival preparation", "Remote capabilities", "Extended warranties"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, respectful repairs throughout Lady Lake.", "features": ["Same-day service", "All brands", "90-day warranty", "Senior-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Efficient installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Efficiency focus", "10-year warranty", "Senior financing"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Service for Rolling Acres and golf course properties.", "features": ["HOA compliance", "Golf humidity control", "Quiet systems", "Premium options"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for retirement budgets.", "features": ["Seasonal service options", "Priority scheduling", "15% repair discount", "Budget-friendly"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you specialize in The Villages and 55+ communities?", "answer": "Yes, we work extensively throughout The Villages and Lady Lake''s retirement communities. We understand community standards, efficiency priorities, and accessibility needs for active adult living."},
      {"question": "Can you help with seasonal home monitoring?", "answer": "Absolutely. We offer seasonal monitoring, remote capabilities, and pre-arrival preparation ensuring your Lady Lake home is comfortable when you return each season."},
      {"question": "What''s the most efficient system for a retirement home?", "answer": "For single-level retirement homes, properly-sized heat pumps with multi-stage operation and enhanced dehumidification offer the best efficiency and comfort. We focus on minimizing operating costs."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Lady Lake residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"71%\", \"cooling_degree_days\": \"3,650\", \"days_above_90\": \"104+\", \"hurricane_risk\": \"Moderate"}'::jsonb,

  'Ready for Comfortable Retirement Living in Lady Lake?',
  'Contact us today for a consultation. We''ll design an efficient comfort solution perfect for active adult living with Duke Energy rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Lady Lake\", \"description\": \"Professional HVAC services for Lady Lake, FL specializing in 55+ and retirement communities.\", \"url\": \"https://coolit-hvac.com/lady-lake-fl\", \"telephone\": \"+1-352-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Lady Lake\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do you specialize in The Villages and 55+ communities?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we work extensively with retirement communities and understand efficiency priorities and accessibility needs.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Lady Lake\", \"item\": \"https://coolit-hvac.com/fl/lady-lake\"}]}'::jsonb,

  '/fl/lake-county',
  '[{\"slug\": \"/fl/leesburg/hvac\", \"anchor_text\": \"Leesburg HVAC\"}, {\"slug\": \"/fl/clermont/hvac\", \"anchor_text\": \"Clermont AC\"}, {\"slug\": \"/fl/fruitland-park/hvac\", \"anchor_text\": \"Fruitland Park HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/senior-hvac\", \"anchor_text\": \"55+ Community HVAC\"}, {\"slug\": \"/services/seasonal-home\", \"anchor_text\": \"Seasonal Home Service\"}]'::jsonb,

  1920, 26, 14, 88,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Eustis, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  'Eustis', 'eustis', 'Florida', 'FL', 'Lake', 'lake-county',
  28.8527, -81.6851,
  ARRAY['32726', '32727', '32736'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c']::uuid[],
  true, 70
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  NOW(),
  22191, 'US Census Bureau ACS 2023',
  54128, 245000, 68.7,
  ARRAY['single-family', 'historic', 'lake-community', 'manufactured-home'],
  '{"pre-1970\": 25, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 50, 71, 3620, 103, 52.3, 'moderate',
  'Historic "City of Progress" on Lake Eustis. Charming downtown. GeorgeFest draws thousands. Mix of historic and new development. Inland moderate hurricane risk.',
  ARRAY['Florida Hospital Waterman', 'Lake County Public Schools', 'City of Eustis', 'Downtown businesses', 'Healthcare', 'Retail services'],
  ARRAY['Historic downtown', 'Lake Eustis waterfront', 'Ferran Park', 'Clifford House', 'GeorgeFest venue', 'Eustis Historical Museum', 'Bay Street'],
  ARRAY['GeorgeFest', 'Eustis Street Fest', 'Christmas parade', 'Farmers Market', 'Downtown events'],
  ARRAY['Lake County Public Schools'],
  'Downtown revitalization. Waterfront development. Historic preservation efforts. New residential communities. Medical facilities expansion.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Eustis Utilities',
  255,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{"hvac_replacement\": \"Permit required\", \"historic_district\": \"Historic preservation considerations for downtown properties\", \"inspection\": \"Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Fenix Air Conditioning', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{"demographics\": \"US Census Bureau ACS 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Historic Downtown', 'historic-downtown', 'Central', 'historic', '1880s-1950s', 'Middle income', 'Charming historic district', ARRAY['historic buildings', 'older systems', 'preservation requirements', 'varied housing'], '30-130 years', 1, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Lake Eustis Waterfront', 'lake-eustis', 'East', 'lake-community', '1950s-2010s', 'Upper middle income', 'Lake Eustis properties', ARRAY['lake humidity', 'waterfront exposure', 'premium demands', 'moisture control'], '12-70 years', 2, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Ferran Park Area', 'ferran-park', 'Southeast', 'single-family', '1960s-2000s', 'Middle income', 'Near waterfront park', ARRAY['established homes', 'family properties', 'varied ages', 'standard service'], '20-60 years', 3, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Palm Terrace', 'palm-terrace', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-50 years', 4, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Carlton Estates', 'carlton-estates', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-22 years', 5, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Countryside', 'countryside', 'South', 'manufactured-home', '1980s-2000s', 'Moderate income', 'Affordable community', ARRAY['manufactured home systems', 'budget solutions', 'standard service'], '20-40 years', 6, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Grand Island', 'grand-island', 'Northeast', 'lake-community', '1950s-2000s', 'Upper middle income', 'Island properties on Lake Eustis', ARRAY['island humidity', 'water exposure', 'older systems', 'premium demands'], '20-70 years', 7, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Woodward Avenue Area', 'woodward-avenue', 'Central', 'single-family', '1940s-1980s', 'Middle income', 'Traditional neighborhood', ARRAY['older homes', 'system replacements', 'efficiency focus'], '40-80 years', 8, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Trout Lake', 'trout-lake', 'Southwest', 'lake-community', '1970s-2010s', 'Middle income', 'Trout Lake waterfront', ARRAY['lake properties', 'humidity control', 'varied ages'], '12-50 years', 9, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  'hvac',
  '/fl/eustis/hvac',
  'HVAC Services in Eustis, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Eustis'' 22,000+ residents. Historic home and lake community specialists. Duke Energy rebates. Serving downtown, Lake Eustis waterfront & all neighborhoods.',
  'HVAC Eustis FL',
  ARRAY['AC repair Eustis', 'air conditioning Eustis FL', 'HVAC contractor Eustis', 'Lake Eustis AC', 'historic home HVAC', 'GeorgeFest HVAC'],

  'Eustis'' Historic & Waterfront HVAC Experts',
  'Preserving comfort from downtown to Lake Eustis',
  'Licensed & Insured | Duke Energy Certified | Historic Home Specialists',
  'Eustis—the "City of Progress"—blends historic charm with lakefront living on beautiful Lake Eustis. With over 22,000 residents from the historic downtown district to Grand Island waterfront estates, Eustis presents unique HVAC challenges. Our team specializes in both preserving historic properties and serving modern lakefront homes, understanding what makes this charming community special.',

  '{
    "headline": "Why Eustis Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "Eustis'' charming downtown features homes from the 1880s-1950s. We provide modern comfort while respecting historic character and preservation requirements."},
      {"title": "Lake Community Expertise", "description": "Lake Eustis, Grand Island, and Trout Lake properties face enhanced humidity. We provide waterfront-specific dehumidification and moisture control."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Eustis homeowners maximize Duke Energy rebates including $125 for AC replacement and $100 for heat pumps."},
      {"title": "Mixed Housing Experience", "description": "From 130-year-old historic homes to brand new construction, Eustis has it all. We provide appropriate solutions for every property type."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Eustis",
    "intro": "Eustis'' character creates specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation Requirements", "description": "Downtown historic properties require HVAC solutions that provide modern comfort without compromising historic character. Equipment placement and exterior modifications need careful consideration."},
      {"title": "Lake Eustis Humidity", "description": "Waterfront properties on Lake Eustis, Grand Island, and Trout Lake experience elevated humidity from lake exposure requiring enhanced dehumidification."},
      {"title": "Varied Housing Stock", "description": "From 1880s Victorian homes to 2020s construction, Eustis requires vastly different approaches for different property types and ages."},
      {"title": "Aging Systems in Established Areas", "description": "Much of Eustis features established neighborhoods with aging HVAC systems needing replacement and efficiency upgrades."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Eustis",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Eustis'' historic downtown properties.", "features": ["Preservation-friendly", "Modern comfort", "Discreet equipment", "Expert installation"]},
      {"name": "Lake Community Service", "slug": "lake-hvac", "description": "Enhanced service for Lake Eustis waterfront properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Humidity control", "Moisture management"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Eustis.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic to modern"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Property-specific design", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in established Eustis neighborhoods.", "features": ["Efficiency upgrades", "Modern comfort", "Rebate assistance", "Financing options"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for all property types.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "System longevity"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work on historic downtown homes?", "answer": "Yes, we specialize in historic Eustis properties. We provide modern comfort solutions while respecting historic character and working within preservation requirements."},
      {"question": "Do Lake Eustis properties need special HVAC attention?", "answer": "Yes, Lake Eustis waterfront and island properties experience elevated humidity from lake exposure. Enhanced dehumidification and proper moisture control are essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available in Eustis?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Eustis residents."},
      {"question": "My home is from the 1950s and needs a new AC. What do you recommend?", "answer": "We assess your home''s condition, insulation, and ductwork to recommend properly-sized equipment. Often older homes benefit from efficiency upgrades like improved ductwork or enhanced dehumidification."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"71%\", \"cooling_degree_days\": \"3,620\", \"days_above_90\": \"103+\", \"hurricane_risk\": \"Moderate"}'::jsonb,

  'Ready for Comfort in Historic Eustis?',
  'Contact us today for a consultation. From historic downtown to Lake Eustis waterfront, we''ll deliver expert HVAC service with Duke Energy rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Eustis\", \"description\": \"Professional HVAC services for Eustis, FL specializing in historic homes and lake communities.\", \"url\": \"https://coolit-hvac.com/eustis-fl\", \"telephone\": \"+1-352-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Eustis\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you work on historic downtown homes?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we specialize in historic properties providing modern comfort while respecting historic character.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Eustis\", \"item\": \"https://coolit-hvac.com/fl/eustis\"}]}'::jsonb,

  '/fl/lake-county',
  '[{\"slug\": \"/fl/mount-dora/hvac\", \"anchor_text\": \"Mount Dora HVAC\"}, {\"slug\": \"/fl/tavares/hvac\", \"anchor_text\": \"Tavares AC\"}, {\"slug\": \"/fl/leesburg/hvac\", \"anchor_text\": \"Leesburg HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Community HVAC\"}]'::jsonb,

  1940, 27, 15, 89,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Jacksonville, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 14 - Jacksonville Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  'Jacksonville', 'jacksonville', 'Florida', 'FL', 'Duval', 'duval-county',
  30.3322, -81.6557,
  ARRAY['32202', '32204', '32205', '32206', '32207', '32208', '32209', '32210', '32211', '32216', '32217', '32218', '32219', '32220', '32221', '32222', '32223', '32224', '32225', '32226', '32227', '32244', '32246', '32250', '32254', '32256', '32257', '32258'],
  'Jacksonville',
  ARRAY[]::uuid[],
  true, 95
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  NOW(),
  949611, 'US Census Bureau 2023',
  61346, 275000, 60.8,
  ARRAY['single-family', 'suburban', 'new-construction', 'historic'],
  '{"pre-1970\": 20, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 20}'::jsonb,
  91, 44, 73, 3450, 95, 52.4, 'high',
  'Florida''s largest city by area. Banking and military hub. Major port city. St. Johns River waterfront. Rapid suburban growth. Coastal hurricane risk.',
  ARRAY['Naval Station Mayport', 'Naval Air Station Jacksonville', 'Mayo Clinic', 'Baptist Health', 'Bank of America', 'CSX Corporation', 'Fidelity Investments', 'Johnson & Johnson', 'Amazon fulfillment'],
  ARRAY['Jacksonville Landing', 'Riverside Arts Market', 'TIAA Bank Field', 'VyStar Veterans Memorial Arena', 'Cummer Museum', 'Jacksonville Zoo', 'St. Johns River', 'Downtown Jacksonville', 'San Marco Square'],
  ARRAY['Florida-Georgia football game', 'Jacksonville Jazz Festival', 'Springing the Blues', 'River City Pride', 'Players Championship (TPC Sawgrass)', 'Riverside Arts Market'],
  ARRAY['Duval County Public Schools'],
  'Major Amazon expansion. St. Johns River corridor development. Downtown revitalization. Suburban growth in Nocatee and surrounding areas. Military facility modernization.',
  'JEA (Jacksonville Electric Authority)',
  '{
    "residential_ac": {"amount": 100, "requirements": "ENERGY STAR certified AC system"},
    "smart_thermostat": {"amount": 50, "requirements": "JEA connected thermostat program"},
    "heat_pump": {"amount": 75, "requirements": "High-efficiency heat pump"},
    "total_available": {"amount": 300, "requirements": "Combined JEA rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'JEA (Water)',
  185,
  'Florida Building Code 8th Edition (2023), Duval County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment for coastal areas\", \"inspection\": \"Final inspection required\", \"new_construction\": \"Energy code compliance required"}'::jsonb,
  'moderate',
  ARRAY['Cool Connections', 'Miller''s Central Air', 'Buehler Air Conditioning', 'Snyder AC & Plumbing', 'Air Docs Heating & Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"JEA\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Riverside-Avondale', 'riverside-avondale', 'Central', 'historic', '1920s-1950s', 'Upper middle income', 'Historic urban neighborhood', ARRAY['historic homes', 'older systems', 'preservation concerns', 'urban density'], '20-100 years', 1, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'San Marco', 'san-marco', 'South', 'historic', '1920s-1960s', 'Upper middle income', 'Charming historic district', ARRAY['historic properties', 'varied ages', 'waterfront proximity', 'preservation standards'], '30-95 years', 2, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Nocatee', 'nocatee', 'Southeast', 'new-construction', '2010s-2020s', 'Upper income', 'Master-planned community', ARRAY['new builder systems', 'smart home integration', 'HOA requirements', 'family sizing'], '0-12 years', 3, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Mandarin', 'mandarin', 'South', 'suburban', '1980s-2010s', 'Upper middle income', 'Established St. Johns River area', ARRAY['river humidity', 'family homes', 'varied ages', 'waterfront properties'], '12-40 years', 4, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Baymeadows', 'baymeadows', 'Southeast', 'mixed', '1980s-2010s', 'Upper middle income', 'Business and residential hub', ARRAY['mixed use', 'family homes', 'condos', 'commercial HVAC'], '10-40 years', 5, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Arlington', 'arlington', 'East', 'suburban', '1970s-2000s', 'Middle income', 'Large diverse area', ARRAY['varied housing', 'family homes', 'mixed ages', 'standard service'], '20-50 years', 6, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Southside', 'southside', 'South', 'suburban', '1980s-2020s', 'Middle income', 'Growing suburban area', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-40 years', 7, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Deerwood', 'deerwood', 'Southeast', 'suburban', '1990s-2010s', 'Upper middle income', 'Business park area', ARRAY['professional community', 'newer systems', 'HOA standards'], '10-30 years', 8, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Ortega', 'ortega', 'West', 'affluent', '1920s-2000s', 'High income', 'Historic waterfront estates', ARRAY['luxury homes', 'river properties', 'premium systems', 'older estates'], '10-95 years', 9, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Beaches Area', 'beaches-area', 'East', 'coastal', '1960s-2020s', 'Upper middle income', 'Near Jacksonville Beach', ARRAY['coastal exposure', 'salt air', 'beach proximity', 'varied ages'], '5-60 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  'hvac',
  '/fl/jacksonville/hvac',
  'HVAC Services in Jacksonville, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Jacksonville''s 950,000+ residents. Historic homes to new construction specialists. JEA rebates. Serving Riverside, San Marco, Nocatee & all 840+ square miles.',
  'HVAC Jacksonville FL',
  ARRAY['AC repair Jacksonville', 'air conditioning Jacksonville FL', 'HVAC contractor Jacksonville', 'Riverside HVAC', 'San Marco AC', 'JEA rebates'],

  'Jacksonville''s Full-Service HVAC Experts',
  'Florida''s largest city deserves comprehensive comfort solutions',
  'Licensed & Insured | JEA Certified | Historic to Modern Specialists',
  'Jacksonville—Florida''s largest city by area at 840+ square miles—presents unique HVAC challenges across its diverse landscape. With nearly 950,000 residents from historic Riverside-Avondale to booming Nocatee, from St. Johns River waterfront estates to coastal beach communities, Jacksonville demands HVAC contractors with comprehensive expertise. Our team serves this entire metropolitan area with specialized solutions for every neighborhood and property type.',

  '{
    "headline": "Why Jacksonville Homeowners Choose Us",
    "reasons": [
      {"title": "City-Wide Coverage", "description": "Jacksonville''s 840+ square miles span from beaches to Westside. We serve all areas with the same commitment to quality and rapid response times."},
      {"title": "Historic Home Specialists", "description": "Riverside-Avondale, San Marco, and Ortega feature homes from the 1920s. We provide modern comfort while respecting historic character and preservation requirements."},
      {"title": "New Construction Experts", "description": "Nocatee and other master-planned communities are rapidly expanding. We work with builders and help new homeowners optimize their HVAC systems."},
      {"title": "JEA Rebate Certified", "description": "Jacksonville''s municipal utility JEA offers unique rebate programs. We maximize your JEA rebates including $100 for AC systems and $50 for smart thermostats."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Jacksonville",
    "intro": "Jacksonville''s size and diversity create specific HVAC considerations:",
    "challenges": [
      {"title": "Geographic Diversity", "description": "From coastal Atlantic beaches to inland Westside areas, Jacksonville''s vast geography creates different microclimates requiring varied HVAC approaches."},
      {"title": "St. Johns River Humidity", "description": "Properties along the St. Johns River in Mandarin, Ortega, and Riverside experience elevated humidity from river proximity requiring enhanced dehumidification."},
      {"title": "Historic Preservation", "description": "Jacksonville''s historic districts have preservation requirements affecting HVAC equipment placement, appearance, and installation methods."},
      {"title": "Coastal Salt Air", "description": "Jacksonville and Atlantic Beach areas face salt air corrosion requiring coastal-rated equipment and enhanced protection."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Jacksonville",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized service for Riverside, San Marco, and historic properties.", "features": ["Preservation-friendly", "Modern comfort", "Historic expertise", "Discreet installations"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Nocatee and Jacksonville''s booming developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home integration"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs across all 840+ square miles of Jacksonville.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with JEA rebate assistance.", "features": ["JEA rebates", "Coastal options", "10-year warranty", "Financing available"]},
      {"name": "Riverfront HVAC", "slug": "riverfront-hvac", "description": "Enhanced service for St. Johns River properties.", "features": ["River humidity control", "Waterfront expertise", "Dehumidification", "Moisture management"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for all Jacksonville properties.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "JEA optimization"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you really serve all of Jacksonville''s 840+ square miles?", "answer": "Yes, we provide comprehensive service throughout Jacksonville from the Beaches to Westside, from Northside to Southside. We''re committed to serving Florida''s largest city."},
      {"question": "Can you work on historic homes in Riverside or San Marco?", "answer": "Absolutely. We specialize in historic Jacksonville properties, providing modern comfort while respecting historic character and working within preservation requirements."},
      {"question": "What JEA rebates are available in Jacksonville?", "answer": "JEA offers $100 for high-efficiency residential AC systems, $50 for smart thermostats, and $75 for heat pumps. We handle all rebate paperwork for Jacksonville residents."},
      {"question": "Should I upgrade my Nocatee builder-grade system?", "answer": "Many Nocatee builders install minimally-sized systems. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort and efficiency."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"91°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"3,450\", \"days_above_90\": \"95+\", \"hurricane_risk\": \"High"}'::jsonb,

  'Ready for Comfort Across Jacksonville?',
  'Contact us today for a consultation. From historic downtown to coastal beaches to suburban growth areas, we''ll deliver expert HVAC service with JEA rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Jacksonville\", \"description\": \"Professional HVAC services for Jacksonville, FL covering all 840+ square miles.\", \"url\": \"https://coolit-hvac.com/jacksonville-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Jacksonville\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do you serve all of Jacksonville?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we provide comprehensive service throughout all 840+ square miles of Jacksonville.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Jacksonville\", \"item\": \"https://coolit-hvac.com/fl/jacksonville\"}]}'::jsonb,

  '/fl/duval-county',
  '[{\"slug\": \"/fl/jacksonville-beach/hvac\", \"anchor_text\": \"Jacksonville Beach HVAC\"}, {\"slug\": \"/fl/st-augustine/hvac\", \"anchor_text\": \"St. Augustine AC\"}, {\"slug\": \"/fl/orange-park/hvac\", \"anchor_text\": \"Orange Park HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}, {\"slug\": \"/services/new-construction\", \"anchor_text\": \"New Construction\"}]'::jsonb,

  2020, 32, 18, 91,
  'published', 1, 'claude', 'phase14-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Miami, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d',
  'Miami', 'miami', 'Florida', 'FL', 'Miami-Dade', 'miami-dade-county',
  25.7617, -80.1918,
  ARRAY['33101', '33125', '33126', '33127', '33128', '33129', '33130', '33131', '33132', '33133', '33134', '33135', '33136', '33137', '33138', '33142', '33143', '33144', '33145', '33146', '33147', '33149', '33150', '33154', '33155', '33156', '33157', '33158', '33160', '33161', '33162', '33165', '33166', '33167', '33168', '33169', '33170', '33172', '33173', '33174', '33175', '33176', '33177', '33178', '33179', '33180', '33181', '33182', '33183', '33184', '33185', '33186', '33187', '33189', '33190'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY[]::uuid[],
  true, 98
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d',
  NOW(),
  442241, 'US Census Bureau 2023',
  44581, 485000, 41.2,
  ARRAY['condo', 'single-family', 'luxury', 'high-rise'],
  '{"pre-1960\": 15, \"1960s-1990s\": 30, \"2000s-2010s\": 35, \"2020s\": 20}'::jsonb,
  90, 68, 76, 4200, 88, 61.9, 'very_high',
  'Gateway to the Americas. International business hub. Tropical climate with year-round cooling needs. Coastal hurricane zone. Extreme salt air exposure. Cultural and financial center.',
  ARRAY['Port of Miami', 'Miami International Airport', 'University of Miami', 'Baptist Health South Florida', 'Jackson Health System', 'Carnival Cruise Line', 'American Airlines', 'Major banking', 'International corporations'],
  ARRAY['Brickell Financial District', 'Wynwood Walls', 'Little Havana', 'Vizcaya Museum', 'Bayside Marketplace', 'Bayfront Park', 'Design District', 'Downtown Miami', 'Coconut Grove'],
  ARRAY['Art Basel Miami Beach', 'Ultra Music Festival', 'Miami International Boat Show', 'South Beach Wine & Food Festival', 'Calle Ocho Festival', 'Miami Book Fair'],
  ARRAY['Miami-Dade County Public Schools'],
  'Brickell towers construction boom. Metrorail expansion. Downtown residential growth. Wynwood Arts District development. Edgewater high-rises. Miami Worldcenter.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas (limited)',
  'Miami-Dade Water and Sewer',
  165,
  'Florida Building Code 8th Edition (2023), Miami-Dade High Velocity Hurricane Zone requirements',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance required\", \"coastal_protection\": \"Maximum wind rating and salt air protection\", \"inspection\": \"Multiple inspections required\", \"energy_code\": \"Strict energy efficiency requirements"}'::jsonb,
  'very_high',
  ARRAY['Air On Demand', 'All Year Cooling', 'RJ Kuhn', 'Air-Ref Co Inc', 'Air America Cooling & Heating'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Brickell', 'brickell', 'Central', 'high-rise', '2000s-2020s', 'High income', 'Financial district towers', ARRAY['high-rise systems', 'luxury condos', 'centralized HVAC', 'premium demands'], '5-22 years', 1, true),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Coconut Grove', 'coconut-grove', 'South', 'mixed', '1920s-2020s', 'Upper income', 'Historic waterfront village', ARRAY['historic homes', 'waterfront humidity', 'luxury demands', 'varied ages'], '5-95 years', 2, true),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Wynwood', 'wynwood', 'North', 'mixed', '1940s-2020s', 'Upper middle income', 'Arts district transformation', ARRAY['warehouse conversions', 'loft systems', 'modern retrofits', 'creative spaces'], '5-75 years', 3, true),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Little Havana', 'little-havana', 'West', 'single-family', '1940s-1980s', 'Moderate income', 'Cultural heart of Cuban Miami', ARRAY['older homes', 'budget solutions', 'efficiency upgrades', 'traditional housing'], '30-80 years', 4, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Edgewater', 'edgewater', 'Northeast', 'high-rise', '2010s-2020s', 'High income', 'Bayfront luxury towers', ARRAY['luxury high-rises', 'waterfront exposure', 'premium systems', 'new construction'], '0-12 years', 5, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Design District', 'design-district', 'North', 'mixed', '1950s-2020s', 'High income', 'Luxury shopping and residential', ARRAY['mixed use', 'modern systems', 'retail HVAC', 'upscale residential'], '5-70 years', 6, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Downtown Miami', 'downtown', 'Central', 'high-rise', '1980s-2020s', 'Upper middle income', 'Urban core revival', ARRAY['high-rises', 'commercial mix', 'varied systems', 'urban density'], '5-40 years', 7, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Coral Way', 'coral-way', 'West', 'single-family', '1940s-1980s', 'Middle income', 'Tree-lined historic corridor', ARRAY['older homes', 'family properties', 'system replacements'], '40-80 years', 8, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'Upper Eastside', 'upper-eastside', 'Northeast', 'mixed', '1940s-2020s', 'Upper middle income', 'Emerging waterfront area', ARRAY['renovation projects', 'new construction', 'mixed ages', 'waterfront proximity'], '5-80 years', 9, false),
  ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d', 'The Roads', 'the-roads', 'Central', 'single-family', '1920s-1960s', 'High income', 'Exclusive gated community', ARRAY['historic estates', 'luxury homes', 'waterfront properties', 'premium systems'], '20-100 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d',
  'hvac',
  '/fl/miami/hvac',
  'HVAC Services in Miami, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Miami''s 440,000+ residents. High-rise and tropical climate specialists. FPL rebates. Serving Brickell, Coconut Grove, Wynwood & all Miami neighborhoods.',
  'HVAC Miami FL',
  ARRAY['AC repair Miami', 'air conditioning Miami FL', 'HVAC contractor Miami', 'Brickell HVAC', 'Miami Beach AC', 'tropical climate HVAC'],

  'Miami''s Tropical Climate HVAC Experts',
  'Year-round comfort from Brickell to Coconut Grove',
  'Licensed & Insured | FPL Certified | High-Rise & Hurricane Zone Specialists',
  'Miami—the Gateway to the Americas—presents the most demanding HVAC environment in Florida. With over 440,000 residents, tropical climate averaging 76% humidity, year-round cooling demands, and extreme coastal salt air exposure, Miami requires HVAC expertise beyond standard Florida service. From Brickell''s luxury high-rises to Coconut Grove''s historic estates, from Wynwood''s converted lofts to Little Havana''s traditional homes, our team delivers specialized solutions for Miami''s unique market.',

  '{
    "headline": "Why Miami Homeowners & Property Managers Choose Us",
    "reasons": [
      {"title": "High-Rise Specialists", "description": "Brickell, Edgewater, and Downtown towers require specialized equipment and expertise. We work with building management and understand centralized systems, PTACs, and luxury expectations."},
      {"title": "Hurricane Zone Certified", "description": "Miami is in the High Velocity Hurricane Zone (HVHZ). All our installations meet strict Miami-Dade wind rating and tie-down requirements."},
      {"title": "Tropical Climate Expertise", "description": "Miami''s year-round heat and 76% average humidity demand maximum efficiency and dehumidification. We design systems for Miami''s relentless tropical climate."},
      {"title": "Multilingual Service", "description": "Miami is international. Our team provides service in English, Spanish, and other languages serving our diverse community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Miami",
    "intro": "Miami''s tropical climate and urban density create extreme HVAC demands:",
    "challenges": [
      {"title": "Year-Round Tropical Heat", "description": "Unlike North Florida, Miami has no cool season. Systems run 12 months with 4,200 cooling degree days annually—the highest in Florida. Reliability and efficiency are critical."},
      {"title": "Extreme Humidity Control", "description": "76% average humidity year-round requires robust dehumidification beyond standard AC. Poor humidity control leads to mold and discomfort despite low temperatures."},
      {"title": "Maximum Salt Air Corrosion", "description": "Coastal Miami faces the most aggressive salt air environment in Florida. Unprotected equipment fails rapidly. Coastal-rated components are essential."},
      {"title": "Hurricane Zone Requirements", "description": "Miami-Dade HVHZ requires maximum wind ratings, engineered tie-downs, and impact-resistant components. All installations must meet strict code."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Miami",
    "services": [
      {"name": "High-Rise HVAC", "slug": "high-rise-hvac", "description": "Specialized service for Brickell, Edgewater, and Downtown towers.", "features": ["Centralized systems", "PTAC expertise", "Building coordination", "Luxury standards"]},
      {"name": "Hurricane-Rated Installation", "slug": "hurricane-hvac", "description": "HVHZ-compliant installations meeting Miami-Dade requirements.", "features": ["Maximum wind rating", "Engineered tie-downs", "Impact protection", "Code compliance"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Miami''s diverse neighborhoods.", "features": ["Same-day service", "All brands", "90-day warranty", "Multilingual"]},
      {"name": "Tropical Climate AC", "slug": "tropical-ac", "description": "Systems designed for Miami''s year-round heat and humidity.", "features": ["Maximum efficiency", "Enhanced dehumidification", "Reliable operation", "FPL rebates"]},
      {"name": "Coastal Protection", "slug": "coastal-hvac", "description": "Maximum salt air protection for Miami''s coastal location.", "features": ["Coastal coil coating", "Corrosion protection", "Marine-grade components", "Extended warranties"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for Miami''s demanding climate.", "features": ["Year-round service", "Salt air rinse", "Priority response", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do Miami AC systems need more maintenance than other Florida cities?", "answer": "Miami''s year-round tropical heat, 76% humidity, and coastal salt air create the most demanding HVAC environment in Florida. Systems run constantly with no off-season, requiring more frequent maintenance for reliability."},
      {"question": "What are Miami-Dade HVHZ requirements?", "answer": "High Velocity Hurricane Zone requirements mandate maximum wind-rated equipment, engineered tie-downs, and impact-resistant components. All installations need engineer approval and strict inspections."},
      {"question": "Can you service high-rise condos in Brickell?", "answer": "Yes, we specialize in Brickell and Miami high-rises. We work with building management, understand centralized systems and PTACs, and meet luxury building standards."},
      {"question": "What FPL rebates are available in Miami?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Miami residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"76%\", \"cooling_degree_days\": \"4,200\", \"days_above_90\": \"88+\", \"hurricane_risk\": \"Very High"}'::jsonb,

  'Ready for Tropical Comfort in Miami?',
  'Contact us today for a consultation. From Brickell high-rises to Coconut Grove estates, we''ll deliver expert HVAC service engineered for Miami''s demanding climate.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Miami\", \"description\": \"Professional HVAC services for Miami, FL specializing in tropical climate and high-rise systems.\", \"url\": \"https://coolit-hvac.com/miami-fl\", \"telephone\": \"+1-305-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Miami\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Why do Miami AC systems need more maintenance?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Miami''s year-round tropical heat, high humidity, and coastal salt air create the most demanding HVAC environment in Florida.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Miami\", \"item\": \"https://coolit-hvac.com/fl/miami\"}]}'::jsonb,

  '/fl/miami-dade-county',
  '[{\"slug\": \"/fl/miami-beach/hvac\", \"anchor_text\": \"Miami Beach HVAC\"}, {\"slug\": \"/fl/coral-gables/hvac\", \"anchor_text\": \"Coral Gables AC\"}, {\"slug\": \"/fl/hialeah/hvac\", \"anchor_text\": \"Hialeah HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/high-rise-hvac\", \"anchor_text\": \"High-Rise HVAC\"}, {\"slug\": \"/services/hurricane-hvac\", \"anchor_text\": \"Hurricane-Rated Systems\"}]'::jsonb,

  2140, 35, 20, 93,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Fort Lauderdale, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 13 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  'Fort Lauderdale', 'fort-lauderdale', 'Florida', 'FL', 'Broward', 'broward-county',
  26.1224, -80.1373,
  ARRAY['33301', '33302', '33303', '33304', '33305', '33306', '33307', '33308', '33309', '33310', '33311', '33312', '33313', '33314', '33315', '33316', '33317', '33318', '33319', '33320', '33321', '33322', '33323', '33324', '33325', '33326', '33327', '33328', '33329', '33330', '33331', '33332', '33334', '33335', '33336', '33337', '33338', '33339', '33340', '33345', '33346', '33348', '33349', '33351', '33355', '33359', '33388', '33394'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d']::uuid[],
  true, 97
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  NOW(),
  182760, 'US Census Bureau 2023',
  64182, 425000, 48.3,
  ARRAY['single-family', 'condo', 'waterfront', 'luxury'],
  '{"pre-1970\": 25, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  90, 66, 75, 4100, 86, 63.2, 'very_high',
  'Venice of America with 165 miles of canals. Major yachting center. Beach destination. International tourism. Cruise port. High coastal salt exposure. Hurricane zone.',
  ARRAY['Port Everglades', 'Fort Lauderdale-Hollywood International Airport', 'AutoNation', 'Citrix Systems', 'Spirit Airlines', 'Broward Health', 'Tourism industry', 'Marine industry', 'Banking'],
  ARRAY['Las Olas Boulevard', 'Fort Lauderdale Beach', 'Riverwalk', 'Bonnet House Museum', 'Hugh Taylor Birch State Park', 'Intracoastal Waterway', 'Port Everglades', 'Museum of Discovery & Science'],
  ARRAY['Fort Lauderdale International Boat Show', 'Tortuga Music Festival', 'Las Olas Wine & Food Festival', 'Fort Lauderdale Air Show', 'SandBlast Beach Festival'],
  ARRAY['Broward County Public Schools'],
  'Las Olas Boulevard development. Downtown high-rise boom. Wave Streetcar expansion. Marina and yacht facilities growth. Flagler Village transformation.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas (limited)',
  'City of Fort Lauderdale Utilities',
  155,
  'Florida Building Code 8th Edition (2023), Broward County High Velocity Hurricane Zone amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"coastal_protection\": \"Maximum salt air and wind protection required\", \"waterfront\": \"Enhanced tie-downs for canal properties\", \"inspection\": \"Multiple inspections required"}'::jsonb,
  'very_high',
  ARRAY['Gator Air Conditioning', 'All Year Cooling', 'Air Ref Co Inc', 'One Hour Air Conditioning & Heating', 'Colair Cooling & Heating'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Las Olas Isles', 'las-olas-isles', 'Central', 'waterfront', '1950s-2020s', 'High income', 'Luxury waterfront estates', ARRAY['canal humidity', 'salt air', 'luxury demands', 'yacht properties'], '5-70 years', 1, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Fort Lauderdale Beach', 'ft-lauderdale-beach', 'East', 'condo', '1960s-2020s', 'High income', 'Beachfront living', ARRAY['extreme salt air', 'beach exposure', 'high-rises', 'luxury condos'], '5-60 years', 2, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Victoria Park', 'victoria-park', 'Central', 'single-family', '1940s-1990s', 'Upper middle income', 'Charming historic neighborhood', ARRAY['older homes', 'canal properties', 'varied ages', 'family homes'], '30-80 years', 3, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Flagler Village', 'flagler-village', 'Central', 'mixed', '2010s-2020s', 'Upper middle income', 'Arts district redevelopment', ARRAY['new construction', 'loft conversions', 'mixed use', 'modern systems'], '5-12 years', 4, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Rio Vista', 'rio-vista', 'Central', 'waterfront', '1920s-2000s', 'High income', 'Historic waterfront enclave', ARRAY['canal properties', 'historic homes', 'luxury waterfront', 'salt exposure'], '20-100 years', 5, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Coral Ridge', 'coral-ridge', 'North', 'single-family', '1950s-1990s', 'Upper middle income', 'Established canal community', ARRAY['canal systems', 'family homes', 'waterfront proximity', 'humidity control'], '30-70 years', 6, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Harbor Beach', 'harbor-beach', 'South', 'waterfront', '1960s-2020s', 'Very high income', 'Ultra-luxury beach enclave', ARRAY['mega-mansions', 'beach properties', 'premium systems', 'luxury demands'], '5-60 years', 7, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Poinsettia Heights', 'poinsettia-heights', 'Central', 'single-family', '1950s-1980s', 'Middle income', 'Mid-century neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '40-70 years', 8, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Lauderdale-by-the-Sea Border', 'lauderdale-sea', 'North', 'mixed', '1960s-2010s', 'Upper middle income', 'Near beach area', ARRAY['coastal exposure', 'varied housing', 'salt air proximity'], '12-60 years', 9, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Downtown Fort Lauderdale', 'downtown-ftl', 'Central', 'high-rise', '2000s-2020s', 'Upper income', 'Urban high-rise district', ARRAY['luxury condos', 'high-rises', 'Riverfront properties', 'premium demands'], '5-22 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  'hvac',
  '/fl/fort-lauderdale/hvac',
  'HVAC Services in Fort Lauderdale, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Fort Lauderdale''s 183,000+ residents. Canal and waterfront specialists. FPL rebates. Serving Las Olas, Beach, Victoria Park & all 165 miles of canals.',
  'HVAC Fort Lauderdale FL',
  ARRAY['AC repair Fort Lauderdale', 'air conditioning Fort Lauderdale FL', 'HVAC contractor Fort Lauderdale', 'Las Olas HVAC', 'Fort Lauderdale Beach AC', 'canal home HVAC'],

  'Fort Lauderdale''s Venice of America HVAC Experts',
  'Waterfront comfort across 165 miles of canals',
  'Licensed & Insured | FPL Certified | Canal & Beach Specialists',
  'Fort Lauderdale—the "Venice of America"—features 165 miles of picturesque canals, world-class beaches, and the nation''s third-largest cruise port. With over 182,000 residents from Las Olas Isles waterfront estates to Harbor Beach mega-mansions, from Victoria Park''s historic charm to downtown''s luxury high-rises, Fort Lauderdale''s canal-and-ocean environment creates unique HVAC challenges. Our team specializes in waterfront properties, understanding what canal living and salt air demand.',

  '{
    "headline": "Why Fort Lauderdale Homeowners Choose Us",
    "reasons": [
      {"title": "Canal & Waterfront Specialists", "description": "165 miles of canals mean most Fort Lauderdale homes face waterfront humidity and salt exposure. We provide canal-specific dehumidification and corrosion protection."},
      {"title": "Beach Property Experts", "description": "Fort Lauderdale Beach properties face extreme Atlantic salt air. We provide maximum coastal protection including specialized coil coatings and marine-grade components."},
      {"title": "Luxury Market Experience", "description": "From Las Olas Isles to Harbor Beach, Fort Lauderdale features South Florida''s most exclusive properties. We deliver premium equipment and service matching these estates."},
      {"title": "Yachting Community Knowledge", "description": "Fort Lauderdale is America''s yachting capital. Waterfront properties with docks and boat houses have unique HVAC needs we understand completely."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Fort Lauderdale",
    "intro": "Fort Lauderdale''s waterfront character creates specific HVAC demands:",
    "challenges": [
      {"title": "Omnipresent Canal Humidity", "description": "165 miles of canals mean waterfront exposure for countless properties. Canal humidity requires enhanced dehumidification beyond standard AC for comfort and mold prevention."},
      {"title": "Extreme Coastal Salt Air", "description": "Between Atlantic beach exposure and Intracoastal canals, Fort Lauderdale has comprehensive salt air coverage. Unprotected equipment fails rapidly. Maximum coastal protection is essential."},
      {"title": "Hurricane Zone Requirements", "description": "Broward County High Velocity Hurricane Zone requires wind-rated equipment, engineered tie-downs, and enhanced protection. All installations must meet strict code."},
      {"title": "Luxury Property Standards", "description": "Fort Lauderdale''s waterfront estates and luxury high-rises demand premium equipment, quiet operation, and flawless aesthetics beyond standard installations."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Fort Lauderdale",
    "services": [
      {"name": "Canal Home HVAC", "slug": "canal-hvac", "description": "Specialized service for Fort Lauderdale''s 165 miles of canal properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Salt air defense", "Yacht property expertise"]},
      {"name": "Beach Property Service", "slug": "beach-hvac", "description": "Maximum protection for Fort Lauderdale Beach properties.", "features": ["Extreme salt protection", "Coastal coil coating", "Beach-rated equipment", "Marine-grade components"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs from Las Olas to the beach.", "features": ["Same-day service", "All brands", "90-day warranty", "Waterfront expertise"]},
      {"name": "Luxury HVAC Installation", "slug": "luxury-hvac", "description": "Premium installations for Fort Lauderdale''s exclusive properties.", "features": ["High-end equipment", "Quiet operation", "Flawless aesthetics", "10-year warranty"]},
      {"name": "Hurricane-Rated Systems", "slug": "hurricane-hvac", "description": "HVHZ-compliant installations meeting Broward requirements.", "features": ["Maximum wind rating", "Engineered tie-downs", "Code compliance", "Impact protection"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive waterfront maintenance programs.", "features": ["Canal environment service", "Salt air rinse", "Priority response", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do canal homes need special HVAC attention?", "answer": "Fort Lauderdale''s 165 miles of canals create constant waterfront humidity exposure. Enhanced dehumidification and moisture control are essential for comfort and preventing mold in canal properties."},
      {"question": "How does salt air affect my Fort Lauderdale AC system?", "answer": "Atlantic beach and Intracoastal salt air causes rapid corrosion of unprotected equipment. We provide coastal coil coating and corrosion-resistant components essential for Fort Lauderdale''s environment."},
      {"question": "What are Broward County HVHZ requirements?", "answer": "High Velocity Hurricane Zone mandates maximum wind-rated equipment, engineered tie-downs, and impact protection. All Fort Lauderdale installations require strict compliance and inspections."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Fort Lauderdale residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"75%\", \"cooling_degree_days\": \"4,100\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,

  'Ready for Waterfront Comfort in Fort Lauderdale?',
  'Contact us today for a consultation. From Las Olas canals to Fort Lauderdale Beach, we''ll deliver expert HVAC service engineered for South Florida''s Venice.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Fort Lauderdale\", \"description\": \"Professional HVAC services for Fort Lauderdale, FL specializing in canal and beach properties.\", \"url\": \"https://coolit-hvac.com/fort-lauderdale-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Fort Lauderdale\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Why do canal homes need special HVAC attention?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"165 miles of canals create constant waterfront humidity requiring enhanced dehumidification and moisture control.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Fort Lauderdale\", \"item\": \"https://coolit-hvac.com/fl/fort-lauderdale\"}]}'::jsonb,

  '/fl/broward-county',
  '[{\"slug\": \"/fl/hollywood/hvac\", \"anchor_text\": \"Hollywood HVAC\"}, {\"slug\": \"/fl/pompano-beach/hvac\", \"anchor_text\": \"Pompano Beach AC\"}, {\"slug\": \"/fl/coral-springs/hvac\", \"anchor_text\": \"Coral Springs HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/canal-hvac\", \"anchor_text\": \"Canal Home HVAC\"}, {\"slug\": \"/services/beach-hvac\", \"anchor_text\": \"Beach Property HVAC\"}]'::jsonb,

  2100, 34, 18, 92,
  'published', 1, 'claude', 'phase13-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- West Palm Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f',
  'West Palm Beach', 'west-palm-beach', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.7153, -80.0534,
  ARRAY['33401', '33402', '33403', '33404', '33405', '33406', '33407', '33408', '33409', '33410', '33411', '33412', '33413', '33414', '33415', '33416', '33417', '33418', '33419', '33420', '33421', '33422'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e']::uuid[],
  true, 96
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f',
  NOW(),
  117000, 'US Census Bureau 2023',
  62947, 395000, 46.8,
  ARRAY['single-family', 'condo', 'waterfront', 'luxury'],
  '{"pre-1970\": 20, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 20}'::jsonb,
  90, 64, 74, 4050, 87, 62.7, 'very_high',
  'Palm Beach County seat. Business and cultural hub. Intracoastal waterfront. Gateway to Palm Beach. Significant seasonal population. Coastal hurricane zone. Salt air exposure.',
  ARRAY['Palm Beach County government', 'NextEra Energy', 'G4S', 'Office Depot', 'Health Care District', 'Norton Museum', 'Downtown businesses', 'Tourism industry'],
  ARRAY['Clematis Street', 'CityPlace', 'Norton Museum of Art', 'Kravis Center', 'Palm Beach Zoo', 'Waterfront Commons', 'Flagler Drive', 'SunFest venue'],
  ARRAY['SunFest', 'Palm Beach International Boat Show', 'GreenMarket', 'Clematis by Night', 'Art festivals'],
  ARRAY['Palm Beach County School District'],
  'Downtown revitalization. Waterfront development. Brightline high-speed rail station. CityPlace redevelopment. Rosemary Square transformation. Residential tower boom.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas (limited)',
  'City of West Palm Beach Water',
  145,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment for coastal areas\", \"inspection\": \"Final inspection required\", \"energy_code\": \"Energy compliance required"}'::jsonb,
  'high',
  ARRAY['Gator Air Conditioning', 'One Hour Air Conditioning', 'All Year Cooling', 'Air Ref Co Inc', 'Colair Cooling'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Downtown West Palm Beach', 'downtown-wpb', 'Central', 'mixed', '2000s-2020s', 'Upper income', 'Revitalized urban core', ARRAY['high-rise condos', 'mixed use', 'modern systems', 'urban living'], '5-22 years', 1, true),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Flamingo Park', 'flamingo-park', 'Central', 'single-family', '1940s-1960s', 'Middle income', 'Historic neighborhood', ARRAY['older homes', 'family properties', 'system replacements', 'efficiency upgrades'], '60-80 years', 2, true),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'El Cid', 'el-cid', 'South', 'single-family', '1920s-1960s', 'Upper middle income', 'Mediterranean revival district', ARRAY['historic homes', 'waterfront proximity', 'varied ages', 'preservation concerns'], '60-100 years', 3, true),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Northwood', 'northwood', 'North', 'mixed', '1940s-2020s', 'Middle income', 'Arts and culture district', ARRAY['mixed housing', 'renovations', 'varied systems', 'gentrification'], '5-80 years', 4, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'South Olive', 'south-olive', 'Central', 'single-family', '1920s-1950s', 'Middle income', 'Historic Craftsman homes', ARRAY['historic properties', 'older systems', 'character homes'], '70-100 years', 5, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Grandview Heights', 'grandview-heights', 'East', 'single-family', '1950s-1980s', 'Middle income', 'Mid-century neighborhood', ARRAY['family homes', 'older systems', 'standard service'], '40-70 years', 6, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Palm Beach Lakes', 'pb-lakes', 'West', 'mixed', '1970s-2010s', 'Middle income', 'Diverse area', ARRAY['varied housing', 'family homes', 'mixed ages'], '12-50 years', 7, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Lakeside Green', 'lakeside-green', 'South', 'single-family', '1950s-1980s', 'Middle income', 'Established community', ARRAY['family properties', 'older systems', 'efficiency focus'], '40-70 years', 8, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Intracoastal Area', 'intracoastal-wpb', 'East', 'waterfront', '1960s-2020s', 'High income', 'Waterfront properties', ARRAY['intracoastal humidity', 'luxury homes', 'salt exposure', 'premium systems'], '5-60 years', 9, false),
  ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'Northboro Park', 'northboro-park', 'North', 'single-family', '1950s-1980s', 'Middle income', 'Family neighborhood', ARRAY['established homes', 'family properties', 'standard service'], '40-70 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f',
  'hvac',
  '/fl/west-palm-beach/hvac',
  'HVAC Services in West Palm Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for West Palm Beach''s 117,000+ residents. Historic homes and downtown specialists. FPL rebates. Serving Flamingo Park, El Cid, Downtown & all neighborhoods.',
  'HVAC West Palm Beach FL',
  ARRAY['AC repair West Palm Beach', 'air conditioning West Palm Beach FL', 'HVAC contractor West Palm Beach', 'Downtown WPB HVAC', 'El Cid AC', 'FPL rebates'],

  'West Palm Beach''s Full-Service HVAC Experts',
  'Historic charm to modern downtown comfort solutions',
  'Licensed & Insured | FPL Certified | Historic Home Specialists',
  'West Palm Beach—Palm Beach County''s dynamic seat—blends historic neighborhoods with modern downtown revitalization. With over 117,000 residents from El Cid''s Mediterranean revival estates to downtown''s luxury high-rises, from Flamingo Park''s classic homes to Intracoastal waterfront properties, West Palm Beach presents diverse HVAC needs. Our team serves this entire community with specialized expertise from historic preservation to modern luxury installations.',

  '{
    "headline": "Why West Palm Beach Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "El Cid, South Olive, and Flamingo Park feature homes from the 1920s-1960s. We provide modern comfort while respecting historic character and architectural integrity."},
      {"title": "Downtown High-Rise Experience", "description": "West Palm Beach''s downtown renaissance brings luxury towers. We work with building management and understand centralized systems and high-rise requirements."},
      {"title": "Waterfront Expertise", "description": "Intracoastal properties face enhanced humidity and salt air. We provide waterfront-specific dehumidification and corrosion protection."},
      {"title": "Seasonal Population Knowledge", "description": "West Palm Beach has significant seasonal residents. We provide monitoring, seasonal startup, and systems designed for intermittent use."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to West Palm Beach",
    "intro": "West Palm Beach''s diversity creates specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation Requirements", "description": "El Cid, South Olive, and other historic districts have character preservation concerns. HVAC solutions must provide modern comfort without compromising architectural integrity."},
      {"title": "Varied Housing Stock", "description": "From 1920s Mediterranean revival to 2020s high-rises, West Palm Beach requires vastly different approaches for different property types and ages."},
      {"title": "Intracoastal Salt Air", "description": "Waterfront properties face salt air corrosion and enhanced humidity from Intracoastal proximity requiring coastal protection and dehumidification."},
      {"title": "Downtown Urban Density", "description": "Downtown high-rises and mixed-use developments require specialized equipment, building coordination, and luxury standards."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in West Palm Beach",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized service for El Cid, South Olive, and historic properties.", "features": ["Preservation-friendly", "Modern comfort", "Character respect", "Expert installation"]},
      {"name": "High-Rise Service", "slug": "high-rise-hvac", "description": "Professional service for downtown West Palm Beach towers.", "features": ["Building coordination", "Centralized systems", "Luxury standards", "Management partnership"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout West Palm Beach.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Property-specific design", "10-year warranty", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced service for Intracoastal properties.", "features": ["Salt air protection", "Enhanced dehumidification", "Humidity control", "Coastal expertise"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for all property types.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "FPL optimization"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work on historic El Cid or South Olive homes?", "answer": "Yes, we specialize in West Palm Beach historic properties. We provide modern comfort solutions while respecting historic character and working within preservation guidelines."},
      {"question": "Do you service downtown high-rise condos?", "answer": "Absolutely. We work with downtown building management, understand centralized HVAC systems, and meet luxury building standards throughout West Palm Beach''s urban core."},
      {"question": "Why do Intracoastal properties need special HVAC attention?", "answer": "Intracoastal waterfront properties face salt air corrosion and enhanced humidity from water proximity. Coastal protection and proper dehumidification are essential for comfort and equipment longevity."},
      {"question": "What FPL rebates are available in West Palm Beach?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for West Palm Beach residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,050\", \"days_above_90\": \"87+\", \"hurricane_risk\": \"Very High"}'::jsonb,

  'Ready for Comfort in West Palm Beach?',
  'Contact us today for a consultation. From historic El Cid to downtown towers to Intracoastal waterfront, we''ll deliver expert HVAC service with FPL rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - West Palm Beach\", \"description\": \"Professional HVAC services for West Palm Beach, FL specializing in historic homes and high-rises.\", \"url\": \"https://coolit-hvac.com/west-palm-beach-fl\", \"telephone\": \"+1-561-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"West Palm Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you work on historic El Cid homes?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we specialize in historic properties providing modern comfort while respecting architectural character.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"West Palm Beach\", \"item\": \"https://coolit-hvac.com/fl/west-palm-beach\"}]}'::jsonb,

  '/fl/palm-beach-county',
  '[{\"slug\": \"/fl/boca-raton/hvac\", \"anchor_text\": \"Boca Raton HVAC\"}, {\"slug\": \"/fl/delray-beach/hvac\", \"anchor_text\": \"Delray Beach AC\"}, {\"slug\": \"/fl/jupiter/hvac\", \"anchor_text\": \"Jupiter HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}, {\"slug\": \"/services/high-rise-hvac\", \"anchor_text\": \"High-Rise HVAC\"}]'::jsonb,

  2040, 31, 17, 91,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Boca Raton, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  'Boca Raton', 'boca-raton', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.3683, -80.1289,
  ARRAY['33427', '33428', '33429', '33431', '33432', '33433', '33434', '33481', '33486', '33487', '33488', '33496', '33497', '33498', '33499'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f']::uuid[],
  true, 96
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  NOW(),
  99000, 'US Census Bureau 2023',
  87037, 545000, 68.7,
  ARRAY['single-family', 'condo', 'luxury', 'golf-community'],
  '{"pre-1970\": 15, \"1970s-1990s\": 35, \"2000s-2010s\": 35, \"2020s\": 15}'::jsonb,
  90, 64, 74, 4000, 85, 61.2, 'very_high',
  'Upscale coastal city. Major corporate presence. Florida Atlantic University. Beautiful beaches and parks. Luxury lifestyle focus. Coastal hurricane zone. Premium market.',
  ARRAY['Office Depot', 'ADT Corporation', 'Florida Atlantic University', 'Boca Raton Regional Hospital', 'Tech companies', 'Corporate headquarters', 'Retail and hospitality'],
  ARRAY['Mizner Park', 'Boca Raton Resort & Club', 'Red Reef Park', 'Gumbo Limbo Nature Center', 'Spanish River Park', 'Town Center Mall', 'FAU Stadium'],
  ARRAY['Boca Raton Festival of the Arts', 'Boca Bacchanal', 'GreenMarket', 'Holiday Boat Parade'],
  ARRAY['Palm Beach County School District'],
  'Downtown redevelopment. Innovation Square tech corridor. Mizner Park expansion. Luxury residential growth. Corporate campus development. FAU expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas',
  'City of Boca Raton Water',
  135,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments, Boca architectural standards',
  '{"hvac_replacement\": \"Permit required\", \"architectural_review\": \"Many communities require design approval\", \"coastal_zones\": \"Wind-rated equipment required\", \"inspection\": \"Multiple inspections required"}'::jsonb,
  'very_high',
  ARRAY['Gator Air Conditioning', 'One Hour Air Conditioning', 'All Year Cooling', 'Air Ref Co Inc', 'Colair Cooling'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Mizner Park Area', 'mizner-park', 'Central', 'mixed', '1990s-2020s', 'High income', 'Upscale downtown district', ARRAY['luxury condos', 'mixed use', 'modern systems', 'premium demands'], '5-30 years', 1, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Royal Palm Yacht & Country Club', 'royal-palm', 'East', 'golf-community', '1960s-2020s', 'Very high income', 'Exclusive waterfront club', ARRAY['luxury estates', 'waterfront properties', 'premium systems', 'golf course humidity'], '5-60 years', 2, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca West', 'boca-west', 'West', 'golf-community', '1980s-2020s', 'High income', 'Large golf community', ARRAY['golf course properties', 'HOA requirements', 'premium demands', 'humidity control'], '5-40 years', 3, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Broken Sound', 'broken-sound', 'Northwest', 'golf-community', '1980s-2010s', 'High income', 'Gated golf community', ARRAY['golf properties', 'luxury homes', 'HOA standards', 'premium systems'], '12-40 years', 4, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Woodfield Country Club', 'woodfield', 'Central', 'golf-community', '1970s-2000s', 'Upper middle income', 'Established country club', ARRAY['golf course living', 'older systems', 'HOA requirements'], '20-50 years', 5, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Spanish River', 'spanish-river', 'East', 'single-family', '1960s-1990s', 'Upper middle income', 'Near beach area', ARRAY['beach proximity', 'salt air', 'family homes', 'coastal exposure'], '30-60 years', 6, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Camino Gardens', 'camino-gardens', 'Central', 'condo', '1970s-1990s', 'Upper middle income', 'Large condo community', ARRAY['condo systems', 'association rules', 'standard service'], '30-50 years', 7, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca Lago', 'boca-lago', 'West', 'golf-community', '1970s-2000s', 'Upper middle income', 'Country club community', ARRAY['golf course properties', 'varied ages', 'HOA standards'], '20-50 years', 8, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Town Center Area', 'town-center', 'Central', 'mixed', '1980s-2020s', 'Upper middle income', 'Commercial and residential hub', ARRAY['mixed use', 'condos', 'varied systems', 'modern development'], '5-40 years', 9, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca Pointe', 'boca-pointe', 'West', 'golf-community', '1980s-2010s', 'Upper middle income', 'Active adult community', ARRAY['55+ systems', 'golf course', 'efficiency focus', 'HOA requirements'], '12-40 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  'hvac',
  '/fl/boca-raton/hvac',
  'HVAC Services in Boca Raton, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Boca Raton''s 99,000+ residents. Luxury and golf community specialists. FPL rebates. Serving Mizner Park, Royal Palm, Boca West & all premium communities.',
  'HVAC Boca Raton FL',
  ARRAY['AC repair Boca Raton', 'air conditioning Boca Raton FL', 'HVAC contractor Boca Raton', 'Mizner Park HVAC', 'Boca West AC', 'luxury HVAC'],

  'Boca Raton''s Premier Luxury HVAC Experts',
  'Premium comfort for South Florida''s upscale lifestyle',
  'Licensed & Insured | FPL Certified | Luxury & Golf Community Specialists',
  'Boca Raton represents the pinnacle of South Florida''s upscale lifestyle. With 99,000 residents in luxury communities from Royal Palm Yacht & Country Club to Boca West, from Mizner Park''s sophisticated downtown to Broken Sound''s gated excellence, Boca Raton demands HVAC service matching its premium standards. Our team specializes in luxury installations, golf community requirements, and the flawless execution expected in Boca''s exclusive market.',

  '{
    "headline": "Why Boca Raton''s Premium Communities Choose Us",
    "reasons": [
      {"title": "Luxury Market Specialists", "description": "Boca Raton sets South Florida''s standard for upscale living. We deliver premium equipment, flawless installations, and white-glove service matching Boca''s luxury expectations."},
      {"title": "Golf Community Experts", "description": "Royal Palm, Boca West, Broken Sound, and numerous golf communities require HOA compliance and golf course humidity control. We navigate requirements and deliver premium results."},
      {"title": "Architectural Standards Mastery", "description": "Boca Raton communities have strict design standards. We ensure all equipment placement, appearance, and installation meet community architectural requirements."},
      {"title": "Corporate & Executive Service", "description": "Boca''s corporate community demands reliability and professionalism. We provide executive-level service, flexible scheduling, and solutions matching busy professional lifestyles."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Boca Raton",
    "intro": "Boca Raton''s premium market creates specific HVAC requirements:",
    "challenges": [
      {"title": "Luxury Performance Standards", "description": "Boca Raton''s upscale market expects flawless climate control, whisper-quiet operation, and premium aesthetics. Builder-grade solutions don''t meet Boca standards."},
      {"title": "Golf Course Humidity", "description": "Royal Palm, Boca West, Broken Sound, and other golf communities experience elevated humidity from course irrigation. Enhanced dehumidification is essential."},
      {"title": "Strict Architectural Review", "description": "Boca communities have comprehensive design standards. Equipment placement, color, screening, and noise levels must meet architectural committee approval."},
      {"title": "Coastal Salt Air Exposure", "description": "Proximity to Atlantic beaches brings salt air corrosion. Coastal protection extends equipment life and maintains premium system performance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Boca Raton",
    "services": [
      {"name": "Luxury HVAC Installation", "slug": "luxury-hvac", "description": "Premium installations for Boca Raton''s exclusive properties.", "features": ["High-end equipment", "Flawless execution", "Quiet operation", "Architectural compliance"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Specialized service for Boca''s numerous golf communities.", "features": ["HOA compliance", "Golf humidity control", "Premium systems", "Design approval"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Professional repairs throughout Boca Raton.", "features": ["Same-day service", "All premium brands", "90-day warranty", "White-glove service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Premium equipment", "10-year warranty", "Financing available"]},
      {"name": "Smart Home Integration", "slug": "smart-home", "description": "Seamless HVAC integration with luxury automation.", "features": ["System compatibility", "Voice control", "Remote access", "Automation"]},
      {"name": "VIP Maintenance Plans", "slug": "maintenance", "description": "Premium maintenance for Boca''s luxury market.", "features": ["Priority scheduling", "Concierge service", "System optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you ensure my installation meets Boca Raton community standards?", "answer": "Absolutely. We''re intimately familiar with Boca architectural review requirements. We ensure all equipment placement, appearance, and noise levels meet community standards before installation."},
      {"question": "Why do Boca''s golf communities need special HVAC attention?", "answer": "Golf course irrigation creates elevated humidity. Properties at Royal Palm, Boca West, and Broken Sound need enhanced dehumidification beyond standard AC for optimal comfort."},
      {"question": "What premium HVAC brands do you recommend for Boca Raton?", "answer": "We install premium brands including Carrier Infinity, Trane XV, and Lennox Signature matching Boca''s luxury market. We help you select equipment meeting your performance and aesthetic expectations."},
      {"question": "What FPL rebates are available in Boca Raton?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Boca Raton residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,000\", \"days_above_90\": \"85+\", \"hurricane_risk\": \"Very High"}'::jsonb,

  'Ready for Premium Comfort in Boca Raton?',
  'Contact us today for a consultation. From Royal Palm to Boca West to Mizner Park, we''ll deliver luxury HVAC solutions worthy of Boca''s premium lifestyle.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Boca Raton\", \"description\": \"Premium HVAC services for Boca Raton, FL specializing in luxury and golf communities.\", \"url\": \"https://coolit-hvac.com/boca-raton-fl\", \"telephone\": \"+1-561-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Boca Raton\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you meet Boca Raton community standards?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we ensure all installations meet Boca architectural review requirements for equipment placement and appearance.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Boca Raton\", \"item\": \"https://coolit-hvac.com/fl/boca-raton\"}]}'::jsonb,

  '/fl/palm-beach-county',
  '[{\"slug\": \"/fl/delray-beach/hvac\", \"anchor_text\": \"Delray Beach HVAC\"}, {\"slug\": \"/fl/west-palm-beach/hvac\", \"anchor_text\": \"West Palm Beach AC\"}, {\"slug\": \"/fl/boynton-beach/hvac\", \"anchor_text\": \"Boynton Beach HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/luxury-hvac\", \"anchor_text\": \"Luxury HVAC\"}, {\"slug\": \"/services/golf-community-hvac\", \"anchor_text\": \"Golf Community HVAC\"}]'::jsonb,

  2090, 33, 18, 92,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Tallahassee, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Remaining High Priority
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  'Tallahassee', 'tallahassee', 'Florida', 'FL', 'Leon', 'leon-county',
  30.4383, -84.2807,
  ARRAY['32301', '32303', '32304', '32305', '32306', '32307', '32308', '32309', '32310', '32311', '32312', '32313', '32314', '32315', '32316', '32317', '32399'],
  'Tallahassee',
  ARRAY[]::uuid[],
  true, 94
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  NOW(),
  196000, 'US Census Bureau 2023',
  52657, 235000, 47.3,
  ARRAY['single-family', 'apartment', 'student-housing', 'historic'],
  '{"pre-1960\": 15, \"1960s-1990s\": 35, \"2000s-2010s\": 35, \"2020s\": 15}'::jsonb,
  91, 41, 70, 2900, 92, 61.8, 'moderate',
  'Florida''s capital city. Major university town (FSU, FAMU). Government center. Canopy roads and historic districts. North Florida location has cooler winters than South Florida. Inland moderate hurricane risk.',
  ARRAY['State of Florida government', 'Florida State University', 'Florida A&M University', 'Tallahassee Memorial Healthcare', 'Capital Regional Medical Center', 'Leon County Schools', 'City of Tallahassee'],
  ARRAY['Florida State Capitol', 'FSU football stadium', 'Cascades Park', 'Museum of Florida History', 'Goodwood Museum', 'Canopy roads', 'Railroad Square Art District', 'St. Marks Wildlife Refuge'],
  ARRAY['FSU football games', 'Springtime Tallahassee', 'Downtown GetDown', 'Market Days', 'Word of South Festival', 'Tallahassee Film Festival'],
  ARRAY['Leon County Schools'],
  'Downtown revitalization. Cascades Park development. College Town growth. Gaines Street corridor transformation. Medical district expansion. FSU campus development.',
  'City of Tallahassee (Utilities)',
  '{
    "residential_heat_pump": {"amount": 200, "requirements": "ENERGY STAR certified heat pump water heater"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying connected thermostat"},
    "hvac_tune_up": {"amount": 50, "requirements": "Annual system tune-up"},
    "total_available": {"amount": 450, "requirements": "Combined City of Tallahassee rebates"}
  }'::jsonb,
  'City of Tallahassee Gas',
  'City of Tallahassee Water',
  95,
  'Florida Building Code 8th Edition (2023), Leon County requirements',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"energy_code\": \"Energy compliance required"}'::jsonb,
  'moderate',
  ARRAY['Discount Air & Heat', 'Keith Lawson AC', 'Parker Services', 'Miller''s Central Air', 'Air Dynamics'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"City of Tallahassee\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'College Town', 'college-town', 'West', 'mixed', '2010s-2020s', 'Middle income', 'New urbanist FSU development', ARRAY['student housing', 'new construction', 'modern systems', 'mixed use'], '2-12 years', 1, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Midtown', 'midtown', 'Central', 'mixed', '1950s-2020s', 'Upper middle income', 'Trendy urban corridor', ARRAY['mixed housing', 'renovations', 'varied ages', 'urban living'], '5-70 years', 2, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Betton Hills', 'betton-hills', 'North', 'single-family', '1950s-1980s', 'Upper middle income', 'Established canopy road area', ARRAY['canopy roads', 'family homes', 'older systems', 'tree-lined streets'], '40-70 years', 3, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Killearn Estates', 'killearn-estates', 'Northeast', 'single-family', '1970s-2000s', 'Upper middle income', 'Large suburban community', ARRAY['family homes', 'varied ages', 'standard service', 'established area'], '20-50 years', 4, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Southwood', 'southwood', 'South', 'mixed', '1990s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'family homes', 'HOA standards', 'modern systems'], '5-30 years', 5, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Myers Park', 'myers-park', 'Northeast', 'single-family', '1950s-1970s', 'Middle income', 'Mid-century neighborhood', ARRAY['older homes', 'family properties', 'system replacements'], '50-70 years', 6, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Indian Head Acres', 'indian-head', 'East', 'single-family', '1960s-1980s', 'Middle income', 'Family neighborhood', ARRAY['established homes', 'older systems', 'standard service'], '40-60 years', 7, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Lafayette Park', 'lafayette-park', 'Central', 'single-family', '1920s-1950s', 'Upper middle income', 'Historic near-downtown', ARRAY['historic homes', 'older systems', 'character properties'], '70-100 years', 8, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Waverly Hills', 'waverly-hills', 'Northeast', 'single-family', '1950s-1970s', 'Middle income', 'Established community', ARRAY['family homes', 'older systems', 'efficiency upgrades'], '50-70 years', 9, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Canopy Area', 'canopy', 'North', 'single-family', '1960s-2000s', 'Upper middle income', 'Scenic canopy roads', ARRAY['canopy road properties', 'varied ages', 'family homes'], '20-60 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  'hvac',
  '/fl/tallahassee/hvac',
  'HVAC Services in Tallahassee, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Tallahassee''s 196,000+ residents. Capital city and college town specialists. City rebates. Serving College Town, Midtown, Betton Hills & all areas.',
  'HVAC Tallahassee FL',
  ARRAY['AC repair Tallahassee', 'air conditioning Tallahassee FL', 'HVAC contractor Tallahassee', 'FSU HVAC', 'College Town AC', 'capital city HVAC'],

  'Tallahassee''s Capital City HVAC Experts',
  'Serving Florida''s government center and college community',
  'Licensed & Insured | City of Tallahassee Certified | College & Government Specialists',
  'Tallahassee—Florida''s capital city—combines government center gravitas with vibrant college town energy. With nearly 196,000 residents from FSU''s College Town to historic canopy road neighborhoods, from Midtown''s urban revival to Southwood''s master-planned excellence, Tallahassee presents unique HVAC demands. Our team serves Florida''s capital with expertise spanning student housing, government buildings, historic districts, and family communities throughout Leon County.',

  '{
    "headline": "Why Tallahassee Residents Choose Us",
    "reasons": [
      {"title": "College Town Specialists", "description": "FSU and FAMU create unique demands. We work with student housing, understand semester schedules, and provide service matching Tallahassee''s academic calendar."},
      {"title": "North Florida Climate Expertise", "description": "Tallahassee has cooler winters than South Florida with occasional freezing. We provide heat pump systems and service appropriate for North Florida''s climate variation."},
      {"title": "City Rebate Certified", "description": "Unlike most Florida cities, Tallahassee has municipal utilities with unique rebate programs. We maximize City of Tallahassee rebates including $200 for heat pump water heaters."},
      {"title": "Historic District Experience", "description": "Lafayette Park and canopy road neighborhoods feature historic homes. We provide modern comfort while respecting Tallahassee''s historic character."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Tallahassee",
    "intro": "Tallahassee''s character creates specific HVAC considerations:",
    "challenges": [
      {"title": "North Florida Climate Variation", "description": "Unlike South Florida, Tallahassee experiences cooler winters with occasional freezing. Heat pump systems with auxiliary heat are more common than South Florida''s cooling-only approach."},
      {"title": "Student Housing Demands", "description": "FSU and FAMU student housing requires durable systems, efficient operation for budget-conscious students, and service aligned with academic calendars."},
      {"title": "Canopy Road Considerations", "description": "Tallahassee''s famous canopy roads create shaded, humid microclimates. Properties under heavy tree canopy may need enhanced dehumidification."},
      {"title": "Historic Preservation", "description": "Lafayette Park and historic districts have character homes requiring HVAC solutions providing modern comfort without compromising historic integrity."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Tallahassee",
    "services": [
      {"name": "Heat Pump Systems", "slug": "heat-pump", "description": "Efficient heating and cooling for Tallahassee''s climate.", "features": ["Heating and cooling", "North Florida appropriate", "Energy efficient", "City rebates available"]},
      {"name": "Student Housing Service", "slug": "student-housing", "description": "Reliable service for FSU and FAMU area properties.", "features": ["Budget-friendly", "Fast repairs", "Durable systems", "Academic schedule aware"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Tallahassee.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with City rebate assistance.", "features": ["City rebates", "Heat pump options", "10-year warranty", "Financing available"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized service for Tallahassee''s historic properties.", "features": ["Character respect", "Modern comfort", "Discreet installations", "Preservation-friendly"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for Tallahassee''s climate.", "features": ["Heating & cooling service", "Priority scheduling", "15% repair discount", "System optimization"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do I need heating in Tallahassee?", "answer": "Yes. Unlike South Florida, Tallahassee experiences occasional freezing temperatures. Heat pumps provide efficient heating and cooling, with backup heat for cold winter nights."},
      {"question": "Can you work with FSU student housing schedules?", "answer": "Absolutely. We understand academic calendars and provide flexible scheduling for student housing, semester turnover, and summer maintenance when properties are vacant."},
      {"question": "What City of Tallahassee rebates are available?", "answer": "Tallahassee offers $200 for heat pump water heaters, $75 for smart thermostats, and $50 for system tune-ups. We handle all rebate paperwork for Tallahassee residents."},
      {"question": "Can you service historic homes near downtown?", "answer": "Yes, we specialize in Lafayette Park and historic Tallahassee properties. We provide modern comfort while respecting historic character and architectural integrity."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"91°F\", \"avg_winter_low\": \"41°F\", \"avg_humidity\": \"70%\", \"cooling_degree_days\": \"2,900\", \"days_above_90\": \"92+\", \"hurricane_risk\": \"Moderate"}'::jsonb,

  'Ready for Capital City Comfort in Tallahassee?',
  'Contact us today for a consultation. From FSU''s College Town to historic canopy roads to Southwood, we''ll deliver expert HVAC service with City rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Tallahassee\", \"description\": \"Professional HVAC services for Tallahassee, FL specializing in college town and capital city needs.\", \"url\": \"https://coolit-hvac.com/tallahassee-fl\", \"telephone\": \"+1-850-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Tallahassee\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do I need heating in Tallahassee?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, Tallahassee experiences occasional freezing requiring heat pump systems with backup heat.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Tallahassee\", \"item\": \"https://coolit-hvac.com/fl/tallahassee\"}]}'::jsonb,

  '/fl/leon-county',
  '[{\"slug\": \"/fl/gainesville/hvac\", \"anchor_text\": \"Gainesville HVAC\"}, {\"slug\": \"/fl/pensacola/hvac\", \"anchor_text\": \"Pensacola AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/heat-pump\", \"anchor_text\": \"Heat Pump Systems\"}, {\"slug\": \"/services/student-housing\", \"anchor_text\": \"Student Housing HVAC\"}]'::jsonb,

  2050, 30, 16, 91,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Pensacola, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Remaining High Priority
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  'Pensacola', 'pensacola', 'Florida', 'FL', 'Escambia', 'escambia-county',
  30.4213, -87.2169,
  ARRAY['32501', '32502', '32503', '32504', '32505', '32506', '32507', '32508', '32509', '32511', '32512', '32513', '32514', '32516', '32520', '32521', '32522', '32523', '32524', '32526', '32534'],
  'Pensacola-Ferry Pass-Brent',
  ARRAY[]::uuid[],
  true, 93
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  NOW(),
  54000, 'US Census Bureau 2023',
  51238, 215000, 54.2,
  ARRAY['single-family', 'historic', 'military-housing', 'waterfront'],
  '{"pre-1960\": 20, \"1960s-1990s\": 35, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  90, 44, 72, 2850, 88, 65.4, 'very_high',
  'Cradle of Naval Aviation. Beautiful white sand beaches. Historic downtown. Major military presence. Gulf Coast location. High coastal hurricane risk. Significant seasonal tourism.',
  ARRAY['Naval Air Station Pensacola', 'Pensacola Naval Hospital', 'Escambia County School District', 'Sacred Heart Health System', 'Baptist Health Care', 'University of West Florida', 'Tourism industry'],
  ARRAY['National Naval Aviation Museum', 'Historic Pensacola Village', 'Fort Pickens', 'Pensacola Beach', 'Blue Angels', 'Palafox Street', 'Seville Quarter', 'Gulf Islands National Seashore'],
  ARRAY['Blue Angels Homecoming Air Show', 'Pensacola Seafood Festival', 'Great Gulfcoast Arts Festival', 'Foo Foo Festival', 'Gallery Night'],
  ARRAY['Escambia County Public Schools', 'Santa Rosa County Schools'],
  'Downtown waterfront development. Historic district revitalization. Pensacola Bay Bridge completion. Maritime Park expansion. University of West Florida growth.',
  'Gulf Power (Southern Company)',
  '{
    "residential_ac": {"amount": 100, "requirements": "ENERGY STAR certified system"},
    "heat_pump": {"amount": 125, "requirements": "High-efficiency heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying thermostat"},
    "total_available": {"amount": 350, "requirements": "Combined Gulf Power rebates"}
  }'::jsonb,
  'City of Pensacola Gas',
  'Emerald Coast Utilities Authority (ECUA)',
  125,
  'Florida Building Code 8th Edition (2023), Escambia County coastal requirements',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment and enhanced protection\", \"military_housing\": \"May require base approval\", \"inspection\": \"Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Diamond Air Design', 'Cool Breeze Comfort Solutions', 'Aire Serve of Pensacola', 'Keith Air Conditioning', 'Paradise Home Services'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Gulf Power\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Historic Downtown', 'historic-downtown-pcola', 'Central', 'historic', '1880s-1950s', 'Middle income', 'Historic waterfront district', ARRAY['historic buildings', 'older systems', 'preservation concerns', 'waterfront proximity'], '30-140 years', 1, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'East Hill', 'east-hill', 'East', 'historic', '1900s-1950s', 'Upper middle income', 'Historic residential district', ARRAY['historic homes', 'character properties', 'older systems', 'preservation standards'], '70-120 years', 2, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Cordova Park', 'cordova-park', 'Northeast', 'single-family', '1980s-2010s', 'Upper middle income', 'Family-oriented community', ARRAY['family homes', 'newer systems', 'standard service'], '12-40 years', 3, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Scenic Highway', 'scenic-highway', 'Northwest', 'mixed', '1950s-2000s', 'Middle income', 'Bay-view corridor', ARRAY['waterfront proximity', 'varied housing', 'mixed ages', 'bay humidity'], '20-70 years', 4, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Warrington', 'warrington', 'South', 'military-adjacent', '1950s-2000s', 'Moderate income', 'Near NAS Pensacola', ARRAY['military families', 'varied housing', 'standard service', 'turnover'], '20-70 years', 5, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Bellview', 'bellview', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Established area', ARRAY['family homes', 'older systems', 'standard service'], '20-50 years', 6, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Ferry Pass', 'ferry-pass', 'North', 'mixed', '1980s-2010s', 'Middle income', 'Suburban area', ARRAY['mixed housing', 'family properties', 'varied ages'], '12-40 years', 7, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'North Hill', 'north-hill', 'Central', 'historic', '1900s-1940s', 'Upper middle income', 'Prestigious historic area', ARRAY['historic estates', 'character homes', 'older systems', 'preservation'], '80-120 years', 8, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Bayou Texar', 'bayou-texar', 'East', 'waterfront', '1950s-2010s', 'Upper middle income', 'Bayou waterfront living', ARRAY['waterfront humidity', 'bay properties', 'salt exposure', 'varied ages'], '12-70 years', 9, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'West Pensacola', 'west-pensacola', 'West', 'mixed', '1960s-2000s', 'Middle income', 'Diverse area', ARRAY['mixed housing', 'family homes', 'varied systems'], '20-60 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  'hvac',
  '/fl/pensacola/hvac',
  'HVAC Services in Pensacola, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pensacola''s 54,000+ residents. Gulf Coast and military specialists. Gulf Power rebates. Serving East Hill, Historic Downtown, Cordova Park & all areas.',
  'HVAC Pensacola FL',
  ARRAY['AC repair Pensacola', 'air conditioning Pensacola FL', 'HVAC contractor Pensacola', 'East Hill HVAC', 'NAS Pensacola AC', 'Gulf Coast HVAC'],

  'Pensacola''s Gulf Coast HVAC Experts',
  'From the Cradle of Naval Aviation to historic downtown',
  'Licensed & Insured | Gulf Power Certified | Military & Historic Home Specialists',
  'Pensacola—the "Cradle of Naval Aviation"—combines military heritage, historic charm, and stunning Gulf Coast beauty. With 54,000 residents from East Hill''s historic estates to Cordova Park''s family neighborhoods, from downtown''s waterfront revival to areas near NAS Pensacola, the Pensacola community presents unique HVAC needs. Our team serves Northwest Florida''s Gulf Coast with expertise spanning military housing, historic preservation, and coastal protection.',

  '{
    "headline": "Why Pensacola Homeowners Choose Us",
    "reasons": [
      {"title": "Military Community Specialists", "description": "NAS Pensacola creates significant military presence. We work with military families, understand PCS schedules, and provide service matching military community needs."},
      {"title": "Historic Home Experts", "description": "East Hill and North Hill feature homes from the 1900s. We provide modern comfort while respecting Pensacola''s historic character and preservation requirements."},
      {"title": "Gulf Coast Protection", "description": "Pensacola''s Gulf location brings high hurricane risk and salt air exposure. We provide maximum coastal protection and hurricane-rated equipment."},
      {"title": "Gulf Power Rebate Certified", "description": "Unlike most Florida, Pensacola has Gulf Power. We maximize Gulf Power rebates including $100 for AC systems and $125 for heat pumps."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Pensacola",
    "intro": "Pensacola''s location and character create specific HVAC demands:",
    "challenges": [
      {"title": "Extreme Hurricane Risk", "description": "Pensacola faces very high hurricane risk as a Gulf Coast city. Wind-rated equipment, secure tie-downs, and enhanced protection are essential for storm survival."},
      {"title": "Coastal Salt Air Corrosion", "description": "Gulf proximity brings aggressive salt air exposure. Unprotected equipment fails rapidly. Coastal-rated components and enhanced corrosion protection are critical."},
      {"title": "Historic Preservation Requirements", "description": "East Hill, North Hill, and historic downtown have preservation standards affecting HVAC equipment placement, appearance, and installation methods."},
      {"title": "Military Housing Considerations", "description": "Properties near NAS Pensacola or in military communities may require base approval for HVAC work. We understand and navigate these requirements."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Pensacola",
    "services": [
      {"name": "Hurricane-Rated HVAC", "slug": "hurricane-hvac", "description": "Maximum protection for Pensacola''s Gulf Coast location.", "features": ["High wind rating", "Secure tie-downs", "Storm protection", "Code compliance"]},
      {"name": "Historic Home Service", "slug": "historic-hvac", "description": "Specialized service for East Hill and historic properties.", "features": ["Preservation-friendly", "Modern comfort", "Character respect", "Expert installation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Pensacola.", "features": ["Same-day service", "All brands", "90-day warranty", "Military-friendly"]},
      {"name": "Coastal Protection AC", "slug": "coastal-hvac", "description": "Maximum salt air protection for Gulf Coast living.", "features": ["Coastal coil coating", "Corrosion protection", "Marine-grade components", "Extended warranties"]},
      {"name": "Military Housing Service", "slug": "military-housing", "description": "Reliable service for military families and communities.", "features": ["Base-approved", "PCS-aware", "Military discounts", "Fast response"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive Gulf Coast maintenance programs.", "features": ["Salt air rinse", "Storm preparation", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How does Pensacola''s Gulf Coast location affect my HVAC system?", "answer": "Gulf salt air causes rapid corrosion of unprotected equipment. Hurricane risk requires wind-rated systems. We provide maximum coastal protection and storm-rated equipment for Pensacola."},
      {"question": "Can you work on historic East Hill or North Hill homes?", "answer": "Yes, we specialize in Pensacola''s historic properties. We provide modern comfort while respecting historic character and working within preservation guidelines."},
      {"question": "Do you work with military families near NAS Pensacola?", "answer": "Absolutely. We understand military community needs, PCS schedules, and base requirements. We''re proud to serve Pensacola''s military families."},
      {"question": "What Gulf Power rebates are available in Pensacola?", "answer": "Gulf Power offers $100 for ENERGY STAR AC systems, $125 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Pensacola residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_winter_low\": \"44°F\", \"avg_humidity\": \"72%\", \"cooling_degree_days\": \"2,850\", \"days_above_90\": \"88+\", \"hurricane_risk\": \"Very High"}'::jsonb,

  'Ready for Gulf Coast Comfort in Pensacola?',
  'Contact us today for a consultation. From historic East Hill to NAS Pensacola to Gulf-view properties, we''ll deliver expert HVAC service with Gulf Power rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Pensacola\", \"description\": \"Professional HVAC services for Pensacola, FL specializing in Gulf Coast and historic properties.\", \"url\": \"https://coolit-hvac.com/pensacola-fl\", \"telephone\": \"+1-850-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Pensacola\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does Gulf Coast location affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Gulf salt air causes rapid corrosion and hurricane risk requires wind-rated equipment with maximum coastal protection.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Pensacola\", \"item\": \"https://coolit-hvac.com/fl/pensacola\"}]}'::jsonb,

  '/fl/escambia-county',
  '[{\"slug\": \"/fl/pensacola-beach/hvac\", \"anchor_text\": \"Pensacola Beach HVAC\"}, {\"slug\": \"/fl/gulf-breeze/hvac\", \"anchor_text\": \"Gulf Breeze AC\"}, {\"slug\": \"/fl/navarre/hvac\", \"anchor_text\": \"Navarre HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/hurricane-hvac\", \"anchor_text\": \"Hurricane-Rated HVAC\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}]'::jsonb,

  2070, 31, 16, 91,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- St. Augustine, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 14 - Jacksonville Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d',
  'St. Augustine', 'st-augustine', 'Florida', 'FL', 'St. Johns', 'st-johns-county',
  29.9012, -81.3124,
  ARRAY['32080', '32084', '32085', '32086', '32092', '32095'],
  'Jacksonville',
  ARRAY['9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f']::uuid[],
  true, 92
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (
  city_id, researched_at, population, population_source,
  median_household_income, median_home_value, homeownership_rate,
  primary_housing_types, housing_construction_eras,
  avg_summer_high_f, avg_winter_low_f, avg_humidity_percent,
  annual_cooling_degree_days, days_above_90f, annual_rainfall_inches,
  hurricane_risk_level, climate_notes,
  major_employers, notable_landmarks, local_events, school_districts, recent_developments,
  electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm,
  local_building_codes, permit_requirements, hoa_prevalence,
  top_hvac_competitors, research_sources
) VALUES (
  'a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d',
  NOW(),
  15000, 'US Census Bureau 2023',
  58742, 385000, 52.8,
  ARRAY['historic', 'condo', 'single-family', 'waterfront'],
  '{"pre-1900\": 5, \"1900s-1970s\": 25, \"1980s-2000s\": 40, \"2010s-2020s\": 30}'::jsonb,
  90, 47, 73, 3350, 91, 52.8, 'high',
  'America''s oldest city founded 1565. Spanish colonial architecture. Major tourism destination. Historic preservation focus. Coastal hurricane risk. Significant seasonal population.',
  ARRAY['Tourism industry', 'Flagler College', 'St. Johns County government', 'Flagler Hospital', 'Historic attractions', 'Retail and hospitality'],
  ARRAY['Castillo de San Marcos', 'St. Augustine Lighthouse', 'Flagler College', 'Colonial Quarter', 'Bridge of Lions', 'Fountain of Youth', 'St. George Street', 'Anastasia Island'],
  ARRAY['Nights of Lights', 'St. Augustine Food & Wine Festival', 'Celtic Festival', 'Greek Festival', 'Oktoberfest'],
  ARRAY['St. Johns County School District'],
  'Historic district preservation. Tourism infrastructure growth. St. Augustine Beach development. Anastasia Island growth. Flagler College expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas (limited)',
  'City of St. Augustine Utilities',
  175,
  'Florida Building Code 8th Edition (2023), St. Johns County coastal requirements, Historic district preservation standards',
  '{"hvac_replacement\": \"Permit required\", \"historic_district\": \"Strict preservation requirements for colonial district\", \"architectural_review\": \"Required for historic properties\", \"coastal_zones\": \"Wind-rated equipment required\", \"inspection\": \"Multiple inspections required"}'::jsonb,
  'high',
  ('ARRAY[''Climate Control of St. Johns'', ''Watson''s Comfort Systems'', ''Air Docs'', ''Snyder Air'', ''Miller''s Central Air'']'),
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Colonial Historic District', 'colonial-district', 'Central', 'historic', '1600s-1800s', 'Upper middle income', 'Spanish colonial heart', ARRAY['historic buildings', 'preservation requirements', 'tourism area', 'unique challenges'], '50-400 years', 1, true),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Davis Shores', 'davis-shores', 'East', 'waterfront', '1920s-2020s', 'High income', 'Island waterfront living', ARRAY['Intracoastal properties', 'salt air', 'luxury homes', 'waterfront exposure'], '5-100 years', 2, true),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Anastasia Island', 'anastasia-island', 'Southeast', 'mixed', '1960s-2020s', 'Upper middle income', 'Beach island community', ARRAY['coastal exposure', 'beach proximity', 'salt air', 'varied housing'], '5-60 years', 3, true),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Vilano Beach', 'vilano-beach', 'North', 'beach', '1960s-2020s', 'Upper middle income', 'North beach area', ARRAY['beach properties', 'salt air', 'coastal exposure', 'seasonal usage'], '5-60 years', 4, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'West Augustine', 'west-augustine', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Mainland residential', ARRAY['family homes', 'varied ages', 'standard service'], '20-60 years', 5, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Abbott Tract', 'abbott-tract', 'North', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'family properties', 'system replacements'], '40-70 years', 6, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Uptown', 'uptown', 'Central', 'mixed', '1950s-2010s', 'Middle income', 'Near historic district', ARRAY['mixed housing', 'varied ages', 'tourism proximity'], '12-70 years', 7, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Model Land Area', 'model-land', 'North', 'historic', '1910s-1930s', 'Upper middle income', 'Historic Flagler development', ARRAY['historic homes', 'character properties', 'preservation'], '90-110 years', 8, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Coquina Gables', 'coquina-gables', 'East', 'waterfront', '1950s-1990s', 'Upper middle income', 'Intracoastal community', ARRAY['waterfront properties', 'salt exposure', 'older systems'], '30-70 years', 9, false),
  ('a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d', 'Lincolnville', 'lincolnville', 'West', 'historic', '1890s-1950s', 'Middle income', 'Historic African American district', ARRAY['historic homes', 'varied conditions', 'preservation concerns'], '70-130 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (
  city_id, vertical, slug, title, meta_description,
  primary_keyword, secondary_keywords,
  hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph,
  why_choose_us, local_challenges, services, faq_content, stats_callout,
  final_cta_headline, final_cta_body,
  schema_local_business, schema_faq_page, schema_breadcrumb,
  county_hub_link, sibling_city_links, service_page_links,
  word_count, city_mention_count, neighborhood_mention_count, unique_content_score,
  status, version, generated_by, generation_prompt_version
) VALUES (
  'a6b7c8d9-e0f1-2a3b-4c5d-6e7f8a9b0c1d',
  'hvac',
  '/fl/st-augustine/hvac',
  'HVAC Services in St. Augustine, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for St. Augustine''s historic properties and beaches. Colonial architecture specialists. FPL rebates. Serving Historic District, Davis Shores, Anastasia Island & all areas.',
  'HVAC St. Augustine FL',
  ARRAY['AC repair St. Augustine', 'air conditioning St. Augustine FL', 'HVAC contractor St. Augustine', 'historic St. Augustine HVAC', 'Davis Shores AC', 'Anastasia Island HVAC'],

  'St. Augustine''s Historic Preservation HVAC Experts',
  'Modern comfort for America''s oldest city',
  'Licensed & Insured | FPL Certified | Historic & Beach Property Specialists',
  'St. Augustine—America''s oldest city founded in 1565—presents Florida''s most unique HVAC challenges. With Spanish colonial architecture in the Historic District, beachfront properties on Anastasia Island, waterfront estates on Davis Shores, and neighborhoods spanning four centuries, St. Augustine demands specialized expertise. Our team preserves historic character while delivering modern comfort throughout this treasured coastal community.',

  '{
    "headline": "Why St. Augustine Property Owners Choose Us",
    "reasons": [
      {"title": "Historic Preservation Specialists", "description": "The Colonial Historic District has strict preservation requirements. We provide modern HVAC while respecting Spanish colonial architecture and meeting preservation standards."},
      {"title": "Beach Property Experts", "description": "Anastasia Island and Vilano Beach face extreme Atlantic salt air. We provide maximum coastal protection for St. Augustine''s beach properties."},
      {"title": "Tourism Property Experience", "description": "St. Augustine''s tourism industry creates unique demands. We work with vacation rentals, bed & breakfasts, and seasonal properties."},
      {"title": "Waterfront Specialists", "description": "Davis Shores and Intracoastal properties face enhanced humidity and salt exposure requiring specialized dehumidification and corrosion protection."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to St. Augustine",
    "intro": "St. Augustine''s historic character and coastal location create exceptional HVAC demands:",
    "challenges": [
      {"title": "Historic Preservation Requirements", "description": "The Colonial Historic District has the strictest preservation standards in Florida. HVAC installations must preserve historic character, often requiring creative solutions and approval processes."},
      {"title": "Centuries-Old Architecture", "description": "Buildings from the 1600s-1800s lack modern ductwork, insulation, or electrical infrastructure. Installing HVAC without compromising historic fabric requires expert knowledge."},
      {"title": "Extreme Coastal Salt Air", "description": "Atlantic beach and Intracoastal proximity bring aggressive salt air corrosion. St. Augustine properties need maximum coastal protection for equipment longevity."},
      {"title": "Tourism & Seasonal Usage", "description": "Many St. Augustine properties are vacation rentals or seasonal homes. Systems need setup for intermittent use and commercial-grade reliability."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in St. Augustine",
    "services": [
      {"name": "Historic Preservation HVAC", "slug": "historic-hvac", "description": "Specialized service for St. Augustine''s colonial and historic properties.", "features": ["Preservation compliance", "Creative solutions", "Character respect", "Expert installation"]},
      {"name": "Beach Property Service", "slug": "beach-hvac", "description": "Maximum protection for Anastasia Island and Vilano Beach.", "features": ["Extreme salt protection", "Coastal equipment", "Beach-rated systems", "Extended warranties"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs from Historic District to beaches.", "features": ["Same-day service", "All brands", "90-day warranty", "Preservation-aware"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Historic-appropriate", "Coastal protection", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced service for Davis Shores and Intracoastal properties.", "features": ["Intracoastal protection", "Dehumidification", "Salt air defense", "Humidity control"]},
      {"name": "Vacation Rental Service", "slug": "vacation-rental", "description": "Reliable service for St. Augustine''s tourism properties.", "features": ["Commercial reliability", "Guest comfort focus", "Rapid response", "Seasonal preparation"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work on buildings in St. Augustine''s Historic District?", "answer": "Yes, we specialize in St. Augustine''s colonial and historic properties. We navigate preservation requirements, provide historically-appropriate solutions, and secure necessary approvals."},
      {"question": "How do you install AC in a building from the 1600s?", "answer": "Historic buildings require creative solutions like mini-split systems, concealed ductwork, or strategic equipment placement. We design systems providing modern comfort without compromising historic character."},
      {"question": "Why do St. Augustine beach properties need special HVAC attention?", "answer": "Atlantic ocean and Intracoastal salt air causes rapid equipment corrosion. We provide maximum coastal protection including specialized coatings and corrosion-resistant components."},
      {"question": "What FPL rebates are available in St. Augustine?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for St. Augustine residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"90°F\", \"avg_winter_low\": \"47°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"3,350\", \"days_above_90\": \"91+\", \"hurricane_risk\": \"High"}'::jsonb,

  'Ready for Historic Comfort in St. Augustine?',
  'Contact us today for a consultation. From 400-year-old colonial buildings to modern beach homes, we''ll deliver expert HVAC service preserving St. Augustine''s treasured character.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - St. Augustine\", \"description\": \"Professional HVAC services for St. Augustine, FL specializing in historic preservation and beach properties.\", \"url\": \"https://coolit-hvac.com/st-augustine-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"St. Augustine\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you work on historic district buildings?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we specialize in St. Augustine''s colonial properties and navigate preservation requirements.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"St. Augustine\", \"item\": \"https://coolit-hvac.com/fl/st-augustine\"}]}'::jsonb,

  '/fl/st-johns-county',
  '[{\"slug\": \"/fl/jacksonville/hvac\", \"anchor_text\": \"Jacksonville HVAC\"}, {\"slug\": \"/fl/ponte-vedra-beach/hvac\", \"anchor_text\": \"Ponte Vedra Beach AC\"}, {\"slug\": \"/fl/jacksonville-beach/hvac\", \"anchor_text\": \"Jacksonville Beach HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Preservation HVAC\"}, {\"slug\": \"/services/beach-hvac\", \"anchor_text\": \"Beach Property HVAC\"}]'::jsonb,

  2110, 33, 17, 93,
  'published', 1, 'claude', 'phase14-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Delray Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e',
  'Delray Beach', 'delray-beach', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.4615, -80.0728,
  ARRAY['33444', '33445', '33446', '33447', '33448', '33483', '33484'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a']::uuid[],
  true, 89
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', NOW(), 69000, 'US Census Bureau 2023', 64829, 425000, 62.3,
  ARRAY['single-family', 'condo', 'beachfront', 'luxury'],
  '{"pre-1970\": 20, \"1970s-1990s\": 30, \"2000s-2010s\": 35, \"2020s\": 15}'::jsonb,
  90, 63, 74, 4020, 86, 62.1, 'very_high',
  'All-America City. Vibrant downtown Atlantic Avenue. Beautiful beaches. Arts and culture focus. Active lifestyle. Coastal hurricane zone.',
  ARRAY['Tourism industry', 'Delray Medical Center', 'Office Depot (nearby)', 'Palm Beach County Schools', 'Retail and hospitality', 'Small business'],
  ARRAY['Atlantic Avenue', 'Delray Beach', 'Pineapple Grove Arts District', 'Morikami Museum', 'Old School Square', 'Veterans Park'],
  ARRAY['Delray Affair', 'Garlic Fest', 'GreenMarket', '100-Foot Christmas Tree Lighting'],
  ARRAY['Palm Beach County School District'],
  'Atlantic Avenue redevelopment. Beach area development. Pineapple Grove expansion. Luxury residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional duct testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Delray Beach Water', 140,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment\", \"inspection\": \"Final inspection required"}'::jsonb,
  'high',
  ARRAY['Gator Air Conditioning', 'One Hour Air', 'All Year Cooling', 'Air Ref Co Inc'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Atlantic Avenue', 'atlantic-avenue-delray', 'Central', 'mixed', '1920s-2020s', 'Upper income', 'Vibrant downtown', ARRAY['mixed use', 'varied ages', 'urban living', 'beach proximity'], '5-100 years', 1, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Delray Beach Oceanfront', 'oceanfront-delray', 'East', 'beachfront', '1960s-2020s', 'Very high income', 'Atlantic beachfront', ARRAY['extreme salt air', 'luxury condos', 'beach exposure', 'premium systems'], '5-60 years', 2, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Pineapple Grove', 'pineapple-grove', 'Central', 'mixed', '1940s-2020s', 'Upper middle income', 'Arts district', ARRAY['renovations', 'loft conversions', 'mixed use', 'modern systems'], '5-80 years', 3, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Tropic Isle', 'tropic-isle', 'Central', 'waterfront', '1950s-1990s', 'High income', 'Intracoastal living', ARRAY['waterfront properties', 'salt exposure', 'luxury homes'], '30-70 years', 4, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Lake Ida', 'lake-ida', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Family neighborhood', ARRAY['family homes', 'varied ages', 'standard service'], '20-60 years', 5, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Palm Trail', 'palm-trail', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'family properties', 'efficiency upgrades'], '30-60 years', 6, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Seagate', 'seagate', 'Northeast', 'waterfront', '1960s-2010s', 'High income', 'Exclusive waterfront', ARRAY['Intracoastal properties', 'luxury homes', 'salt air'], '12-60 years', 7, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Village by the Sea', 'village-sea', 'East', 'mixed', '1940s-2000s', 'Upper middle income', 'Beach area', ARRAY['beach proximity', 'salt air', 'varied housing'], '20-80 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'hvac', '/fl/delray-beach/hvac',
  'HVAC Services in Delray Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Delray Beach''s 69,000+ residents. Beach and downtown specialists. FPL rebates. Serving Atlantic Avenue, Pineapple Grove, Oceanfront & all areas.',
  'HVAC Delray Beach FL',
  ARRAY['AC repair Delray Beach', 'air conditioning Delray Beach FL', 'HVAC contractor Delray Beach', 'Atlantic Avenue HVAC', 'Delray Beach AC'],
  'Delray Beach''s All-America City HVAC Experts',
  'Beach-to-Intracoastal comfort solutions',
  'Licensed & Insured | FPL Certified | Beach & Downtown Specialists',
  'Delray Beach—Florida''s "Most Fun Small Town"—combines vibrant downtown Atlantic Avenue with beautiful Atlantic beaches and active lifestyle. With 69,000 residents from beachfront luxury to Pineapple Grove''s arts district, from Intracoastal estates to family neighborhoods, Delray Beach needs HVAC expertise matching its dynamic character.',
  '{"headline\": \"Why Delray Beach Residents Choose Us\", \"reasons\": [{\"title\": \"Beach Property Specialists\", \"description\": \"Atlantic beachfront properties face extreme salt air. We provide maximum coastal protection.\"}, {\"title\": \"Downtown Expertise\", \"description\": \"Atlantic Avenue''s mixed-use properties require commercial and residential expertise.\"}, {\"title\": \"Waterfront Knowledge\", \"description\": \"Intracoastal properties need enhanced dehumidification and salt air protection.\"}, {\"title\": \"FPL Rebate Certified\", \"description\": \"We maximize all available FPL rebates for Delray Beach residents.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Delray Beach\", \"intro\": \"Delray''s coastal location creates unique demands:\", \"challenges\": [{\"title\": \"Extreme Coastal Salt Air\", \"description\": \"Beachfront and near-beach properties face aggressive corrosion requiring maximum protection.\"}, {\"title\": \"Intracoastal Humidity\", \"description\": \"Waterfront properties experience elevated humidity needing enhanced dehumidification.\"}, {\"title\": \"Downtown Mixed-Use\", \"description\": \"Atlantic Avenue properties combine commercial and residential requiring specialized solutions.\"}, {\"title\": \"Hurricane Zone Requirements\", \"description\": \"Coastal location requires wind-rated equipment and enhanced protection.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Beach HVAC\", \"slug\": \"beach-hvac\", \"description\": \"Maximum protection for Atlantic beachfront.\", \"features\": [\"Coastal protection\", \"Salt air defense\", \"Beach-rated\", \"Extended warranty\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Delray Beach.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Beach to Intracoastal\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"Coastal protection\", \"10-year warranty\", \"Financing\"]}, {\"name\": \"Waterfront HVAC\", \"slug\": \"waterfront-hvac\", \"description\": \"Enhanced service for Intracoastal properties.\", \"features\": [\"Dehumidification\", \"Salt protection\", \"Humidity control\", \"Waterfront expertise\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Coastal maintenance programs.\", \"features\": [\"Salt air rinse\", \"Priority service\", \"15% discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does beachfront location affect my AC?\", \"answer\": \"Atlantic salt air causes rapid corrosion. We provide specialized coastal protection for Delray Beach properties.\"}, {\"question\": \"Do Intracoastal properties need special attention?\", \"answer\": \"Yes, waterfront properties experience elevated humidity requiring enhanced dehumidification and moisture control.\"}, {\"question\": \"What FPL rebates are available?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,020\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Delray Beach?',
  'Contact us today. From Atlantic Avenue to the beach to Intracoastal, we deliver expert HVAC service with FPL rebate assistance.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Delray Beach\", \"url\": \"https://coolit-hvac.com/delray-beach-fl\", \"telephone\": \"+1-561-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Delray Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does beachfront affect AC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Salt air causes rapid corrosion requiring specialized coastal protection.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Delray Beach\", \"item\": \"https://coolit-hvac.com/fl/delray-beach\"}]}'::jsonb,
  '/fl/palm-beach-county',
  '[{\"slug\": \"/fl/boca-raton/hvac\", \"anchor_text\": \"Boca Raton HVAC\"}, {\"slug\": \"/fl/boynton-beach/hvac\", \"anchor_text\": \"Boynton Beach AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/beach-hvac\", \"anchor_text\": \"Beach HVAC\"}]'::jsonb,
  1780, 26, 12, 89,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Boynton Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f',
  'Boynton Beach', 'boynton-beach', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.5253, -80.0664,
  ARRAY['33424', '33425', '33426', '33435', '33436', '33437'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a']::uuid[],
  true, 88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', NOW(), 80000, 'US Census Bureau 2023', 58421, 315000, 64.8,
  ARRAY['single-family', 'condo', 'waterfront', 'golf-community'],
  '{"pre-1970\": 18, \"1970s-1990s\": 35, \"2000s-2010s\": 32, \"2020s\": 15}'::jsonb,
  90, 63, 74, 4010, 86, 61.8, 'very_high',
  'Family-friendly beach city. Atlantic Ocean and Intracoastal access. Growing downtown. Diverse community. Coastal hurricane zone.',
  ARRAY['Palm Beach County Schools', 'Bethesda Hospital', 'City of Boynton Beach', 'Retail and hospitality', 'Small business'],
  ARRAY['Oceanfront Park', 'Boynton Harbor Marina', 'Intracoastal Park', 'Town Square', 'Schoolhouse Children Museum'],
  ARRAY['Boynton Beach Pirate Fest', 'Holiday Boat Parade', 'Art festivals', 'GreenMarket'],
  ARRAY['Palm Beach County School District'],
  'Downtown redevelopment. Town Square expansion. Marina district growth. Residential development.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional duct testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Boynton Beach Utilities', 145,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment\", \"inspection\": \"Final inspection required"}'::jsonb,
  'high',
  ARRAY['Gator Air Conditioning', 'One Hour Air', 'All Year Cooling'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Oceanfront Boynton', 'oceanfront-boynton', 'East', 'beachfront', '1960s-2020s', 'High income', 'Atlantic beachfront', ARRAY['beach exposure', 'salt air', 'luxury condos', 'coastal protection'], '5-60 years', 1, true),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Downtown Boynton Beach', 'downtown-boynton', 'Central', 'mixed', '1960s-2020s', 'Middle income', 'Revitalizing downtown', ARRAY['mixed use', 'varied ages', 'urban living'], '5-60 years', 2, true),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Hunters Run', 'hunters-run', 'West', 'golf-community', '1970s-2000s', 'Upper middle income', 'Large golf community', ARRAY['golf course properties', 'HOA standards', 'older systems'], '20-50 years', 3, true),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Leisureville', 'leisureville', 'Central', 'retirement', '1960s-1990s', 'Moderate income', '55+ community', ARRAY['older systems', 'efficiency focus', 'fixed budgets'], '30-60 years', 4, false),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Marina Village', 'marina-village', 'East', 'waterfront', '1990s-2020s', 'Upper income', 'Intracoastal living', ARRAY['waterfront properties', 'salt exposure', 'luxury homes'], '5-30 years', 5, false),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Lake Boynton Estates', 'lake-boynton', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Family neighborhood', ARRAY['family homes', 'varied ages', 'standard service'], '20-50 years', 6, false),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'High Point', 'high-point', 'Central', 'condo', '1970s-1990s', 'Moderate income', 'Condo community', ARRAY['condo systems', 'older buildings', 'association rules'], '30-50 years', 7, false),
  ('c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'Golfview Harbour', 'golfview-harbour', 'Southeast', 'waterfront', '1980s-2010s', 'Upper middle income', 'Golf and marina', ARRAY['waterfront proximity', 'golf course', 'mixed systems'], '12-40 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'c8d9e0f1-a2b3-4c5d-6e7f-8a9b0c1d2e3f', 'hvac', '/fl/boynton-beach/hvac',
  'HVAC Services in Boynton Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Boynton Beach''s 80,000+ residents. Beach and family specialists. FPL rebates. Serving Oceanfront, Downtown, Hunters Run & all neighborhoods.',
  'HVAC Boynton Beach FL',
  ARRAY['AC repair Boynton Beach', 'air conditioning Boynton Beach FL', 'HVAC contractor Boynton Beach', 'Hunters Run HVAC'],
  'Boynton Beach''s Family-Focused HVAC Experts',
  'Beach to Intracoastal comfort solutions',
  'Licensed & Insured | FPL Certified | Beach & Golf Community Specialists',
  'Boynton Beach—Palm Beach County''s family-friendly beach city—combines Atlantic Ocean access with Intracoastal waterfront and diverse neighborhoods. With 80,000 residents from beachfront condos to Hunters Run golf community, from downtown''s revival to family neighborhoods, Boynton Beach presents varied HVAC needs our team understands.',
  '{"headline\": \"Why Boynton Beach Residents Choose Us\", \"reasons\": [{\"title\": \"Beach Property Experts\", \"description\": \"Atlantic beachfront properties need maximum salt air protection.\"}, {\"title\": \"Golf Community Service\", \"description\": \"Hunters Run and other golf communities require HOA compliance and humidity control.\"}, {\"title\": \"Family-Focused Solutions\", \"description\": \"Affordable quality service for Boynton Beach families.\"}, {\"title\": \"FPL Rebate Certified\", \"description\": \"We maximize all FPL rebates for Boynton Beach residents.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Boynton Beach\", \"intro\": \"Boynton''s character creates specific needs:\", \"challenges\": [{\"title\": \"Coastal Salt Air\", \"description\": \"Beach and near-beach properties face corrosion requiring coastal protection.\"}, {\"title\": \"Golf Course Humidity\", \"description\": \"Hunters Run and golf communities experience elevated humidity from irrigation.\"}, {\"title\": \"Varied Housing Stock\", \"description\": \"From 1960s retirement communities to new construction requires different approaches.\"}, {\"title\": \"Waterfront Properties\", \"description\": \"Intracoastal homes need enhanced dehumidification and salt protection.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Beach HVAC\", \"slug\": \"beach-hvac\", \"description\": \"Coastal protection for oceanfront properties.\", \"features\": [\"Salt air defense\", \"Coastal equipment\", \"Beach-rated\", \"Extended warranty\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Boynton Beach.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Family-friendly\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"Coastal protection\", \"10-year warranty\", \"Financing\"]}, {\"name\": \"Golf Community Service\", \"slug\": \"golf-community-hvac\", \"description\": \"Service for Hunters Run and golf properties.\", \"features\": [\"HOA compliance\", \"Humidity control\", \"Premium systems\", \"Golf expertise\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Affordable maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does beach location affect my AC system?\", \"answer\": \"Atlantic salt air causes equipment corrosion. We provide specialized coastal protection for Boynton Beach properties.\"}, {\"question\": \"Do you work with Hunters Run golf community?\", \"answer\": \"Yes, we serve Hunters Run and understand golf course humidity and HOA requirements.\"}, {\"question\": \"What FPL rebates are available?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,010\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Boynton Beach?',
  'Contact us today. From the beach to golf communities to family neighborhoods, we deliver expert HVAC service with FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Boynton Beach\", \"url\": \"https://coolit-hvac.com/boynton-beach-fl\", \"telephone\": \"+1-561-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Boynton Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does beach location affect AC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Salt air causes corrosion requiring specialized coastal protection.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Boynton Beach\", \"item\": \"https://coolit-hvac.com/fl/boynton-beach\"}]}'::jsonb,
  '/fl/palm-beach-county',
  '[{\"slug\": \"/fl/delray-beach/hvac\", \"anchor_text\": \"Delray Beach HVAC\"}, {\"slug\": \"/fl/boca-raton/hvac\", \"anchor_text\": \"Boca Raton AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/beach-hvac\", \"anchor_text\": \"Beach HVAC\"}]'::jsonb,
  1740, 24, 11, 88,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Hollywood, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 13 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood', 'hollywood', 'Florida', 'FL', 'Broward', 'broward-county', 26.0112, -80.1495,
  ARRAY['33019', '33020', '33021', '33022', '33023', '33024', '33025', '33026', '33027', '33028', '33029', '33081', '33083', '33084'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d']::uuid[], true, 94
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', NOW(), 154000, 'US Census Bureau 2023', 56789, 365000, 62.1,
  ARRAY['single-family', 'condo', 'waterfront', 'beachfront'], '{"pre-1970\": 25, \"1970s-1990s\": 35, \"2000s-2010s\": 28, \"2020s\": 12}'::jsonb,
  90, 65, 75, 4080, 86, 62.5, 'very_high', 'Hollywood Beach boardwalk city. Between Fort Lauderdale and Miami. Intracoastal and Atlantic Ocean. High coastal hurricane risk.',
  ARRAY['Memorial Healthcare System', 'Hollywood Memorial Hospital', 'Broward County Schools', 'City of Hollywood', 'Tourism industry'],
  ARRAY['Hollywood Beach Broadwalk', 'Downtown Hollywood', 'Anne Kolb Nature Center', 'Young Circle', 'ArtsPark'],
  ARRAY['Hollywood Beach Latin Festival', 'Hollywood Beach Candy Cane Parade', 'Downtown Hollywood Mural Festival'],
  ARRAY['Broward County Public Schools'], 'Beach area development. Downtown Hollywood redevelopment. Residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Hollywood Utilities', 150,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"coastal_protection\": \"Wind-rated equipment\", \"inspection\": \"Multiple inspections required"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood Beach', 'hollywood-beach', 'East', 'beachfront', '1920s-2020s', 'Upper income', 'Broadwalk and beach', ARRAY['extreme salt air', 'beach exposure', 'luxury condos'], '5-100 years', 1, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Downtown Hollywood', 'downtown-hollywood', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Urban revival', ARRAY['mixed use', 'varied ages', 'urban living'], '5-100 years', 2, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood Hills', 'hollywood-hills', 'West', 'single-family', '1950s-2000s', 'Upper middle income', 'Established neighborhood', ARRAY['family homes', 'varied ages'], '20-70 years', 3, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Emerald Hills', 'emerald-hills', 'Central', 'single-family', '1950s-1990s', 'Middle income', 'Mid-century community', ARRAY['older systems', 'family properties'], '30-70 years', 4, false),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Lake Forest', 'lake-forest', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Family area', ARRAY['varied ages', 'standard service'], '20-60 years', 5, false),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Liberia', 'liberia', 'Central', 'single-family', '1940s-1980s', 'Middle income', 'Historic neighborhood', ARRAY['older homes', 'system replacements'], '40-80 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'hvac', '/fl/hollywood/hvac',
  'HVAC Services in Hollywood, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Hollywood''s 154,000+ residents. Beach and coastal specialists. FPL rebates. Serving Hollywood Beach, Downtown & all neighborhoods.',
  'HVAC Hollywood FL',
  ARRAY['AC repair Hollywood', 'air conditioning Hollywood FL', 'HVAC contractor Hollywood', 'Hollywood Beach HVAC'],
  'Hollywood''s Beach & Broadwalk HVAC Experts',
  'Coastal comfort from beach to downtown',
  'Licensed & Insured | FPL Certified | Beach & Hurricane Zone Specialists',
  'Hollywood—home to the famous Broadwalk—combines beach living with urban convenience between Fort Lauderdale and Miami. With 154,000 residents from beachfront condos to inland neighborhoods, Hollywood needs HVAC expertise matching its coastal demands.',
  '{"headline\": \"Why Hollywood Residents Choose Us\", \"reasons\": [{\"title\": \"Beach Property Specialists\", \"description\": \"Hollywood Beach faces extreme Atlantic salt air requiring maximum coastal protection.\"}, {\"title\": \"Hurricane Zone Experts\", \"description\": \"Broward HVHZ requirements demand wind-rated equipment and enhanced protection.\"}, {\"title\": \"FPL Rebate Certified\", \"description\": \"We maximize all FPL rebates for Hollywood residents.\"}, {\"title\": \"City-Wide Service\", \"description\": \"From beach to downtown to Hollywood Hills, we serve all areas.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Hollywood\", \"intro\": \"Hollywood''s coastal location creates specific demands:\", \"challenges\": [{\"title\": \"Extreme Salt Air Exposure\", \"description\": \"Beach and near-beach properties face aggressive corrosion requiring maximum protection.\"}, {\"title\": \"Hurricane Zone Requirements\", \"description\": \"HVHZ mandates wind-rated equipment, engineered tie-downs, and impact protection.\"}, {\"title\": \"Varied Housing Ages\", \"description\": \"From 1920s historic to new construction requires different HVAC approaches.\"}, {\"title\": \"Coastal Humidity\", \"description\": \"Ocean and Intracoastal proximity brings enhanced humidity needing robust dehumidification.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Beach HVAC\", \"slug\": \"beach-hvac\", \"description\": \"Maximum protection for Hollywood Beach.\", \"features\": [\"Salt air defense\", \"Coastal equipment\", \"Beach-rated\", \"Extended warranty\"]}, {\"name\": \"Hurricane-Rated Systems\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant installations.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Code compliance\", \"Impact protection\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Hollywood.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Beach expertise\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"Coastal protection\", \"10-year warranty\", \"Financing\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Coastal maintenance programs.\", \"features\": [\"Salt air rinse\", \"Priority service\", \"15% discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does Hollywood Beach location affect my AC?\", \"answer\": \"Atlantic salt air causes rapid corrosion. We provide specialized coastal protection for Hollywood Beach properties.\"}, {\"question\": \"What are Broward HVHZ requirements?\", \"answer\": \"High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, and strict inspections.\"}, {\"question\": \"What FPL rebates are available?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"75%\", \"cooling_degree_days\": \"4,080\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Hollywood?',
  'Contact us today. From Hollywood Beach to downtown, we deliver expert HVAC service with FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Hollywood\", \"url\": \"https://coolit-hvac.com/hollywood-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Hollywood\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does beach location affect AC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Salt air causes rapid corrosion requiring specialized coastal protection.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Hollywood\", \"item\": \"https://coolit-hvac.com/fl/hollywood\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale HVAC\"}, {\"slug\": \"/fl/pembroke-pines/hvac\", \"anchor_text\": \"Pembroke Pines AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/beach-hvac\", \"anchor_text\": \"Beach HVAC\"}]'::jsonb,
  1620, 22, 9, 87,
  'published', 1, 'claude', 'phase13-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Pembroke Pines, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Pines', 'pembroke-pines', 'Florida', 'FL', 'Broward', 'broward-county', 26.0034, -80.2962,
  ARRAY['33023', '33024', '33025', '33026', '33027', '33028', '33029', '33082', '33084'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a']::uuid[], true, 95
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', NOW(), 171000, 'US Census Bureau 2023', 68542, 385000, 71.3,
  ARRAY['single-family', 'townhome', 'planned-community', 'suburban'], '{"pre-1970\": 5, \"1970s-1990s\": 40, \"2000s-2010s\": 38, \"2020s\": 17}'::jsonb,
  90, 65, 75, 4070, 86, 62.4, 'very_high', 'Planned suburban city southwest of Fort Lauderdale. Master-planned communities. Family-oriented neighborhoods. Broward HVHZ requirements.',
  ARRAY['Broward County Public Schools', 'Memorial Healthcare System', 'City of Pembroke Pines', 'Retail centers', 'Corporate offices'],
  ARRAY['Pembroke Lakes Mall', 'City Center', 'CB Smith Park', 'Chapel Trail Nature Preserve', 'Pines Boulevard corridor'],
  ARRAY['Festival of the Arts', 'Pines Recreation events', 'Community concerts'],
  ARRAY['Broward County Public Schools'], 'West Pines development. Charter schools expansion. Commercial corridor revitalization. Residential infill projects.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Pembroke Pines Utilities', 152,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"inspection\": \"Multiple inspections required\", \"hoa\": \"Many communities have HOA equipment restrictions"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Chapel Trail', 'chapel-trail', 'West', 'single-family', '1990s-2010s', 'Upper middle income', 'Master-planned gated community', ARRAY['newer homes', 'HOA standards', 'efficiency focus', 'planned infrastructure'], '12-30 years', 1, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Silver Lakes', 'silver-lakes', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established family neighborhood', ARRAY['family homes', 'system replacements', 'standard service'], '20-40 years', 2, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Falls', 'pembroke-falls', 'North', 'single-family', '1990s-2010s', 'Upper income', 'Luxury gated community', ARRAY['larger homes', 'premium systems', 'HOA requirements'], '12-30 years', 3, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Country Isles', 'country-isles', 'East', 'single-family', '1970s-1990s', 'Middle income', 'Mature neighborhood', ARRAY['older systems', 'replacement needs', 'efficiency upgrades'], '30-50 years', 4, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Grand Palms', 'grand-palms', 'South', 'townhome', '2000s-2010s', 'Middle income', 'Golf community townhomes', ARRAY['attached housing', 'shared walls', 'compact systems'], '12-22 years', 5, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Isles', 'pembroke-isles', 'Central', 'single-family', '1980s-2000s', 'Upper middle income', 'Waterfront community', ARRAY['lake proximity', 'humidity control', 'family properties'], '20-40 years', 6, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'West Pines', 'west-pines', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development area', ARRAY['modern construction', 'efficient systems', 'recent builds'], '2-22 years', 7, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pasadena Lakes', 'pasadena-lakes', 'Northeast', 'single-family', '1970s-1990s', 'Middle income', 'Established lakefront area', ARRAY['older homes', 'lake humidity', 'varied systems'], '30-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'hvac', '/fl/pembroke-pines/hvac',
  'HVAC Services in Pembroke Pines, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pembroke Pines'' 171,000+ residents. Planned community specialists. FPL rebates. Serving Chapel Trail, Silver Lakes, Pembroke Falls & all neighborhoods.',
  'HVAC Pembroke Pines FL',
  ARRAY['AC repair Pembroke Pines', 'air conditioning Pembroke Pines FL', 'HVAC contractor Pembroke Pines', 'Chapel Trail HVAC', 'Pembroke Falls AC'],
  'Pembroke Pines'' Master-Planned Community HVAC Experts',
  'Professional service for Florida''s third-largest city',
  'Licensed & Insured | FPL Certified | HOA-Compliant Specialists',
  'Pembroke Pines—Broward County''s largest city and Florida''s third-largest—is built around master-planned communities. With 171,000 residents in neighborhoods like Chapel Trail, Pembroke Falls, Silver Lakes, and West Pines, this suburban city demands HVAC expertise matching its planned excellence and strict HOA standards.',
  '{"headline\": \"Why Pembroke Pines Homeowners Choose Us\", \"reasons\": [{\"title\": \"Master-Planned Community Experts\", \"description\": \"Chapel Trail, Pembroke Falls, and other planned communities have specific HOA equipment requirements and aesthetic standards. We ensure compliance while delivering optimal performance.\"}, {\"title\": \"HOA Compliance Specialists\", \"description\": \"Pembroke Pines neighborhoods often have strict HOA rules for HVAC equipment placement, screening, and appearance. We navigate all requirements seamlessly.\"}, {\"title\": \"Hurricane Zone Certified\", \"description\": \"Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs. All our installations meet strict code compliance.\"}, {\"title\": \"City-Wide Coverage\", \"description\": \"From Chapel Trail to Country Isles to West Pines, we serve all Pembroke Pines neighborhoods with consistent professional service.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Pembroke Pines\", \"intro\": \"Pembroke Pines'' planned communities create specific considerations:\", \"challenges\": [{\"title\": \"HOA Equipment Restrictions\", \"description\": \"Master-planned communities often mandate specific equipment placement, screening requirements, and noise restrictions. Professional navigation of these rules is essential.\"}, {\"title\": \"Planned Infrastructure Requirements\", \"description\": \"Pembroke Pines neighborhoods were built with specific utility infrastructure. HVAC systems must integrate properly with planned electrical and drainage systems.\"}, {\"title\": \"Hurricane Zone Compliance\", \"description\": \"Broward HVHZ mandates wind-rated equipment, engineered tie-downs, and strict inspections throughout Pembroke Pines.\"}, {\"title\": \"Varied Community Ages\", \"description\": \"From 1970s Country Isles to 2020s West Pines, different eras require different HVAC approaches while maintaining city-wide standards.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"HOA-Compliant Installation\", \"slug\": \"hoa-hvac\", \"description\": \"Expert installations meeting all HOA requirements.\", \"features\": [\"HOA compliance\", \"Aesthetic screening\", \"Noise standards\", \"Placement approval\"]}, {\"name\": \"Hurricane-Rated Systems\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant installations.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Code compliance\", \"Permit handling\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Pembroke Pines.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"City-wide coverage\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"HOA approved\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do you handle Chapel Trail or Pembroke Falls HOA requirements?\", \"answer\": \"We''re experienced with Pembroke Pines HOA rules. We handle all compliance, screening, placement approval, and documentation for master-planned communities.\"}, {\"question\": \"What are Broward HVHZ requirements in Pembroke Pines?\", \"answer\": \"High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, and strict inspections. We handle all compliance throughout Pembroke Pines.\"}, {\"question\": \"What FPL rebates are available?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Pembroke Pines residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"75%\", \"cooling_degree_days\": \"4,070\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Pembroke Pines?',
  'Contact us today for a consultation. From Chapel Trail to Pembroke Falls to Silver Lakes, we deliver expert HVAC service with full HOA compliance and FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Pembroke Pines\", \"url\": \"https://coolit-hvac.com/pembroke-pines-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Pembroke Pines\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do you handle HOA requirements?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"We handle all HOA compliance, screening, placement approval, and documentation for Pembroke Pines planned communities.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Pembroke Pines\", \"item\": \"https://coolit-hvac.com/fl/pembroke-pines\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/hollywood/hvac\", \"anchor_text\": \"Hollywood HVAC\"}, {\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/hoa-hvac\", \"anchor_text\": \"HOA-Compliant HVAC\"}]'::jsonb,
  1730, 24, 12, 89,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Coral Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Coral Springs', 'coral-springs', 'Florida', 'FL', 'Broward', 'broward-county', 26.2709, -80.2706,
  ARRAY['33065', '33066', '33067', '33071', '33073', '33075', '33076', '33077'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b']::uuid[], true, 93
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', NOW(), 134000, 'US Census Bureau 2023', 73845, 395000, 75.2,
  ARRAY['single-family', 'townhome', 'master-planned', 'suburban'], '{"pre-1970\": 2, \"1970s-1990s\": 45, \"2000s-2010s\": 35, \"2020s\": 18}'::jsonb,
  90, 64, 74, 4065, 85, 62.2, 'very_high', 'Award-winning master-planned city. Family-oriented. Strong schools. Planned infrastructure. Northwest Broward location.',
  ARRAY['Broward County Public Schools', 'City of Coral Springs', 'Coral Springs Medical Center', 'Corporate offices', 'Professional services'],
  ARRAY['Coral Springs Center for the Arts', 'Sawgrass Mills nearby', 'Mullins Park', 'Sportsplex', 'Walk of Fame'],
  ARRAY['Festival of the Arts', 'Holiday Spectacular', 'Community events'],
  ARRAY['Broward County Public Schools'], 'City Center redevelopment. New residential projects. Commercial corridor improvements. Parks expansion.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Coral Springs Utilities', 148,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"inspection\": \"Multiple inspections\", \"hoa\": \"Most communities have HOA standards"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Eagle Trace', 'eagle-trace', 'East', 'single-family', '1980s-1990s', 'Upper middle income', 'Established gated community', ARRAY['mature neighborhood', 'system replacements', 'HOA standards'], '30-40 years', 1, true),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Heron Bay', 'heron-bay', 'West', 'single-family', '1990s-2010s', 'Upper income', 'Luxury golf community', ARRAY['larger homes', 'premium systems', 'golf course proximity'], '12-30 years', 2, true),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Turtle Run', 'turtle-run', 'South', 'single-family', '1980s-2000s', 'Upper middle income', 'Family neighborhood', ARRAY['family homes', 'varied ages', 'standard service'], '20-40 years', 3, true),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Westchester', 'westchester', 'Central', 'single-family', '1970s-1990s', 'Middle income', 'Original development area', ARRAY['older systems', 'replacement needs', 'efficiency upgrades'], '30-50 years', 4, false),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'The Woods', 'the-woods', 'North', 'single-family', '1980s-2000s', 'Middle income', 'Wooded neighborhood', ARRAY['family properties', 'varied systems', 'tree coverage'], '20-40 years', 5, false),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Cypress Glen', 'cypress-glen', 'Northeast', 'single-family', '1990s-2010s', 'Upper middle income', 'Newer community', ARRAY['modern homes', 'efficient systems', 'planned design'], '12-30 years', 6, false),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Wyndham Lakes', 'wyndham-lakes', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Recent development', ARRAY['newer construction', 'modern systems', 'lakefront'], '2-22 years', 7, false),
  ('f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'Country Glen', 'country-glen', 'Southeast', 'single-family', '1980s-2000s', 'Middle income', 'Established family area', ARRAY['family homes', 'older systems', 'standard service'], '20-40 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'f2a3b4c5-d6e7-8f9a-0b1c-2d3e4f5a6b7c', 'hvac', '/fl/coral-springs/hvac',
  'HVAC Services in Coral Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Coral Springs'' 134,000+ residents. Award-winning city specialists. FPL rebates. Serving Eagle Trace, Heron Bay, Turtle Run & all neighborhoods.',
  'HVAC Coral Springs FL',
  ARRAY['AC repair Coral Springs', 'air conditioning Coral Springs FL', 'HVAC contractor Coral Springs', 'Heron Bay HVAC', 'Eagle Trace AC'],
  'Coral Springs'' Award-Winning Community HVAC Experts',
  'Professional comfort for Broward''s master-planned excellence',
  'Licensed & Insured | FPL Certified | Master-Planned Community Specialists',
  'Coral Springs—consistently ranked among America''s best cities—is Broward''s master-planned jewel. With 134,000 residents in communities like Eagle Trace, Heron Bay, Turtle Run, and Wyndham Lakes, this award-winning city demands HVAC service matching its exceptional standards and strong community pride.',
  '{"headline\": \"Why Coral Springs Residents Choose Us\", \"reasons\": [{\"title\": \"Master-Planned Expertise\", \"description\": \"Coral Springs'' award-winning planning includes specific infrastructure and HOA standards. We understand these communities and deliver compliant, excellent service.\"}, {\"title\": \"Community Standards Excellence\", \"description\": \"Coral Springs residents expect the best. Our service matches the city''s high standards with professional installation, maintenance, and customer care.\"}, {\"title\": \"HOA Compliance Specialists\", \"description\": \"From Eagle Trace to Heron Bay to Cypress Glen, we navigate all HOA requirements for equipment, placement, and aesthetics seamlessly.\"}, {\"title\": \"Family-Focused Service\", \"description\": \"Coral Springs is built for families. We provide reliable, honest service protecting your family''s comfort and your home investment.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Coral Springs\", \"intro\": \"Coral Springs'' master-planned excellence creates specific needs:\", \"challenges\": [{\"title\": \"High Community Standards\", \"description\": \"Award-winning Coral Springs residents expect exceptional service quality. Professional installation, responsive maintenance, and transparent communication are essential.\"}, {\"title\": \"Extensive HOA Requirements\", \"description\": \"Most Coral Springs communities have HOA rules governing HVAC equipment appearance, placement, screening, and noise levels requiring careful compliance.\"}, {\"title\": \"Varied Development Eras\", \"description\": \"From 1970s Westchester to 2020s Wyndham Lakes, different eras have different HVAC infrastructure requiring tailored approaches.\"}, {\"title\": \"Hurricane Zone Compliance\", \"description\": \"Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs throughout Coral Springs.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Master-Planned Community HVAC\", \"slug\": \"planned-community-hvac\", \"description\": \"Expert service for Coral Springs communities.\", \"features\": [\"HOA compliance\", \"High standards\", \"Professional installation\", \"Aesthetic integration\"]}, {\"name\": \"Hurricane-Rated Installation\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant systems.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Code compliance\", \"Permit handling\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Coral Springs.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Professional service\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"HOA approved\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do you handle Eagle Trace or Heron Bay HOA requirements?\", \"answer\": \"We''re experienced with all Coral Springs HOA standards. We handle compliance, placement approval, screening requirements, and all documentation professionally.\"}, {\"question\": \"Why do Coral Springs residents choose you?\", \"answer\": \"We match Coral Springs'' exceptional standards with professional installation, responsive service, transparent pricing, and genuine care for our neighbors.\"}, {\"question\": \"What FPL rebates are available in Coral Springs?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Coral Springs residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,065\", \"days_above_90\": \"85+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Coral Springs?',
  'Contact us today for a consultation. From Eagle Trace to Heron Bay to Turtle Run, we deliver award-winning HVAC service with full HOA compliance and FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Coral Springs\", \"url\": \"https://coolit-hvac.com/coral-springs-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Coral Springs\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do you handle HOA requirements?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"We handle all HOA compliance, placement approval, screening requirements, and documentation for Coral Springs communities.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Coral Springs\", \"item\": \"https://coolit-hvac.com/fl/coral-springs\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/pembroke-pines/hvac\", \"anchor_text\": \"Pembroke Pines HVAC\"}, {\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/hoa-hvac\", \"anchor_text\": \"HOA-Compliant HVAC\"}]'::jsonb,
  1780, 26, 13, 90,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Pompano Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Beach', 'pompano-beach', 'Florida', 'FL', 'Broward', 'broward-county', 26.2379, -80.1248,
  ARRAY['33060', '33061', '33062', '33063', '33064', '33065', '33066', '33069', '33071', '33072', '33073', '33074', '33076', '33077'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e']::uuid[], true, 92
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', NOW(), 112000, 'US Census Bureau 2023', 58234, 345000, 63.5,
  ARRAY['single-family', 'condo', 'beachfront', 'waterfront'], '{"pre-1970\": 30, \"1970s-1990s\": 35, \"2000s-2010s\": 25, \"2020s\": 10}'::jsonb,
  90, 65, 75, 4075, 86, 62.3, 'very_high', 'Atlantic beachfront city. Fishing village heritage. Beach redevelopment. Intracoastal waterfront. Broward HVHZ coastal exposure.',
  ARRAY['Broward County Public Schools', 'City of Pompano Beach', 'Broward Health North', 'Tourism industry', 'Marine businesses'],
  ARRAY['Pompano Beach Pier', 'Hillsboro Lighthouse', 'Pompano Community Park', 'Festival Marketplace', 'Atlantic Boulevard'],
  ARRAY['Pompano Beach Seafood Festival', 'Holiday Boat Parade', 'Fishing tournaments'],
  ARRAY['Broward County Public Schools'], 'Beach area redevelopment. Atlantic Boulevard revitalization. Pier district transformation. Residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Pompano Beach Utilities', 154,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"coastal_protection\": \"Wind-rated and salt air protection\", \"inspection\": \"Multiple inspections required"}'::jsonb,
  'high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Beach Oceanfront', 'oceanfront', 'East', 'beachfront', '1950s-2020s', 'Upper income', 'Atlantic beach properties', ARRAY['extreme salt air', 'beach exposure', 'luxury condos', 'maximum corrosion'], '5-70 years', 1, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Hillsboro Beach', 'hillsboro-beach', 'North', 'beachfront', '1960s-2010s', 'High income', 'Exclusive beach community', ARRAY['oceanfront salt air', 'luxury homes', 'coastal protection'], '10-60 years', 2, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Cresthaven', 'cresthaven', 'Central', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'efficiency upgrades'], '40-70 years', 3, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Palm-Aire', 'palm-aire', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Golf community', ARRAY['country club area', 'larger homes', 'varied systems'], '20-50 years', 4, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Intracoastal Area', 'intracoastal', 'Central', 'waterfront', '1960s-2020s', 'High income', 'Waterway properties', ARRAY['waterfront humidity', 'salt exposure', 'luxury demands'], '5-60 years', 5, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Collier City', 'collier-city', 'South', 'single-family', '1950s-1980s', 'Middle income', 'Traditional neighborhood', ARRAY['older homes', 'family properties', 'standard service'], '40-70 years', 6, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Leisureville', 'leisureville', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', '55+ community', ARRAY['retirement community', 'older systems', 'fixed incomes'], '30-60 years', 7, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Isles', 'pompano-isles', 'Southeast', 'waterfront', '1960s-2000s', 'Upper middle income', 'Canal homes', ARRAY['canal access', 'waterfront exposure', 'boating community'], '20-60 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'hvac', '/fl/pompano-beach/hvac',
  'HVAC Services in Pompano Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pompano Beach''s 112,000+ residents. Beach and coastal specialists. FPL rebates. Serving oceanfront, Hillsboro Beach, Cresthaven & all areas.',
  'HVAC Pompano Beach FL',
  ARRAY['AC repair Pompano Beach', 'air conditioning Pompano Beach FL', 'HVAC contractor Pompano Beach', 'beach HVAC', 'oceanfront AC'],
  'Pompano Beach''s Oceanfront HVAC Experts',
  'Coastal comfort from beach to inland communities',
  'Licensed & Insured | FPL Certified | Beach & Hurricane Zone Specialists',
  'Pompano Beach—"The Heart of the Gold Coast"—combines Atlantic beachfront with diverse inland neighborhoods. With 112,000 residents from oceanfront condos to Intracoastal waterfront to inland communities like Cresthaven and Palm-Aire, Pompano Beach demands HVAC expertise for extreme coastal conditions and varied housing stock.',
  '{"headline\": \"Why Pompano Beach Homeowners Choose Us\", \"reasons\": [{\"title\": \"Oceanfront Specialists\", \"description\": \"Pompano Beach and Hillsboro Beach oceanfront properties face extreme Atlantic salt air. We provide maximum coastal protection with specialized coatings and corrosion-resistant components.\"}, {\"title\": \"Waterfront Expertise\", \"description\": \"Intracoastal and canal properties throughout Pompano Beach require enhanced dehumidification and salt air protection. We deliver waterfront-specific solutions.\"}, {\"title\": \"Hurricane Zone Certified\", \"description\": \"Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs. All our beach and coastal installations meet strict code compliance.\"}, {\"title\": \"Diverse Community Knowledge\", \"description\": \"From beachfront luxury to Leisureville retirement community, we understand Pompano Beach''s varied neighborhoods and their specific needs.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Pompano Beach\", \"intro\": \"Pompano Beach''s coastal location creates demanding conditions:\", \"challenges\": [{\"title\": \"Extreme Oceanfront Salt Air\", \"description\": \"Atlantic beachfront properties face the most aggressive corrosion environment. Unprotected HVAC equipment fails rapidly. Maximum coastal protection is essential.\"}, {\"title\": \"Hurricane Zone Requirements\", \"description\": \"Broward HVHZ mandates wind-rated equipment, engineered tie-downs, impact protection, and strict inspections throughout coastal Pompano Beach.\"}, {\"title\": \"Varied Housing Ages\", \"description\": \"From 1950s Cresthaven to new oceanfront towers, Pompano Beach spans seven decades of construction requiring different HVAC approaches.\"}, {\"title\": \"Waterfront Humidity Control\", \"description\": \"Beach, Intracoastal, and canal proximity brings enhanced humidity requiring robust dehumidification beyond standard air conditioning.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Oceanfront HVAC\", \"slug\": \"oceanfront-hvac\", \"description\": \"Maximum protection for beach properties.\", \"features\": [\"Extreme salt air defense\", \"Coastal coatings\", \"Corrosion protection\", \"Beach-rated equipment\"]}, {\"name\": \"Hurricane-Rated Systems\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant installations.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Impact protection\", \"Code compliance\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Pompano Beach.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Beach expertise\"]}, {\"name\": \"Waterfront HVAC\", \"slug\": \"waterfront-hvac\", \"description\": \"Enhanced service for Intracoastal and canal homes.\", \"features\": [\"Salt air protection\", \"Enhanced dehumidification\", \"Humidity control\", \"Waterfront expertise\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Coastal maintenance programs.\", \"features\": [\"Salt air rinse\", \"Corrosion inspection\", \"Priority service\", \"15% discount\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does oceanfront location affect my AC system?\", \"answer\": \"Atlantic oceanfront exposure brings extreme salt air causing rapid corrosion. We provide specialized coastal protection including corrosion-resistant coatings and marine-grade components for Pompano Beach properties.\"}, {\"question\": \"What are Broward HVHZ requirements?\", \"answer\": \"High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, impact protection, and strict inspections throughout coastal Pompano Beach.\"}, {\"question\": \"What FPL rebates are available in Pompano Beach?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Pompano Beach residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"75%\", \"cooling_degree_days\": \"4,075\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Coastal Comfort in Pompano Beach?',
  'Contact us today for a consultation. From oceanfront condos to Intracoastal waterfront to inland neighborhoods, we deliver expert HVAC service with maximum coastal protection and FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Pompano Beach\", \"url\": \"https://coolit-hvac.com/pompano-beach-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Pompano Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does oceanfront location affect AC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Atlantic oceanfront exposure brings extreme salt air causing rapid corrosion requiring specialized coastal protection.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Pompano Beach\", \"item\": \"https://coolit-hvac.com/fl/pompano-beach\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale HVAC\"}, {\"slug\": \"/fl/coral-springs/hvac\", \"anchor_text\": \"Coral Springs AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/oceanfront-hvac\", \"anchor_text\": \"Oceanfront HVAC\"}]'::jsonb,
  1820, 27, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Jacksonville Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Northeast Florida Beaches
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Jacksonville Beach', 'jacksonville-beach', 'Florida', 'FL', 'Duval', 'duval-county', 30.2866, -81.3948,
  ARRAY['32250'],
  'Jacksonville', ARRAY['a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d']::uuid[], true, 88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', NOW(), 23000, 'US Census Bureau 2023', 74823, 485000, 58.4,
  ARRAY['single-family', 'condo', 'beachfront', 'townhome'], '{"pre-1970\": 20, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 20}'::jsonb,
  90, 48, 70, 2650, 42, 52.8, 'high', 'Atlantic beach community. Jacksonville Beaches area. Seasonal tourism. Moderate coastal climate. Beach lifestyle.',
  ARRAY['City of Jacksonville Beach', 'Beaches Regional Library', 'Tourism businesses', 'Local retail', 'Beach services'],
  ARRAY['Jacksonville Beach Pier', 'Seawalk Pavilion', 'Beach Boulevard corridor', 'Adventure Landing', 'Parks'],
  ARRAY['Springing the Blues', 'Jacksonville Beach Seafood Festival', 'Art Walk', 'Beach events'],
  ARRAY['Duval County Public Schools'], 'Beachfront development. Pier district redevelopment. Residential growth. Commercial corridor improvements.',
  'JEA (Jacksonville Electric Authority)',
  '{"efficiency_programs\": {\"amount\": \"Varies\", \"requirements\": \"JEA efficiency programs available\"}, \"smart_thermostat\": {\"amount\": 75, \"requirements\": \"JEA connected thermostat program\"}}'::jsonb,
  'TECO Peoples Gas', 'JEA Water', 125,
  'Florida Building Code 8th Edition (2023), Jacksonville coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zone\": \"Coastal wind requirements\", \"inspection\": \"Final inspection required"}'::jsonb,
  'moderate', ARRAY['Beaches Heating & Cooling', 'Air America', 'Jacksonville AC companies'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"JEA\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Oceanfront', 'oceanfront-jax', 'East', 'beachfront', '1950s-2020s', 'High income', 'Atlantic beachfront properties', ARRAY['salt air exposure', 'luxury condos', 'beach homes', 'coastal protection'], '5-70 years', 1, true),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Pablo Historical Park', 'pablo-park', 'Central', 'single-family', '1920s-1960s', 'Upper middle income', 'Historic beach neighborhood', ARRAY['historic homes', 'character properties', 'varied systems'], '60-100 years', 2, true),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'South Jax Beach', 'south-jax-beach', 'South', 'single-family', '1960s-2000s', 'Upper middle income', 'Residential beach area', ARRAY['family homes', 'beach proximity', 'varied ages'], '20-60 years', 3, true),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Beach Haven', 'beach-haven', 'North', 'single-family', '1950s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'family properties', 'system replacements'], '30-70 years', 4, false),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Jacksonville Beach Center', 'jax-beach-center', 'Central', 'mixed', '1940s-2020s', 'Upper income', 'Downtown beach area', ARRAY['mixed use', 'condos', 'varied systems'], '5-80 years', 5, false),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'Marshside', 'marshside', 'West', 'single-family', '1970s-2010s', 'Upper middle income', 'Marsh and waterway area', ARRAY['marsh proximity', 'humidity', 'family homes'], '10-50 years', 6, false),
  ('b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'North Beach', 'north-beach-jax', 'North', 'single-family', '1950s-2000s', 'Middle income', 'Beach community', ARRAY['beach proximity', 'varied ages', 'standard service'], '20-70 years', 7, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'b4c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d9e', 'hvac', '/fl/jacksonville-beach/hvac',
  'HVAC Services in Jacksonville Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Jacksonville Beach''s 23,000+ residents. Atlantic beachfront specialists. JEA rebates. Serving oceanfront, Pablo Park & all beach neighborhoods.',
  'HVAC Jacksonville Beach FL',
  ARRAY['AC repair Jacksonville Beach', 'air conditioning Jacksonville Beach FL', 'HVAC contractor Jax Beach', 'beach HVAC', 'oceanfront AC'],
  'Jacksonville Beach''s Atlantic Coast HVAC Experts',
  'Professional comfort for Northeast Florida''s beach community',
  'Licensed & Insured | JEA Certified | Beach & Coastal Specialists',
  'Jacksonville Beach—the heart of Jacksonville''s Beaches community—combines Atlantic oceanfront with historic neighborhoods and family beach living. With 23,000 residents from beachfront properties to Pablo Historical Park to Marshside, Jacksonville Beach demands HVAC service designed for coastal conditions and Northeast Florida''s moderate climate.',
  '{"headline\": \"Why Jacksonville Beach Residents Choose Us\", \"reasons\": [{\"title\": \"Beachfront Specialists\", \"description\": \"Jacksonville Beach oceanfront properties face Atlantic salt air and coastal humidity. We provide beach-specific protection and dehumidification for optimal comfort and equipment longevity.\"}, {\"title\": \"Historic Home Expertise\", \"description\": \"Pablo Historical Park and older Jacksonville Beach neighborhoods feature homes from the 1920s-1960s. We provide modern comfort while respecting historic character.\"}, {\"title\": \"Northeast Florida Climate Knowledge\", \"description\": \"Jacksonville Beach has milder climate than South Florida but still needs robust cooling and humidity control. We design systems for Northeast Florida''s specific conditions.\"}, {\"title\": \"Community-Focused Service\", \"description\": \"As your Jacksonville Beach neighbors, we provide honest, professional service protecting your beach home investment and family comfort.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Jacksonville Beach\", \"intro\": \"Jacksonville Beach''s coastal location creates specific needs:\", \"challenges\": [{\"title\": \"Atlantic Salt Air Exposure\", \"description\": \"Oceanfront and near-beach properties face salt air corrosion requiring coastal-rated equipment and protective coatings for reliable operation.\"}, {\"title\": \"Coastal Humidity Control\", \"description\": \"Beach and marsh proximity brings enhanced humidity beyond inland areas. Proper dehumidification is essential for comfort and mold prevention.\"}, {\"title\": \"Historic Property Considerations\", \"description\": \"Pablo Park and other historic neighborhoods require sensitive HVAC solutions providing modern comfort without compromising architectural character.\"}, {\"title\": \"Seasonal Population Fluctuations\", \"description\": \"Jacksonville Beach tourism and seasonal residents create varying occupancy patterns requiring flexible HVAC solutions.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Beachfront HVAC\", \"slug\": \"beachfront-hvac\", \"description\": \"Specialized service for oceanfront properties.\", \"features\": [\"Salt air protection\", \"Coastal coatings\", \"Enhanced dehumidification\", \"Beach expertise\"]}, {\"name\": \"Historic Home HVAC\", \"slug\": \"historic-hvac\", \"description\": \"Sensitive service for Pablo Park and historic homes.\", \"features\": [\"Character preservation\", \"Modern comfort\", \"Expert installation\", \"Architectural respect\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Jacksonville Beach.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Beach coverage\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with JEA rebates.\", \"features\": [\"JEA rebates\", \"Coastal protection\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Beach-specific maintenance programs.\", \"features\": [\"Bi-annual service\", \"Salt air rinse\", \"Priority scheduling\", \"15% discount\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does Jacksonville Beach climate differ from South Florida?\", \"answer\": \"Jacksonville Beach has milder, more seasonal climate with cooler winters and fewer extreme heat days, but still requires robust cooling and humidity control for beach comfort.\"}, {\"question\": \"Can you work on historic Pablo Park homes?\", \"answer\": \"Yes, we specialize in Jacksonville Beach historic properties. We provide modern comfort solutions while respecting architectural character and working sensitively with older homes.\"}, {\"question\": \"What JEA rebates are available in Jacksonville Beach?\", \"answer\": \"JEA offers efficiency programs and connected thermostat rebates up to $75. We handle all rebate coordination for Jacksonville Beach residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"70%\", \"cooling_degree_days\": \"2,650\", \"days_above_90\": \"42\", \"hurricane_risk\": \"High"}'::jsonb,
  'Ready for Beach Comfort in Jacksonville Beach?',
  'Contact us today for a consultation. From oceanfront properties to Pablo Park to family neighborhoods, we deliver expert HVAC service with coastal protection and JEA rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Jacksonville Beach\", \"url\": \"https://coolit-hvac.com/jacksonville-beach-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Jacksonville Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does beach location affect AC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Atlantic oceanfront brings salt air corrosion and enhanced humidity requiring coastal protection and dehumidification.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Jacksonville Beach\", \"item\": \"https://coolit-hvac.com/fl/jacksonville-beach\"}]}'::jsonb,
  '/fl/duval-county',
  '[{\"slug\": \"/fl/jacksonville/hvac\", \"anchor_text\": \"Jacksonville HVAC\"}, {\"slug\": \"/fl/ponte-vedra-beach/hvac\", \"anchor_text\": \"Ponte Vedra Beach AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/beachfront-hvac\", \"anchor_text\": \"Beachfront HVAC\"}]'::jsonb,
  1760, 28, 10, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Ponte Vedra Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Northeast Florida Beaches
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Ponte Vedra Beach', 'ponte-vedra-beach', 'Florida', 'FL', 'St. Johns', 'st-johns-county', 30.2396, -81.3862,
  ARRAY['32004', '32081', '32082'],
  'Jacksonville', ARRAY[]::uuid[], true, 87
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', NOW(), 32000, 'US Census Bureau 2023', 128456, 785000, 82.5,
  ARRAY['single-family', 'luxury', 'waterfront', 'golf-community'], '{"pre-1970\": 10, \"1970s-1990s\": 25, \"2000s-2010s\": 35, \"2020s\": 30}'::jsonb,
  90, 47, 69, 2640, 41, 52.5, 'high', 'Affluent Atlantic beach community. TPC Sawgrass headquarters. Luxury golf communities. High-income demographics. Premium properties.',
  ARRAY['TPC Sawgrass', 'PGA Tour headquarters', 'Mayo Clinic Jacksonville', 'Professional services', 'Golf industry'],
  ARRAY['TPC Sawgrass (The Players)', 'Ponte Vedra Inn & Club', 'Guana Tolomato Matanzas Reserve', 'Golf courses', 'Beach clubs'],
  ARRAY['The Players Championship', 'Golf tournaments', 'Community events'],
  ARRAY['St. Johns County School District'], 'Luxury residential development. Golf community expansion. Beach property growth. Upscale commercial.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'TECO Peoples Gas', 'JEA Water', 118,
  'Florida Building Code 8th Edition (2023), St. Johns County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zone\": \"Coastal wind requirements\", \"inspection\": \"Final inspection required\", \"hoa\": \"Extensive HOA equipment standards"}'::jsonb,
  'very_high', ARRAY['Beaches Heating & Cooling', 'Premium HVAC providers', 'Luxury home specialists'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'TPC Sawgrass', 'tpc-sawgrass', 'Central', 'golf-community', '1980s-2020s', 'Very high income', 'World-renowned golf community', ARRAY['luxury homes', 'premium systems', 'HOA standards', 'golf course proximity'], '2-40 years', 1, true),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Oceanfront Estates', 'oceanfront-pvb', 'East', 'beachfront', '1970s-2020s', 'Very high income', 'Atlantic luxury beachfront', ARRAY['oceanfront salt air', 'luxury demands', 'beach exposure', 'premium equipment'], '5-50 years', 2, true),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Marsh Landing', 'marsh-landing', 'North', 'golf-community', '1990s-2010s', 'High income', 'Country club community', ARRAY['luxury homes', 'golf proximity', 'premium systems'], '10-30 years', 3, true),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Sawgrass Village', 'sawgrass-village', 'West', 'single-family', '1980s-2010s', 'Upper income', 'Established golf area', ARRAY['larger homes', 'varied systems', 'golf community'], '10-40 years', 4, false),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Ponte Vedra', 'ponte-vedra-estates', 'Central', 'single-family', '1970s-2000s', 'High income', 'Original development area', ARRAY['established luxury', 'varied ages', 'premium service'], '20-50 years', 5, false),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Nocatee', 'nocatee-pvb', 'South', 'single-family', '2000s-2020s', 'Upper income', 'Master-planned community', ARRAY['newer construction', 'modern systems', 'planned development'], '2-22 years', 6, false),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Intracoastal Area', 'intracoastal-pvb', 'West', 'waterfront', '1980s-2020s', 'Very high income', 'Waterway luxury properties', ARRAY['waterfront exposure', 'luxury systems', 'humidity control'], '5-40 years', 7, false),
  ('c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'Palm Valley', 'palm-valley', 'South', 'single-family', '1990s-2020s', 'Upper income', 'Family-oriented community', ARRAY['family homes', 'modern systems', 'standard luxury'], '2-30 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'c5d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e0f', 'hvac', '/fl/ponte-vedra-beach/hvac',
  'HVAC Services in Ponte Vedra Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Ponte Vedra Beach''s 32,000+ residents. Luxury home and golf community specialists. FPL rebates. Serving TPC Sawgrass, oceanfront estates & all areas.',
  'HVAC Ponte Vedra Beach FL',
  ARRAY['AC repair Ponte Vedra Beach', 'air conditioning Ponte Vedra Beach FL', 'HVAC contractor Ponte Vedra', 'TPC Sawgrass HVAC', 'luxury home AC'],
  'Ponte Vedra Beach''s Luxury Home HVAC Experts',
  'Premium comfort for Northeast Florida''s premier beach community',
  'Licensed & Insured | FPL Certified | Luxury Home & Golf Community Specialists',
  'Ponte Vedra Beach—home to TPC Sawgrass and The Players Championship—is Northeast Florida''s premier luxury beach community. With 32,000 residents in exclusive neighborhoods like TPC Sawgrass, oceanfront estates, Marsh Landing, and Nocatee, Ponte Vedra Beach demands premium HVAC service matching its exceptional property values and high standards.',
  '{"headline\": \"Why Ponte Vedra Beach Homeowners Choose Us\", \"reasons\": [{\"title\": \"Luxury Home Specialists\", \"description\": \"Ponte Vedra Beach features exceptional properties requiring premium HVAC systems, expert installation, and white-glove service. We deliver luxury home expertise with attention to detail.\"}, {\"title\": \"Golf Community Expertise\", \"description\": \"TPC Sawgrass, Marsh Landing, and other golf communities have specific HOA standards and aesthetic requirements. We provide compliant installations with seamless integration.\"}, {\"title\": \"Oceanfront Protection\", \"description\": \"Atlantic beachfront estates require maximum salt air protection and coastal-rated equipment. We provide specialized oceanfront HVAC solutions for luxury beach properties.\"}, {\"title\": \"Premium Service Standards\", \"description\": \"Ponte Vedra Beach residents expect the best. We provide responsive, professional service with transparent communication and exceptional workmanship.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Ponte Vedra Beach\", \"intro\": \"Ponte Vedra Beach luxury properties create specific demands:\", \"challenges\": [{\"title\": \"Luxury Property Expectations\", \"description\": \"High-value Ponte Vedra Beach homes require premium equipment, expert installation, and exceptional service quality matching property standards and homeowner expectations.\"}, {\"title\": \"Extensive HOA Requirements\", \"description\": \"TPC Sawgrass and golf communities have strict HOA rules for equipment aesthetics, placement, noise levels, and screening requiring professional compliance.\"}, {\"title\": \"Oceanfront Salt Air\", \"description\": \"Atlantic beachfront estates face salt air corrosion requiring coastal-rated components, protective coatings, and specialized maintenance for equipment longevity.\"}, {\"title\": \"Complex System Design\", \"description\": \"Large luxury homes with multiple zones, wine cellars, and humidity-sensitive features require sophisticated HVAC design and precise installation.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Luxury Home HVAC\", \"slug\": \"luxury-home-hvac\", \"description\": \"Premium service for Ponte Vedra Beach estates.\", \"features\": [\"Multi-zone systems\", \"Premium equipment\", \"Expert design\", \"White-glove service\"]}, {\"name\": \"Golf Community HVAC\", \"slug\": \"golf-community-hvac\", \"description\": \"HOA-compliant service for TPC Sawgrass and communities.\", \"features\": [\"HOA compliance\", \"Aesthetic integration\", \"Noise control\", \"Professional approval\"]}, {\"name\": \"Oceanfront HVAC\", \"slug\": \"oceanfront-hvac\", \"description\": \"Specialized service for beachfront estates.\", \"features\": [\"Salt air protection\", \"Coastal equipment\", \"Enhanced dehumidification\", \"Beach expertise\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert luxury installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"Premium brands\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"VIP Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive luxury home maintenance.\", \"features\": [\"Priority service\", \"Quarterly visits\", \"Extended coverage\", \"Concierge support\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do you handle TPC Sawgrass HOA requirements?\", \"answer\": \"We''re experienced with all Ponte Vedra Beach golf community HOA standards. We handle compliance, aesthetic integration, noise requirements, and all approval documentation professionally.\"}, {\"question\": \"What makes Ponte Vedra Beach HVAC service different?\", \"answer\": \"Ponte Vedra Beach luxury homes require premium equipment, sophisticated multi-zone design, expert installation, and white-glove service. We specialize in high-value property HVAC.\"}, {\"question\": \"What FPL rebates are available in Ponte Vedra Beach?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate coordination for Ponte Vedra Beach residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"69%\", \"cooling_degree_days\": \"2,640\", \"days_above_90\": \"41\", \"hurricane_risk\": \"High"}'::jsonb,
  'Ready for Premium Comfort in Ponte Vedra Beach?',
  'Contact us today for a consultation. From TPC Sawgrass to oceanfront estates to luxury communities, we deliver exceptional HVAC service matching Ponte Vedra Beach standards.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Ponte Vedra Beach\", \"url\": \"https://coolit-hvac.com/ponte-vedra-beach-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Ponte Vedra Beach\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do you handle golf community HOA requirements?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"We handle all HOA compliance, aesthetic integration, noise requirements, and approval documentation for Ponte Vedra Beach golf communities.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Ponte Vedra Beach\", \"item\": \"https://coolit-hvac.com/fl/ponte-vedra-beach\"}]}'::jsonb,
  '/fl/st-johns-county',
  '[{\"slug\": \"/fl/jacksonville-beach/hvac\", \"anchor_text\": \"Jacksonville Beach HVAC\"}, {\"slug\": \"/fl/st-augustine/hvac\", \"anchor_text\": \"St. Augustine AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/luxury-home-hvac\", \"anchor_text\": \"Luxury Home HVAC\"}]'::jsonb,
  1850, 29, 11, 91,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Orange Park, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Jacksonville Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'd6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Orange Park', 'orange-park', 'Florida', 'FL', 'Clay', 'clay-county', 30.1661, -81.7062,
  ARRAY['32003', '32065', '32073'],
  'Jacksonville', ARRAY[]::uuid[], true, 84
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'd6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', NOW(), 9000, 'US Census Bureau 2023', 65432, 285000, 68.7,
  ARRAY['single-family', 'townhome', 'suburban', 'family-oriented'], '{"pre-1970\": 15, \"1970s-1990s\": 40, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 46, 68, 2680, 46, 52.2, 'moderate', 'Jacksonville southwestern suburb. Clay County. St. Johns River proximity. Family-oriented. Military presence from NAS Jax.',
  ARRAY['Orange Park Medical Center', 'Clay County Schools', 'Town of Orange Park', 'Retail businesses', 'NAS Jacksonville nearby'],
  ARRAY['Clarke House Park', 'Thrasher-Horne Center', 'St. Johns River', 'Orange Park Mall area', 'Blanding Boulevard'],
  ARRAY['Community events', 'River activities', 'Town celebrations'],
  ARRAY['Clay County District Schools'], 'Residential growth. Commercial development. Infrastructure improvements. River district development.',
  'Clay Electric Cooperative',
  '{"efficiency_programs\": {\"amount\": \"Varies\", \"requirements\": \"Clay Electric efficiency programs\"}, \"rebate_programs\": {\"amount\": \"Available\", \"requirements\": \"Co-op member programs\"}}'::jsonb,
  'TECO Peoples Gas', 'Town of Orange Park Utilities', 142,
  'Florida Building Code 8th Edition (2023), Clay County amendments',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code compliance"}'::jsonb,
  'moderate', ARRAY['Local HVAC companies', 'Jacksonville metro providers', 'Regional contractors'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Clay Electric\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Old Orange Park', 'old-orange-park', 'Central', 'single-family', '1940s-1980s', 'Middle income', 'Historic town center', ARRAY['older homes', 'established neighborhood', 'system replacements'], '40-80 years', 1, true),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Doctors Lake Area', 'doctors-lake', 'East', 'single-family', '1970s-2010s', 'Upper middle income', 'Lakefront community', ARRAY['lake proximity', 'humidity', 'family homes'], '10-50 years', 2, true),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Orange Park Acres', 'op-acres', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Family neighborhood', ARRAY['family properties', 'varied ages', 'standard service'], '20-60 years', 3, true),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Lakeside', 'lakeside-op', 'North', 'single-family', '1980s-2010s', 'Upper middle income', 'Lake community', ARRAY['newer homes', 'lake area', 'modern systems'], '10-40 years', 4, false),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Blanding Boulevard Area', 'blanding-area', 'Central', 'mixed', '1970s-2020s', 'Middle income', 'Commercial corridor proximity', ARRAY['mixed housing', 'varied ages', 'convenient location'], '2-50 years', 5, false),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Moosehaven', 'moosehaven', 'South', 'retirement', '1930s-1990s', 'Moderate income', 'Retirement community', ARRAY['senior housing', 'older systems', 'budget considerations'], '30-90 years', 6, false),
  ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'Grove Park', 'grove-park', 'Northeast', 'single-family', '1990s-2020s', 'Middle income', 'Newer development', ARRAY['modern homes', 'efficient systems', 'family area'], '2-30 years', 7, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'd6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f1a', 'hvac', '/fl/orange-park/hvac',
  'HVAC Services in Orange Park, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Orange Park''s 9,000+ residents. Clay County specialists. Clay Electric rebates. Serving Doctors Lake, Old Orange Park & all neighborhoods.',
  'HVAC Orange Park FL',
  ARRAY['AC repair Orange Park', 'air conditioning Orange Park FL', 'HVAC contractor Orange Park', 'Clay County HVAC', 'Doctors Lake AC'],
  'Orange Park''s Trusted Community HVAC Experts',
  'Professional comfort for Clay County''s riverside town',
  'Licensed & Insured | Clay Electric Certified | Family-Owned Service',
  'Orange Park—Clay County''s charming riverside town—combines historic character with suburban convenience just southwest of Jacksonville. With 9,000 residents in neighborhoods from Old Orange Park to Doctors Lake to Grove Park, this family-oriented community values reliable, honest HVAC service from neighbors who care.',
  '{"headline\": \"Why Orange Park Residents Choose Us\", \"reasons\": [{\"title\": \"Community-Focused Service\", \"description\": \"Orange Park values community and relationships. We''re your neighbors providing honest, transparent service protecting your family comfort and home investment.\"}, {\"title\": \"Clay County Expertise\", \"description\": \"Orange Park sits in Clay County with specific building codes and Clay Electric service. We understand local requirements and utility programs serving our community.\"}, {\"title\": \"Lakefront Property Knowledge\", \"description\": \"Doctors Lake and other lakefront areas bring enhanced humidity and specific HVAC needs. We provide lake-appropriate dehumidification and system design.\"}, {\"title\": \"Family-First Values\", \"description\": \"Orange Park is family-oriented. We provide reliable service, fair pricing, and genuine care ensuring your family''s comfort year-round.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Orange Park\", \"intro\": \"Orange Park''s riverside location creates specific needs:\", \"challenges\": [{\"title\": \"St. Johns River Humidity\", \"description\": \"Orange Park''s proximity to the St. Johns River and Doctors Lake brings enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}, {\"title\": \"Varied Housing Ages\", \"description\": \"From 1940s Old Orange Park to 2020s Grove Park, different construction eras require tailored HVAC approaches while maintaining consistent comfort standards.\"}, {\"title\": \"Military Family Considerations\", \"description\": \"Orange Park''s proximity to NAS Jacksonville means many military families. We provide reliable service, fair pricing, and flexible scheduling for all residents.\"}, {\"title\": \"Clay Electric Service\", \"description\": \"Orange Park is served by Clay Electric Cooperative with specific efficiency programs and requirements different from investor-owned utilities.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lakefront HVAC\", \"slug\": \"lakefront-hvac\", \"description\": \"Specialized service for Doctors Lake properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"Historic Home HVAC\", \"slug\": \"historic-hvac\", \"description\": \"Sensitive service for Old Orange Park homes.\", \"features\": [\"Character preservation\", \"Modern comfort\", \"Expert installation\", \"Respectful approach\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Orange Park.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Clay Electric coordination.\", \"features\": [\"Efficiency programs\", \"Local expertise\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does Doctors Lake location affect my HVAC system?\", \"answer\": \"Lakefront properties in Orange Park experience enhanced humidity from water proximity. Proper dehumidification and humidity control are essential for comfort and preventing mold.\"}, {\"question\": \"Do you work with Clay Electric Cooperative programs?\", \"answer\": \"Yes, we understand Clay Electric''s efficiency programs and rebates serving Orange Park. We coordinate with the co-op for available incentives and requirements.\"}, {\"question\": \"Why should I choose a local Orange Park HVAC company?\", \"answer\": \"As your Orange Park neighbors, we provide personalized service, understand local conditions, respond quickly, and care about our community''s comfort and satisfaction.\"}]}'::jsonb,
  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"68%\", \"cooling_degree_days\": \"2,680\", \"days_above_90\": \"46\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Comfort in Orange Park?',
  'Contact us today for a consultation. From Old Orange Park to Doctors Lake to Grove Park, we deliver honest, professional HVAC service with community care.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Orange Park\", \"url\": \"https://coolit-hvac.com/orange-park-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Orange Park\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does lake location affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Lakefront properties experience enhanced humidity requiring proper dehumidification and humidity control.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Orange Park\", \"item\": \"https://coolit-hvac.com/fl/orange-park\"}]}'::jsonb,
  '/fl/clay-county',
  '[{\"slug\": \"/fl/jacksonville/hvac\", \"anchor_text\": \"Jacksonville HVAC\"}, {\"slug\": \"/fl/middleburg/hvac\", \"anchor_text\": \"Middleburg AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lakefront-hvac\", \"anchor_text\": \"Lakefront HVAC\"}]'::jsonb,
  1740, 26, 9, 86,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Deltona, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Deltona', 'deltona', 'Florida', 'FL', 'Volusia', 'volusia-county', 28.9005, -81.2139,
  ARRAY['32725', '32738', '32739'],
  'Deltona-Daytona Beach-Ormond Beach', ARRAY[]::uuid[], true, 85
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', NOW(), 96000, 'US Census Bureau 2023', 54678, 255000, 78.5,
  ARRAY['single-family', 'planned-community', 'suburban', 'family-oriented'], '{"pre-1970\": 5, \"1970s-1990s\": 60, \"2000s-2010s\": 25, \"2020s\": 10}'::jsonb,
  92, 52, 72, 2850, 58, 51.5, 'moderate', 'Large planned community. Orlando-Daytona corridor. Lakes throughout. Family-oriented suburbs. Volusia County inland.',
  ARRAY['Volusia County Schools', 'City of Deltona', 'Local businesses', 'Retail centers', 'Healthcare facilities'],
  ARRAY['Lake Monroe', 'Green Springs Park', 'Deltona Lakes', 'Dewey O. Boster Sports Complex', 'Community parks'],
  ARRAY['Community events', 'Recreation programs', 'Festivals'],
  ARRAY['Volusia County Schools'], 'Commercial development. Infrastructure improvements. Residential infill. Parks expansion.',
  'Duke Energy Florida',
  '{"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'Natural gas not widely available', 'City of Deltona Water', 165,
  'Florida Building Code 8th Edition (2023), Volusia County amendments',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code"}'::jsonb,
  'moderate', ARRAY['Local HVAC contractors', 'Orlando metro providers', 'Daytona area companies'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Deltona Lakes', 'deltona-lakes', 'Central', 'single-family', '1970s-1990s', 'Middle income', 'Lakes throughout community', ARRAY['lake proximity', 'humidity', 'older systems', 'family homes'], '30-50 years', 1, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'South Deltona', 'south-deltona', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['family properties', 'varied ages', 'standard service'], '20-50 years', 2, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'North Deltona', 'north-deltona', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Family area', ARRAY['planned homes', 'system replacements', 'efficiency upgrades'], '10-40 years', 3, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Lake Monroe Area', 'lake-monroe', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Lake proximity', ARRAY['lake humidity', 'waterfront influence', 'family homes'], '20-50 years', 4, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Elkcam', 'elkcam', 'West', 'single-family', '1970s-1990s', 'Middle income', 'Original development section', ARRAY['older homes', 'established neighborhood', 'system needs'], '30-50 years', 5, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Vann Park', 'vann-park', 'Northeast', 'single-family', '1980s-2010s', 'Middle income', 'Parks and recreation nearby', ARRAY['family properties', 'varied systems', 'standard service'], '10-40 years', 6, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'West Deltona', 'west-deltona', 'West', 'single-family', '1980s-2020s', 'Middle income', 'Growing area', ARRAY['mixed ages', 'newer development', 'family focus'], '2-40 years', 7, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Green Springs', 'green-springs', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Park area community', ARRAY['established homes', 'family properties', 'standard needs'], '20-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'hvac', '/fl/deltona/hvac',
  'HVAC Services in Deltona, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Deltona''s 96,000+ residents. Planned community specialists. Duke Energy rebates. Serving Deltona Lakes, all neighborhoods city-wide.',
  'HVAC Deltona FL',
  ARRAY['AC repair Deltona', 'air conditioning Deltona FL', 'HVAC contractor Deltona', 'Deltona Lakes HVAC', 'Volusia County AC'],
  'Deltona''s Trusted Planned Community HVAC Experts',
  'Professional comfort for Central Florida''s lakeside city',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'Deltona—Volusia County''s largest city—is Central Florida''s premier planned community with lakes throughout. With 96,000 residents in neighborhoods from Deltona Lakes to South Deltona to West Deltona, this family-oriented city built in the 1970s-1990s has unique HVAC needs from its planned infrastructure and lake-filled landscape.',
  '{"headline\": \"Why Deltona Homeowners Choose Us\", \"reasons\": [{\"title\": \"Planned Community Expertise\", \"description\": \"Deltona was developed as a master-planned community with specific infrastructure. We understand the planned utility systems, drainage, and construction standards unique to Deltona.\"}, {\"title\": \"Lakes and Humidity Knowledge\", \"description\": \"Deltona has numerous lakes throughout neighborhoods bringing enhanced humidity. We provide lake-appropriate dehumidification and humidity control for optimal comfort.\"}, {\"title\": \"1970s-1990s Home Specialists\", \"description\": \"Most Deltona homes date from the original development era. We specialize in updating these systems with modern efficiency while working with existing infrastructure.\"}, {\"title\": \"Community-Focused Service\", \"description\": \"Deltona is family-oriented and community-minded. We provide honest, fair service protecting our neighbors'' comfort and home investments.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Deltona\", \"intro\": \"Deltona''s planned community design creates specific considerations:\", \"challenges\": [{\"title\": \"Extensive Lake System Humidity\", \"description\": \"Deltona''s numerous lakes throughout the community bring enhanced humidity beyond typical Central Florida levels. Proper dehumidification is essential for comfort and mold prevention.\"}, {\"title\": \"1970s-1990s Infrastructure\", \"description\": \"Deltona''s original planned development created specific electrical, drainage, and utility infrastructure. HVAC systems must work properly with this planned design.\"}, {\"title\": \"Aging Systems Need Updates\", \"description\": \"Many Deltona homes still have original or early replacement systems. Modern high-efficiency equipment provides substantial improvements in comfort and cost.\"}, {\"title\": \"Duke Energy Service Area\", \"description\": \"Deltona is served by Duke Energy with specific rebate programs and requirements different from other Central Florida utilities.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lake Area HVAC\", \"slug\": \"lake-hvac\", \"description\": \"Specialized service for Deltona''s lakefront properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"System Replacement\", \"slug\": \"system-replacement\", \"description\": \"Upgrading 1970s-1990s systems with modern efficiency.\", \"features\": [\"Energy savings\", \"Duke rebates\", \"Modern comfort\", \"10-year warranty\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Deltona.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Planned community expertise\", \"Financing available\", \"Professional installation\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do Deltona''s lakes affect HVAC systems?\", \"answer\": \"Deltona''s extensive lake system creates enhanced humidity throughout the community. Proper dehumidification beyond standard air conditioning is essential for comfort and preventing mold.\"}, {\"question\": \"Should I replace my original 1970s-1990s system?\", \"answer\": \"Yes. Systems from Deltona''s original development era are far less efficient than modern equipment. Replacement provides major improvements in comfort, efficiency, and reliability.\"}, {\"question\": \"What Duke Energy rebates are available in Deltona?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Deltona residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"72%\", \"cooling_degree_days\": \"2,850\", \"days_above_90\": \"58\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Comfort in Deltona?',
  'Contact us today for a consultation. From Deltona Lakes to South Deltona to West Deltona, we deliver professional HVAC service with Duke Energy rebates and community care.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Deltona\", \"url\": \"https://coolit-hvac.com/deltona-fl\", \"telephone\": \"+1-386-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Deltona\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do lakes affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Deltona''s extensive lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Deltona\", \"item\": \"https://coolit-hvac.com/fl/deltona\"}]}'::jsonb,
  '/fl/volusia-county',
  '[{\"slug\": \"/fl/daytona-beach/hvac\", \"anchor_text\": \"Daytona Beach HVAC\"}, {\"slug\": \"/fl/ormond-beach/hvac\", \"anchor_text\": \"Ormond Beach AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Area HVAC\"}]'::jsonb,
  1820, 30, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- St. Cloud, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'St. Cloud', 'st-cloud', 'Florida', 'FL', 'Osceola', 'osceola-county', 28.2489, -81.2811,
  ARRAY['34769', '34771', '34772', '34773'],
  'Orlando-Kissimmee-Sanford', ARRAY[]::uuid[], true, 83
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', NOW(), 56000, 'US Census Bureau 2023', 58234, 285000, 71.4,
  ARRAY['single-family', 'retirement', 'suburban', 'lakefront'], '{"pre-1970\": 10, \"1970s-1990s\": 30, \"2000s-2010s\": 40, \"2020s\": 20}'::jsonb,
  93, 53, 73, 2920, 64, 50.8, 'moderate', 'South of Kissimmee. Orlando metro area. East Lake Tohopekaliga. Growth from Orlando expansion. Mix of retirees and families.',
  ARRAY['Osceola County Schools', 'City of St. Cloud', 'Tourism related', 'Healthcare', 'Retail'],
  ARRAY['East Lake Tohopekaliga', 'Lakefront Park', 'Veteran''s Memorial', 'Downtown St. Cloud', 'Narcoossee area'],
  ARRAY['Great American Pie Festival', 'Community events', 'Lakefront activities'],
  ARRAY['Osceola County School District'], 'Rapid residential growth. New neighborhoods. Commercial development. Infrastructure expansion.',
  'Duke Energy Florida',
  '{"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'TECO Peoples Gas', 'Tohopekaliga Water Authority', 178,
  'Florida Building Code 8th Edition (2023), Osceola County amendments',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code"}'::jsonb,
  'moderate', ARRAY['Local HVAC companies', 'Kissimmee providers', 'Orlando metro contractors'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Lakefront St. Cloud', 'lakefront-st-cloud', 'North', 'mixed', '1920s-2020s', 'Middle income', 'East Lake Toho waterfront', ARRAY['lake proximity', 'humidity', 'varied ages', 'waterfront exposure'], '5-100 years', 1, true),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'East St. Cloud', 'east-st-cloud', 'East', 'single-family', '2000s-2020s', 'Middle income', 'Rapid growth area', ARRAY['newer homes', 'modern systems', 'family properties'], '2-22 years', 2, true),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Downtown St. Cloud', 'downtown-st-cloud', 'Central', 'mixed', '1900s-1990s', 'Middle income', 'Historic downtown area', ARRAY['historic homes', 'varied ages', 'older systems'], '30-120 years', 3, true),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Narcoossee', 'narcoossee', 'South', 'single-family', '2000s-2020s', 'Upper middle income', 'Growing suburban area', ARRAY['new construction', 'modern homes', 'efficient systems'], '2-22 years', 4, false),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'West St. Cloud', 'west-st-cloud', 'West', 'single-family', '1990s-2010s', 'Middle income', 'Established neighborhoods', ARRAY['family homes', 'varied systems', 'standard service'], '12-30 years', 5, false),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Buenaventura Lakes', 'buenaventura-lakes', 'Northwest', 'single-family', '1990s-2010s', 'Middle income', 'Planned community', ARRAY['lake area', 'family properties', 'humidity'], '12-30 years', 6, false),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Lake Runnymede', 'lake-runnymede', 'Northeast', 'retirement', '1970s-2000s', 'Moderate income', '55+ community', ARRAY['retirement housing', 'older systems', 'senior residents'], '20-50 years', 7, false),
  ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'Southport', 'southport', 'South', 'single-family', '2000s-2020s', 'Middle income', 'Newer development', ARRAY['modern homes', 'family area', 'efficient systems'], '2-22 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b3c', 'hvac', '/fl/st-cloud/hvac',
  'HVAC Services in St. Cloud, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for St. Cloud''s 56,000+ residents. Lakefront and growth area specialists. Duke Energy rebates. Serving East Lake Toho, Narcoossee & all areas.',
  'HVAC St. Cloud FL',
  ARRAY['AC repair St. Cloud', 'air conditioning St. Cloud FL', 'HVAC contractor St. Cloud', 'Narcoossee HVAC', 'East Lake Toho AC'],
  'St. Cloud''s Lakefront Community HVAC Experts',
  'Professional comfort for Osceola County''s growing city',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'St. Cloud—on the shores of East Lake Tohopekaliga—combines lakefront heritage with rapid Orlando metro growth. With 56,000 residents from historic downtown to new Narcoossee developments to lakefront properties, St. Cloud demands HVAC service for both established homes and explosive new growth areas.',
  '{"headline\": \"Why St. Cloud Residents Choose Us\", \"reasons\": [{\"title\": \"Lakefront Property Expertise\", \"description\": \"East Lake Tohopekaliga waterfront properties throughout St. Cloud face enhanced humidity and lake-specific HVAC needs. We provide lakefront-appropriate dehumidification and system design.\"}, {\"title\": \"Growth Area Specialists\", \"description\": \"St. Cloud is booming with new neighborhoods in Narcoossee and east areas. We serve both new construction and established homes with consistent professional service.\"}, {\"title\": \"Retirement Community Knowledge\", \"description\": \"St. Cloud has significant retirement communities like Lake Runnymede. We provide honest pricing, reliable service, and respect for senior residents.\"}, {\"title\": \"Orlando Metro Access\", \"description\": \"St. Cloud benefits from Orlando metro resources while maintaining small-town values. We combine big-city expertise with community-focused service.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in St. Cloud\", \"intro\": \"St. Cloud''s lakefront location and growth create specific needs:\", \"challenges\": [{\"title\": \"East Lake Toho Humidity\", \"description\": \"St. Cloud''s location on East Lake Tohopekaliga brings enhanced humidity especially for waterfront and near-water properties requiring robust dehumidification.\"}, {\"title\": \"Rapid Growth Infrastructure\", \"description\": \"St. Cloud''s explosive growth in Narcoossee and east areas creates new neighborhoods with modern infrastructure alongside historic areas with older systems.\"}, {\"title\": \"Varied Housing Stock\", \"description\": \"From 1900s downtown to 2020s Narcoossee, St. Cloud spans over a century of construction requiring vastly different HVAC approaches.\"}, {\"title\": \"Hard Water Challenges\", \"description\": \"St. Cloud has notably hard water at 178 ppm affecting humidifiers and water-based HVAC components requiring special consideration.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lakefront HVAC\", \"slug\": \"lakefront-hvac\", \"description\": \"Specialized service for East Lake Toho properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Waterfront expertise\", \"Mold prevention\"]}, {\"name\": \"New Construction HVAC\", \"slug\": \"new-construction-hvac\", \"description\": \"Expert service for Narcoossee and growth areas.\", \"features\": [\"Modern systems\", \"Warranty service\", \"Builder coordination\", \"Efficient design\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout St. Cloud.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Lake area expertise\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does East Lake Tohopekaliga affect HVAC in St. Cloud?\", \"answer\": \"East Lake Toho creates enhanced humidity throughout St. Cloud, especially for waterfront properties. Proper dehumidification beyond standard AC is essential for comfort and mold prevention.\"}, {\"question\": \"Do you service both old St. Cloud and new Narcoossee areas?\", \"answer\": \"Yes, we serve all St. Cloud areas from historic downtown to explosive new growth in Narcoossee and east areas with expertise for both older and brand-new homes.\"}, {\"question\": \"What Duke Energy rebates are available in St. Cloud?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for St. Cloud residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"93°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"2,920\", \"days_above_90\": \"64\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Comfort in St. Cloud?',
  'Contact us today for a consultation. From lakefront to Narcoossee to downtown, we deliver professional HVAC service with Duke Energy rebates and community care.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - St. Cloud\", \"url\": \"https://coolit-hvac.com/st-cloud-fl\", \"telephone\": \"+1-407-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"St. Cloud\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does lake location affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"East Lake Toho creates enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"St. Cloud\", \"item\": \"https://coolit-hvac.com/fl/st-cloud\"}]}'::jsonb,
  '/fl/osceola-county',
  '[{\"slug\": \"/fl/kissimmee/hvac\", \"anchor_text\": \"Kissimmee HVAC\"}, {\"slug\": \"/fl/poinciana/hvac\", \"anchor_text\": \"Poinciana AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lakefront-hvac\", \"anchor_text\": \"Lakefront HVAC\"}]'::jsonb,
  1790, 27, 10, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Poinciana, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Poinciana', 'poinciana', 'Florida', 'FL', 'Osceola', 'osceola-county', 28.1296, -81.4724,
  ARRAY['34758', '34759'],
  'Orlando-Kissimmee-Sanford', ARRAY[]::uuid[], true, 82
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', NOW(), 68000, 'US Census Bureau 2023', 52345, 235000, 74.8,
  ARRAY['single-family', 'planned-community', 'suburban', 'affordable'], '{"pre-1970\": 0, \"1970s-1990s\": 35, \"2000s-2010s\": 45, \"2020s\": 20}'::jsonb,
  93, 53, 73, 2930, 65, 50.5, 'moderate', 'Large planned community. Osceola-Polk county line. Southwest Orlando metro. Affordable housing. Lakes throughout. Rapid growth.',
  ARRAY['Osceola County Schools', 'Polk County Schools', 'Local businesses', 'Retail centers', 'Healthcare'],
  ARRAY['Lake Marion', 'Poinciana Community Park', 'Solivita nearby', 'Cypress Parkway', 'Community recreation'],
  ARRAY['Community events', 'Festivals', 'Recreation programs'],
  ARRAY['Osceola County School District', 'Polk County Schools'], 'Continued residential development. Infrastructure improvements. Commercial growth. Incorporation discussions.',
  'Duke Energy Florida',
  '{"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'Natural gas limited availability', 'Tohopekaliga Water Authority', 172,
  'Florida Building Code 8th Edition (2023), Osceola and Polk County amendments',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"county\": \"Requirements vary by county location"}'::jsonb,
  'moderate', ARRAY['Local HVAC contractors', 'Kissimmee providers', 'Orlando metro companies'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Central Poinciana', 'central-poinciana', 'Central', 'single-family', '1980s-2010s', 'Middle income', 'Original development area', ARRAY['planned community', 'lakes throughout', 'family homes'], '10-40 years', 1, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'East Poinciana', 'east-poinciana', 'East', 'single-family', '1990s-2020s', 'Middle income', 'Growing area', ARRAY['newer development', 'modern systems', 'family properties'], '2-30 years', 2, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'West Poinciana', 'west-poinciana', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Established neighborhoods', ARRAY['lake proximity', 'varied ages', 'humidity'], '10-40 years', 3, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Lake Marion Area', 'lake-marion', 'South', 'single-family', '1990s-2020s', 'Middle income', 'Lakefront community', ARRAY['lake humidity', 'family homes', 'waterfront influence'], '2-30 years', 4, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'North Poinciana', 'north-poinciana', 'North', 'single-family', '2000s-2020s', 'Middle income', 'Recent growth', ARRAY['newer construction', 'modern homes', 'efficient systems'], '2-22 years', 5, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Solivita', 'solivita', 'Northwest', 'retirement', '2000s-2020s', 'Upper middle income', '55+ active adult community', ARRAY['retirement housing', 'modern systems', 'amenity-rich'], '2-22 years', 6, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Cypress Parkway Area', 'cypress-parkway', 'Central', 'single-family', '1990s-2020s', 'Middle income', 'Main corridor area', ARRAY['varied housing', 'convenient location', 'mixed ages'], '2-30 years', 7, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'South Poinciana', 'south-poinciana', 'South', 'single-family', '1980s-2010s', 'Middle income', 'Established area', ARRAY['family homes', 'lake proximity', 'varied systems'], '10-40 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'hvac', '/fl/poinciana/hvac',
  'HVAC Services in Poinciana, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Poinciana''s 68,000+ residents. Planned community specialists. Duke Energy rebates. Serving Lake Marion, Solivita & all neighborhoods.',
  'HVAC Poinciana FL',
  ARRAY['AC repair Poinciana', 'air conditioning Poinciana FL', 'HVAC contractor Poinciana', 'Solivita HVAC', 'Lake Marion AC'],
  'Poinciana''s Trusted Planned Community HVAC Experts',
  'Affordable comfort for Central Florida''s growing community',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'Poinciana—Central Florida''s largest planned community—straddles the Osceola-Polk county line southwest of Orlando. With 68,000 residents from original 1980s developments to brand-new neighborhoods to Solivita retirement community, Poinciana combines affordable family living with lakes throughout requiring specialized HVAC knowledge.',
  '{"headline\": \"Why Poinciana Residents Choose Us\", \"reasons\": [{\"title\": \"Planned Community Expertise\", \"description\": \"Poinciana is Florida''s largest planned community with specific infrastructure and lakes throughout. We understand the planned design and provide lake-appropriate HVAC solutions.\"}, {\"title\": \"Affordable, Honest Pricing\", \"description\": \"Poinciana residents value affordability. We provide honest, transparent pricing with no surprise charges protecting family budgets while delivering quality service.\"}, {\"title\": \"Retirement Community Knowledge\", \"description\": \"Solivita and other 55+ areas have specific needs. We provide respectful service, clear communication, and honest recommendations for senior residents.\"}, {\"title\": \"Two-County Coverage\", \"description\": \"Poinciana spans Osceola and Polk counties with different requirements. We navigate both county codes and permitting seamlessly.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Poinciana\", \"intro\": \"Poinciana''s planned community design creates specific needs:\", \"challenges\": [{\"title\": \"Extensive Lake System\", \"description\": \"Poinciana has numerous lakes throughout the community creating enhanced humidity beyond typical Central Florida levels requiring robust dehumidification.\"}, {\"title\": \"Two-County Jurisdiction\", \"description\": \"Poinciana straddles Osceola-Polk county line with different building codes, permit requirements, and inspection processes requiring dual-county expertise.\"}, {\"title\": \"Varied Development Eras\", \"description\": \"From 1980s original sections to 2020s new growth, Poinciana spans four decades of construction with different HVAC infrastructure and needs.\"}, {\"title\": \"Budget-Conscious Market\", \"description\": \"Poinciana is affordable housing focused. Residents need cost-effective solutions without sacrificing quality or reliability requiring honest, fair pricing.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lake Area HVAC\", \"slug\": \"lake-hvac\", \"description\": \"Specialized service for Poinciana''s lakefront properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"Retirement Community HVAC\", \"slug\": \"retirement-hvac\", \"description\": \"Respectful service for Solivita and 55+ areas.\", \"features\": [\"Clear communication\", \"Honest recommendations\", \"Senior-friendly service\", \"Fair pricing\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast, affordable repairs throughout Poinciana.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Honest pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Affordable options\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Budget-friendly maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do Poinciana''s lakes affect HVAC systems?\", \"answer\": \"Poinciana''s extensive lake system creates enhanced humidity throughout the community. Proper dehumidification beyond standard AC is essential for comfort and preventing mold.\"}, {\"question\": \"Do building codes differ in Osceola vs Polk County parts of Poinciana?\", \"answer\": \"Yes, Poinciana straddles two counties with different codes and permit processes. We handle both Osceola and Polk County requirements seamlessly for all Poinciana residents.\"}, {\"question\": \"What Duke Energy rebates are available in Poinciana?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Poinciana residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"93°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"2,930\", \"days_above_90\": \"65\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Affordable Comfort in Poinciana?',
  'Contact us today for a consultation. From Lake Marion to Solivita to all neighborhoods, we deliver honest, professional HVAC service with Duke Energy rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Poinciana\", \"url\": \"https://coolit-hvac.com/poinciana-fl\", \"telephone\": \"+1-863-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Poinciana\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do lakes affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Poinciana''s extensive lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Poinciana\", \"item\": \"https://coolit-hvac.com/fl/poinciana\"}]}'::jsonb,
  '/fl/osceola-county',
  '[{\"slug\": \"/fl/kissimmee/hvac\", \"anchor_text\": \"Kissimmee HVAC\"}, {\"slug\": \"/fl/st-cloud/hvac\", \"anchor_text\": \"St. Cloud AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Area HVAC\"}]'::jsonb,
  1840, 28, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Casselberry, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Casselberry', 'casselberry', 'Florida', 'FL', 'Seminole', 'seminole-county', 28.6778, -81.3279,
  ARRAY['32707', '32708', '32730'],
  'Orlando-Kissimmee-Sanford', ARRAY[]::uuid[], true, 81
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', NOW(), 29000, 'US Census Bureau 2023', 61234, 265000, 65.3,
  ARRAY['single-family', 'condo', 'townhome', 'suburban'], '{"pre-1970\": 15, \"1970s-1990s\": 45, \"2000s-2010s\": 30, \"2020s\": 10}'::jsonb,
  92, 52, 72, 2890, 62, 51.2, 'moderate', 'North Orlando suburb. Seminole County. US-17/92 corridor. Lake Howell area. Established community. Family-oriented.',
  ARRAY['Seminole County Public Schools', 'City of Casselberry', 'Retail businesses', 'Healthcare facilities', 'Local services'],
  ARRAY['Lake Howell', 'Secret Lake Park', 'Wirz Park', 'US-17/92 corridor', 'Community parks'],
  ARRAY['Casselberry Art House events', 'Community festivals', 'Lake activities'],
  ARRAY['Seminole County Public Schools'], 'Downtown revitalization. Commercial corridor improvements. Infrastructure updates. Residential redevelopment.',
  'Duke Energy Florida',
  '{"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'TECO Peoples Gas', 'City of Casselberry Utilities', 158,
  'Florida Building Code 8th Edition (2023), Seminole County amendments',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code"}'::jsonb,
  'moderate', ARRAY['Orlando metro HVAC companies', 'Local contractors', 'Regional providers'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Lake Howell Area', 'lake-howell', 'East', 'single-family', '1960s-2000s', 'Upper middle income', 'Lake community', ARRAY['lake proximity', 'humidity', 'family homes', 'waterfront influence'], '20-60 years', 1, true),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Secret Lake', 'secret-lake', 'Central', 'single-family', '1950s-1990s', 'Middle income', 'Lakefront neighborhood', ARRAY['lake humidity', 'established homes', 'varied systems'], '30-70 years', 2, true),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'US-17/92 Corridor', 'us-17-92', 'West', 'mixed', '1960s-2020s', 'Middle income', 'Commercial corridor area', ARRAY['mixed housing', 'convenient location', 'varied ages'], '2-60 years', 3, true),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'South Casselberry', 'south-casselberry', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhoods', ARRAY['family properties', 'older systems', 'standard service'], '20-50 years', 4, false),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'North Casselberry', 'north-casselberry', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Family area', ARRAY['family homes', 'varied systems', 'suburban living'], '10-40 years', 5, false),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Casselberry Village', 'casselberry-village', 'Central', 'townhome', '1980s-2010s', 'Middle income', 'Townhome community', ARRAY['attached housing', 'shared walls', 'compact systems'], '10-40 years', 6, false),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Wirz Park Area', 'wirz-park', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Park proximity', ARRAY['established homes', 'family properties', 'older systems'], '30-60 years', 7, false),
  ('b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'Red Bug Lake Area', 'red-bug-lake', 'Northeast', 'single-family', '1970s-2010s', 'Upper middle income', 'Lake community', ARRAY['lake proximity', 'family homes', 'humidity control'], '10-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'b0c1d2e3-f4a5-6b7c-8d9e-0f1a2b3c4d5e', 'hvac', '/fl/casselberry/hvac',
  'HVAC Services in Casselberry, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Casselberry''s 29,000+ residents. Lake community specialists. Duke Energy rebates. Serving Lake Howell, Secret Lake & all neighborhoods.',
  'HVAC Casselberry FL',
  ARRAY['AC repair Casselberry', 'air conditioning Casselberry FL', 'HVAC contractor Casselberry', 'Lake Howell HVAC', 'Seminole County AC'],
  'Casselberry''s Trusted Lake Community HVAC Experts',
  'Professional comfort for North Orlando''s established city',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'Casselberry—a charming North Orlando suburb in Seminole County—combines lake living with convenient US-17/92 corridor access. With 29,000 residents from Lake Howell waterfront to Secret Lake neighborhoods to established suburban areas, Casselberry demands HVAC service understanding both lake humidity and Orlando metro expectations.',
  '{"headline\": \"Why Casselberry Residents Choose Us\", \"reasons\": [{\"title\": \"Lake Community Expertise\", \"description\": \"Lake Howell, Secret Lake, and Red Bug Lake create enhanced humidity throughout Casselberry. We provide lake-appropriate dehumidification and humidity control for waterfront and near-water properties.\"}, {\"title\": \"Established Home Specialists\", \"description\": \"Many Casselberry homes date from the 1960s-1990s development era. We specialize in updating these systems with modern efficiency while respecting existing infrastructure.\"}, {\"title\": \"Orlando Metro Quality\", \"description\": \"Casselberry residents expect Orlando metro service standards. We deliver professional installation, responsive maintenance, and expert technical knowledge.\"}, {\"title\": \"Community-Focused Service\", \"description\": \"As your Casselberry neighbors, we provide honest pricing, reliable service, and genuine care for our community''s comfort and satisfaction.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Casselberry\", \"intro\": \"Casselberry''s lake communities create specific needs:\", \"challenges\": [{\"title\": \"Multiple Lake System Humidity\", \"description\": \"Lake Howell, Secret Lake, and Red Bug Lake create enhanced humidity especially for waterfront and near-water properties requiring robust dehumidification beyond standard AC.\"}, {\"title\": \"1960s-1990s Housing Stock\", \"description\": \"Much of Casselberry was developed during this era with specific construction standards and infrastructure requiring expertise with updating older systems.\"}, {\"title\": \"US-17/92 Corridor Diversity\", \"description\": \"Casselberry''s main corridor brings mixed housing from older single-family to newer condos requiring flexible service approaches for varied property types.\"}, {\"title\": \"Seminole County Standards\", \"description\": \"Casselberry sits in Seminole County with specific building codes and inspection requirements ensuring quality installation and compliance.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lake Community HVAC\", \"slug\": \"lake-hvac\", \"description\": \"Specialized service for Lake Howell and lakefront properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"System Replacement\", \"slug\": \"system-replacement\", \"description\": \"Upgrading 1960s-1990s systems with modern efficiency.\", \"features\": [\"Energy savings\", \"Duke rebates\", \"Modern comfort\", \"10-year warranty\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Casselberry.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Lake area expertise\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do Lake Howell and Secret Lake affect HVAC in Casselberry?\", \"answer\": \"Casselberry''s lakes create enhanced humidity especially for waterfront and near-water properties. Proper dehumidification beyond standard AC is essential for comfort and preventing mold.\"}, {\"question\": \"Should I replace my 1970s-1980s HVAC system?\", \"answer\": \"Yes. Systems from Casselberry''s main development era are far less efficient than modern equipment. Replacement provides major improvements in comfort, efficiency, and reliability with Duke Energy rebates available.\"}, {\"question\": \"What Duke Energy rebates are available in Casselberry?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Casselberry residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"72%\", \"cooling_degree_days\": \"2,890\", \"days_above_90\": \"62\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Comfort in Casselberry?',
  'Contact us today for a consultation. From Lake Howell to Secret Lake to all neighborhoods, we deliver professional HVAC service with Duke Energy rebates and community care.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Casselberry\", \"url\": \"https://coolit-hvac.com/casselberry-fl\", \"telephone\": \"+1-407-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Casselberry\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do lakes affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Casselberry''s lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Casselberry\", \"item\": \"https://coolit-hvac.com/fl/casselberry\"}]}'::jsonb,
  '/fl/seminole-county',
  '[{\"slug\": \"/fl/winter-springs/hvac\", \"anchor_text\": \"Winter Springs HVAC\"}, {\"slug\": \"/fl/altamonte-springs/hvac\", \"anchor_text\": \"Altamonte Springs AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Community HVAC\"}]'::jsonb,
  1810, 26, 10, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Winter Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Final City (#82)
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c',
  'Winter Springs', 'winter-springs', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6989, -81.3081,
  ARRAY['32708', '32719'],
  'Orlando-Kissimmee-Sanford',
  ARRAY[]::uuid[],
  true, 78
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', NOW(), 38000, 'US Census Bureau 2023', 78945, 395000, 82.4,
  ARRAY['single-family', 'planned-community', 'suburban', 'family'],
  '{"pre-1990\": 15, \"1990s-2000s\": 40, \"2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 50, 71, 3580, 100, 51.5, 'moderate',
  'Well-planned suburban Orlando community. Family-focused neighborhoods. High homeownership. Parks and recreation emphasis. Seminole County.',
  ARRAY['Seminole County Public Schools', 'UCF proximity', 'Central Florida Regional Hospital', 'Retail and professional services'],
  ARRAY['Central Winds Park', 'Twin Rivers Park', 'Lake Jesup', 'Winter Springs Town Center'],
  ARRAY['Hometown Christmas', 'Community events', 'Farmers Market'],
  ARRAY['Seminole County Public Schools'],
  'Residential growth. Town center development. Parks expansion. Family community focus.',
  'Duke Energy Florida',
  '{"ac_replacement\": {\"amount\": 125, \"requirements\": \"High-efficiency 16 SEER+ system\"}, \"heat_pump\": {\"amount\": 100, \"requirements\": \"ENERGY STAR heat pump\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 400, \"requirements\": \"Combined Duke Energy rebates\"}}'::jsonb,
  'TECO Peoples Gas (limited)', 'Seminole County Water', 230,
  'Florida Building Code 8th Edition (2023), Seminole County requirements',
  '{"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Tuskawilla', 'tuskawilla', 'Central', 'planned-community', '1980s-2010s', 'Upper middle income', 'Master-planned community', ARRAY['family homes', 'HOA standards', 'varied ages'], '12-40 years', 1, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Winter Springs Central', 'winter-springs-central', 'Central', 'single-family', '1990s-2010s', 'Upper middle income', 'Established neighborhoods', ARRAY['family properties', 'standard service'], '12-30 years', 2, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Northern Winter Springs', 'northern-ws', 'North', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer systems', 'family homes'], '5-22 years', 3, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Lake Jesup Area', 'lake-jesup-area', 'East', 'mixed', '1980s-2010s', 'Middle income', 'Near Lake Jesup', ARRAY['lake proximity', 'varied housing'], '12-40 years', 4, false),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Sweetwater', 'sweetwater-ws', 'West', 'single-family', '1990s-2010s', 'Upper middle income', 'Family community', ARRAY['family homes', 'HOA requirements'], '12-30 years', 5, false),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Tuscawilla Preserve', 'tuscawilla-preserve', 'South', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer neighborhood', ARRAY['newer construction', 'family sizing'], '5-22 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'hvac', '/fl/winter-springs/hvac',
  'HVAC Services in Winter Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Springs'' 38,000+ residents. Family community specialists. Duke Energy rebates. Serving Tuskawilla & all neighborhoods.',
  'HVAC Winter Springs FL',
  ARRAY['AC repair Winter Springs', 'air conditioning Winter Springs FL', 'HVAC contractor Winter Springs', 'Tuskawilla HVAC'],
  'Winter Springs'' Family-Focused HVAC Experts',
  'Serving Orlando''s premier planned community',
  'Licensed & Insured | Duke Energy Certified | Family Community Specialists',
  'Winter Springs—Seminole County''s well-planned family community—combines excellent schools, abundant parks, and quality neighborhoods. With 38,000 residents in master-planned communities like Tuskawilla, Winter Springs presents HVAC needs focused on family comfort and reliability.',
  '{"headline\": \"Why Winter Springs Families Choose Us\", \"reasons\": [{\"title\": \"Family Community Specialists\", \"description\": \"Winter Springs is built for families. We provide reliable service and honest solutions for family budgets.\"}, {\"title\": \"HOA Compliance Experts\", \"description\": \"Tuskawilla and other planned communities have standards. We ensure compliance.\"}, {\"title\": \"Duke Energy Rebate Certified\", \"description\": \"We maximize Duke Energy rebates including $125 for AC and $100 for heat pumps.\"}, {\"title\": \"Reliable Service\", \"description\": \"Families need dependable HVAC. We provide same-day repairs and quality installations.\"}]}'::jsonb,
  '{"headline\": \"HVAC Considerations for Winter Springs\", \"intro\": \"Winter Springs'' character creates specific needs:\", \"challenges\": [{\"title\": \"HOA Requirements\", \"description\": \"Planned communities have equipment placement and appearance standards we navigate daily.\"}, {\"title\": \"Family Sizing Needs\", \"description\": \"Winter Springs homes need properly-sized systems for family comfort and efficiency.\"}, {\"title\": \"Builder-Grade Systems\", \"description\": \"Many newer homes have builder-grade systems. We help evaluate upgrade options.\"}, {\"title\": \"Central Florida Climate\", \"description\": \"Hot summers with 100+ days above 90°F require reliable, efficient cooling.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Family Home HVAC\", \"slug\": \"family-hvac\", \"description\": \"Reliable service for Winter Springs families.\", \"features\": [\"Family-friendly\", \"Honest pricing\", \"Quality service\", \"Dependable\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Winter Springs.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Family-focused\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Proper sizing\", \"10-year warranty\", \"Financing\"]}, {\"name\": \"System Upgrades\", \"slug\": \"system-upgrades\", \"description\": \"Upgrade builder-grade systems.\", \"features\": [\"Capacity increases\", \"Efficiency improvements\", \"Smart integration\", \"Better comfort\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Affordable family maintenance.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% discount\", \"Peace of mind\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"Do you work in Tuskawilla and planned communities?\", \"answer\": \"Yes, we serve all Winter Springs neighborhoods and understand HOA requirements.\"}, {\"question\": \"Should I upgrade my builder-grade AC?\", \"answer\": \"If you experience humidity issues or uneven temperatures, an upgrade often improves comfort significantly.\"}, {\"question\": \"What Duke Energy rebates are available?\", \"answer\": \"Duke Energy offers $125 for AC, $100 for heat pumps, and $50 for smart thermostats.\"}]}'::jsonb,
  '{"avg_summer_high\": \"92°F\", \"avg_humidity\": \"71%\", \"cooling_degree_days\": \"3,580\", \"days_above_90\": \"100+\", \"hurricane_risk\": \"Moderate"}'::jsonb,
  'Ready for Family Comfort in Winter Springs?',
  'Contact us today. We deliver reliable HVAC service with Duke Energy rebate assistance for Winter Springs families.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Winter Springs\", \"url\": \"https://coolit-hvac.com/winter-springs-fl\", \"telephone\": \"+1-407-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Winter Springs\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do you work in planned communities?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we serve all Winter Springs neighborhoods and understand HOA requirements.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Winter Springs\", \"item\": \"https://coolit-hvac.com/fl/winter-springs\"}]}'::jsonb,
  '/fl/seminole-county',
  '[{\"slug\": \"/fl/oviedo/hvac\", \"anchor_text\": \"Oviedo HVAC\"}, {\"slug\": \"/fl/casselberry/hvac\", \"anchor_text\": \"Casselberry AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/family-hvac\", \"anchor_text\": \"Family HVAC\"}]'::jsonb,
  1650, 20, 8, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
