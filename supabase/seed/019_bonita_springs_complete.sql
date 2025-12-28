-- ============================================
-- Bonita Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f8a9b0c1-d2e3-4567-1234-890123456789',
  'Bonita Springs', 'bonita-springs', 'Florida', 'FL', 'Lee', 'lee-county',
  26.3398, -81.7787,
  ARRAY['34133', '34134', '34135', '34136'],
  'Cape Coral-Fort Myers',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456', 'e7f8a9b0-c1d2-3456-0123-789012345678']::uuid[],
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
  'f8a9b0c1-d2e3-4567-1234-890123456789',
  NOW(),
  57755, 'US Census Bureau ACS 2023',
  74892, 485000, 72.1,
  ARRAY['single-family', 'condo', 'golf-community', 'waterfront'],
  '{"pre-1990": 15, "1990s-2000s": 45, "2010s-2020s": 40}'::jsonb,
  91, 56, 74, 3600, 106, 54.2, 'high',
  'Tropical climate between Fort Myers and Naples. Strong seasonal population. Many golf communities and retirement destinations. Hurricane Ian impact significant.',
  ARRAY['Lee County School District', 'Bonita Community Health Center', 'City of Bonita Springs', 'Hertz (nearby)', 'Golf resort industry', 'Healthcare services'],
  ARRAY['Barefoot Beach', 'Bonita Beach', 'Riverside Park', 'Bonita Springs Dog Beach', 'Everglades Wonder Gardens', 'Promenade at Bonita Bay', 'Coconut Point Mall'],
  ARRAY['Bonita Springs National Art Festival', 'Taste of Bonita', 'Holiday in the Park', 'Farmers Market'],
  ARRAY['Lee County Public Schools'],
  'Bonita Bay continued development. Coconut Point expansion. Hurricane Ian recovery. US 41 corridor improvements. New residential communities.',
  'Florida Power & Light (FPL) / Lee County Electric Cooperative (LCEC)',
  '{
    "fpl": {"ac_replacement": {"amount": 150, "requirements": "High-efficiency system"}, "duct_sealing": {"amount": 150, "requirements": "Professional testing"}},
    "lcec": {"ac_replacement": {"amount": 400, "requirements": "SEER 16+ system"}, "smart_thermostat": {"amount": 75, "requirements": "Qualifying smart thermostat"}}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Bonita Springs Utilities',
  300,
  'Florida Building Code 8th Edition (2023), Lee County hurricane standards',
  '{"hvac_replacement": "Permit required", "hurricane_tie_downs": "Required for outdoor units", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Cool Today', 'Best Home Services'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL / LCEC", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Bonita Bay', 'bonita-bay', 'South', 'golf-community', '1990s-2010s', 'Upper income', 'Premier golf and marina community', ARRAY['luxury systems', 'multi-zone estates', 'seasonal homes', 'golf course humidity'], '10-28 years', 1, true),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Pelican Landing', 'pelican-landing', 'Central', 'golf-community', '1990s-2000s', 'Upper middle income', 'Golf community with beach club', ARRAY['golf community systems', 'seasonal usage', 'premium demands', 'HOA standards'], '15-28 years', 2, true),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Barefoot Beach', 'barefoot-beach', 'West', 'waterfront', '1980s-2000s', 'Upper income', 'Beachfront preserve community', ARRAY['salt air corrosion', 'beach humidity', 'luxury demands', 'coastal maintenance'], '15-35 years', 3, true),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Spanish Wells', 'spanish-wells', 'Central', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'seasonal systems', 'HOA requirements'], '10-28 years', 4, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Worthington', 'worthington', 'East', 'golf-community', '1990s-2000s', 'Upper middle income', 'Country club community', ARRAY['country club systems', 'established homes', 'efficiency upgrades'], '15-28 years', 5, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Coconut Point Area', 'coconut-point', 'North', 'mixed', '2000s-2020s', 'Middle income', 'Near Coconut Point Mall', ARRAY['newer construction', 'condo systems', 'commercial adjacent'], '5-20 years', 6, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Old Bonita', 'old-bonita', 'Central', 'single-family', '1970s-1990s', 'Middle income', 'Original Bonita Springs area', ARRAY['older systems', 'budget solutions', 'system replacements'], '20-45 years', 7, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Imperial Golf Estates', 'imperial-golf', 'East', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf course living', ARRAY['golf community needs', '1980s-2000s systems', 'efficiency updates'], '15-35 years', 8, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'Bonita Fairways', 'bonita-fairways', 'East', 'single-family', '1990s-2000s', 'Middle income', 'Family-oriented community', ARRAY['family homes', 'standard systems', 'HOA communities'], '15-28 years', 9, false),
  ('f8a9b0c1-d2e3-4567-1234-890123456789', 'The Brooks', 'the-brooks', 'South', 'golf-community', '1990s-2010s', 'Upper middle income', 'Master-planned community', ARRAY['newer systems', 'community standards', 'premium preferences'], '10-28 years', 10, false)
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
  'f8a9b0c1-d2e3-4567-1234-890123456789',
  'hvac',
  '/fl/bonita-springs/hvac',
  'HVAC Services in Bonita Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Bonita Springs'' 58,000+ residents. Golf community specialists. FPL & LCEC rebates available. Serving Bonita Bay, Pelican Landing & all neighborhoods.',
  'HVAC Bonita Springs FL',
  ARRAY['AC repair Bonita Springs', 'air conditioning Bonita Springs FL', 'HVAC contractor Bonita Springs', 'golf community AC', 'seasonal home HVAC', 'Lee County HVAC'],

  'Bonita Springs'' Golf Community HVAC Experts',
  'Premium comfort for Southwest Florida living',
  'Licensed & Insured | FPL & LCEC Certified | Seasonal Home Specialists',
  'Bonita Springs offers the best of Southwest Florida—beautiful beaches, world-class golf, and a relaxed lifestyle. With over 58,000 residents and a significant seasonal population, our team understands the unique HVAC needs of this community. From luxury estates in Bonita Bay to beachfront condos at Barefoot Beach, we provide expert service tailored to golf community living and seasonal home maintenance.',

  '{
    "headline": "Why Bonita Springs Homeowners Choose Us",
    "reasons": [
      {"title": "Golf Community Specialists", "description": "Bonita Springs is home to premier golf communities like Bonita Bay, Pelican Landing, and Spanish Wells. We understand the unique demands of these properties and HOA requirements."},
      {"title": "Seasonal Home Experts", "description": "Many Bonita Springs homes are seasonal residences. We provide pre-season preparation, monitoring services, and maintenance programs designed for part-time residents."},
      {"title": "Dual Utility Knowledge", "description": "Bonita Springs is served by both FPL and LCEC. We help you navigate rebates from either utility—up to $400 from LCEC or $300 from FPL."},
      {"title": "Hurricane Recovery Experience", "description": "We helped Bonita Springs recover from Hurricane Ian and understand the importance of hurricane-hardened HVAC systems."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Bonita Springs",
    "intro": "Bonita Springs'' lifestyle and location create specific HVAC considerations:",
    "challenges": [
      {"title": "Golf Course Humidity", "description": "Properties adjacent to irrigated golf courses experience elevated humidity. Enhanced dehumidification maintains comfort and prevents moisture issues."},
      {"title": "Seasonal Usage Patterns", "description": "Many systems sit idle during summer months, then need to perform flawlessly when owners return. Proper preparation prevents surprises."},
      {"title": "Beachfront Exposure", "description": "Barefoot Beach and coastal properties face salt air corrosion. Specialized coatings and maintenance programs protect equipment."},
      {"title": "HOA Standards", "description": "Bonita Springs'' many HOA communities have equipment placement and appearance requirements we navigate daily."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Bonita Springs",
    "services": [
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Specialized service for Bonita Springs'' premier golf communities with HOA-compliant installations.", "features": ["HOA compliance", "Humidity control", "Premium equipment", "Quiet operation"]},
      {"name": "Seasonal Home Service", "slug": "seasonal-service", "description": "Complete care for part-time residents including monitoring and pre-arrival preparation.", "features": ["Pre-season prep", "System monitoring", "Closing service", "Emergency alerts"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Bonita Springs.", "features": ["Same-day service", "All brands", "90-day warranty", "Golf community priority"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with FPL and LCEC rebate assistance.", "features": ["Dual utility rebates", "Up to 22 SEER2", "10-year warranty", "Quiet models"]},
      {"name": "Dehumidification", "slug": "dehumidification", "description": "Essential humidity control for golf course-adjacent properties.", "features": ["Whole-home systems", "Golf course humidity", "Mold prevention", "Smart controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for year-round and seasonal residents.", "features": ["Seasonal options", "Priority scheduling", "System monitoring", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service seasonal homes when owners are away?", "answer": "Yes, we offer seasonal monitoring and maintenance programs. We can check your system monthly, prepare it before your arrival, and respond to any alerts from smart thermostats."},
      {"question": "Which utility serves my Bonita Springs home?", "answer": "Bonita Springs is served by both FPL and LCEC depending on location. We''re certified with both and will help you access the maximum rebates available from your utility."},
      {"question": "Why does my golf course home feel more humid?", "answer": "Irrigated golf courses add moisture to the air. Properties adjacent to fairways often benefit from enhanced dehumidification beyond standard AC capabilities."},
      {"question": "Do you work with Bonita Bay and Pelican Landing HOAs?", "answer": "Yes, we''re familiar with the requirements of Bonita Springs'' major communities and ensure all installations meet HOA standards for appearance and placement."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,600", "days_above_90": "106+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Bonita Springs?',
  'Contact us today for a free estimate. Whether you''re a year-round resident or seasonal visitor, we''ll keep your Bonita Springs home comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Bonita Springs", "description": "Professional HVAC services in Bonita Springs, FL specializing in golf communities.", "url": "https://coolit-hvac.com/bonita-springs-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Bonita Springs", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service seasonal homes?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we offer seasonal monitoring and maintenance programs for part-time residents."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Bonita Springs", "item": "https://coolit-hvac.com/fl/bonita-springs"}]}'::jsonb,

  '/fl/lee-county',
  '[{"slug": "/fl/naples/hvac", "anchor_text": "Naples HVAC"}, {"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers AC"}, {"slug": "/fl/estero/hvac", "anchor_text": "Estero HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/seasonal-service", "anchor_text": "Seasonal Service"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1850, 26, 16, 87,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
