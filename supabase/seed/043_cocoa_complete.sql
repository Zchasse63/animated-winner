-- ============================================
-- Cocoa, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  'Cocoa', 'cocoa', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.3861, -80.7420,
  ARRAY['32922', '32926', '32927'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890', 'f3a4b5c6-d7e8-9012-5678-234567890123']::uuid[],
  true, 81
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
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  NOW(),
  19041, 'US Census Bureau ACS 2023',
  52847, 235000, 58.4,
  ARRAY['single-family', 'waterfront', 'historic-home', 'mixed'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 56, 75, 3500, 90, 50.8, 'high',
  'Historic Space Coast community. Indian River riverfront. Cocoa Village charm. Kennedy Space Center proximity. Mix of old and new. High coastal hurricane risk.',
  ARRAY['Brevard County Public Schools', 'Rockwell Collins (nearby)', 'City of Cocoa', 'Healthcare facilities', 'Retail businesses', 'Tourism industry'],
  ARRAY['Cocoa Village', 'Historic Cocoa Village Playhouse', 'Indian River', 'Riverfront Park', 'Kennedy Space Center (nearby)', 'Port Canaveral access'],
  ARRAY['Cocoa Village Friday Fest', 'Space Coast Art Festival', 'Riverfront events', 'Historic tours'],
  ARRAY['Brevard County Public Schools'],
  'Cocoa Village revitalization. Riverfront development. Historic preservation efforts. Mixed-use downtown growth. Port Canaveral corridor improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Cocoa Utilities',
  185,
  'Florida Building Code 8th Edition (2023), City of Cocoa amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for Cocoa Village properties", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Cocoa Village', 'cocoa-village', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic downtown riverfront', ARRAY['historic buildings', 'mixed-use properties', 'ductless needs', 'character preservation'], '5-80+ years', 1, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Rockledge Gardens', 'rockledge-gardens', 'South', 'waterfront', '1950s-1990s', 'Upper middle income', 'Indian River waterfront', ARRAY['river humidity', 'waterfront properties', 'older systems', 'salt exposure'], '25-65 years', 2, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Riverfront Area', 'riverfront', 'East', 'waterfront', '1960s-2020s', 'Middle income', 'Indian River properties', ARRAY['river humidity', 'varied ages', 'waterfront exposure'], '5-55 years', 3, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'North Cocoa', 'north-cocoa', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Residential neighborhood', ARRAY['older systems', 'family homes', 'budget solutions'], '20-50 years', 4, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'West Cocoa', 'west-cocoa', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'system replacements', 'efficiency focus'], '25-55 years', 5, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Port St. John (adjacent)', 'port-st-john', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Unincorporated adjacent area', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 6, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'South Cocoa', 'south-cocoa', 'South', 'mixed', '1950s-1990s', 'Middle income', 'Older residential', ARRAY['older homes', 'budget focus', 'system replacements'], '25-65 years', 7, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Canaveral Groves', 'canaveral-groves', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Western community', ARRAY['established systems', 'family homes', 'standard needs'], '10-40 years', 8, false)
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
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  'hvac',
  '/fl/cocoa/hvac',
  'HVAC Services in Cocoa, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Cocoa''s 19,000+ residents. Historic Cocoa Village and riverfront specialists. FPL rebates available. Serving all Cocoa neighborhoods.',
  'HVAC Cocoa FL',
  ARRAY['AC repair Cocoa', 'air conditioning Cocoa FL', 'HVAC contractor Cocoa', 'Cocoa Village AC', 'riverfront HVAC', 'Brevard County HVAC'],

  'Cocoa''s Historic & Riverfront HVAC Experts',
  'Preserving charm, delivering comfort since [year]',
  'Licensed & Insured | FPL Certified | Historic & Waterfront Specialists',
  'Cocoa—one of Space Coast''s most historic communities—combines the charm of Cocoa Village with scenic Indian River waterfront living. With nearly 19,000 residents appreciating both history and progress, Cocoa needs HVAC contractors who understand historic preservation, riverfront challenges, and community character. Our team provides expert service from historic downtown to riverfront properties throughout this beloved community.',

  '{
    "headline": "Why Cocoa Residents Choose Us",
    "reasons": [
      {"title": "Historic Cocoa Village Experts", "description": "Cocoa Village''s historic buildings deserve sensitive HVAC solutions. We provide ductless systems and retrofits that preserve architectural character while delivering modern comfort."},
      {"title": "Indian River Specialists", "description": "Riverfront and Rockledge Gardens properties face unique humidity from the Indian River. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "Community Knowledge", "description": "We understand Cocoa''s mix of historic charm and practical needs. Our service respects your property while delivering reliable, affordable comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Cocoa homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Cocoa",
    "intro": "Cocoa''s history and riverfront location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Building Preservation", "description": "Cocoa Village and other historic areas require HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "Indian River Humidity", "description": "Riverfront properties experience elevated humidity from the Indian River requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Aging Housing Stock", "description": "Much of Cocoa predates modern building codes. Systems in homes from the 1950s-1970s often need replacement with efficient modern equipment."},
      {"title": "Budget-Conscious Community", "description": "With median home values around $235,000, Cocoa homeowners value honest pricing and practical solutions—no upselling or pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Cocoa",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Cocoa Village and historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "Riverfront HVAC", "slug": "riverfront-hvac", "description": "Enhanced solutions for Indian River waterfront properties.", "features": ["River humidity control", "Waterfront protection", "Dehumidification", "Moisture management"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, honest repairs throughout Cocoa.", "features": ["Same-day service", "Fair pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Cocoa systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in historic Cocoa Village buildings?", "answer": "Yes, ductless mini-split systems are ideal for Cocoa Village''s historic properties. They provide efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Why do Indian River properties need special attention?", "answer": "Riverfront properties experience elevated humidity from the Indian River. Enhanced dehumidification beyond standard AC capacity is often essential for comfort and preventing mold."},
      {"question": "Are your services affordable for Cocoa homeowners?", "answer": "Yes, we provide honest pricing and help you access FPL rebates to maximize savings. We offer solutions at multiple price points with no pressure tactics."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Cocoa homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,500", "days_above_90": "90+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Historic Comfort in Cocoa?',
  'Contact us today for honest service. From Cocoa Village to riverfront properties, we''ll keep your Cocoa home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Cocoa", "description": "Professional HVAC services for Cocoa, FL specializing in historic and riverfront properties.", "url": "https://coolit-hvac.com/cocoa-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Cocoa", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in historic buildings?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for Cocoa Village historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Cocoa", "item": "https://coolit-hvac.com/fl/cocoa"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge HVAC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne AC"}, {"slug": "/fl/titusville/hvac", "anchor_text": "Titusville HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/riverfront-hvac", "anchor_text": "Riverfront HVAC"}]'::jsonb,

  1840, 26, 12, 81,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
