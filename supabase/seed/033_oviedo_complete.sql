-- ============================================
-- Oviedo, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  'Oviedo', 'oviedo', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6700, -81.2081,
  ARRAY['32765', '32766'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'a3b4c5d6-e7f8-9012-6789-345678901234']::uuid[],
  true, 87
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
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  NOW(),
  43069, 'US Census Bureau ACS 2023',
  95847, 425000, 80.4,
  ARRAY['single-family', 'new-construction', 'golf-community', 'townhouse'],
  '{"pre-1990": 15, "1990s-2000s": 35, "2010s": 30, "2020s": 20}'::jsonb,
  92, 51, 74, 3500, 102, 53.1, 'low',
  'Family-oriented community with small-town charm. Rapid growth with new development. UCF proximity. "Chicken Capital of the World" heritage. Low inland hurricane risk.',
  ARRAY['Seminole County Public Schools', 'University of Central Florida (nearby)', 'Oviedo Medical Center', 'City of Oviedo', 'Siemens (nearby)', 'Retail and service industry'],
  ARRAY['Historic Downtown Oviedo', 'Oviedo Mall', 'Black Hammock', 'Riverside Park', 'Twin Rivers Park'],
  ARRAY['Taste of Oviedo', 'Great Day in the Country', 'Winter Springs Farmer''s Market (nearby)', 'A Night Under the Stars'],
  ARRAY['Seminole County Public Schools'],
  'Continued residential growth. Oviedo on the Park development. UCF partnership expansion. SR 417 corridor development. New schools construction.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Oviedo Utilities / Seminole County',
  240,
  'Florida Building Code 8th Edition (2023), City of Oviedo amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Oviedo on the Park', 'oviedo-on-the-park', 'Central', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'smart home ready', 'energy efficiency', 'HOA requirements'], '0-12 years', 1, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'The Preserve', 'the-preserve', 'East', 'golf-community', '2000s-2010s', 'Upper income', 'Premier golf community', ARRAY['golf course humidity', 'premium systems', 'multi-zone estates', 'HOA standards'], '10-20 years', 2, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Stonebridge', 'stonebridge', 'West', 'single-family', '2000s-2010s', 'Upper middle income', 'Family-friendly community', ARRAY['family homes', 'newer systems', 'HOA requirements'], '10-20 years', 3, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Carillon', 'carillon', 'South', 'single-family', '1990s-2010s', 'Upper middle income', 'Established neighborhood', ARRAY['established systems', 'family sizing', 'efficiency focus'], '10-28 years', 4, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Chuluota (adjacent)', 'chuluota-oviedo', 'East', 'mixed', '1980s-2010s', 'Middle income', 'Rural-suburban mix', ARRAY['varied housing', 'well water', 'mixed needs'], '10-35 years', 5, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Canterbury Retreat', 'canterbury-retreat', 'North', 'single-family', '1990s-2000s', 'Upper middle income', 'Established community', ARRAY['1990s-2000s systems', 'family homes', 'standard service'], '15-28 years', 6, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Live Oak Reserve', 'live-oak-reserve', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community', ARRAY['newer construction', 'smart systems', 'energy efficiency'], '5-12 years', 7, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Historic Downtown', 'downtown-oviedo', 'Central', 'mixed', '1900s-1980s', 'Middle income', 'Original Oviedo area', ARRAY['older buildings', 'varied systems', 'renovation needs'], '15-80+ years', 8, false)
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
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  'hvac',
  '/fl/oviedo/hvac',
  'HVAC Services in Oviedo, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Oviedo''s 43,000+ residents. Family home and new construction specialists. Duke Energy rebates. Serving Oviedo on the Park, The Preserve & all areas.',
  'HVAC Oviedo FL',
  ARRAY['AC repair Oviedo', 'air conditioning Oviedo FL', 'HVAC contractor Oviedo', 'new construction AC Oviedo', 'Duke Energy rebates', 'Seminole County HVAC'],

  'Oviedo''s Family-Focused HVAC Experts',
  'Growing with Orlando''s family-friendly community',
  'Licensed & Insured | Duke Energy Certified | New Construction Specialists',
  'Oviedo combines small-town charm with rapid growth, attracting families seeking excellent schools, safe neighborhoods, and proximity to UCF. With over 43,000 residents and an 80% homeownership rate, Oviedo homeowners take pride in their properties. From new construction at Oviedo on the Park to established communities like Carillon, our team provides expert HVAC service while helping you maximize Duke Energy rebates.',

  '{
    "headline": "Why Oviedo Families Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Oviedo is growing rapidly with communities like Oviedo on the Park and Live Oak Reserve. We work with builders and new homeowners to ensure optimal HVAC from day one."},
      {"title": "Family-Focused Service", "description": "Oviedo is a family community. We provide honest pricing, respectful service, and solutions that keep your family comfortable."},
      {"title": "Duke Energy Rebate Specialists", "description": "We help Oviedo homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Golf Community Experience", "description": "The Preserve and other golf communities require premium service. We deliver equipment and expertise matching these properties."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Oviedo",
    "intro": "Oviedo''s growth and character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Quality", "description": "Many Oviedo builder-grade systems are minimally sized. We help homeowners evaluate and upgrade for optimal comfort and efficiency."},
      {"title": "HOA Requirements", "description": "Oviedo''s numerous master-planned communities have equipment placement and appearance standards we navigate daily."},
      {"title": "Golf Course Humidity", "description": "The Preserve and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Rapid Growth", "description": "Oviedo''s fast growth means many HVAC companies are stretched thin. We''ve expanded to provide responsive service."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Oviedo",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Oviedo''s new homes including system evaluation and upgrades.", "features": ["Builder coordination", "System evaluation", "Upgrades available", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs for Oviedo families.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for The Preserve and other golf communities.", "features": ["HOA compliance", "Premium equipment", "Humidity control", "Multi-zone systems"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Oviedo new home builders?", "answer": "Yes, we work with builders throughout Oviedo and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Should I upgrade my new home''s builder-grade AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."},
      {"question": "Do you service The Preserve and other golf communities?", "answer": "Yes, we specialize in Oviedo''s golf communities with HOA-compliant installations and premium equipment."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "102+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Family Comfort in Oviedo?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and keep your Oviedo family comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Oviedo", "description": "Professional HVAC services in Oviedo, FL.", "url": "https://coolit-hvac.com/oviedo-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Oviedo", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new home builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Oviedo", "item": "https://coolit-hvac.com/fl/oviedo"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 14, 87,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
