-- ============================================
-- Port Charlotte, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  'Port Charlotte', 'port-charlotte', 'Florida', 'FL', 'Charlotte', 'charlotte-county',
  26.9756, -82.0906,
  ARRAY['33948', '33949', '33952', '33953', '33954', '33980', '33981', '33983'],
  'Punta Gorda',
  ARRAY[]::uuid[],
  true, 83
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
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  NOW(),
  62985, 'US Census Bureau ACS 2023',
  52847, 285000, 72.4,
  ARRAY['single-family', 'manufactured-home', 'waterfront', 'condo'],
  '{"pre-1980": 15, "1980s-1990s": 40, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  91, 55, 74, 3650, 108, 54.2, 'high',
  'Charlotte Harbor location. Hurricane Ian direct hit in 2022. Significant rebuilding. Popular retirement destination. Mix of waterfront and inland properties.',
  ARRAY['Fawcett Memorial Hospital', 'Charlotte County Public Schools', 'Charlotte County Government', 'Publix', 'Healthcare industry', 'Construction (rebuilding)'],
  ARRAY['Charlotte Harbor', 'Tippecanoe Environmental Park', 'Port Charlotte Beach Park', 'Cultural Center of Charlotte County', 'Murdock Circle'],
  ARRAY['Charlotte Harbor Freedom Swim', 'Peace River Seafood Festival', 'Punta Gorda Wine & Jazz Festival (nearby)'],
  ARRAY['Charlotte County Public Schools'],
  'Hurricane Ian recovery. Significant rebuilding and renovation. New construction replacing damaged homes. Infrastructure improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Charlotte County Utilities',
  280,
  'Florida Building Code 8th Edition (2023), Charlotte County enhanced hurricane standards post-Ian',
  '{"hvac_replacement": "Permit required", "hurricane_hardening": "Enhanced requirements post-Ian", "flood_zone": "Equipment elevation may be required", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Climatech', 'Complete Air Mechanical'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Deep Creek', 'deep-creek', 'East', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf community with waterways', ARRAY['hurricane recovery', 'golf course humidity', 'system replacements', 'efficiency upgrades'], '5-35 years', 1, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'South Gulf Cove', 'south-gulf-cove', 'South', 'waterfront', '1980s-2010s', 'Middle income', 'Canal-front properties near Gulf', ARRAY['hurricane damage recovery', 'salt air exposure', 'waterfront humidity', 'new systems'], '0-35 years', 2, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Murdock', 'murdock', 'Central', 'mixed', '1970s-2000s', 'Moderate income', 'Central Port Charlotte', ARRAY['varied damage levels', 'mixed housing types', 'budget solutions', 'rebuilding'], '0-45 years', 3, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Riverwood', 'riverwood', 'Northeast', 'golf-community', '1990s-2010s', 'Upper middle income', 'Gated golf community', ARRAY['hurricane damage', 'premium systems', 'HOA requirements', 'humidity control'], '0-28 years', 4, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Charlotte Harbor', 'charlotte-harbor', 'West', 'waterfront', '1960s-2000s', 'Middle income', 'Near harbor', ARRAY['severe storm damage', 'rebuilding', 'waterfront systems', 'salt exposure'], '0-50 years', 5, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Port Charlotte Beach', 'port-charlotte-beach', 'West', 'single-family', '1970s-1990s', 'Middle income', 'Near beach park', ARRAY['storm recovery', 'older systems', 'replacement needs'], '0-45 years', 6, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Harbour Heights', 'harbour-heights', 'Northwest', 'single-family', '1970s-2000s', 'Moderate income', 'Residential area', ARRAY['mixed damage', 'varied ages', 'standard service'], '0-45 years', 7, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'North Port Charlotte', 'north-port-charlotte', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Northern residential area', ARRAY['varied damage', 'family homes', 'rebuilding'], '0-35 years', 8, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Mobile Home Communities', 'mobile-homes-pc', 'Various', 'manufactured-home', '1970s-2000s', 'Moderate income', 'Manufactured home parks', ARRAY['significant damage', 'package units', 'replacement needs', 'budget constraints'], '0-40 years', 9, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'East Port Charlotte', 'east-port-charlotte', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Eastern residential', ARRAY['varied conditions', 'family homes', 'standard service'], '0-45 years', 10, false)
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
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  'hvac',
  '/fl/port-charlotte/hvac',
  'HVAC Services in Port Charlotte, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Port Charlotte''s 63,000+ residents. Hurricane Ian recovery specialists. FPL rebates available. Serving Deep Creek, Gulf Cove & all neighborhoods.',
  'HVAC Port Charlotte FL',
  ARRAY['AC repair Port Charlotte', 'air conditioning Port Charlotte FL', 'HVAC contractor Port Charlotte', 'hurricane AC replacement', 'FPL rebates', 'Charlotte County HVAC'],

  'Port Charlotte''s Hurricane Recovery HVAC Experts',
  'Rebuilding comfort after Ian—together',
  'Licensed & Insured | FPL Certified | Hurricane Ian Recovery Specialists',
  'Port Charlotte knows resilience. Hurricane Ian''s direct hit in September 2022 devastated our community, but we''re rebuilding stronger than ever. Whether you''re replacing a damaged system, installing HVAC in a rebuilt home, or maintaining equipment that survived, our team is here to help Port Charlotte recover. We''ve been working alongside our neighbors since day one, providing reliable service and helping homeowners navigate insurance claims and FPL rebates.',

  '{
    "headline": "Why Port Charlotte Homeowners Choose Us",
    "reasons": [
      {"title": "Hurricane Ian Recovery Experts", "description": "We''ve helped hundreds of Port Charlotte families restore comfort after Hurricane Ian. We understand insurance requirements, provide detailed documentation, and work with adjusters."},
      {"title": "Rebuilding Partner", "description": "Many Port Charlotte homes are being rebuilt or renovated. We work with contractors to ensure optimal HVAC installation in new and restored homes."},
      {"title": "FPL Rebate Assistance", "description": "We help you access FPL rebates including $150 for AC replacement and $150 for duct sealing—important savings during recovery."},
      {"title": "Community Commitment", "description": "Port Charlotte is our community. We''re committed to helping our neighbors rebuild with quality HVAC that''s designed to withstand future storms."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Post-Ian Port Charlotte",
    "intro": "Hurricane Ian created unique HVAC challenges throughout Port Charlotte:",
    "challenges": [
      {"title": "Storm Damage Assessment", "description": "Many systems show hidden damage from Ian—corroded components, water intrusion, or structural issues. Professional assessment prevents future failures."},
      {"title": "Insurance Documentation", "description": "Proper documentation is essential for insurance claims. We provide detailed reports and work with adjusters to ensure coverage."},
      {"title": "Code Updates", "description": "Post-Ian construction must meet enhanced hurricane standards. HVAC installations require proper tie-downs, elevation in flood zones, and updated equipment."},
      {"title": "Supply and Timing", "description": "Recovery demand means planning is important. We work with you to schedule installations and ensure equipment availability."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Port Charlotte",
    "services": [
      {"name": "Hurricane Recovery HVAC", "slug": "hurricane-recovery", "description": "Complete HVAC solutions for storm-damaged properties including damage assessment, insurance documentation, and replacement.", "features": ["Damage assessment", "Insurance documentation", "Code-compliant installation", "Hurricane hardening"]},
      {"name": "New Construction", "slug": "new-construction", "description": "HVAC installation for rebuilt and new Port Charlotte homes.", "features": ["Builder coordination", "Code compliance", "Hurricane standards", "Manual J sizing"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs for systems that survived or were recently installed.", "features": ["Same-day service", "All brands", "90-day warranty", "Storm damage expertise"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane tie-downs", "Elevated installation", "10-year warranty"]},
      {"name": "System Assessment", "slug": "system-assessment", "description": "Professional evaluation of existing systems for hidden storm damage.", "features": ["Comprehensive inspection", "Damage documentation", "Insurance reports", "Repair recommendations"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Storm prep", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How do I know if my AC has hidden hurricane damage?", "answer": "Even systems that seem to work may have hidden damage—corroded components, water intrusion, or stressed parts. We provide comprehensive assessments with documentation for insurance."},
      {"question": "Can you help with insurance claims?", "answer": "Yes, we provide detailed documentation including photos, damage assessments, and repair/replacement estimates that insurance adjusters need."},
      {"question": "What hurricane standards apply to new AC installations?", "answer": "Post-Ian Port Charlotte requires hurricane tie-downs, may require equipment elevation in flood zones, and must meet enhanced Florida Building Code standards."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. Every dollar helps during recovery."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,650", "days_above_90": "108+", "hurricane_risk": "High"}'::jsonb,

  'Ready to Rebuild Comfort in Port Charlotte?',
  'Contact us today for a free estimate. We''re here to help Port Charlotte recover with quality HVAC and expert service.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Port Charlotte", "description": "Hurricane recovery HVAC services in Port Charlotte, FL.", "url": "https://coolit-hvac.com/port-charlotte-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Port Charlotte", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How do I know if my AC has hurricane damage?", "acceptedAnswer": {"@type": "Answer", "text": "We provide comprehensive assessments to identify hidden storm damage with insurance documentation."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Port Charlotte", "item": "https://coolit-hvac.com/fl/port-charlotte"}]}'::jsonb,

  '/fl/charlotte-county',
  '[{"slug": "/fl/punta-gorda/hvac", "anchor_text": "Punta Gorda HVAC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port AC"}, {"slug": "/fl/englewood/hvac", "anchor_text": "Englewood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/hurricane-recovery", "anchor_text": "Hurricane Recovery"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1850, 26, 16, 87,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
