-- ============================================
-- Lakewood Ranch, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  'Lakewood Ranch', 'lakewood-ranch', 'Florida', 'FL', 'Manatee', 'manatee-county',
  27.4042, -82.4015,
  ARRAY['34202', '34211', '34240'],
  'North Port-Sarasota-Bradenton',
  ARRAY['3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d']::uuid[],
  true, 92
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
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  NOW(),
  47000, 'Lakewood Ranch CDP 2023',
  98547, 485000, 78.6,
  ARRAY['single-family', 'new-construction', 'golf-community', 'townhouse'],
  '{"2000s": 30, "2010s": 45, "2020s": 25}'::jsonb,
  90, 55, 73, 3400, 92, 53.8, 'moderate',
  'America''s top-selling master-planned community. Spanning Manatee and Sarasota counties. New urbanism design. Golf courses, trails, and amenities. Moderate inland hurricane risk.',
  ARRAY['Lakewood Ranch Medical Center', 'Manatee County Public Schools', 'Sarasota County Public Schools', 'Lakewood Ranch businesses', 'Premier Sports Campus', 'Corporate offices'],
  ARRAY['Main Street', 'Waterside Place', 'Premier Sports Campus', 'Lakewood Ranch Golf & Country Club', 'Lake Club', 'Polo fields', 'Trail system'],
  ARRAY['Lakewood Ranch Farmers Market', 'Main Street events', 'Community festivals', 'Sports tournaments'],
  ARRAY['Manatee County Public Schools', 'Sarasota County Public Schools'],
  'Massive ongoing expansion. Waterside development. New village centers. Corporate headquarters recruitment. Sports complex expansion. Infrastructure growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'Lakewood Ranch Utilities / County systems',
  215,
  'Florida Building Code 8th Edition (2023), Lakewood Ranch design standards',
  '{"hvac_replacement": "Permit required", "architectural_review": "Community design standards apply", "new_construction": "Energy efficiency requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Today', 'Gator Air Conditioning', 'Air Comfort', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "Lakewood Ranch CDP ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Lakewood Ranch Country Club', 'country-club', 'North', 'golf-community', '2000s-2020s', 'Upper income', 'Premier golf and country club', ARRAY['golf course humidity', 'premium systems', 'multi-zone estates', 'luxury demands'], '5-20 years', 1, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Waterside Place', 'waterside-place', 'West', 'new-construction', '2010s-2020s', 'Upper income', 'Newest luxury village', ARRAY['brand new systems', 'smart home integration', 'HOA standards', 'premium equipment'], '0-12 years', 2, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Main Street District', 'main-street', 'Central', 'mixed', '2000s-2020s', 'Upper middle income', 'New urbanism town center', ARRAY['mixed-use buildings', 'condo systems', 'commercial HVAC', 'varied needs'], '5-20 years', 3, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Cresswind', 'cresswind', 'South', 'single-family', '2010s-2020s', 'Upper middle income', '55+ active adult community', ARRAY['single-level systems', 'efficiency focus', 'accessibility', 'HOA requirements'], '5-12 years', 4, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Esplanade', 'esplanade', 'East', 'single-family', '2010s-2020s', 'Upper income', 'Gated golf community', ARRAY['golf course adjacent', 'premium systems', 'HOA compliance', 'luxury demands'], '5-12 years', 5, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Del Webb Lakewood Ranch', 'del-webb', 'Northeast', 'single-family', '2010s-2020s', 'Upper middle income', 'Active adult lifestyle', ARRAY['55+ design', 'energy efficiency', 'accessibility needs', 'newer systems'], '5-12 years', 6, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Lake Club', 'lake-club', 'Central', 'single-family', '2000s-2010s', 'Upper middle income', 'Established LWR village', ARRAY['established systems', 'family homes', 'HOA standards'], '10-20 years', 7, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Edgewater', 'edgewater', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Family-oriented village', ARRAY['newer construction', 'family sizing', 'smart systems'], '5-12 years', 8, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Azario', 'azario', 'South', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer neighborhood', ARRAY['new construction', 'builder-grade upgrades', 'HOA compliance'], '5-10 years', 9, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Summerfield', 'summerfield', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Original LWR village', ARRAY['first phase homes', 'system upgrades', 'established community'], '12-22 years', 10, false)
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
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  'hvac',
  '/fl/lakewood-ranch/hvac',
  'HVAC Services in Lakewood Ranch, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lakewood Ranch''s 47,000+ residents. New construction and golf community specialists. FPL rebates. Serving Waterside, Main Street, Country Club & all villages.',
  'HVAC Lakewood Ranch FL',
  ARRAY['AC repair Lakewood Ranch', 'air conditioning Lakewood Ranch FL', 'HVAC contractor Lakewood Ranch', 'new construction AC', 'golf community HVAC', 'Main Street Lakewood Ranch AC'],

  'Lakewood Ranch''s Premier HVAC Experts',
  'Growing with America''s #1 master-planned community',
  'Licensed & Insured | FPL Certified | New Construction & Golf Community Specialists',
  'Lakewood Ranch—America''s top-selling master-planned community—represents the pinnacle of Florida living. With nearly 47,000 residents across pristine villages from Waterside Place to the Country Club, this dynamic community demands HVAC service matching its premium standards. From brand-new construction to established villages, our team has grown alongside Lakewood Ranch, delivering expert service throughout this exceptional community.',

  '{
    "headline": "Why Lakewood Ranch Residents Choose Us",
    "reasons": [
      {"title": "Master-Planned Community Experts", "description": "We''ve grown with Lakewood Ranch, working throughout all villages from original Summerfield to newest Waterside. We understand the community''s standards and requirements."},
      {"title": "New Construction Specialists", "description": "Lakewood Ranch is constantly expanding. We work with builders and help new homeowners evaluate and optimize their HVAC systems from day one."},
      {"title": "Golf Community Experience", "description": "The Country Club, Esplanade, and golf-adjacent properties require premium service. We deliver equipment and expertise matching these properties."},
      {"title": "HOA Compliance Experts", "description": "Every Lakewood Ranch village has architectural standards. We ensure all installations meet community design requirements."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Lakewood Ranch",
    "intro": "Lakewood Ranch''s premium standards and growth create specific HVAC needs:",
    "challenges": [
      {"title": "Design Standards Compliance", "description": "Lakewood Ranch communities have strict architectural review. Equipment placement, appearance, and noise levels must meet community standards."},
      {"title": "Golf Course Humidity", "description": "Country Club, Esplanade, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Builder-Grade Evaluation", "description": "Many new Lakewood Ranch homes have builder-grade systems. We help homeowners evaluate whether upgrades will improve comfort and efficiency."},
      {"title": "Smart Home Integration", "description": "Lakewood Ranch homes increasingly feature sophisticated automation. We integrate HVAC seamlessly with smart home systems."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Lakewood Ranch",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Lakewood Ranch''s newest homes and villages.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Country Club, Esplanade, and golf properties.", "features": ["Premium equipment", "HOA compliance", "Humidity control", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout all Lakewood Ranch villages.", "features": ["Same-day service", "All brands", "90-day warranty", "Community standards"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with FPL rebate assistance and HOA compliance.", "features": ["FPL rebates", "Design approval", "10-year warranty", "Financing available"]},
      {"name": "Smart Home Integration", "slug": "smart-home", "description": "Seamless HVAC integration with your smart home systems.", "features": ["System compatibility", "Voice control", "Remote monitoring", "Automation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "System optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Lakewood Ranch builders?", "answer": "Yes, we work with builders throughout Lakewood Ranch villages and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Can you ensure my installation meets community standards?", "answer": "Absolutely. We''re familiar with Lakewood Ranch architectural standards and ensure all equipment placement and appearance meets community requirements."},
      {"question": "Should I upgrade my builder-grade AC system?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort. We provide honest assessments."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Lakewood Ranch residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "73%", "cooling_degree_days": "3,400", "days_above_90": "92+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Premium Comfort in Lakewood Ranch?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of America''s #1 master-planned community with FPL rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Lakewood Ranch", "description": "Premium HVAC services for Lakewood Ranch, FL.", "url": "https://coolit-hvac.com/lakewood-ranch-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Lakewood Ranch", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Lakewood Ranch builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Lakewood Ranch", "item": "https://coolit-hvac.com/fl/lakewood-ranch"}]}'::jsonb,

  '/fl/manatee-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/bradenton/hvac", "anchor_text": "Bradenton AC"}, {"slug": "/fl/university-park/hvac", "anchor_text": "University Park HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}]'::jsonb,

  1920, 30, 16, 92,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
