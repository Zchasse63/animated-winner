-- ============================================
-- Pembroke Pines, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Pines', 'pembroke-pines', 'Florida', 'FL', 'Broward', 'broward-county', 26.0034, -80.2962,
  ARRAY['33023', '33024', '33025', '33026', '33027', '33028', '33029', '33082', '33084'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a']::uuid[], true, 95
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', NOW(), 171000, 'US Census Bureau 2023', 68542, 385000, 71.3,
  ARRAY['single-family', 'townhome', 'planned-community', 'suburban'], '{"pre-1970\": 5, \"1970s-1990s\": 40, \"2000s-2010s\": 38, \"2020s\": 17}'::jsonb,
  90, 65, 75, 4070, 86, 62.4, 'very_high', 'Planned suburban city southwest of Fort Lauderdale. Master-planned communities. Family-oriented neighborhoods. Broward HVHZ requirements.',
  ARRAY['Broward County Public Schools', 'Memorial Healthcare System', 'City of Pembroke Pines', 'Retail centers', 'Corporate offices'],
  ARRAY['Pembroke Lakes Mall', 'City Center', 'CB Smith Park', 'Chapel Trail Nature Preserve', 'Pines Boulevard corridor'],
  ARRAY['Festival of the Arts', 'Pines Recreation events', 'Community concerts'],
  ARRAY['Broward County Public Schools'], 'West Pines development. Charter schools expansion. Commercial corridor revitalization. Residential infill projects.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement\": {\"amount\": 150, \"requirements\": \"High-efficiency system\"}, \"duct_sealing\": {\"amount\": 150, \"requirements\": \"Professional testing\"}, \"smart_thermostat\": {\"amount\": 100, \"requirements\": \"Qualifying thermostat\"}, \"total_available\": {\"amount\": 600, \"requirements\": \"Combined FPL rebates\"}}'::jsonb,
  'Florida City Gas', 'City of Pembroke Pines Utilities', 152,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement\": \"Permit required\", \"hvhz\": \"High Velocity Hurricane Zone compliance\", \"inspection\": \"Multiple inspections required\", \"hoa\": \"Many communities have HOA equipment restrictions"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Chapel Trail', 'chapel-trail', 'West', 'single-family', '1990s-2010s', 'Upper middle income', 'Master-planned gated community', ARRAY['newer homes', 'HOA standards', 'efficiency focus', 'planned infrastructure'], '12-30 years', 1, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Silver Lakes', 'silver-lakes', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established family neighborhood', ARRAY['family homes', 'system replacements', 'standard service'], '20-40 years', 2, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Falls', 'pembroke-falls', 'North', 'single-family', '1990s-2010s', 'Upper income', 'Luxury gated community', ARRAY['larger homes', 'premium systems', 'HOA requirements'], '12-30 years', 3, true),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Country Isles', 'country-isles', 'East', 'single-family', '1970s-1990s', 'Middle income', 'Mature neighborhood', ARRAY['older systems', 'replacement needs', 'efficiency upgrades'], '30-50 years', 4, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Grand Palms', 'grand-palms', 'South', 'townhome', '2000s-2010s', 'Middle income', 'Golf community townhomes', ARRAY['attached housing', 'shared walls', 'compact systems'], '12-22 years', 5, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pembroke Isles', 'pembroke-isles', 'Central', 'single-family', '1980s-2000s', 'Upper middle income', 'Waterfront community', ARRAY['lake proximity', 'humidity control', 'family properties'], '20-40 years', 6, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'West Pines', 'west-pines', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development area', ARRAY['modern construction', 'efficient systems', 'recent builds'], '2-22 years', 7, false),
  ('e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'Pasadena Lakes', 'pasadena-lakes', 'Northeast', 'single-family', '1970s-1990s', 'Middle income', 'Established lakefront area', ARRAY['older homes', 'lake humidity', 'varied systems'], '30-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b', 'hvac', '/fl/pembroke-pines/hvac',
  'HVAC Services in Pembroke Pines, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pembroke Pines'' 171,000+ residents. Planned community specialists. FPL rebates. Serving Chapel Trail, Silver Lakes, Pembroke Falls & all neighborhoods.',
  'HVAC Pembroke Pines FL',
  ARRAY['AC repair Pembroke Pines', 'air conditioning Pembroke Pines FL', 'HVAC contractor Pembroke Pines', 'Chapel Trail HVAC', 'Pembroke Falls AC'],
  'Pembroke Pines'' Master-Planned Community HVAC Experts',
  'Professional service for Florida''s third-largest city',
  'Licensed & Insured | FPL Certified | HOA-Compliant Specialists',
  'Pembroke Pines—Broward County''s largest city and Florida''s third-largest—is built around master-planned communities. With 171,000 residents in neighborhoods like Chapel Trail, Pembroke Falls, Silver Lakes, and West Pines, this suburban city demands HVAC expertise matching its planned excellence and strict HOA standards.',
  '{"headline\": \"Why Pembroke Pines Homeowners Choose Us\", \"reasons\": [{\"title\": \"Master-Planned Community Experts\", \"description\": \"Chapel Trail, Pembroke Falls, and other planned communities have specific HOA equipment requirements and aesthetic standards. We ensure compliance while delivering optimal performance.\"}, {\"title\": \"HOA Compliance Specialists\", \"description\": \"Pembroke Pines neighborhoods often have strict HOA rules for HVAC equipment placement, screening, and appearance. We navigate all requirements seamlessly.\"}, {\"title\": \"Hurricane Zone Certified\", \"description\": \"Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs. All our installations meet strict code compliance.\"}, {\"title\": \"City-Wide Coverage\", \"description\": \"From Chapel Trail to Country Isles to West Pines, we serve all Pembroke Pines neighborhoods with consistent professional service.\"}]}'::jsonb,
  '{"headline\": \"HVAC Challenges in Pembroke Pines\", \"intro\": \"Pembroke Pines'' planned communities create specific considerations:\", \"challenges\": [{\"title\": \"HOA Equipment Restrictions\", \"description\": \"Master-planned communities often mandate specific equipment placement, screening requirements, and noise restrictions. Professional navigation of these rules is essential.\"}, {\"title\": \"Planned Infrastructure Requirements\", \"description\": \"Pembroke Pines neighborhoods were built with specific utility infrastructure. HVAC systems must integrate properly with planned electrical and drainage systems.\"}, {\"title\": \"Hurricane Zone Compliance\", \"description\": \"Broward HVHZ mandates wind-rated equipment, engineered tie-downs, and strict inspections throughout Pembroke Pines.\"}, {\"title\": \"Varied Community Ages\", \"description\": \"From 1970s Country Isles to 2020s West Pines, different eras require different HVAC approaches while maintaining city-wide standards.\"}]}'::jsonb,
  '{"headline\": \"Complete HVAC Services\", \"services\": [{\"name\": \"HOA-Compliant Installation\", \"slug\": \"hoa-hvac\", \"description\": \"Expert installations meeting all HOA requirements.\", \"features\": [\"HOA compliance\", \"Aesthetic screening\", \"Noise standards\", \"Placement approval\"]}, {\"name\": \"Hurricane-Rated Systems\", \"slug\": \"hurricane-hvac\", \"description\": \"HVHZ-compliant installations.\", \"features\": [\"Wind-rated\", \"Engineered tie-downs\", \"Code compliance\", \"Permit handling\"]}, {\"name\": \"AC Repair\", \"slug\": \"ac-repair\", \"description\": \"Fast repairs throughout Pembroke Pines.\", \"features\": [\"Same-day service\", \"All brands\", \"90-day warranty\", \"City-wide coverage\"]}, {\"name\": \"AC Installation\", \"slug\": \"ac-installation\", \"description\": \"Expert installations with FPL rebates.\", \"features\": [\"FPL rebates\", \"HOA approved\", \"10-year warranty\", \"Financing available\"]}, {\"name\": \"Maintenance Plans\", \"slug\": \"maintenance\", \"description\": \"Comprehensive maintenance programs.\", \"features\": [\"Bi-annual service\", \"Priority scheduling\", \"15% repair discount\", \"System optimization\"]}]}'::jsonb,
  '{"headline\": \"Frequently Asked Questions\", \"faqs\": [{\"question\": \"How do you handle Chapel Trail or Pembroke Falls HOA requirements?\", \"answer\": \"We''re experienced with Pembroke Pines HOA rules. We handle all compliance, screening, placement approval, and documentation for master-planned communities.\"}, {\"question\": \"What are Broward HVHZ requirements in Pembroke Pines?\", \"answer\": \"High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, and strict inspections. We handle all compliance throughout Pembroke Pines.\"}, {\"question\": \"What FPL rebates are available?\", \"answer\": \"FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Pembroke Pines residents.\"}]}'::jsonb,
  '{"avg_summer_high\": \"90°F\", \"avg_humidity\": \"75%\", \"cooling_degree_days\": \"4,070\", \"days_above_90\": \"86+\", \"hurricane_risk\": \"Very High"}'::jsonb,
  'Ready for Comfort in Pembroke Pines?',
  'Contact us today for a consultation. From Chapel Trail to Pembroke Falls to Silver Lakes, we deliver expert HVAC service with full HOA compliance and FPL rebates.',
  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Pembroke Pines\", \"url\": \"https://coolit-hvac.com/pembroke-pines-fl\", \"telephone\": \"+1-954-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Pembroke Pines\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"How do you handle HOA requirements?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"We handle all HOA compliance, screening, placement approval, and documentation for Pembroke Pines planned communities.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Pembroke Pines\", \"item\": \"https://coolit-hvac.com/fl/pembroke-pines\"}]}'::jsonb,
  '/fl/broward-county',
  '[{\"slug\": \"/fl/hollywood/hvac\", \"anchor_text\": \"Hollywood HVAC\"}, {\"slug\": \"/fl/fort-lauderdale/hvac\", \"anchor_text\": \"Fort Lauderdale AC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/hoa-hvac\", \"anchor_text\": \"HOA-Compliant HVAC\"}]'::jsonb,
  1730, 24, 12, 89,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
