-- ============================================
-- Bradenton, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  'Bradenton', 'bradenton', 'Florida', 'FL', 'Manatee', 'manatee-county',
  27.4989, -82.5748,
  ARRAY['34201', '34202', '34203', '34204', '34205', '34206', '34207', '34208', '34209', '34210', '34211', '34212'],
  'North Port-Sarasota-Bradenton',
  ARRAY['1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b']::uuid[],
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
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  NOW(),
  55698, 'US Census Bureau ACS 2023',
  58742, 315000, 56.4,
  ARRAY['single-family', 'waterfront', 'historic-home', 'condo'],
  '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 56, 74, 3450, 94, 54.1, 'moderate',
  'Manatee County seat. Manatee River waterfront. Mix of historic and modern. Growing arts scene. Anna Maria Island access. Moderate coastal hurricane risk.',
  ARRAY['Manatee County Government', 'Manatee County Public Schools', 'Manatee Memorial Hospital', 'Tropicana Products', 'Champs Sports', 'City of Bradenton'],
  ARRAY['Riverwalk', 'Village of the Arts', 'South Florida Museum', 'IMG Academy', 'Bradenton Beach', 'Robinson Preserve', 'DeSoto National Memorial'],
  ARRAY['Bradenton Blues Festival', 'Village of the Arts Gallery Walk', 'Bradenton Marauders Baseball', 'Manatee County Fair'],
  ARRAY['Manatee County Public Schools'],
  'Downtown Riverwalk expansion. Lakewood Ranch growth spillover. IMG Academy expansion. Village of the Arts revitalization. Waterfront development.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Bradenton Utilities',
  225,
  'Florida Building Code 8th Edition (2023), City of Bradenton amendments',
  '{"hvac_replacement": "Permit required", "coastal_areas": "Equipment elevation and placement requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Today', 'Gator Air Conditioning', 'Air Comfort', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Downtown Bradenton', 'downtown-bradenton', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic riverfront with Riverwalk', ARRAY['historic buildings', 'ductless needs', 'mixed-use properties', 'waterfront humidity'], '5-80+ years', 1, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Village of the Arts', 'village-of-the-arts', 'Central', 'historic-home', '1920s-1960s', 'Middle income', 'Colorful arts district', ARRAY['historic homes', 'older systems', 'ductless retrofits', 'artist studios'], '30-80+ years', 2, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Palma Sola', 'palma-sola', 'West', 'waterfront', '1950s-1990s', 'Upper middle income', 'Bay waterfront community', ARRAY['salt air corrosion', 'waterfront humidity', 'bay exposure', 'premium demands'], '20-60 years', 3, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'IMG Academy Area', 'img-academy', 'Southeast', 'mixed', '1980s-2020s', 'Upper middle income', 'World-renowned sports academy', ARRAY['athletic facility HVAC', 'residential mix', 'premium service'], '5-35 years', 4, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Braden River', 'braden-river', 'East', 'single-family', '1990s-2010s', 'Upper middle income', 'Growing eastern corridor', ARRAY['newer systems', 'family homes', 'HOA communities'], '10-28 years', 5, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Manatee Avenue Corridor', 'manatee-avenue', 'Central', 'mixed', '1950s-1990s', 'Middle income', 'Central commercial/residential', ARRAY['older systems', 'mixed housing', 'budget solutions'], '25-60 years', 6, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Bayshore Gardens', 'bayshore-gardens', 'Northwest', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'standard service'], '30-60 years', 7, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Cortez', 'cortez', 'West', 'waterfront', '1950s-2000s', 'Middle income', 'Historic fishing village', ARRAY['salt air exposure', 'fishing village character', 'coastal conditions'], '15-60 years', 8, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Oneco', 'oneco', 'North', 'single-family', '1960s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'efficiency focus'], '25-55 years', 9, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'West Bradenton', 'west-bradenton', 'West', 'single-family', '1970s-2000s', 'Middle income', 'Near Anna Maria Island', ARRAY['beach proximity', 'older systems', 'coastal humidity'], '20-45 years', 10, false)
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
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  'hvac',
  '/fl/bradenton/hvac',
  'HVAC Services in Bradenton, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Bradenton''s 56,000+ residents. Waterfront and historic specialists. FPL rebates available. Serving Downtown, Village of the Arts, Palma Sola & all areas.',
  'HVAC Bradenton FL',
  ARRAY['AC repair Bradenton', 'air conditioning Bradenton FL', 'HVAC contractor Bradenton', 'waterfront AC Bradenton', 'Riverwalk HVAC', 'Manatee County HVAC'],

  'Bradenton''s Riverfront HVAC Experts',
  'Comfort solutions from historic downtown to Manatee River',
  'Licensed & Insured | FPL Certified | Waterfront & Historic Specialists',
  'Bradenton—the heart of Manatee County—combines historic charm along the revitalized Riverwalk with waterfront living on the Manatee River and bay. With over 56,000 residents enjoying everything from the colorful Village of the Arts to upscale Palma Sola waterfront properties, Bradenton needs HVAC contractors who understand diverse housing from 1920s bungalows to modern condos. Our team delivers expert service throughout this dynamic Gulf Coast community.',

  '{
    "headline": "Why Bradenton Homeowners Choose Us",
    "reasons": [
      {"title": "Waterfront Specialists", "description": "Palma Sola, Cortez, and other bay communities face salt air and humidity challenges. We provide coastal coil protection and equipment designed for waterfront environments."},
      {"title": "Historic Property Expertise", "description": "Village of the Arts and downtown historic homes require sensitive HVAC solutions. Ductless systems preserve architectural character while delivering modern comfort."},
      {"title": "River City Experience", "description": "Manatee River properties face unique humidity from the river. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "FPL Rebate Assistance", "description": "We help Bradenton homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Bradenton",
    "intro": "Bradenton''s riverfront location and diverse housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Salt Air Corrosion", "description": "Waterfront properties along Palma Sola Bay and the Manatee River face accelerated equipment corrosion. Coastal coil coatings are essential for equipment longevity."},
      {"title": "Historic Building Retrofits", "description": "Village of the Arts and downtown historic homes often lack ductwork. Ductless mini-split systems provide ideal solutions preserving architectural integrity."},
      {"title": "River and Bay Humidity", "description": "Properties near the Manatee River and bay experience elevated humidity requiring enhanced dehumidification beyond standard AC capacity."},
      {"title": "Mixed Housing Ages", "description": "Bradenton spans 1920s bungalows to modern construction, requiring contractors experienced across all housing eras and HVAC technologies."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Bradenton",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Palma Sola, Cortez, and Manatee River properties.", "features": ["Coastal coil coating", "Salt air protection", "Bay humidity control", "Corrosion prevention"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Village of the Arts and downtown properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Bradenton.", "features": ["Same-day service", "All brands", "90-day warranty", "River to bay coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Coastal-rated equipment", "10-year warranty", "Financing available"]},
      {"name": "Dehumidification Systems", "slug": "dehumidification", "description": "Enhanced humidity control for river and bay properties.", "features": ["Whole-home dehumidification", "Mold prevention", "Comfort improvement", "Energy efficient"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting coastal investments.", "features": ["Bi-annual service", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service waterfront properties in Palma Sola?", "answer": "Yes, we specialize in waterfront properties. We provide coastal coil coatings, salt air protection, and maintenance programs designed for bay and river exposure."},
      {"question": "Can you install AC in Village of the Arts historic homes?", "answer": "Absolutely. Ductless mini-split systems are ideal for Village of the Arts properties, providing efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Why do riverfront homes need special HVAC attention?", "answer": "Properties near the Manatee River and Palma Sola Bay experience elevated humidity and salt air. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Bradenton homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "74%", "cooling_degree_days": "3,450", "days_above_90": "94+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Riverfront Comfort in Bradenton?',
  'Contact us today for a consultation. From historic Village of the Arts to waterfront Palma Sola, we''ll keep your Bradenton property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Bradenton", "description": "Professional HVAC services for Bradenton, FL specializing in waterfront and historic properties.", "url": "https://coolit-hvac.com/bradenton-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Bradenton", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service waterfront properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in waterfront properties with coastal coil protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Bradenton", "item": "https://coolit-hvac.com/fl/bradenton"}]}'::jsonb,

  '/fl/manatee-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/lakewood-ranch/hvac", "anchor_text": "Lakewood Ranch AC"}, {"slug": "/fl/palmetto/hvac", "anchor_text": "Palmetto HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1880, 26, 15, 90,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
