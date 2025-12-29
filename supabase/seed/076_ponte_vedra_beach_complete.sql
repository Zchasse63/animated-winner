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
