-- ============================================
-- St. Petersburg, FL - Complete SEO/GEO Data Seed
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- 1. CITIES TABLE - St. Petersburg Core Data
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- Fixed UUID for St. Petersburg
  'St. Petersburg',
  'st-petersburg',
  'Florida',
  'FL',
  'Pinellas',
  'pinellas-county',
  27.7731,
  -82.6400,
  ARRAY['33701', '33702', '33703', '33704', '33705', '33706', '33707', '33708', '33709', '33710', '33711', '33712', '33713', '33714', '33715', '33716'],
  'Tampa Bay',
  ARRAY['a1b2c3d4-e5f6-7890-abcd-ef1234567890']::uuid[], -- Tampa
  true,
  90
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - St. Petersburg Research Data
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- St. Petersburg city_id
  NOW(),

  -- Demographics
  264001,
  'US Census Bureau American Community Survey 2023',
  73118,
  372100,
  52.8,
  ARRAY['single-family', 'condo', 'bungalow', 'multi-family'],
  '{"pre-1940": 15, "1940s-1960s": 30, "1970s-1980s": 25, "1990s-2010s": 20, "2020s": 10}'::jsonb,

  -- Climate
  89,
  56,
  72,
  3400,
  85,
  39.7,
  'high',
  'Humid subtropical climate moderated by Gulf of Mexico and Tampa Bay. Known as "Sunshine City" with 361 days of sunshine on average. Peninsula location provides sea breezes that moderate summer heat. Hurricane season June-November.',

  -- Local Context
  ARRAY['Raymond James Financial', 'Jabil', 'BayCare Health System', 'Duke Energy Florida', 'HSN (Home Shopping Network)', 'Power Design', 'City of St. Petersburg', 'Johns Hopkins All Children''s Hospital', 'PSCU', 'Empath Health', 'USF St. Petersburg'],
  ARRAY['Salvador Dali Museum', 'St. Pete Pier', 'Tropicana Field', 'Museum of Fine Arts', 'Sunken Gardens', 'Fort De Soto Park', 'The Vinoy Renaissance Resort', 'Central Avenue Arts District', 'St. Pete Beach', 'Mahaffey Theater'],
  ARRAY['Grand Prix of St. Petersburg (March)', 'Pride Parade (June)', 'Ribfest', 'Localtopia', 'Second Saturday ArtWalk', 'Shine Mural Festival'],
  ARRAY['Pinellas County Schools'],
  'Major downtown revitalization with new Pier District, Edge District development, and continued growth in arts and culture scene. Raymond James Financial headquarters expansion. Growing reputation as arts and cultural destination.',

  -- Utilities & Rebates
  'Duke Energy Florida',
  '{
    "ac_replacement": {
      "amount": 300,
      "requirements": "High-efficiency system, Home Energy Check required within 24 months",
      "notes": "Must be installed by licensed contractor"
    },
    "heat_pump_replacement": {
      "amount": 150,
      "requirements": "New heat pump meeting efficiency standards"
    },
    "manufactured_home_hvac": {
      "amount": 150,
      "requirements": "For manufactured and multifamily properties"
    },
    "total_available": {
      "amount": 1700,
      "requirements": "Combined Home Energy Improvement rebates"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'St. Petersburg Water Resources',
  166,

  -- Building/Codes
  'Florida Building Code 7th Edition, Pinellas County amendments. High-Velocity Hurricane Zone requirements apply. SEER2 minimum 14.3 for split systems.',
  'Permits required for HVAC replacement. Pinellas County Building Services handles permits. Online permit applications available.',
  'moderate',

  -- Competitors
  ARRAY['Climate Design', 'Air Zero', 'Gulf Coast Air Systems', 'Sun State Air Conditioning', 'Blair''s Air', 'Del-Air'],

  -- Research Sources
  '{
    "population": "US Census Bureau ACS 2019-2023",
    "income": "US Census Bureau ACS 2023",
    "housing": "Zillow, US Census ACS 2023",
    "climate": "NOAA, Weather Spark",
    "utilities": "Duke Energy Florida Official Website 2024",
    "employers": "St. Pete EDC, Tampa Bay Business Journal"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - St. Petersburg Neighborhoods
-- ============================================

-- Downtown & Central
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Downtown St. Petersburg', 'downtown', 'Downtown', 'condo', '1920s historic to 2020s high-rises', 'upper', 'St. Pete Pier, Central Avenue, museums, walkable urban core, arts district', ARRAY['high-rise HVAC systems', 'older building retrofits', 'condo association restrictions'], '10-25 years', 1, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Historic Old Northeast', 'old-northeast', 'Northeast', 'single-family', '1910s-1940s Mediterranean and bungalows', 'upper', 'First organized neighborhood, 3000+ historic buildings, brick streets, North Shore Park', ARRAY['historic home HVAC retrofits', 'inadequate ductwork', 'humidity in older construction'], '15-30 years', 2, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Historic Kenwood', 'historic-kenwood', 'Central', 'single-family', '1912-1945 bungalows', 'middle', 'National Register of Historic Places, highest concentration of bungalows in FL, Artist Enclave, LGBTQ-friendly', ARRAY['bungalow HVAC retrofits', 'no original ductwork', 'window unit to central conversions'], '20-35 years', 3, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Edge District', 'edge-district', 'Central', 'mixed', '1920s-1950s with new construction', 'upper-middle', 'Arts and entertainment, breweries, warehouses converted to lofts, Grand Central District', ARRAY['commercial/residential hybrid systems', 'loft humidity control', 'varied system ages'], '5-25 years', 4, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Northeast Neighborhoods
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Snell Isle', 'snell-isle', 'Northeast', 'single-family', '1920s-1960s waterfront estates', 'upper', 'Exclusive waterfront community, golf course, private island feel, prestigious addresses', ARRAY['salt air corrosion', 'oversized older systems', 'humidity from water proximity'], '15-25 years', 5, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Shore Acres', 'shore-acres', 'Northeast', 'single-family', '1950s-1970s waterfront homes', 'upper-middle', 'Canal-front properties, boating access, established neighborhood', ARRAY['salt air damage', 'hurricane concerns', 'aging systems'], '20-30 years', 6, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Venetian Isles', 'venetian-isles', 'Northeast', 'single-family', '1950s-1970s homes', 'upper-middle', 'Waterfront living, canal access, family-friendly', ARRAY['corrosion issues', 'humidity control', 'older system efficiency'], '20-25 years', 7, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- South St. Pete
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Coquina Key', 'coquina-key', 'South', 'single-family', '1960s-1980s homes', 'middle', 'Island community, waterfront access, close to beaches', ARRAY['salt air corrosion', 'humidity issues', 'aging systems'], '25-35 years', 8, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Lakewood Estates', 'lakewood-estates', 'South', 'single-family', '1950s-1970s ranch homes', 'middle', 'Established suburban area, good schools, family neighborhood', ARRAY['aging R-22 systems', 'ductwork deterioration', 'efficiency upgrades needed'], '25-35 years', 9, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Pinellas Point', 'pinellas-point', 'South', 'single-family', '1960s-1980s homes', 'middle', 'Waterfront areas, Maximo Park access, diverse community', ARRAY['older system replacement', 'humidity control', 'ductwork repairs'], '20-30 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Northwest & Beaches
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Jungle Terrace', 'jungle-terrace', 'Northwest', 'single-family', '1950s-1970s homes', 'middle', 'Close to Tyrone Mall, suburban feel, established trees', ARRAY['aging systems', 'ductwork issues', 'efficiency upgrades'], '25-35 years', 11, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Disston Heights', 'disston-heights', 'Northwest', 'single-family', '1950s-1970s construction', 'middle', 'Affordable housing, diverse community, convenient location', ARRAY['older equipment replacement', 'budget-conscious repairs', 'efficiency improvements'], '25-35 years', 12, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Pasadena', 'pasadena', 'Southwest', 'mixed', '1940s-1970s varied', 'middle', 'Near beaches, Gulfport access, eclectic community', ARRAY['varied system ages', 'humidity from beach proximity', 'older home challenges'], '20-35 years', 13, false),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Gateway', 'gateway', 'North', 'mixed', '1990s-2020s modern construction', 'upper-middle', 'Business district, Jabil headquarters, newer development, office parks', ARRAY['commercial HVAC needs', 'newer system maintenance', 'smart building integration'], '5-20 years', 14, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- Beaches (technically separate municipalities but served)
INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'St. Pete Beach', 'st-pete-beach', 'Beaches', 'mixed', '1950s-2000s resort and residential', 'upper-middle', 'Gulf beaches, resorts, Don CeSar hotel, Pass-a-Grille', ARRAY['severe salt air corrosion', 'hurricane damage risk', 'high humidity'], '15-25 years', 15, true),
  ('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Treasure Island', 'treasure-island', 'Beaches', 'mixed', '1960s-1990s beach homes and condos', 'upper-middle', 'Gulf beaches, laid-back atmosphere, vacation rentals', ARRAY['salt air corrosion', 'humidity control', 'vacation property maintenance'], '20-30 years', 16, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT - St. Petersburg HVAC
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
  'b2c3d4e5-f6a7-8901-bcde-f23456789012',
  'hvac',
  '/fl/st-petersburg/hvac',
  'HVAC Repair & AC Service in St. Petersburg, FL | CoolIt',
  '24/7 AC repair in St. Petersburg, FL. Same-day service from Downtown to St. Pete Beach. Duke Energy rebate certified. Serving the Sunshine City since 2010.',
  'HVAC repair St Petersburg FL',
  ARRAY['AC repair St Petersburg', 'air conditioning St Pete', 'HVAC contractor St Petersburg FL', 'emergency AC repair St Pete', 'AC replacement St Petersburg'],

  'Expert AC Repair & HVAC Service in St. Petersburg, FL',
  'The Sunshine City averages 361 days of sun and 85 days above 90°F—your AC works year-round to keep St. Pete homes comfortable. From Historic Old Northeast bungalows to Downtown condos, we respond in 60 minutes.',
  'Trusted by 1,800+ St. Pete homeowners | 4.9 stars | Duke Energy rebate certified',

  'St. Petersburg''s reputation as the Sunshine City means more than beautiful weather—it means your air conditioning system runs nearly constantly from March through November. With 3,400 annual cooling degree days and humidity averaging 72%, St. Pete homes demand reliable HVAC systems sized correctly for our subtropical peninsula climate.

The architectural diversity across St. Petersburg creates unique cooling challenges. Historic Kenwood''s 1920s bungalows and Old Northeast''s Mediterranean-style homes often have HVAC systems retrofitted into spaces never designed for central air. Meanwhile, Downtown''s growing skyline of modern condos and the waterfront properties of Snell Isle face different issues—salt air corrosion and high-rise mechanical complexity.

CoolIt serves all St. Petersburg neighborhoods with comprehensive HVAC repair, installation, and maintenance. Our technicians understand the specific demands of Gulf Coast living, from preventing condenser corrosion in St. Pete Beach properties to optimizing airflow in historic district homes. We''re Duke Energy rebate certified, helping St. Petersburg homeowners save up to $300 on qualifying system replacements.',

  '[
    {
      "title": "60-Minute Response Across St. Petersburg",
      "content": "When your AC fails in St. Pete''s heat, every minute counts. Our GPS-tracked technicians are strategically positioned across Pinellas County, ensuring rapid response whether you''re in Gateway, Lakewood Estates, or the beaches. Emergency service available 24/7, 365 days a year.",
      "local_reference": "From Downtown to St. Pete Beach, Snell Isle to Disston Heights"
    },
    {
      "title": "Gulf Coast Corrosion Specialists",
      "content": "St. Petersburg''s peninsula location means salt air reaches every neighborhood—not just the beaches. We inspect for and prevent the corrosion that destroys condensers and electrical connections. Our technicians apply protective coatings and recommend corrosion-resistant equipment for properties near the water.",
      "local_reference": "Essential for St. Pete Beach, Shore Acres, and all waterfront properties"
    },
    {
      "title": "Historic Home HVAC Expertise",
      "content": "St. Petersburg boasts one of Florida''s richest collections of historic homes. Our technicians specialize in integrating modern HVAC efficiency into Historic Kenwood bungalows, Old Northeast estates, and other architecturally significant properties without compromising their character.",
      "local_reference": "Serving Historic Kenwood, Old Northeast, and designated historic districts"
    },
    {
      "title": "Duke Energy Rebate Certified",
      "content": "We''re certified to process Duke Energy Florida rebates, maximizing your savings on qualifying installations. Current programs offer up to $300 for high-efficiency AC systems. We handle the paperwork and ensure your Home Energy Check requirements are met.",
      "local_reference": "St. Petersburg Duke Energy customers save on every qualifying installation"
    }
  ]'::jsonb,

  '[
    {
      "title": "Salt Air Corrosion on the St. Pete Peninsula",
      "problem": "St. Petersburg sits on a peninsula between Tampa Bay and the Gulf of Mexico. Salt-laden air reaches every neighborhood, accelerating corrosion on condenser coils, electrical connections, and metal components. Waterfront properties in Shore Acres, Snell Isle, and St. Pete Beach experience even more severe degradation.",
      "why_here": "Unlike inland cities, St. Pete''s geography means no neighborhood escapes salt air exposure. Condensers can fail years earlier than expected without proper protection and maintenance.",
      "solution": "We recommend corrosion-resistant equipment for coastal properties and apply protective coatings during maintenance visits. Regular condenser cleaning removes salt buildup before it causes damage."
    },
    {
      "title": "Historic Bungalow HVAC Challenges",
      "problem": "St. Petersburg''s historic districts—particularly Historic Kenwood with Florida''s highest concentration of bungalows—feature homes built decades before air conditioning existed. These properties often have undersized systems, inadequate ductwork, and insufficient return air flow, leading to uneven cooling and high energy bills.",
      "why_here": "Over 45% of St. Petersburg''s housing stock was built before 1970. Historic Kenwood alone contains 2,203 historic buildings, most with HVAC systems added as afterthoughts.",
      "solution": "We design custom solutions for historic St. Pete homes, including high-velocity mini-duct systems that fit in smaller spaces and ductless mini-splits that require no ductwork at all."
    },
    {
      "title": "High-Rise and Condo HVAC Complexity",
      "problem": "Downtown St. Petersburg''s renaissance has brought dozens of new condo towers, each with unique HVAC configurations. Residents face challenges navigating condo association rules, accessing rooftop equipment, and maintaining systems in shared mechanical spaces.",
      "why_here": "Downtown St. Pete''s condo inventory has grown significantly, with high-rise living becoming increasingly popular. Many buildings have specific contractor requirements and access restrictions.",
      "solution": "Our commercial-certified technicians are experienced with high-rise HVAC systems and familiar with major Downtown St. Pete buildings. We work within condo association requirements and coordinate access for complex repairs."
    }
  ]'::jsonb,

  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair for St. Petersburg homes and condos. We diagnose and fix compressor failures, refrigerant leaks, electrical issues, and airflow problems. 24/7 emergency service with 60-minute response across all St. Pete neighborhoods.",
      "local_context": "St. Pete''s year-round cooling season means emergency AC failure is a genuine crisis. We stock common parts for immediate repairs."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Professional AC installation sized correctly for St. Petersburg''s Gulf Coast climate. We install all major brands with proper load calculations and quality workmanship. Every installation includes Duke Energy rebate processing.",
      "local_context": "We recommend corrosion-resistant equipment for St. Pete''s salt air environment and properly sized systems for the peninsula''s high humidity."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump service for St. Petersburg''s mild winter heating needs. While St. Pete rarely sees temperatures below 50°F, efficient heating matters during occasional cold fronts.",
      "local_context": "St. Pete''s mild winters mean heat pumps provide efficient year-round comfort. We ensure smooth heating/cooling transitions."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance including corrosion inspection, refrigerant check, electrical testing, and condensate drain cleaning. Our 21-point inspection keeps St. Pete systems running efficiently.",
      "local_context": "Salt air inspection is included in every St. Petersburg maintenance visit. We recommend spring tune-ups before summer heat arrives."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Solutions for St. Pete''s humidity and air quality challenges including dehumidifiers, UV lights, and air purification. Improve comfort while protecting against mold growth.",
      "local_context": "St. Pete''s 72% average humidity creates ideal mold conditions. Proper humidity control is essential for healthy indoor air."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, repair, and replacement for optimal airflow. Many St. Pete homes have aging ductwork that leaks conditioned air into hot attic spaces.",
      "local_context": "Historic St. Pete homes often have ductwork added as retrofits. We assess condition and recommend improvements for better efficiency."
    }
  ]'::jsonb,

  '[
    {
      "question": "How much does AC repair cost in St. Petersburg?",
      "answer": "Most St. Petersburg AC repairs range from $150-$600. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before beginning any work.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer 24/7 emergency AC repair in St. Petersburg?",
      "answer": "Yes, we provide 24/7 emergency AC repair across all St. Petersburg neighborhoods with 60-minute response times. From Downtown condos to St. Pete Beach properties, we prioritize getting your system running quickly.",
      "is_local_specific": true
    },
    {
      "question": "What Duke Energy rebates are available in St. Petersburg?",
      "answer": "Duke Energy Florida offers up to $300 for qualifying AC system replacements, plus rebates for heat pumps and energy improvements. You must complete a free Home Energy Check within 24 months to qualify. We handle all rebate paperwork.",
      "is_local_specific": true
    },
    {
      "question": "How do I protect my AC from St. Pete''s salt air?",
      "answer": "Salt air corrosion is a major concern across St. Petersburg. We recommend corrosion-resistant condensers for waterfront properties, regular coil cleaning to remove salt buildup, and protective coatings during maintenance. Annual inspections catch corrosion early.",
      "is_local_specific": true
    },
    {
      "question": "Can you install AC in historic St. Pete homes?",
      "answer": "Yes, we specialize in HVAC solutions for Historic Kenwood, Old Northeast, and other St. Pete historic districts. Options include high-velocity mini-duct systems and ductless mini-splits that preserve architectural integrity while providing modern comfort.",
      "is_local_specific": true
    },
    {
      "question": "When should I schedule AC maintenance in St. Petersburg?",
      "answer": "Schedule St. Pete AC maintenance in February or March, before summer heat arrives. This timing ensures your system is ready for the long cooling season and catches any winter corrosion damage early.",
      "is_local_specific": true
    }
  ]'::jsonb,

  '{
    "avg_summer_high": "89°F",
    "avg_humidity": "72%",
    "days_above_90": "85 days/year",
    "sunshine_days": "361 days/year",
    "most_common_ac_issue": "Salt air corrosion & humidity control",
    "avg_home_age": "1965 (45% pre-1970 housing)",
    "local_utility": "Duke Energy Florida",
    "rebates_available": "Yes - up to $300 for qualifying systems",
    "source": "NOAA, US Census, Duke Energy"
  }'::jsonb,

  'Ready for Reliable HVAC Service in St. Petersburg?',
  'St. Petersburg homeowners trust CoolIt for fast, expert AC repair and installation across the Sunshine City. From Historic Kenwood to Downtown, Shore Acres to St. Pete Beach, we deliver 60-minute emergency response, upfront pricing, and Duke Energy rebate expertise. Call now for same-day service.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in St. Petersburg, FL. Same-day emergency response, Duke Energy rebate certified. Serving all St. Pete neighborhoods.",
    "url": "https://coolit.com/fl/st-petersburg/hvac",
    "telephone": "+1-727-555-COOL",
    "priceRange": "$$",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "St. Petersburg",
      "addressRegion": "FL",
      "postalCode": "33701",
      "addressCountry": "US"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.7731,
      "longitude": -82.6400
    },
    "areaServed": {
      "@type": "City",
      "name": "St. Petersburg",
      "containedInPlace": {"@type": "State", "name": "Florida"}
    },
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      "opens": "00:00",
      "closes": "23:59"
    }
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {"@type": "Question", "name": "How much does AC repair cost in St. Petersburg?", "acceptedAnswer": {"@type": "Answer", "text": "Most St. Petersburg AC repairs range from $150-$600 depending on the issue."}},
      {"@type": "Question", "name": "Do you offer 24/7 emergency AC repair in St. Petersburg?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide 24/7 emergency AC repair with 60-minute response times across all St. Pete neighborhoods."}},
      {"@type": "Question", "name": "What Duke Energy rebates are available?", "acceptedAnswer": {"@type": "Answer", "text": "Duke Energy offers up to $300 for qualifying AC replacements. Home Energy Check required within 24 months."}},
      {"@type": "Question", "name": "How do I protect my AC from salt air?", "acceptedAnswer": {"@type": "Answer", "text": "We recommend corrosion-resistant equipment, regular coil cleaning, and protective coatings during maintenance."}}
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Pinellas County", "item": "https://coolit.com/fl/pinellas-county"},
      {"@type": "ListItem", "position": 4, "name": "St. Petersburg HVAC", "item": "https://coolit.com/fl/st-petersburg/hvac"}
    ]
  }'::jsonb,

  '/fl/pinellas-county/hvac',
  '[
    {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa HVAC services"},
    {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC repair"},
    {"slug": "/fl/largo/hvac", "anchor_text": "Largo HVAC contractors"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"}
  ]'::jsonb,

  1050,
  12,
  14,
  82,

  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  meta_description = EXCLUDED.meta_description,
  hero_h1 = EXCLUDED.hero_h1,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  services = EXCLUDED.services,
  faq_content = EXCLUDED.faq_content,
  version = city_seo_content.version + 1,
  updated_at = NOW();
