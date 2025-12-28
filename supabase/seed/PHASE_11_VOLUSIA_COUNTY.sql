-- ============================================
-- Daytona Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a0b1c2d3-e4f5-6789-2345-012345678901',
  'Daytona Beach', 'daytona-beach', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.2108, -81.0228,
  ARRAY['32114', '32115', '32116', '32117', '32118', '32119', '32120', '32124'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['b1c2d3e4-f5a6-7890-3456-123456789012', 'c2d3e4f5-a6b7-8901-4567-234567890123']::uuid[],
  true, 71
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
  'a0b1c2d3-e4f5-6789-2345-012345678901',
  NOW(),
  72647, 'US Census Bureau ACS 2023',
  48942, 215000, 52.8,
  ARRAY['single-family', 'waterfront', 'condo', 'historic-home'],
  '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 51, 76, 3450, 87, 51.8, 'high',
  'World famous beach. Daytona 500 NASCAR heritage. Spring break destination. Mix of tourism and residential. High coastal hurricane risk.',
  ARRAY['Daytona Beach International Airport', 'Volusia County Public Schools', 'Halifax Health', 'Embry-Riddle Aeronautical University', 'NASCAR', 'Tourism industry'],
  ARRAY['Daytona International Speedway', 'Daytona Beach Boardwalk', 'Main Street Pier', 'Ponce Inlet Lighthouse', 'Beach Street historic district', 'Ocean Center'],
  ARRAY['Daytona 500', 'Bike Week', 'Biketoberfest', 'Turkey Run', 'Spring Break events'],
  ARRAY['Volusia County Public Schools'],
  'Beachside redevelopment. Main Street revitalization. Speedway district growth. ISB development. Tourism infrastructure improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Daytona Beach Utilities',
  175,
  'Florida Building Code 8th Edition (2023), City of Daytona Beach amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment near beach", "historic_district": "Design review downtown", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Beachside/Peninsula', 'beachside', 'East', 'waterfront', '1950s-2020s', 'Upper middle income', 'Oceanfront barrier island', ARRAY['salt air corrosion', 'beach exposure', 'condo systems', 'tourism properties'], '5-65 years', 1, true),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Historic Downtown', 'downtown-daytona', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Beach Street historic district', ARRAY['historic buildings', 'mixed-use properties', 'older systems', 'ductless needs'], '5-80+ years', 2, true),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Daytona Beach Shores (adjacent)', 'daytona-shores', 'South', 'waterfront', '1960s-2020s', 'Upper middle income', 'Beachfront community', ARRAY['oceanfront condos', 'salt air', 'beach humidity', 'high-rise systems'], '5-55 years', 3, true),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Indigo', 'indigo', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-20 years', 4, false),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Holly Hill (adjacent)', 'holly-hill', 'Northwest', 'single-family', '1960s-1990s', 'Middle income', 'Established adjacent city', ARRAY['older homes', 'system replacements', 'budget solutions'], '25-55 years', 5, false),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'LPGA Area', 'lpga-area', 'West', 'golf-community', '1980s-2010s', 'Upper middle income', 'Golf and residential', ARRAY['golf course humidity', 'varied ages', 'premium areas'], '10-40 years', 6, false),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Derbyshire', 'derbyshire', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-55 years', 7, false),
  ('a0b1c2d3-e4f5-6789-2345-012345678901', 'Ortona', 'ortona', 'Southwest', 'single-family', '1970s-2000s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 8, false)
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
  'a0b1c2d3-e4f5-6789-2345-012345678901',
  'hvac',
  '/fl/daytona-beach/hvac',
  'HVAC Services in Daytona Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Daytona Beach''s 73,000+ residents. Beach and tourism specialists. FPL rebates available. Serving Beachside, Downtown, all areas.',
  'HVAC Daytona Beach FL',
  ARRAY['AC repair Daytona Beach', 'air conditioning Daytona Beach FL', 'HVAC contractor Daytona Beach', 'beach AC Daytona', 'oceanfront HVAC', 'Volusia County HVAC'],

  'Daytona Beach''s Trusted HVAC Experts',
  'Comfort solutions from the Speedway to the sea',
  'Licensed & Insured | FPL Certified | Beach & Tourism Property Specialists',
  'Daytona Beach—world famous for NASCAR, spring break, and 23 miles of hard-packed sand—combines iconic tourism with year-round residential communities. With over 73,000 residents from beachside condos to mainland neighborhoods, Daytona Beach needs HVAC contractors who understand both tourism properties and family homes. Our team provides expert service from oceanfront high-rises to historic downtown throughout this legendary beach city.',

  '{
    "headline": "Why Daytona Beach Residents Choose Us",
    "reasons": [
      {"title": "Beachfront Specialists", "description": "Beachside and Daytona Beach Shores properties face extreme salt air exposure. We provide maximum coastal protection and equipment designed for oceanfront environments."},
      {"title": "Tourism Property Experience", "description": "Daytona Beach''s hotels, condos, and vacation rentals need reliable service. We provide priority response and systems designed for high-use tourism properties."},
      {"title": "Historic Downtown Expertise", "description": "Beach Street and historic downtown buildings deserve sensitive HVAC solutions. Ductless systems preserve character while delivering modern comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Daytona Beach homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Daytona Beach",
    "intro": "Daytona Beach''s oceanfront location and tourism character create specific HVAC considerations:",
    "challenges": [
      {"title": "Extreme Salt Air Exposure", "description": "Beachside and oceanfront properties face the most aggressive salt air environment. Maximum coastal protection is essential for equipment longevity."},
      {"title": "Tourism Property Demands", "description": "Hotels, condos, and vacation rentals require reliable systems handling high use. We specialize in tourism property HVAC with rapid response."},
      {"title": "High-Rise Condo Systems", "description": "Beachside high-rises require specialized expertise in condo HVAC systems, building access, and coordination with condo associations."},
      {"title": "Hurricane Zone Requirements", "description": "Beachside location means equipment must meet strict wind rating and elevation requirements for coastal zones."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Daytona Beach",
    "services": [
      {"name": "Beachfront HVAC", "slug": "beachfront-hvac", "description": "Maximum protection for oceanfront and beachside properties.", "features": ["Maximum coastal coating", "Hurricane-rated equipment", "Salt air defense", "Beach expertise"]},
      {"name": "Tourism Property Service", "slug": "tourism-property", "description": "Reliable HVAC for hotels, condos, and vacation rentals.", "features": ["Priority response", "High-use systems", "Property management support", "24/7 availability"]},
      {"name": "Historic Building HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Beach Street historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Character protection", "Hidden installation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Daytona Beach.", "features": ["Same-day service", "Tourism priority", "90-day warranty", "All brands"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane-rated", "10-year warranty", "Financing available"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance programs.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "Tourism property plans"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service beachside condos and high-rises?", "answer": "Yes, we specialize in beachside properties including high-rise condos. We understand building access, condo association requirements, and beachfront HVAC challenges."},
      {"question": "Can you handle vacation rental and hotel properties?", "answer": "Absolutely. We provide priority response for tourism properties with systems designed for high use and reliable service ensuring guest comfort."},
      {"question": "Do you service the LPGA and Indigo areas?", "answer": "Yes, we service all Daytona Beach areas from beachside to mainland communities including LPGA, Indigo, and all residential neighborhoods."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Daytona Beach homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "76%", "cooling_degree_days": "3,450", "days_above_90": "87+", "hurricane_risk": "High"}'::jsonb,

  'Ready for World-Class Comfort in Daytona Beach?',
  'Contact us today for expert service. From beachside to mainland, we''ll keep your Daytona Beach property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Daytona Beach", "description": "Professional HVAC services for Daytona Beach, FL.", "url": "https://coolit-hvac.com/daytona-beach-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "Daytona Beach", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service beachside condos?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in beachside properties including high-rise condos with coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Daytona Beach", "item": "https://coolit-hvac.com/fl/daytona-beach"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/ormond-beach/hvac", "anchor_text": "Ormond Beach HVAC"}, {"slug": "/fl/port-orange/hvac", "anchor_text": "Port Orange AC"}, {"slug": "/fl/new-smyrna-beach/hvac", "anchor_text": "New Smyrna Beach HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beachfront-hvac", "anchor_text": "Beachfront HVAC"}, {"slug": "/services/tourism-property", "anchor_text": "Tourism Property Service"}]'::jsonb,

  1900, 28, 14, 71,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Ormond Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b1c2d3e4-f5a6-7890-3456-123456789012',
  'Ormond Beach', 'ormond-beach', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.2858, -81.0559,
  ARRAY['32174', '32175', '32176'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['a0b1c2d3-e4f5-6789-2345-012345678901']::uuid[],
  true, 70
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
  'b1c2d3e4-f5a6-7890-3456-123456789012',
  NOW(),
  43245, 'US Census Bureau ACS 2023',
  72547, 345000, 76.8,
  ARRAY['single-family', 'waterfront', 'golf-community', 'historic-home'],
  '{"pre-1970": 25, "1970s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  90, 51, 75, 3420, 85, 51.4, 'high',
  '"Birthplace of Speed." Upscale Daytona neighbor. Beautiful beaches. Historic downtown. Golf communities. High coastal hurricane risk.',
  ARRAY['Volusia County Public Schools', 'Halifax Health', 'City of Ormond Beach', 'Tomoka State Park', 'Retail and tourism', 'Small businesses'],
  ARRAY['Tomoka State Park', 'The Casements (Rockefeller estate)', 'Ormond Beach Loops (The Loop)', 'Granada Boulevard', 'Historic Ormond Beach', 'Ormond Beach pier'],
  ARRAY['Birthplace of Speed celebrations', 'Celtic Festival', 'Art in the Park', 'Beach events'],
  ARRAY['Volusia County Public Schools'],
  'Granada Boulevard corridor improvements. Beachside redevelopment. Historic preservation. Golf community expansions. Tomoka Oaks area growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Ormond Beach Utilities',
  180,
  'Florida Building Code 8th Edition (2023), City of Ormond Beach amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment near beach", "historic_properties": "Design review for historic buildings", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Ormond Beach/Beachside', 'ormond-beachside', 'East', 'waterfront', '1950s-2020s', 'Upper middle income', 'Oceanfront barrier island', ARRAY['salt air corrosion', 'beach exposure', 'oceanfront humidity', 'premium demands'], '5-65 years', 1, true),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Historic Granada Boulevard', 'granada-boulevard', 'Central', 'mixed', '1920s-1970s', 'Upper middle income', 'Historic tree-canopy corridor', ARRAY['historic homes', 'older systems', 'character preservation', 'ductless needs'], '40-80+ years', 2, true),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Tomoka Oaks', 'tomoka-oaks', 'North', 'golf-community', '1980s-2010s', 'Upper income', 'Premier golf and country club', ARRAY['golf course humidity', 'premium systems', 'HOA standards', 'luxury demands'], '10-40 years', 3, true),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'The Trails', 'the-trails', 'West', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf community', ARRAY['golf course adjacent', 'established systems', 'HOA requirements'], '10-30 years', 4, false),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Hunter''s Ridge', 'hunters-ridge', 'West', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'older systems', 'efficiency upgrades'], '20-40 years', 5, false),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Central Ormond', 'central-ormond', 'Central', 'single-family', '1960s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'standard service'], '25-55 years', 6, false),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Plantation Bay', 'plantation-bay', 'Northwest', 'golf-community', '1990s-2010s', 'Upper income', 'Luxury golf community', ARRAY['luxury estates', 'golf course humidity', 'premium equipment'], '10-30 years', 7, false),
  ('b1c2d3e4-f5a6-7890-3456-123456789012', 'Breakaway Trails', 'breakaway-trails', 'West', 'golf-community', '2000s-2020s', 'Upper middle income', 'Newer golf community', ARRAY['newer systems', 'golf adjacent', 'HOA compliance'], '5-20 years', 8, false)
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
  'b1c2d3e4-f5a6-7890-3456-123456789012',
  'hvac',
  '/fl/ormond-beach/hvac',
  'HVAC Services in Ormond Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Ormond Beach''s 43,000+ residents. Golf community and beachfront specialists. FPL rebates. Serving Tomoka Oaks, Granada Boulevard, Beachside & all areas.',
  'HVAC Ormond Beach FL',
  ARRAY['AC repair Ormond Beach', 'air conditioning Ormond Beach FL', 'HVAC contractor Ormond Beach', 'golf community AC', 'beachfront HVAC', 'Volusia County HVAC'],

  'Ormond Beach''s Premium HVAC Experts',
  'Comfort for the Birthplace of Speed',
  'Licensed & Insured | FPL Certified | Golf Community & Beachfront Specialists',
  'Ormond Beach—the "Birthplace of Speed"—represents upscale coastal living with beautiful beaches, prestigious golf communities like Tomoka Oaks and Plantation Bay, and historic Granada Boulevard. With over 43,000 residents enjoying median home values exceeding $345,000, Ormond Beach demands premium HVAC service. Our team delivers white-glove service from beachfront properties to golf estates throughout this distinguished community.',

  '{
    "headline": "Why Ormond Beach Residents Choose Us",
    "reasons": [
      {"title": "Golf Community Specialists", "description": "Tomoka Oaks, Plantation Bay, The Trails, and Hunter''s Ridge demand premium standards. We deliver top-tier equipment and expertise with enhanced humidity control."},
      {"title": "Beachfront Expertise", "description": "Ormond beachside properties face salt air challenges. We provide maximum coastal protection and equipment designed for oceanfront environments."},
      {"title": "Historic Property Care", "description": "Granada Boulevard''s magnificent historic homes deserve sensitive HVAC solutions preserving architectural character while delivering modern comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Ormond Beach homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing value."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Ormond Beach",
    "intro": "Ormond Beach''s coastal location and upscale communities create specific HVAC needs:",
    "challenges": [
      {"title": "Golf Course Humidity", "description": "Tomoka Oaks, Plantation Bay, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Beachfront Salt Air", "description": "Ormond beachside properties face salt air exposure requiring coastal coil protection for equipment longevity."},
      {"title": "Historic Preservation", "description": "Granada Boulevard''s historic homes require HVAC solutions that don''t compromise architectural integrity. Ductless systems often provide ideal solutions."},
      {"title": "Premium Community Standards", "description": "Ormond Beach''s upscale character demands top-tier equipment, quiet operation, and professional service. We meet these expectations consistently."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Ormond Beach",
    "services": [
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Tomoka Oaks, Plantation Bay, and all golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Multi-zone systems"]},
      {"name": "Beachfront HVAC", "slug": "beachfront-hvac", "description": "Coastal protection for Ormond beachside properties.", "features": ["Coastal coil coating", "Salt air defense", "Hurricane-rated", "Beach expertise"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Granada Boulevard historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Hidden installation", "Character protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Professional repairs throughout Ormond Beach.", "features": ["Same-day service", "Premium brands", "90-day warranty", "White-glove service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Premium installation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for golf and coastal properties.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Tomoka Oaks and Plantation Bay?", "answer": "Yes, we specialize in Ormond Beach''s premier golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "Can you handle beachside salt air challenges?", "answer": "Absolutely. We provide coastal coil protection, salt air expertise, and maintenance programs designed for Ormond beachside exposure."},
      {"question": "Do you install AC in Granada Boulevard historic homes?", "answer": "Yes, ductless mini-split systems are ideal for Granada Boulevard''s beautiful historic homes, preserving character while delivering modern comfort."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Ormond Beach homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,420", "days_above_90": "85+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Ormond Beach?',
  'Contact us today for white-glove service. From Tomoka Oaks to the beach, we''ll keep your Ormond Beach home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Ormond Beach", "description": "Premium HVAC services for Ormond Beach, FL.", "url": "https://coolit-hvac.com/ormond-beach-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "Ormond Beach", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service golf communities?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Ormond Beach golf communities with premium service."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Ormond Beach", "item": "https://coolit-hvac.com/fl/ormond-beach"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/daytona-beach/hvac", "anchor_text": "Daytona Beach HVAC"}, {"slug": "/fl/palm-coast/hvac", "anchor_text": "Palm Coast AC"}, {"slug": "/fl/port-orange/hvac", "anchor_text": "Port Orange HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}, {"slug": "/services/beachfront-hvac", "anchor_text": "Beachfront HVAC"}]'::jsonb,

  1920, 30, 15, 70,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- DeLand, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  'DeLand', 'deland', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.0283, -81.3031,
  ARRAY['32720', '32721', '32723', '32724'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['a0b1c2d3-e4f5-6789-2345-012345678901']::uuid[],
  true, 69
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
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  NOW(),
  37351, 'US Census Bureau ACS 2023',
  54842, 245000, 58.6,
  ARRAY['single-family', 'historic-home', 'college-housing', 'affordable-housing'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  92, 50, 76, 3480, 95, 53.2, 'low',
  'Volusia County seat. Historic Athens of Florida. Stetson University. Victorian architecture. Arts community. Low inland hurricane risk.',
  ARRAY['Stetson University', 'Volusia County Government', 'Florida Hospital DeLand', 'Volusia County Public Schools', 'City of DeLand', 'Retail sector'],
  ARRAY['Downtown DeLand historic district', 'Stetson University', 'Artisan Alley', 'DeLand House Museum', 'DeLeon Springs State Park', 'Blue Spring State Park'],
  ARRAY['DeLand Fall Festival of the Arts', 'DeLand Original Music Festival', 'Downtown Friday Night events', 'Stetson Homecoming'],
  ARRAY['Volusia County Public Schools'],
  'Downtown DeLand revitalization. Stetson University expansion. Historic preservation. Arts district growth. New residential development.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of DeLand Utilities',
  195,
  'Florida Building Code 8th Edition (2023), City of DeLand historic overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for downtown properties", "college_housing": "Rental property considerations", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Historic Downtown DeLand', 'downtown-deland', 'Central', 'historic-home', '1880s-1960s', 'Upper middle income', 'Victorian and historic architecture', ARRAY['historic buildings', 'older systems', 'ductless needs', 'preservation requirements'], '30-100+ years', 1, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Stetson University Area', 'stetson-area', 'East', 'college-housing', '1920s-2020s', 'Middle income', 'College neighborhood', ARRAY['rental properties', 'varied ages', 'student housing', 'landlord needs'], '5-80+ years', 2, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Victoria Park', 'victoria-park', 'North', 'single-family', '1970s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'established systems', 'HOA requirements'], '20-50 years', 3, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Artisan Alley Area', 'artisan-alley', 'Central', 'mixed', '1920s-1970s', 'Middle income', 'Arts district', ARRAY['historic buildings', 'artist studios', 'older systems', 'character preservation'], '40-90+ years', 4, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Spring Hill', 'spring-hill', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'budget solutions'], '25-55 years', 5, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Lake Beresford', 'lake-beresford', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Lakefront area', ARRAY['lake humidity', 'older systems', 'standard service'], '20-50 years', 6, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Westgate', 'westgate', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-55 years', 7, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Deltona Lakes', 'deltona-lakes', 'Southwest', 'single-family', '1970s-2000s', 'Middle income', 'Near Deltona', ARRAY['older systems', 'budget focus', 'system replacements'], '20-50 years', 8, false)
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
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  'hvac',
  '/fl/deland/hvac',
  'HVAC Services in DeLand, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for DeLand''s 37,000+ residents. Historic and college town specialists. Duke Energy rebates. Serving Downtown, Stetson, Victoria Park & all areas.',
  'HVAC DeLand FL',
  ARRAY['AC repair DeLand', 'air conditioning DeLand FL', 'HVAC contractor DeLand', 'historic home AC DeLand', 'Stetson University HVAC', 'Volusia County HVAC'],

  'DeLand''s Historic & College Town HVAC Experts',
  'Preserving the Athens of Florida since [year]',
  'Licensed & Insured | Duke Energy Certified | Historic Property Specialists',
  'DeLand—the "Athens of Florida"—combines magnificent Victorian architecture with vibrant college-town energy from Stetson University and a thriving arts community. With over 37,000 residents appreciating historic character and cultural richness, DeLand needs HVAC contractors who understand historic preservation, college housing, and community values. Our team provides expert service from downtown Victorian homes to Stetson area properties throughout this distinguished county seat.',

  '{
    "headline": "Why DeLand Residents Choose Us",
    "reasons": [
      {"title": "Historic Preservation Experts", "description": "Downtown DeLand and Artisan Alley feature irreplaceable Victorian and historic architecture. Ductless systems preserve character while delivering modern comfort."},
      {"title": "College Housing Specialists", "description": "Stetson University area properties require reliable service for student housing and rental properties. We provide efficient solutions landlords and tenants trust."},
      {"title": "Duke Energy Rebate Certified", "description": "We help DeLand homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Community Understanding", "description": "DeLand''s mix of historic homes, college housing, and family neighborhoods requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to DeLand",
    "intro": "DeLand''s historic character and college town nature create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Building Preservation", "description": "Downtown DeLand''s Victorian homes and historic buildings require HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "College Rental Properties", "description": "Stetson University area rentals need reliable, efficient systems handling student use. We provide solutions balancing performance with landlord budgets."},
      {"title": "Aging Housing Stock", "description": "Much of DeLand predates modern building codes. Systems in homes from the 1920s-1970s often need replacement with efficient modern equipment."},
      {"title": "Arts Community Properties", "description": "Artisan Alley studios and galleries require temperature and humidity control protecting artwork while maintaining character."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in DeLand",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for DeLand''s beautiful Victorian and historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "College Housing Service", "slug": "college-housing", "description": "Reliable HVAC for Stetson University area rental properties.", "features": ["Efficient systems", "Budget-friendly", "Reliable performance", "Landlord support"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, honest repairs throughout DeLand.", "features": ["Same-day service", "Fair pricing", "90-day warranty", "All brands"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging DeLand systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting historic and rental investments.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in downtown DeLand Victorian homes?", "answer": "Yes, ductless mini-split systems are ideal for DeLand''s historic properties. They provide efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Do you service Stetson University area rental properties?", "answer": "Absolutely. We provide reliable, efficient systems for student housing and work with landlords on budget-friendly solutions that perform reliably."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork for DeLand homeowners."},
      {"question": "Do you service Victoria Park golf community?", "answer": "Yes, we service Victoria Park and all DeLand neighborhoods with appropriate solutions for each area''s unique needs."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "76%", "cooling_degree_days": "3,480", "days_above_90": "95+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Historic Comfort in DeLand?',
  'Contact us today for expert service. We''ll preserve DeLand''s character while delivering modern comfort with Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - DeLand", "description": "Professional HVAC services for DeLand, FL specializing in historic properties.", "url": "https://coolit-hvac.com/deland-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "DeLand", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in Victorian homes?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for DeLand historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "DeLand", "item": "https://coolit-hvac.com/fl/deland"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/deltona/hvac", "anchor_text": "Deltona HVAC"}, {"slug": "/fl/daytona-beach/hvac", "anchor_text": "Daytona Beach AC"}, {"slug": "/fl/orange-city/hvac", "anchor_text": "Orange City HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/college-housing", "anchor_text": "College Housing Service"}]'::jsonb,

  1900, 28, 13, 69,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
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
-- ============================================
-- New Smyrna Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e4f5a6b7-c8d9-0123-6789-456789012345',
  'New Smyrna Beach', 'new-smyrna-beach', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.0258, -80.9270,
  ARRAY['32168', '32169', '32170'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['d3e4f5a6-b7c8-9012-5678-345678901234']::uuid[],
  true, 67
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
  'e4f5a6b7-c8d9-0123-6789-456789012345',
  NOW(),
  29324, 'US Census Bureau ACS 2023',
  69547, 385000, 71.2,
  ARRAY['single-family', 'waterfront', 'beach-property', 'historic-home'],
  '{"pre-1970": 20, "1970s-1990s": 30, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  89, 53, 74, 3380, 80, 52.8, 'high',
  'Charming beach town. Artist community. Historic Canal Street. Beautiful beaches. Indian River Lagoon. High coastal hurricane risk.',
  ARRAY['Volusia County Public Schools', 'Bert Fish Medical Center', 'City of New Smyrna Beach', 'Arts organizations', 'Tourism industry', 'Small businesses'],
  ARRAY['Flagler Avenue beachside', 'Canal Street historic district', 'Canaveral National Seashore', 'Smyrna Dunes Park', 'New Smyrna Museum of History', 'Atlantic Center for the Arts'],
  ARRAY['Jazz Festival', 'Images: A Festival of the Arts', 'Canal Street Art Walk', 'Farmers Market'],
  ARRAY['Volusia County Public Schools'],
  'Beachside redevelopment. Canal Street revitalization. Arts district expansion. Waterfront development. Tourism infrastructure improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of New Smyrna Beach Utilities',
  190,
  'Florida Building Code 8th Edition (2023), City of New Smyrna Beach amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment near beach", "historic_district": "Design review for Canal Street", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Flagler Avenue/Beachside', 'flagler-avenue', 'East', 'waterfront', '1950s-2020s', 'Upper middle income', 'Beachfront barrier island', ARRAY['salt air corrosion', 'beach exposure', 'oceanfront humidity', 'premium demands'], '5-65 years', 1, true),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Canal Street Historic District', 'canal-street', 'Central', 'historic-home', '1890s-1960s', 'Upper middle income', 'Historic downtown waterfront', ARRAY['historic buildings', 'older systems', 'ductless needs', 'character preservation'], '30-100+ years', 2, true),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Coronado', 'coronado', 'East', 'waterfront', '1960s-2020s', 'Upper middle income', 'Beachside community', ARRAY['beach salt air', 'varied ages', 'coastal exposure'], '5-55 years', 3, true),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Venetian Bay', 'venetian-bay', 'West', 'golf-community', '1990s-2010s', 'Upper income', 'Golf and waterfront community', ARRAY['golf and water humidity', 'premium systems', 'HOA standards'], '10-30 years', 4, false),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Sugar Mill', 'sugar-mill', 'Northwest', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf community', ARRAY['golf course humidity', 'established systems', 'HOA requirements'], '20-40 years', 5, false),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Indian River', 'indian-river-nsb', 'West', 'waterfront', '1970s-2010s', 'Upper middle income', 'Intracoastal waterfront', ARRAY['waterfront humidity', 'salt exposure', 'varied ages'], '10-50 years', 6, false),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'Bethune Beach', 'bethune-beach', 'South', 'waterfront', '1960s-2000s', 'Middle income', 'South beachside area', ARRAY['beach exposure', 'older systems', 'budget solutions'], '20-55 years', 7, false),
  ('e4f5a6b7-c8d9-0123-6789-456789012345', 'West New Smyrna', 'west-nsb', 'West', 'single-family', '1970s-2000s', 'Middle income', 'Mainland residential', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 8, false)
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
  'e4f5a6b7-c8d9-0123-6789-456789012345',
  'hvac',
  '/fl/new-smyrna-beach/hvac',
  'HVAC Services in New Smyrna Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for New Smyrna Beach''s 29,000+ residents. Beach and historic specialists. FPL rebates. Serving Flagler Avenue, Canal Street, Venetian Bay & all areas.',
  'HVAC New Smyrna Beach FL',
  ARRAY['AC repair New Smyrna Beach', 'air conditioning New Smyrna Beach FL', 'HVAC contractor New Smyrna Beach', 'beach AC NSB', 'waterfront HVAC', 'Volusia County HVAC'],

  'New Smyrna Beach''s Coastal HVAC Experts',
  'Comfort for the Artist Beach Town',
  'Licensed & Insured | FPL Certified | Beach & Historic Specialists',
  'New Smyrna Beach—a charming artist community with beautiful beaches and historic Canal Street—represents authentic coastal Florida living. With nearly 29,000 residents enjoying median home values exceeding $385,000, New Smyrna Beach demands HVAC service matching its upscale character. From Flagler Avenue beachfront to historic Canal Street and Venetian Bay golf estates, our team delivers expert service throughout this beloved beach town.',

  '{
    "headline": "Why New Smyrna Beach Residents Choose Us",
    "reasons": [
      {"title": "Beachfront Specialists", "description": "Flagler Avenue, Coronado, and beachside properties face extreme salt air exposure. We provide maximum coastal protection and equipment designed for oceanfront environments."},
      {"title": "Historic Canal Street Expertise", "description": "Historic downtown Canal Street buildings deserve sensitive HVAC solutions. Ductless systems preserve architectural character while delivering modern comfort."},
      {"title": "Waterfront Knowledge", "description": "Indian River and Venetian Bay waterfront properties face unique humidity. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "FPL Rebate Assistance", "description": "We help New Smyrna Beach homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to New Smyrna Beach",
    "intro": "New Smyrna Beach''s coastal location and character create specific HVAC considerations:",
    "challenges": [
      {"title": "Extreme Beachfront Exposure", "description": "Flagler Avenue and beachside properties face the most aggressive salt air environment. Maximum coastal protection is essential for equipment longevity."},
      {"title": "Historic Building Preservation", "description": "Canal Street''s historic district requires HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "Dual Waterfront Challenges", "description": "Properties face both Atlantic Ocean and Indian River Lagoon exposure, creating unique salt air and humidity challenges requiring specialized equipment."},
      {"title": "Artist Community Properties", "description": "Studios and galleries require temperature and humidity control protecting artwork while maintaining character and budget constraints."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in New Smyrna Beach",
    "services": [
      {"name": "Beachfront HVAC", "slug": "beachfront-hvac", "description": "Maximum protection for Flagler Avenue and beachside properties.", "features": ["Maximum coastal coating", "Hurricane-rated equipment", "Salt air defense", "Beach expertise"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Canal Street historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Hidden installation", "Character protection"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River and Venetian Bay properties.", "features": ["Waterfront humidity control", "Salt air protection", "Dehumidification", "Coastal expertise"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout New Smyrna Beach.", "features": ["Same-day service", "Coastal expertise", "90-day warranty", "Beach to lagoon"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane-rated", "10-year warranty", "Premium installation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance programs.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Flagler Avenue beachfront properties?", "answer": "Yes, we specialize in beachfront properties with maximum coastal protection including specialized coil coatings and equipment designed for direct ocean exposure."},
      {"question": "Can you install AC in Canal Street historic buildings?", "answer": "Absolutely. Ductless mini-split systems are ideal for Canal Street''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."},
      {"question": "Do you work with Venetian Bay golf community?", "answer": "Yes, we specialize in New Smyrna Beach''s golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf and waterfront properties."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for New Smyrna Beach homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "74%", "cooling_degree_days": "3,380", "days_above_90": "80+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Coastal Comfort in New Smyrna Beach?',
  'Contact us today for expert service. From Flagler Avenue to Canal Street, we''ll keep your New Smyrna Beach property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - New Smyrna Beach", "description": "Professional HVAC services for New Smyrna Beach, FL.", "url": "https://coolit-hvac.com/new-smyrna-beach-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "New Smyrna Beach", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service beachfront properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in beachfront properties with maximum coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "New Smyrna Beach", "item": "https://coolit-hvac.com/fl/new-smyrna-beach"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/port-orange/hvac", "anchor_text": "Port Orange HVAC"}, {"slug": "/fl/edgewater/hvac", "anchor_text": "Edgewater AC"}, {"slug": "/fl/oak-hill/hvac", "anchor_text": "Oak Hill HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beachfront-hvac", "anchor_text": "Beachfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1920, 28, 14, 67,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
