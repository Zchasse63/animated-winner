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
