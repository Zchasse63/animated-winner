-- ============================================
-- Pensacola, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Remaining High Priority
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  'Pensacola', 'pensacola', 'Florida', 'FL', 'Escambia', 'escambia-county',
  30.4213, -87.2169,
  ARRAY['32501', '32502', '32503', '32504', '32505', '32506', '32507', '32508', '32509', '32511', '32512', '32513', '32514', '32516', '32520', '32521', '32522', '32523', '32524', '32526', '32534'],
  'Pensacola-Ferry Pass-Brent',
  ARRAY[]::uuid[],
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
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  NOW(),
  54000, 'US Census Bureau 2023',
  51238, 215000, 54.2,
  ARRAY['single-family', 'historic', 'military-housing', 'waterfront'],
  '{"pre-1960": 20, "1960s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  90, 44, 72, 2850, 88, 65.4, 'very_high',
  'Cradle of Naval Aviation. Beautiful white sand beaches. Historic downtown. Major military presence. Gulf Coast location. High coastal hurricane risk. Significant seasonal tourism.',
  ARRAY['Naval Air Station Pensacola', 'Pensacola Naval Hospital', 'Escambia County School District', 'Sacred Heart Health System', 'Baptist Health Care', 'University of West Florida', 'Tourism industry'],
  ARRAY['National Naval Aviation Museum', 'Historic Pensacola Village', 'Fort Pickens', 'Pensacola Beach', 'Blue Angels', 'Palafox Street', 'Seville Quarter', 'Gulf Islands National Seashore'],
  ARRAY['Blue Angels Homecoming Air Show', 'Pensacola Seafood Festival', 'Great Gulfcoast Arts Festival', 'Foo Foo Festival', 'Gallery Night'],
  ARRAY['Escambia County Public Schools', 'Santa Rosa County Schools'],
  'Downtown waterfront development. Historic district revitalization. Pensacola Bay Bridge completion. Maritime Park expansion. University of West Florida growth.',
  'Gulf Power (Southern Company)',
  '{
    "residential_ac": {"amount": 100, "requirements": "ENERGY STAR certified system"},
    "heat_pump": {"amount": 125, "requirements": "High-efficiency heat pump"},
    "smart_thermostat": {"amount": 50, "requirements": "Qualifying thermostat"},
    "total_available": {"amount": 350, "requirements": "Combined Gulf Power rebates"}
  }'::jsonb,
  'City of Pensacola Gas',
  'Emerald Coast Utilities Authority (ECUA)',
  125,
  'Florida Building Code 8th Edition (2023), Escambia County coastal requirements',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment and enhanced protection", "military_housing": "May require base approval", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Diamond Air Design', 'Cool Breeze Comfort Solutions', 'Aire Serve of Pensacola', 'Keith Air Conditioning', 'Paradise Home Services'],
  '{"demographics": "US Census Bureau 2023", "utilities": "Gulf Power", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Historic Downtown', 'historic-downtown-pcola', 'Central', 'historic', '1880s-1950s', 'Middle income', 'Historic waterfront district', ARRAY['historic buildings', 'older systems', 'preservation concerns', 'waterfront proximity'], '30-140 years', 1, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'East Hill', 'east-hill', 'East', 'historic', '1900s-1950s', 'Upper middle income', 'Historic residential district', ARRAY['historic homes', 'character properties', 'older systems', 'preservation standards'], '70-120 years', 2, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Cordova Park', 'cordova-park', 'Northeast', 'single-family', '1980s-2010s', 'Upper middle income', 'Family-oriented community', ARRAY['family homes', 'newer systems', 'standard service'], '12-40 years', 3, true),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Scenic Highway', 'scenic-highway', 'Northwest', 'mixed', '1950s-2000s', 'Middle income', 'Bay-view corridor', ARRAY['waterfront proximity', 'varied housing', 'mixed ages', 'bay humidity'], '20-70 years', 4, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Warrington', 'warrington', 'South', 'military-adjacent', '1950s-2000s', 'Moderate income', 'Near NAS Pensacola', ARRAY['military families', 'varied housing', 'standard service', 'turnover'], '20-70 years', 5, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Bellview', 'bellview', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Established area', ARRAY['family homes', 'older systems', 'standard service'], '20-50 years', 6, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Ferry Pass', 'ferry-pass', 'North', 'mixed', '1980s-2010s', 'Middle income', 'Suburban area', ARRAY['mixed housing', 'family properties', 'varied ages'], '12-40 years', 7, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'North Hill', 'north-hill', 'Central', 'historic', '1900s-1940s', 'Upper middle income', 'Prestigious historic area', ARRAY['historic estates', 'character homes', 'older systems', 'preservation'], '80-120 years', 8, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'Bayou Texar', 'bayou-texar', 'East', 'waterfront', '1950s-2010s', 'Upper middle income', 'Bayou waterfront living', ARRAY['waterfront humidity', 'bay properties', 'salt exposure', 'varied ages'], '12-70 years', 9, false),
  ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c', 'West Pensacola', 'west-pensacola', 'West', 'mixed', '1960s-2000s', 'Middle income', 'Diverse area', ARRAY['mixed housing', 'family homes', 'varied systems'], '20-60 years', 10, false)
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
  'f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b0c',
  'hvac',
  '/fl/pensacola/hvac',
  'HVAC Services in Pensacola, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pensacola''s 54,000+ residents. Gulf Coast and military specialists. Gulf Power rebates. Serving East Hill, Historic Downtown, Cordova Park & all areas.',
  'HVAC Pensacola FL',
  ARRAY['AC repair Pensacola', 'air conditioning Pensacola FL', 'HVAC contractor Pensacola', 'East Hill HVAC', 'NAS Pensacola AC', 'Gulf Coast HVAC'],

  'Pensacola''s Gulf Coast HVAC Experts',
  'From the Cradle of Naval Aviation to historic downtown',
  'Licensed & Insured | Gulf Power Certified | Military & Historic Home Specialists',
  'Pensacola—the "Cradle of Naval Aviation"—combines military heritage, historic charm, and stunning Gulf Coast beauty. With 54,000 residents from East Hill''s historic estates to Cordova Park''s family neighborhoods, from downtown''s waterfront revival to areas near NAS Pensacola, the Pensacola community presents unique HVAC needs. Our team serves Northwest Florida''s Gulf Coast with expertise spanning military housing, historic preservation, and coastal protection.',

  '{
    "headline": "Why Pensacola Homeowners Choose Us",
    "reasons": [
      {"title": "Military Community Specialists", "description": "NAS Pensacola creates significant military presence. We work with military families, understand PCS schedules, and provide service matching military community needs."},
      {"title": "Historic Home Experts", "description": "East Hill and North Hill feature homes from the 1900s. We provide modern comfort while respecting Pensacola''s historic character and preservation requirements."},
      {"title": "Gulf Coast Protection", "description": "Pensacola''s Gulf location brings high hurricane risk and salt air exposure. We provide maximum coastal protection and hurricane-rated equipment."},
      {"title": "Gulf Power Rebate Certified", "description": "Unlike most Florida, Pensacola has Gulf Power. We maximize Gulf Power rebates including $100 for AC systems and $125 for heat pumps."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Pensacola",
    "intro": "Pensacola''s location and character create specific HVAC demands:",
    "challenges": [
      {"title": "Extreme Hurricane Risk", "description": "Pensacola faces very high hurricane risk as a Gulf Coast city. Wind-rated equipment, secure tie-downs, and enhanced protection are essential for storm survival."},
      {"title": "Coastal Salt Air Corrosion", "description": "Gulf proximity brings aggressive salt air exposure. Unprotected equipment fails rapidly. Coastal-rated components and enhanced corrosion protection are critical."},
      {"title": "Historic Preservation Requirements", "description": "East Hill, North Hill, and historic downtown have preservation standards affecting HVAC equipment placement, appearance, and installation methods."},
      {"title": "Military Housing Considerations", "description": "Properties near NAS Pensacola or in military communities may require base approval for HVAC work. We understand and navigate these requirements."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Pensacola",
    "services": [
      {"name": "Hurricane-Rated HVAC", "slug": "hurricane-hvac", "description": "Maximum protection for Pensacola''s Gulf Coast location.", "features": ["High wind rating", "Secure tie-downs", "Storm protection", "Code compliance"]},
      {"name": "Historic Home Service", "slug": "historic-hvac", "description": "Specialized service for East Hill and historic properties.", "features": ["Preservation-friendly", "Modern comfort", "Character respect", "Expert installation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Pensacola.", "features": ["Same-day service", "All brands", "90-day warranty", "Military-friendly"]},
      {"name": "Coastal Protection AC", "slug": "coastal-hvac", "description": "Maximum salt air protection for Gulf Coast living.", "features": ["Coastal coil coating", "Corrosion protection", "Marine-grade components", "Extended warranties"]},
      {"name": "Military Housing Service", "slug": "military-housing", "description": "Reliable service for military families and communities.", "features": ["Base-approved", "PCS-aware", "Military discounts", "Fast response"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive Gulf Coast maintenance programs.", "features": ["Salt air rinse", "Storm preparation", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "How does Pensacola''s Gulf Coast location affect my HVAC system?", "answer": "Gulf salt air causes rapid corrosion of unprotected equipment. Hurricane risk requires wind-rated systems. We provide maximum coastal protection and storm-rated equipment for Pensacola."},
      {"question": "Can you work on historic East Hill or North Hill homes?", "answer": "Yes, we specialize in Pensacola''s historic properties. We provide modern comfort while respecting historic character and working within preservation guidelines."},
      {"question": "Do you work with military families near NAS Pensacola?", "answer": "Absolutely. We understand military community needs, PCS schedules, and base requirements. We''re proud to serve Pensacola''s military families."},
      {"question": "What Gulf Power rebates are available in Pensacola?", "answer": "Gulf Power offers $100 for ENERGY STAR AC systems, $125 for heat pumps, and $50 for smart thermostats. We handle all rebate paperwork for Pensacola residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_winter_low": "44°F", "avg_humidity": "72%", "cooling_degree_days": "2,850", "days_above_90": "88+", "hurricane_risk": "Very High"}'::jsonb,

  'Ready for Gulf Coast Comfort in Pensacola?',
  'Contact us today for a consultation. From historic East Hill to NAS Pensacola to Gulf-view properties, we''ll deliver expert HVAC service with Gulf Power rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Pensacola", "description": "Professional HVAC services for Pensacola, FL specializing in Gulf Coast and historic properties.", "url": "https://coolit-hvac.com/pensacola-fl", "telephone": "+1-850-555-COOL", "areaServed": {"@type": "City", "name": "Pensacola", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How does Gulf Coast location affect HVAC?", "acceptedAnswer": {"@type": "Answer", "text": "Gulf salt air causes rapid corrosion and hurricane risk requires wind-rated equipment with maximum coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Pensacola", "item": "https://coolit-hvac.com/fl/pensacola"}]}'::jsonb,

  '/fl/escambia-county',
  '[{"slug": "/fl/pensacola-beach/hvac", "anchor_text": "Pensacola Beach HVAC"}, {"slug": "/fl/gulf-breeze/hvac", "anchor_text": "Gulf Breeze AC"}, {"slug": "/fl/navarre/hvac", "anchor_text": "Navarre HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/hurricane-hvac", "anchor_text": "Hurricane-Rated HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  2070, 31, 16, 91,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
