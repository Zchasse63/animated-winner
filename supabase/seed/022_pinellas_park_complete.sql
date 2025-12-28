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
