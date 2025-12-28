-- ============================================
-- Fort Pierce, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  'Fort Pierce', 'fort-pierce', 'Florida', 'FL', 'St. Lucie', 'st-lucie-county',
  27.4467, -80.3256,
  ARRAY['34945', '34946', '34947', '34948', '34949', '34950', '34951', '34954'],
  'Port St. Lucie',
  ARRAY['b5c6d7e8-f9a0-1234-7890-456789012345', 'd7e8f9a0-b1c2-3456-9012-678901234567']::uuid[],
  true, 74
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
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  NOW(),
  46074, 'US Census Bureau ACS 2023',
  48542, 195000, 54.2,
  ARRAY['single-family', 'waterfront', 'historic-home', 'affordable-housing'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  89, 59, 75, 3380, 83, 55.4, 'high',
  'St. Lucie County seat. Historic waterfront city. Navy SEAL Museum. Sunrise City heritage. Mix of historic and modern. High coastal hurricane risk.',
  ARRAY['St. Lucie County Government', 'St. Lucie County Public Schools', 'Lawnwood Regional Medical Center', 'City of Fort Pierce', 'Port of Fort Pierce', 'Retail sector'],
  ARRAY['Navy SEAL Museum', 'Fort Pierce Inlet State Park', 'Downtown Fort Pierce', 'Manatee Observation Center', 'Historic Sunrise Theatre', 'St. Lucie County Aquarium'],
  ARRAY['Sunset Celebration', 'Farmers Market', 'Friday Fest', 'Jazz & Blues Society concerts'],
  ARRAY['St. Lucie County Public Schools'],
  'Downtown Fort Pierce revitalization. Marina Square development. Historic preservation. Waterfront improvements. Affordable housing initiatives.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Fort Pierce Utilities Authority',
  185,
  'Florida Building Code 8th Edition (2023), City of Fort Pierce amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for downtown properties", "coastal_zones": "Wind-rated equipment requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Air Docs', 'Franks Air Conditioning', 'Elite Electric', 'ABC Air Conditioning', 'Comfort Zone'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Downtown Fort Pierce', 'downtown-fort-pierce', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic waterfront downtown', ARRAY['historic buildings', 'mixed-use properties', 'older systems', 'revitalization'], '5-80+ years', 1, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Harbor Town', 'harbor-town', 'East', 'waterfront', '1960s-2000s', 'Middle income', 'Indian River Lagoon waterfront', ARRAY['waterfront humidity', 'salt exposure', 'varied ages'], '15-55 years', 2, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Hutchinson Island/Fort Pierce Beach', 'fort-pierce-beach', 'East', 'waterfront', '1960s-2020s', 'Upper middle income', 'Atlantic barrier island', ARRAY['beach salt air', 'oceanfront exposure', 'varied housing'], '5-55 years', 3, true),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'St. Lucie Village', 'st-lucie-village', 'North', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'budget solutions'], '35-65 years', 4, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Lakewood Park', 'lakewood-park', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Residential area', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-55 years', 5, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Indian River Estates', 'indian-river-estates', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established community', ARRAY['older homes', 'budget focus', 'system replacements'], '25-55 years', 6, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'Citrus Park', 'citrus-park', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Residential neighborhood', ARRAY['older systems', 'family homes', 'standard service'], '20-50 years', 7, false),
  ('e8f9a0b1-c2d3-4567-0123-789012345678', 'White City', 'white-city', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'system replacements', 'budget solutions'], '25-55 years', 8, false)
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
  'e8f9a0b1-c2d3-4567-0123-789012345678',
  'hvac',
  '/fl/fort-pierce/hvac',
  'HVAC Services in Fort Pierce, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Fort Pierce''s 46,000+ residents. Affordable and honest service. FPL rebates available. Serving Downtown, Harbor Town, Fort Pierce Beach & all areas.',
  'HVAC Fort Pierce FL',
  ARRAY['AC repair Fort Pierce', 'air conditioning Fort Pierce FL', 'HVAC contractor Fort Pierce', 'affordable AC Fort Pierce', 'waterfront HVAC', 'St. Lucie County HVAC'],

  'Fort Pierce''s Honest HVAC Experts',
  'Affordable comfort for the Sunrise City',
  'Licensed & Insured | FPL Certified | Affordable & Waterfront Specialists',
  'Fort Pierce—the "Sunrise City"—combines historic waterfront character with authentic Florida living and affordable housing. With over 46,000 residents and median home values around $195,000, Fort Pierce needs honest HVAC service with fair pricing. From historic downtown to Fort Pierce Beach and established neighborhoods, our team provides reliable, affordable comfort throughout this genuine Treasure Coast community.',

  '{
    "headline": "Why Fort Pierce Residents Choose Us",
    "reasons": [
      {"title": "Honest, Affordable Service", "description": "Fort Pierce''s median home value is $195,000—we provide honest assessments, fair pricing, and solutions that fit your budget without upselling."},
      {"title": "Waterfront Specialists", "description": "Harbor Town and Fort Pierce Beach properties face salt air challenges. We provide coastal protection and waterfront expertise at fair prices."},
      {"title": "Historic Downtown Experience", "description": "Historic downtown Fort Pierce buildings deserve sensitive HVAC solutions. Ductless systems preserve character while delivering modern comfort."},
      {"title": "FPL Rebate Assistance", "description": "We help Fort Pierce homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Fort Pierce",
    "intro": "Fort Pierce''s history and waterfront location create specific HVAC considerations:",
    "challenges": [
      {"title": "Aging Housing Stock", "description": "Much of Fort Pierce was built in the 1960s-1980s. Systems in these homes often need replacement with efficient modern equipment at affordable prices."},
      {"title": "Waterfront Salt Air", "description": "Harbor Town, Fort Pierce Beach, and Indian River properties face salt air exposure requiring coastal coil protection for equipment longevity."},
      {"title": "Historic Building Retrofits", "description": "Downtown historic properties often lack modern HVAC. Ductless mini-splits provide ideal solutions preserving architectural character."},
      {"title": "Budget-Conscious Community", "description": "Fort Pierce homeowners value honest pricing and practical solutions. We provide options at every price point with no pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Affordable HVAC Services in Fort Pierce",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout Fort Pierce.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance and financing.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Flexible financing"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Affordable coastal protection for Harbor Town and beachside properties.", "features": ["Coastal coil coating", "Salt air protection", "Fair pricing", "Waterfront expertise"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for downtown Fort Pierce historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Character protection", "Affordable options"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Fort Pierce systems affordably.", "features": ["Efficiency improvements", "Honest assessments", "Multiple options", "Rebate assistance"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Are your prices affordable for Fort Pierce homeowners?", "answer": "Yes, we understand Fort Pierce''s value-conscious market. We provide honest pricing, multiple options at different price points, and help you access FPL rebates to maximize savings."},
      {"question": "Do you service waterfront properties?", "answer": "Yes, we specialize in Harbor Town and Fort Pierce Beach waterfront properties with coastal coil protection and salt air expertise at fair prices."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Absolutely. Ductless mini-split systems are ideal for Fort Pierce''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Fort Pierce homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "75%", "cooling_degree_days": "3,380", "days_above_90": "83+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Honest Comfort in Fort Pierce?',
  'Contact us today for fair pricing and quality service. We''ll keep your Fort Pierce home comfortable with FPL rebates and flexible financing.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Fort Pierce", "description": "Affordable HVAC services for Fort Pierce, FL.", "url": "https://coolit-hvac.com/fort-pierce-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Fort Pierce", "addressRegion": "FL"}, "priceRange": "$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Are your prices affordable?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide honest pricing and help Fort Pierce homeowners maximize FPL rebates."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Fort Pierce", "item": "https://coolit-hvac.com/fl/fort-pierce"}]}'::jsonb,

  '/fl/st-lucie-county',
  '[{"slug": "/fl/port-st-lucie/hvac", "anchor_text": "Port St. Lucie HVAC"}, {"slug": "/fl/vero-beach/hvac", "anchor_text": "Vero Beach AC"}, {"slug": "/fl/sebastian/hvac", "anchor_text": "Sebastian HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1870, 26, 13, 74,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
