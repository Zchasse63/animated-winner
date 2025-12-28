-- ============================================
-- Englewood, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a',
  'Englewood', 'englewood', 'Florida', 'FL', 'Charlotte', 'charlotte-county',
  26.9620, -82.3526,
  ARRAY['34223', '34224'],
  'North Port-Sarasota-Bradenton',
  ARRAY['2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d']::uuid[],
  true, 85
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
  '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a',
  NOW(),
  16629, 'US Census Bureau ACS 2023',
  63847, 325000, 82.4,
  ARRAY['single-family', 'waterfront', 'seasonal-home', 'manufactured'],
  '{"pre-1980": 25, "1980s-1990s": 35, "2000s-2010s": 30, "2020s": 10}'::jsonb,
  89, 57, 72, 3300, 85, 54.6, 'high',
  'Quiet beach community spanning Charlotte and Sarasota counties. Lemon Bay and Gulf beaches. Strong seasonal population. Old Florida charm. High coastal hurricane risk.',
  ARRAY['Charlotte County Public Schools', 'Englewood Community Hospital', 'City of Englewood', 'Retail and tourism', 'Small businesses', 'Seasonal services'],
  ARRAY['Englewood Beach', 'Lemon Bay', 'Stump Pass Beach State Park', 'Boca Grande Causeway', 'Dearborn Street historic district', 'Manasota Key'],
  ARRAY['Englewood Farmers Market', 'Seafood & Music Festival', 'Beach events', 'Art shows'],
  ARRAY['Charlotte County Public Schools', 'Sarasota County Public Schools'],
  'Beach area development. Dearborn Street revitalization. Lemon Bay preservation. Post-hurricane infrastructure improvements. Seasonal home growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'Englewood Water District',
  195,
  'Florida Building Code 8th Edition (2023), Charlotte/Sarasota County coastal requirements',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment and elevation requirements", "flood_zones": "Equipment elevation standards", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Today', 'Gator Air Conditioning', 'Air Comfort', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Englewood Beach', 'englewood-beach', 'West', 'waterfront', '1960s-2000s', 'Upper middle income', 'Gulf beach barrier island', ARRAY['salt air corrosion', 'beach properties', 'seasonal usage', 'coastal exposure'], '15-50 years', 1, true),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Manasota Key', 'manasota-key', 'South', 'waterfront', '1970s-2010s', 'Upper income', 'Exclusive beach community', ARRAY['premium beach systems', 'salt air exposure', 'luxury demands', 'seasonal homes'], '10-45 years', 2, true),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Dearborn Street Area', 'dearborn-street', 'Central', 'mixed', '1950s-1990s', 'Middle income', 'Historic downtown corridor', ARRAY['older buildings', 'mixed housing', 'seasonal business', 'varied systems'], '20-60 years', 3, true),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Lemon Bay Area', 'lemon-bay', 'East', 'waterfront', '1970s-2000s', 'Upper middle income', 'Bay waterfront living', ARRAY['bay humidity', 'waterfront properties', 'salt exposure', 'fishing community'], '15-45 years', 4, false),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Englewood Isles', 'englewood-isles', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Canal community', ARRAY['canal humidity', 'older systems', 'waterfront adjacent'], '20-40 years', 5, false),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Rotonda', 'rotonda', 'North', 'single-family', '1970s-2000s', 'Middle income', 'Circular canal development', ARRAY['canal properties', 'older systems', 'seasonal residents'], '20-50 years', 6, false),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Grove City', 'grove-city', 'North', 'mixed', '1960s-1990s', 'Middle income', 'Older community area', ARRAY['older homes', 'budget solutions', 'system replacements'], '25-55 years', 7, false),
  ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Placida', 'placida', 'South', 'waterfront', '1970s-2010s', 'Upper middle income', 'Boca Grande access point', ARRAY['waterfront exposure', 'premium demands', 'seasonal usage'], '15-45 years', 8, false)
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
  '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a',
  'hvac',
  '/fl/englewood/hvac',
  'HVAC Services in Englewood, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Englewood''s 17,000+ residents. Beach and seasonal home specialists. FPL rebates available. Serving Englewood Beach, Manasota Key, Lemon Bay & all areas.',
  'HVAC Englewood FL',
  ARRAY['AC repair Englewood', 'air conditioning Englewood FL', 'HVAC contractor Englewood', 'beach HVAC Englewood', 'seasonal home AC', 'Lemon Bay HVAC'],

  'Englewood''s Beach & Bay HVAC Specialists',
  'Coastal comfort from Lemon Bay to the Gulf',
  'Licensed & Insured | FPL Certified | Beach & Seasonal Home Experts',
  'Englewood offers Old Florida charm along Lemon Bay and pristine Gulf beaches—from quiet Englewood Beach to exclusive Manasota Key. With over 16,000 year-round residents plus significant seasonal population, Englewood needs HVAC contractors who understand coastal challenges and seasonal home requirements. Our team provides specialized service for this relaxed beach community spanning Charlotte and Sarasota counties.',

  '{
    "headline": "Why Englewood Homeowners Choose Us",
    "reasons": [
      {"title": "Beach Property Specialists", "description": "Englewood Beach and Manasota Key face extreme salt air exposure. We provide coastal coil protection and equipment designed for Gulf proximity."},
      {"title": "Seasonal Home Expertise", "description": "Englewood''s significant seasonal population requires special attention. We provide monitoring, seasonal startup, and systems designed for intermittent use."},
      {"title": "Lemon Bay Knowledge", "description": "Bay waterfront properties face unique humidity from Lemon Bay and canals. We provide enhanced dehumidification and moisture control."},
      {"title": "FPL Rebate Assistance", "description": "We help Englewood homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Englewood",
    "intro": "Englewood''s coastal location and seasonal character create specific HVAC considerations:",
    "challenges": [
      {"title": "Extreme Salt Air Exposure", "description": "Beach and near-beach properties face the most aggressive salt air environment. Coastal-rated equipment and enhanced protection are essential for system longevity."},
      {"title": "Seasonal Usage Patterns", "description": "Many Englewood properties are seasonal homes or vacation rentals. Systems need special setup for extended periods of minimal use followed by full operation."},
      {"title": "Lemon Bay and Canal Humidity", "description": "Waterfront properties along Lemon Bay, Englewood Isles, and Rotonda canals experience elevated humidity requiring enhanced dehumidification."},
      {"title": "Hurricane Zone Requirements", "description": "High coastal hurricane risk means equipment must meet wind rating and elevation requirements for coastal zones."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Englewood",
    "services": [
      {"name": "Beach Property HVAC", "slug": "beach-hvac", "description": "Specialized solutions for Englewood Beach and Manasota Key properties.", "features": ["Coastal coil coating", "Maximum salt protection", "Beach-rated equipment", "Gulf exposure expertise"]},
      {"name": "Seasonal Home Service", "slug": "seasonal-home", "description": "Comprehensive service for Englewood''s seasonal residents.", "features": ["Seasonal startup/shutdown", "Remote monitoring", "Pre-arrival preparation", "Extended warranty options"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Englewood.", "features": ["Same-day service", "Coastal expertise", "90-day warranty", "Beach to bay coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Hurricane-rated installations with FPL rebate assistance.", "features": ["FPL rebates", "Wind-rated equipment", "10-year warranty", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Lemon Bay and canal properties.", "features": ["Bay humidity control", "Waterfront protection", "Dehumidification", "Salt air defense"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance programs.", "features": ["Seasonal service options", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you specialize in beachfront properties?", "answer": "Yes, we specialize in Englewood Beach and Manasota Key properties. We provide maximum coastal protection including specialized coil coatings and equipment designed for direct Gulf exposure."},
      {"question": "Can you service my seasonal home when I''m away?", "answer": "Absolutely. We offer seasonal monitoring, remote capabilities, and pre-arrival preparation ensuring your Englewood home is comfortable when you return."},
      {"question": "Why do Lemon Bay properties need special attention?", "answer": "Lemon Bay and canal waterfront properties experience elevated humidity and salt exposure. Enhanced dehumidification and corrosion protection are essential for comfort and equipment longevity."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Englewood homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "72%", "cooling_degree_days": "3,300", "days_above_90": "85+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Coastal Comfort in Englewood?',
  'Contact us today for a consultation. From Englewood Beach to Lemon Bay, we''ll protect your coastal investment with expert HVAC service and FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Englewood", "description": "Professional HVAC services for Englewood, FL specializing in beach and seasonal properties.", "url": "https://coolit-hvac.com/englewood-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Englewood", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you specialize in beachfront properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in beach properties with maximum coastal protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Englewood", "item": "https://coolit-hvac.com/fl/englewood"}]}'::jsonb,

  '/fl/charlotte-county',
  '[{"slug": "/fl/north-port/hvac", "anchor_text": "North Port HVAC"}, {"slug": "/fl/venice/hvac", "anchor_text": "Venice AC"}, {"slug": "/fl/port-charlotte/hvac", "anchor_text": "Port Charlotte HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach HVAC"}, {"slug": "/services/seasonal-home", "anchor_text": "Seasonal Home Service"}]'::jsonb,

  1860, 25, 14, 85,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
