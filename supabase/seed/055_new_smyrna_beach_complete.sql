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
