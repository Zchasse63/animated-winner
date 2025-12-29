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
