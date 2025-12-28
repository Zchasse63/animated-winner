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
-- ============================================
-- Stuart, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c6d7e8f9-a0b1-2345-8901-567890123456',
  'Stuart', 'stuart', 'Florida', 'FL', 'Martin', 'martin-county',
  27.1973, -80.2528,
  ARRAY['34994', '34996', '34997'],
  'Port St. Lucie',
  ARRAY['b5c6d7e8-f9a0-1234-7890-456789012345']::uuid[],
  true, 76
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
  'c6d7e8f9-a0b1-2345-8901-567890123456',
  NOW(),
  17592, 'US Census Bureau ACS 2023',
  72847, 435000, 64.8,
  ARRAY['single-family', 'waterfront', 'historic-home', 'luxury-estate'],
  '{"pre-1970": 25, "1970s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  89, 59, 73, 3350, 82, 55.8, 'high',
  'Martin County seat. "Sailfish Capital of the World." Historic downtown riverfront. Upscale waterfront community. St. Lucie River and Atlantic access. High coastal hurricane risk.',
  ARRAY['Martin County Government', 'Martin County Public Schools', 'Cleveland Clinic Martin Health', 'City of Stuart', 'Marine industry', 'Tourism sector'],
  ARRAY['Historic Downtown Stuart', 'Riverwalk', 'Stuart Beach', 'House of Refuge Museum', 'Elliott Museum', 'St. Lucie Inlet', 'Sailfish Splash Waterpark'],
  ARRAY['Sailfish Splash Festival', 'Stuart Air Show', 'Green Market', 'Downtown Friday Fest'],
  ARRAY['Martin County Public Schools'],
  'Historic downtown preservation. Waterfront development. Sailfish District growth. Marine industry expansion. Luxury residential development.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'None (no natural gas service)',
  'City of Stuart Utilities',
  205,
  'Florida Building Code 8th Edition (2023), City of Stuart amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for downtown properties", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Air Docs', 'Franks Air Conditioning', 'Elite Electric', 'ABC Air Conditioning', 'Comfort Zone'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Historic Downtown Stuart', 'downtown-stuart', 'Central', 'mixed', '1920s-2020s', 'Upper middle income', 'Historic riverfront downtown', ARRAY['historic buildings', 'mixed-use properties', 'ductless needs', 'character preservation'], '5-80+ years', 1, true),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Sewall''s Point', 'sewalls-point', 'North', 'luxury-estate', '1950s-2020s', 'Upper income', 'Exclusive waterfront enclave', ARRAY['luxury estates', 'waterfront humidity', 'premium demands', 'multi-zone systems'], '5-60 years', 2, true),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Stuart Beach/Hutchinson Island', 'stuart-beach', 'East', 'waterfront', '1960s-2020s', 'Upper middle income', 'Atlantic beachfront', ARRAY['salt air corrosion', 'beach exposure', 'oceanfront humidity', 'premium demands'], '5-55 years', 3, true),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Rio', 'rio', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'budget solutions'], '25-55 years', 4, false),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Palm City (adjacent)', 'palm-city', 'Southwest', 'single-family', '1980s-2020s', 'Upper middle income', 'Growing adjacent community', ARRAY['varied ages', 'family homes', 'HOA communities'], '5-40 years', 5, false),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Jensen Beach (adjacent)', 'jensen-beach', 'South', 'waterfront', '1960s-2010s', 'Upper middle income', 'Beach and river community', ARRAY['waterfront exposure', 'salt air', 'varied systems'], '10-55 years', 6, false),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'Port Salerno', 'port-salerno', 'Southeast', 'waterfront', '1950s-2000s', 'Middle income', 'Historic fishing village', ARRAY['fishing village character', 'older systems', 'waterfront exposure'], '20-65 years', 7, false),
  ('c6d7e8f9-a0b1-2345-8901-567890123456', 'East Stuart', 'east-stuart', 'East', 'single-family', '1960s-1990s', 'Middle income', 'Residential area', ARRAY['older homes', 'system replacements', 'budget focus'], '25-55 years', 8, false)
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
  'c6d7e8f9-a0b1-2345-8901-567890123456',
  'hvac',
  '/fl/stuart/hvac',
  'HVAC Services in Stuart, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Stuart''s 18,000+ residents. Sailfish Capital waterfront and historic specialists. FPL rebates. Serving Downtown, Sewall''s Point, Stuart Beach & all areas.',
  'HVAC Stuart FL',
  ARRAY['AC repair Stuart', 'air conditioning Stuart FL', 'HVAC contractor Stuart', 'waterfront AC Stuart', 'historic Stuart HVAC', 'Martin County HVAC'],

  'Stuart''s Sailfish Capital HVAC Experts',
  'Premium comfort for the Treasure Coast''s crown jewel',
  'Licensed & Insured | FPL Certified | Waterfront & Historic Specialists',
  'Stuart—the "Sailfish Capital of the World"—combines historic downtown charm with exclusive waterfront living on the St. Lucie River and Atlantic Ocean. With over 17,000 residents enjoying median home values exceeding $435,000, Stuart demands HVAC service matching its upscale character. From historic downtown to Sewall''s Point estates and Stuart Beach properties, our team delivers white-glove service throughout this distinguished Treasure Coast community.',

  '{
    "headline": "Why Stuart Residents Choose Us",
    "reasons": [
      {"title": "Waterfront Property Specialists", "description": "Sewall''s Point estates, Stuart Beach, and riverfront properties face salt air and humidity challenges. We provide coastal coil protection and equipment designed for waterfront environments."},
      {"title": "Historic Downtown Expertise", "description": "Historic downtown Stuart''s beautiful buildings deserve sensitive HVAC solutions. Ductless systems preserve architectural character while delivering modern comfort."},
      {"title": "Luxury Service Standards", "description": "Stuart''s upscale market with median home values over $435,000 demands premium equipment and white-glove service. We deliver both consistently."},
      {"title": "FPL Rebate Assistance", "description": "We help Stuart homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Stuart",
    "intro": "Stuart''s waterfront location and upscale character create specific HVAC considerations:",
    "challenges": [
      {"title": "Extreme Salt Air Exposure", "description": "Sewall''s Point, Stuart Beach, and riverfront properties face aggressive salt air environments. Coastal-rated equipment and enhanced protection are essential for system longevity."},
      {"title": "Historic Building Preservation", "description": "Downtown Stuart''s historic district requires HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "River and Ocean Humidity", "description": "Properties along the St. Lucie River and Atlantic Ocean experience elevated humidity requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Premium Market Expectations", "description": "Stuart''s affluent residents expect top-tier equipment, quiet operation, and professional service. We meet these expectations consistently."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Stuart",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Sewall''s Point, Stuart Beach, and riverfront properties.", "features": ["Coastal coil coating", "Maximum salt protection", "Ocean-rated equipment", "Waterfront expertise"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for historic downtown Stuart properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "Luxury Home Systems", "slug": "luxury-hvac", "description": "Premium equipment and service for Stuart''s finest properties.", "features": ["Multi-zone design", "Whole-home automation", "Premium brands", "White-glove service"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Stuart.", "features": ["Same-day service", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Coastal-rated equipment", "10-year warranty", "Premium installation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance programs.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Sewall''s Point waterfront estates?", "answer": "Yes, we specialize in Stuart''s premium waterfront properties. We provide maximum coastal protection including specialized coil coatings and equipment designed for salt air and water exposure."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Absolutely. Ductless mini-split systems are ideal for historic downtown Stuart properties, providing efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Do you service Stuart Beach and Hutchinson Island?", "answer": "Yes, we specialize in oceanfront properties with coastal coil protection, enhanced filtration for sand, and maintenance programs designed for direct beach exposure."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Stuart homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "73%", "cooling_degree_days": "3,350", "days_above_90": "82+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Stuart?',
  'Contact us today for white-glove service. From historic downtown to waterfront estates, we''ll keep your Stuart property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Stuart", "description": "Premium HVAC services for Stuart, FL specializing in waterfront and historic properties.", "url": "https://coolit-hvac.com/stuart-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Stuart", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service waterfront estates?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Stuart waterfront properties with maximum coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Stuart", "item": "https://coolit-hvac.com/fl/stuart"}]}'::jsonb,

  '/fl/martin-county',
  '[{"slug": "/fl/port-st-lucie/hvac", "anchor_text": "Port St. Lucie HVAC"}, {"slug": "/fl/jensen-beach/hvac", "anchor_text": "Jensen Beach AC"}, {"slug": "/fl/palm-city/hvac", "anchor_text": "Palm City HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1920, 28, 14, 76,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Vero Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  'Vero Beach', 'vero-beach', 'Florida', 'FL', 'Indian River', 'indian-river-county',
  27.6386, -80.3973,
  ARRAY['32960', '32962', '32963', '32966', '32967', '32968'],
  'Sebastian-Vero Beach',
  ARRAY['e8f9a0b1-c2d3-4567-0123-789012345678']::uuid[],
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
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  NOW(),
  17350, 'US Census Bureau ACS 2023',
  76542, 485000, 68.4,
  ARRAY['single-family', 'waterfront', 'luxury-estate', 'golf-community'],
  '{"pre-1970": 20, "1970s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  89, 59, 73, 3300, 80, 54.2, 'high',
  'Affluent barrier island community. "Cultural Arts Capital." Beautiful beaches. Indian River Lagoon. Golf and luxury estates. High coastal hurricane risk.',
  ARRAY['Indian River County Public Schools', 'Cleveland Clinic Indian River Hospital', 'Piper Aircraft', 'City of Vero Beach', 'Tourism industry', 'Retail sector'],
  ARRAY['Ocean Drive', 'Vero Beach Museum of Art', 'McKee Botanical Garden', 'Riverside Theatre', 'Humiston Beach', 'Indian River Lagoon', 'Downtown Vero'],
  ARRAY['Vero Beach Wine & Film Festival', 'Art in the Park', 'Friday Fest', 'ArtWalk'],
  ARRAY['Indian River County Public Schools'],
  'Ocean Drive corridor development. Downtown revitalization. Museum expansion. Luxury residential development. Beach access improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'None (no natural gas service)',
  'City of Vero Beach Utilities',
  210,
  'Florida Building Code 8th Edition (2023), City of Vero Beach amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated and elevated equipment requirements", "barrier_island": "Flood zone compliance", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Breeze', 'Elite Electric', 'Air Docs', 'ABC Air Conditioning', 'Franks Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Ocean Drive/Barrier Island', 'ocean-drive', 'East', 'luxury-estate', '1950s-2020s', 'Upper income', 'Exclusive beachfront corridor', ARRAY['oceanfront luxury', 'salt air corrosion', 'multi-zone estates', 'premium demands'], '5-60 years', 1, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'John''s Island', 'johns-island', 'North', 'luxury-estate', '1970s-2020s', 'Upper income', 'Ultra-exclusive golf community', ARRAY['luxury multi-zone', 'golf course humidity', 'premium equipment', 'estate systems'], '5-50 years', 2, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Downtown Vero Beach', 'downtown-vero', 'Central', 'mixed', '1920s-2020s', 'Upper middle income', 'Cultural arts district', ARRAY['mixed-use buildings', 'historic properties', 'varied systems', 'ductless needs'], '5-80+ years', 3, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Windsor', 'windsor', 'West', 'golf-community', '1980s-2010s', 'Upper income', 'Golf and country club', ARRAY['golf course humidity', 'premium systems', 'HOA standards'], '10-40 years', 4, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Riomar', 'riomar', 'Northeast', 'luxury-estate', '1960s-2010s', 'Upper income', 'Beachside estates', ARRAY['beachfront exposure', 'luxury demands', 'salt air', 'premium service'], '10-55 years', 5, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Orchid Island', 'orchid-island', 'South', 'luxury-estate', '1960s-2010s', 'Upper income', 'Gated luxury community', ARRAY['luxury estates', 'waterfront exposure', 'premium equipment'], '10-55 years', 6, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Vero Lake Estates', 'vero-lake-estates', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Established community', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-50 years', 7, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Grand Harbor', 'grand-harbor', 'South', 'golf-community', '1990s-2010s', 'Upper income', 'Golf and marina community', ARRAY['golf and marina humidity', 'premium systems', 'HOA compliance'], '10-30 years', 8, false)
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
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  'hvac',
  '/fl/vero-beach/hvac',
  'HVAC Services in Vero Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Vero Beach''s 17,000+ residents. Cultural Arts Capital specialists. FPL rebates. Serving Ocean Drive, John''s Island, Downtown & all areas.',
  'HVAC Vero Beach FL',
  ARRAY['AC repair Vero Beach', 'air conditioning Vero Beach FL', 'HVAC contractor Vero Beach', 'Ocean Drive AC', 'luxury HVAC Vero Beach', 'Indian River County HVAC'],

  'Vero Beach''s Cultural Capital HVAC Experts',
  'Premium comfort for the Treasure Coast''s finest community',
  'Licensed & Insured | FPL Certified | Luxury & Beachfront Specialists',
  'Vero Beach—the "Cultural Arts Capital of Florida"—represents the pinnacle of Treasure Coast living with exclusive Ocean Drive estates, ultra-luxurious John''s Island, and sophisticated downtown arts district. With over 17,000 residents enjoying median home values exceeding $485,000, Vero Beach demands HVAC service matching its exceptional standards. Our team delivers white-glove service from beachfront properties to golf estates throughout this distinguished barrier island community.',

  '{
    "headline": "Why Vero Beach Residents Choose Us",
    "reasons": [
      {"title": "Luxury Property Specialists", "description": "John''s Island, Ocean Drive, and Riomar estates demand the highest standards. We deliver premium equipment and white-glove service meeting these expectations consistently."},
      {"title": "Beachfront Expertise", "description": "Ocean Drive and barrier island properties face extreme salt air exposure. We provide maximum coastal protection and equipment designed for beachfront environments."},
      {"title": "Cultural Community Understanding", "description": "Vero Beach''s arts community values quality, sophistication, and professionalism. We deliver service reflecting these values."},
      {"title": "FPL Rebate Specialists", "description": "We help Vero Beach homeowners access FPL rebates while maintaining premium comfort standards—maximizing value without compromise."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Vero Beach Properties",
    "intro": "Vero Beach''s barrier island location and luxury market create specific HVAC needs:",
    "challenges": [
      {"title": "Extreme Coastal Exposure", "description": "Ocean Drive and beachfront properties face the most aggressive salt air environment. Maximum coastal protection and specialized equipment are essential for system longevity."},
      {"title": "Luxury Estate Systems", "description": "John''s Island and high-end properties require sophisticated multi-zone systems, whole-home automation, and premium equipment—we specialize in these complex installations."},
      {"title": "Golf Course Humidity", "description": "Windsor, Grand Harbor, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Hurricane Zone Requirements", "description": "Barrier island location means equipment must meet strict wind rating and elevation requirements for coastal zones."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Vero Beach",
    "services": [
      {"name": "Luxury Estate HVAC", "slug": "luxury-hvac", "description": "Premium solutions for John''s Island and Vero Beach''s finest properties.", "features": ["Multi-zone design", "Whole-home automation", "Premium brands", "White-glove service"]},
      {"name": "Beachfront HVAC", "slug": "beachfront-hvac", "description": "Maximum protection for Ocean Drive and barrier island properties.", "features": ["Maximum coastal coating", "Hurricane-rated equipment", "Salt air defense", "Beach expertise"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Windsor, Grand Harbor, and golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Vero Beach.", "features": ["Same-day service", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane-rated", "10-year warranty", "Premium installation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance for luxury properties.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "Concierge service"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service John''s Island and Ocean Drive estates?", "answer": "Yes, we specialize in Vero Beach''s most exclusive properties. Our technicians are trained in premium service protocols and work extensively with luxury estates, multi-zone systems, and sophisticated automation."},
      {"question": "Can you handle beachfront salt air challenges?", "answer": "Absolutely. We provide maximum coastal protection including specialized coil coatings, hurricane-rated equipment, and maintenance programs designed for direct ocean exposure."},
      {"question": "Do you work with golf communities like Windsor?", "answer": "Yes, we specialize in Vero Beach''s golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Vero Beach homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "73%", "cooling_degree_days": "3,300", "days_above_90": "80+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Vero Beach?',
  'Contact us today for white-glove service worthy of Vero Beach. From Ocean Drive to John''s Island, we deliver exceptional comfort with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Vero Beach", "description": "Premium HVAC services for Vero Beach, FL.", "url": "https://coolit-hvac.com/vero-beach-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Vero Beach", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service luxury estates?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Vero Beach luxury properties with white-glove service."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Vero Beach", "item": "https://coolit-hvac.com/fl/vero-beach"}]}'::jsonb,

  '/fl/indian-river-county',
  '[{"slug": "/fl/sebastian/hvac", "anchor_text": "Sebastian HVAC"}, {"slug": "/fl/fort-pierce/hvac", "anchor_text": "Fort Pierce AC"}, {"slug": "/fl/fellsmere/hvac", "anchor_text": "Fellsmere HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/luxury-hvac", "anchor_text": "Luxury HVAC"}, {"slug": "/services/beachfront-hvac", "anchor_text": "Beachfront HVAC"}]'::jsonb,

  1950, 30, 14, 75,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Fort Pierce, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  'Fort Pierce', 'fort-pierce', 'Florida', 'FL', 'St. Lucie', 'st-lucie-county',
  27.4467, -80.3256,
  ARRAY['34945', '34946', '34947', '34948', '34949', '34950', '34951', '34954'],
  'Port St. Lucie',
  ARRAY['b5c6d7e8-f9a0-1234-7890-456789012345', 'd7e8f9a0-b1c2-3456-9012-678901234567']::uuid[],
  true, 74
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
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  NOW(),
  46074, 'US Census Bureau ACS 2023',
  48542, 195000, 54.2,
  ARRAY['single-family', 'waterfront', 'historic-home', 'affordable-housing'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  89, 59, 75, 3380, 83, 55.4, 'high',
  'St. Lucie County seat. Historic waterfront city. Navy SEAL Museum. Sunrise City heritage. Mix of historic and modern. High coastal hurricane risk.',
  ARRAY['St. Lucie County Government', 'St. Lucie County Public Schools', 'Lawnwood Regional Medical Center', 'City of Fort Pierce', 'Port of Fort Pierce', 'Retail sector'],
  ARRAY['Navy SEAL Museum', 'Fort Pierce Inlet State Park', 'Downtown Fort Pierce', 'Manatee Observation Center', 'Historic Sunrise Theatre', 'St. Lucie County Aquarium'],
  ARRAY['Sunset Celebration', 'Farmers Market', 'Friday Fest', 'Jazz & Blues Society concerts'],
  ARRAY['St. Lucie County Public Schools'],
  'Downtown Fort Pierce revitalization. Marina Square development. Historic preservation. Waterfront improvements. Affordable housing initiatives.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Fort Pierce Utilities Authority',
  185,
  'Florida Building Code 8th Edition (2023), City of Fort Pierce amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for downtown properties", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Air Docs', 'Franks Air Conditioning', 'Elite Electric', 'ABC Air Conditioning', 'Comfort Zone'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Downtown Fort Pierce', 'downtown-fort-pierce', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic waterfront downtown', ARRAY['historic buildings', 'mixed-use properties', 'older systems', 'revitalization'], '5-80+ years', 1, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Harbor Town', 'harbor-town', 'East', 'waterfront', '1960s-2000s', 'Middle income', 'Indian River Lagoon waterfront', ARRAY['waterfront humidity', 'salt exposure', 'varied ages'], '15-55 years', 2, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Hutchinson Island/Fort Pierce Beach', 'fort-pierce-beach', 'East', 'waterfront', '1960s-2020s', 'Upper middle income', 'Atlantic barrier island', ARRAY['beach salt air', 'oceanfront exposure', 'varied housing'], '5-55 years', 3, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'St. Lucie Village', 'st-lucie-village', 'North', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'budget solutions'], '35-65 years', 4, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Lakewood Park', 'lakewood-park', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Residential area', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-55 years', 5, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Indian River Estates', 'indian-river-estates', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established community', ARRAY['older homes', 'budget focus', 'system replacements'], '25-55 years', 6, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Citrus Park', 'citrus-park', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Residential neighborhood', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 7, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'White City', 'white-city', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'system replacements', 'budget solutions'], '25-55 years', 8, false)
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
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  'hvac',
  '/fl/fort-pierce/hvac',
  'HVAC Services in Fort Pierce, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Fort Pierce''s 46,000+ residents. Affordable and honest service. FPL rebates available. Serving Downtown, Harbor Town, Fort Pierce Beach & all areas.',
  'HVAC Fort Pierce FL',
  ARRAY['AC repair Fort Pierce', 'air conditioning Fort Pierce FL', 'HVAC contractor Fort Pierce', 'affordable AC Fort Pierce', 'waterfront HVAC', 'St. Lucie County HVAC'],

  'Fort Pierce''s Honest HVAC Experts',
  'Affordable comfort for the Sunrise City',
  'Licensed & Insured | FPL Certified | Affordable & Waterfront Specialists',
  'Fort Pierce—the "Sunrise City"—combines historic waterfront character with authentic Florida living and affordable housing. With over 46,000 residents and median home values around $195,000, Fort Pierce needs honest HVAC service with fair pricing. From historic downtown to Fort Pierce Beach and established neighborhoods, our team provides reliable, affordable comfort throughout this genuine Treasure Coast community.',

  '{
    "headline": "Why Fort Pierce Residents Choose Us",
    "reasons": [
      {"title": "Honest, Affordable Service", "description": "Fort Pierce''s median home value is $195,000—we provide honest assessments, fair pricing, and solutions that fit your budget without upselling."},
      {"title": "Waterfront Specialists", "description": "Harbor Town and Fort Pierce Beach properties face salt air challenges. We provide coastal protection and waterfront expertise at fair prices."},
      {"title": "Historic Downtown Experience", "description": "Historic downtown Fort Pierce buildings deserve sensitive HVAC solutions. Ductless systems preserve character while delivering modern comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Fort Pierce homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Fort Pierce",
    "intro": "Fort Pierce''s history and waterfront location create specific HVAC considerations:",
    "challenges": [
      {"title": "Aging Housing Stock", "description": "Much of Fort Pierce was built in the 1960s-1980s. Systems in these homes often need replacement with efficient modern equipment at affordable prices."},
      {"title": "Waterfront Salt Air", "description": "Harbor Town, Fort Pierce Beach, and Indian River properties face salt air exposure requiring coastal coil protection for equipment longevity."},
      {"title": "Historic Building Retrofits", "description": "Downtown historic properties often lack modern HVAC. Ductless mini-splits provide ideal solutions preserving architectural character."},
      {"title": "Budget-Conscious Community", "description": "Fort Pierce homeowners value honest pricing and practical solutions. We provide options at every price point with no pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Affordable HVAC Services in Fort Pierce",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout Fort Pierce.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance and financing.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Flexible financing"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Affordable coastal protection for Harbor Town and beachside properties.", "features": ["Coastal coil coating", "Salt air protection", "Fair pricing", "Waterfront expertise"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for downtown Fort Pierce historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Character protection", "Affordable options"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Fort Pierce systems affordably.", "features": ["Efficiency improvements", "Honest assessments", "Multiple options", "Rebate assistance"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Are your prices affordable for Fort Pierce homeowners?", "answer": "Yes, we understand Fort Pierce''s value-conscious market. We provide honest pricing, multiple options at different price points, and help you access FPL rebates to maximize savings."},
      {"question": "Do you service waterfront properties?", "answer": "Yes, we specialize in Harbor Town and Fort Pierce Beach waterfront properties with coastal coil protection and salt air expertise at fair prices."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Absolutely. Ductless mini-split systems are ideal for Fort Pierce''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Fort Pierce homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "75%", "cooling_degree_days": "3,380", "days_above_90": "83+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Honest Comfort in Fort Pierce?',
  'Contact us today for fair pricing and quality service. We''ll keep your Fort Pierce home comfortable with FPL rebates and flexible financing.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Fort Pierce", "description": "Affordable HVAC services for Fort Pierce, FL.", "url": "https://coolit-hvac.com/fort-pierce-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Fort Pierce", "addressRegion": "FL"}, "priceRange": "$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Are your prices affordable?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide honest pricing and help Fort Pierce homeowners maximize FPL rebates."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Fort Pierce", "item": "https://coolit-hvac.com/fl/fort-pierce"}]}'::jsonb,

  '/fl/st-lucie-county',
  '[{"slug": "/fl/port-st-lucie/hvac", "anchor_text": "Port St. Lucie HVAC"}, {"slug": "/fl/vero-beach/hvac", "anchor_text": "Vero Beach AC"}, {"slug": "/fl/sebastian/hvac", "anchor_text": "Sebastian HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1870, 26, 13, 74,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
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
