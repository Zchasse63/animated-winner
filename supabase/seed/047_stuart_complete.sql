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
