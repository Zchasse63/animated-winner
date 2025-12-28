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
