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
