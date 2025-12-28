-- ============================================
-- Ocala, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a5b6c7d8-e9f0-1234-8901-567890123456',
  'Ocala', 'ocala', 'Florida', 'FL', 'Marion', 'marion-county',
  29.1872, -82.1401,
  ARRAY['34470', '34471', '34472', '34473', '34474', '34475', '34476', '34477', '34479', '34480', '34481', '34482'],
  'Ocala',
  ARRAY[]::uuid[],
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
  'a5b6c7d8-e9f0-1234-8901-567890123456',
  NOW(),
  66285, 'US Census Bureau ACS 2023',
  47892, 235000, 55.8,
  ARRAY['single-family', 'manufactured-home', 'horse-farm', 'active-adult'],
  '{"pre-1980": 20, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  92, 47, 72, 3200, 95, 51.2, 'low',
  'Inland North-Central Florida. Known as "Horse Capital of the World." Lower humidity than coastal areas. Springs attract visitors. Growing retirement destination.',
  ARRAY['Ocala Health', 'Marion County Public Schools', 'Lockheed Martin', 'AutoZone Distribution', 'Amazon', 'Emergency One', 'Circle K'],
  ARRAY['Silver Springs State Park', 'Appleton Museum of Art', 'Downtown Square', 'Ocala National Forest', 'World Equestrian Center', 'Rainbow Springs'],
  ARRAY['Horse shows and events', 'Ocala Arts Festival', 'Light Up Ocala', 'Brick City Beer & Wine Festival'],
  ARRAY['Marion County Public Schools'],
  'World Equestrian Center impact. On Top of the World expansion. Healthcare growth. Downtown revitalization. I-75 corridor development.',
  'Duke Energy Florida / Ocala Electric Utility (OEU)',
  '{
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}, "duct_sealing": {"amount": 150}},
    "oeu": {"ac_replacement": {"amount": 200, "requirements": "SEER 15+ system"}, "smart_thermostat": {"amount": 50}}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Ocala Utilities',
  400,
  'Florida Building Code 8th Edition (2023), Marion County amendments',
  '{"hvac_replacement": "Permit required", "horse_farm": "Agricultural property considerations", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Climate Control Heating and Air', 'All County Air Conditioning', 'Sun-Tech Air Conditioning', 'Bounds Heating and Air'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy / OEU", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'On Top of the World', 'on-top-of-the-world', 'Southwest', 'active-adult', '1990s-2020s', 'Upper middle income', 'Large 55+ community', ARRAY['active adult needs', 'energy efficiency', 'single-level homes', 'HOA requirements'], '5-28 years', 1, true),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Horse Farm Country', 'horse-farms', 'Northwest', 'horse-farm', '1970s-2010s', 'Upper income', 'Working horse farms and estates', ARRAY['large property systems', 'barn/stable climate', 'well water', 'estate multi-zone'], '10-45 years', 2, true),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Historic Downtown', 'downtown-ocala', 'Central', 'mixed', '1900s-1970s', 'Middle income', 'Historic downtown area', ARRAY['historic buildings', 'older systems', 'commercial HVAC', 'retrofits'], '25-80+ years', 3, true),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Silver Springs Shores', 'silver-springs-shores', 'East', 'single-family', '1970s-1990s', 'Moderate income', 'Established residential', ARRAY['older systems', 'budget solutions', 'standard maintenance'], '25-45 years', 4, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Belleview (adjacent)', 'belleview', 'South', 'mixed', '1980s-2010s', 'Middle income', 'Growing community', ARRAY['varied ages', 'family homes', 'standard service'], '10-35 years', 5, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Ocala Palms', 'ocala-palms', 'West', 'active-adult', '2000s-2010s', 'Upper middle income', '55+ golf community', ARRAY['active adult systems', 'golf course humidity', 'premium service'], '10-20 years', 6, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Oak Run', 'oak-run', 'Southwest', 'active-adult', '1980s-2000s', 'Middle income', '55+ community', ARRAY['1980s-2000s systems', 'active adult needs', 'efficient solutions'], '15-35 years', 7, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Spruce Creek', 'spruce-creek-ocala', 'Southwest', 'single-family', '1990s-2010s', 'Upper middle income', 'Country club community', ARRAY['premium homes', 'golf course adjacent', 'HOA standards'], '10-28 years', 8, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Northeast Ocala', 'northeast-ocala', 'Northeast', 'single-family', '1970s-2000s', 'Middle income', 'Family neighborhoods', ARRAY['varied ages', 'family homes', 'standard needs'], '15-45 years', 9, false),
  ('a5b6c7d8-e9f0-1234-8901-567890123456', 'Marion Oaks', 'marion-oaks', 'South', 'single-family', '1980s-2010s', 'Moderate income', 'Large planned community', ARRAY['large community', 'varied conditions', 'budget options'], '10-35 years', 10, false)
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
  'a5b6c7d8-e9f0-1234-8901-567890123456',
  'hvac',
  '/fl/ocala/hvac',
  'HVAC Services in Ocala, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Ocala''s 66,000+ residents. Horse farm and 55+ community specialists. Duke Energy rebates available. Serving OTOW, downtown & all neighborhoods.',
  'HVAC Ocala FL',
  ARRAY['AC repair Ocala', 'air conditioning Ocala FL', 'HVAC contractor Ocala', 'horse farm AC Ocala', '55+ community HVAC', 'Marion County HVAC'],

  'Ocala''s Horse Country HVAC Experts',
  'From horse farms to 55+ communities, we keep Ocala comfortable',
  'Licensed & Insured | Duke Energy & OEU Certified | Horse Farm Specialists',
  'Ocala—the Horse Capital of the World—is a unique Florida community where rolling horse farms meet thriving 55+ communities. With over 66,000 residents and some of the most diverse property types in the state, Ocala needs HVAC contractors who understand everything from climate-controlled horse barns to energy-efficient active adult homes. Our team provides expert service throughout Marion County, helping homeowners access rebates from both Duke Energy and Ocala Electric Utility.',

  '{
    "headline": "Why Ocala Homeowners Choose Us",
    "reasons": [
      {"title": "Horse Farm Specialists", "description": "Ocala''s horse country requires specialized HVAC—from estate homes to climate-controlled barns and tack rooms. We understand the unique needs of equestrian properties."},
      {"title": "55+ Community Experts", "description": "With On Top of the World, Oak Run, and other active adult communities, we specialize in the energy efficiency, quiet operation, and accessibility that retirees need."},
      {"title": "Dual Utility Knowledge", "description": "Ocala is served by both Duke Energy and Ocala Electric Utility. We help you navigate rebates from either utility to maximize savings."},
      {"title": "Springs Area Experience", "description": "Properties near Silver Springs experience unique conditions. We understand the area and provide appropriate solutions."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Ocala",
    "intro": "Ocala''s diverse property types and inland location create specific HVAC considerations:",
    "challenges": [
      {"title": "Horse Farm Properties", "description": "Equestrian estates often include climate-controlled spaces for horses and tack. These require specialized HVAC design beyond typical residential work."},
      {"title": "Well Water Impacts", "description": "Many Ocala properties, especially farms, use well water with high mineral content that can affect HVAC equipment. Proper maintenance addresses these concerns."},
      {"title": "Large Properties", "description": "Ocala''s sprawling estates and farm properties often require multi-zone systems and larger equipment than typical suburban homes."},
      {"title": "Active Adult Needs", "description": "Ocala''s large 55+ population has specific needs including energy efficiency, quiet operation, and easy-to-use controls."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Ocala",
    "services": [
      {"name": "Horse Farm HVAC", "slug": "horse-farm-hvac", "description": "Specialized HVAC for Ocala''s equestrian properties including barn climate control and estate homes.", "features": ["Barn climate systems", "Estate multi-zone", "Tack room control", "Agricultural expertise"]},
      {"name": "55+ Community Service", "slug": "active-adult", "description": "Tailored solutions for Ocala''s active adult communities focusing on efficiency and ease of use.", "features": ["Energy efficiency", "Quiet operation", "Smart controls", "Senior-friendly"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Ocala and Marion County.", "features": ["Same-day service", "All brands", "90-day warranty", "Rural coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy and OEU rebate assistance.", "features": ["Utility rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Historic Downtown HVAC", "slug": "historic-hvac", "description": "Ductless systems and retrofits for Ocala''s historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Commercial experience"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Well water awareness", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you provide HVAC for horse barns?", "answer": "Yes, we design and install climate control systems for horse barns, tack rooms, and other equestrian buildings. Temperature and humidity control is essential for horse health and tack preservation."},
      {"question": "Which utility serves my Ocala home?", "answer": "Ocala is served by both Duke Energy and Ocala Electric Utility (OEU) depending on location. We''re familiar with both and help you access available rebates."},
      {"question": "Do you service On Top of the World?", "answer": "Yes, we serve all of OTOW and other 55+ communities. We specialize in the energy-efficient, quiet systems that active adults prefer."},
      {"question": "How does well water affect my AC?", "answer": "Ocala''s high-mineral well water can leave deposits on equipment. Regular maintenance including coil cleaning helps prevent efficiency loss and extends system life."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "72%", "cooling_degree_days": "3,200", "days_above_90": "95+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Expert Comfort in Ocala?',
  'Contact us today for a free estimate. Whether you''re on a horse farm or in a 55+ community, we''ll find the perfect solution for your Ocala property.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Ocala", "description": "Professional HVAC services in Ocala, FL specializing in horse farms and 55+ communities.", "url": "https://coolit-hvac.com/ocala-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "Ocala", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you provide HVAC for horse barns?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we design and install climate control systems for horse barns and equestrian buildings."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Ocala", "item": "https://coolit-hvac.com/fl/ocala"}]}'::jsonb,

  '/fl/marion-county',
  '[{"slug": "/fl/the-villages/hvac", "anchor_text": "The Villages HVAC"}, {"slug": "/fl/gainesville/hvac", "anchor_text": "Gainesville AC"}, {"slug": "/fl/leesburg/hvac", "anchor_text": "Leesburg HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/horse-farm-hvac", "anchor_text": "Horse Farm HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1900, 28, 16, 88,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
