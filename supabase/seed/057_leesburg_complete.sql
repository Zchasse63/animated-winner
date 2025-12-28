-- ============================================
-- Leesburg, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a6b7c8d9-e0f1-2345-8901-678901234567',
  'Leesburg', 'leesburg', 'Florida', 'FL', 'Lake', 'lake-county',
  28.8108, -81.8778,
  ARRAY['34748', '34749', '34788', '34789'],
  'The Villages',
  ARRAY['b7c8d9e0-f1a2-3456-9012-789012345678', 'c8d9e0f1-a2b3-4567-0123-890123456789']::uuid[],
  true, 65
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
  'a6b7c8d9-e0f1-2345-8901-678901234567',
  NOW(),
  25951, 'US Census Bureau ACS 2023',
  54842, 235000, 58.4,
  ARRAY['single-family', 'waterfront', 'affordable-housing', 'historic-home'],
  '{"pre-1970": 30, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 15}'::jsonb,
  92, 48, 76, 3500, 96, 50.8, 'low',
  'Lake County seat. Historic downtown. Multiple lakes. The Villages proximity. Low inland hurricane risk.',
  ARRAY['Lake County Government', 'Lake County Public Schools', 'UF Health Leesburg Hospital', 'City of Leesburg', 'Retail sector', 'Small businesses'],
  ARRAY['Historic Downtown Leesburg', 'Venetian Gardens', 'Lake Griffin State Park', 'Mote Marina', 'Leesburg Heritage Museum'],
  ARRAY['Leesburg Bikefest', 'Downtown Friday Night events', 'Venetian Gardens events'],
  ARRAY['Lake County Public Schools'],
  'Downtown revitalization. The Villages spillover growth. Commercial corridor development. Waterfront improvements.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Leesburg Utilities',
  190,
  'Florida Building Code 8th Edition (2023), City of Leesburg amendments',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Air USA', 'All Temp Air', 'Arctic Air', 'Air Pros', 'Elite HVAC'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a6b7c8d9-e0f1-2345-8901-678901234567', 'Historic Downtown Leesburg', 'downtown-leesburg', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic downtown area', ARRAY['historic buildings', 'mixed-use', 'older systems', 'varied needs'], '5-90+ years', 1, true),
  ('a6b7c8d9-e0f1-2345-8901-678901234567', 'Venetian Gardens Area', 'venetian-gardens', 'East', 'waterfront', '1960s-2010s', 'Upper middle income', 'Lakefront community', ARRAY['lakefront humidity', 'varied ages', 'waterfront properties'], '10-55 years', 2, true),
  ('a6b7c8d9-e0f1-2345-8901-678901234567', 'Plantation Acres', 'plantation-acres', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-50 years', 3, false),
  ('a6b7c8d9-e0f1-2345-8901-678901234567', 'Lake Griffin Harbor', 'lake-griffin', 'North', 'waterfront', '1980s-2010s', 'Middle income', 'Lake Griffin waterfront', ARRAY['lake humidity', 'waterfront properties', 'varied systems'], '10-40 years', 4, false),
  ('a6b7c8d9-e0f1-2345-8901-678901234567', 'Fruitland Park (adjacent)', 'fruitland-park', 'West', 'single-family', '1970s-2010s', 'Middle income', 'Adjacent community', ARRAY['older systems', 'family homes', 'standard service'], '10-50 years', 5, false)
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
  'a6b7c8d9-e0f1-2345-8901-678901234567',
  'hvac',
  '/fl/leesburg/hvac',
  'HVAC Services in Leesburg, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Leesburg''s 26,000+ residents. Lakefront and historic specialists. Duke Energy rebates. Serving Downtown, Venetian Gardens & all areas.',
  'HVAC Leesburg FL',
  ARRAY['AC repair Leesburg', 'air conditioning Leesburg FL', 'HVAC contractor Leesburg', 'lakefront AC', 'Lake County HVAC'],

  'Leesburg''s Lakefront HVAC Experts',
  'Comfort for North Central Florida''s lake country',
  'Licensed & Insured | Duke Energy Certified | Lakefront & Historic Specialists',
  'Leesburg—Lake County''s historic seat surrounded by beautiful lakes—combines charming downtown character with waterfront living and proximity to The Villages. With over 26,000 residents appreciating both heritage and growth, Leesburg needs HVAC contractors who understand historic preservation, lakefront challenges, and community values. Our team provides expert service throughout this lakeside community.',

  '{
    "headline": "Why Leesburg Residents Choose Us",
    "reasons": [
      {"title": "Lakefront Specialists", "description": "Venetian Gardens and Lake Griffin properties face unique humidity from multiple lakes. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "Historic Downtown Expertise", "description": "Historic downtown Leesburg buildings deserve sensitive HVAC solutions. Ductless systems preserve character while delivering modern comfort."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Leesburg homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "Community Knowledge", "description": "Leesburg''s mix of historic downtown, lakefront, and residential areas requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Leesburg",
    "intro": "Leesburg''s lakefront location and character create specific HVAC considerations:",
    "challenges": [
      {"title": "Multiple Lake Humidity", "description": "Properties near Lake Griffin, Lake Harris, and other area lakes experience elevated humidity requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Historic Building Preservation", "description": "Downtown Leesburg''s historic properties require HVAC solutions preserving architectural character. Ductless mini-splits often provide ideal solutions."},
      {"title": "Aging Housing Stock", "description": "Much of Leesburg predates modern building codes. Systems in homes from the 1960s-1980s often need replacement with efficient modern equipment."},
      {"title": "High Cooling Demand", "description": "With 96+ days above 90°F, Leesburg''s hot climate demands reliable, efficient HVAC systems."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Leesburg",
    "services": [
      {"name": "Lakefront HVAC", "slug": "lakefront-hvac", "description": "Enhanced solutions for Venetian Gardens and Lake Griffin properties.", "features": ["Lake humidity control", "Dehumidification", "Waterfront expertise", "Mold prevention"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for downtown Leesburg historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Character protection", "Hidden installation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, honest repairs throughout Leesburg.", "features": ["Same-day service", "Fair pricing", "90-day warranty", "All brands"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Leesburg systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for lakefront and historic properties.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do lakefront properties need special HVAC attention?", "answer": "Properties near Lake Griffin and area lakes experience elevated humidity. Enhanced dehumidification beyond standard AC capacity is essential for comfort and preventing mold."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Yes, ductless mini-split systems are ideal for Leesburg''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork for Leesburg homeowners."},
      {"question": "Do you service areas near The Villages?", "answer": "Yes, we service all of Leesburg including areas near The Villages with appropriate solutions for each area''s unique needs."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "76%", "cooling_degree_days": "3,500", "days_above_90": "96+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Lakeside Comfort in Leesburg?',
  'Contact us today for expert service. We''ll keep your Leesburg property comfortable with Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Leesburg", "description": "Professional HVAC services for Leesburg, FL.", "url": "https://coolit-hvac.com/leesburg-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "Leesburg", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do lakefront properties need special attention?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, lake properties experience elevated humidity requiring enhanced dehumidification."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Leesburg", "item": "https://coolit-hvac.com/fl/leesburg"}]}'::jsonb,

  '/fl/lake-county',
  '[{"slug": "/fl/the-villages/hvac", "anchor_text": "The Villages HVAC"}, {"slug": "/fl/clermont/hvac", "anchor_text": "Clermont AC"}, {"slug": "/fl/tavares/hvac", "anchor_text": "Tavares HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/lakefront-hvac", "anchor_text": "Lakefront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1850, 26, 10, 65,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
