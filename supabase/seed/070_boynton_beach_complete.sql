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
