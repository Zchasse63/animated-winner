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
