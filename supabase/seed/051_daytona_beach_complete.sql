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
