-- ============================================
-- Palm Harbor, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor / Tampa Bay
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b0c1d2e3-f4a5-6789-3456-012345678901',
  'Palm Harbor', 'palm-harbor', 'Florida', 'FL', 'Pinellas', 'pinellas-county',
  28.0778, -82.7637,
  ARRAY['34683', '34684', '34685'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
  true, 85
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
  'b0c1d2e3-f4a5-6789-3456-012345678901',
  NOW(),
  64875, 'US Census Bureau ACS 2023',
  68542, 385000, 74.8,
  ARRAY['single-family', 'condo', 'townhouse', 'waterfront'],
  '{"pre-1980": 15, "1980s-1990s": 45, "2000s-2010s": 30, "2020s": 10}'::jsonb,
  90, 54, 74, 3200, 85, 52.4, 'moderate',
  'Subtropical climate moderated by Gulf proximity. Popular retirement and family community. North Pinellas County location with easy Tampa access.',
  ARRAY['BayCare Health System', 'Pinellas County Schools', 'AdventHealth', 'Local businesses', 'Innisbrook Resort', 'Retail and service industry'],
  ARRAY['Innisbrook Resort', 'John Chesnut Sr. Park', 'Wall Springs Park', 'Palm Harbor Marina', 'Downtown Palm Harbor', 'Sutherland Bayou'],
  ARRAY['Palm Harbor Citrus Festival', 'Art in the Park', 'Kiwanis Club Events', 'Valspar Championship (PGA)'],
  ARRAY['Pinellas County Schools'],
  'Downtown Palm Harbor revitalization. Residential infill development. Innisbrook area improvements. US 19 corridor development.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'Pinellas County Utilities',
  180,
  'Florida Building Code 8th Edition (2023), Pinellas County amendments',
  '{"hvac_replacement": "Permit required for all HVAC work", "inspection": "Final inspection required", "coastal_requirements": "Enhanced standards in coastal zones"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Blair''s Air Conditioning', 'Cornerstone Pros', 'Air Zero', 'Gulf Coast Air Systems'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Innisbrook', 'innisbrook', 'West', 'golf-community', '1970s-2000s', 'Upper income', 'Resort and golf community, PGA Tour venue', ARRAY['golf course humidity', 'resort-style homes', 'vacation rentals', 'premium demands'], '15-45 years', 1, true),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'East Lake Woodlands', 'east-lake-woodlands', 'East', 'single-family', '1980s-2000s', 'Upper middle income', 'Master-planned community', ARRAY['established systems', 'family homes', 'HOA standards', 'efficiency upgrades'], '15-35 years', 2, true),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Crystal Beach', 'crystal-beach', 'West', 'waterfront', '1950s-2000s', 'Upper middle income', 'Bayfront neighborhood', ARRAY['salt air exposure', 'bayfront humidity', 'older to newer homes', 'corrosion protection'], '10-60 years', 3, true),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Downtown Palm Harbor', 'downtown-palm-harbor', 'Central', 'mixed', '1960s-1990s', 'Middle income', 'Historic downtown area', ARRAY['older buildings', 'mixed commercial', 'renovation needs'], '20-50 years', 4, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Lansbrook', 'lansbrook', 'East', 'single-family', '1980s-2000s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'premium preferences'], '15-35 years', 5, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Tarpon Woods', 'tarpon-woods', 'North', 'golf-community', '1980s-1990s', 'Upper middle income', 'Golf community', ARRAY['1980s-90s systems', 'golf course adjacent', 'modernization needs'], '25-40 years', 6, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Highland Lakes', 'highland-lakes', 'Central', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'lakefront humidity', 'efficiency updates'], '25-45 years', 7, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Curlew Creek', 'curlew-creek', 'South', 'single-family', '1980s-2000s', 'Middle income', 'Family neighborhood', ARRAY['family homes', 'standard systems', 'varied ages'], '15-35 years', 8, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Ozona', 'ozona', 'Southwest', 'waterfront', '1960s-2000s', 'Upper middle income', 'Bayfront community', ARRAY['waterfront systems', 'salt exposure', 'varied home ages'], '15-50 years', 9, false),
  ('b0c1d2e3-f4a5-6789-3456-012345678901', 'Lake St. George', 'lake-st-george', 'East', 'single-family', '1990s-2010s', 'Upper middle income', 'Lakefront homes', ARRAY['lakefront humidity', 'newer construction', 'family sizing'], '10-28 years', 10, false)
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
  'b0c1d2e3-f4a5-6789-3456-012345678901',
  'hvac',
  '/fl/palm-harbor/hvac',
  'HVAC Services in Palm Harbor, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Palm Harbor''s 65,000+ residents. Duke Energy rebates up to $1,700. Serving Innisbrook, East Lake & all neighborhoods. Golf community specialists!',
  'HVAC Palm Harbor FL',
  ARRAY['AC repair Palm Harbor', 'air conditioning Palm Harbor FL', 'HVAC contractor Palm Harbor', 'Innisbrook AC', 'Duke Energy rebates Palm Harbor', 'Pinellas County HVAC'],

  'Palm Harbor''s Trusted HVAC Experts',
  'From Innisbrook to Crystal Beach, we keep Palm Harbor comfortable',
  'Licensed & Insured | Duke Energy Certified | Golf Community Specialists',
  'Palm Harbor combines the best of Tampa Bay living—beautiful waterfront, world-class golf at Innisbrook, and family-friendly neighborhoods throughout. With over 65,000 residents enjoying the area''s subtropical climate, reliable air conditioning is essential for year-round comfort. Our team provides expert HVAC service from the prestigious Innisbrook resort community to the charming bayfront homes of Crystal Beach, with Duke Energy rebate expertise to maximize your savings.',

  '{
    "headline": "Why Palm Harbor Homeowners Choose Us",
    "reasons": [
      {"title": "Golf Community Experts", "description": "Home to Innisbrook Resort and the Valspar Championship, Palm Harbor has premier golf communities. We understand the unique needs of these properties and their demanding homeowners."},
      {"title": "Duke Energy Rebate Specialists", "description": "We help Palm Harbor homeowners access up to $1,700 in combined Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Waterfront Knowledge", "description": "From Crystal Beach to Ozona, Palm Harbor''s bayfront properties face unique challenges. We provide salt-air protection and humidity control solutions."},
      {"title": "Established Community Experience", "description": "Many Palm Harbor homes date to the 1980s boom. We specialize in upgrading these established properties with modern, efficient systems."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Palm Harbor",
    "intro": "Palm Harbor''s coastal location and mature communities create specific HVAC considerations:",
    "challenges": [
      {"title": "Golf Course Humidity", "description": "Properties near Innisbrook and other golf courses experience elevated humidity from course irrigation. Enhanced dehumidification maintains comfort."},
      {"title": "1980s Housing Stock", "description": "Much of Palm Harbor was built during the 1980s boom. Many original HVAC systems are due for replacement with modern, efficient equipment."},
      {"title": "Bayfront Salt Air", "description": "Crystal Beach, Ozona, and other bayfront areas face accelerated equipment corrosion. Coastal coatings and enhanced maintenance protect your investment."},
      {"title": "Mixed Property Types", "description": "From Innisbrook vacation condos to established single-family homes, Palm Harbor requires varied HVAC approaches."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Palm Harbor",
    "services": [
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Specialized service for Palm Harbor''s golf communities including vacation rental properties.", "features": ["Vacation rental service", "Golf course humidity", "Premium equipment", "HOA compliant"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Palm Harbor.", "features": ["Same-day service", "All brands", "90-day warranty", "Senior discounts"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Upgrades", "slug": "system-upgrades", "description": "Modernize your 1980s-era system with efficient new equipment.", "features": ["1980s system replacement", "Efficiency improvements", "Duct updates", "Smart controls"]},
      {"name": "Coastal Protection", "slug": "coastal-protection", "description": "Salt air protection for bayfront and waterfront properties.", "features": ["Coastal coil coating", "Corrosion-resistant units", "Enhanced maintenance", "Salt rinse service"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Innisbrook resort properties?", "answer": "Yes, we service both residential and vacation rental properties throughout the Innisbrook community. We understand the unique demands of resort properties."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. A Home Energy Check within 24 months is required for some rebates."},
      {"question": "When should I replace my 1980s AC system?", "answer": "Systems from the 1980s have exceeded their typical lifespan. If your system needs frequent repairs or your bills are rising, replacement with a modern efficient system saves money long-term."},
      {"question": "Do bayfront homes need special HVAC consideration?", "answer": "Yes, salt air accelerates corrosion on outdoor equipment. We recommend coastal coil coatings and quarterly salt rinse service for bayfront properties."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "74%", "cooling_degree_days": "3,200", "days_above_90": "85+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready to Upgrade Your Palm Harbor Comfort?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and find the perfect system for your Palm Harbor home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Palm Harbor", "description": "Professional HVAC services in Palm Harbor, FL.", "url": "https://coolit-hvac.com/palm-harbor-fl", "telephone": "+1-727-555-COOL", "areaServed": {"@type": "City", "name": "Palm Harbor", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Innisbrook properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we service residential and vacation rental properties throughout Innisbrook."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Palm Harbor", "item": "https://coolit-hvac.com/fl/palm-harbor"}]}'::jsonb,

  '/fl/pinellas-county',
  '[{"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater HVAC"}, {"slug": "/fl/tarpon-springs/hvac", "anchor_text": "Tarpon Springs AC"}, {"slug": "/fl/dunedin/hvac", "anchor_text": "Dunedin HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1860, 26, 16, 87,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
