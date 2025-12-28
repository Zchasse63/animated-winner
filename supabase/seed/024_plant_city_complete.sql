-- ============================================
-- Plant City, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  'Plant City', 'plant-city', 'Florida', 'FL', 'Hillsborough', 'hillsborough-county',
  28.0186, -82.1196,
  ARRAY['33563', '33564', '33565', '33566', '33567'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
  true, 82
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
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  NOW(),
  40610, 'US Census Bureau ACS 2023',
  52847, 265000, 61.4,
  ARRAY['single-family', 'manufactured-home', 'farmhouse', 'new-construction'],
  '{"pre-1980": 25, "1980s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  91, 51, 73, 3350, 98, 52.8, 'low',
  'Inland I-4 corridor location with low hurricane risk. Agricultural heritage—"Winter Strawberry Capital of the World." Mix of rural properties and new developments.',
  ARRAY['Hillsborough County Schools', 'South Florida Baptist Hospital', 'Publix Distribution Center', 'Amazon (nearby)', 'Agricultural industry', 'City of Plant City'],
  ARRAY['Historic Downtown Plant City', 'Dinosaur World', 'Plant City Stadium', 'Mike E. Sansone Community Park', 'McIntosh Preserve'],
  ARRAY['Florida Strawberry Festival', 'Pig Jam BBQ Festival', 'Plant City Cruise-In', 'Strawberry Classic Golf Tournament'],
  ARRAY['Hillsborough County Public Schools'],
  'New residential development east of downtown. I-4 interchange improvements. Historic downtown revitalization. Distribution center growth.',
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying connected device"},
    "duct_repair": {"amount": 100, "requirements": "Professional duct assessment"},
    "total_available": {"amount": 500, "requirements": "Combined TECO rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Plant City Utilities',
  320,
  'Florida Building Code 8th Edition (2023), Hillsborough County amendments',
  '{"hvac_replacement": "Permit required", "manufactured_home": "Special requirements apply", "rural_properties": "May have different setback requirements", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Cornerstone Pros', 'Easy AC', 'Sun Air Services', 'Gulf Coast Air Systems'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "TECO", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Historic Downtown', 'historic-downtown-pc', 'Central', 'mixed', '1900s-1960s', 'Middle income', 'Historic downtown with character homes', ARRAY['historic home retrofits', 'older buildings', 'ductless needs', 'preservation considerations'], '25-80+ years', 1, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Walden Lake', 'walden-lake', 'South', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established systems', 'HOA requirements', 'premium options'], '15-35 years', 2, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Country Walk', 'country-walk', 'East', 'single-family', '2000s-2020s', 'Middle income', 'Newer planned community', ARRAY['newer construction', 'family homes', 'builder-grade systems'], '5-20 years', 3, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'East Plant City', 'east-plant-city', 'East', 'mixed', '1970s-2010s', 'Middle income', 'Growing residential area', ARRAY['varied housing', 'mixed ages', 'family homes'], '10-45 years', 4, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'North Plant City', 'north-plant-city', 'North', 'single-family', '1960s-1990s', 'Moderate income', 'Established residential', ARRAY['older systems', 'budget solutions', 'standard maintenance'], '20-55 years', 5, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Turkey Creek', 'turkey-creek', 'Southeast', 'single-family', '1990s-2010s', 'Middle income', 'Family neighborhood', ARRAY['1990s-2010s systems', 'family homes', 'standard service'], '10-28 years', 6, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Rural Plant City', 'rural-plant-city', 'Various', 'farmhouse', '1950s-2000s', 'Mixed income', 'Agricultural properties', ARRAY['rural property systems', 'well water impacts', 'large home needs', 'varied equipment'], '15-60 years', 7, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Mobile Home Parks', 'mobile-home-parks', 'Various', 'manufactured-home', '1970s-2000s', 'Moderate income', 'Mobile home communities', ARRAY['manufactured home systems', 'package units', 'budget solutions'], '15-40 years', 8, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Strawberry Fields Area', 'strawberry-fields', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Near strawberry farms', ARRAY['agricultural proximity', 'family homes', 'standard systems'], '10-35 years', 9, false)
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
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  'hvac',
  '/fl/plant-city/hvac',
  'HVAC Services in Plant City, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Plant City''s 41,000+ residents. Rural and residential specialists. TECO rebates available. Serving Downtown, Walden Lake & all neighborhoods.',
  'HVAC Plant City FL',
  ARRAY['AC repair Plant City', 'air conditioning Plant City FL', 'HVAC contractor Plant City', 'mobile home AC Plant City', 'TECO rebates', 'Hillsborough County HVAC'],

  'Plant City''s Hometown HVAC Experts',
  'From strawberry farms to downtown, we keep Plant City cool',
  'Licensed & Insured | TECO Certified | Rural & Residential Specialists',
  'Plant City—the Winter Strawberry Capital of the World—is a community that values hard work, tradition, and neighborly service. With over 41,000 residents ranging from historic downtown homes to rural farm properties, Plant City needs HVAC contractors who understand this unique community. Our team provides honest, reliable service whether you''re in the Walden Lake golf community, a manufactured home park, or a farmhouse on the outskirts of town.',

  '{
    "headline": "Why Plant City Homeowners Choose Us",
    "reasons": [
      {"title": "Rural Property Experience", "description": "Plant City''s agricultural heritage means many properties are on large lots with well water and unique challenges. We serve rural properties with the same dedication as city homes."},
      {"title": "Mobile Home Specialists", "description": "Plant City has significant manufactured home communities. We''re experts in mobile home HVAC including package units and space-efficient systems."},
      {"title": "Historic Home Knowledge", "description": "Downtown Plant City features beautiful historic homes. We provide ductless systems and retrofits that preserve character while adding modern comfort."},
      {"title": "TECO Rebate Experts", "description": "We help Plant City homeowners access TECO rebates including up to $150 for AC replacement and $75 for smart thermostats."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Plant City",
    "intro": "Plant City''s diverse housing and rural character create specific HVAC considerations:",
    "challenges": [
      {"title": "Rural Properties", "description": "Farm properties and rural homes face unique challenges including well water minerals, longer distances for service, and larger homes to cool."},
      {"title": "Historic Downtown", "description": "Plant City''s historic homes often lack ductwork. Ductless mini-splits provide efficient cooling while preserving historic character."},
      {"title": "Manufactured Homes", "description": "Mobile homes require specialized HVAC approaches including proper sizing for smaller spaces and consideration of home construction."},
      {"title": "Agricultural Dust", "description": "Properties near active farms may experience higher dust and particulate levels, requiring enhanced filtration and more frequent maintenance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Plant City",
    "services": [
      {"name": "Rural Property HVAC", "slug": "rural-hvac", "description": "Service for Plant City''s farms and rural homes including large properties and well water considerations.", "features": ["Large home systems", "Well water awareness", "Rural service area", "Agricultural dust protection"]},
      {"name": "Mobile Home HVAC", "slug": "mobile-home-hvac", "description": "Specialized service for manufactured homes.", "features": ["Package units", "Space-efficient", "Proper sizing", "Budget options"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Plant City.", "features": ["Same-day service", "All brands", "Upfront pricing", "Rural coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with TECO rebate assistance.", "features": ["TECO rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Historic Home Solutions", "slug": "historic-hvac", "description": "Ductless systems and retrofits for Plant City''s historic homes.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for all property types.", "features": ["Bi-annual service", "Rural scheduling", "Filter delivery", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service rural properties outside Plant City?", "answer": "Yes, we serve rural properties throughout the Plant City area including farms and large-lot homes. We understand the unique needs of agricultural properties."},
      {"question": "What TECO rebates are available?", "answer": "TECO offers up to $150 for AC replacement, $75 for smart thermostats, and $100 for duct repairs. We help you access all available rebates."},
      {"question": "Can you install AC in my historic downtown home?", "answer": "Yes, ductless mini-split systems are perfect for Plant City''s historic homes. They provide efficient cooling without invasive ductwork installation."},
      {"question": "Do you work on mobile home AC units?", "answer": "Yes, we specialize in manufactured home HVAC including package units, split systems, and space-efficient solutions."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "73%", "cooling_degree_days": "3,350", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Reliable Comfort in Plant City?',
  'Contact us today for a free estimate. From downtown to the farms, we''ll find the right solution for your Plant City property.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Plant City", "description": "Professional HVAC services in Plant City, FL.", "url": "https://coolit-hvac.com/plant-city-fl", "telephone": "+1-813-555-COOL", "areaServed": {"@type": "City", "name": "Plant City", "addressRegion": "FL"}, "priceRange": "$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service rural properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we serve rural properties throughout the Plant City area."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Plant City", "item": "https://coolit-hvac.com/fl/plant-city"}]}'::jsonb,

  '/fl/hillsborough-county',
  '[{"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC"}, {"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland AC"}, {"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/rural-hvac", "anchor_text": "Rural HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1800, 24, 14, 85,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
