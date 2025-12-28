-- ============================================
-- Sanford, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  'Sanford', 'sanford', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.8028, -81.2731,
  ARRAY['32771', '32772', '32773'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

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
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  NOW(),
  63512, 'US Census Bureau ACS 2023',
  58742, 295000, 55.3,
  ARRAY['single-family', 'historic-home', 'townhouse', 'apartment'],
  '{"pre-1950": 15, "1950s-1980s": 30, "1990s-2010s": 40, "2020s": 15}'::jsonb,
  92, 51, 73, 3500, 100, 51.8, 'moderate',
  'Humid subtropical climate. Historic downtown on Lake Monroe. Northern Orlando metro location provides slightly cooler winters. Active thunderstorm season.',
  ARRAY['Seminole County Public Schools', 'Central Florida Regional Hospital', 'Orlando Sanford International Airport', 'Seminole State College', 'City of Sanford', 'Seminole County Government', 'Mitsubishi Hitachi Power Systems'],
  ARRAY['Historic Downtown Sanford', 'Lake Monroe', 'Sanford Riverwalk', 'Central Florida Zoo', 'Wayne Densch Performing Arts Center', 'Sanford SunRail Station', 'Mayfair Country Club'],
  ARRAY['Alive After 5', 'Sanford Art Walk', 'Celery Soup Festival', 'Jazz on the Waterfront', 'Sanford Porchfest'],
  ARRAY['Seminole County Public Schools'],
  'Historic downtown revitalization. Riverwalk expansion. SunRail commuter connection. New residential developments. Growing craft brewery scene.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'City of Sanford Utilities',
  240,
  'Florida Building Code 8th Edition (2023), City of Sanford historic district amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Additional review for historic properties", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Historic Downtown', 'historic-downtown', 'Central', 'historic-home', '1900s-1950s', 'Upper middle income', 'Revitalized historic district on Lake Monroe', ARRAY['historic home retrofits', 'preservation requirements', 'ductless systems', 'older ductwork'], '20-80+ years', 1, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Mayfair', 'mayfair', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established golf course community', ARRAY['golf course humidity', '1970s-90s replacements', 'system modernization', 'efficiency upgrades'], '20-40 years', 2, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Lake Mary (adjacent)', 'sanford-lake-mary', 'Southwest', 'single-family', '1990s-2010s', 'Upper middle income', 'Newer development near Lake Mary border', ARRAY['newer construction', 'HOA standards', 'smart home integration', 'premium systems'], '10-25 years', 3, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Sanford Lakefront', 'lakefront', 'East', 'single-family', '1960s-1990s', 'Middle income', 'Lakefront residential areas', ARRAY['lakefront humidity', 'older systems', 'waterfront corrosion', 'efficiency updates'], '20-50 years', 4, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Midway', 'midway', 'East', 'single-family', '1970s-2000s', 'Moderate income', 'Established residential community', ARRAY['aging systems', 'budget-friendly solutions', 'standard maintenance'], '15-40 years', 5, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Hidden Lake', 'hidden-lake', 'West', 'single-family', '1990s-2000s', 'Middle income', 'Planned community with amenities', ARRAY['1990s-2000s systems', 'HOA requirements', 'family home sizing'], '15-28 years', 6, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Ravenna Park', 'ravenna-park', 'Northwest', 'single-family', '2000s-2010s', 'Upper middle income', 'Newer upscale development', ARRAY['newer systems', 'premium demands', 'multi-zone needs'], '8-20 years', 7, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Celery Avenue Area', 'celery-avenue', 'North', 'mixed', '1950s-1980s', 'Moderate income', 'Historic agricultural area', ARRAY['older homes', 'manufactured homes', 'budget solutions'], '25-60 years', 8, false)
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
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  'hvac',
  '/fl/sanford/hvac',
  'HVAC Services in Sanford, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Sanford''s 63,000+ residents. Duke Energy rebates available. Serving Historic Downtown, Mayfair & all neighborhoods. Historic home specialists!',
  'HVAC Sanford FL',
  ARRAY['AC repair Sanford', 'air conditioning Sanford FL', 'HVAC contractor Sanford', 'historic home AC Sanford', 'Duke Energy rebates Sanford', 'Seminole County HVAC'],

  'Sanford''s Trusted HVAC Experts',
  'Specialists in historic and modern home comfort',
  'Licensed & Insured | Duke Energy Certified | Historic Home Experts',
  'Sanford''s beautiful historic downtown and growing modern communities each present unique HVAC challenges. From century-old buildings along First Street to new construction near Lake Mary, our team has the expertise to deliver comfort throughout this charming city. With over 63,000 residents and 100+ days above 90°F annually, reliable air conditioning isn''t optional—it''s essential. We''re Duke Energy certified to help you maximize rebates while enjoying optimal comfort.',

  '{
    "headline": "Why Sanford Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "Sanford''s historic downtown features beautiful homes that need specialized HVAC solutions. We retrofit modern systems while preserving architectural integrity."},
      {"title": "Duke Energy Rebate Experts", "description": "We help you access up to $300 for AC replacement and $150 for heat pumps through Duke Energy''s rebate programs."},
      {"title": "SunRail Corridor Service", "description": "We serve the entire SunRail corridor from downtown Sanford through Lake Mary, offering convenient scheduling for commuters."},
      {"title": "Lakefront Humidity Solutions", "description": "Properties near Lake Monroe face unique humidity challenges. We provide specialized dehumidification solutions for lakefront homes."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Sanford",
    "intro": "Sanford''s mix of historic and new construction creates diverse HVAC needs:",
    "challenges": [
      {"title": "Historic Building Retrofits", "description": "Downtown Sanford''s 100+ year old buildings often lack ductwork. We specialize in ductless systems and creative solutions that preserve historic character."},
      {"title": "Lake Monroe Humidity", "description": "Properties near Lake Monroe experience elevated humidity levels. Proper dehumidification is essential for comfort and preventing mold."},
      {"title": "Mixed Housing Stock", "description": "From 1920s bungalows to 2020s construction, Sanford''s diverse housing requires varied approaches to HVAC installation and service."},
      {"title": "Summer Heat", "description": "With 100+ days above 90°F, Sanford summers demand robust cooling systems and regular maintenance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Sanford",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Sanford''s historic properties including ductless systems and sensitive retrofits.", "features": ["Ductless mini-splits", "Preservation-friendly", "Hidden installation", "Zoned comfort"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Sanford. Same-day service available.", "features": ["Same-day service", "All brands", "90-day warranty", "Upfront pricing"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations sized for Sanford''s climate with Duke Energy rebate assistance.", "features": ["Manual J calculations", "Duke Energy rebates", "10-year warranty", "Financing available"]},
      {"name": "Dehumidification", "slug": "dehumidification", "description": "Whole-home dehumidification essential for lakefront and historic properties.", "features": ["Whole-home systems", "Lakefront solutions", "Mold prevention", "Integrated controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in my historic Sanford home without ductwork?", "answer": "Yes! Ductless mini-split systems are perfect for historic homes. They provide excellent cooling without invasive ductwork installation."},
      {"question": "What rebates does Duke Energy offer?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. A free Home Energy Check is required within 24 months."},
      {"question": "Do you service lakefront properties?", "answer": "Yes, we specialize in lakefront homes near Lake Monroe. We provide dehumidification solutions to handle the increased humidity these properties experience."},
      {"question": "How often should I service my AC in Sanford?", "answer": "We recommend bi-annual maintenance for Sanford homes. The extended cooling season and humidity make regular maintenance essential."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready to Upgrade Your Sanford Home Comfort?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and find the perfect system for your historic downtown or modern Sanford home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Sanford", "description": "Professional HVAC services in Sanford, FL", "url": "https://coolit-hvac.com/sanford-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Sanford", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in my historic Sanford home?", "acceptedAnswer": {"@type": "Answer", "text": "Yes! Ductless mini-split systems are perfect for historic homes."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Sanford", "item": "https://coolit-hvac.com/fl/sanford"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/lake-mary/hvac", "anchor_text": "Lake Mary AC"}, {"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1850, 26, 12, 86,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
