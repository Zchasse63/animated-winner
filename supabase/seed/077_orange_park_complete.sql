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
  ARRAY['single-family', 'townhome', 'suburban', 'family-oriented'], '{\"pre-1970\": 15, \"1970s-1990s\": 40, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 46, 68, 2680, 46, 52.2, 'moderate', 'Jacksonville southwestern suburb. Clay County. St. Johns River proximity. Family-oriented. Military presence from NAS Jax.',
  ARRAY['Orange Park Medical Center', 'Clay County Schools', 'Town of Orange Park', 'Retail businesses', 'NAS Jacksonville nearby'],
  ARRAY['Clarke House Park', 'Thrasher-Horne Center', 'St. Johns River', 'Orange Park Mall area', 'Blanding Boulevard'],
  ARRAY['Community events', 'River activities', 'Town celebrations'],
  ARRAY['Clay County District Schools'], 'Residential growth. Commercial development. Infrastructure improvements. River district development.',
  'Clay Electric Cooperative',
  '{\"efficiency_programs\": {\"amount\": \"Varies\", \"requirements\": \"Clay Electric efficiency programs\"}, \"rebate_programs\": {\"amount\": \"Available\", \"requirements\": \"Co-op member programs\"}}'::jsonb,
  'TECO Peoples Gas', 'Town of Orange Park Utilities', 142,
  'Florida Building Code 8th Edition (2023), Clay County amendments',
  '{\"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"code_compliance\": \"Florida Building Code compliance\"}'::jsonb,
  'moderate', ARRAY['Local HVAC companies', 'Jacksonville metro providers', 'Regional contractors'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Clay Electric\", \"research_date\": \"2024-12-29\"}'::jsonb
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
  '{\"headline\": \"Why Orange Park Residents Choose Us\", \"reasons\": [{\"title\": \"Community-Focused Service\", \"description\": \"Orange Park values community and relationships. We''re your neighbors providing honest, transparent service protecting your family comfort and home investment.\"}, {\"title\": \"Clay County Expertise\", \"description\": \"Orange Park sits in Clay County with specific building codes and Clay Electric service. We understand local requirements and utility programs serving our community.\"}, {\"title\": \"Lakefront Property Knowledge\", \"description\": \"Doctors Lake and other lakefront areas bring enhanced humidity and specific HVAC needs. We provide lake-appropriate dehumidification and system design.\"}, {\"title\": \"Family-First Values\", \"description\": \"Orange Park is family-oriented. We provide reliable service, fair pricing, and genuine care ensuring your family''s comfort year-round.\"}]}'::jsonb,
  '{\"headline\": \"HVAC Challenges in Orange Park\", \"intro\": \"Orange Park''s riverside location creates specific needs:\", \"challenges\": [{\"title\": \"St. Johns River Humidity\", \"description\": \"Orange Park''s proximity to the St. Johns River and Doctors Lake brings enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}, {\"title\": \"Varied Housing Ages\", \"description\": \"From 1940s Old Orange Park to 2020s Grove Park, different construction eras require tailored HVAC approaches while maintaining consistent comfort standards.\"}, {\"title\": \"Military Family Considerations\", \"description\": \"Orange Park''s proximity to NAS Jacksonville means many military families. We provide reliable service, fair pricing, and flexible scheduling for all residents.\"}, {\"title\": \"Clay Electric Service\", \"description\": \"Orange Park is served by Clay Electric Cooperative with specific efficiency programs and requirements different from investor-owned utilities.\"}]}'::jsonb,
  '{\"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lakefront HVAC\", \"slug\": \"lakefront-hvac\", \"description\": \"Specialized service for Doctors Lake properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"Historic Home HVAC\", \"slug\": \"historic-hvac\", \"description\": \"Sensitive service for Old Orange Park homes.\", \"features\": [\"Character preservation\", \"Modern comfort\", \"Expert installation\", \"Respectful approach\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Orange Park.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Fair pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Clay Electric coordination.\", \"features\": [\"Efficiency programs\", \"Local expertise\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{\"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How does Doctors Lake location affect my HVAC system?\", \"answer\": \"Lakefront properties in Orange Park experience enhanced humidity from water proximity. Proper dehumidification and humidity control are essential for comfort and preventing mold.\"}, {\"question\": \"Do you work with Clay Electric Cooperative programs?\", \"answer\": \"Yes, we understand Clay Electric''s efficiency programs and rebates serving Orange Park. We coordinate with the co-op for available incentives and requirements.\"}, {\"question\": \"Why should I choose a local Orange Park HVAC company?\", \"answer\": \"As your Orange Park neighbors, we provide personalized service, understand local conditions, respond quickly, and care about our community''s comfort and satisfaction.\"}]}'::jsonb,
  '{\"avg_summer_high\": \"92°F\", \"avg_humidity\": \"68%\", \"cooling_degree_days\": \"2,680\", \"days_above_90\": \"46\", \"hurricane_risk\": \"Moderate\"}'::jsonb,
  'Ready for Comfort in Orange Park?',
  'Contact us today for a consultation. From Old Orange Park to Doctors Lake to Grove Park, we deliver honest, professional HVAC service with community care.',
  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Orange Park\", \"url\": \"https://coolit-hvac.com/orange-park-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Orange Park\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How does lake location affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Lakefront properties experience enhanced humidity requiring proper dehumidification and humidity control.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Orange Park\", \"item\": \"https://coolit-hvac.com/fl/orange-park\"}]}'::jsonb,
  '/fl/clay-county',
  '[{\"slug\": \"/fl/jacksonville/hvac\", \"anchor_text\": \"Jacksonville HVAC\"}, {\"slug\": \"/fl/middleburg/hvac\", \"anchor_text\": \"Middleburg AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lakefront-hvac\", \"anchor_text\": \"Lakefront HVAC\"}]'::jsonb,
  1740, 26, 9, 86,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
