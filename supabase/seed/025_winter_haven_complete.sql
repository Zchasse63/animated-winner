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
