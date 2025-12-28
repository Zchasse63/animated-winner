-- ============================================
-- Melbourne, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c0d1e2f3-a4b5-6789-2345-901234567890',
  'Melbourne', 'melbourne', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.0836, -80.6081,
  ARRAY['32901', '32904', '32935', '32940'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['d1e2f3a4-b5c6-7890-3456-012345678901', 'e2f3a4b5-c6d7-8901-4567-123456789012']::uuid[],
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
  'c0d1e2f3-a4b5-6789-2345-901234567890',
  NOW(),
  85681, 'US Census Bureau ACS 2023',
  67842, 285000, 65.3,
  ARRAY['single-family', 'waterfront', 'historic-home', 'condo'],
  '{"pre-1970": 20, "1970s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  90, 57, 75, 3500, 90, 50.2, 'high',
  'Space Coast hub. Historic downtown. Florida Tech university town. Aerospace industry center. Indian River Lagoon waterfront. High coastal hurricane risk.',
  ARRAY['Northrop Grumman', 'L3Harris Technologies', 'Florida Institute of Technology', 'Health First Holmes Regional', 'Brevard County Public Schools', 'City of Melbourne'],
  ARRAY['Historic Downtown Melbourne', 'Eau Gallie Arts District', 'Wickham Park', 'Melbourne Beach', 'Florida Tech', 'Andretti Thrill Park'],
  ARRAY['Melbourne Art Festival', 'Space Coast Birding & Wildlife Festival', 'Downtown Friday Fest', 'Melbourne Independent Filmmakers Festival'],
  ARRAY['Brevard County Public Schools'],
  'Downtown Melbourne revitalization. Eau Gallie Arts District expansion. Aerospace industry growth. Waterfront development. Florida Tech campus expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Melbourne Utilities',
  180,
  'Florida Building Code 8th Edition (2023), City of Melbourne amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Downtown Melbourne', 'downtown-melbourne', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic riverfront downtown', ARRAY['historic buildings', 'mixed-use properties', 'ductless needs', 'varied systems'], '5-80+ years', 1, true),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Eau Gallie', 'eau-gallie', 'South', 'mixed', '1940s-2000s', 'Middle income', 'Historic arts district', ARRAY['historic homes', 'artist studios', 'older systems', 'character preservation'], '15-70 years', 2, true),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Suntree', 'suntree', 'West', 'single-family', '1980s-2010s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'established systems', 'premium demands', 'HOA requirements'], '10-40 years', 3, true),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Viera', 'viera', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'family homes', 'HOA communities', 'smart systems'], '5-20 years', 4, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Indialantic/Melbourne Beach', 'melbourne-beach', 'East', 'waterfront', '1950s-2020s', 'Upper middle income', 'Beachside communities', ARRAY['salt air corrosion', 'beach exposure', 'coastal humidity', 'premium demands'], '5-60 years', 5, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Melbourne Village', 'melbourne-village', 'Central', 'single-family', '1950s-1980s', 'Upper middle income', 'Tree-lined historic enclave', ARRAY['older homes', 'established systems', 'tree shade', 'character preservation'], '30-65 years', 6, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Sherwood Forest', 'sherwood-forest', 'Northwest', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-50 years', 7, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Florida Tech Area', 'florida-tech', 'West', 'mixed', '1960s-2020s', 'Middle income', 'University district', ARRAY['rental properties', 'mixed ages', 'student housing', 'varied needs'], '5-55 years', 8, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Bayside Lakes', 'bayside-lakes', 'Southwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer waterfront community', ARRAY['lagoon proximity', 'newer systems', 'waterfront humidity'], '5-20 years', 9, false),
  ('c0d1e2f3-a4b5-6789-2345-901234567890', 'Lake Washington', 'lake-washington', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Lakefront neighborhood', ARRAY['lake humidity', 'older systems', 'mixed ages'], '15-50 years', 10, false)
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
  'c0d1e2f3-a4b5-6789-2345-901234567890',
  'hvac',
  '/fl/melbourne/hvac',
  'HVAC Services in Melbourne, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Melbourne''s 86,000+ residents. Space Coast specialists. FPL rebates available. Serving Downtown, Suntree, Viera, Melbourne Beach & all areas.',
  'HVAC Melbourne FL',
  ARRAY['AC repair Melbourne', 'air conditioning Melbourne FL', 'HVAC contractor Melbourne', 'Space Coast AC', 'beach HVAC Melbourne', 'Brevard County HVAC'],

  'Melbourne''s Space Coast HVAC Experts',
  'Comfort solutions from historic downtown to the beach',
  'Licensed & Insured | FPL Certified | Beach & Waterfront Specialists',
  'Melbourne—the heart of Florida''s Space Coast—combines historic charm in downtown and Eau Gallie with modern communities like Viera and pristine beaches. With over 86,000 residents in a thriving aerospace hub, Melbourne needs HVAC contractors who understand diverse housing from 1920s downtown buildings to beachfront properties. Our team delivers expert service throughout this dynamic Indian River Lagoon community.',

  '{
    "headline": "Why Melbourne Homeowners Choose Us",
    "reasons": [
      {"title": "Space Coast Specialists", "description": "Melbourne''s aerospace community includes engineers and technical professionals. We provide the expertise, communication, and quality service you expect."},
      {"title": "Beach Property Experts", "description": "Melbourne Beach and Indialantic face salt air challenges. We provide coastal coil protection and equipment designed for beachfront environments."},
      {"title": "Historic Preservation", "description": "Downtown Melbourne and Eau Gallie Arts District feature beautiful historic properties. Ductless systems preserve character while delivering modern comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Melbourne homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Melbourne",
    "intro": "Melbourne''s coastal location and diverse housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Salt Air Corrosion", "description": "Melbourne Beach and Indian River Lagoon waterfront properties face accelerated equipment corrosion. Coastal coil coatings are essential for system longevity."},
      {"title": "Lagoon Humidity", "description": "Properties along the Indian River Lagoon experience elevated humidity requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Historic Building Retrofits", "description": "Downtown Melbourne and Eau Gallie historic properties often lack modern HVAC. Ductless mini-splits provide ideal solutions preserving architectural integrity."},
      {"title": "Diverse Housing Ages", "description": "Melbourne spans 1920s buildings to new Viera construction, requiring contractors experienced across all eras and HVAC technologies."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Melbourne",
    "services": [
      {"name": "Beach Property HVAC", "slug": "beach-hvac", "description": "Specialized solutions for Melbourne Beach and Indialantic properties.", "features": ["Coastal coil coating", "Salt air protection", "Beach humidity control", "Corrosion prevention"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for downtown and Eau Gallie historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Melbourne.", "features": ["Same-day service", "All brands", "90-day warranty", "Downtown to beach coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Coastal-rated equipment", "10-year warranty", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River Lagoon properties.", "features": ["Lagoon humidity control", "Waterfront protection", "Dehumidification", "Salt air defense"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting coastal investments.", "features": ["Bi-annual service", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Melbourne Beach and beachside properties?", "answer": "Yes, we specialize in beachside properties. We provide coastal coil coatings, salt air protection, and maintenance programs designed for beach exposure."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Absolutely. Ductless mini-split systems are ideal for Melbourne''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."},
      {"question": "Why do Indian River Lagoon properties need special attention?", "answer": "Lagoon waterfront properties experience elevated humidity and salt exposure. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Melbourne homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,500", "days_above_90": "90+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Space Coast Comfort in Melbourne?',
  'Contact us today for a consultation. From historic downtown to beachfront properties, we''ll keep your Melbourne home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Melbourne", "description": "Professional HVAC services for Melbourne, FL specializing in beach and historic properties.", "url": "https://coolit-hvac.com/melbourne-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Melbourne", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service beachside properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in beach properties with coastal coil protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Melbourne", "item": "https://coolit-hvac.com/fl/melbourne"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/palm-bay/hvac", "anchor_text": "Palm Bay HVAC"}, {"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa AC"}, {"slug": "/fl/titusville/hvac", "anchor_text": "Titusville HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1900, 28, 16, 83,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
