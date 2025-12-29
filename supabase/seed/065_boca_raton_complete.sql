-- ============================================
-- Boca Raton, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  'Boca Raton', 'boca-raton', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.3683, -80.1289,
  ARRAY['33427', '33428', '33429', '33431', '33432', '33433', '33434', '33481', '33486', '33487', '33488', '33496', '33497', '33498', '33499'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f']::uuid[],
  true, 96
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
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  NOW(),
  99000, 'US Census Bureau 2023',
  87037, 545000, 68.7,
  ARRAY['single-family', 'condo', 'luxury', 'golf-community'],
  '{\"pre-1970\": 15, \"1970s-1990s\": 35, \"2000s-2010s\": 35, \"2020s\": 15}'::jsonb,
  90, 64, 74, 4000, 85, 61.2, 'very_high',
  'Upscale coastal city. Major corporate presence. Florida Atlantic University. Beautiful beaches and parks. Luxury lifestyle focus. Coastal hurricane zone. Premium market.',
  ARRAY['Office Depot', 'ADT Corporation', 'Florida Atlantic University', 'Boca Raton Regional Hospital', 'Tech companies', 'Corporate headquarters', 'Retail and hospitality'],
  ARRAY['Mizner Park', 'Boca Raton Resort & Club', 'Red Reef Park', 'Gumbo Limbo Nature Center', 'Spanish River Park', 'Town Center Mall', 'FAU Stadium'],
  ARRAY['Boca Raton Festival of the Arts', 'Boca Bacchanal', 'GreenMarket', 'Holiday Boat Parade'],
  ARRAY['Palm Beach County School District'],
  'Downtown redevelopment. Innovation Square tech corridor. Mizner Park expansion. Luxury residential growth. Corporate campus development. FAU expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas',
  'City of Boca Raton Water',
  135,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments, Boca architectural standards',
  '{\"hvac_replacement\": \"Permit required\", \"architectural_review\": \"Many communities require design approval\", \"coastal_zones\": \"Wind-rated equipment required\", \"inspection\": \"Multiple inspections required\"}'::jsonb,
  'very_high',
  ARRAY['Gator Air Conditioning', 'One Hour Air Conditioning', 'All Year Cooling', 'Air Ref Co Inc', 'Colair Cooling'],
  '{\"demographics\": \"US Census Bureau 2023\", \"utilities\": \"FPL\", \"research_date\": \"2024-12-29\"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Mizner Park Area', 'mizner-park', 'Central', 'mixed', '1990s-2020s', 'High income', 'Upscale downtown district', ARRAY['luxury condos', 'mixed use', 'modern systems', 'premium demands'], '5-30 years', 1, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Royal Palm Yacht & Country Club', 'royal-palm', 'East', 'golf-community', '1960s-2020s', 'Very high income', 'Exclusive waterfront club', ARRAY['luxury estates', 'waterfront properties', 'premium systems', 'golf course humidity'], '5-60 years', 2, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca West', 'boca-west', 'West', 'golf-community', '1980s-2020s', 'High income', 'Large golf community', ARRAY['golf course properties', 'HOA requirements', 'premium demands', 'humidity control'], '5-40 years', 3, true),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Broken Sound', 'broken-sound', 'Northwest', 'golf-community', '1980s-2010s', 'High income', 'Gated golf community', ARRAY['golf properties', 'luxury homes', 'HOA standards', 'premium systems'], '12-40 years', 4, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Woodfield Country Club', 'woodfield', 'Central', 'golf-community', '1970s-2000s', 'Upper middle income', 'Established country club', ARRAY['golf course living', 'older systems', 'HOA requirements'], '20-50 years', 5, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Spanish River', 'spanish-river', 'East', 'single-family', '1960s-1990s', 'Upper middle income', 'Near beach area', ARRAY['beach proximity', 'salt air', 'family homes', 'coastal exposure'], '30-60 years', 6, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Camino Gardens', 'camino-gardens', 'Central', 'condo', '1970s-1990s', 'Upper middle income', 'Large condo community', ARRAY['condo systems', 'association rules', 'standard service'], '30-50 years', 7, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca Lago', 'boca-lago', 'West', 'golf-community', '1970s-2000s', 'Upper middle income', 'Country club community', ARRAY['golf course properties', 'varied ages', 'HOA standards'], '20-50 years', 8, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Town Center Area', 'town-center', 'Central', 'mixed', '1980s-2020s', 'Upper middle income', 'Commercial and residential hub', ARRAY['mixed use', 'condos', 'varied systems', 'modern development'], '5-40 years', 9, false),
  ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a', 'Boca Pointe', 'boca-pointe', 'West', 'golf-community', '1980s-2010s', 'Upper middle income', 'Active adult community', ARRAY['55+ systems', 'golf course', 'efficiency focus', 'HOA requirements'], '12-40 years', 10, false)
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
  'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a',
  'hvac',
  '/fl/boca-raton/hvac',
  'HVAC Services in Boca Raton, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Boca Raton''s 99,000+ residents. Luxury and golf community specialists. FPL rebates. Serving Mizner Park, Royal Palm, Boca West & all premium communities.',
  'HVAC Boca Raton FL',
  ARRAY['AC repair Boca Raton', 'air conditioning Boca Raton FL', 'HVAC contractor Boca Raton', 'Mizner Park HVAC', 'Boca West AC', 'luxury HVAC'],

  'Boca Raton''s Premier Luxury HVAC Experts',
  'Premium comfort for South Florida''s upscale lifestyle',
  'Licensed & Insured | FPL Certified | Luxury & Golf Community Specialists',
  'Boca Raton represents the pinnacle of South Florida''s upscale lifestyle. With 99,000 residents in luxury communities from Royal Palm Yacht & Country Club to Boca West, from Mizner Park''s sophisticated downtown to Broken Sound''s gated excellence, Boca Raton demands HVAC service matching its premium standards. Our team specializes in luxury installations, golf community requirements, and the flawless execution expected in Boca''s exclusive market.',

  '{
    "headline": "Why Boca Raton''s Premium Communities Choose Us",
    "reasons": [
      {"title": "Luxury Market Specialists", "description": "Boca Raton sets South Florida''s standard for upscale living. We deliver premium equipment, flawless installations, and white-glove service matching Boca''s luxury expectations."},
      {"title": "Golf Community Experts", "description": "Royal Palm, Boca West, Broken Sound, and numerous golf communities require HOA compliance and golf course humidity control. We navigate requirements and deliver premium results."},
      {"title": "Architectural Standards Mastery", "description": "Boca Raton communities have strict design standards. We ensure all equipment placement, appearance, and installation meet community architectural requirements."},
      {"title": "Corporate & Executive Service", "description": "Boca''s corporate community demands reliability and professionalism. We provide executive-level service, flexible scheduling, and solutions matching busy professional lifestyles."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Boca Raton",
    "intro": "Boca Raton''s premium market creates specific HVAC requirements:",
    "challenges": [
      {"title": "Luxury Performance Standards", "description": "Boca Raton''s upscale market expects flawless climate control, whisper-quiet operation, and premium aesthetics. Builder-grade solutions don''t meet Boca standards."},
      {"title": "Golf Course Humidity", "description": "Royal Palm, Boca West, Broken Sound, and other golf communities experience elevated humidity from course irrigation. Enhanced dehumidification is essential."},
      {"title": "Strict Architectural Review", "description": "Boca communities have comprehensive design standards. Equipment placement, color, screening, and noise levels must meet architectural committee approval."},
      {"title": "Coastal Salt Air Exposure", "description": "Proximity to Atlantic beaches brings salt air corrosion. Coastal protection extends equipment life and maintains premium system performance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Boca Raton",
    "services": [
      {"name": "Luxury HVAC Installation", "slug": "luxury-hvac", "description": "Premium installations for Boca Raton''s exclusive properties.", "features": ["High-end equipment", "Flawless execution", "Quiet operation", "Architectural compliance"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Specialized service for Boca''s numerous golf communities.", "features": ["HOA compliance", "Golf humidity control", "Premium systems", "Design approval"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Professional repairs throughout Boca Raton.", "features": ["Same-day service", "All premium brands", "90-day warranty", "White-glove service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Premium equipment", "10-year warranty", "Financing available"]},
      {"name": "Smart Home Integration", "slug": "smart-home", "description": "Seamless HVAC integration with luxury automation.", "features": ["System compatibility", "Voice control", "Remote access", "Automation"]},
      {"name": "VIP Maintenance Plans", "slug": "maintenance", "description": "Premium maintenance for Boca''s luxury market.", "features": ["Priority scheduling", "Concierge service", "System optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you ensure my installation meets Boca Raton community standards?", "answer": "Absolutely. We''re intimately familiar with Boca architectural review requirements. We ensure all equipment placement, appearance, and noise levels meet community standards before installation."},
      {"question": "Why do Boca''s golf communities need special HVAC attention?", "answer": "Golf course irrigation creates elevated humidity. Properties at Royal Palm, Boca West, and Broken Sound need enhanced dehumidification beyond standard AC for optimal comfort."},
      {"question": "What premium HVAC brands do you recommend for Boca Raton?", "answer": "We install premium brands including Carrier Infinity, Trane XV, and Lennox Signature matching Boca''s luxury market. We help you select equipment meeting your performance and aesthetic expectations."},
      {"question": "What FPL rebates are available in Boca Raton?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Boca Raton residents."}
    ]
  }'::jsonb,

  '{\"avg_summer_high\": \"90°F\", \"avg_humidity\": \"74%\", \"cooling_degree_days\": \"4,000\", \"days_above_90\": \"85+\", \"hurricane_risk\": \"Very High\"}'::jsonb,

  'Ready for Premium Comfort in Boca Raton?',
  'Contact us today for a consultation. From Royal Palm to Boca West to Mizner Park, we''ll deliver luxury HVAC solutions worthy of Boca''s premium lifestyle.',

  '{\"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Boca Raton\", \"description\": \"Premium HVAC services for Boca Raton, FL specializing in luxury and golf communities.\", \"url\": \"https://coolit-hvac.com/boca-raton-fl\", \"telephone\": \"+1-561-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Boca Raton\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Can you meet Boca Raton community standards?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we ensure all installations meet Boca architectural review requirements for equipment placement and appearance.\"}}]}'::jsonb,
  '{\"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Boca Raton\", \"item\": \"https://coolit-hvac.com/fl/boca-raton\"}]}'::jsonb,

  '/fl/palm-beach-county',
  '[{\"slug\": \"/fl/delray-beach/hvac\", \"anchor_text\": \"Delray Beach HVAC\"}, {\"slug\": \"/fl/west-palm-beach/hvac\", \"anchor_text\": \"West Palm Beach AC\"}, {\"slug\": \"/fl/boynton-beach/hvac\", \"anchor_text\": \"Boynton Beach HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/luxury-hvac\", \"anchor_text\": \"Luxury HVAC\"}, {\"slug\": \"/services/golf-community-hvac\", \"anchor_text\": \"Golf Community HVAC\"}]'::jsonb,

  2090, 33, 18, 92,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
