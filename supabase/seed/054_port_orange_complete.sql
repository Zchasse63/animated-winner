-- ============================================
-- Port Orange, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd3e4f5a6-b7c8-9012-5678-345678901234',
  'Port Orange', 'port-orange', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.1383, -80.9956,
  ARRAY['32127', '32128', '32129'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['a0b1c2d3-e4f5-6789-2345-012345678901', 'e4f5a6b7-c8d9-0123-6789-456789012345']::uuid[],
  true, 68
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
  'd3e4f5a6-b7c8-9012-5678-345678901234',
  NOW(),
  64842, 'US Census Bureau ACS 2023',
  65847, 295000, 78.4,
  ARRAY['single-family', 'golf-community', 'waterfront', 'townhouse'],
  '{"1970s-1990s": 35, "2000s-2010s": 40, "2020s": 25}'::jsonb,
  90, 52, 75, 3440, 86, 52.2, 'high',
  'Growing family-oriented community. Adjacent to Daytona Beach. Golf communities. Spruce Creek aviation community. High coastal hurricane risk.',
  ARRAY['Volusia County Public Schools', 'Halifax Health', 'City of Port Orange', 'Retail and service industry', 'Small businesses'],
  ARRAY['Spruce Creek Fly-In', 'Dunlawton Sugar Mill Gardens', 'City Center', 'Riverwalk', 'Port Orange Pavilion'],
  ARRAY['Port Orange Family Days', 'Summer Concert Series', 'Holiday events', 'Farmers Market'],
  ARRAY['Volusia County Public Schools'],
  'Continued residential growth. City Center development. Spruce Creek area expansion. Commercial corridor improvements. Parks expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Port Orange Utilities',
  185,
  'Florida Building Code 8th Edition (2023), City of Port Orange amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Spruce Creek Fly-In', 'spruce-creek', 'West', 'aviation-community', '1970s-2020s', 'Upper income', 'Unique aviation community', ARRAY['aviation hangar homes', 'premium demands', 'varied ages', 'unique properties'], '5-50 years', 1, true),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Cypress Head', 'cypress-head', 'North', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'established systems', 'HOA requirements'], '10-30 years', 2, true),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Crane Lakes', 'crane-lakes', 'Central', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer master-planned community', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-20 years', 3, true),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Countryside', 'countryside', 'South', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['established systems', 'family homes', 'standard service'], '20-40 years', 4, false),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Sabal Creek', 'sabal-creek', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Growing community', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-20 years', 5, false),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'South Port Orange', 'south-port-orange', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established area', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-50 years', 6, false),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'Riverwalk', 'riverwalk-po', 'Central', 'mixed', '2000s-2020s', 'Upper middle income', 'Waterfront development', ARRAY['waterfront properties', 'newer systems', 'varied housing'], '5-20 years', 7, false),
  ('d3e4f5a6-b7c8-9012-5678-345678901234', 'North Port Orange', 'north-port-orange', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Residential community', ARRAY['established systems', 'family homes', 'standard needs'], '10-40 years', 8, false)
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
  'd3e4f5a6-b7c8-9012-5678-345678901234',
  'hvac',
  '/fl/port-orange/hvac',
  'HVAC Services in Port Orange, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Port Orange''s 65,000+ residents. Golf community and aviation specialists. FPL rebates. Serving Spruce Creek, Cypress Head, Crane Lakes & all areas.',
  'HVAC Port Orange FL',
  ARRAY['AC repair Port Orange', 'air conditioning Port Orange FL', 'HVAC contractor Port Orange', 'Spruce Creek AC', 'golf community HVAC', 'Volusia County HVAC'],

  'Port Orange''s Family-Focused HVAC Experts',
  'Growing with Port Orange families',
  'Licensed & Insured | FPL Certified | Golf Community & Aviation Specialists',
  'Port Orange—a thriving family-oriented community of over 65,000 residents—combines unique attractions like Spruce Creek Fly-In aviation community with golf communities, new developments like Crane Lakes, and established neighborhoods. With 78% homeownership, Port Orange residents take pride in their properties. Our team delivers expert HVAC service from Spruce Creek hangar homes to golf estates throughout this dynamic community.',

  '{
    "headline": "Why Port Orange Families Choose Us",
    "reasons": [
      {"title": "Aviation Community Specialists", "description": "Spruce Creek Fly-In''s unique hangar homes require specialized HVAC understanding. We work with these distinctive properties and understand their needs."},
      {"title": "Golf Community Experience", "description": "Cypress Head and golf-adjacent properties require premium service. We deliver equipment and expertise with enhanced humidity control."},
      {"title": "Family-Focused Service", "description": "Port Orange is a family community with 78% homeownership. We provide honest pricing, respectful service, and solutions that keep families comfortable."},
      {"title": "FPL Rebate Assistance", "description": "We help Port Orange homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Port Orange",
    "intro": "Port Orange''s growth and community character create specific HVAC considerations:",
    "challenges": [
      {"title": "Aviation Community Properties", "description": "Spruce Creek Fly-In hangar homes combine residential and aviation space with unique HVAC requirements we understand and accommodate."},
      {"title": "Golf Course Humidity", "description": "Cypress Head and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "New Construction Evaluation", "description": "Crane Lakes and newer developments often have builder-grade systems. We help homeowners evaluate if upgrades would improve comfort."},
      {"title": "HOA Requirements", "description": "Port Orange''s numerous communities have equipment placement and appearance standards we navigate daily."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Port Orange",
    "services": [
      {"name": "Aviation Community HVAC", "slug": "aviation-community", "description": "Specialized service for Spruce Creek Fly-In unique properties.", "features": ["Hangar home expertise", "Unique requirements", "Premium service", "Aviation understanding"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Cypress Head and golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Enhanced dehumidification"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Port Orange.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Port Orange''s new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "HOA compliance"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Family plans"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Spruce Creek Fly-In hangar homes?", "answer": "Yes, we understand Spruce Creek''s unique hangar homes combining residential and aviation space. We provide HVAC solutions accommodating these distinctive properties."},
      {"question": "Do you work with Cypress Head golf community?", "answer": "Absolutely. We specialize in Port Orange''s golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "Should I upgrade my new Crane Lakes home''s AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort. We provide honest assessments."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Port Orange homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,440", "days_above_90": "86+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Family Comfort in Port Orange?',
  'Contact us today for expert service. From Spruce Creek to Crane Lakes, we''ll keep your Port Orange family comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Port Orange", "description": "Professional HVAC services for Port Orange, FL.", "url": "https://coolit-hvac.com/port-orange-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "Port Orange", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Spruce Creek?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we understand Spruce Creek''s unique hangar homes and aviation community."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Port Orange", "item": "https://coolit-hvac.com/fl/port-orange"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/daytona-beach/hvac", "anchor_text": "Daytona Beach HVAC"}, {"slug": "/fl/new-smyrna-beach/hvac", "anchor_text": "New Smyrna Beach AC"}, {"slug": "/fl/south-daytona/hvac", "anchor_text": "South Daytona HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}, {"slug": "/services/aviation-community", "anchor_text": "Aviation Community HVAC"}]'::jsonb,

  1890, 27, 13, 68,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
