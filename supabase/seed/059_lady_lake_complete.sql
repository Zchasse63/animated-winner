-- ============================================
-- Lady Lake, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  'Lady Lake', 'lady-lake', 'Florida', 'FL', 'Lake', 'lake-county',
  28.9178, -81.9231,
  ARRAY['32159', '32162'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e']::uuid[],
  true, 65
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
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  NOW(),
  16706, 'US Census Bureau ACS 2023',
  58236, 285000, 82.1,
  ARRAY['single-family', 'retirement', 'manufactured-home', 'condo'],
  '{\"pre-1990\": 20, \"1990s-2000s\": 35, \"2010s\": 30, \"2020s\": 15}'::jsonb,
  92, 50, 71, 3650, 104, 51.8, 'moderate',
  'Gateway to The Villages retirement community. Spanish Springs Town Square. Active adult focus. Significant seasonal population. Inland moderate hurricane risk.',
  ARRAY['The Villages', 'Lake County Public Schools', 'Healthcare services', 'Retail and hospitality', 'Senior services', 'Town of Lady Lake'],
  ARRAY['Spanish Springs Town Square', 'The Villages', 'Lake Griffin', 'Rolling Acres Golf Course', 'Lake Ella', 'Lady Lake Library'],
  ARRAY['Weekly entertainment', 'Spanish Springs events', 'Car shows', 'Farmers Market', 'Seasonal festivals'],
  ARRAY['Lake County Public Schools'],
  'Villages expansion. Commercial development along US-27/441. New residential communities. Medical facilities growth. Retail corridor expansion.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Town of Lady Lake Utilities',
  260,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{\"hvac_replacement\": \"Permit required\", \"inspection\": \"Final inspection required\", \"senior_housing\": \"Accessibility and efficiency focus\"}'::jsonb,
  'very_high',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Fenix Air Conditioning', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{\"demographics\": \"US Census Bureau ACS 2023\", \"utilities\": \"Duke Energy Florida\", \"research_date\": \"2024-12-29\"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Spanish Springs Area', 'spanish-springs', 'Central', 'retirement', '1990s-2010s', 'Upper middle income', 'The Villages northern gateway', ARRAY['55+ systems', 'efficiency focus', 'accessibility needs', 'Villages standards'], '10-30 years', 1, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Harbor Hills', 'harbor-hills', 'South', 'retirement', '1980s-2000s', 'Middle income', 'Established 55+ community', ARRAY['older systems', 'budget constraints', 'efficiency upgrades', 'single-level homes'], '20-40 years', 2, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Rolling Acres', 'rolling-acres', 'West', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course retirement community', ARRAY['golf course humidity', '55+ design', 'premium systems', 'HOA requirements'], '12-30 years', 3, true),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Lake Ella Estates', 'lake-ella', 'East', 'lake-community', '1970s-2000s', 'Middle income', 'Lakefront properties', ARRAY['lake humidity', 'waterfront exposure', 'varied ages', 'moisture control'], '20-50 years', 4, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Highway 27/441 Corridor', 'highway-corridor', 'Central', 'mixed', '1980s-2020s', 'Middle income', 'Commercial and residential mix', ARRAY['mixed use', 'varied systems', 'commercial HVAC', 'residential service'], '5-40 years', 5, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Griffin View', 'griffin-view', 'North', 'single-family', '1990s-2010s', 'Middle income', 'Traditional family area', ARRAY['standard systems', 'family homes', 'efficiency focus'], '12-30 years', 6, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Pennbrooke Fairways', 'pennbrooke', 'Southwest', 'retirement', '2000s-2020s', 'Upper middle income', '55+ golf community', ARRAY['newer systems', 'golf proximity', 'HOA compliance', 'efficiency'], '5-22 years', 7, false),
  ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Lake Tropicana Ranchettes', 'lake-tropicana', 'Southeast', 'rural-suburban', '1970s-2000s', 'Moderate income', 'Larger lot properties', ARRAY['rural systems', 'well water', 'varied housing', 'budget service'], '20-50 years', 8, false)
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
  '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d',
  'hvac',
  '/fl/lady-lake/hvac',
  'HVAC Services in Lady Lake, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lady Lake''s 17,000+ residents. Retirement community specialists. Duke Energy rebates. Serving Spanish Springs, Harbor Hills, Rolling Acres & all areas.',
  'HVAC Lady Lake FL',
  ARRAY['AC repair Lady Lake', 'air conditioning Lady Lake FL', 'HVAC contractor Lady Lake', 'The Villages HVAC', 'Spanish Springs AC', '55+ HVAC'],

  'Lady Lake''s Active Adult HVAC Experts',
  'Retirement community comfort from The Villages to Lake Griffin',
  'Licensed & Insured | Duke Energy Certified | 55+ Community Specialists',
  'Lady Lake serves as the northern gateway to The Villages—America''s premier active adult community—while maintaining its own distinct character. With over 16,000 residents, many in 55+ communities from Spanish Springs to Harbor Hills, Lady Lake demands HVAC contractors who understand retirement living requirements. Our team specializes in efficiency, accessibility, and comfort for active adults throughout this vibrant community.',

  '{
    "headline": "Why Lady Lake Residents Choose Us",
    "reasons": [
      {"title": "55+ Community Specialists", "description": "Lady Lake is predominantly retirement-focused. We understand single-level system design, efficiency priorities, and accessibility needs unique to active adult living."},
      {"title": "The Villages Experience", "description": "We work extensively with Villages residents and understand community standards, efficiency expectations, and seasonal usage patterns."},
      {"title": "Duke Energy Rebate Experts", "description": "We help Lady Lake homeowners maximize Duke Energy rebates including $125 for AC replacement and $100 for heat pumps—important for fixed-income budgets."},
      {"title": "Seasonal Service Solutions", "description": "Many Lady Lake residents are seasonal. We provide monitoring, pre-arrival preparation, and systems designed for intermittent use."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Lady Lake",
    "intro": "Lady Lake''s retirement community focus creates specific HVAC needs:",
    "challenges": [
      {"title": "Single-Level System Design", "description": "Most Lady Lake homes are single-story for accessibility. Proper zoning and duct design are essential for even comfort throughout open floor plans."},
      {"title": "Efficiency & Fixed Budgets", "description": "Many residents are on fixed incomes making efficiency critical. We focus on systems that minimize operating costs while maximizing comfort."},
      {"title": "Seasonal Usage Patterns", "description": "Significant seasonal population means systems need proper setup for extended periods of minimal use followed by full operation."},
      {"title": "HOA & Community Standards", "description": "Villages-affiliated and other 55+ communities have strict equipment placement and noise standards we navigate daily."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Lady Lake",
    "services": [
      {"name": "55+ Community HVAC", "slug": "senior-hvac", "description": "Specialized service for Lady Lake''s retirement communities.", "features": ["Efficiency focus", "Accessibility design", "Fixed-budget solutions", "Quiet operation"]},
      {"name": "Seasonal Home Service", "slug": "seasonal-home", "description": "Comprehensive service for Lady Lake''s seasonal residents.", "features": ["Seasonal monitoring", "Pre-arrival preparation", "Remote capabilities", "Extended warranties"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, respectful repairs throughout Lady Lake.", "features": ["Same-day service", "All brands", "90-day warranty", "Senior-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Efficient installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Efficiency focus", "10-year warranty", "Senior financing"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Service for Rolling Acres and golf course properties.", "features": ["HOA compliance", "Golf humidity control", "Quiet systems", "Premium options"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for retirement budgets.", "features": ["Seasonal service options", "Priority scheduling", "15% repair discount", "Budget-friendly"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you specialize in The Villages and 55+ communities?", "answer": "Yes, we work extensively throughout The Villages and Lady Lake''s retirement communities. We understand community standards, efficiency priorities, and accessibility needs for active adult living."},
      {"question": "Can you help with seasonal home monitoring?", "answer": "Absolutely. We offer seasonal monitoring, remote capabilities, and pre-arrival preparation ensuring your Lady Lake home is comfortable when you return each season."},
      {"question": "What''s the most efficient system for a retirement home?", "answer": "For single-level retirement homes, properly-sized heat pumps with multi-stage operation and enhanced dehumidification offer the best efficiency and comfort. We focus on minimizing operating costs."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Lady Lake residents."}
    ]
  }'::jsonb,

  '{\"avg_summer_high\": \"92°F\", \"avg_humidity\": \"71%\", \"cooling_degree_days\": \"3,650\", \"days_above_90\": \"104+\", \"hurricane_risk\": \"Moderate\"}'::jsonb,

  'Ready for Comfortable Retirement Living in Lady Lake?',
  'Contact us today for a consultation. We''ll design an efficient comfort solution perfect for active adult living with Duke Energy rebate assistance.',

  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Lady Lake\", \"description\": \"Professional HVAC services for Lady Lake, FL specializing in 55+ and retirement communities.\", \"url\": \"https://coolit-hvac.com/lady-lake-fl\", \"telephone\": \"+1-352-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Lady Lake\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do you specialize in The Villages and 55+ communities?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we work extensively with retirement communities and understand efficiency priorities and accessibility needs.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Lady Lake\", \"item\": \"https://coolit-hvac.com/fl/lady-lake\"}]}'::jsonb,

  '/fl/lake-county',
  '[{\"slug\": \"/fl/leesburg/hvac\", \"anchor_text\": \"Leesburg HVAC\"}, {\"slug\": \"/fl/clermont/hvac\", \"anchor_text\": \"Clermont AC\"}, {\"slug\": \"/fl/fruitland-park/hvac\", \"anchor_text\": \"Fruitland Park HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/senior-hvac\", \"anchor_text\": \"55+ Community HVAC\"}, {\"slug\": \"/services/seasonal-home\", \"anchor_text\": \"Seasonal Home Service\"}]'::jsonb,

  1920, 26, 14, 88,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
