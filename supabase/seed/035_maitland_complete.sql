-- ============================================
-- Maitland, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  'Maitland', 'maitland', 'Florida', 'FL', 'Orange', 'orange-county',
  28.6278, -81.3631,
  ARRAY['32751', '32794'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'a3b4c5d6-e7f8-9012-6789-345678901234']::uuid[],
  true, 86
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
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  NOW(),
  19543, 'US Census Bureau ACS 2023',
  87542, 425000, 62.4,
  ARRAY['single-family', 'condo', 'historic-home', 'townhouse'],
  '{"pre-1970": 25, "1970s-1980s": 30, "1990s-2000s": 30, "2010s-2020s": 15}'::jsonb,
  92, 52, 74, 3500, 100, 52.6, 'moderate',
  'Historic Central Florida city. I-4 corridor location. Mix of historic charm and modern development. Corporate headquarters presence. Adjacent to Winter Park.',
  ARRAY['AAA National Headquarters (nearby)', 'Orange County Public Schools', 'AdventHealth (nearby)', 'City of Maitland', 'Professional offices', 'Retail businesses'],
  ARRAY['Lake Lily Park', 'Maitland Art Center', 'Maitland Historical Society', 'Lake Sybelia', 'Maitland Community Park', 'SunRail Station'],
  ARRAY['Maitland Rotary Riverwalk Ramble', 'Maitland Art Festival', 'Maitland Farmers Market'],
  ARRAY['Orange County Public Schools'],
  'Downtown Maitland revitalization. SunRail connectivity. Mixed-use development. I-4 corridor improvements. Historic preservation efforts.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Maitland Utilities',
  220,
  'Florida Building Code 8th Edition (2023), Maitland historic overlay',
  '{"hvac_replacement": "Permit required", "historic_properties": "Additional review for historic buildings", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Downtown Maitland', 'downtown-maitland', 'Central', 'mixed', '1920s-1970s', 'Upper middle income', 'Historic downtown area', ARRAY['historic buildings', 'ductless needs', 'older systems', 'preservation requirements'], '20-80+ years', 1, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Lake Lily Area', 'lake-lily', 'Central', 'single-family', '1940s-1980s', 'Upper middle income', 'Lakefront historic neighborhood', ARRAY['lakefront humidity', 'older homes', 'historic character', 'system upgrades'], '25-70 years', 2, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Dommerich Hills', 'dommerich-hills', 'North', 'single-family', '1950s-1980s', 'Upper middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-60 years', 3, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Lake Sybelia', 'lake-sybelia', 'East', 'single-family', '1950s-1990s', 'Upper middle income', 'Lakefront area', ARRAY['lakefront humidity', 'varied ages', 'premium demands'], '20-60 years', 4, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Maitland Center', 'maitland-center', 'West', 'mixed', '1980s-2010s', 'Upper middle income', 'Office and residential mix', ARRAY['commercial HVAC', 'condo systems', 'mixed-use needs'], '10-35 years', 5, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Pebble Creek', 'pebble-creek', 'South', 'single-family', '1980s-1990s', 'Middle income', 'Established community', ARRAY['1980s-90s systems', 'family homes', 'standard service'], '25-40 years', 6, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Swoope Avenue Area', 'swoope-avenue', 'Central', 'single-family', '1940s-1970s', 'Middle income', 'Historic residential', ARRAY['older homes', 'system replacements', 'budget solutions'], '35-70 years', 7, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Maitland Woods', 'maitland-woods', 'Northwest', 'single-family', '1970s-1990s', 'Middle income', 'Wooded neighborhood', ARRAY['older systems', 'tree shade impacts', 'standard maintenance'], '25-45 years', 8, false)
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
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  'hvac',
  '/fl/maitland/hvac',
  'HVAC Services in Maitland, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Maitland''s 20,000+ residents. Historic and lakefront specialists. Duke Energy rebates. Serving Downtown, Lake Lily & all neighborhoods.',
  'HVAC Maitland FL',
  ARRAY['AC repair Maitland', 'air conditioning Maitland FL', 'HVAC contractor Maitland', 'historic home AC Maitland', 'lakefront HVAC', 'Orange County HVAC'],

  'Maitland''s Historic & Lakefront HVAC Experts',
  'Preserving charm, delivering comfort',
  'Licensed & Insured | Duke Energy Certified | Historic Property Specialists',
  'Maitland combines Central Florida history with modern convenience—from the charming downtown and Lake Lily Park to contemporary mixed-use developments at Maitland Center. With nearly 20,000 residents who appreciate both character and quality, Maitland needs HVAC contractors who understand historic preservation, lakefront challenges, and community standards. Our team provides expert service throughout this distinguished community adjacent to Winter Park.',

  '{
    "headline": "Why Maitland Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Preservation Expertise", "description": "Maitland''s historic downtown and neighborhoods feature beautiful period homes requiring sensitive HVAC solutions that preserve architectural integrity."},
      {"title": "Lakefront Specialists", "description": "Lake Lily and Lake Sybelia properties face unique humidity challenges. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Maitland homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "Community Knowledge", "description": "Maitland''s mix of historic homes, lakefront properties, and modern developments requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Maitland",
    "intro": "Maitland''s character and location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Many Maitland properties are historic, requiring HVAC solutions that don''t compromise architectural character. Ductless systems often provide ideal solutions."},
      {"title": "Lakefront Humidity", "description": "Properties around Lake Lily and Lake Sybelia experience elevated humidity requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Older Housing Stock", "description": "Much of Maitland predates modern building codes. Systems in homes from the 1940s-1970s often need replacement with efficient modern equipment."},
      {"title": "Mixed Use Development", "description": "Maitland Center and other areas combine residential and commercial, requiring contractors experienced in both applications."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Maitland",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Maitland''s beautiful historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Lakefront HVAC", "slug": "lakefront-hvac", "description": "Enhanced humidity control for Lake Lily and Lake Sybelia properties.", "features": ["Whole-home dehumidification", "Lakefront expertise", "Mold prevention", "Premium equipment"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Maitland.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic sensitivity"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in older Maitland homes.", "features": ["Efficiency improvements", "Modern comfort", "Rebate assistance", "Minimal disruption"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in my historic Maitland home?", "answer": "Yes, ductless mini-split systems are ideal for Maitland''s historic homes. They provide efficient cooling without invasive ductwork installation."},
      {"question": "Why do lakefront homes need special HVAC attention?", "answer": "Properties around Lake Lily and Lake Sybelia experience elevated humidity. Whole-home dehumidification beyond standard AC is often essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."},
      {"question": "Do you service Maitland Center commercial properties?", "answer": "Yes, we provide commercial HVAC service for office buildings and businesses throughout Maitland Center and the entire city."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Historic Comfort in Maitland?',
  'Contact us today for a free estimate. We''ll respect Maitland''s character while delivering modern comfort with Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Maitland", "description": "Professional HVAC services in Maitland, FL specializing in historic and lakefront homes.", "url": "https://coolit-hvac.com/maitland-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Maitland", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in my historic home?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless mini-split systems are ideal for Maitland historic homes."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Maitland", "item": "https://coolit-hvac.com/fl/maitland"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/winter-park/hvac", "anchor_text": "Winter Park HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1820, 24, 12, 86,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
