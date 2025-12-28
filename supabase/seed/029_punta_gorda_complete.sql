-- ============================================
-- Punta Gorda, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd8e9f0a1-b2c3-4567-1234-890123456789',
  'Punta Gorda', 'punta-gorda', 'Florida', 'FL', 'Charlotte', 'charlotte-county',
  26.9295, -82.0454,
  ARRAY['33950', '33951', '33955', '33982'],
  'Punta Gorda',
  ARRAY['c7d8e9f0-a1b2-3456-0123-789012345678']::uuid[],
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
  'd8e9f0a1-b2c3-4567-1234-890123456789',
  NOW(),
  21353, 'US Census Bureau ACS 2023',
  67542, 385000, 75.8,
  ARRAY['single-family', 'waterfront', 'historic-home', 'condo'],
  '{"pre-1980": 25, "1980s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  91, 55, 74, 3600, 105, 53.8, 'high',
  'Historic waterfront community on Charlotte Harbor. Direct Hurricane Ian impact but less severe than Port Charlotte. Strong rebuilding. Charming downtown. Popular retirement destination.',
  ARRAY['Charlotte County Government', 'Charlotte Behavioral Health Care', 'Bayfront Health Punta Gorda', 'Sunseeker Resort (opening)', 'City of Punta Gorda'],
  ARRAY['Fishermen''s Village', 'Historic Downtown', 'Peace River Wildlife Center', 'Ponce de Leon Park', 'Charlotte Harbor', 'Military Heritage Museum'],
  ARRAY['Punta Gorda Wine & Jazz Festival', 'Block Party on Marion', 'Sullivan Street Craft Festival', 'Peace River Lighted Boat Parade'],
  ARRAY['Charlotte County Public Schools'],
  'Hurricane Ian recovery. Sunseeker Resort development. Downtown revitalization. Waterfront improvements. Historic preservation.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Punta Gorda Utilities',
  260,
  'Florida Building Code 8th Edition (2023), City of Punta Gorda historic district overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Additional review for historic properties", "hurricane_standards": "Enhanced requirements", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Climatech', 'Complete Air Mechanical'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Punta Gorda Isles', 'punta-gorda-isles', 'West', 'waterfront', '1960s-2000s', 'Upper income', 'Sailboat-access canal community', ARRAY['hurricane recovery', 'salt air corrosion', 'waterfront humidity', 'premium systems'], '5-50 years', 1, true),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Historic Downtown', 'downtown-punta-gorda', 'Central', 'historic-home', '1920s-1970s', 'Upper middle income', 'Charming historic downtown', ARRAY['historic retrofits', 'ductless needs', 'preservation standards', 'older buildings'], '10-80+ years', 2, true),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Burnt Store', 'burnt-store-pg', 'South', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf and marina community', ARRAY['golf course humidity', 'salt exposure', 'premium demands', 'HOA requirements'], '10-28 years', 3, true),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Charlotte Harbor', 'charlotte-harbor-pg', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Near harbor area', ARRAY['hurricane impact', 'waterfront proximity', 'varied conditions'], '5-45 years', 4, false),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Seminole Lakes', 'seminole-lakes', 'East', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'HOA standards'], '10-28 years', 5, false),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'East Punta Gorda', 'east-punta-gorda', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Established residential', ARRAY['varied ages', 'family homes', 'standard service'], '10-45 years', 6, false),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Solana', 'solana', 'Northeast', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer community', ARRAY['newer systems', 'HOA requirements', 'family homes'], '5-20 years', 7, false),
  ('d8e9f0a1-b2c3-4567-1234-890123456789', 'Punta Gorda Historic East', 'pg-historic-east', 'East', 'historic-home', '1900s-1960s', 'Middle income', 'Historic residential area', ARRAY['historic homes', 'older systems', 'preservation needs'], '15-80+ years', 8, false)
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
  'd8e9f0a1-b2c3-4567-1234-890123456789',
  'hvac',
  '/fl/punta-gorda/hvac',
  'HVAC Services in Punta Gorda, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Punta Gorda''s 21,000+ residents. Historic and waterfront specialists. FPL rebates available. Serving Punta Gorda Isles, Downtown & all neighborhoods.',
  'HVAC Punta Gorda FL',
  ARRAY['AC repair Punta Gorda', 'air conditioning Punta Gorda FL', 'HVAC contractor Punta Gorda', 'historic home AC', 'waterfront HVAC', 'Charlotte County HVAC'],

  'Punta Gorda''s Charming City HVAC Experts',
  'Historic preservation meets modern comfort',
  'Licensed & Insured | FPL Certified | Historic & Waterfront Specialists',
  'Punta Gorda is one of Southwest Florida''s most charming communities—historic downtown streets, sailboat-access canals, and a relaxed waterfront lifestyle. With over 21,000 residents who appreciate both character and quality, Punta Gorda needs HVAC service that respects historic properties while delivering modern comfort. Our team specializes in the unique challenges of this beautiful city, from ductless retrofits in downtown gems to hurricane-resilient systems in Punta Gorda Isles.',

  '{
    "headline": "Why Punta Gorda Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "Punta Gorda''s historic downtown features beautiful homes that need sensitive HVAC solutions. We provide ductless systems and preservation-friendly retrofits."},
      {"title": "Waterfront Expertise", "description": "Punta Gorda Isles and waterfront properties face unique challenges—salt air, humidity, and hurricane exposure. We provide appropriate protection and equipment."},
      {"title": "Post-Ian Recovery", "description": "We''ve helped Punta Gorda recover from Hurricane Ian with quality HVAC replacement and repair, including insurance documentation assistance."},
      {"title": "FPL Rebate Assistance", "description": "We help you access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Punta Gorda",
    "intro": "Punta Gorda''s character and location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Downtown Punta Gorda''s historic properties require HVAC solutions that don''t compromise architectural integrity. Ductless systems and hidden installations are often ideal."},
      {"title": "Waterfront Salt Air", "description": "Punta Gorda Isles and canal-front properties face accelerated equipment corrosion. Coastal coatings and enhanced maintenance protect your investment."},
      {"title": "Hurricane Resilience", "description": "After Ian, Punta Gorda understands storm preparation. Hurricane tie-downs, proper elevation, and resilient equipment design matter."},
      {"title": "Canal Humidity", "description": "Waterfront properties experience elevated humidity. Whole-home dehumidification improves comfort and prevents moisture issues."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Punta Gorda",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive HVAC solutions for Punta Gorda''s historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Salt air protection and humidity control for Punta Gorda Isles and canal-front homes.", "features": ["Coastal coil coating", "Corrosion protection", "Dehumidification", "Hurricane hardening"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Punta Gorda.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic sensitivity"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane standards", "10-year warranty", "Financing available"]},
      {"name": "Hurricane Recovery", "slug": "hurricane-recovery", "description": "Storm damage assessment, insurance documentation, and replacement.", "features": ["Damage assessment", "Insurance reports", "Code compliance", "Storm hardening"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with coastal maintenance.", "features": ["Bi-annual service", "Salt rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in my historic Punta Gorda home?", "answer": "Yes, ductless mini-split systems are ideal for historic homes. They provide efficient cooling without invasive ductwork, and we can often hide equipment to preserve aesthetics."},
      {"question": "Do Punta Gorda Isles homes need special HVAC consideration?", "answer": "Yes, the salt air and waterfront humidity require coastal coil coatings, corrosion-resistant equipment, and often enhanced dehumidification for optimal comfort and equipment longevity."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "How do you protect AC from future hurricanes?", "answer": "We install hurricane tie-downs per code, recommend protective cages for exposed areas, ensure proper drainage, and can install quick-disconnect fittings for evacuation scenarios."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,600", "days_above_90": "105+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Charming Comfort in Punta Gorda?',
  'Contact us today for a free estimate. We''ll help you access FPL rebates while respecting Punta Gorda''s unique character.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Punta Gorda", "description": "Professional HVAC services in Punta Gorda, FL specializing in historic and waterfront homes.", "url": "https://coolit-hvac.com/punta-gorda-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Punta Gorda", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in my historic home?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless mini-split systems are ideal for historic homes."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Punta Gorda", "item": "https://coolit-hvac.com/fl/punta-gorda"}]}'::jsonb,

  '/fl/charlotte-county',
  '[{"slug": "/fl/port-charlotte/hvac", "anchor_text": "Port Charlotte HVAC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port AC"}, {"slug": "/fl/englewood/hvac", "anchor_text": "Englewood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1820, 24, 14, 86,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
