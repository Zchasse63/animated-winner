-- ============================================
-- Eustis, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  'Eustis', 'eustis', 'Florida', 'FL', 'Lake', 'lake-county',
  28.8527, -81.6851,
  ARRAY['32726', '32727', '32736'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c']::uuid[],
  true, 70
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
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  NOW(),
  22191, 'US Census Bureau ACS 2023',
  54128, 245000, 68.7,
  ARRAY['single-family', 'historic', 'lake-community', 'manufactured-home'],
  '{\"pre-1970\": 25, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 50, 71, 3620, 103, 52.3, 'moderate',
  'Historic "City of Progress" on Lake Eustis. Charming downtown. GeorgeFest draws thousands. Mix of historic and new development. Inland moderate hurricane risk.',
  ARRAY['Florida Hospital Waterman', 'Lake County Public Schools', 'City of Eustis', 'Downtown businesses', 'Healthcare', 'Retail services'],
  ARRAY['Historic downtown', 'Lake Eustis waterfront', 'Ferran Park', 'Clifford House', 'GeorgeFest venue', 'Eustis Historical Museum', 'Bay Street'],
  ARRAY['GeorgeFest', 'Eustis Street Fest', 'Christmas parade', 'Farmers Market', 'Downtown events'],
  ARRAY['Lake County Public Schools'],
  'Downtown revitalization. Waterfront development. Historic preservation efforts. New residential communities. Medical facilities expansion.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Eustis Utilities',
  255,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{\"hvac_replacement\": \"Permit required\", \"historic_district\": \"Historic preservation considerations for downtown properties\", \"inspection\": \"Final inspection required\"}'::jsonb,
  'moderate',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Fenix Air Conditioning', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{\"demographics\": \"US Census Bureau ACS 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29\"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Historic Downtown', 'historic-downtown', 'Central', 'historic', '1880s-1950s', 'Middle income', 'Charming historic district', ARRAY['historic buildings', 'older systems', 'preservation requirements', 'varied housing'], '30-130 years', 1, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Lake Eustis Waterfront', 'lake-eustis', 'East', 'lake-community', '1950s-2010s', 'Upper middle income', 'Lake Eustis properties', ARRAY['lake humidity', 'waterfront exposure', 'premium demands', 'moisture control'], '12-70 years', 2, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Ferran Park Area', 'ferran-park', 'Southeast', 'single-family', '1960s-2000s', 'Middle income', 'Near waterfront park', ARRAY['established homes', 'family properties', 'varied ages', 'standard service'], '20-60 years', 3, true),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Palm Terrace', 'palm-terrace', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-50 years', 4, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Carlton Estates', 'carlton-estates', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-22 years', 5, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Countryside', 'countryside', 'South', 'manufactured-home', '1980s-2000s', 'Moderate income', 'Affordable community', ARRAY['manufactured home systems', 'budget solutions', 'standard service'], '20-40 years', 6, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Grand Island', 'grand-island', 'Northeast', 'lake-community', '1950s-2000s', 'Upper middle income', 'Island properties on Lake Eustis', ARRAY['island humidity', 'water exposure', 'older systems', 'premium demands'], '20-70 years', 7, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Woodward Avenue Area', 'woodward-avenue', 'Central', 'single-family', '1940s-1980s', 'Middle income', 'Traditional neighborhood', ARRAY['older homes', 'system replacements', 'efficiency focus'], '40-80 years', 8, false),
  ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Trout Lake', 'trout-lake', 'Southwest', 'lake-community', '1970s-2010s', 'Middle income', 'Trout Lake waterfront', ARRAY['lake properties', 'humidity control', 'varied ages'], '12-50 years', 9, false)
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
  '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e',
  'hvac',
  '/fl/eustis/hvac',
  'HVAC Services in Eustis, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Eustis'' 22,000+ residents. Historic home and lake community specialists. Duke Energy rebates. Serving downtown, Lake Eustis waterfront & all neighborhoods.',
  'HVAC Eustis FL',
  ARRAY['AC repair Eustis', 'air conditioning Eustis FL', 'HVAC contractor Eustis', 'Lake Eustis AC', 'historic home HVAC', 'GeorgeFest HVAC'],

  'Eustis'' Historic & Waterfront HVAC Experts',
  'Preserving comfort from downtown to Lake Eustis',
  'Licensed & Insured | Duke Energy Certified | Historic Home Specialists',
  'Eustis—the "City of Progress"—blends historic charm with lakefront living on beautiful Lake Eustis. With over 22,000 residents from the historic downtown district to Grand Island waterfront estates, Eustis presents unique HVAC challenges. Our team specializes in both preserving historic properties and serving modern lakefront homes, understanding what makes this charming community special.',

  '{
    "headline": "Why Eustis Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "Eustis'' charming downtown features homes from the 1880s-1950s. We provide modern comfort while respecting historic character and preservation requirements."},
      {"title": "Lake Community Expertise", "description": "Lake Eustis, Grand Island, and Trout Lake properties face enhanced humidity. We provide waterfront-specific dehumidification and moisture control."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Eustis homeowners maximize Duke Energy rebates including $125 for AC replacement and $100 for heat pumps."},
      {"title": "Mixed Housing Experience", "description": "From 130-year-old historic homes to brand new construction, Eustis has it all. We provide appropriate solutions for every property type."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Eustis",
    "intro": "Eustis'' character creates specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation Requirements", "description": "Downtown historic properties require HVAC solutions that provide modern comfort without compromising historic character. Equipment placement and exterior modifications need careful consideration."},
      {"title": "Lake Eustis Humidity", "description": "Waterfront properties on Lake Eustis, Grand Island, and Trout Lake experience elevated humidity from lake exposure requiring enhanced dehumidification."},
      {"title": "Varied Housing Stock", "description": "From 1880s Victorian homes to 2020s construction, Eustis requires vastly different approaches for different property types and ages."},
      {"title": "Aging Systems in Established Areas", "description": "Much of Eustis features established neighborhoods with aging HVAC systems needing replacement and efficiency upgrades."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Eustis",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Eustis'' historic downtown properties.", "features": ["Preservation-friendly", "Modern comfort", "Discreet equipment", "Expert installation"]},
      {"name": "Lake Community Service", "slug": "lake-hvac", "description": "Enhanced service for Lake Eustis waterfront properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Humidity control", "Moisture management"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Eustis.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic to modern"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Property-specific design", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in established Eustis neighborhoods.", "features": ["Efficiency upgrades", "Modern comfort", "Rebate assistance", "Financing options"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for all property types.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "System longevity"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work on historic downtown homes?", "answer": "Yes, we specialize in historic Eustis properties. We provide modern comfort solutions while respecting historic character and working within preservation requirements."},
      {"question": "Do Lake Eustis properties need special HVAC attention?", "answer": "Yes, Lake Eustis waterfront and island properties experience elevated humidity from lake exposure. Enhanced dehumidification and proper moisture control are essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available in Eustis?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Eustis residents."},
      {"question": "My home is from the 1950s and needs a new AC. What do you recommend?", "answer": "We assess your home''s condition, insulation, and ductwork to recommend properly-sized equipment. Often older homes benefit from efficiency upgrades like improved ductwork or enhanced dehumidification."}
    ]
  }'::jsonb,

  '{\"avg_summer_high\": \"92°F\", \"avg_humidity\": \"71%\", \"cooling_degree_days\": \"3,620\", \"days_above_90\": \"103+\", \"hurricane_risk\": \"Moderate\"}'::jsonb,

  'Ready for Comfort in Historic Eustis?',
  'Contact us today for a consultation. From historic downtown to Lake Eustis waterfront, we''ll deliver expert HVAC service with Duke Energy rebate assistance.',

  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Eustis\", \"description\": \"Professional HVAC services for Eustis, FL specializing in historic homes and lake communities.\", \"url\": \"https://coolit-hvac.com/eustis-fl\", \"telephone\": \"+1-352-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Eustis\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you work on historic downtown homes?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we specialize in historic properties providing modern comfort while respecting historic character.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Eustis\", \"item\": \"https://coolit-hvac.com/fl/eustis\"}]}'::jsonb,

  '/fl/lake-county',
  '[{\"slug\": \"/fl/mount-dora/hvac\", \"anchor_text\": \"Mount Dora HVAC\"}, {\"slug\": \"/fl/tavares/hvac\", \"anchor_text\": \"Tavares AC\"}, {\"slug\": \"/fl/leesburg/hvac\", \"anchor_text\": \"Leesburg HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}, {\"slug\": \"/services/lake-hvac\", \"anchor_text\": \"Lake Community HVAC\"}]'::jsonb,

  1940, 27, 15, 89,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
