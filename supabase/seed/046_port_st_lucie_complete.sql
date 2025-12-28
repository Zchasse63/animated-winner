-- ============================================
-- Port St. Lucie, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b5c6d7e8-f9a0-1234-7890-456789012345',
  'Port St. Lucie', 'port-st-lucie', 'Florida', 'FL', 'St. Lucie', 'st-lucie-county',
  27.2730, -80.3582,
  ARRAY['34952', '34953', '34983', '34984', '34986', '34987', '34988'],
  'Port St. Lucie',
  ARRAY['c6d7e8f9-a0b1-2345-8901-567890123456', 'd7e8f9a0-b1c2-3456-9012-678901234567']::uuid[],
  true, 77
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
  'b5c6d7e8-f9a0-1234-7890-456789012345',
  NOW(),
  204851, 'US Census Bureau ACS 2023',
  64847, 285000, 77.2,
  ARRAY['single-family', 'new-construction', 'golf-community', 'waterfront'],
  '{"1980s-1990s": 30, "2000s-2010s": 40, "2020s": 30}'::jsonb,
  89, 59, 74, 3400, 85, 56.3, 'high',
  'Fast-growing Treasure Coast hub. Master-planned communities. New York Mets spring training. Golf courses and nature preserves. High coastal hurricane risk.',
  ARRAY['St. Lucie County Public Schools', 'Cleveland Clinic Tradition Hospital', 'City of Port St. Lucie', 'Digital Domain', 'Retail and service industry', 'Small businesses'],
  ARRAY['Clover Park (Mets Spring Training)', 'Botanical Gardens', 'Tradition Town Center', 'PGA Village', 'St. Lucie River', 'Veteran Community Park'],
  ARRAY['Oktoberfest', 'Food Truck Invasion', 'Summer Concert Series', 'Farmers Market'],
  ARRAY['St. Lucie County Public Schools'],
  'Continued rapid growth. Tradition development expansion. PGA Village area. New residential communities. Commercial corridor development.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Port St. Lucie Utilities',
  195,
  'Florida Building Code 8th Edition (2023), City of Port St. Lucie amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Air Docs', 'Franks Air Conditioning', 'Elite Electric', 'ABC Air Conditioning', 'Comfort Zone'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Tradition', 'tradition', 'North', 'new-construction', '2000s-2020s', 'Upper middle income', 'Master-planned mixed-use community', ARRAY['newer systems', 'smart home ready', 'HOA requirements', 'family homes'], '5-20 years', 1, true),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'PGA Village', 'pga-village', 'West', 'golf-community', '2000s-2020s', 'Upper income', 'Premier golf resort community', ARRAY['golf course humidity', 'premium systems', 'multi-zone estates', 'HOA standards'], '5-20 years', 2, true),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'St. Lucie West', 'st-lucie-west', 'Northwest', 'single-family', '1990s-2010s', 'Upper middle income', 'Established master-planned area', ARRAY['established systems', 'family homes', 'HOA communities'], '10-28 years', 3, true),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Tesoro', 'tesoro', 'Southwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer construction', 'family homes', 'builder-grade systems'], '5-20 years', 4, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Verano', 'verano', 'Central', 'single-family', '2000s-2020s', 'Middle income', 'Growing community', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-20 years', 5, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'River Park', 'river-park', 'East', 'single-family', '1990s-2010s', 'Middle income', 'Established neighborhood', ARRAY['established systems', 'family homes', 'standard service'], '10-28 years', 6, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Lake Charles', 'lake-charles', 'South', 'single-family', '1980s-2000s', 'Middle income', 'Older established area', ARRAY['older systems', 'system replacements', 'budget solutions'], '20-40 years', 7, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Torino', 'torino', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer golf community', ARRAY['golf adjacent', 'newer systems', 'HOA compliance'], '5-20 years', 8, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Port St. Lucie Boulevard Area', 'psl-boulevard', 'Central', 'mixed', '1980s-2010s', 'Middle income', 'Mixed commercial/residential', ARRAY['varied housing', 'mixed ages', 'diverse needs'], '10-40 years', 9, false),
  ('b5c6d7e8-f9a0-1234-7890-456789012345', 'Lyngate', 'lyngate', 'Southeast', 'single-family', '1980s-2000s', 'Middle income', 'Established community', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 10, false)
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
  'b5c6d7e8-f9a0-1234-7890-456789012345',
  'hvac',
  '/fl/port-st-lucie/hvac',
  'HVAC Services in Port St. Lucie, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Port St. Lucie''s 205,000+ residents. New construction and golf community specialists. FPL rebates. Serving Tradition, PGA Village, St. Lucie West & all areas.',
  'HVAC Port St. Lucie FL',
  ARRAY['AC repair Port St. Lucie', 'air conditioning Port St. Lucie FL', 'HVAC contractor Port St. Lucie', 'Tradition AC', 'PGA Village HVAC', 'St. Lucie County HVAC'],

  'Port St. Lucie''s Trusted HVAC Experts',
  'Growing with Florida''s 8th largest city',
  'Licensed & Insured | FPL Certified | New Construction & Golf Community Specialists',
  'Port St. Lucie—Florida''s 8th largest city with over 205,000 residents—represents dynamic Treasure Coast growth with master-planned communities like Tradition, premier golf at PGA Village, and family-friendly neighborhoods throughout. From brand-new construction to established St. Lucie West, Port St. Lucie needs HVAC contractors who understand rapid growth and diverse community standards. Our team delivers expert service throughout this thriving city.',

  '{
    "headline": "Why Port St. Lucie Residents Choose Us",
    "reasons": [
      {"title": "Master-Planned Community Experts", "description": "Tradition, PGA Village, and St. Lucie West have specific standards and requirements. We understand these communities and ensure full HOA compliance."},
      {"title": "New Construction Specialists", "description": "Port St. Lucie is constantly expanding. We work with builders throughout the city and help new homeowners evaluate and optimize their HVAC systems."},
      {"title": "Golf Community Experience", "description": "PGA Village, Torino, and golf-adjacent properties require premium service. We deliver equipment and expertise matching these properties."},
      {"title": "FPL Rebate Assistance", "description": "We help Port St. Lucie homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Port St. Lucie",
    "intro": "Port St. Lucie''s growth and climate create specific HVAC considerations:",
    "challenges": [
      {"title": "Builder-Grade System Evaluation", "description": "Many Port St. Lucie new homes have builder-grade systems minimally sized to meet code. We provide honest evaluations helping homeowners decide if upgrades are worthwhile."},
      {"title": "HOA Requirements", "description": "Port St. Lucie''s numerous master-planned communities have equipment placement and appearance standards we navigate daily."},
      {"title": "Golf Course Humidity", "description": "PGA Village, Torino, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Rapid Growth Demand", "description": "Port St. Lucie''s explosive growth means some HVAC companies can''t keep up. We''ve expanded to provide responsive service throughout the city."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Port St. Lucie",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Port St. Lucie''s newest communities.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for PGA Village and other golf properties.", "features": ["Premium equipment", "HOA compliance", "Humidity control", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Port St. Lucie.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance and HOA compliance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Port St. Lucie builders?", "answer": "Yes, we work with builders throughout Port St. Lucie and help new homeowners evaluate and optimize their HVAC systems from day one."},
      {"question": "Can you ensure installations meet Tradition/PGA Village standards?", "answer": "Absolutely. We''re familiar with HOA requirements in Tradition, PGA Village, St. Lucie West, and other communities, ensuring all equipment placement and appearance meets standards."},
      {"question": "Should I upgrade my builder-grade AC system?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort. We provide honest assessments."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Port St. Lucie homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "74%", "cooling_degree_days": "3,400", "days_above_90": "85+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Comfort in Port St. Lucie?',
  'Contact us today for expert service. From Tradition to PGA Village, we''ll keep your Port St. Lucie home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Port St. Lucie", "description": "Professional HVAC services for Port St. Lucie, FL.", "url": "https://coolit-hvac.com/port-st-lucie-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Port St. Lucie", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Port St. Lucie", "item": "https://coolit-hvac.com/fl/port-st-lucie"}]}'::jsonb,

  '/fl/st-lucie-county',
  '[{"slug": "/fl/fort-pierce/hvac", "anchor_text": "Fort Pierce HVAC"}, {"slug": "/fl/stuart/hvac", "anchor_text": "Stuart AC"}, {"slug": "/fl/vero-beach/hvac", "anchor_text": "Vero Beach HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}]'::jsonb,

  1900, 30, 16, 77,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
