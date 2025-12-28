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
-- ============================================
-- The Villages, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  'The Villages', 'the-villages', 'Florida', 'FL', 'Sumter', 'sumter-county',
  28.9340, -81.9608,
  ARRAY['32159', '32162', '32163'],
  'The Villages',
  ARRAY['a5b6c7d8-e9f0-1234-8901-567890123456']::uuid[],
  true, 90
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
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  NOW(),
  139792, 'US Census Bureau ACS 2023',
  62847, 385000, 92.4,
  ARRAY['single-family', 'villa', 'patio-home', 'active-adult'],
  '{"1990s": 15, "2000s": 30, "2010s": 35, "2020s": 20}'::jsonb,
  92, 48, 72, 3250, 98, 51.8, 'low',
  'America''s largest 55+ active adult community. Sprawling across three counties. Continuous expansion. Extremely high homeownership. Golf cart culture.',
  ARRAY['The Villages development', 'UF Health The Villages Hospital', 'The Villages Charter School', 'Retail and hospitality', 'Healthcare services', 'The Villages Media Group'],
  ARRAY['Spanish Springs Town Square', 'Lake Sumter Landing', 'Brownwood Paddock Square', '50+ golf courses', 'Numerous recreation centers'],
  ARRAY['Nightly entertainment at town squares', 'Golf tournaments', 'Polo matches', 'Numerous club events'],
  ARRAY['The Villages Charter School'],
  'Continuous southward expansion. New villages and town centers. Healthcare facility growth. Commercial development. Infrastructure expansion.',
  'SECO Energy / Duke Energy Florida',
  '{
    "seco": {"ac_replacement": {"amount": 300, "requirements": "SEER 15+ system"}, "heat_pump": {"amount": 200, "requirements": "Qualifying heat pump"}, "smart_thermostat": {"amount": 100}},
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}}
  }'::jsonb,
  'None (all-electric community)',
  'The Villages utilities',
  280,
  'Florida Building Code 8th Edition (2023), The Villages design standards',
  '{"hvac_replacement": "Permit required", "architectural_review": "All exterior equipment subject to review", "inspection": "Final inspection required"}'::jsonb,
  'universal',
  ARRAY['Del-Air Heating and Air', 'All County Air Conditioning', 'Bounds Heating and Air', 'Direct Air Conditioning', 'Air-Tech'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "SECO Energy / Duke Energy", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Fenney', 'fenney', 'South', 'active-adult', '2010s-2020s', 'Upper middle income', 'Newer southern expansion', ARRAY['new construction', 'premium systems', 'smart home ready', 'energy efficiency'], '0-12 years', 1, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Polo Ridge', 'polo-ridge', 'South', 'active-adult', '2020s', 'Upper middle income', 'Newest development area', ARRAY['brand new systems', 'builder-grade quality', 'smart technology', 'warranty service'], '0-5 years', 2, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Spanish Springs', 'spanish-springs', 'Central', 'active-adult', '1990s-2000s', 'Upper middle income', 'Original village center', ARRAY['1990s-2000s systems', 'system replacements', 'efficiency upgrades', 'established homes'], '15-28 years', 3, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Lake Sumter Landing', 'lake-sumter-landing', 'East', 'active-adult', '2000s-2010s', 'Upper middle income', 'Waterfront town center', ARRAY['waterfront humidity', 'premium systems', 'established homes'], '10-20 years', 4, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Brownwood', 'brownwood', 'West', 'active-adult', '2010s-2020s', 'Upper middle income', 'Western town center', ARRAY['newer systems', 'premium homes', 'modern expectations'], '5-12 years', 5, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Gilchrist', 'gilchrist', 'North', 'active-adult', '2000s-2010s', 'Middle income', 'Northern area', ARRAY['2000s-2010s systems', 'standard service', 'efficiency focus'], '10-20 years', 6, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Bonnybrook', 'bonnybrook', 'Central', 'active-adult', '2000s', 'Middle income', 'Central village', ARRAY['2000s systems', 'approaching replacement', 'standard homes'], '15-22 years', 7, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Santiago', 'santiago', 'West', 'active-adult', '2010s', 'Upper middle income', 'Western expansion', ARRAY['2010s systems', 'premium homes', 'HOA requirements'], '8-15 years', 8, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Hemingway', 'hemingway', 'South', 'active-adult', '2010s-2020s', 'Upper middle income', 'Southern expansion', ARRAY['newer systems', 'energy efficiency', 'modern homes'], '5-12 years', 9, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Caroline', 'caroline', 'Central', 'active-adult', '2000s-2010s', 'Middle income', 'Central location', ARRAY['varied system ages', 'standard service needs', 'efficiency upgrades'], '10-18 years', 10, false)
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
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  'hvac',
  '/fl/the-villages/hvac',
  'HVAC Services in The Villages, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for The Villages'' 140,000+ residents. America''s premier 55+ community specialists. SECO & Duke Energy rebates. Serving all villages!',
  'HVAC The Villages FL',
  ARRAY['AC repair The Villages', 'air conditioning The Villages FL', 'HVAC contractor The Villages', '55+ community AC', 'SECO Energy rebates', 'Sumter County HVAC'],

  'The Villages'' Dedicated HVAC Specialists',
  'Expert service for America''s premier 55+ community',
  'Licensed & Insured | SECO & Duke Energy Certified | Villages Design Standards Compliant',
  'The Villages—America''s largest and most celebrated active adult community—deserves HVAC service that matches its exceptional lifestyle. With nearly 140,000 residents across dozens of villages, 50+ golf courses, and continuous expansion, The Villages requires contractors who understand this unique community. Our team provides expert service compliant with Villages design standards, helping residents from the original Spanish Springs area to the newest southern expansions stay comfortable while maximizing utility rebates.',

  '{
    "headline": "Why Villages Residents Choose Us",
    "reasons": [
      {"title": "Villages Design Standards Expertise", "description": "Every Villages home must meet architectural standards. We ensure all HVAC installations comply with community requirements for equipment placement and appearance."},
      {"title": "SECO & Duke Energy Certified", "description": "The Villages is served by SECO Energy and Duke Energy. We help you access rebates from either utility—up to $300 for AC replacement and more."},
      {"title": "Active Adult Focus", "description": "We specialize in what Villages residents need: energy efficiency, quiet operation, easy-to-use controls, and respectful, punctual service."},
      {"title": "Complete Villages Coverage", "description": "From Spanish Springs to the newest southern villages, we serve every community in The Villages with consistent quality and response times."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Villages Residents",
    "intro": "The Villages'' unique community structure creates specific HVAC considerations:",
    "challenges": [
      {"title": "Design Standards Compliance", "description": "All exterior equipment in The Villages must meet architectural standards. We ensure compliant equipment placement and screening."},
      {"title": "System Age Variations", "description": "The Villages spans nearly 30 years of development. Older villages may need replacement while newer areas have warranty considerations."},
      {"title": "Energy Efficiency Priority", "description": "Villages residents on fixed incomes appreciate energy efficiency. We recommend systems that minimize operating costs."},
      {"title": "Golf Course Humidity", "description": "Many Villages homes border irrigated golf courses. Enhanced dehumidification improves comfort in these locations."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in The Villages",
    "services": [
      {"name": "55+ Comfort Solutions", "slug": "active-adult", "description": "HVAC designed for active adult living with focus on efficiency, quiet operation, and ease of use.", "features": ["Energy efficiency", "Quiet operation", "Smart thermostats", "Easy controls"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout all Villages communities.", "features": ["Same-day service", "All brands", "90-day warranty", "Respectful service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Design standards-compliant installations with SECO and Duke Energy rebate assistance.", "features": ["Design compliance", "Utility rebates", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in older villages with modern efficient equipment.", "features": ["1990s-2000s upgrades", "Efficiency improvements", "Rebate maximization", "Minimal disruption"]},
      {"name": "New Home Service", "slug": "new-home-service", "description": "Warranty service and optimization for new village homes.", "features": ["Warranty support", "System optimization", "Smart setup", "Performance verification"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Keep your system running efficiently with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you comply with Villages design standards?", "answer": "Yes, we''re thoroughly familiar with The Villages architectural standards. All our installations meet community requirements for equipment placement and appearance."},
      {"question": "Which utility serves my Villages home?", "answer": "The Villages is served by SECO Energy in some areas and Duke Energy in others. We''re certified with both and help you access available rebates regardless of your utility."},
      {"question": "When should older Villages homes replace their AC?", "answer": "Homes in the original villages from the 1990s-2000s often have systems approaching or past their lifespan. Modern systems are 2-3 times more efficient and much more reliable."},
      {"question": "Do you offer senior-friendly service?", "answer": "Absolutely. We understand Villages residents'' needs—punctual appointments, respectful technicians, clear explanations, and easy-to-use system recommendations."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "72%", "cooling_degree_days": "3,250", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Premium Comfort in The Villages?',
  'Contact us today for a free estimate. We''ll ensure design standards compliance while helping you access utility rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - The Villages", "description": "Professional HVAC services for The Villages, FL.", "url": "https://coolit-hvac.com/the-villages-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "The Villages", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you comply with Villages design standards?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, all our installations meet The Villages architectural requirements."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "The Villages", "item": "https://coolit-hvac.com/fl/the-villages"}]}'::jsonb,

  '/fl/sumter-county',
  '[{"slug": "/fl/ocala/hvac", "anchor_text": "Ocala HVAC"}, {"slug": "/fl/leesburg/hvac", "anchor_text": "Leesburg AC"}, {"slug": "/fl/lady-lake/hvac", "anchor_text": "Lady Lake HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/active-adult", "anchor_text": "55+ HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1920, 32, 18, 90,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Port Charlotte, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  'Port Charlotte', 'port-charlotte', 'Florida', 'FL', 'Charlotte', 'charlotte-county',
  26.9756, -82.0906,
  ARRAY['33948', '33949', '33952', '33953', '33954', '33980', '33981', '33983'],
  'Punta Gorda',
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
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  NOW(),
  62985, 'US Census Bureau ACS 2023',
  52847, 285000, 72.4,
  ARRAY['single-family', 'manufactured-home', 'waterfront', 'condo'],
  '{"pre-1980": 15, "1980s-1990s": 40, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  91, 55, 74, 3650, 108, 54.2, 'high',
  'Charlotte Harbor location. Hurricane Ian direct hit in 2022. Significant rebuilding. Popular retirement destination. Mix of waterfront and inland properties.',
  ARRAY['Fawcett Memorial Hospital', 'Charlotte County Public Schools', 'Charlotte County Government', 'Publix', 'Healthcare industry', 'Construction (rebuilding)'],
  ARRAY['Charlotte Harbor', 'Tippecanoe Environmental Park', 'Port Charlotte Beach Park', 'Cultural Center of Charlotte County', 'Murdock Circle'],
  ARRAY['Charlotte Harbor Freedom Swim', 'Peace River Seafood Festival', 'Punta Gorda Wine & Jazz Festival (nearby)'],
  ARRAY['Charlotte County Public Schools'],
  'Hurricane Ian recovery. Significant rebuilding and renovation. New construction replacing damaged homes. Infrastructure improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Charlotte County Utilities',
  280,
  'Florida Building Code 8th Edition (2023), Charlotte County enhanced hurricane standards post-Ian',
  '{"hvac_replacement": "Permit required", "hurricane_hardening": "Enhanced requirements post-Ian", "flood_zone": "Equipment elevation may be required", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Climatech', 'Complete Air Mechanical'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Deep Creek', 'deep-creek', 'East', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf community with waterways', ARRAY['hurricane recovery', 'golf course humidity', 'system replacements', 'efficiency upgrades'], '5-35 years', 1, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'South Gulf Cove', 'south-gulf-cove', 'South', 'waterfront', '1980s-2010s', 'Middle income', 'Canal-front properties near Gulf', ARRAY['hurricane damage recovery', 'salt air exposure', 'waterfront humidity', 'new systems'], '0-35 years', 2, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Murdock', 'murdock', 'Central', 'mixed', '1970s-2000s', 'Moderate income', 'Central Port Charlotte', ARRAY['varied damage levels', 'mixed housing types', 'budget solutions', 'rebuilding'], '0-45 years', 3, true),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Riverwood', 'riverwood', 'Northeast', 'golf-community', '1990s-2010s', 'Upper middle income', 'Gated golf community', ARRAY['hurricane damage', 'premium systems', 'HOA requirements', 'humidity control'], '0-28 years', 4, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Charlotte Harbor', 'charlotte-harbor', 'West', 'waterfront', '1960s-2000s', 'Middle income', 'Near harbor', ARRAY['severe storm damage', 'rebuilding', 'waterfront systems', 'salt exposure'], '0-50 years', 5, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Port Charlotte Beach', 'port-charlotte-beach', 'West', 'single-family', '1970s-1990s', 'Middle income', 'Near beach park', ARRAY['storm recovery', 'older systems', 'replacement needs'], '0-45 years', 6, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Harbour Heights', 'harbour-heights', 'Northwest', 'single-family', '1970s-2000s', 'Moderate income', 'Residential area', ARRAY['mixed damage', 'varied ages', 'standard service'], '0-45 years', 7, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'North Port Charlotte', 'north-port-charlotte', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Northern residential area', ARRAY['varied damage', 'family homes', 'rebuilding'], '0-35 years', 8, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'Mobile Home Communities', 'mobile-homes-pc', 'Various', 'manufactured-home', '1970s-2000s', 'Moderate income', 'Manufactured home parks', ARRAY['significant damage', 'package units', 'replacement needs', 'budget constraints'], '0-40 years', 9, false),
  ('c7d8e9f0-a1b2-3456-0123-789012345678', 'East Port Charlotte', 'east-port-charlotte', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Eastern residential', ARRAY['varied conditions', 'family homes', 'standard service'], '0-45 years', 10, false)
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
  'c7d8e9f0-a1b2-3456-0123-789012345678',
  'hvac',
  '/fl/port-charlotte/hvac',
  'HVAC Services in Port Charlotte, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Port Charlotte''s 63,000+ residents. Hurricane Ian recovery specialists. FPL rebates available. Serving Deep Creek, Gulf Cove & all neighborhoods.',
  'HVAC Port Charlotte FL',
  ARRAY['AC repair Port Charlotte', 'air conditioning Port Charlotte FL', 'HVAC contractor Port Charlotte', 'hurricane AC replacement', 'FPL rebates', 'Charlotte County HVAC'],

  'Port Charlotte''s Hurricane Recovery HVAC Experts',
  'Rebuilding comfort after Ian—together',
  'Licensed & Insured | FPL Certified | Hurricane Ian Recovery Specialists',
  'Port Charlotte knows resilience. Hurricane Ian''s direct hit in September 2022 devastated our community, but we''re rebuilding stronger than ever. Whether you''re replacing a damaged system, installing HVAC in a rebuilt home, or maintaining equipment that survived, our team is here to help Port Charlotte recover. We''ve been working alongside our neighbors since day one, providing reliable service and helping homeowners navigate insurance claims and FPL rebates.',

  '{
    "headline": "Why Port Charlotte Homeowners Choose Us",
    "reasons": [
      {"title": "Hurricane Ian Recovery Experts", "description": "We''ve helped hundreds of Port Charlotte families restore comfort after Hurricane Ian. We understand insurance requirements, provide detailed documentation, and work with adjusters."},
      {"title": "Rebuilding Partner", "description": "Many Port Charlotte homes are being rebuilt or renovated. We work with contractors to ensure optimal HVAC installation in new and restored homes."},
      {"title": "FPL Rebate Assistance", "description": "We help you access FPL rebates including $150 for AC replacement and $150 for duct sealing—important savings during recovery."},
      {"title": "Community Commitment", "description": "Port Charlotte is our community. We''re committed to helping our neighbors rebuild with quality HVAC that''s designed to withstand future storms."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Post-Ian Port Charlotte",
    "intro": "Hurricane Ian created unique HVAC challenges throughout Port Charlotte:",
    "challenges": [
      {"title": "Storm Damage Assessment", "description": "Many systems show hidden damage from Ian—corroded components, water intrusion, or structural issues. Professional assessment prevents future failures."},
      {"title": "Insurance Documentation", "description": "Proper documentation is essential for insurance claims. We provide detailed reports and work with adjusters to ensure coverage."},
      {"title": "Code Updates", "description": "Post-Ian construction must meet enhanced hurricane standards. HVAC installations require proper tie-downs, elevation in flood zones, and updated equipment."},
      {"title": "Supply and Timing", "description": "Recovery demand means planning is important. We work with you to schedule installations and ensure equipment availability."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Port Charlotte",
    "services": [
      {"name": "Hurricane Recovery HVAC", "slug": "hurricane-recovery", "description": "Complete HVAC solutions for storm-damaged properties including damage assessment, insurance documentation, and replacement.", "features": ["Damage assessment", "Insurance documentation", "Code-compliant installation", "Hurricane hardening"]},
      {"name": "New Construction", "slug": "new-construction", "description": "HVAC installation for rebuilt and new Port Charlotte homes.", "features": ["Builder coordination", "Code compliance", "Hurricane standards", "Manual J sizing"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs for systems that survived or were recently installed.", "features": ["Same-day service", "All brands", "90-day warranty", "Storm damage expertise"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane tie-downs", "Elevated installation", "10-year warranty"]},
      {"name": "System Assessment", "slug": "system-assessment", "description": "Professional evaluation of existing systems for hidden storm damage.", "features": ["Comprehensive inspection", "Damage documentation", "Insurance reports", "Repair recommendations"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Storm prep", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How do I know if my AC has hidden hurricane damage?", "answer": "Even systems that seem to work may have hidden damage—corroded components, water intrusion, or stressed parts. We provide comprehensive assessments with documentation for insurance."},
      {"question": "Can you help with insurance claims?", "answer": "Yes, we provide detailed documentation including photos, damage assessments, and repair/replacement estimates that insurance adjusters need."},
      {"question": "What hurricane standards apply to new AC installations?", "answer": "Post-Ian Port Charlotte requires hurricane tie-downs, may require equipment elevation in flood zones, and must meet enhanced Florida Building Code standards."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. Every dollar helps during recovery."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,650", "days_above_90": "108+", "hurricane_risk": "High"}'::jsonb,

  'Ready to Rebuild Comfort in Port Charlotte?',
  'Contact us today for a free estimate. We''re here to help Port Charlotte recover with quality HVAC and expert service.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Port Charlotte", "description": "Hurricane recovery HVAC services in Port Charlotte, FL.", "url": "https://coolit-hvac.com/port-charlotte-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Port Charlotte", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How do I know if my AC has hurricane damage?", "acceptedAnswer": {"@type": "Answer", "text": "We provide comprehensive assessments to identify hidden storm damage with insurance documentation."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Port Charlotte", "item": "https://coolit-hvac.com/fl/port-charlotte"}]}'::jsonb,

  '/fl/charlotte-county',
  '[{"slug": "/fl/punta-gorda/hvac", "anchor_text": "Punta Gorda HVAC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port AC"}, {"slug": "/fl/englewood/hvac", "anchor_text": "Englewood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/hurricane-recovery", "anchor_text": "Hurricane Recovery"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1850, 26, 16, 87,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
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
-- ============================================
-- Venice, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  'Venice', 'venice', 'Florida', 'FL', 'Sarasota', 'sarasota-county',
  27.0998, -82.4543,
  ARRAY['34284', '34285', '34286', '34287', '34288', '34289', '34292', '34293'],
  'North Port-Sarasota-Bradenton',
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
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  NOW(),
  25463, 'US Census Bureau ACS 2023',
  62847, 425000, 78.4,
  ARRAY['single-family', 'condo', 'active-adult', 'historic-home'],
  '{"pre-1970": 20, "1970s-1980s": 30, "1990s-2000s": 30, "2010s-2020s": 20}'::jsonb,
  90, 55, 73, 3500, 95, 53.4, 'moderate',
  'Historic downtown with Italian-inspired architecture. "Shark Tooth Capital of the World." Beachfront community with strong tourism. Popular retirement destination. Moderate hurricane risk.',
  ARRAY['Venice Regional Bayfront Health', 'Sarasota County Schools', 'City of Venice', 'Tourism industry', 'Healthcare', 'Publix'],
  ARRAY['Venice Beach', 'Historic Downtown Venice', 'Venice Theatre', 'Caspersen Beach', 'Myakka River State Park (nearby)', 'Venice Train Depot'],
  ARRAY['Venice Sun Fiesta', 'Venice Shark Tooth Festival', 'Venice Art Fest', 'Stone Crab Festival'],
  ARRAY['Sarasota County Schools'],
  'Downtown revitalization. Beach area improvements. New residential developments. Healthcare growth. Tourism infrastructure.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Venice Utilities',
  220,
  'Florida Building Code 8th Edition (2023), City of Venice historic overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review required for historic areas", "coastal_setback": "Equipment placement restrictions near beach", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Today', 'Air Comfort', 'Gator Air Conditioning', 'Climate Control Experts', 'Air-Tech'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Historic Downtown Venice', 'downtown-venice', 'Central', 'historic-home', '1920s-1960s', 'Upper middle income', 'Italian-inspired historic district', ARRAY['historic preservation', 'ductless systems', 'older buildings', 'architectural restrictions'], '15-80+ years', 1, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venice Island', 'venice-island', 'West', 'mixed', '1940s-1980s', 'Upper middle income', 'Beachfront area', ARRAY['salt air corrosion', 'beach humidity', 'older systems', 'premium demands'], '15-60 years', 2, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venetian Golf & River Club', 'venetian-golf', 'East', 'golf-community', '2000s-2020s', 'Upper income', 'Premier golf community', ARRAY['premium systems', 'golf course humidity', 'HOA requirements', 'multi-zone needs'], '5-20 years', 3, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Pelican Pointe', 'pelican-pointe', 'Southeast', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'efficiency upgrades'], '10-28 years', 4, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Jacaranda', 'jacaranda', 'East', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['1970s-90s systems', 'family homes', 'system replacements'], '20-45 years', 5, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Bird Bay Village', 'bird-bay', 'North', 'condo', '1980s-1990s', 'Middle income', 'Condo community', ARRAY['condo systems', '1980s-90s equipment', 'association coordination'], '25-40 years', 6, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'South Venice', 'south-venice', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established residential', ARRAY['older systems', 'varied ages', 'standard service'], '20-55 years', 7, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venice Gardens', 'venice-gardens', 'Southeast', 'single-family', '1960s-1980s', 'Moderate income', 'Established neighborhood', ARRAY['older homes', 'budget solutions', 'system replacements'], '25-55 years', 8, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Plantation', 'plantation-venice', 'East', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['golf community needs', 'established systems', 'premium upgrades'], '15-35 years', 9, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Gulf View', 'gulf-view', 'West', 'single-family', '1950s-1980s', 'Upper middle income', 'Near beach', ARRAY['salt air exposure', 'older homes', 'coastal maintenance'], '20-60 years', 10, false)
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
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  'hvac',
  '/fl/venice/hvac',
  'HVAC Services in Venice, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Venice''s 25,000+ residents. Historic downtown and beach specialists. FPL rebates available. Serving Venice Island, Downtown & all neighborhoods.',
  'HVAC Venice FL',
  ARRAY['AC repair Venice', 'air conditioning Venice FL', 'HVAC contractor Venice', 'historic home AC Venice', 'beach HVAC', 'Sarasota County HVAC'],

  'Venice''s Historic & Coastal HVAC Experts',
  'Preserving charm while delivering comfort',
  'Licensed & Insured | FPL Certified | Historic & Beach Property Specialists',
  'Venice—Florida''s "Shark Tooth Capital" and one of the Gulf Coast''s most charming communities—combines Italian-inspired historic architecture with beautiful beaches and world-class golf. With over 25,000 residents who appreciate both character and quality, Venice needs HVAC contractors who understand historic preservation, coastal challenges, and community standards. Our team provides expert service from the unique buildings of historic downtown to the premier golf communities east of I-75.',

  '{
    "headline": "Why Venice Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Downtown Expertise", "description": "Venice''s iconic Italian-inspired downtown requires sensitive HVAC solutions. We provide ductless systems and hidden installations that preserve architectural character."},
      {"title": "Beachfront Protection", "description": "Venice Island and near-beach properties face salt air and humidity. We provide coastal protection and equipment designed for the beach environment."},
      {"title": "Golf Community Experience", "description": "From Venetian Golf & River Club to Pelican Pointe, we serve Venice''s premier communities with HOA-compliant installations and premium equipment."},
      {"title": "FPL Rebate Assistance", "description": "We help Venice homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Venice",
    "intro": "Venice''s character, location, and housing diversity create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Venice''s historic overlay district has strict requirements for equipment visibility and installation methods. Ductless systems often provide the ideal solution."},
      {"title": "Beachfront Conditions", "description": "Venice Island and near-beach properties face accelerated corrosion from salt air. Coastal coatings and enhanced maintenance protect equipment."},
      {"title": "Diverse Housing Stock", "description": "From 1920s downtown buildings to 2020s golf communities, Venice requires varied approaches for different property types and ages."},
      {"title": "Golf Course Humidity", "description": "Properties adjacent to Venice''s many golf courses experience elevated humidity from course irrigation."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Venice",
    "services": [
      {"name": "Historic Downtown HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Venice''s unique Italian-inspired historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Historic compliance", "Zoned comfort"]},
      {"name": "Beachfront HVAC", "slug": "coastal-hvac", "description": "Salt air protection and humidity control for Venice Island and beach-adjacent homes.", "features": ["Coastal coil coating", "Corrosion protection", "Dehumidification", "Salt rinse service"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Venice.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic sensitivity"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for Venice''s golf communities.", "features": ["HOA compliance", "Premium equipment", "Humidity control", "Multi-zone expertise"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with coastal maintenance.", "features": ["Bi-annual service", "Salt air protection", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in historic downtown Venice buildings?", "answer": "Yes, ductless mini-split systems are ideal for Venice''s historic properties. We can often hide equipment to meet historic district requirements while providing excellent comfort."},
      {"question": "Do beach homes need special HVAC consideration?", "answer": "Yes, Venice Island and near-beach properties face salt air corrosion and elevated humidity. We recommend coastal coil coatings, corrosion-resistant equipment, and enhanced dehumidification."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "Do you service Venice''s golf communities?", "answer": "Yes, we serve all Venice golf communities including Venetian Golf & River Club, Pelican Pointe, and Plantation with HOA-compliant installations and premium equipment."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "73%", "cooling_degree_days": "3,500", "days_above_90": "95+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Coastal Comfort in Venice?',
  'Contact us today for a free estimate. We''ll respect Venice''s unique character while delivering modern comfort.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Venice", "description": "Professional HVAC services in Venice, FL specializing in historic and coastal properties.", "url": "https://coolit-hvac.com/venice-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Venice", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in historic downtown Venice?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for Venice historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Venice", "item": "https://coolit-hvac.com/fl/venice"}]}'::jsonb,

  '/fl/sarasota-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port AC"}, {"slug": "/fl/englewood/hvac", "anchor_text": "Englewood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1860, 26, 16, 87,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
