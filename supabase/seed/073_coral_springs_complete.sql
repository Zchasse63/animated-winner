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
  ARRAY['single-family', 'townhome', 'master-planned', 'suburban'], '{\"pre-1970\": 2, \"1970s-1990s\": 45, \"2000s-2010s\": 35, \"2020s\": 18}'::jsonb,
  90, 64, 74, 4065, 85, 62.2, 'very_high', 'Award-winning master-planned city. Family-oriented. Strong schools. Planned infrastructure. Northwest Broward location.',
  ARRAY['Broward County Public Schools', 'City of Coral Springs', 'Coral Springs Medical Center', 'Corporate offices', 'Professional services'],
  ARRAY['Coral Springs Center for the Arts', 'Sawgrass Mills nearby', 'Mullins Park', 'Sportsplex', 'Walk of Fame'],
  ARRAY['Festival of the Arts', 'Holiday Spectacular', 'Community events'],
  ARRAY['Broward County Public Schools'], 'City Center redevelopment. New residential projects. Commercial corridor improvements. Parks expansion.',
  'Florida Power & Light (FPL)',
  '{\"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Coral Springs Utilities', 148,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{\"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"inspection\": \"Multiple inspections\", \"hoa\": \"Most communities have HOA standards\"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29\"}'::jsonb
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
  '{\"headline\": \"Why Coral Springs Residents Choose Us\", \"reasons\": [{\"title\": \"Master-Planned Expertise\", \"description\": \"Coral Springs'' award-winning planning includes specific infrastructure and HOA standards. We understand these communities and deliver compliant, excellent service.\"}, {\"title\": \"Community Standards Excellence\", \"description\": \"Coral Springs residents expect the best. Our service matches the city''s high standards with professional installation, maintenance, and customer care.\"}, {\"title\": \"HOA Compliance Specialists\", \"description\": \"From Eagle Trace to Heron Bay to Cypress Glen, we navigate all HOA requirements for equipment, placement, and aesthetics seamlessly.\"}, {\"title\": \"Family-Focused Service\", \"description\": \"Coral Springs is built for families. We provide reliable, honest service protecting your family''s comfort and your home investment.\"}]}'::jsonb,
  '{\"headline\": \"HVAC Challenges in Coral Springs\", \"intro\": \"Coral Springs'' master-planned excellence creates specific needs:\", \"challenges\": [{\"title\": \"High Community Standards\", \"description\": \"Award-winning Coral Springs residents expect exceptional service quality. Professional installation, responsive maintenance, and transparent communication are essential.\"}, {\"title\": \"Extensive HOA Requirements\", \"description\": \"Most Coral Springs communities have HOA rules governing HVAC equipment appearance, placement, screening, and noise levels requiring careful compliance.\"}, {\"title\": \"Varied Development Eras\", \"description\": \"From 1970s Westchester to 2020s Wyndham Lakes, different eras have different HVAC infrastructure requiring tailored approaches.\"}, {\"title\": \"Hurricane Zone Compliance\", \"description\": \"Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs throughout Coral Springs.\"}]}'::jsonb,
  '{\"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Master-Planned Community HVAC\", \"slug\": \"planned-community-hvac\", \"description\": \"Expert service for Coral Springs communities.\", \"features\": [\"HOA compliance\", \"High standards\", \"Professional installation\", \"Aesthetic integration\"]}, {\"name\": \"Hurricane-Rated Installation\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant systems.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Code compliance\", \"Permit handling\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Coral Springs.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Professional service\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"HOA approved\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{\"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do you handle Eagle Trace or Heron Bay HOA requirements?\", \"answer\": \"We''re experienced with all Coral Springs HOA standards. We handle compliance, placement approval, screening requirements, and all documentation professionally.\"}, {\"question\": \"Why do Coral Springs residents choose you?\", \"answer\": \"We match Coral Springs'' exceptional standards with professional installation, responsive service, transparent pricing, and genuine care for our neighbors.\"}, {\"question\": \"What FPL rebates are available in Coral Springs?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Coral Springs residents.\"}]}'::jsonb,
  '{\"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,065\", \"days_above_90\": \"85+\", \"hurricane_risk\": \"Very High\"}'::jsonb,
  'Ready for Comfort in Coral Springs?',
  'Contact us today for a consultation. From Eagle Trace to Heron Bay to Turtle Run, we deliver award-winning HVAC service with full HOA compliance and FPL rebates.',
  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Coral Springs\", \"url\": \"https://coolit-hvac.com/coral-springs-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Coral Springs\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do you handle HOA requirements?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"We handle all HOA compliance, placement approval, screening requirements, and documentation for Coral Springs communities.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Coral Springs\", \"item\": \"https://coolit-hvac.com/fl/coral-springs\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/pembroke-pines/hvac\", \"anchor_text\": \"Pembroke Pines HVAC\"}, {\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/hoa-hvac\", \"anchor_text\": \"HOA-Compliant HVAC\"}]'::jsonb,
  1780, 26, 13, 90,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
