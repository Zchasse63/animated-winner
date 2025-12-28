-- ============================================
-- North Port, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  'North Port', 'north-port', 'Florida', 'FL', 'Sarasota', 'sarasota-county',
  27.0442, -82.2359,
  ARRAY['34286', '34287', '34288', '34289', '34291'],
  'North Port-Sarasota-Bradenton',
  ARRAY['1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f']::uuid[],
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
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  NOW(),
  75303, 'US Census Bureau ACS 2023',
  59842, 295000, 79.2,
  ARRAY['single-family', 'new-construction', 'manufactured-home', 'golf-community'],
  '{"pre-1990": 15, "1990s-2000s": 35, "2010s": 30, "2020s": 20}'::jsonb,
  91, 55, 74, 3500, 98, 54.1, 'moderate',
  'Fast-growing suburb south of Sarasota. Affordable alternative to Sarasota. Mix of retirees and families. Continued new development. Moderate hurricane risk.',
  ARRAY['Sarasota County Public Schools', 'Warm Mineral Springs', 'North Port City Government', 'Healthcare', 'Retail and service industry'],
  ARRAY['Warm Mineral Springs', 'Myakkahatchee Creek Environmental Park', 'North Port Aquatic Center', 'North Port Performing Arts Center'],
  ARRAY['North Port Art Festival', 'Movies in the Park', 'Community events'],
  ARRAY['Sarasota County Public Schools'],
  'Continued residential growth. Wellen Park development. New schools and infrastructure. Commercial development along Tamiami Trail.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of North Port Utilities',
  250,
  'Florida Building Code 8th Edition (2023), Sarasota County amendments',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Cool Today', 'Air Comfort', 'Gator Air Conditioning', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Wellen Park', 'wellen-park', 'South', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'builder-grade systems', 'smart home ready', 'HOA requirements'], '0-12 years', 1, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Heron Creek', 'heron-creek', 'Central', 'golf-community', '2000s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'HOA requirements'], '10-20 years', 2, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'North Port Estates', 'north-port-estates', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['varied system ages', 'family homes', 'standard service'], '15-35 years', 3, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Myakka Valley Ranches', 'myakka-valley', 'East', 'single-family', '1990s-2010s', 'Middle income', 'Rural-suburban area', ARRAY['larger lots', 'well water', 'family homes'], '10-28 years', 4, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Warm Mineral Springs Area', 'warm-mineral-springs', 'South', 'mixed', '1970s-2000s', 'Moderate income', 'Near mineral springs', ARRAY['varied housing', 'mixed ages', 'budget to mid-range'], '15-45 years', 5, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Cocoplum', 'cocoplum-np', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer community', ARRAY['newer systems', 'family homes', 'HOA standards'], '5-20 years', 6, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Port Charlotte Border', 'pc-border', 'North', 'mixed', '1980s-2010s', 'Middle income', 'Near Port Charlotte', ARRAY['mixed housing', 'varied ages', 'standard needs'], '10-35 years', 7, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Toledo Blade', 'toledo-blade', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established area', ARRAY['older systems', 'family homes', 'efficiency focus'], '15-35 years', 8, false)
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
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  'hvac',
  '/fl/north-port/hvac',
  'HVAC Services in North Port, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for North Port''s 75,000+ residents. New construction and family specialists. FPL rebates. Serving Wellen Park, Heron Creek & all neighborhoods.',
  'HVAC North Port FL',
  ARRAY['AC repair North Port', 'air conditioning North Port FL', 'HVAC contractor North Port', 'Wellen Park AC', 'FPL rebates', 'Sarasota County HVAC'],

  'North Port''s Growing Community HVAC Experts',
  'Family-focused service for Southwest Florida''s fastest growth',
  'Licensed & Insured | FPL Certified | New Construction Specialists',
  'North Port is one of Florida''s fastest-growing cities, attracting families and retirees seeking affordable Sarasota County living. With over 75,000 residents and extensive new development at Wellen Park and beyond, reliable HVAC is essential. Our team provides expert service from brand-new construction to established neighborhoods, helping you maximize FPL rebates while staying comfortable.',

  '{
    "headline": "Why North Port Families Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Wellen Park and other developments are transforming North Port. We work with builders and new homeowners ensuring optimal HVAC from day one."},
      {"title": "Family-Focused Service", "description": "North Port is a family community. We provide honest pricing, respectful service, and solutions that keep your family comfortable."},
      {"title": "FPL Rebate Certified", "description": "We help North Port homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."},
      {"title": "Affordable Quality", "description": "North Port offers value, and so do we. Quality HVAC service at fair prices with financing options available."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to North Port",
    "intro": "North Port''s rapid growth and character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Volume", "description": "Wellen Park is one of Florida''s largest developments. Many builder-grade systems are minimally sized—we help homeowners evaluate and upgrade."},
      {"title": "HOA Requirements", "description": "North Port''s master-planned communities have equipment placement and appearance requirements we navigate daily."},
      {"title": "Mixed Housing Stock", "description": "From 1980s homes to 2020s construction, North Port requires varied approaches for different property types."},
      {"title": "Rapid Growth Demand", "description": "North Port''s explosive growth means some companies can''t keep up. We''ve expanded to serve this growing community."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in North Port",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Wellen Park and other North Port new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout North Port.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Service for Heron Creek and other golf communities.", "features": ["HOA compliance", "Golf course humidity", "Premium options", "Standard service"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for all property types.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Wellen Park builders?", "answer": "Yes, we work with builders throughout North Port and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Should I upgrade my new home''s builder-grade AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "Do you offer financing?", "answer": "Yes, we offer multiple financing options to make AC replacement affordable for North Port families."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "98+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Comfort in North Port?',
  'Contact us today for a free estimate. We''ll help you access FPL rebates and keep your North Port family comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - North Port", "description": "Professional HVAC services in North Port, FL.", "url": "https://coolit-hvac.com/north-port-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "North Port", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Wellen Park builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "North Port", "item": "https://coolit-hvac.com/fl/north-port"}]}'::jsonb,

  '/fl/sarasota-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/venice/hvac", "anchor_text": "Venice AC"}, {"slug": "/fl/port-charlotte/hvac", "anchor_text": "Port Charlotte HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1780, 24, 14, 85,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
