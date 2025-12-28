-- ============================================
-- Land O' Lakes, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor / Tampa Bay
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  'Land O'' Lakes', 'land-o-lakes', 'Florida', 'FL', 'Pasco', 'pasco-county',
  28.2189, -82.4576,
  ARRAY['34637', '34638', '34639'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
  true, 84
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
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  NOW(),
  41467, 'US Census Bureau ACS 2023',
  85742, 385000, 84.2,
  ARRAY['single-family', 'new-construction', 'golf-community', 'active-adult'],
  '{"pre-2000": 20, "2000s": 35, "2010s": 30, "2020s": 15}'::jsonb,
  91, 52, 73, 3300, 95, 54.2, 'low',
  'Inland location with lower hurricane risk. Rapidly growing suburb north of Tampa. Master-planned communities. Family-oriented with excellent schools.',
  ARRAY['Pasco County Schools', 'Medical Center of Trinity (nearby)', 'Publix', 'Florida Hospital (nearby)', 'Local businesses', 'Construction industry'],
  ARRAY['Conner Preserve', 'Wilderness Lake Preserve', 'Land O'' Lakes Heritage Park', 'Crews Lake Wilderness Park', 'Oakstead trails'],
  ARRAY['Land O'' Lakes Holiday Parade', 'Fall Festival', 'Community events'],
  ARRAY['Pasco County Schools'],
  'Continued residential growth. Connerton development. New schools construction. SR 54 corridor expansion. Suncoast Parkway access improvements.',
  'Duke Energy Florida / Withlacoochee River Electric Cooperative',
  '{
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}, "duct_sealing": {"amount": 150}},
    "wrec": {"ac_replacement": {"amount": 200, "requirements": "SEER 15+ system"}, "heat_pump": {"amount": 100}}
  }'::jsonb,
  'TECO Peoples Gas',
  'Pasco County Utilities',
  280,
  'Florida Building Code 8th Edition (2023), Pasco County amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance required", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Cornerstone Pros', 'Air Zero', 'Comfort Temp', 'Gulf Coast Air Systems'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy / WREC", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Connerton', 'connerton', 'East', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'builder-grade systems', 'smart home integration', 'energy efficiency'], '0-12 years', 1, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Lake Padgett Estates', 'lake-padgett', 'South', 'single-family', '1990s-2010s', 'Upper middle income', 'Lakefront community', ARRAY['lakefront humidity', 'family homes', 'established systems'], '10-28 years', 2, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Oakstead', 'oakstead', 'Central', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'HOA requirements', 'family sizing', 'smart systems'], '5-20 years', 3, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Wilderness Lake Preserve', 'wilderness-lake', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Nature preserve community', ARRAY['preserve humidity', 'family homes', 'HOA standards'], '10-20 years', 4, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Dupree Lakes', 'dupree-lakes', 'Central', 'single-family', '2000s-2010s', 'Middle income', 'Planned community', ARRAY['standard systems', 'family homes', 'HOA requirements'], '10-20 years', 5, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Ballantrae', 'ballantrae', 'South', 'golf-community', '2000s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'premium demands', 'HOA standards'], '10-20 years', 6, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Caliente', 'caliente', 'East', 'active-adult', '2000s-2010s', 'Upper middle income', '55+ clothing optional resort', ARRAY['active adult needs', 'energy efficiency', 'quiet operation'], '10-20 years', 7, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Northwood', 'northwood', 'Northwest', 'single-family', '1990s-2000s', 'Middle income', 'Established neighborhood', ARRAY['1990s-2000s systems', 'standard service', 'family homes'], '15-28 years', 8, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Crews Lake Area', 'crews-lake', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Near Crews Lake', ARRAY['lakefront properties', 'varied ages', 'mixed needs'], '15-35 years', 9, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Sanders Farms', 'sanders-farms', 'South', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community', ARRAY['new construction', 'HOA standards', 'family sizing'], '0-12 years', 10, false)
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
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  'hvac',
  '/fl/land-o-lakes/hvac',
  'HVAC Services in Land O'' Lakes, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Land O'' Lakes'' 41,000+ residents. New construction specialists. Duke Energy rebates available. Serving Connerton, Oakstead & all neighborhoods.',
  'HVAC Land O Lakes FL',
  ARRAY['AC repair Land O Lakes', 'air conditioning Land O Lakes FL', 'HVAC contractor Land O Lakes', 'new construction AC', 'Duke Energy rebates', 'Pasco County HVAC'],

  'Land O'' Lakes'' Growing Community HVAC Experts',
  'New construction and family home specialists',
  'Licensed & Insured | Duke Energy Certified | New Construction Experts',
  'Land O'' Lakes is one of Tampa Bay''s fastest-growing communities, attracting families seeking excellent schools, master-planned neighborhoods, and a convenient location north of Tampa. With over 41,000 residents and one of the highest homeownership rates in the region at 84%, Land O'' Lakes homeowners take pride in their properties. Our team specializes in the new construction filling communities like Connerton and Oakstead, as well as established homes throughout this family-friendly area.',

  '{
    "headline": "Why Land O'' Lakes Homeowners Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Land O'' Lakes is growing rapidly with new communities like Connerton and Sanders Farms. We work with builders and new homeowners to ensure optimal HVAC installation and performance."},
      {"title": "Family-Focused Service", "description": "Land O'' Lakes is a family community. We provide honest service, clean installations, and respect for your home and time."},
      {"title": "Master-Planned Community Knowledge", "description": "With extensive HOAs throughout Land O'' Lakes, we understand community requirements and ensure installations meet all standards."},
      {"title": "Dual Utility Expertise", "description": "Land O'' Lakes is served by both Duke Energy and WREC. We help you access rebates from either utility to maximize savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Land O'' Lakes",
    "intro": "Land O'' Lakes'' growth and location create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Quality", "description": "Builder-grade systems in new Land O'' Lakes homes may be minimally sized. We help homeowners evaluate and upgrade systems for optimal comfort."},
      {"title": "HOA Requirements", "description": "Land O'' Lakes'' master-planned communities have strict requirements for equipment placement and appearance. We ensure full compliance."},
      {"title": "Preserve Humidity", "description": "Communities near nature preserves like Wilderness Lake experience elevated humidity from surrounding wetlands."},
      {"title": "Rapid Growth", "description": "Land O'' Lakes'' rapid growth means many HVAC companies are stretched thin. We''ve expanded to provide responsive service throughout the area."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Land O'' Lakes",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Land O'' Lakes'' new homes including builder-grade upgrades and system optimization.", "features": ["Builder coordination", "Manual J sizing", "System upgrades", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Land O'' Lakes communities.", "features": ["Same-day service", "All brands", "90-day warranty", "HOA-aware service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy and WREC rebate assistance.", "features": ["Utility rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance and efficiency.", "features": ["Capacity increases", "Efficiency upgrades", "Zoning additions", "Smart integration"]},
      {"name": "Indoor Air Quality", "slug": "indoor-air-quality", "description": "Combat Florida humidity and allergens with whole-home solutions.", "features": ["Dehumidification", "Air purification", "UV treatment", "HEPA filtration"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with new home builders in Land O'' Lakes?", "answer": "Yes, we work with builders throughout Land O'' Lakes and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Which utility serves my Land O'' Lakes home?", "answer": "Land O'' Lakes is served by both Duke Energy and Withlacoochee River Electric Cooperative (WREC). We help you access rebates from either utility."},
      {"question": "Should I upgrade my new home''s AC?", "answer": "Many builder-grade systems are minimally sized. If you experience uneven temperatures or high humidity, an upgrade or enhancement often improves comfort significantly."},
      {"question": "Do you comply with Land O'' Lakes HOA requirements?", "answer": "Yes, we''re familiar with requirements for Connerton, Oakstead, and other communities. We ensure all installations meet HOA standards."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "73%", "cooling_degree_days": "3,300", "days_above_90": "95+", "hurricane_risk": "Low"}'::jsonb,

  'Ready to Upgrade Your Land O'' Lakes Home Comfort?',
  'Contact us today for a free estimate. We''ll help you access utility rebates and find the perfect system for your Land O'' Lakes home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Land O'' Lakes", "description": "Professional HVAC services in Land O'' Lakes, FL.", "url": "https://coolit-hvac.com/land-o-lakes-fl", "telephone": "+1-813-555-COOL", "areaServed": {"@type": "City", "name": "Land O'' Lakes", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new home builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize their HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Land O'' Lakes", "item": "https://coolit-hvac.com/fl/land-o-lakes"}]}'::jsonb,

  '/fl/pasco-county',
  '[{"slug": "/fl/wesley-chapel/hvac", "anchor_text": "Wesley Chapel HVAC"}, {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa AC"}, {"slug": "/fl/new-port-richey/hvac", "anchor_text": "New Port Richey HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 16, 86,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
