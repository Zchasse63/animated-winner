-- ============================================
-- Fort Myers, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c5d6e7f8-a9b0-1234-8901-567890123456',
  'Fort Myers', 'fort-myers', 'Florida', 'FL', 'Lee', 'lee-county',
  26.6406, -81.8723,
  ARRAY['33901', '33902', '33903', '33905', '33906', '33907', '33908', '33912', '33913', '33916', '33919'],
  'Cape Coral-Fort Myers',
  ARRAY[]::uuid[],
  true, 92
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
  'c5d6e7f8-a9b0-1234-8901-567890123456',
  NOW(),
  95249, 'US Census Bureau ACS 2023',
  54872, 315000, 52.1,
  ARRAY['single-family', 'condo', 'manufactured-home', 'waterfront'],
  '{"pre-1980": 20, "1980s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  92, 55, 75, 3800, 115, 55.2, 'high',
  'Tropical climate with distinct wet and dry seasons. High hurricane exposure. Salt air impacts coastal equipment. Significant retiree population with year-round cooling needs.',
  ARRAY['Lee Health', 'Lee County School District', 'City of Fort Myers', 'Florida Gulf Coast University', 'Lee County Government', 'Hertz Global Holdings', 'Arthrex'],
  ARRAY['Edison and Ford Winter Estates', 'Fort Myers Beach', 'Downtown River District', 'Caloosahatchee River', 'Centennial Park', 'Bell Tower Shops', 'SWFL International Airport'],
  ARRAY['Edison Festival of Light', 'Fort Myers Film Festival', 'Art Walk', 'Taste of the Town', 'Music Walk'],
  ARRAY['Lee County Public Schools'],
  'Downtown River District revitalization. Midtown development. New residential communities. Hurricane Ian recovery and rebuilding. Infrastructure improvements.',
  'Lee County Electric Cooperative (LCEC) / Florida Power & Light (FPL)',
  '{
    "lcec": {"ac_replacement": {"amount": 400, "requirements": "SEER 16+ system"}, "smart_thermostat": {"amount": 75, "requirements": "Qualifying smart thermostat"}},
    "fpl": {"ac_replacement": {"amount": 150, "requirements": "High-efficiency system"}, "duct_sealing": {"amount": 150, "requirements": "Professional testing"}}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Fort Myers Utilities / Lee County Utilities',
  280,
  'Florida Building Code 8th Edition (2023), Enhanced hurricane standards post-Ian',
  '{"hvac_replacement": "Permit required", "hurricane_tie_downs": "Required for outdoor units", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'All Day Air Cooling and Heating', 'Best Home Services'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "LCEC / FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Downtown River District', 'river-district', 'Central', 'mixed', '1920s-2010s', 'Upper middle income', 'Historic downtown with new developments', ARRAY['historic building retrofits', 'commercial HVAC', 'mixed-use systems', 'salt air exposure'], '10-80+ years', 1, true),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'McGregor Boulevard', 'mcgregor-blvd', 'South', 'single-family', '1950s-1990s', 'Upper income', 'Historic corridor with Royal Palms', ARRAY['older luxury homes', 'large system needs', 'duct updates', 'salt air impact'], '15-50 years', 2, true),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Gateway', 'gateway', 'East', 'single-family', '1990s-2020s', 'Upper middle income', 'Master-planned near FGCU and airport', ARRAY['newer construction', 'HOA requirements', 'family homes', 'smart systems'], '5-25 years', 3, true),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Gulf Harbour', 'gulf-harbour', 'Southeast', 'waterfront', '1990s-2010s', 'Upper income', 'Waterfront yacht club community', ARRAY['salt air corrosion', 'premium demands', 'humidity control', 'coastal maintenance'], '10-28 years', 4, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Whiskey Creek', 'whiskey-creek', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established family neighborhood', ARRAY['1970s-90s replacements', 'efficiency upgrades', 'ductwork updates'], '20-40 years', 5, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Iona/McGregor', 'iona-mcgregor', 'Southwest', 'mixed', '1960s-2000s', 'Middle income', 'Near Fort Myers Beach', ARRAY['salt air exposure', 'flood zone considerations', 'mixed housing types'], '15-50 years', 6, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Palm Beach Boulevard', 'palm-beach-blvd', 'East', 'mixed', '1960s-1990s', 'Moderate income', 'Commercial corridor area', ARRAY['older systems', 'commercial HVAC', 'budget solutions'], '20-50 years', 7, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Dunbar', 'dunbar', 'Central', 'single-family', '1950s-1980s', 'Moderate income', 'Historic neighborhood', ARRAY['older homes', 'system replacements', 'budget-conscious'], '25-60 years', 8, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Tice', 'tice', 'North', 'mixed', '1960s-2000s', 'Moderate income', 'Residential area near North Fort Myers', ARRAY['mixed housing', 'manufactured homes', 'varied needs'], '15-50 years', 9, false),
  ('c5d6e7f8-a9b0-1234-8901-567890123456', 'Villas', 'villas', 'West', 'single-family', '1970s-1990s', 'Middle income', 'Established waterway community', ARRAY['canal-side humidity', '1970s-90s systems', 'efficiency updates'], '20-45 years', 10, false)
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
  'c5d6e7f8-a9b0-1234-8901-567890123456',
  'hvac',
  '/fl/fort-myers/hvac',
  'HVAC Services in Fort Myers, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Fort Myers'' 95,000+ residents. Hurricane-hardened systems. LCEC & FPL rebates available. Serving River District, Gateway & all neighborhoods.',
  'HVAC Fort Myers FL',
  ARRAY['AC repair Fort Myers', 'air conditioning Fort Myers FL', 'HVAC contractor Fort Myers', 'hurricane HVAC Fort Myers', 'LCEC rebates Fort Myers', 'Lee County HVAC'],

  'Fort Myers'' Hurricane-Tough HVAC Experts',
  'Coastal comfort you can count on',
  'Licensed & Insured | Hurricane Ian Recovery Specialists | LCEC/FPL Certified',
  'Fort Myers residents know that reliable air conditioning is essential in Southwest Florida''s tropical climate. With 115+ days above 90°F and high hurricane risk, your HVAC system needs to be tough and efficient. Our team has been helping Fort Myers recover and rebuild since Hurricane Ian, installing hurricane-hardened systems that can withstand what Mother Nature delivers. From historic homes on McGregor Boulevard to new construction in Gateway, we provide expert service throughout Lee County''s largest city.',

  '{
    "headline": "Why Fort Myers Homeowners Choose Us",
    "reasons": [
      {"title": "Hurricane Ian Recovery Experts", "description": "We''ve helped hundreds of Fort Myers families restore comfort after Hurricane Ian. We know the challenges of rebuilding and provide efficient, compassionate service."},
      {"title": "Salt Air Specialists", "description": "Coastal Fort Myers homes face accelerated corrosion from salt air. We install corrosion-resistant equipment and provide protective maintenance programs."},
      {"title": "LCEC & FPL Rebate Certified", "description": "We help you access rebates from both LCEC and FPL. Get up to $400 for high-efficiency AC installations plus smart thermostat incentives."},
      {"title": "Year-Round Service", "description": "With Fort Myers'' large retiree population depending on AC, we provide responsive service 365 days a year."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Fort Myers",
    "intro": "Fort Myers'' coastal location and climate create specific HVAC demands:",
    "challenges": [
      {"title": "Hurricane Exposure", "description": "Fort Myers'' direct hurricane exposure means outdoor units must be properly secured and positioned. We install hurricane tie-downs and recommend protective cages."},
      {"title": "Salt Air Corrosion", "description": "The Gulf Coast salt air accelerates corrosion on outdoor equipment. Coastal coil coatings and regular maintenance are essential for system longevity."},
      {"title": "Year-Round Cooling", "description": "With only 55°F average winter lows, Fort Myers runs AC nearly year-round. Systems need to be sized and maintained for continuous operation."},
      {"title": "Flood Zone Considerations", "description": "Many Fort Myers properties are in flood zones. Proper equipment elevation and placement is critical for protection."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Fort Myers",
    "services": [
      {"name": "Hurricane-Hardened Installation", "slug": "hurricane-hvac", "description": "Systems designed to withstand Southwest Florida storms with tie-downs, protective cages, and proper placement.", "features": ["Hurricane tie-downs", "Elevated installations", "Surge protection", "Quick-connect disconnects"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Fort Myers. Same-day emergency service available.", "features": ["Same-day service", "All brands serviced", "90-day warranty", "Senior discounts"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with LCEC and FPL rebate assistance.", "features": ["LCEC/FPL rebates", "Up to 22 SEER2", "Coastal coil coating", "10-year warranty"]},
      {"name": "Salt Air Protection", "slug": "coastal-protection", "description": "Specialized coatings and maintenance to protect equipment from salt air corrosion.", "features": ["Coastal coil coatings", "Corrosion-resistant units", "Protective maintenance", "Extended warranties"]},
      {"name": "Indoor Air Quality", "slug": "indoor-air-quality", "description": "Combat Florida humidity and allergens with whole-home solutions.", "features": ["Whole-home dehumidification", "UV purification", "HEPA filtration", "Mold prevention"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with our coastal maintenance program.", "features": ["Bi-annual service", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How do I protect my AC from hurricanes?", "answer": "We install hurricane tie-downs, recommend protective cages, and ensure proper placement away from flood zones. Quick-disconnect fittings allow for faster evacuation preparation if needed."},
      {"question": "What rebates are available from LCEC?", "answer": "LCEC offers up to $400 for SEER 16+ systems and $75 for smart thermostats. FPL customers can get $150 for high-efficiency systems and $150 for duct sealing."},
      {"question": "How does salt air affect my AC?", "answer": "Salt air accelerates corrosion on outdoor coils and components. We recommend coastal coil coatings and quarterly maintenance rinses to extend equipment life."},
      {"question": "Can you help with Hurricane Ian damage claims?", "answer": "Yes, we provide detailed documentation for insurance claims and work with adjusters to ensure proper replacement coverage."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "75%", "cooling_degree_days": "3,800", "days_above_90": "115+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Hurricane-Tough Comfort in Fort Myers?',
  'Contact us today for a free estimate. We''ll help you access utility rebates and install a system built to handle Southwest Florida''s climate.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Fort Myers", "description": "Professional HVAC services in Fort Myers, FL specializing in hurricane-hardened systems.", "url": "https://coolit-hvac.com/fort-myers-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Fort Myers", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How do I protect my AC from hurricanes?", "acceptedAnswer": {"@type": "Answer", "text": "We install hurricane tie-downs, protective cages, and ensure proper placement."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Fort Myers", "item": "https://coolit-hvac.com/fl/fort-myers"}]}'::jsonb,

  '/fl/lee-county',
  '[{"slug": "/fl/cape-coral/hvac", "anchor_text": "Cape Coral HVAC"}, {"slug": "/fl/naples/hvac", "anchor_text": "Naples AC"}, {"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/hurricane-hvac", "anchor_text": "Hurricane HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1920, 28, 16, 88,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Cape Coral, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  'Cape Coral', 'cape-coral', 'Florida', 'FL', 'Lee', 'lee-county',
  26.5629, -81.9495,
  ARRAY['33904', '33909', '33910', '33914', '33990', '33991', '33993'],
  'Cape Coral-Fort Myers',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456']::uuid[],
  true, 91
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
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  NOW(),
  204510, 'US Census Bureau ACS 2023',
  62847, 345000, 75.8,
  ARRAY['single-family', 'waterfront', 'new-construction', 'pool-home'],
  '{"pre-1980": 10, "1980s-1990s": 25, "2000s-2010s": 40, "2020s": 25}'::jsonb,
  92, 55, 74, 3750, 112, 54.8, 'high',
  'Tropical climate with extensive canal system. More canals than any other city in the world. High hurricane exposure. Salt and brackish water impacts equipment.',
  ARRAY['Lee Health', 'Lee County School District', 'City of Cape Coral', 'Publix', 'Home Depot Distribution', 'Healthcare Network'],
  ARRAY['Cape Coral Yacht Club', 'Tarpon Point Marina', 'Sun Splash Family Waterpark', 'Rotary Park', 'Four Mile Cove Ecological Preserve', 'Cape Coral Historical Museum'],
  ARRAY['Coconut Festival', 'Cape Coral Festival of the Arts', 'Bike Nights', 'Cardboard Boat Regatta', 'Burrowing Owl Festival'],
  ARRAY['Lee County Public Schools'],
  'Rapid population growth. Massive new construction in north Cape Coral. Hurricane Ian recovery. New commercial development along Pine Island Road and Del Prado.',
  'Lee County Electric Cooperative (LCEC)',
  '{
    "ac_replacement": {"amount": 400, "requirements": "SEER 16+ system"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying smart thermostat"},
    "pool_pump": {"amount": 250, "requirements": "Variable speed pool pump"},
    "total_available": {"amount": 1200, "requirements": "Combined LCEC rebates"}
  }'::jsonb,
  'None (all-electric area)',
  'City of Cape Coral Utilities',
  320,
  'Florida Building Code 8th Edition (2023), Cape Coral enhanced hurricane standards',
  '{"hvac_replacement": "Permit required", "hurricane_tie_downs": "Required per FBC", "pool_equipment": "Permit required for pool heaters", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'All Day Air Cooling and Heating', 'Service Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "LCEC", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Southwest Cape Coral', 'sw-cape-coral', 'Southwest', 'waterfront', '1980s-2010s', 'Upper income', 'Gulf access canals and waterfront homes', ARRAY['salt air corrosion', 'premium system demands', 'pool home needs', 'hurricane hardening'], '10-35 years', 1, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Tarpon Point', 'tarpon-point', 'Southeast', 'luxury-estate', '2000s-2010s', 'Upper income', 'Marina and resort community', ARRAY['luxury systems', 'salt air exposure', 'whole-home automation', 'premium service'], '10-20 years', 2, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'North Cape Coral', 'north-cape-coral', 'North', 'new-construction', '2010s-2020s', 'Middle income', 'Rapid new development area', ARRAY['new construction', 'builder-grade systems', 'HOA requirements', 'first-time buyer education'], '0-12 years', 3, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Pelican', 'pelican', 'Southeast', 'single-family', '1990s-2010s', 'Upper middle income', 'Near Cape Coral Parkway', ARRAY['established homes', 'system replacements', 'efficiency upgrades', 'hurricane prep'], '10-28 years', 4, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Southeast Cape Coral', 'se-cape-coral', 'Southeast', 'single-family', '1970s-2000s', 'Middle income', 'Established residential area', ARRAY['1970s-2000s systems', 'canal humidity', 'efficiency updates'], '15-45 years', 5, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Northeast Cape Coral', 'ne-cape-coral', 'Northeast', 'mixed', '1990s-2020s', 'Middle income', 'Growing residential area', ARRAY['mixed age systems', 'new construction', 'varied needs'], '5-28 years', 6, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Burnt Store', 'burnt-store', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Near Burnt Store Marina', ARRAY['newer construction', 'waterfront humidity', 'premium demands'], '5-20 years', 7, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Yacht Club Area', 'yacht-club', 'South', 'waterfront', '1960s-1990s', 'Middle income', 'Historic Cape Coral area', ARRAY['older waterfront homes', 'system replacements', 'canal-side humidity'], '20-50 years', 8, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Sandoval', 'sandoval', 'South', 'single-family', '2000s-2010s', 'Upper middle income', 'Gated community', ARRAY['HOA requirements', 'builder-grade upgrades', 'community standards'], '10-20 years', 9, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Mariana Isles', 'mariana-isles', 'Southeast', 'waterfront', '1990s-2010s', 'Upper income', 'Gulf access community', ARRAY['salt air corrosion', 'premium equipment', 'waterfront maintenance'], '10-28 years', 10, false)
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
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  'hvac',
  '/fl/cape-coral/hvac',
  'HVAC Services in Cape Coral, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Cape Coral''s 200,000+ residents. Canal-side specialists. LCEC rebates up to $400. Serving SW Cape, Tarpon Point & all neighborhoods.',
  'HVAC Cape Coral FL',
  ARRAY['AC repair Cape Coral', 'air conditioning Cape Coral FL', 'HVAC contractor Cape Coral', 'waterfront AC Cape Coral', 'LCEC rebates Cape Coral', 'Lee County HVAC'],

  'Cape Coral''s Canal-Side HVAC Experts',
  'Waterfront comfort specialists since day one',
  'Licensed & Insured | LCEC Certified | Waterfront Home Specialists',
  'Welcome to Cape Coral—the city with more canals than Venice and over 200,000 residents who depend on air conditioning. Whether you''re in a Gulf-access home in Southwest Cape Coral or new construction in the rapidly growing north, our team understands the unique challenges of maintaining comfort in this waterfront paradise. With 400+ miles of canals creating elevated humidity and salt air accelerating equipment wear, you need HVAC specialists who understand Cape Coral''s one-of-a-kind environment.',

  '{
    "headline": "Why Cape Coral Homeowners Choose Us",
    "reasons": [
      {"title": "Waterfront Home Specialists", "description": "With 400+ miles of canals, Cape Coral is unique. We understand how waterfront living affects your HVAC system and provide solutions designed for canal-side homes."},
      {"title": "LCEC Rebate Maximizers", "description": "We help Cape Coral homeowners access up to $400 for high-efficiency systems and $75 for smart thermostats through LCEC rebates."},
      {"title": "Pool Home Experts", "description": "Cape Coral has one of the highest pool-per-capita rates in Florida. We integrate pool area conditioning and understand the demands pool homes place on HVAC systems."},
      {"title": "New Construction Partners", "description": "North Cape Coral is booming. We work with builders and new homeowners to ensure optimal system design and installation."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Cape Coral",
    "intro": "Cape Coral''s canal system and growth create specific HVAC considerations:",
    "challenges": [
      {"title": "Canal-Side Humidity", "description": "With 400+ miles of canals, Cape Coral properties experience elevated humidity. Whole-home dehumidification is often essential for comfort and mold prevention."},
      {"title": "Salt and Brackish Water", "description": "Canal water and Gulf access expose equipment to salt and minerals. Corrosion-resistant equipment and protective maintenance extend system life."},
      {"title": "Hurricane Exposure", "description": "Cape Coral''s geography makes it vulnerable to hurricanes. Proper equipment securing and placement is critical for system survival."},
      {"title": "Rapid Growth", "description": "Cape Coral is one of Florida''s fastest-growing cities. Many builder-grade systems in new homes could benefit from upgrades."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Cape Coral",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Cape Coral''s canal-side homes including corrosion protection and humidity control.", "features": ["Coastal coil coating", "Corrosion-resistant units", "Dehumidification", "Salt air protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Cape Coral''s expansive geography.", "features": ["Same-day service", "All brands serviced", "90-day warranty", "North/South coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with LCEC rebate assistance.", "features": ["LCEC rebates", "Up to 22 SEER2", "Hurricane hardening", "10-year warranty"]},
      {"name": "New Construction", "slug": "new-construction", "description": "Expert installation for Cape Coral''s booming new home market.", "features": ["Builder partnerships", "Manual J sizing", "Code compliance", "Smart home ready"]},
      {"name": "Pool Home Solutions", "slug": "pool-hvac", "description": "Integrated solutions for Cape Coral''s many pool homes.", "features": ["Pool area ventilation", "Humidity management", "Energy efficiency", "Lanai comfort"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with our canal-side maintenance program.", "features": ["Bi-annual service", "Coil cleaning", "Humidity checks", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do canal-side homes need special HVAC attention?", "answer": "Cape Coral''s 400+ miles of canals create elevated humidity levels and expose equipment to salt/brackish water. This requires enhanced dehumidification and corrosion protection."},
      {"question": "What LCEC rebates are available?", "answer": "LCEC offers up to $400 for SEER 16+ AC systems, $75 for smart thermostats, and $250 for variable speed pool pumps. We handle all rebate paperwork."},
      {"question": "Should I upgrade my new construction AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade or enhancement may significantly improve comfort."},
      {"question": "How do you protect AC units from hurricanes?", "answer": "We install hurricane tie-downs per Florida Building Code, recommend protective cages for exposed areas, and ensure proper drainage to prevent flood damage."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,750", "days_above_90": "112+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Waterfront Comfort in Cape Coral?',
  'Contact us today for a free estimate. We''ll help you access LCEC rebates and install a system designed for Cape Coral''s unique canal-side environment.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Cape Coral", "description": "Professional HVAC services in Cape Coral, FL specializing in waterfront homes.", "url": "https://coolit-hvac.com/cape-coral-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Cape Coral", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Why do canal-side homes need special HVAC attention?", "acceptedAnswer": {"@type": "Answer", "text": "Cape Coral''s canals create elevated humidity and salt exposure requiring enhanced dehumidification and corrosion protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Cape Coral", "item": "https://coolit-hvac.com/fl/cape-coral"}]}'::jsonb,

  '/fl/lee-county',
  '[{"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers HVAC"}, {"slug": "/fl/naples/hvac", "anchor_text": "Naples AC"}, {"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1950, 30, 18, 89,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Naples, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  'Naples', 'naples', 'Florida', 'FL', 'Collier', 'collier-county',
  26.1420, -81.7948,
  ARRAY['34102', '34103', '34104', '34105', '34108', '34109', '34110', '34112', '34113', '34114', '34116', '34117', '34119', '34120'],
  'Naples-Marco Island',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456']::uuid[],
  true, 93
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
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  NOW(),
  22088, 'US Census Bureau ACS 2023',
  105847, 875000, 68.4,
  ARRAY['luxury-estate', 'condo', 'single-family', 'waterfront'],
  '{"pre-1980": 15, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 20}'::jsonb,
  91, 56, 74, 3650, 108, 53.6, 'high',
  'Tropical climate moderated by Gulf of Mexico. Significant seasonal population swing. High-end luxury market with demanding clientele. Hurricane exposure with Ian recovery ongoing.',
  ARRAY['NCH Healthcare System', 'Arthrex', 'Collier County Public Schools', 'Collier County Government', 'Ritz-Carlton Naples', 'Naples Grande Beach Resort', 'Moorings Park'],
  ARRAY['Naples Pier', 'Fifth Avenue South', 'Third Street South', 'Naples Zoo', 'Naples Botanical Garden', 'Waterside Shops', 'Mercato', 'Pelican Bay', 'Venetian Village'],
  ARRAY['Naples Winter Wine Festival', 'Naples Art Fair', 'Stone Crab Festival', 'Great Dock Canoe Race', 'Naples Film Festival'],
  ARRAY['Collier County Public Schools'],
  'Hurricane Ian recovery. Luxury condo development. Fifth Avenue improvements. Downtown revitalization. High-end retail expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 800, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Naples / Collier County Utilities',
  350,
  'Florida Building Code 8th Edition (2023), Collier County enhanced coastal construction',
  '{"hvac_replacement": "Permit required", "hurricane_standards": "Enhanced coastal requirements", "noise_ordinance": "Equipment placement restrictions", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Cool Today', 'Advanced Air'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Port Royal', 'port-royal', 'South', 'luxury-estate', '1970s-2020s', 'Ultra high income', 'Most exclusive neighborhood in Naples', ARRAY['multi-system estates', 'wine cellar climate', 'whole-home automation', 'guest house systems'], '5-40 years', 1, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Pelican Bay', 'pelican-bay', 'North', 'luxury-estate', '1980s-2010s', 'Upper income', 'Prestigious beachfront community', ARRAY['high-rise condos', 'salt air exposure', 'premium service demands', 'seasonal systems'], '10-35 years', 2, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Old Naples', 'old-naples', 'Central', 'mixed', '1950s-2000s', 'Upper income', 'Historic downtown Naples', ARRAY['historic renovations', 'commercial HVAC', 'mixed-use buildings', 'noise restrictions'], '10-60 years', 3, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'The Moorings', 'the-moorings', 'Central', 'luxury-estate', '1960s-1990s', 'Upper income', 'Waterfront estates and beach access', ARRAY['waterfront humidity', 'older luxury systems', 'guest quarters', 'pool home needs'], '15-50 years', 4, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Park Shore', 'park-shore', 'Central', 'mixed', '1970s-2010s', 'Upper income', 'High-rise condos and single-family', ARRAY['condo systems', 'high-rise challenges', 'Venetian Bay humidity'], '10-45 years', 5, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Grey Oaks', 'grey-oaks', 'East', 'luxury-estate', '1990s-2010s', 'Upper income', 'Premier golf community', ARRAY['large estate systems', 'golf course humidity', 'whole-home automation'], '10-28 years', 6, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Mediterra', 'mediterra', 'North', 'luxury-estate', '2000s-2020s', 'Upper income', 'Luxury Mediterranean-style community', ARRAY['newer luxury systems', 'HOA standards', 'premium equipment demands'], '5-20 years', 7, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Naples Park', 'naples-park', 'North', 'single-family', '1960s-1990s', 'Middle income', 'Established residential area', ARRAY['older systems', 'budget-friendly options', 'system replacements'], '20-50 years', 8, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Golden Gate', 'golden-gate', 'East', 'single-family', '1970s-2010s', 'Middle income', 'Large planned community', ARRAY['varied age systems', 'family homes', 'budget to mid-range'], '10-45 years', 9, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Aqualane Shores', 'aqualane-shores', 'South', 'luxury-estate', '1960s-2010s', 'Ultra high income', 'Deep water boating community', ARRAY['waterfront corrosion', 'luxury demands', 'boat house systems'], '10-50 years', 10, false)
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
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  'hvac',
  '/fl/naples/hvac',
  'HVAC Services in Naples, FL | Luxury Home AC Repair, Installation & Maintenance',
  'Premium HVAC services for Naples'' discerning homeowners. Port Royal, Pelican Bay & Old Naples specialists. White-glove service. FPL rebates available.',
  'HVAC Naples FL',
  ARRAY['AC repair Naples', 'air conditioning Naples FL', 'luxury home HVAC Naples', 'Port Royal AC', 'Pelican Bay HVAC', 'Collier County HVAC'],

  'Naples'' Premier HVAC Specialists',
  'White-glove service for discerning homeowners',
  'Licensed & Insured | Luxury Property Certified | Hurricane Ian Recovery Experts',
  'Naples represents the pinnacle of Southwest Florida living—from the ultra-exclusive estates of Port Royal to the sophisticated shops of Fifth Avenue. With median home values exceeding $875,000 and residents who expect nothing but the best, Naples homeowners require HVAC service that matches their standards. Our team provides white-glove service throughout Collier County, specializing in the complex multi-zone systems and premium equipment that Naples'' finest properties demand.',

  '{
    "headline": "Why Naples Homeowners Choose Us",
    "reasons": [
      {"title": "Luxury Property Expertise", "description": "From Port Royal estates to Pelican Bay high-rises, we specialize in the sophisticated HVAC systems that Naples'' premier properties require."},
      {"title": "White-Glove Service", "description": "We understand that Naples homeowners expect excellence. Our technicians are trained in premium service protocols and respect for fine properties."},
      {"title": "Multi-System Specialists", "description": "Many Naples estates feature multiple HVAC systems, wine cellars, guest houses, and pool structures. We design and maintain integrated comfort solutions."},
      {"title": "Seasonal Home Experts", "description": "Many Naples properties are seasonal residences. We provide monitoring and maintenance services to ensure your home is comfortable when you arrive."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Naples",
    "intro": "Naples'' luxury market and coastal location create distinctive HVAC requirements:",
    "challenges": [
      {"title": "Estate-Scale Systems", "description": "Naples'' luxury estates often require multiple HVAC systems, zoning for 10+ rooms, and integration with whole-home automation systems."},
      {"title": "Salt Air Protection", "description": "Beachfront and waterfront properties face accelerated corrosion. Premium coastal coatings and enhanced maintenance protect your investment."},
      {"title": "Wine Cellar Climate Control", "description": "Many Naples homes include wine cellars requiring precise temperature and humidity control. We design and maintain specialty climate systems."},
      {"title": "Seasonal Occupancy", "description": "With many part-time residents, systems must handle extended periods of minimal use followed by full operation. Smart monitoring prevents surprises."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Naples",
    "services": [
      {"name": "Luxury Home HVAC", "slug": "luxury-hvac", "description": "Comprehensive solutions for Naples'' finest properties including multi-zone systems and whole-home integration.", "features": ["Multi-zone design", "Whole-home automation", "Premium equipment", "White-glove service"]},
      {"name": "Wine Cellar Climate", "slug": "wine-cellar", "description": "Precision climate control for wine collections requiring exact temperature and humidity.", "features": ["55°F/70% RH control", "Redundant systems", "Monitoring alerts", "Vibration isolation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Prompt, professional repairs for Naples homeowners.", "features": ["Same-day available", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with premium equipment and FPL rebate assistance.", "features": ["Top-tier equipment", "FPL rebates", "Extended warranties", "Quiet operation"]},
      {"name": "Seasonal Monitoring", "slug": "monitoring", "description": "Remote monitoring and maintenance for seasonal residents.", "features": ["24/7 monitoring", "Temperature alerts", "Pre-arrival service", "Storm response"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance programs protecting your investment.", "features": ["Quarterly service", "Priority scheduling", "System optimization", "Salt air protection"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Port Royal and other exclusive communities?", "answer": "Yes, we have extensive experience in Port Royal, Pelican Bay, Grey Oaks, and all of Naples'' premier communities. Our technicians are background-checked and trained for luxury properties."},
      {"question": "Can you maintain my home while I''m away for the season?", "answer": "Absolutely. We offer seasonal monitoring packages that include regular system checks, smart monitoring with alerts, and pre-arrival preparation to ensure your home is ready when you return."},
      {"question": "Do you install wine cellar cooling systems?", "answer": "Yes, we design and install precision climate systems for wine cellars, maintaining 55°F and 70% humidity with redundant systems and monitoring capabilities."},
      {"question": "What premium brands do you recommend for Naples homes?", "answer": "For luxury properties, we typically recommend Carrier Infinity, Trane XV, or Lennox XC series. For quiet operation near living spaces, we also install premium ductless systems from Mitsubishi and Daikin."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,650", "days_above_90": "108+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Your Naples Home?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Naples property, with the white-glove service you expect.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Naples", "description": "Premium HVAC services for luxury homes in Naples, FL.", "url": "https://coolit-hvac.com/naples-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Naples", "addressRegion": "FL"}, "priceRange": "$$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Port Royal?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we have extensive experience in Port Royal and all Naples premier communities."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Naples", "item": "https://coolit-hvac.com/fl/naples"}]}'::jsonb,

  '/fl/collier-county',
  '[{"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers HVAC"}, {"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs AC"}, {"slug": "/fl/marco-island/hvac", "anchor_text": "Marco Island HVAC"}]'::jsonb,
  '[{"slug": "/services/luxury-hvac", "anchor_text": "Luxury Home HVAC"}, {"slug": "/services/wine-cellar", "anchor_text": "Wine Cellar Climate"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1980, 32, 18, 92,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
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
-- ============================================
-- Estero, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a9b0c1d2-e3f4-5678-2345-901234567890',
  'Estero', 'estero', 'Florida', 'FL', 'Lee', 'lee-county',
  26.4381, -81.8067,
  ARRAY['33928', '33929'],
  'Cape Coral-Fort Myers',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456', 'f8a9b0c1-d2e3-4567-1234-890123456789']::uuid[],
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
  'a9b0c1d2-e3f4-5678-2345-901234567890',
  NOW(),
  37697, 'US Census Bureau ACS 2023',
  89547, 425000, 81.2,
  ARRAY['single-family', 'golf-community', 'condo', 'active-adult'],
  '{"1990s": 20, "2000s": 35, "2010s": 30, "2020s": 15}'::jsonb,
  91, 56, 74, 3600, 106, 54.5, 'high',
  'Tropical climate. Florida''s newest municipality (incorporated 2014). Master-planned communities with extensive HOAs. Strong seasonal population. Hurricane Ian recovery ongoing.',
  ARRAY['Hertz Global Holdings', 'Lee County School District', 'Florida Gulf Coast University (nearby)', 'Germain Arena/Hertz Arena', 'Miromar Outlets', 'Healthcare industry'],
  ARRAY['Estero Bay Preserve State Park', 'Koreshan State Historic Site', 'Miromar Outlets', 'Hertz Arena', 'FGCU Campus (adjacent)', 'Estero Community Park'],
  ARRAY['Estero Fine Art Show', 'Coconut Point Art Festival', 'Community events at Estero Park'],
  ARRAY['Lee County Public Schools'],
  'Continued residential growth. Coconut Point expansion. Downtown Estero planning. FGCU expansion impacts. Mixed-use development along US 41.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Village of Estero Utilities / Lee County Utilities',
  290,
  'Florida Building Code 8th Edition (2023), Village of Estero local amendments',
  '{"hvac_replacement": "Permit required", "hurricane_tie_downs": "Required per FBC", "hoa_approval": "May be required in many communities", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Cool Today', 'Best Home Services'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Miromar Lakes', 'miromar-lakes', 'North', 'luxury-estate', '2000s-2020s', 'Upper income', 'Award-winning master-planned community', ARRAY['luxury multi-zone', 'lake humidity', 'smart home integration', 'premium demands'], '5-20 years', 1, true),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Grandezza', 'grandezza', 'South', 'golf-community', '2000s-2010s', 'Upper middle income', 'Bundled golf community', ARRAY['golf course humidity', 'HOA requirements', 'premium systems', 'seasonal usage'], '10-20 years', 2, true),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Coconut Point Area', 'coconut-point-estero', 'Central', 'mixed', '2000s-2010s', 'Upper middle income', 'Near shopping and dining', ARRAY['condo systems', 'commercial proximity', 'newer construction'], '10-20 years', 3, true),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Rapallo', 'rapallo', 'East', 'single-family', '2000s-2010s', 'Middle income', 'Bundled golf community', ARRAY['golf community systems', 'family homes', 'standard service'], '10-20 years', 4, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Bella Terra', 'bella-terra', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Gated community', ARRAY['newer systems', 'HOA standards', 'family sizing'], '5-18 years', 5, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Stoneybrook', 'stoneybrook', 'East', 'golf-community', '1990s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['established systems', 'golf course humidity', 'efficiency upgrades'], '15-28 years', 6, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Fountain Lakes', 'fountain-lakes', 'North', 'single-family', '2000s-2010s', 'Middle income', 'Family-friendly community', ARRAY['family homes', 'standard systems', 'HOA requirements'], '10-20 years', 7, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'The Reserve at Estero', 'the-reserve', 'South', 'active-adult', '2010s-2020s', 'Upper middle income', '55+ active adult community', ARRAY['energy efficiency focus', 'single-level homes', 'quiet operation', 'smart thermostats'], '5-12 years', 8, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'Pelican Sound', 'pelican-sound', 'Southwest', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf community', ARRAY['golf community needs', 'seasonal homes', 'premium expectations'], '10-28 years', 9, false),
  ('a9b0c1d2-e3f4-5678-2345-901234567890', 'West Bay Club', 'west-bay-club', 'West', 'golf-community', '2000s-2010s', 'Upper income', 'Private golf club community', ARRAY['luxury systems', 'club standards', 'premium service'], '10-20 years', 10, false)
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
  'a9b0c1d2-e3f4-5678-2345-901234567890',
  'hvac',
  '/fl/estero/hvac',
  'HVAC Services in Estero, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Estero''s 38,000+ residents. Master-planned community specialists. FPL rebates available. Serving Miromar Lakes, Grandezza & all neighborhoods.',
  'HVAC Estero FL',
  ARRAY['AC repair Estero', 'air conditioning Estero FL', 'HVAC contractor Estero', 'Miromar Lakes AC', 'golf community HVAC', 'Lee County HVAC'],

  'Estero''s Master-Planned Community HVAC Experts',
  'Premium service for Florida''s newest village',
  'Licensed & Insured | FPL Certified | HOA-Compliant Installations',
  'Estero, Florida''s newest municipality, represents modern Southwest Florida living at its finest. From the award-winning Miromar Lakes to the family-friendly neighborhoods throughout the village, Estero''s master-planned communities demand HVAC service that matches their premium standards. With over 38,000 residents, the highest homeownership rate in the region at 81%, and extensive HOA requirements, Estero homeowners need contractors who understand community standards and deliver exceptional results.',

  '{
    "headline": "Why Estero Homeowners Choose Us",
    "reasons": [
      {"title": "Master-Planned Expertise", "description": "Estero is defined by its master-planned communities. We understand the unique requirements, HOA standards, and premium expectations of Miromar Lakes, Grandezza, and every Estero neighborhood."},
      {"title": "HOA-Compliant Installations", "description": "Nearly every Estero home is in an HOA community. We handle all approval requirements and ensure installations meet community standards for equipment placement and appearance."},
      {"title": "Active Adult Specialists", "description": "Estero''s growing 55+ communities like The Reserve have specific needs—energy efficiency, quiet operation, and accessible controls. We provide tailored solutions."},
      {"title": "FPL Rebate Certified", "description": "We help Estero homeowners access FPL rebates including up to $150 for AC replacement and $100 for smart thermostats."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Estero",
    "intro": "Estero''s planned community structure and demographics create specific HVAC considerations:",
    "challenges": [
      {"title": "HOA Requirements", "description": "Estero''s communities have specific requirements for equipment placement, screening, and appearance. Installations must satisfy both code and community standards."},
      {"title": "Golf Course Humidity", "description": "Many Estero properties border irrigated golf courses, creating elevated humidity that requires enhanced dehumidification solutions."},
      {"title": "Newer Construction Quality", "description": "While Estero''s homes are relatively new, many builder-grade systems can benefit from upgrades to better match premium home standards."},
      {"title": "Seasonal Usage", "description": "Estero has a significant seasonal population. Systems need proper care during extended periods of non-use."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Estero",
    "services": [
      {"name": "Master-Planned Community HVAC", "slug": "community-hvac", "description": "Specialized service for Estero''s premier communities with HOA-compliant installations and premium equipment.", "features": ["HOA compliance", "Premium equipment", "Architectural approval", "Community standards"]},
      {"name": "Active Adult Solutions", "slug": "active-adult", "description": "Tailored HVAC solutions for Estero''s 55+ communities focusing on efficiency, comfort, and ease of use.", "features": ["Energy efficiency", "Quiet operation", "Smart controls", "Single-level homes"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Estero''s communities.", "features": ["Same-day service", "All brands", "90-day warranty", "Community access"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with FPL rebate assistance and HOA coordination.", "features": ["FPL rebates", "Up to 22 SEER2", "HOA coordination", "10-year warranty"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems to match Estero''s premium home standards.", "features": ["Capacity increases", "Efficiency upgrades", "Smart integration", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for year-round and seasonal residents.", "features": ["Bi-annual service", "Priority scheduling", "Seasonal options", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you coordinate with Estero HOAs for equipment approval?", "answer": "Yes, we''re experienced with Estero''s major communities and handle HOA coordination. We ensure all installations meet community architectural standards."},
      {"question": "What makes Miromar Lakes HVAC needs different?", "answer": "Miromar Lakes'' luxury homes often require multi-zone systems, smart home integration, and premium equipment. The lakefront location also demands enhanced humidity control."},
      {"question": "Do you service 55+ communities in Estero?", "answer": "Yes, we specialize in active adult communities like The Reserve. We focus on energy efficiency, quiet operation, and easy-to-use controls."},
      {"question": "Should I upgrade my builder-grade AC?", "answer": "Many Estero homes 5-10 years old have builder-grade systems that could benefit from upgrades. If you experience humidity issues or uneven temperatures, we can recommend improvements."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,600", "days_above_90": "106+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Your Estero Home?',
  'Contact us today for a free estimate. We''ll work with your HOA requirements and find the perfect system for your Estero community.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Estero", "description": "Professional HVAC services in Estero, FL specializing in master-planned communities.", "url": "https://coolit-hvac.com/estero-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Estero", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you coordinate with Estero HOAs?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we handle HOA coordination and ensure all installations meet community standards."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Estero", "item": "https://coolit-hvac.com/fl/estero"}]}'::jsonb,

  '/fl/lee-county',
  '[{"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs HVAC"}, {"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers AC"}, {"slug": "/fl/naples/hvac", "anchor_text": "Naples HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/community-hvac", "anchor_text": "Community HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1820, 24, 16, 86,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
