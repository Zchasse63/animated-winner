-- ============================================
-- Clermont, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  'Clermont', 'clermont', 'Florida', 'FL', 'Lake', 'lake-county',
  28.5494, -81.7729,
  ARRAY['34711', '34712', '34714', '34715'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d', 'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d']::uuid[],
  true, 75
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
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  NOW(),
  43021, 'US Census Bureau ACS 2023',
  72458, 385000, 71.3,
  ARRAY['single-family', 'new-construction', 'lake-community', 'retirement'],
  '{"pre-1990": 15, "1990s-2000s": 30, "2010s": 35, "2020s": 20}'::jsonb,
  92, 52, 72, 3600, 102, 51.2, 'moderate',
  'Choice of Champions with unique rolling hills. National Training Center for triathlons. Chain of Lakes region. Rapid growth west of Orlando. Inland moderate hurricane risk.',
  ARRAY['South Lake Hospital', 'Lake County Public Schools', 'City of Clermont', 'National Training Center', 'Retail and hospitality', 'Theme park commuters'],
  ARRAY['National Training Center', 'Lake Minneola', 'Historic downtown', 'Waterfront Park', 'Citrus Tower', 'South Lake Trail', 'Rolling hills'],
  ARRAY['Clermont Triathlon', 'Pig on the Pond BBQ Festival', 'Harvest Festival', 'Fourth of July celebration', 'Farmers Market'],
  ARRAY['Lake County Public Schools'],
  'Massive residential expansion. New downtown development. Medical district growth. National Training Center expansion. Theme park proximity driving growth.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"},
    "heat_pump": {"amount": 100, "requirements": "ENERGY STAR certified heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Clermont Utilities',
  275,
  'Florida Building Code 8th Edition (2023), Lake County requirements',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required", "new_construction": "Load calculation and energy compliance required"}'::jsonb,
  'high',
  ARRAY['Air Necessities', 'Fenix Air Conditioning', 'Super Heat & Air', 'Arctic Air Solutions', 'Cool Breeze HVAC'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Lake Minneola Shores', 'lake-minneola', 'Central', 'lake-community', '1990s-2010s', 'Upper middle income', 'Lakefront living on Lake Minneola', ARRAY['lake humidity', 'waterfront properties', 'premium systems', 'boat houses'], '10-30 years', 1, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Historic Downtown', 'historic-downtown', 'Central', 'mixed', '1920s-2000s', 'Middle income', 'Revitalized historic district', ARRAY['older buildings', 'mixed use', 'varied systems', 'renovations'], '15-95 years', 2, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Legends Golf & Country Club', 'legends', 'West', 'golf-community', '2000s-2020s', 'Upper income', 'Gated golf community', ARRAY['golf course humidity', 'premium demands', 'HOA standards', 'luxury homes'], '5-22 years', 3, true),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Sawgrass Bay', 'sawgrass-bay', 'Southwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Family-oriented community', ARRAY['newer construction', 'family sizing', 'HOA requirements'], '5-22 years', 4, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Waterbrooke', 'waterbrooke', 'West', 'new-construction', '2010s-2020s', 'Upper middle income', 'Newer development', ARRAY['new builder systems', 'smart home ready', 'HOA compliance'], '2-12 years', 5, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Pine Ridge', 'pine-ridge', 'North', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 6, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Johns Lake Pointe', 'johns-lake', 'South', 'lake-community', '2000s-2020s', 'Upper middle income', 'Johns Lake waterfront', ARRAY['lake properties', 'humidity control', 'waterfront exposure'], '5-22 years', 7, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Lake Ridge', 'lake-ridge', 'East', 'single-family', '1990s-2010s', 'Middle income', 'Affordable family area', ARRAY['varied ages', 'standard service', 'budget-conscious'], '12-32 years', 8, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Hammock Ridge', 'hammock-ridge', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer family community', ARRAY['newer systems', 'family homes', 'standard needs'], '5-12 years', 9, false),
  ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'City Center', 'city-center', 'Central', 'mixed', '2010s-2020s', 'Upper middle income', 'Mixed-use downtown revival', ARRAY['condos', 'retail spaces', 'varied HVAC', 'modern systems'], '5-12 years', 10, false)
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
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c',
  'hvac',
  '/fl/clermont/hvac',
  'HVAC Services in Clermont, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Clermont''s 43,000+ residents. Hills & lakes specialists. Duke Energy rebates. Serving Lake Minneola, Legends, Historic Downtown & all neighborhoods.',
  'HVAC Clermont FL',
  ARRAY['AC repair Clermont', 'air conditioning Clermont FL', 'HVAC contractor Clermont', 'Lake Minneola AC', 'Choice of Champions HVAC', 'Duke Energy rebates'],

  'Clermont''s Choice HVAC Experts',
  'Hills, lakes, and champion-level comfort solutions',
  'Licensed & Insured | Duke Energy Certified | Lake Community Specialists',
  'Clermont—the "Choice of Champions"—offers unique rolling hills, pristine Chain of Lakes, and a thriving community west of Orlando. With over 43,000 residents from lakefront estates to the revitalized historic downtown, Clermont''s distinctive topography and rapid growth create specific HVAC demands. Our team understands this special market, delivering expert service from Lake Minneola to new developments like Waterbrooke.',

  '{
    "headline": "Why Clermont Homeowners Choose Us",
    "reasons": [
      {"title": "Hills & Elevation Expertise", "description": "Clermont''s unique Florida hills create elevation differences affecting HVAC sizing and ductwork. We understand these local challenges other contractors miss."},
      {"title": "Lake Community Specialists", "description": "Lake Minneola, Johns Lake, and waterfront properties face enhanced humidity. We provide lake-specific dehumidification and moisture control solutions."},
      {"title": "Duke Energy Rebate Certified", "description": "Unlike coastal Florida, Clermont has Duke Energy. We maximize your Duke Energy rebates including $125 for AC replacement and $100 for heat pumps."},
      {"title": "Growth & Development Experience", "description": "Clermont is booming. We work with builders and help new residents evaluate systems from Waterbrooke to Sawgrass Bay."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Clermont",
    "intro": "Clermont''s distinctive character creates specific HVAC considerations:",
    "challenges": [
      {"title": "Rolling Hills & Elevation", "description": "Clermont''s hills are unique in flat Florida. Elevation differences affect load calculations, system sizing, and ductwork design requiring local expertise."},
      {"title": "Chain of Lakes Humidity", "description": "Lake Minneola, Johns Lake, and other waterfront properties experience elevated humidity from lakefront exposure requiring enhanced dehumidification."},
      {"title": "Rapid Growth & New Construction", "description": "Clermont is one of Central Florida''s fastest-growing cities. Many builder-grade systems need evaluation and optimization for Florida''s demanding climate."},
      {"title": "Duke Energy Service Territory", "description": "Unlike most of Florida, Clermont has Duke Energy (not FPL). Different rebate programs and requirements apply."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Clermont",
    "services": [
      {"name": "Lake Community HVAC", "slug": "lake-hvac", "description": "Specialized solutions for Lake Minneola and Johns Lake waterfront properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Humidity control", "Lake-specific expertise"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Clermont''s booming new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home integration"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Clermont''s hills and lakes.", "features": ["Same-day service", "All brands", "90-day warranty", "Local expertise"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Elevation expertise", "10-year warranty", "Financing available"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for Legends and golf course properties.", "features": ["HOA compliance", "Golf course humidity", "Premium systems", "Luxury standards"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for Clermont''s unique climate.", "features": ["Bi-annual service", "Priority scheduling", "Duke Energy optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How do Clermont''s hills affect my HVAC system?", "answer": "Clermont''s unique elevation changes affect load calculations and ductwork design. Homes on hills may need different sizing than similar homes at lower elevations. We factor in these local considerations."},
      {"question": "Do lakefront properties need special HVAC attention?", "answer": "Yes, Lake Minneola and Johns Lake waterfront homes experience elevated humidity from lake exposure. Enhanced dehumidification and proper moisture control are essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available in Clermont?", "answer": "Duke Energy offers $125 for high-efficiency AC replacement, $100 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Clermont residents."},
      {"question": "Should I upgrade my new home''s builder-grade system?", "answer": "Many Clermont builders install minimally-sized systems. If you experience humidity issues, hot spots, or high bills, an upgrade often significantly improves comfort and efficiency."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "72%", "cooling_degree_days": "3,600", "days_above_90": "102+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Champion-Level Comfort in Clermont?',
  'Contact us today for a consultation. From the hills to the lakes, we''ll deliver expert HVAC service with Duke Energy rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Clermont", "description": "Professional HVAC services for Clermont, FL specializing in hills and lake communities.", "url": "https://coolit-hvac.com/clermont-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "Clermont", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How do Clermont''s hills affect my HVAC system?", "acceptedAnswer": {"@type": "Answer", "text": "Clermont''s elevation changes affect load calculations and ductwork design requiring local expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Clermont", "item": "https://coolit-hvac.com/fl/clermont"}]}'::jsonb,

  '/fl/lake-county',
  '[{"slug": "/fl/winter-garden/hvac", "anchor_text": "Winter Garden HVAC"}, {"slug": "/fl/apopka/hvac", "anchor_text": "Apopka AC"}, {"slug": "/fl/leesburg/hvac", "anchor_text": "Leesburg HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/lake-hvac", "anchor_text": "Lake Community HVAC"}, {"slug": "/services/new-construction", "anchor_text": "New Construction"}]'::jsonb,

  1950, 28, 16, 90,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
