-- ============================================
-- Clearwater, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Clearwater Core Data
-- ============================================

INSERT INTO cities (
  id,
  name,
  slug,
  state,
  state_abbrev,
  county,
  county_slug,
  latitude,
  longitude,
  zip_codes,
  metro_area,
  nearby_city_ids,
  is_active,
  priority
) VALUES (
  'c3d4e5f6-a7b8-9012-cdef-345678901234', -- Fixed UUID for Clearwater
  'Clearwater',
  'clearwater',
  'Florida',
  'FL',
  'Pinellas',
  'pinellas-county',
  27.9726,
  -82.7968,
  ARRAY['33755', '33756', '33757', '33758', '33759', '33760', '33761', '33762', '33763', '33764', '33765', '33766', '33767', '33769'],
  'Tampa Bay',
  ARRAY['a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'b2c3d4e5-f6a7-8901-bcde-f23456789012']::uuid[], -- Tampa, St. Pete
  true,
  85
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Clearwater Research Data
-- ============================================

INSERT INTO city_research (
  city_id,
  researched_at,

  -- Demographics
  population,
  population_source,
  median_household_income,
  median_home_value,
  homeownership_rate,
  primary_housing_types,
  housing_construction_eras,

  -- Climate
  avg_summer_high_f,
  avg_winter_low_f,
  avg_humidity_percent,
  annual_cooling_degree_days,
  days_above_90f,
  annual_rainfall_inches,
  hurricane_risk_level,
  climate_notes,

  -- Local Context
  major_employers,
  notable_landmarks,
  local_events,
  school_districts,
  recent_developments,

  -- Utilities & Rebates
  electric_utility,
  electric_utility_rebates,
  gas_utility,
  water_utility,
  water_hardness_ppm,

  -- Building/Codes
  local_building_codes,
  permit_requirements,
  hoa_prevalence,

  -- Competitive Landscape
  top_hvac_competitors,

  -- Source Tracking
  research_sources
) VALUES (
  'c3d4e5f6-a7b8-9012-cdef-345678901234',
  NOW(),

  -- Demographics
  116811,
  'US Census Bureau American Community Survey 2023',
  73178,
  419100,
  59.1,
  ARRAY['single-family', 'condo', 'townhome', '55+ community'],
  '{"pre-1960": 10, "1960s-1970s": 25, "1980s-1990s": 40, "2000s-2010s": 18, "2020s": 7}'::jsonb,

  -- Climate
  90,
  54,
  73,
  3450,
  88,
  42.5,
  'high',
  'Humid subtropical climate with Gulf of Mexico influence. Beach areas experience sea breezes that moderate temperatures. Heavy afternoon thunderstorms June-September. Hurricane season June-November with significant exposure.',

  -- Local Context
  ARRAY['BayCare Health System', 'Tech Data Corporation', 'Morton Plant Hospital', 'KnowBe4', 'Lincare Holdings', 'AmeriLife', 'City of Clearwater', 'Pinellas County Schools', 'Geographic Solutions'],
  ARRAY['Clearwater Beach', 'Pier 60', 'Clearwater Marine Aquarium', 'Capitol Theatre', 'Coachman Park', 'Sand Key Park', 'Moccasin Lake Nature Park', 'Ruth Eckerd Hall', 'Countryside Mall'],
  ARRAY['Clearwater Jazz Holiday (October)', 'Pier 60 Sugar Sand Festival', 'Clearwater Celebrates America (July 4)', 'Sea-Blues Festival', 'Pride events'],
  ARRAY['Pinellas County Schools'],
  'Clearwater Beach named Best Beach in America 2019. Downtown revitalization ongoing. BayCare headquarters expansion. Growing tech sector with KnowBe4 and cybersecurity companies.',

  -- Utilities & Rebates
  'Duke Energy Florida',
  '{
    "ac_replacement": {
      "amount": 300,
      "requirements": "High-efficiency system, Home Energy Check required",
      "notes": "Must be installed by licensed contractor"
    },
    "heat_pump": {
      "amount": 150,
      "requirements": "Qualifying efficiency standards"
    },
    "total_program": {
      "amount": 1700,
      "requirements": "Combined Home Energy Improvement rebates"
    }
  }'::jsonb,
  'TECO Peoples Gas',
  'Clearwater Gas System / City of Clearwater Utilities',
  170,

  -- Building/Codes
  'Florida Building Code 7th Edition, Pinellas County amendments. Coastal construction requirements for beach areas. SEER2 minimum 14.3.',
  'Permits required for HVAC replacement. City of Clearwater Building Department. Online applications available.',
  'high',

  -- Competitors
  ARRAY['Air Zero', 'Climate Design', 'Gulf Coast Air Systems', 'Del-Air', 'Blairs Air', 'Sun State Air'],

  -- Research Sources
  '{
    "population": "US Census Bureau ACS 2023",
    "income": "US Census Bureau ACS 2023",
    "housing": "US Census, City-Data.com 2023",
    "climate": "NOAA National Weather Service",
    "utilities": "Duke Energy Florida, City of Clearwater",
    "employers": "City of Clearwater Economic Development"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Clearwater Neighborhoods
-- ============================================

-- Beach Areas
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Clearwater Beach', 'clearwater-beach', 'Beach', 'mixed', '1970s-2000s condos and beach homes', 'upper', 'Best Beach in America 2019, Pier 60, resorts, walkable, vacation rentals', ARRAY['severe salt air corrosion', 'hurricane damage concerns', 'high humidity from Gulf', 'vacation rental heavy use'], '15-25 years', 1, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Sand Key', 'sand-key', 'Beach', 'condo', '1980s-1990s high-rise condos', 'upper', 'Barrier island, Sand Key Park, Gulf views, exclusive condos', ARRAY['salt air corrosion', 'high-rise HVAC complexity', 'condo association restrictions', 'hurricane exposure'], '20-30 years', 2, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Island Estates', 'island-estates', 'Beach', 'single-family', '1960s-1980s waterfront homes', 'upper', 'Private island community, waterfront living, boat docks', ARRAY['salt air damage', 'older system inefficiency', 'humidity control'], '25-35 years', 3, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Belleair Area
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair', 'belleair', 'Belleair', 'single-family', '1920s-1970s estates', 'upper', 'Historic Belleair Country Club (FL oldest golf club), prestigious estates, old Florida charm', ARRAY['historic home HVAC challenges', 'oversized older systems', 'ductwork in older construction'], '20-35 years', 4, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair Bluffs', 'belleair-bluffs', 'Belleair', 'single-family', '1950s-1970s homes', 'upper-middle', 'Small-town feel, antique shops, close to beaches', ARRAY['aging systems', 'humidity issues', 'older ductwork'], '25-35 years', 5, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Belleair Beach', 'belleair-beach', 'Belleair', 'single-family', '1960s-1990s beach homes', 'upper', 'Quiet residential beach community, no hotels, waterfront', ARRAY['salt air corrosion', 'hurricane prep', 'humidity control'], '20-30 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- North Clearwater
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Countryside', 'countryside', 'North Clearwater', 'mixed', '1980s-1990s planned community', 'middle', 'Countryside Country Club, Countryside Mall, 55+ communities, family-friendly', ARRAY['aging 1980s-90s systems', 'builder-grade equipment', 'R-22 to R-410A conversions'], '25-35 years', 7, true),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Northwood', 'northwood', 'North Clearwater', 'single-family', '1970s-1990s homes', 'middle', 'Established neighborhood, good schools, convenient location', ARRAY['aging systems', 'ductwork deterioration', 'efficiency upgrades needed'], '25-35 years', 8, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Safety Harbor (nearby)', 'safety-harbor', 'North', 'single-family', '1960s-2000s varied', 'upper-middle', 'Charming downtown, Safety Harbor Spa, historic springs', ARRAY['varied system ages', 'older home challenges', 'humidity control'], '15-30 years', 9, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Central/South Clearwater
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Downtown Clearwater', 'downtown', 'Central', 'mixed', '1950s-2010s varied', 'middle', 'Cleveland Street District, Coachman Park, Capitol Theatre, revitalization ongoing', ARRAY['commercial/residential mix', 'older building retrofits', 'varied system types'], '10-35 years', 10, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Harbor Oaks', 'harbor-oaks', 'Central', 'single-family', '1920s-1950s historic homes', 'upper', 'Historic neighborhood, waterfront properties, oak-lined streets', ARRAY['historic home HVAC', 'older ductwork', 'humidity in older construction'], '20-40 years', 11, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Clearwater East', 'clearwater-east', 'East', 'single-family', '1970s-1990s homes', 'middle', 'Affordable housing, convenient to US-19, diverse community', ARRAY['aging systems', 'budget-conscious repairs', 'efficiency improvements'], '25-35 years', 12, false),
  ('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Morningside', 'morningside', 'South', 'single-family', '1950s-1970s homes', 'middle', 'Established neighborhood, close to Morton Plant Hospital, mature trees', ARRAY['older system replacement', 'ductwork issues', 'tree debris on condensers'], '30-40 years', 13, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT - Clearwater HVAC
-- ============================================

INSERT INTO city_seo_content (
  city_id,
  vertical,
  slug,
  title,
  meta_description,
  primary_keyword,
  secondary_keywords,

  hero_h1,
  hero_subheadline,
  hero_trust_bar,
  intro_paragraph,

  why_choose_us,
  local_challenges,
  services,
  faq_content,
  stats_callout,

  final_cta_headline,
  final_cta_body,

  schema_local_business,
  schema_faq_page,
  schema_breadcrumb,

  county_hub_link,
  sibling_city_links,
  service_page_links,

  word_count,
  city_mention_count,
  neighborhood_mention_count,
  unique_content_score,

  status,
  version,
  generated_by,
  generation_prompt_version
) VALUES (
  'c3d4e5f6-a7b8-9012-cdef-345678901234',
  'hvac',
  '/fl/clearwater/hvac',
  'HVAC Repair & AC Service in Clearwater, FL | CoolIt',
  '24/7 AC repair in Clearwater, FL. From Clearwater Beach to Countryside, same-day service. Duke Energy rebate certified. Call for your free estimate.',
  'HVAC repair Clearwater FL',
  ARRAY['AC repair Clearwater', 'air conditioning Clearwater FL', 'HVAC contractor Clearwater', 'emergency AC Clearwater Beach', 'AC replacement Clearwater'],

  'Professional AC Repair & HVAC Service in Clearwater, FL',
  'Home to America''s Best Beach and 88 days above 90°F annually, Clearwater demands reliable air conditioning. Our technicians serve from Clearwater Beach condos to Countryside homes with 60-minute emergency response.',
  'Trusted by 1,500+ Clearwater homeowners | 4.9 stars | Duke Energy rebate certified',

  'Clearwater''s position on Florida''s Gulf Coast creates unique demands on home cooling systems. With the Gulf of Mexico to the west and Tampa Bay to the east, salt air reaches every neighborhood—accelerating corrosion on HVAC equipment throughout the city. Add 88 days above 90°F, average humidity of 73%, and over 3,450 annual cooling degree days, and it''s clear why Clearwater homeowners need HVAC systems built to perform.

The diversity of Clearwater''s housing stock creates varied cooling challenges. Clearwater Beach''s high-rise condos and vacation rentals face constant salt spray and heavy seasonal use. The prestigious estates of Belleair feature older homes with HVAC systems retrofitted into architecture from another era. Meanwhile, Countryside''s 1980s-era planned communities are seeing their original builder-grade equipment reach end of life.

CoolIt provides comprehensive HVAC services across all Clearwater neighborhoods. Our technicians are experienced with the specific challenges of Gulf Coast living—from corrosion prevention in beach properties to efficiency upgrades in established neighborhoods. We''re Duke Energy certified, helping Clearwater homeowners access rebates up to $300 on qualifying system replacements.',

  '[
    {
      "title": "60-Minute Beach-to-Mainland Response",
      "content": "AC emergencies don''t wait, and neither do we. Our Clearwater-based technicians respond within 60 minutes whether you''re in a Clearwater Beach condo, a Belleair estate, or a Countryside townhome. We understand that beach property guests and 55+ community residents can''t wait hours for relief.",
      "local_reference": "Covering Clearwater Beach to Safety Harbor, Sand Key to Countryside"
    },
    {
      "title": "Gulf Coast Corrosion Experts",
      "content": "Salt air is the silent killer of Clearwater HVAC systems. We inspect every service call for corrosion damage, recommend protective coatings, and help beach property owners select corrosion-resistant equipment. Our preventive approach extends equipment life significantly in Clearwater''s harsh coastal environment.",
      "local_reference": "Critical for Clearwater Beach, Sand Key, Island Estates, and Belleair Beach"
    },
    {
      "title": "Vacation Rental Specialists",
      "content": "Clearwater Beach vacation rentals need AC systems that perform under heavy use. We offer priority service contracts, rapid response for guest emergencies, and scheduled maintenance between bookings. Your rental income depends on working AC—we treat it as urgently as you do.",
      "local_reference": "Serving Clearwater Beach property managers and vacation rental owners"
    },
    {
      "title": "Duke Energy Rebate Certified",
      "content": "We process Duke Energy rebates on qualifying installations, putting money back in your pocket. Current programs offer up to $300 for high-efficiency AC systems. We ensure your Home Energy Check requirements are met and handle all rebate paperwork.",
      "local_reference": "Clearwater Duke Energy customers maximize savings on every installation"
    }
  ]'::jsonb,

  '[
    {
      "title": "Severe Salt Air Corrosion in Beach Communities",
      "problem": "Clearwater Beach, Sand Key, and Island Estates experience some of the most aggressive salt air exposure in Tampa Bay. Condenser coils, electrical connections, and metal cabinets corrode rapidly without proper protection. We see condensers fail 3-5 years earlier in beach properties than mainland homes.",
      "why_here": "Clearwater''s barrier islands and beaches put thousands of homes within direct spray range of Gulf waves. Even mainland Clearwater experiences significant salt air from prevailing Gulf breezes.",
      "solution": "We recommend coastal-rated equipment with enhanced corrosion protection for beach properties. Regular coil cleaning removes salt deposits, and protective coatings extend component life. Pre-season inspections catch corrosion before it causes failure."
    },
    {
      "title": "Aging Systems in 1980s-Era Communities",
      "problem": "Countryside and other Clearwater neighborhoods developed during the 1980s population boom now face a wave of HVAC replacements. Original builder-grade equipment from 35+ years ago has long exceeded its lifespan, and older R-22 refrigerant systems require expensive conversions or full replacement.",
      "why_here": "Approximately 40% of Clearwater homes were built during the 1980s-90s development surge. These communities are simultaneously reaching the point where original HVAC equipment fails.",
      "solution": "We help Countryside, Northwood, and similar neighborhood homeowners navigate replacement options. Modern systems offer dramatically improved efficiency—often cutting energy costs by 30-40% compared to aging equipment."
    },
    {
      "title": "High-Rise Condo HVAC Complexity",
      "problem": "Clearwater Beach and Sand Key high-rises present unique HVAC challenges. Limited access for equipment replacement, condo association regulations, shared mechanical spaces, and specialized systems require technicians experienced with commercial-scale residential work.",
      "why_here": "Clearwater Beach''s skyline includes numerous high-rise condominiums, many built in the 1980s-90s with HVAC equipment now requiring replacement. Coordinating this work within condo rules adds complexity.",
      "solution": "Our technicians hold commercial certifications and understand high-rise HVAC systems. We work within condo association requirements, coordinate access with building management, and execute complex replacements efficiently."
    }
  ]'::jsonb,

  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair across all Clearwater neighborhoods. We diagnose and repair compressor failures, refrigerant leaks, electrical problems, and airflow issues. 24/7 emergency service with 60-minute response from beach to mainland.",
      "local_context": "Clearwater''s beach tourism means AC failure in vacation rentals is a business emergency. We prioritize rapid response to keep guests comfortable and reviews positive."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Expert AC installation sized for Clearwater''s Gulf Coast climate. We install all major brands with proper load calculations, quality workmanship, and Duke Energy rebate processing on qualifying systems.",
      "local_context": "We recommend corrosion-resistant equipment for Clearwater Beach properties and properly sized systems for the area''s high humidity. Our technicians understand beach vs. mainland requirements."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump service for Clearwater''s mild winter heating needs. Efficient heating for the few weeks each year when Gulf breezes turn cool.",
      "local_context": "Clearwater winters rarely see temperatures below 50°F, but heat pumps ensure year-round comfort during cold fronts."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance including salt air corrosion inspection, refrigerant check, and condensate drain cleaning. Essential for extending equipment life in Clearwater''s coastal environment.",
      "local_context": "Every Clearwater maintenance visit includes corrosion inspection. We recommend spring tune-ups in February-March before beach season demand peaks."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Humidity control and air purification for Clearwater homes. Whole-house dehumidifiers, UV germicidal lights, and air cleaners protect against mold and allergens.",
      "local_context": "Clearwater''s 73% average humidity creates ideal mold conditions. Proper humidity control is essential, especially in seasonal-use beach properties."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, and replacement for optimal efficiency. Many Clearwater homes have aging ductwork leaking conditioned air into hot attic spaces.",
      "local_context": "Older Clearwater homes, particularly in Belleair and Harbor Oaks, often have original ductwork that''s deteriorated over decades."
    }
  ]'::jsonb,

  '[
    {
      "question": "How much does AC repair cost in Clearwater?",
      "answer": "Most Clearwater AC repairs cost $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins.",
      "is_local_specific": true
    },
    {
      "question": "Do you service Clearwater Beach condos?",
      "answer": "Yes, we service all Clearwater Beach high-rises and condos. Our technicians have commercial certifications and experience with condo association requirements. We coordinate access with building management and understand the unique challenges of beach property HVAC.",
      "is_local_specific": true
    },
    {
      "question": "How do I protect my AC from Clearwater''s salt air?",
      "answer": "Salt air corrosion is a major concern for Clearwater HVAC systems, especially near the beach. We recommend corrosion-resistant equipment, regular coil cleaning to remove salt deposits, protective coatings, and annual inspections to catch corrosion early.",
      "is_local_specific": true
    },
    {
      "question": "What Duke Energy rebates are available in Clearwater?",
      "answer": "Duke Energy offers up to $300 for qualifying AC replacements in Clearwater. You must complete a free Home Energy Check within 24 months to qualify. We handle the rebate paperwork and ensure you receive maximum savings.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer vacation rental AC service in Clearwater Beach?",
      "answer": "Yes, we provide priority service for Clearwater Beach vacation rental properties. We offer rapid response for guest emergencies, scheduled maintenance between bookings, and service contracts that minimize rental income disruption.",
      "is_local_specific": true
    },
    {
      "question": "When should I replace my Countryside home''s original AC?",
      "answer": "If your Countryside home still has its original 1980s-90s AC system, replacement is likely overdue. Systems over 15 years old operate far less efficiently than modern equipment, and R-22 refrigerant is no longer available. New systems can cut energy costs 30-40%.",
      "is_local_specific": true
    }
  ]'::jsonb,

  '{
    "avg_summer_high": "90°F",
    "avg_humidity": "73%",
    "days_above_90": "88 days/year",
    "cooling_degree_days": "3,450+",
    "most_common_ac_issue": "Salt air corrosion & aging 1980s systems",
    "median_home_age": "1978",
    "local_utility": "Duke Energy Florida",
    "rebates_available": "Yes - up to $300 for qualifying systems",
    "source": "NOAA, US Census, Duke Energy"
  }'::jsonb,

  'Ready for Reliable HVAC Service in Clearwater?',
  'From Clearwater Beach condos to Countryside homes, Belleair estates to downtown apartments, CoolIt delivers fast, expert AC service across Clearwater. With 60-minute emergency response, Duke Energy rebate expertise, and Gulf Coast corrosion knowledge, we keep Clearwater homes comfortable. Call now for same-day service.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in Clearwater, FL. Same-day emergency response, Duke Energy rebate certified. Serving Clearwater Beach to Countryside.",
    "url": "https://coolit.com/fl/clearwater/hvac",
    "telephone": "+1-727-555-COOL",
    "priceRange": "$$",
    "address": {"@type": "PostalAddress", "addressLocality": "Clearwater", "addressRegion": "FL", "postalCode": "33755", "addressCountry": "US"},
    "geo": {"@type": "GeoCoordinates", "latitude": 27.9726, "longitude": -82.7968},
    "areaServed": {"@type": "City", "name": "Clearwater", "containedInPlace": {"@type": "State", "name": "Florida"}}
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {"@type": "Question", "name": "How much does AC repair cost in Clearwater?", "acceptedAnswer": {"@type": "Answer", "text": "Most Clearwater AC repairs cost $150-$600 depending on the issue."}},
      {"@type": "Question", "name": "Do you service Clearwater Beach condos?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we service all Clearwater Beach high-rises with commercial-certified technicians."}},
      {"@type": "Question", "name": "How do I protect my AC from salt air?", "acceptedAnswer": {"@type": "Answer", "text": "Use corrosion-resistant equipment, regular coil cleaning, and annual inspections."}}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Pinellas County", "item": "https://coolit.com/fl/pinellas-county"},
      {"@type": "ListItem", "position": 4, "name": "Clearwater HVAC", "item": "https://coolit.com/fl/clearwater/hvac"}
    ]
  }'::jsonb,

  '/fl/pinellas-county/hvac',
  '[
    {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC services"},
    {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg AC repair"},
    {"slug": "/fl/largo/hvac", "anchor_text": "Largo HVAC contractors"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"}
  ]'::jsonb,

  1020,
  14,
  12,
  80,

  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  version = city_seo_content.version + 1,
  updated_at = NOW();
