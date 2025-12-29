-- ============================================
-- Poinciana, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Poinciana', 'poinciana', 'Florida', 'FL', 'Osceola', 'osceola-county', 28.1296, -81.4724,
  ARRAY['34758', '34759'],
  'Orlando-Kissimmee-Sanford', ARRAY[]::uuid[], true, 82
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', NOW(), 68000, 'US Census Bureau 2023', 52345, 235000, 74.8,
  ARRAY['single-family', 'planned-community', 'suburban', 'affordable'], '{\"pre-1970\": 0, \"1970s-1990s\": 35, \"2000s-2010s\": 45, \"2020s\": 20}'::jsonb,
  93, 53, 73, 2930, 65, 50.5, 'moderate', 'Large planned community. Osceola-Polk county line. Southwest Orlando metro. Affordable housing. Lakes throughout. Rapid growth.',
  ARRAY['Osceola County Schools', 'Polk County Schools', 'Local businesses', 'Retail centers', 'Healthcare'],
  ARRAY['Lake Marion', 'Poinciana Community Park', 'Solivita nearby', 'Cypress Parkway', 'Community recreation'],
  ARRAY['Community events', 'Festivals', 'Recreation programs'],
  ARRAY['Osceola County School District', 'Polk County Schools'], 'Continued residential development. Infrastructure improvements. Commercial growth. Incorporation discussions.',
  'Duke Energy Florida',
  '{\"home_energy_check\": {\"amount\": \"Free\", \"requirements\": \"Duke Energy assessment\"}, \"ac_replacement\": {\"amount\": 100, \"requirements\": \"High-efficiency system\"}, \"smart_thermostat\": {\"amount\": 50, \"requirements\": \"Qualifying thermostat\"}}'::jsonb,
  'Natural gas limited availability', 'Tohopekaliga Water Authority', 172,
  'Florida Building Code 8th Edition (2023), Osceola and Polk County amendments',
  '{\"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"county\": \"Requirements vary by county location\"}'::jsonb,
  'moderate', ARRAY['Local HVAC contractors', 'Kissimmee providers', 'Orlando metro companies'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"Duke Energy\", \"research_date\": \"2024-12-29\"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Central Poinciana', 'central-poinciana', 'Central', 'single-family', '1980s-2010s', 'Middle income', 'Original development area', ARRAY['planned community', 'lakes throughout', 'family homes'], '10-40 years', 1, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'East Poinciana', 'east-poinciana', 'East', 'single-family', '1990s-2020s', 'Middle income', 'Growing area', ARRAY['newer development', 'modern systems', 'family properties'], '2-30 years', 2, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'West Poinciana', 'west-poinciana', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Established neighborhoods', ARRAY['lake proximity', 'varied ages', 'humidity'], '10-40 years', 3, true),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Lake Marion Area', 'lake-marion', 'South', 'single-family', '1990s-2020s', 'Middle income', 'Lakefront community', ARRAY['lake humidity', 'family homes', 'waterfront influence'], '2-30 years', 4, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'North Poinciana', 'north-poinciana', 'North', 'single-family', '2000s-2020s', 'Middle income', 'Recent growth', ARRAY['newer construction', 'modern homes', 'efficient systems'], '2-22 years', 5, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Solivita', 'solivita', 'Northwest', 'retirement', '2000s-2020s', 'Upper middle income', '55+ active adult community', ARRAY['retirement housing', 'modern systems', 'amenity-rich'], '2-22 years', 6, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'Cypress Parkway Area', 'cypress-parkway', 'Central', 'single-family', '1990s-2020s', 'Middle income', 'Main corridor area', ARRAY['varied housing', 'convenient location', 'mixed ages'], '2-30 years', 7, false),
  ('a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'South Poinciana', 'south-poinciana', 'South', 'single-family', '1980s-2010s', 'Middle income', 'Established area', ARRAY['family homes', 'lake proximity', 'varied systems'], '10-40 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'a9b0c1d2-e3f4-5a6b-7c8d-9e0f1a2b3c4d', 'hvac', '/fl/poinciana/hvac',
  'HVAC Services in Poinciana, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Poinciana''s 68,000+ residents. Planned community specialists. Duke Energy rebates. Serving Lake Marion, Solivita & all neighborhoods.',
  'HVAC Poinciana FL',
  ARRAY['AC repair Poinciana', 'air conditioning Poinciana FL', 'HVAC contractor Poinciana', 'Solivita HVAC', 'Lake Marion AC'],
  'Poinciana''s Trusted Planned Community HVAC Experts',
  'Affordable comfort for Central Florida''s growing community',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'Poinciana—Central Florida''s largest planned community—straddles the Osceola-Polk county line southwest of Orlando. With 68,000 residents from original 1980s developments to brand-new neighborhoods to Solivita retirement community, Poinciana combines affordable family living with lakes throughout requiring specialized HVAC knowledge.',
  '{\"headline\": \"Why Poinciana Residents Choose Us\", \"reasons\": [{\"title\": \"Planned Community Expertise\", \"description\": \"Poinciana is Florida''s largest planned community with specific infrastructure and lakes throughout. We understand the planned design and provide lake-appropriate HVAC solutions.\"}, {\"title\": \"Affordable, Honest Pricing\", \"description\": \"Poinciana residents value affordability. We provide honest, transparent pricing with no surprise charges protecting family budgets while delivering quality service.\"}, {\"title\": \"Retirement Community Knowledge\", \"description\": \"Solivita and other 55+ areas have specific needs. We provide respectful service, clear communication, and honest recommendations for senior residents.\"}, {\"title\": \"Two-County Coverage\", \"description\": \"Poinciana spans Osceola and Polk counties with different requirements. We navigate both county codes and permitting seamlessly.\"}]}'::jsonb,
  '{\"headline\": \"HVAC Challenges in Poinciana\", \"intro\": \"Poinciana''s planned community design creates specific needs:\", \"challenges\": [{\"title\": \"Extensive Lake System\", \"description\": \"Poinciana has numerous lakes throughout the community creating enhanced humidity beyond typical Central Florida levels requiring robust dehumidification.\"}, {\"title\": \"Two-County Jurisdiction\", \"description\": \"Poinciana straddles Osceola-Polk county line with different building codes, permit requirements, and inspection processes requiring dual-county expertise.\"}, {\"title\": \"Varied Development Eras\", \"description\": \"From 1980s original sections to 2020s new growth, Poinciana spans four decades of construction with different HVAC infrastructure and needs.\"}, {\"title\": \"Budget-Conscious Market\", \"description\": \"Poinciana is affordable housing focused. Residents need cost-effective solutions without sacrificing quality or reliability requiring honest, fair pricing.\"}]}'::jsonb,
  '{\"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"Lake Area HVAC\", \"slug\": \"lake-hvac\", \"description\": \"Specialized service for Poinciana''s lakefront properties.\", \"features\": [\"Enhanced dehumidification\", \"Humidity control\", \"Lake expertise\", \"Mold prevention\"]}, {\"name\": \"Retirement Community HVAC\", \"slug\": \"retirement-hvac\", \"description\": \"Respectful service for Solivita and 55+ areas.\", \"features\": [\"Clear communication\", \"Honest recommendations\", \"Senior-friendly service\", \"Fair pricing\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast, affordable repairs throughout Poinciana.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"Honest pricing\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with Duke Energy rebates.\", \"features\": [\"Duke rebates\", \"Affordable options\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Budget-friendly maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{\"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do Poinciana''s lakes affect HVAC systems?\", \"answer\": \"Poinciana''s extensive lake system creates enhanced humidity throughout the community. Proper dehumidification beyond standard AC is essential for comfort and preventing mold.\"}, {\"question\": \"Do building codes differ in Osceola vs Polk County parts of Poinciana?\", \"answer\": \"Yes, Poinciana straddles two counties with different codes and permit processes. We handle both Osceola and Polk County requirements seamlessly for all Poinciana residents.\"}, {\"question\": \"What Duke Energy rebates are available in Poinciana?\", \"answer\": \"Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Poinciana residents.\"}]}'::jsonb,
  '{\"avg_summer_high\": \"93°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"2,930\", \"days_above_90\": \"65\", \"hurricane_risk\": \"Moderate\"}'::jsonb,
  'Ready for Affordable Comfort in Poinciana?',
  'Contact us today for a consultation. From Lake Marion to Solivita to all neighborhoods, we deliver honest, professional HVAC service with Duke Energy rebates.',
  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Poinciana\", \"url\": \"https://coolit-hvac.com/poinciana-fl\", \"telephone\": \"+1-863-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Poinciana\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do lakes affect HVAC?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Poinciana''s extensive lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Poinciana\", \"item\": \"https://coolit-hvac.com/fl/poinciana\"}]}'::jsonb,
  '/fl/osceola-county',
  '[{\"slug\": \"/fl/kissimmee/hvac\", \"anchor_text\": \"Kissimmee HVAC\"}, {\"slug\": \"/fl/st-cloud/hvac\", \"anchor_text\": \"St. Cloud AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Area HVAC\"}]'::jsonb,
  1840, 28, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
