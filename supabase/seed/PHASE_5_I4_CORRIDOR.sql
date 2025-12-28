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
-- ============================================
-- Pinellas Park, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor / Tampa Bay
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c1d2e3f4-a5b6-7890-4567-123456789012',
  'Pinellas Park', 'pinellas-park', 'Florida', 'FL', 'Pinellas', 'pinellas-county',
  27.8428, -82.6994,
  ARRAY['33781', '33782'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
  true, 83
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
  'c1d2e3f4-a5b6-7890-4567-123456789012',
  NOW(),
  54697, 'US Census Bureau ACS 2023',
  48752, 275000, 58.4,
  ARRAY['single-family', 'manufactured-home', 'condo', 'duplex'],
  '{"pre-1970": 15, "1970s-1980s": 45, "1990s-2000s": 30, "2010s-2020s": 10}'::jsonb,
  90, 53, 74, 3200, 85, 51.8, 'moderate',
  'Central Pinellas County location. Working-class community with affordable housing. Good value market. Diverse housing stock from mobile homes to single-family.',
  ARRAY['Pinellas County Schools', 'City of Pinellas Park', 'Tech Data Corporation', 'Retail and service industry', 'Manufacturing', 'Healthcare'],
  ARRAY['Pinellas Trail', 'Freedom Lake Park', 'England Brothers Park', 'Helen Howarth Park', 'Pinellas Park Performing Arts Center'],
  ARRAY['Country in the Park', 'Pinellas Park''s Got Talent', 'Movies in the Park', 'Art in the Park'],
  ARRAY['Pinellas County Schools'],
  'Pinellas Trail improvements. US 19 redevelopment. Affordable housing initiatives. Commercial corridor revitalization.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Pinellas Park Utilities',
  190,
  'Florida Building Code 8th Edition (2023), Pinellas County amendments',
  '{"hvac_replacement": "Permit required", "manufactured_home": "Special requirements for mobile home HVAC", "inspection": "Final inspection required"}'::jsonb,
  'low',
  ARRAY['Del-Air Heating and Air', 'Blair''s Air Conditioning', 'Cornerstone Pros', 'Air Zero', 'Easy AC'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Mainlands', 'mainlands', 'Central', 'single-family', '1970s-1980s', 'Middle income', 'Large established subdivision', ARRAY['1970s-80s systems', 'concrete block homes', 'efficiency upgrades needed', 'ductwork issues'], '25-45 years', 1, true),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Skyway Estates', 'skyway-estates', 'South', 'single-family', '1960s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'budget replacements', 'basic maintenance needs'], '25-50 years', 2, true),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Park Boulevard Area', 'park-boulevard', 'Central', 'mixed', '1970s-2000s', 'Middle income', 'Commercial corridor area', ARRAY['mixed housing types', 'commercial HVAC', 'varied system ages'], '15-45 years', 3, true),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Pinellas Groves', 'pinellas-groves', 'East', 'manufactured-home', '1970s-1990s', 'Moderate income', 'Mobile home community', ARRAY['manufactured home systems', 'package units', 'budget solutions', 'space constraints'], '15-40 years', 4, false),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Ridgecrest', 'ridgecrest', 'North', 'single-family', '1980s-1990s', 'Middle income', 'Family neighborhood', ARRAY['1980s-90s systems', 'family homes', 'standard service'], '25-40 years', 5, false),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Bryan Dairy Area', 'bryan-dairy', 'East', 'mixed', '1980s-2000s', 'Middle income', 'Near commercial area', ARRAY['commercial proximity', 'varied housing', 'standard needs'], '15-35 years', 6, false),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'West Pinellas Park', 'west-pinellas-park', 'West', 'single-family', '1960s-1980s', 'Moderate income', 'Established area', ARRAY['older homes', 'budget solutions', 'basic systems'], '25-55 years', 7, false),
  ('c1d2e3f4-a5b6-7890-4567-123456789012', 'Gateway Area', 'gateway-area', 'North', 'mixed', '1990s-2010s', 'Middle income', 'Newer development area', ARRAY['newer systems', 'condos', 'standard maintenance'], '10-28 years', 8, false)
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
  'c1d2e3f4-a5b6-7890-4567-123456789012',
  'hvac',
  '/fl/pinellas-park/hvac',
  'HVAC Services in Pinellas Park, FL | AC Repair, Installation & Maintenance',
  'Affordable HVAC services for Pinellas Park''s 55,000+ residents. Duke Energy rebates available. Mobile home specialists. Serving Mainlands, Skyway & all neighborhoods.',
  'HVAC Pinellas Park FL',
  ARRAY['AC repair Pinellas Park', 'air conditioning Pinellas Park FL', 'HVAC contractor Pinellas Park', 'mobile home AC Pinellas Park', 'affordable HVAC Pinellas', 'Duke Energy rebates'],

  'Pinellas Park''s Value-Driven HVAC Experts',
  'Quality comfort at working-family prices',
  'Licensed & Insured | Duke Energy Certified | Mobile Home Specialists',
  'Pinellas Park is a hardworking community that deserves honest, affordable HVAC service. With over 55,000 residents in diverse housing from the established Mainlands subdivision to mobile home communities, we provide quality solutions at prices that fit real budgets. Our team specializes in the 1970s-80s homes that define much of Pinellas Park, helping homeowners upgrade aging systems while maximizing Duke Energy rebates.',

  '{
    "headline": "Why Pinellas Park Homeowners Choose Us",
    "reasons": [
      {"title": "Value-Focused Service", "description": "We understand Pinellas Park budgets. Our honest pricing and financing options make quality HVAC affordable for working families."},
      {"title": "Mobile Home Specialists", "description": "Pinellas Park has significant mobile home communities. We''re experts in manufactured home HVAC including package units and space-efficient solutions."},
      {"title": "1970s-80s Home Experts", "description": "Much of Pinellas Park was built during the 1970s-80s. We specialize in upgrading these systems with modern, efficient equipment."},
      {"title": "Duke Energy Rebates", "description": "We help you access up to $1,700 in Duke Energy rebates, making high-efficiency systems more affordable."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Pinellas Park",
    "intro": "Pinellas Park''s housing stock and demographics create specific HVAC considerations:",
    "challenges": [
      {"title": "Aging Housing Stock", "description": "Many Pinellas Park homes have original 1970s-80s HVAC systems well past their lifespan. Replacement with modern equipment dramatically improves efficiency and reliability."},
      {"title": "Manufactured Housing", "description": "Mobile homes require specialized HVAC approaches including package units, proper sizing for smaller spaces, and consideration of home construction."},
      {"title": "Budget Constraints", "description": "Working families need honest pricing and flexible payment options. We provide upfront quotes and financing to make necessary repairs and replacements accessible."},
      {"title": "Concrete Block Construction", "description": "Many Pinellas Park homes are concrete block construction, which affects ductwork routing and system design."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Pinellas Park",
    "services": [
      {"name": "Mobile Home HVAC", "slug": "mobile-home-hvac", "description": "Specialized service for Pinellas Park''s manufactured home communities.", "features": ["Package units", "Space-efficient systems", "Proper sizing", "Budget options"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout Pinellas Park.", "features": ["Same-day service", "All brands", "Upfront pricing", "No surprise fees"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations at honest prices with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Financing available", "10-year warranty", "Budget options"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade your 1970s-80s system with modern efficient equipment.", "features": ["Efficiency upgrades", "SEER2 improvements", "Lower bills", "Reliable cooling"]},
      {"name": "Duct Services", "slug": "duct-services", "description": "Duct repair and replacement for improved efficiency.", "features": ["Duct sealing", "Leak repair", "Duct replacement", "Duke Energy rebate"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance to extend system life.", "features": ["Budget-friendly", "Bi-annual service", "Priority scheduling", "Repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work on mobile home AC systems?", "answer": "Yes, we specialize in manufactured home HVAC. We service and install package units and split systems designed for mobile home applications."},
      {"question": "How much are Duke Energy rebates worth?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing—potentially $600+ in savings on your project."},
      {"question": "Do you offer financing for AC replacement?", "answer": "Yes, we offer multiple financing options to make AC replacement affordable. Many Pinellas Park homeowners qualify for low monthly payments."},
      {"question": "When should I replace my 1970s-80s AC?", "answer": "Systems from this era have far exceeded their lifespan. Modern systems are 2-3 times more efficient—replacement often pays for itself in energy savings."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "74%", "cooling_degree_days": "3,200", "days_above_90": "85+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Affordable Comfort in Pinellas Park?',
  'Contact us today for a free, no-pressure estimate. We''ll find the best solution for your budget and help you access Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Pinellas Park", "description": "Affordable HVAC services in Pinellas Park, FL.", "url": "https://coolit-hvac.com/pinellas-park-fl", "telephone": "+1-727-555-COOL", "areaServed": {"@type": "City", "name": "Pinellas Park", "addressRegion": "FL"}, "priceRange": "$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work on mobile home AC?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in manufactured home HVAC including package units."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Pinellas Park", "item": "https://coolit-hvac.com/fl/pinellas-park"}]}'::jsonb,

  '/fl/pinellas-county',
  '[{"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg HVAC"}, {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC"}, {"slug": "/fl/largo/hvac", "anchor_text": "Largo HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/mobile-home-hvac", "anchor_text": "Mobile Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1780, 24, 12, 85,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Land O' Lakes, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor / Tampa Bay
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  'Land O'' Lakes', 'land-o-lakes', 'Florida', 'FL', 'Pasco', 'pasco-county',
  28.2189, -82.4576,
  ARRAY['34637', '34638', '34639'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
  true, 84
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
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  NOW(),
  41467, 'US Census Bureau ACS 2023',
  85742, 385000, 84.2,
  ARRAY['single-family', 'new-construction', 'golf-community', 'active-adult'],
  '{"pre-2000": 20, "2000s": 35, "2010s": 30, "2020s": 15}'::jsonb,
  91, 52, 73, 3300, 95, 54.2, 'low',
  'Inland location with lower hurricane risk. Rapidly growing suburb north of Tampa. Master-planned communities. Family-oriented with excellent schools.',
  ARRAY['Pasco County Schools', 'Medical Center of Trinity (nearby)', 'Publix', 'Florida Hospital (nearby)', 'Local businesses', 'Construction industry'],
  ARRAY['Conner Preserve', 'Wilderness Lake Preserve', 'Land O'' Lakes Heritage Park', 'Crews Lake Wilderness Park', 'Oakstead trails'],
  ARRAY['Land O'' Lakes Holiday Parade', 'Fall Festival', 'Community events'],
  ARRAY['Pasco County Schools'],
  'Continued residential growth. Connerton development. New schools construction. SR 54 corridor expansion. Suncoast Parkway access improvements.',
  'Duke Energy Florida / Withlacoochee River Electric Cooperative',
  '{
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}, "duct_sealing": {"amount": 150}},
    "wrec": {"ac_replacement": {"amount": 200, "requirements": "SEER 15+ system"}, "heat_pump": {"amount": 100}}
  }'::jsonb,
  'TECO Peoples Gas',
  'Pasco County Utilities',
  280,
  'Florida Building Code 8th Edition (2023), Pasco County amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance required", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Cornerstone Pros', 'Air Zero', 'Comfort Temp', 'Gulf Coast Air Systems'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy / WREC", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Connerton', 'connerton', 'East', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'builder-grade systems', 'smart home integration', 'energy efficiency'], '0-12 years', 1, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Lake Padgett Estates', 'lake-padgett', 'South', 'single-family', '1990s-2010s', 'Upper middle income', 'Lakefront community', ARRAY['lakefront humidity', 'family homes', 'established systems'], '10-28 years', 2, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Oakstead', 'oakstead', 'Central', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'HOA requirements', 'family sizing', 'smart systems'], '5-20 years', 3, true),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Wilderness Lake Preserve', 'wilderness-lake', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Nature preserve community', ARRAY['preserve humidity', 'family homes', 'HOA standards'], '10-20 years', 4, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Dupree Lakes', 'dupree-lakes', 'Central', 'single-family', '2000s-2010s', 'Middle income', 'Planned community', ARRAY['standard systems', 'family homes', 'HOA requirements'], '10-20 years', 5, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Ballantrae', 'ballantrae', 'South', 'golf-community', '2000s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'premium demands', 'HOA standards'], '10-20 years', 6, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Caliente', 'caliente', 'East', 'active-adult', '2000s-2010s', 'Upper middle income', '55+ clothing optional resort', ARRAY['active adult needs', 'energy efficiency', 'quiet operation'], '10-20 years', 7, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Northwood', 'northwood', 'Northwest', 'single-family', '1990s-2000s', 'Middle income', 'Established neighborhood', ARRAY['1990s-2000s systems', 'standard service', 'family homes'], '15-28 years', 8, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Crews Lake Area', 'crews-lake', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Near Crews Lake', ARRAY['lakefront properties', 'varied ages', 'mixed needs'], '15-35 years', 9, false),
  ('d2e3f4a5-b6c7-8901-5678-234567890123', 'Sanders Farms', 'sanders-farms', 'South', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community', ARRAY['new construction', 'HOA standards', 'family sizing'], '0-12 years', 10, false)
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
  'd2e3f4a5-b6c7-8901-5678-234567890123',
  'hvac',
  '/fl/land-o-lakes/hvac',
  'HVAC Services in Land O'' Lakes, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Land O'' Lakes'' 41,000+ residents. New construction specialists. Duke Energy rebates available. Serving Connerton, Oakstead & all neighborhoods.',
  'HVAC Land O Lakes FL',
  ARRAY['AC repair Land O Lakes', 'air conditioning Land O Lakes FL', 'HVAC contractor Land O Lakes', 'new construction AC', 'Duke Energy rebates', 'Pasco County HVAC'],

  'Land O'' Lakes'' Growing Community HVAC Experts',
  'New construction and family home specialists',
  'Licensed & Insured | Duke Energy Certified | New Construction Experts',
  'Land O'' Lakes is one of Tampa Bay''s fastest-growing communities, attracting families seeking excellent schools, master-planned neighborhoods, and a convenient location north of Tampa. With over 41,000 residents and one of the highest homeownership rates in the region at 84%, Land O'' Lakes homeowners take pride in their properties. Our team specializes in the new construction filling communities like Connerton and Oakstead, as well as established homes throughout this family-friendly area.',

  '{
    "headline": "Why Land O'' Lakes Homeowners Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Land O'' Lakes is growing rapidly with new communities like Connerton and Sanders Farms. We work with builders and new homeowners to ensure optimal HVAC installation and performance."},
      {"title": "Family-Focused Service", "description": "Land O'' Lakes is a family community. We provide honest service, clean installations, and respect for your home and time."},
      {"title": "Master-Planned Community Knowledge", "description": "With extensive HOAs throughout Land O'' Lakes, we understand community requirements and ensure installations meet all standards."},
      {"title": "Dual Utility Expertise", "description": "Land O'' Lakes is served by both Duke Energy and WREC. We help you access rebates from either utility to maximize savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Land O'' Lakes",
    "intro": "Land O'' Lakes'' growth and location create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Quality", "description": "Builder-grade systems in new Land O'' Lakes homes may be minimally sized. We help homeowners evaluate and upgrade systems for optimal comfort."},
      {"title": "HOA Requirements", "description": "Land O'' Lakes'' master-planned communities have strict requirements for equipment placement and appearance. We ensure full compliance."},
      {"title": "Preserve Humidity", "description": "Communities near nature preserves like Wilderness Lake experience elevated humidity from surrounding wetlands."},
      {"title": "Rapid Growth", "description": "Land O'' Lakes'' rapid growth means many HVAC companies are stretched thin. We''ve expanded to provide responsive service throughout the area."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Land O'' Lakes",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Land O'' Lakes'' new homes including builder-grade upgrades and system optimization.", "features": ["Builder coordination", "Manual J sizing", "System upgrades", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Land O'' Lakes communities.", "features": ["Same-day service", "All brands", "90-day warranty", "HOA-aware service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy and WREC rebate assistance.", "features": ["Utility rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance and efficiency.", "features": ["Capacity increases", "Efficiency upgrades", "Zoning additions", "Smart integration"]},
      {"name": "Indoor Air Quality", "slug": "indoor-air-quality", "description": "Combat Florida humidity and allergens with whole-home solutions.", "features": ["Dehumidification", "Air purification", "UV treatment", "HEPA filtration"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with new home builders in Land O'' Lakes?", "answer": "Yes, we work with builders throughout Land O'' Lakes and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Which utility serves my Land O'' Lakes home?", "answer": "Land O'' Lakes is served by both Duke Energy and Withlacoochee River Electric Cooperative (WREC). We help you access rebates from either utility."},
      {"question": "Should I upgrade my new home''s AC?", "answer": "Many builder-grade systems are minimally sized. If you experience uneven temperatures or high humidity, an upgrade or enhancement often improves comfort significantly."},
      {"question": "Do you comply with Land O'' Lakes HOA requirements?", "answer": "Yes, we''re familiar with requirements for Connerton, Oakstead, and other communities. We ensure all installations meet HOA standards."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "73%", "cooling_degree_days": "3,300", "days_above_90": "95+", "hurricane_risk": "Low"}'::jsonb,

  'Ready to Upgrade Your Land O'' Lakes Home Comfort?',
  'Contact us today for a free estimate. We''ll help you access utility rebates and find the perfect system for your Land O'' Lakes home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Land O'' Lakes", "description": "Professional HVAC services in Land O'' Lakes, FL.", "url": "https://coolit-hvac.com/land-o-lakes-fl", "telephone": "+1-813-555-COOL", "areaServed": {"@type": "City", "name": "Land O'' Lakes", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new home builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize their HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Land O'' Lakes", "item": "https://coolit-hvac.com/fl/land-o-lakes"}]}'::jsonb,

  '/fl/pasco-county',
  '[{"slug": "/fl/wesley-chapel/hvac", "anchor_text": "Wesley Chapel HVAC"}, {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa AC"}, {"slug": "/fl/new-port-richey/hvac", "anchor_text": "New Port Richey HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 16, 86,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Plant City, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  'Plant City', 'plant-city', 'Florida', 'FL', 'Hillsborough', 'hillsborough-county',
  28.0186, -82.1196,
  ARRAY['33563', '33564', '33565', '33566', '33567'],
  'Tampa-St. Petersburg-Clearwater',
  ARRAY[]::uuid[],
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
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  NOW(),
  40610, 'US Census Bureau ACS 2023',
  52847, 265000, 61.4,
  ARRAY['single-family', 'manufactured-home', 'farmhouse', 'new-construction'],
  '{"pre-1980": 25, "1980s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  91, 51, 73, 3350, 98, 52.8, 'low',
  'Inland I-4 corridor location with low hurricane risk. Agricultural heritage—"Winter Strawberry Capital of the World." Mix of rural properties and new developments.',
  ARRAY['Hillsborough County Schools', 'South Florida Baptist Hospital', 'Publix Distribution Center', 'Amazon (nearby)', 'Agricultural industry', 'City of Plant City'],
  ARRAY['Historic Downtown Plant City', 'Dinosaur World', 'Plant City Stadium', 'Mike E. Sansone Community Park', 'McIntosh Preserve'],
  ARRAY['Florida Strawberry Festival', 'Pig Jam BBQ Festival', 'Plant City Cruise-In', 'Strawberry Classic Golf Tournament'],
  ARRAY['Hillsborough County Public Schools'],
  'New residential development east of downtown. I-4 interchange improvements. Historic downtown revitalization. Distribution center growth.',
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying connected device"},
    "duct_repair": {"amount": 100, "requirements": "Professional duct assessment"},
    "total_available": {"amount": 500, "requirements": "Combined TECO rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Plant City Utilities',
  320,
  'Florida Building Code 8th Edition (2023), Hillsborough County amendments',
  '{"hvac_replacement": "Permit required", "manufactured_home": "Special requirements apply", "rural_properties": "May have different setback requirements", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Cornerstone Pros', 'Easy AC', 'Sun Air Services', 'Gulf Coast Air Systems'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "TECO", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Historic Downtown', 'historic-downtown-pc', 'Central', 'mixed', '1900s-1960s', 'Middle income', 'Historic downtown with character homes', ARRAY['historic home retrofits', 'older buildings', 'ductless needs', 'preservation considerations'], '25-80+ years', 1, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Walden Lake', 'walden-lake', 'South', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established systems', 'HOA requirements', 'premium options'], '15-35 years', 2, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Country Walk', 'country-walk', 'East', 'single-family', '2000s-2020s', 'Middle income', 'Newer planned community', ARRAY['newer construction', 'family homes', 'builder-grade systems'], '5-20 years', 3, true),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'East Plant City', 'east-plant-city', 'East', 'mixed', '1970s-2010s', 'Middle income', 'Growing residential area', ARRAY['varied housing', 'mixed ages', 'family homes'], '10-45 years', 4, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'North Plant City', 'north-plant-city', 'North', 'single-family', '1960s-1990s', 'Moderate income', 'Established residential', ARRAY['older systems', 'budget solutions', 'standard maintenance'], '20-55 years', 5, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Turkey Creek', 'turkey-creek', 'Southeast', 'single-family', '1990s-2010s', 'Middle income', 'Family neighborhood', ARRAY['1990s-2010s systems', 'family homes', 'standard service'], '10-28 years', 6, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Rural Plant City', 'rural-plant-city', 'Various', 'farmhouse', '1950s-2000s', 'Mixed income', 'Agricultural properties', ARRAY['rural property systems', 'well water impacts', 'large home needs', 'varied equipment'], '15-60 years', 7, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Mobile Home Parks', 'mobile-home-parks', 'Various', 'manufactured-home', '1970s-2000s', 'Moderate income', 'Mobile home communities', ARRAY['manufactured home systems', 'package units', 'budget solutions'], '15-40 years', 8, false),
  ('e3f4a5b6-c7d8-9012-6789-345678901234', 'Strawberry Fields Area', 'strawberry-fields', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Near strawberry farms', ARRAY['agricultural proximity', 'family homes', 'standard systems'], '10-35 years', 9, false)
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
  'e3f4a5b6-c7d8-9012-6789-345678901234',
  'hvac',
  '/fl/plant-city/hvac',
  'HVAC Services in Plant City, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Plant City''s 41,000+ residents. Rural and residential specialists. TECO rebates available. Serving Downtown, Walden Lake & all neighborhoods.',
  'HVAC Plant City FL',
  ARRAY['AC repair Plant City', 'air conditioning Plant City FL', 'HVAC contractor Plant City', 'mobile home AC Plant City', 'TECO rebates', 'Hillsborough County HVAC'],

  'Plant City''s Hometown HVAC Experts',
  'From strawberry farms to downtown, we keep Plant City cool',
  'Licensed & Insured | TECO Certified | Rural & Residential Specialists',
  'Plant City—the Winter Strawberry Capital of the World—is a community that values hard work, tradition, and neighborly service. With over 41,000 residents ranging from historic downtown homes to rural farm properties, Plant City needs HVAC contractors who understand this unique community. Our team provides honest, reliable service whether you''re in the Walden Lake golf community, a manufactured home park, or a farmhouse on the outskirts of town.',

  '{
    "headline": "Why Plant City Homeowners Choose Us",
    "reasons": [
      {"title": "Rural Property Experience", "description": "Plant City''s agricultural heritage means many properties are on large lots with well water and unique challenges. We serve rural properties with the same dedication as city homes."},
      {"title": "Mobile Home Specialists", "description": "Plant City has significant manufactured home communities. We''re experts in mobile home HVAC including package units and space-efficient systems."},
      {"title": "Historic Home Knowledge", "description": "Downtown Plant City features beautiful historic homes. We provide ductless systems and retrofits that preserve character while adding modern comfort."},
      {"title": "TECO Rebate Experts", "description": "We help Plant City homeowners access TECO rebates including up to $150 for AC replacement and $75 for smart thermostats."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Plant City",
    "intro": "Plant City''s diverse housing and rural character create specific HVAC considerations:",
    "challenges": [
      {"title": "Rural Properties", "description": "Farm properties and rural homes face unique challenges including well water minerals, longer distances for service, and larger homes to cool."},
      {"title": "Historic Downtown", "description": "Plant City''s historic homes often lack ductwork. Ductless mini-splits provide efficient cooling while preserving historic character."},
      {"title": "Manufactured Homes", "description": "Mobile homes require specialized HVAC approaches including proper sizing for smaller spaces and consideration of home construction."},
      {"title": "Agricultural Dust", "description": "Properties near active farms may experience higher dust and particulate levels, requiring enhanced filtration and more frequent maintenance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Plant City",
    "services": [
      {"name": "Rural Property HVAC", "slug": "rural-hvac", "description": "Service for Plant City''s farms and rural homes including large properties and well water considerations.", "features": ["Large home systems", "Well water awareness", "Rural service area", "Agricultural dust protection"]},
      {"name": "Mobile Home HVAC", "slug": "mobile-home-hvac", "description": "Specialized service for manufactured homes.", "features": ["Package units", "Space-efficient", "Proper sizing", "Budget options"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Plant City.", "features": ["Same-day service", "All brands", "Upfront pricing", "Rural coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with TECO rebate assistance.", "features": ["TECO rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Historic Home Solutions", "slug": "historic-hvac", "description": "Ductless systems and retrofits for Plant City''s historic homes.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for all property types.", "features": ["Bi-annual service", "Rural scheduling", "Filter delivery", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service rural properties outside Plant City?", "answer": "Yes, we serve rural properties throughout the Plant City area including farms and large-lot homes. We understand the unique needs of agricultural properties."},
      {"question": "What TECO rebates are available?", "answer": "TECO offers up to $150 for AC replacement, $75 for smart thermostats, and $100 for duct repairs. We help you access all available rebates."},
      {"question": "Can you install AC in my historic downtown home?", "answer": "Yes, ductless mini-split systems are perfect for Plant City''s historic homes. They provide efficient cooling without invasive ductwork installation."},
      {"question": "Do you work on mobile home AC units?", "answer": "Yes, we specialize in manufactured home HVAC including package units, split systems, and space-efficient solutions."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "73%", "cooling_degree_days": "3,350", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Reliable Comfort in Plant City?',
  'Contact us today for a free estimate. From downtown to the farms, we''ll find the right solution for your Plant City property.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Plant City", "description": "Professional HVAC services in Plant City, FL.", "url": "https://coolit-hvac.com/plant-city-fl", "telephone": "+1-813-555-COOL", "areaServed": {"@type": "City", "name": "Plant City", "addressRegion": "FL"}, "priceRange": "$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service rural properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we serve rural properties throughout the Plant City area."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Plant City", "item": "https://coolit-hvac.com/fl/plant-city"}]}'::jsonb,

  '/fl/hillsborough-county',
  '[{"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC"}, {"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland AC"}, {"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/rural-hvac", "anchor_text": "Rural HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1800, 24, 14, 85,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Winter Haven, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 5 - I-4 Corridor / Polk County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f4a5b6c7-d8e9-0123-7890-456789012345',
  'Winter Haven', 'winter-haven', 'Florida', 'FL', 'Polk', 'polk-county',
  28.0222, -81.7329,
  ARRAY['33880', '33881', '33882', '33883', '33884', '33885'],
  'Lakeland-Winter Haven',
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
  'f4a5b6c7-d8e9-0123-7890-456789012345',
  NOW(),
  51863, 'US Census Bureau ACS 2023',
  45892, 235000, 58.7,
  ARRAY['single-family', 'lakefront', 'manufactured-home', 'condo'],
  '{"pre-1970": 20, "1970s-1980s": 35, "1990s-2000s": 30, "2010s-2020s": 15}'::jsonb,
  92, 52, 74, 3400, 100, 52.4, 'low',
  'Central Florida location with 50+ lakes. Former home of LEGOLAND (Cypress Gardens heritage). Inland location provides lower hurricane risk. Chain of Lakes attracts retirees and families.',
  ARRAY['LEGOLAND Florida', 'Winter Haven Hospital', 'Polk County School Board', 'City of Winter Haven', 'Publix', 'Winter Haven Citrus Processing'],
  ARRAY['LEGOLAND Florida', 'Chain of Lakes', 'Lake Silver', 'Historic Downtown Winter Haven', 'Cypress Gardens heritage sites', 'Gilbert Park'],
  ARRAY['Havendale Boulevard events', 'Chain of Lakes fishing tournaments', 'Water Ski shows', 'Downtown Winter Haven events'],
  ARRAY['Polk County Public Schools'],
  'LEGOLAND expansion. Downtown revitalization. Chain of Lakes development. New residential communities. Healthcare growth.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Winter Haven Utilities',
  350,
  'Florida Building Code 8th Edition (2023), Polk County amendments',
  '{"hvac_replacement": "Permit required", "lakefront": "May have additional setback requirements", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Easy AC', 'Air Hawk', 'Art Plumbing AC & Electric', 'Comfort Temp'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Lake Elbert Area', 'lake-elbert', 'North', 'lakefront', '1960s-2000s', 'Upper middle income', 'Chain of Lakes lakefront', ARRAY['lakefront humidity', 'waterfront homes', 'premium demands', 'varied ages'], '15-50 years', 1, true),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Historic Downtown', 'downtown-winter-haven', 'Central', 'mixed', '1920s-1970s', 'Middle income', 'Revitalized downtown area', ARRAY['historic buildings', 'older systems', 'commercial HVAC', 'retrofits needed'], '20-70+ years', 2, true),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Lake Shipp Area', 'lake-shipp', 'West', 'lakefront', '1950s-1990s', 'Middle income', 'Chain of Lakes lakefront', ARRAY['lakefront humidity', 'older homes', 'efficiency upgrades', 'waterfront maintenance'], '20-60 years', 3, true),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'LEGOLAND Area', 'legoland-area', 'South', 'mixed', '1970s-2010s', 'Middle income', 'Near LEGOLAND Florida', ARRAY['vacation rentals', 'family homes', 'varied systems'], '10-45 years', 4, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Inwood', 'inwood', 'Northeast', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['1970s-90s systems', 'family homes', 'standard maintenance'], '25-45 years', 5, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Lake Hamilton (adjacent)', 'lake-hamilton-wh', 'South', 'lakefront', '1960s-2000s', 'Middle income', 'Lakefront community', ARRAY['lakefront properties', 'varied ages', 'waterfront humidity'], '15-55 years', 6, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Eagle Lake (adjacent)', 'eagle-lake-wh', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Growing community', ARRAY['newer development', 'family homes', 'standard systems'], '10-35 years', 7, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Winter Haven Mobile Home Parks', 'mobile-homes-wh', 'Various', 'manufactured-home', '1970s-2000s', 'Moderate income', 'Manufactured home communities', ARRAY['package units', 'mobile home systems', 'budget solutions'], '15-40 years', 8, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Lake Howard', 'lake-howard', 'Central', 'lakefront', '1940s-1980s', 'Upper middle income', 'Historic lakefront', ARRAY['historic homes', 'lakefront humidity', 'premium service'], '25-70 years', 9, false),
  ('f4a5b6c7-d8e9-0123-7890-456789012345', 'Cypress Gardens Area', 'cypress-gardens', 'Southeast', 'single-family', '1960s-2000s', 'Middle income', 'Near historic Cypress Gardens', ARRAY['varied ages', 'tourism proximity', 'family homes'], '15-55 years', 10, false)
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
  'f4a5b6c7-d8e9-0123-7890-456789012345',
  'hvac',
  '/fl/winter-haven/hvac',
  'HVAC Services in Winter Haven, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Haven''s 52,000+ residents. Chain of Lakes specialists. Duke Energy rebates up to $1,700. Serving lakefront, downtown & all neighborhoods.',
  'HVAC Winter Haven FL',
  ARRAY['AC repair Winter Haven', 'air conditioning Winter Haven FL', 'HVAC contractor Winter Haven', 'lakefront AC Winter Haven', 'Duke Energy rebates', 'Polk County HVAC'],

  'Winter Haven''s Chain of Lakes HVAC Experts',
  'Lakefront comfort for the City of 100 Lakes',
  'Licensed & Insured | Duke Energy Certified | Lakefront Home Specialists',
  'Winter Haven—the City of 100 Lakes—offers a unique Central Florida lifestyle surrounded by water. With over 52,000 residents enjoying the Chain of Lakes, LEGOLAND tourism, and a revitalizing downtown, reliable air conditioning is essential for lakefront living. Our team specializes in the humidity challenges that come with lakefront properties, helping homeowners from historic Lake Howard to newer developments near LEGOLAND stay comfortable while maximizing Duke Energy rebates.',

  '{
    "headline": "Why Winter Haven Homeowners Choose Us",
    "reasons": [
      {"title": "Chain of Lakes Experts", "description": "Winter Haven''s 50+ lakes create unique humidity challenges. We provide enhanced dehumidification and moisture control solutions designed for lakefront living."},
      {"title": "Duke Energy Rebate Specialists", "description": "We help Winter Haven homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Historic Home Experience", "description": "Downtown Winter Haven features beautiful historic homes from the Cypress Gardens era. We provide ductless systems and sensitive retrofits."},
      {"title": "Vacation Rental Service", "description": "LEGOLAND brings tourism. We service vacation rental properties near the park, ensuring guest comfort and owner peace of mind."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Winter Haven",
    "intro": "Winter Haven''s lakefront setting and diverse housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Lakefront Humidity", "description": "Properties on the Chain of Lakes experience significantly elevated humidity. Whole-home dehumidification is often essential for comfort and preventing mold."},
      {"title": "Historic Architecture", "description": "Winter Haven''s Cypress Gardens heritage includes beautiful historic homes that need sensitive HVAC solutions preserving their character."},
      {"title": "Mixed Housing Stock", "description": "From 1920s lakefront homes to manufactured housing, Winter Haven requires varied approaches for different property types."},
      {"title": "Tourism Properties", "description": "LEGOLAND proximity means vacation rentals need reliable HVAC with quick response times to keep guests comfortable."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Winter Haven",
    "services": [
      {"name": "Lakefront HVAC", "slug": "lakefront-hvac", "description": "Specialized solutions for Winter Haven''s Chain of Lakes properties including enhanced humidity control.", "features": ["Whole-home dehumidification", "Lakefront humidity expertise", "Mold prevention", "Premium equipment"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Winter Haven.", "features": ["Same-day service", "All brands", "90-day warranty", "Lakefront coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Historic Home Solutions", "slug": "historic-hvac", "description": "Ductless systems and retrofits for Winter Haven''s historic homes.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Vacation Rental Service", "slug": "vacation-rental", "description": "Reliable HVAC service for LEGOLAND-area vacation rentals.", "features": ["Priority response", "Guest-ready service", "Remote monitoring", "Property management support"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Humidity monitoring"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do lakefront homes need special HVAC attention?", "answer": "Winter Haven''s Chain of Lakes creates elevated humidity. Properties near water often need whole-home dehumidification beyond what standard AC provides for comfort and mold prevention."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing—up to $1,700 in combined rebates. A Home Energy Check is required for some rebates."},
      {"question": "Do you service vacation rentals near LEGOLAND?", "answer": "Yes, we provide priority service for vacation rental properties. We understand the importance of quick response times to keep guests comfortable."},
      {"question": "Can you install AC in historic Winter Haven homes?", "answer": "Yes, ductless mini-split systems are ideal for Winter Haven''s historic homes. They provide efficient cooling without invasive ductwork."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,400", "days_above_90": "100+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Lakefront Comfort in Winter Haven?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and find the perfect system for your Winter Haven home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Haven", "description": "Professional HVAC services in Winter Haven, FL specializing in lakefront homes.", "url": "https://coolit-hvac.com/winter-haven-fl", "telephone": "+1-863-555-COOL", "areaServed": {"@type": "City", "name": "Winter Haven", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Why do lakefront homes need special HVAC attention?", "acceptedAnswer": {"@type": "Answer", "text": "Winter Haven''s lakes create elevated humidity requiring enhanced dehumidification."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Haven", "item": "https://coolit-hvac.com/fl/winter-haven"}]}'::jsonb,

  '/fl/polk-county',
  '[{"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland HVAC"}, {"slug": "/fl/auburndale/hvac", "anchor_text": "Auburndale AC"}, {"slug": "/fl/haines-city/hvac", "anchor_text": "Haines City HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/lakefront-hvac", "anchor_text": "Lakefront HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1880, 28, 16, 87,
  'published', 1, 'claude', 'phase5-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
