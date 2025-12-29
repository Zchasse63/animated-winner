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
  '{\"pre-1960\": 15, \"1960s-1990s\": 30, \"2000s-2010s\": 35, \"2020s\": 20}'::jsonb,
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
  '{\"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance required\", \"coastal_protection\": \"Maximum wind rating and salt air protection\", \"inspection\": \"Multiple inspections required\", \"energy_code\": \"Strict energy efficiency requirements\"}'::jsonb,
  'very_high',
  ARRAY['Air On Demand', 'All Year Cooling', 'RJ Kuhn', 'Air-Ref Co Inc', 'Air America Cooling & Heating'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29\"}'::jsonb
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

  '{\"avg_summer_high\": \"90°F\", \"avg_humidity\": \"76%\", \"cooling_degree_days\": \"4,200\", \"days_above_90\": \"88+\", \"hurricane_risk\": \"Very High\"}'::jsonb,

  'Ready for Tropical Comfort in Miami?',
  'Contact us today for a consultation. From Brickell high-rises to Coconut Grove estates, we''ll deliver expert HVAC service engineered for Miami''s demanding climate.',

  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Miami\", \"description\": \"Professional HVAC services for Miami, FL specializing in tropical climate and high-rise systems.\", \"url\": \"https://coolit-hvac.com/miami-fl\", \"telephone\": \"+1-305-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Miami\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Why do Miami AC systems need more maintenance?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Miami''s year-round tropical heat, high humidity, and coastal salt air create the most demanding HVAC environment in Florida.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Miami\", \"item\": \"https://coolit-hvac.com/fl/miami\"}]}'::jsonb,

  '/fl/miami-dade-county',
  '[{\"slug\": \"/fl/miami-beach/hvac\", \"anchor_text\": \"Miami Beach HVAC\"}, {\"slug\": \"/fl/coral-gables/hvac\", \"anchor_text\": \"Coral Gables AC\"}, {\"slug\": \"/fl/hialeah/hvac\", \"anchor_text\": \"Hialeah HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/high-rise-hvac\", \"anchor_text\": \"High-Rise HVAC\"}, {\"slug\": \"/services/hurricane-hvac\", \"anchor_text\": \"Hurricane-Rated Systems\"}]'::jsonb,

  2140, 35, 20, 93,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
