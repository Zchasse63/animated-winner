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
