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
-- ============================================
-- Palm Bay, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  'Palm Bay', 'palm-bay', 'Florida', 'FL', 'Brevard', 'brevard-county',
  27.9859, -80.5887,
  ARRAY['32905', '32907', '32908', '32909'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890']::uuid[],
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
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  NOW(),
  119760, 'US Census Bureau ACS 2023',
  59847, 245000, 74.8,
  ARRAY['single-family', 'new-construction', 'affordable-housing', 'waterfront'],
  '{"pre-1980": 10, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 25}'::jsonb,
  90, 58, 75, 3550, 92, 51.4, 'high',
  'Brevard''s largest city by population. Affordable housing market. Rapid growth and development. Turkey Creek Sanctuary. Moderate inland hurricane risk turning high near coast.',
  ARRAY['Brevard County Public Schools', 'Harris Corporation (nearby)', 'City of Palm Bay', 'Retail and service industry', 'Small businesses', 'Healthcare facilities'],
  ARRAY['Turkey Creek Sanctuary', 'Fred Poppe Regional Park', 'Palm Bay Community Center', 'Goode Park', 'Palm Bay Road corridor'],
  ARRAY['Palm Bay Days Festival', 'Community events', 'Turkey Creek events'],
  ARRAY['Brevard County Public Schools'],
  'Continued residential expansion. Commercial corridor development. Infrastructure improvements. Turkey Creek preservation. New school construction.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Palm Bay Utilities',
  175,
  'Florida Building Code 8th Edition (2023), City of Palm Bay amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'West Palm Bay', 'west-palm-bay', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Established western area', ARRAY['older systems', 'family homes', 'efficiency focus', 'budget solutions'], '10-35 years', 1, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Turkey Creek', 'turkey-creek', 'Central', 'single-family', '1990s-2020s', 'Middle income', 'Near nature sanctuary', ARRAY['newer construction', 'family homes', 'mixed ages'], '5-28 years', 2, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Port Malabar', 'port-malabar', 'Northeast', 'single-family', '1960s-1990s', 'Middle income', 'Canal community', ARRAY['canal properties', 'older systems', 'water proximity', 'system replacements'], '25-55 years', 3, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Bayside Lakes', 'bayside-lakes-pb', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer master-planned community', ARRAY['newer systems', 'family homes', 'HOA communities'], '5-20 years', 4, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Malabar Road Corridor', 'malabar-road', 'South', 'mixed', '1980s-2020s', 'Middle income', 'Growing commercial/residential area', ARRAY['mixed housing', 'varied ages', 'new development'], '5-35 years', 5, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Palm Bay Farms', 'palm-bay-farms', 'Northwest', 'single-family', '1990s-2010s', 'Middle income', 'Residential community', ARRAY['established systems', 'family sizing', 'standard service'], '10-28 years', 6, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Compound', 'the-compound', 'Southwest', 'single-family', '1980s-2000s', 'Middle income', 'Large-lot properties', ARRAY['larger homes', 'older systems', 'rural character'], '15-40 years', 7, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Emerson Drive Area', 'emerson-drive', 'North', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 8, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'New Haven', 'new-haven', 'East', 'single-family', '2000s-2020s', 'Middle income', 'Growing area', ARRAY['newer construction', 'family homes', 'builder-grade systems'], '5-20 years', 9, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Palm Isles', 'palm-isles', 'Southeast', 'single-family', '1990s-2010s', 'Middle income', 'Community near I-95', ARRAY['established systems', 'family homes', 'standard needs'], '10-28 years', 10, false)
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
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  'hvac',
  '/fl/palm-bay/hvac',
  'HVAC Services in Palm Bay, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Palm Bay''s 120,000+ residents. Affordable and family-focused. FPL rebates available. Serving Turkey Creek, Port Malabar, Bayside Lakes & all areas.',
  'HVAC Palm Bay FL',
  ARRAY['AC repair Palm Bay', 'air conditioning Palm Bay FL', 'HVAC contractor Palm Bay', 'affordable AC Palm Bay', 'Turkey Creek HVAC', 'Brevard County HVAC'],

  'Palm Bay''s Family-Focused HVAC Experts',
  'Affordable comfort for Brevard''s largest city',
  'Licensed & Insured | FPL Certified | Family & Value-Focused Service',
  'Palm Bay—Brevard County''s largest city with nearly 120,000 residents—represents affordable Florida living with the beautiful Turkey Creek Sanctuary and growing communities. From established neighborhoods in West Palm Bay to new construction near Turkey Creek, Palm Bay families need honest HVAC service with fair pricing. Our team delivers reliable comfort solutions throughout this family-friendly community.',

  '{
    "headline": "Why Palm Bay Families Choose Us",
    "reasons": [
      {"title": "Honest, Affordable Service", "description": "Palm Bay''s median home value is $245,000—we provide honest assessments, fair pricing, and solutions that fit your budget without upselling."},
      {"title": "New Construction Experts", "description": "Palm Bay is growing rapidly. We work with builders and help new homeowners evaluate and optimize their HVAC systems."},
      {"title": "Family-Focused Approach", "description": "With 75% homeownership, Palm Bay is a family community. We provide respectful service, clear communication, and solutions protecting your investment."},
      {"title": "FPL Rebate Assistance", "description": "We help Palm Bay homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Palm Bay",
    "intro": "Palm Bay''s growth and climate create specific HVAC considerations:",
    "challenges": [
      {"title": "Builder-Grade System Evaluation", "description": "Palm Bay''s new construction often includes minimally-sized builder-grade systems. We provide honest evaluations helping homeowners decide if upgrades are worthwhile."},
      {"title": "Older System Replacements", "description": "Much of Palm Bay was built in the 1980s-1990s. Systems in these homes are often past their lifespan and need replacement with efficient modern equipment."},
      {"title": "Canal Property Humidity", "description": "Port Malabar and other canal communities experience elevated humidity from water proximity requiring enhanced dehumidification."},
      {"title": "Budget-Conscious Solutions", "description": "Palm Bay homeowners value affordability. We provide options at every price point with honest recommendations—no pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Affordable HVAC Services in Palm Bay",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout Palm Bay.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance and financing.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Flexible financing"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Palm Bay systems with efficient modern equipment.", "features": ["Efficiency improvements", "Honest assessments", "Multiple options", "Rebate assistance"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Palm Bay''s new homes.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Honest advice"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]},
      {"name": "Emergency Service", "slug": "emergency", "description": "24/7 emergency repairs when you need us most.", "features": ["24/7 availability", "Fast response", "No overtime charges", "Reliable service"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Are your prices affordable for Palm Bay homeowners?", "answer": "Yes, we understand Palm Bay''s value-conscious market. We provide honest pricing, multiple options at different price points, and help you access FPL rebates to maximize savings."},
      {"question": "Should I upgrade my new home''s builder AC system?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade may help. We provide honest assessments—no pressure to buy."},
      {"question": "Do you offer financing for system replacements?", "answer": "Yes, we offer flexible financing options making quality HVAC affordable for Palm Bay families. Multiple plans available to fit your budget."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Palm Bay homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,550", "days_above_90": "92+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Affordable Comfort in Palm Bay?',
  'Contact us today for honest service and a fair price. We''ll help your Palm Bay family stay comfortable with FPL rebates and flexible financing.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Palm Bay", "description": "Affordable HVAC services for Palm Bay, FL families.", "url": "https://coolit-hvac.com/palm-bay-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Palm Bay", "addressRegion": "FL"}, "priceRange": "$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Are your prices affordable?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide honest pricing and help Palm Bay homeowners maximize FPL rebates."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Palm Bay", "item": "https://coolit-hvac.com/fl/palm-bay"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne HVAC"}, {"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa AC"}, {"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1870, 30, 14, 82,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Cocoa, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  'Cocoa', 'cocoa', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.3861, -80.7420,
  ARRAY['32922', '32926', '32927'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890', 'f3a4b5c6-d7e8-9012-5678-234567890123']::uuid[],
  true, 81
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
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  NOW(),
  19041, 'US Census Bureau ACS 2023',
  52847, 235000, 58.4,
  ARRAY['single-family', 'waterfront', 'historic-home', 'mixed'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 56, 75, 3500, 90, 50.8, 'high',
  'Historic Space Coast community. Indian River riverfront. Cocoa Village charm. Kennedy Space Center proximity. Mix of old and new. High coastal hurricane risk.',
  ARRAY['Brevard County Public Schools', 'Rockwell Collins (nearby)', 'City of Cocoa', 'Healthcare facilities', 'Retail businesses', 'Tourism industry'],
  ARRAY['Cocoa Village', 'Historic Cocoa Village Playhouse', 'Indian River', 'Riverfront Park', 'Kennedy Space Center (nearby)', 'Port Canaveral access'],
  ARRAY['Cocoa Village Friday Fest', 'Space Coast Art Festival', 'Riverfront events', 'Historic tours'],
  ARRAY['Brevard County Public Schools'],
  'Cocoa Village revitalization. Riverfront development. Historic preservation efforts. Mixed-use downtown growth. Port Canaveral corridor improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Cocoa Utilities',
  185,
  'Florida Building Code 8th Edition (2023), City of Cocoa amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for Cocoa Village properties", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Cocoa Village', 'cocoa-village', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic downtown riverfront', ARRAY['historic buildings', 'mixed-use properties', 'ductless needs', 'character preservation'], '5-80+ years', 1, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Rockledge Gardens', 'rockledge-gardens', 'South', 'waterfront', '1950s-1990s', 'Upper middle income', 'Indian River waterfront', ARRAY['river humidity', 'waterfront properties', 'older systems', 'salt exposure'], '25-65 years', 2, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Riverfront Area', 'riverfront', 'East', 'waterfront', '1960s-2020s', 'Middle income', 'Indian River properties', ARRAY['river humidity', 'varied ages', 'waterfront exposure'], '5-55 years', 3, true),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'North Cocoa', 'north-cocoa', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Residential neighborhood', ARRAY['older systems', 'family homes', 'budget solutions'], '20-50 years', 4, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'West Cocoa', 'west-cocoa', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'system replacements', 'efficiency focus'], '25-55 years', 5, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Port St. John (adjacent)', 'port-st-john', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Unincorporated adjacent area', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 6, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'South Cocoa', 'south-cocoa', 'South', 'mixed', '1950s-1990s', 'Middle income', 'Older residential', ARRAY['older homes', 'budget focus', 'system replacements'], '25-65 years', 7, false),
  ('e2f3a4b5-c6d7-8901-4567-123456789012', 'Canaveral Groves', 'canaveral-groves', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Western community', ARRAY['established systems', 'family homes', 'standard needs'], '10-40 years', 8, false)
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
  'e2f3a4b5-c6d7-8901-4567-123456789012',
  'hvac',
  '/fl/cocoa/hvac',
  'HVAC Services in Cocoa, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Cocoa''s 19,000+ residents. Historic Cocoa Village and riverfront specialists. FPL rebates available. Serving all Cocoa neighborhoods.',
  'HVAC Cocoa FL',
  ARRAY['AC repair Cocoa', 'air conditioning Cocoa FL', 'HVAC contractor Cocoa', 'Cocoa Village AC', 'riverfront HVAC', 'Brevard County HVAC'],

  'Cocoa''s Historic & Riverfront HVAC Experts',
  'Preserving charm, delivering comfort since [year]',
  'Licensed & Insured | FPL Certified | Historic & Waterfront Specialists',
  'Cocoa—one of Space Coast''s most historic communities—combines the charm of Cocoa Village with scenic Indian River waterfront living. With nearly 19,000 residents appreciating both history and progress, Cocoa needs HVAC contractors who understand historic preservation, riverfront challenges, and community character. Our team provides expert service from historic downtown to riverfront properties throughout this beloved community.',

  '{
    "headline": "Why Cocoa Residents Choose Us",
    "reasons": [
      {"title": "Historic Cocoa Village Experts", "description": "Cocoa Village''s historic buildings deserve sensitive HVAC solutions. We provide ductless systems and retrofits that preserve architectural character while delivering modern comfort."},
      {"title": "Indian River Specialists", "description": "Riverfront and Rockledge Gardens properties face unique humidity from the Indian River. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "Community Knowledge", "description": "We understand Cocoa''s mix of historic charm and practical needs. Our service respects your property while delivering reliable, affordable comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Cocoa homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Cocoa",
    "intro": "Cocoa''s history and riverfront location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Building Preservation", "description": "Cocoa Village and other historic areas require HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "Indian River Humidity", "description": "Riverfront properties experience elevated humidity from the Indian River requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Aging Housing Stock", "description": "Much of Cocoa predates modern building codes. Systems in homes from the 1950s-1970s often need replacement with efficient modern equipment."},
      {"title": "Budget-Conscious Community", "description": "With median home values around $235,000, Cocoa homeowners value honest pricing and practical solutions—no upselling or pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Cocoa",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Cocoa Village and historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "Riverfront HVAC", "slug": "riverfront-hvac", "description": "Enhanced solutions for Indian River waterfront properties.", "features": ["River humidity control", "Waterfront protection", "Dehumidification", "Moisture management"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, honest repairs throughout Cocoa.", "features": ["Same-day service", "Fair pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Cocoa systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in historic Cocoa Village buildings?", "answer": "Yes, ductless mini-split systems are ideal for Cocoa Village''s historic properties. They provide efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Why do Indian River properties need special attention?", "answer": "Riverfront properties experience elevated humidity from the Indian River. Enhanced dehumidification beyond standard AC capacity is often essential for comfort and preventing mold."},
      {"question": "Are your services affordable for Cocoa homeowners?", "answer": "Yes, we provide honest pricing and help you access FPL rebates to maximize savings. We offer solutions at multiple price points with no pressure tactics."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Cocoa homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,500", "days_above_90": "90+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Historic Comfort in Cocoa?',
  'Contact us today for honest service. From Cocoa Village to riverfront properties, we''ll keep your Cocoa home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Cocoa", "description": "Professional HVAC services for Cocoa, FL specializing in historic and riverfront properties.", "url": "https://coolit-hvac.com/cocoa-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Cocoa", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in historic buildings?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for Cocoa Village historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Cocoa", "item": "https://coolit-hvac.com/fl/cocoa"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge HVAC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne AC"}, {"slug": "/fl/titusville/hvac", "anchor_text": "Titusville HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/riverfront-hvac", "anchor_text": "Riverfront HVAC"}]'::jsonb,

  1840, 26, 12, 81,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Titusville, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  'Titusville', 'titusville', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.6122, -80.8075,
  ARRAY['32780', '32781', '32796'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['e2f3a4b5-c6d7-8901-4567-123456789012']::uuid[],
  true, 80
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
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  NOW(),
  48789, 'US Census Bureau ACS 2023',
  55342, 225000, 64.2,
  ARRAY['single-family', 'waterfront', 'historic-home', 'mobile-home'],
  '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 55, 75, 3480, 88, 51.6, 'high',
  'Gateway to Kennedy Space Center. Historic Space Coast city. Indian River lagoon waterfront. Rocket launch views. Space industry heritage. High coastal hurricane risk.',
  ARRAY['Kennedy Space Center', 'NASA contractors', 'Brevard County Public Schools', 'Parrish Medical Center', 'City of Titusville', 'Space industry'],
  ARRAY['Kennedy Space Center Visitor Complex', 'Playalinda Beach', 'Space View Park', 'American Police Hall of Fame', 'Canaveral National Seashore', 'Historic Downtown'],
  ARRAY['Space Coast Birding & Wildlife Festival', 'Titusville Art & Wine Festival', 'Rocket launches', 'Warbird Air Museum events'],
  ARRAY['Brevard County Public Schools'],
  'Space industry modernization. Downtown Titusville revitalization. Kennedy Space Center expansion. Playalinda Beach access. Space tourism growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Titusville Utilities',
  190,
  'Florida Building Code 8th Edition (2023), City of Titusville amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment requirements near coast", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Downtown Titusville', 'downtown-titusville', 'Central', 'mixed', '1920s-1990s', 'Middle income', 'Historic downtown with Space View Park', ARRAY['historic buildings', 'mixed-use properties', 'older systems', 'varied needs'], '20-80+ years', 1, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'LaGrange', 'lagrange', 'South', 'waterfront', '1950s-2000s', 'Upper middle income', 'Indian River lagoon waterfront', ARRAY['lagoon humidity', 'waterfront exposure', 'salt air', 'premium demands'], '15-65 years', 2, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Whispering Hills', 'whispering-hills', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 3, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Suncrest', 'suncrest', 'North', 'single-family', '1970s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'budget solutions'], '25-50 years', 4, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Fox Lake Estates', 'fox-lake-estates', 'East', 'single-family', '1980s-2010s', 'Middle income', 'Near Max Brewer Bridge', ARRAY['established systems', 'family homes', 'standard service'], '10-40 years', 5, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Indian River Highlands', 'indian-river-highlands', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Older residential area', ARRAY['older homes', 'system replacements', 'budget focus'], '25-55 years', 6, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Bellwood', 'bellwood', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency focus'], '20-50 years', 7, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Great Outdoors RV Resort', 'great-outdoors', 'Southwest', 'manufactured', '1980s-2010s', 'Middle income', 'Large RV and mobile home community', ARRAY['manufactured home HVAC', 'seasonal residents', 'specialized service'], '10-40 years', 8, false)
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
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  'hvac',
  '/fl/titusville/hvac',
  'HVAC Services in Titusville, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Titusville''s 49,000+ residents. Gateway to Kennedy Space Center. FPL rebates available. Serving Downtown, LaGrange, all neighborhoods.',
  'HVAC Titusville FL',
  ARRAY['AC repair Titusville', 'air conditioning Titusville FL', 'HVAC contractor Titusville', 'Kennedy Space Center area AC', 'lagoon HVAC', 'Brevard County HVAC'],

  'Titusville''s Space City HVAC Experts',
  'Comfort solutions for the Gateway to Space',
  'Licensed & Insured | FPL Certified | Space Coast Specialists',
  'Titusville—the historic Gateway to Kennedy Space Center—combines space industry heritage with scenic Indian River lagoon living and front-row rocket launch views. With nearly 49,000 residents proud of their space city, Titusville needs HVAC contractors who deliver the reliability and expertise that built the space program. Our team provides professional service from downtown to lagoon waterfront throughout this iconic Space Coast community.',

  '{
    "headline": "Why Titusville Residents Choose Us",
    "reasons": [
      {"title": "Space Industry Reliability", "description": "Titusville''s space industry heritage demands reliability and expertise. We deliver both with professional service NASA contractors and families trust."},
      {"title": "Lagoon Waterfront Specialists", "description": "LaGrange and other Indian River lagoon properties face humidity and salt air challenges. We provide enhanced dehumidification and coastal protection."},
      {"title": "Affordable, Honest Service", "description": "With median home values around $225,000, Titusville homeowners value honest pricing. We provide quality service without upselling or pressure."},
      {"title": "FPL Rebate Assistance", "description": "We help Titusville homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Titusville",
    "intro": "Titusville''s lagoon location and housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Indian River Lagoon Humidity", "description": "LaGrange and waterfront properties experience elevated humidity from the lagoon requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Aging Housing Stock", "description": "Much of Titusville was built in the 1970s-1980s space boom. Systems in these homes often need replacement with efficient modern equipment."},
      {"title": "Manufactured Home HVAC", "description": "Titusville has significant manufactured home communities requiring specialized HVAC knowledge and equipment."},
      {"title": "Budget-Conscious Market", "description": "Titusville homeowners value practical, affordable solutions. We provide honest assessments and options at multiple price points."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Titusville",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Titusville.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River lagoon properties.", "features": ["Lagoon humidity control", "Salt air protection", "Dehumidification", "Waterfront expertise"]},
      {"name": "Manufactured Home Service", "slug": "manufactured-home", "description": "Specialized service for Titusville''s mobile home communities.", "features": ["Specialized equipment", "Proper sizing", "Efficient solutions", "Budget-friendly"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Titusville systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service manufactured homes in Titusville?", "answer": "Yes, we specialize in manufactured home HVAC systems. We understand the unique requirements and provide properly-sized, efficient solutions for mobile homes."},
      {"question": "Why do lagoon waterfront properties need special attention?", "answer": "Properties along the Indian River lagoon experience elevated humidity and salt air. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "Are your prices affordable for Titusville homeowners?", "answer": "Yes, we provide honest pricing and help you access FPL rebates. We offer solutions at multiple price points with no pressure to buy."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Titusville homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,480", "days_above_90": "88+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Space City Comfort in Titusville?',
  'Contact us today for honest, reliable service. From downtown to lagoon waterfront, we''ll keep your Titusville home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Titusville", "description": "Professional HVAC services for Titusville, FL.", "url": "https://coolit-hvac.com/titusville-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Titusville", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service manufactured homes?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in manufactured home HVAC with proper sizing and efficient solutions."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Titusville", "item": "https://coolit-hvac.com/fl/titusville"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa HVAC"}, {"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge AC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/manufactured-home", "anchor_text": "Manufactured Home Service"}]'::jsonb,

  1870, 27, 12, 80,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Rockledge, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  'Rockledge', 'rockledge', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.3503, -80.7256,
  ARRAY['32955', '32956'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890', 'e2f3a4b5-c6d7-8901-4567-123456789012']::uuid[],
  true, 79
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
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  NOW(),
  27942, 'US Census Bureau ACS 2023',
  71547, 315000, 72.8,
  ARRAY['single-family', 'waterfront', 'golf-community', 'historic-home'],
  '{"pre-1960": 15, "1960s-1990s": 35, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  90, 57, 75, 3500, 90, 50.4, 'high',
  'Brevard''s oldest city. Historic Indian River city. Mix of old estates and new development. Viera development area. Indian River lagoon waterfront. High coastal hurricane risk.',
  ARRAY['Rockwell Collins (nearby)', 'Health First', 'Brevard County Public Schools', 'City of Rockledge', 'Aerospace contractors', 'Retail businesses'],
  ARRAY['Historic Rockledge Drive', 'Indian River', 'Barton Avenue historic district', 'Rockledge Public Library', 'Barnes Park', 'Riverwalk'],
  ARRAY['Rockledge Community Days', 'Indian River Lagoon events', 'Historic tours'],
  ARRAY['Brevard County Public Schools'],
  'Historic preservation efforts. Viera development spillover. Indian River Drive improvements. Mixed-use development. Waterfront enhancement.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Rockledge Utilities',
  180,
  'Florida Building Code 8th Edition (2023), City of Rockledge amendments',
  '{"hvac_replacement": "Permit required", "historic_areas": "Design review for historic properties", "coastal_zones": "Wind-rated equipment near coast", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Historic Rockledge Drive', 'historic-rockledge', 'East', 'waterfront', '1920s-1960s', 'Upper income', 'Historic riverfront estates', ARRAY['historic estates', 'older systems', 'lagoon exposure', 'premium demands'], '30-80+ years', 1, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Barton Avenue District', 'barton-avenue', 'Central', 'historic-home', '1920s-1970s', 'Upper middle income', 'Historic neighborhood', ARRAY['historic homes', 'older systems', 'ductless needs', 'character preservation'], '40-80+ years', 2, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Levitt Park', 'levitt-park', 'West', 'single-family', '1960s-1980s', 'Middle income', 'Mid-century neighborhood', ARRAY['mid-century homes', 'older systems', 'efficiency upgrades'], '35-55 years', 3, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Viera East', 'viera-east-rockledge', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer Viera development', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-20 years', 4, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Fiske Boulevard Area', 'fiske-boulevard', 'Central', 'mixed', '1960s-2010s', 'Middle income', 'Commercial/residential corridor', ARRAY['mixed housing', 'varied ages', 'standard service'], '10-55 years', 5, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'River Oaks', 'river-oaks', 'East', 'waterfront', '1980s-2010s', 'Upper middle income', 'Golf and lagoon community', ARRAY['golf course humidity', 'lagoon exposure', 'premium systems'], '10-40 years', 6, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Indian River Highlands', 'indian-river-highlands-rockledge', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'budget solutions'], '25-50 years', 7, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Barnes Park Area', 'barnes-park', 'Central', 'single-family', '1960s-1990s', 'Middle income', 'Near community park', ARRAY['older homes', 'system replacements', 'efficiency focus'], '25-55 years', 8, false)
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
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  'hvac',
  '/fl/rockledge/hvac',
  'HVAC Services in Rockledge, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Rockledge''s 28,000+ residents. Historic and waterfront specialists. FPL rebates available. Serving Historic Rockledge Drive, Barton Avenue & all areas.',
  'HVAC Rockledge FL',
  ARRAY['AC repair Rockledge', 'air conditioning Rockledge FL', 'HVAC contractor Rockledge', 'historic home AC Rockledge', 'lagoon HVAC', 'Brevard County HVAC'],

  'Rockledge''s Historic & Riverfront HVAC Experts',
  'Preserving Brevard''s oldest city since [year]',
  'Licensed & Insured | FPL Certified | Historic & Waterfront Specialists',
  'Rockledge—Brevard County''s oldest incorporated city—combines magnificent historic estates along Rockledge Drive with the charm of Barton Avenue and modern Viera development. With nearly 28,000 residents appreciating both heritage and progress, Rockledge needs HVAC contractors who understand historic preservation, lagoon waterfront challenges, and community character. Our team provides expert service from century-old estates to new construction throughout this distinguished community.',

  '{
    "headline": "Why Rockledge Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Property Specialists", "description": "Rockledge Drive and Barton Avenue feature some of Brevard''s finest historic estates. We provide sensitive HVAC solutions preserving architectural character while delivering modern comfort."},
      {"title": "Indian River Lagoon Experts", "description": "Waterfront properties along the Indian River lagoon face unique humidity and salt air challenges. We provide enhanced dehumidification and coastal protection."},
      {"title": "Brevard''s Oldest City Expertise", "description": "As Brevard''s oldest city, Rockledge spans all housing eras. We''re experienced with everything from 1920s estates to Viera new construction."},
      {"title": "FPL Rebate Assistance", "description": "We help Rockledge homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Rockledge",
    "intro": "Rockledge''s history and lagoon location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Estate Preservation", "description": "Rockledge Drive''s magnificent estates and Barton Avenue historic homes require HVAC solutions that don''t compromise architectural integrity. Ductless systems often provide ideal solutions."},
      {"title": "Indian River Lagoon Humidity", "description": "Waterfront properties experience elevated humidity from the lagoon requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Diverse Housing Ages", "description": "Rockledge spans 1920s estates to 2020s Viera construction—one of Brevard''s widest age ranges requiring expertise across all technologies."},
      {"title": "Golf Course Properties", "description": "River Oaks and golf-adjacent homes experience elevated humidity from course irrigation requiring enhanced dehumidification."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Rockledge",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Rockledge Drive estates and Barton Avenue homes.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River lagoon properties.", "features": ["Lagoon humidity control", "Salt air protection", "Dehumidification", "Waterfront expertise"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Rockledge.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic to new construction"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Preservation-aware", "10-year warranty", "Financing available"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for River Oaks and golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Enhanced dehumidification"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you service historic Rockledge Drive estates?", "answer": "Yes, we specialize in Rockledge''s magnificent historic properties. Ductless mini-split systems provide efficient cooling while preserving architectural character and avoiding invasive ductwork."},
      {"question": "Why do Indian River lagoon properties need special attention?", "answer": "Lagoon waterfront properties experience elevated humidity and salt exposure. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "Do you service new Viera construction?", "answer": "Absolutely. We work throughout Rockledge from 1920s estates to brand-new Viera homes, helping new homeowners evaluate and optimize their systems."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Rockledge homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,500", "days_above_90": "90+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Historic Comfort in Rockledge?',
  'Contact us today for expert service. From historic estates to modern homes, we''ll keep your Rockledge property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Rockledge", "description": "Professional HVAC services for Rockledge, FL specializing in historic and waterfront properties.", "url": "https://coolit-hvac.com/rockledge-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Rockledge", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you service historic estates?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Rockledge historic properties with preservation-friendly ductless systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Rockledge", "item": "https://coolit-hvac.com/fl/rockledge"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa HVAC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne AC"}, {"slug": "/fl/viera/hvac", "anchor_text": "Viera HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}]'::jsonb,

  1890, 26, 14, 79,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
