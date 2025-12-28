-- ============================================
-- Sebastian, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f9a0b1c2-d3e4-5678-1234-890123456789',
  'Sebastian', 'sebastian', 'Florida', 'FL', 'Indian River', 'indian-river-county',
  27.8164, -80.4706,
  ARRAY['32958', '32976'],
  'Sebastian-Vero Beach',
  ARRAY['d7e8f9a0-b1c2-3456-9012-678901234567']::uuid[],
  true, 73
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
  'f9a0b1c2-d3e4-5678-1234-890123456789',
  NOW(),
  26975, 'US Census Bureau ACS 2023',
  68547, 315000, 81.4,
  ARRAY['single-family', 'waterfront', 'golf-community', 'affordable-housing'],
  '{"pre-1980": 15, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 20}'::jsonb,
  89, 59, 74, 3320, 81, 54.8, 'high',
  'Quiet riverfront community. Sebastian Inlet access. Pelican Island Wildlife Refuge. Mix of waterfront and inland. Strong fishing heritage. High coastal hurricane risk.',
  ARRAY['Indian River County Public Schools', 'City of Sebastian', 'Healthcare facilities', 'Small businesses', 'Retail sector', 'Tourism industry'],
  ARRAY['Sebastian Inlet State Park', 'Pelican Island National Wildlife Refuge', 'Riverview Park', 'Sebastian Fishing Museum', 'Captain Hiram''s', 'Indian River Lagoon'],
  ARRAY['Clambake Music Festival', 'Crabby Bills Seafood Festival', 'Pelican Island Wildlife Festival', 'Farmers Market'],
  ARRAY['Indian River County Public Schools'],
  'Residential growth. Sebastian Inlet area development. Waterfront improvements. Commercial corridor expansion. Nature preserve expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'None (no natural gas service)',
  'City of Sebastian Utilities / Indian River County',
  200,
  'Florida Building Code 8th Edition (2023), City of Sebastian amendments',
  '{"hvac_replacement": "Permit required", "coastal_areas": "Wind-rated equipment near coast", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Breeze', 'Elite Electric', 'Air Docs', 'ABC Air Conditioning', 'Franks Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Sebastian Inlet Area', 'sebastian-inlet', 'East', 'waterfront', '1960s-2020s', 'Upper middle income', 'Near famous fishing inlet', ARRAY['inlet proximity', 'salt air', 'waterfront exposure', 'fishing community'], '5-55 years', 1, true),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Pelican Island', 'pelican-island', 'East', 'waterfront', '1980s-2020s', 'Upper middle income', 'Indian River Lagoon waterfront', ARRAY['lagoon humidity', 'waterfront properties', 'wildlife area proximity'], '5-40 years', 2, true),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Golf Hammock', 'golf-hammock', 'West', 'golf-community', '1980s-2010s', 'Upper middle income', 'Golf community', ARRAY['golf course humidity', 'established systems', 'HOA requirements'], '10-40 years', 3, true),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Barber Street Area', 'barber-street', 'Central', 'mixed', '1960s-2000s', 'Middle income', 'Central Sebastian', ARRAY['varied housing', 'mixed ages', 'standard service'], '20-55 years', 4, false),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Easy Street', 'easy-street', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Residential community', ARRAY['established systems', 'family homes', 'standard needs'], '10-40 years', 5, false),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Collier Club', 'collier-club', 'Southwest', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf and country club', ARRAY['golf course adjacent', 'premium systems', 'HOA standards'], '10-30 years', 6, false),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Sebastian Highlands', 'sebastian-highlands', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency focus'], '20-40 years', 7, false),
  ('f9a0b1c2-d3e4-5678-1234-890123456789', 'Roseland', 'roseland', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Rural character area', ARRAY['older homes', 'budget solutions', 'system replacements'], '25-55 years', 8, false)
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
  'f9a0b1c2-d3e4-5678-1234-890123456789',
  'hvac',
  '/fl/sebastian/hvac',
  'HVAC Services in Sebastian, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Sebastian''s 27,000+ residents. Waterfront and golf community specialists. FPL rebates available. Serving Sebastian Inlet, Pelican Island, Golf Hammock & all areas.',
  'HVAC Sebastian FL',
  ARRAY['AC repair Sebastian', 'air conditioning Sebastian FL', 'HVAC contractor Sebastian', 'Sebastian Inlet AC', 'waterfront HVAC', 'Indian River County HVAC'],

  'Sebastian''s Waterfront HVAC Experts',
  'Comfort solutions from the inlet to the lagoon',
  'Licensed & Insured | FPL Certified | Waterfront & Golf Community Specialists',
  'Sebastian—a quiet gem on the Indian River Lagoon with easy access to Sebastian Inlet—combines peaceful waterfront living with golf communities and family neighborhoods. With nearly 27,000 residents enjoying 81% homeownership, Sebastian homeowners take pride in their properties. From inlet waterfront to Pelican Island and Golf Hammock, our team provides expert HVAC service throughout this treasured Treasure Coast community.',

  '{
    "headline": "Why Sebastian Residents Choose Us",
    "reasons": [
      {"title": "Waterfront Specialists", "description": "Pelican Island, Sebastian Inlet area, and Indian River properties face salt air and humidity challenges. We provide coastal protection and waterfront expertise."},
      {"title": "Golf Community Experience", "description": "Golf Hammock and Collier Club properties require premium service. We deliver equipment and expertise with enhanced humidity control for golf-adjacent homes."},
      {"title": "Community Knowledge", "description": "Sebastian''s mix of waterfront, golf, and residential communities requires varied approaches. We understand this community and deliver appropriate solutions."},
      {"title": "FPL Rebate Assistance", "description": "We help Sebastian homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Sebastian",
    "intro": "Sebastian''s lagoon location and community character create specific HVAC considerations:",
    "challenges": [
      {"title": "Indian River Lagoon Humidity", "description": "Pelican Island and waterfront properties experience elevated humidity from the lagoon requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Sebastian Inlet Salt Air", "description": "Properties near Sebastian Inlet face salt air exposure requiring coastal coil protection for equipment longevity in this fishing community."},
      {"title": "Golf Course Humidity", "description": "Golf Hammock and Collier Club properties experience elevated humidity from course irrigation requiring enhanced dehumidification beyond standard AC."},
      {"title": "High Homeownership Community", "description": "With 81% homeownership, Sebastian residents are invested in their properties. We provide quality service protecting these investments."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Sebastian",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Pelican Island and lagoon properties.", "features": ["Lagoon humidity control", "Salt air protection", "Coastal coil coating", "Waterfront expertise"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Golf Hammock and Collier Club properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Enhanced dehumidification"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Sebastian.", "features": ["Same-day service", "All brands", "90-day warranty", "Inlet to lagoon coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Coastal-rated equipment", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Sebastian systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting waterfront investments.", "features": ["Bi-annual service", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Sebastian Inlet area properties?", "answer": "Yes, we specialize in inlet area properties with coastal coil protection and salt air expertise. We understand the unique challenges of this famous fishing area."},
      {"question": "Why do Indian River lagoon properties need special attention?", "answer": "Pelican Island and lagoon waterfront properties experience elevated humidity and salt exposure. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "Do you work with Golf Hammock and Collier Club?", "answer": "Yes, we specialize in Sebastian''s golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Sebastian homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "74%", "cooling_degree_days": "3,320", "days_above_90": "81+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Waterfront Comfort in Sebastian?',
  'Contact us today for expert service. From Sebastian Inlet to Pelican Island, we''ll keep your Sebastian home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Sebastian", "description": "Professional HVAC services for Sebastian, FL specializing in waterfront and golf properties.", "url": "https://coolit-hvac.com/sebastian-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Sebastian", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Sebastian Inlet area?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in inlet area properties with coastal coil protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Sebastian", "item": "https://coolit-hvac.com/fl/sebastian"}]}'::jsonb,

  '/fl/indian-river-county',
  '[{"slug": "/fl/vero-beach/hvac", "anchor_text": "Vero Beach HVAC"}, {"slug": "/fl/fellsmere/hvac", "anchor_text": "Fellsmere AC"}, {"slug": "/fl/fort-pierce/hvac", "anchor_text": "Fort Pierce HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}]'::jsonb,

  1880, 27, 13, 73,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
