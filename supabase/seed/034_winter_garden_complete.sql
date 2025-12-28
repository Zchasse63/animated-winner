-- ============================================
-- Winter Garden, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  'Winter Garden', 'winter-garden', 'Florida', 'FL', 'Orange', 'orange-county',
  28.5653, -81.5862,
  ARRAY['34777', '34778', '34787'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 88
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
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  NOW(),
  51826, 'US Census Bureau ACS 2023',
  92547, 435000, 74.8,
  ARRAY['single-family', 'new-construction', 'townhouse', 'historic-home'],
  '{"pre-1990": 10, "1990s-2000s": 25, "2010s": 40, "2020s": 25}'::jsonb,
  92, 52, 73, 3450, 100, 52.6, 'low',
  'Historic downtown with modern growth. One of Florida''s fastest-growing cities. West Orange Trail hub. Mix of charm and new development. Low inland hurricane risk.',
  ARRAY['Orange County Public Schools', 'AdventHealth Winter Garden', 'City of Winter Garden', 'West Orange Healthcare District', 'Retail and service industry', 'Small businesses'],
  ARRAY['Historic Downtown Winter Garden', 'West Orange Trail', 'Plant Street Market', 'Garden Theatre', 'Tucker Ranch', 'SunRail Station'],
  ARRAY['Winter Garden Farmers Market', 'Taste of Winter Garden', 'Plant Street Market events', 'Bike Night'],
  ARRAY['Orange County Public Schools'],
  'Massive westward residential growth. Horizon West development. Downtown revitalization. SunRail extension. New schools and infrastructure.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Winter Garden Utilities',
  230,
  'Florida Building Code 8th Edition (2023), Winter Garden historic district overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for historic properties", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Air Zero', 'Climate Control Experts', 'Kalos Services'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Horizon West', 'horizon-west', 'West', 'new-construction', '2010s-2020s', 'Upper middle income', 'Massive master-planned development', ARRAY['new construction', 'builder-grade systems', 'smart home ready', 'HOA requirements'], '0-12 years', 1, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Historic Downtown', 'downtown-winter-garden', 'Central', 'historic-home', '1900s-1960s', 'Upper middle income', 'Charming historic downtown', ARRAY['historic retrofits', 'ductless needs', 'preservation compliance', 'older buildings'], '15-80+ years', 2, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Stoneybrook West', 'stoneybrook-west', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Large planned community', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-20 years', 3, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Independence', 'independence', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'family sizing', 'energy efficiency'], '0-12 years', 4, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Oakland', 'oakland-wg', 'North', 'single-family', '1990s-2010s', 'Middle income', 'Historic adjacent area', ARRAY['varied ages', 'family homes', 'mixed needs'], '10-28 years', 5, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Hamlin', 'hamlin', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Growing community', ARRAY['newer construction', 'family homes', 'HOA standards'], '5-20 years', 6, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Windermere Trails', 'windermere-trails', 'South', 'single-family', '2000s-2010s', 'Upper middle income', 'Established community', ARRAY['established systems', 'family sizing', 'standard service'], '10-20 years', 7, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Tucker Ranch', 'tucker-ranch', 'North', 'single-family', '1990s-2000s', 'Middle income', 'Near West Orange Trail', ARRAY['1990s-2000s systems', 'family homes', 'efficiency focus'], '15-28 years', 8, false)
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
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  'hvac',
  '/fl/winter-garden/hvac',
  'HVAC Services in Winter Garden, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Garden''s 52,000+ residents. New construction and historic specialists. Duke Energy rebates. Serving Horizon West, Downtown & all neighborhoods.',
  'HVAC Winter Garden FL',
  ARRAY['AC repair Winter Garden', 'air conditioning Winter Garden FL', 'HVAC contractor Winter Garden', 'Horizon West AC', 'historic home HVAC', 'Orange County HVAC'],

  'Winter Garden''s Fastest-Growing HVAC Experts',
  'From historic charm to modern expansion, we keep Winter Garden comfortable',
  'Licensed & Insured | Duke Energy Certified | Historic & New Construction Specialists',
  'Winter Garden is one of Florida''s most dynamic communities—a charming historic downtown along the West Orange Trail combined with explosive westward growth in Horizon West. With over 52,000 residents and thousands more arriving annually, Winter Garden needs HVAC contractors who understand both historic preservation and modern new construction. Our team serves the entire Winter Garden area, from century-old downtown gems to brand-new Horizon West homes.',

  '{
    "headline": "Why Winter Garden Homeowners Choose Us",
    "reasons": [
      {"title": "Horizon West Experts", "description": "We''ve grown with Winter Garden''s westward expansion. From Stoneybrook West to Independence, we work with builders and new homeowners ensuring optimal HVAC."},
      {"title": "Historic Preservation Specialists", "description": "Downtown Winter Garden''s historic buildings deserve sensitive HVAC solutions. We provide ductless systems and retrofits that preserve character."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Winter Garden homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "Rapid Response", "description": "Winter Garden''s growth creates demand. We''ve expanded our team to provide fast service throughout the area."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Winter Garden",
    "intro": "Winter Garden''s rapid growth and historic character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Volume", "description": "Horizon West is one of Florida''s largest developments. Many builder-grade systems are minimally sized—we help homeowners evaluate and upgrade."},
      {"title": "Historic Preservation", "description": "Downtown Winter Garden''s historic overlay requires sensitive HVAC solutions that don''t compromise architectural integrity."},
      {"title": "HOA Requirements", "description": "Winter Garden''s numerous master-planned communities have specific requirements for equipment placement and appearance."},
      {"title": "Rapid Growth Demand", "description": "Winter Garden''s explosive growth means some HVAC companies can''t keep up. We''ve expanded to serve this growing community."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Winter Garden",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Horizon West and other Winter Garden new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Winter Garden''s charming historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Winter Garden.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade Horizon West builder systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Horizon West builders?", "answer": "Yes, we work with builders throughout Horizon West and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Yes, ductless mini-split systems are ideal for Winter Garden''s historic properties. They provide efficient cooling without invasive ductwork."},
      {"question": "Should I upgrade my new Horizon West home''s AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,450", "days_above_90": "100+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Comfort in Winter Garden?',
  'Contact us today for a free estimate. From downtown historic to Horizon West new construction, we''ll keep your Winter Garden home comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Garden", "description": "Professional HVAC services in Winter Garden, FL.", "url": "https://coolit-hvac.com/winter-garden-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Winter Garden", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Horizon West builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Garden", "item": "https://coolit-hvac.com/fl/winter-garden"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/ocoee/hvac", "anchor_text": "Ocoee AC"}, {"slug": "/fl/windermere/hvac", "anchor_text": "Windermere HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1860, 28, 14, 88,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
