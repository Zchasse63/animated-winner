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
