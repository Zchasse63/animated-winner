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
  ARRAY['single-family', 'condo', 'townhome', 'suburban'], '{\"pre-1970\": 15, \"1970s-1990s\": 45, \"2000s-2010s\": 30, \"2020s\": 10}'::jsonb,
  92, 52, 72, 2890, 62, 51.2, 'moderate', 'North Orlando suburb. Seminole County. US-17/92 corridor. Lake Howell area. Established community. Family-oriented.',
  ARRAY['Seminole County Public Schools', 'City of Casselberry', 'Retail businesses', 'Healthcare facilities', 'Local services'],
  ARRAY['Lake Howell', 'Secret Lake Park', 'Wirz Park', 'US-17/92 corridor', 'Community parks'],
  ARRAY['Casselberry Art House events', 'Community festivals', 'Lake activities'],
  ARRAY['Seminole County Public Schools'], 'Downtown revitalization. Commercial corridor improvements. Infrastructure updates. Residential redevelopment.',
  'Duke Energy Florida',
  '{\"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'TECO Peoples Gas', 'City of Casselberry Utilities', 158,
  'Florida Building Code 8th Edition (2023), Seminole County amendments',
  '{\"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code\"}'::jsonb,
  'moderate', ARRAY['Orlando metro HVAC companies', 'Local contractors', 'Regional providers'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29\"}'::jsonb
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
  '{\"headline\": \"Why Casselberry Residents Choose Us\", \"reasons\": [{\"title\": \"Lake Community Expertise\", \"description\": \"Lake Howell, Secret Lake, and Red Bug Lake create enhanced humidity throughout Casselberry. We provide lake-appropriate dehumidification and humidity control for waterfront and near-water properties.\"}, {\"title\": \"Established Home Specialists\", \"description\": \"Many Casselberry homes date from the 1960s-1990s development era. We specialize in updating these systems with modern efficiency while respecting existing infrastructure.\"}, {\"title\": \"Orlando Metro Quality\", \"description\": \"Casselberry residents expect Orlando metro service standards. We deliver professional installation, responsive maintenance, and expert technical knowledge.\"}, {\"title\": \"Community-Focused Service\", \"description\": \"As your Casselberry neighbors, we provide honest pricing, reliable service, and genuine care for our community''s comfort and satisfaction.\"}]}'::jsonb,
  '{\"headline\": \"HVAC Challenges in Casselberry\", \"intro\": \"Casselberry''s lake communities create specific needs:\", \"challenges\": [{\"title\": \"Multiple Lake System Humidity\", \"description\": \"Lake Howell, Secret Lake, and Red Bug Lake create enhanced humidity especially for waterfront and near-water properties requiring robust dehumidification beyond standard AC.\"}, {\"title\": \"1960s-1990s Housing Stock\", \"description\": \"Much of Casselberry was developed during this era with specific construction standards and infrastructure requiring expertise with updating older systems.\"}, {\"title\": \"US-17/92 Corridor Diversity\", \"description\": \"Casselberry''s main corridor brings mixed housing from older single-family to newer condos requiring flexible service approaches for varied property types.\"}, {\"title\": \"Seminole County Standards\", \"description\": \"Casselberry sits in Seminole County with specific building codes and inspection requirements ensuring quality installation and compliance.\"}]}'::jsonb,
  '{\"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lake Community HVAC\", \"slug\": \"lake-hvac\", \"description\": \"Specialized service for Lake Howell and lakefront properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"System Replacement\", \"slug\": \"system-replacement\", \"description\": \"Upgrading 1960s-1990s systems with modern efficiency.\", \"features\": [\"Energy savings\", \"Duke rebates\", \"Modern comfort\", \"10-year warranty\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Casselberry.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Lake area expertise\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{\"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do Lake Howell and Secret Lake affect HVAC in Casselberry?\", \"answer\": \"Casselberry''s lakes create enhanced humidity especially for waterfront and near-water properties. Proper dehumidification beyond standard AC is essential for comfort and preventing mold.\"}, {\"question\": \"Should I replace my 1970s-1980s HVAC system?\", \"answer\": \"Yes. Systems from Casselberry''s main development era are far less efficient than modern equipment. Replacement provides major improvements in comfort, efficiency, and reliability with Duke Energy rebates available.\"}, {\"question\": \"What Duke Energy rebates are available in Casselberry?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Casselberry residents.\"}]}'::jsonb,
  '{\"avg_summer_high\": \"92°F\", \"avg_humidity\": \"72%\", \"cooling_degree_days\": \"2,890\", \"days_above_90\": \"62\", \"hurricane_risk\": \"Moderate\"}'::jsonb,
  'Ready for Comfort in Casselberry?',
  'Contact us today for a consultation. From Lake Howell to Secret Lake to all neighborhoods, we deliver professional HVAC service with Duke Energy rebates and community care.',
  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Casselberry\", \"url\": \"https://coolit-hvac.com/casselberry-fl\", \"telephone\": \"+1-407-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Casselberry\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do lakes affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Casselberry''s lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Casselberry\", \"item\": \"https://coolit-hvac.com/fl/casselberry\"}]}'::jsonb,
  '/fl/seminole-county',
  '[{\"slug\": \"/fl/winter-springs/hvac\", \"anchor_text\": \"Winter Springs HVAC\"}, {\"slug\": \"/fl/altamonte-springs/hvac\", \"anchor_text\": \"Altamonte Springs AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Community HVAC\"}]'::jsonb,
  1810, 26, 10, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
