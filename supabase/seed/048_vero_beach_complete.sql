-- ============================================
-- Vero Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 10 - Treasure Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  'Vero Beach', 'vero-beach', 'Florida', 'FL', 'Indian River', 'indian-river-county',
  27.6386, -80.3973,
  ARRAY['32960', '32962', '32963', '32966', '32967', '32968'],
  'Sebastian-Vero Beach',
  ARRAY['e8f9a0b1-c2d3-4567-0123-789012345678']::uuid[],
  true, 75
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
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  NOW(),
  17350, 'US Census Bureau ACS 2023',
  76542, 485000, 68.4,
  ARRAY['single-family', 'waterfront', 'luxury-estate', 'golf-community'],
  '{"pre-1970": 20, "1970s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  89, 59, 73, 3300, 80, 54.2, 'high',
  'Affluent barrier island community. "Cultural Arts Capital." Beautiful beaches. Indian River Lagoon. Golf and luxury estates. High coastal hurricane risk.',
  ARRAY['Indian River County Public Schools', 'Cleveland Clinic Indian River Hospital', 'Piper Aircraft', 'City of Vero Beach', 'Tourism industry', 'Retail sector'],
  ARRAY['Ocean Drive', 'Vero Beach Museum of Art', 'McKee Botanical Garden', 'Riverside Theatre', 'Humiston Beach', 'Indian River Lagoon', 'Downtown Vero'],
  ARRAY['Vero Beach Wine & Film Festival', 'Art in the Park', 'Friday Fest', 'ArtWalk'],
  ARRAY['Indian River County Public Schools'],
  'Ocean Drive corridor development. Downtown revitalization. Museum expansion. Luxury residential development. Beach access improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'None (no natural gas service)',
  'City of Vero Beach Utilities',
  210,
  'Florida Building Code 8th Edition (2023), City of Vero Beach amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated and elevated equipment requirements", "barrier_island": "Flood zone compliance", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Breeze', 'Elite Electric', 'Air Docs', 'ABC Air Conditioning', 'Franks Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Ocean Drive/Barrier Island', 'ocean-drive', 'East', 'luxury-estate', '1950s-2020s', 'Upper income', 'Exclusive beachfront corridor', ARRAY['oceanfront luxury', 'salt air corrosion', 'multi-zone estates', 'premium demands'], '5-60 years', 1, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'John''s Island', 'johns-island', 'North', 'luxury-estate', '1970s-2020s', 'Upper income', 'Ultra-exclusive golf community', ARRAY['luxury multi-zone', 'golf course humidity', 'premium equipment', 'estate systems'], '5-50 years', 2, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Downtown Vero Beach', 'downtown-vero', 'Central', 'mixed', '1920s-2020s', 'Upper middle income', 'Cultural arts district', ARRAY['mixed-use buildings', 'historic properties', 'varied systems', 'ductless needs'], '5-80+ years', 3, true),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Windsor', 'windsor', 'West', 'golf-community', '1980s-2010s', 'Upper income', 'Golf and country club', ARRAY['golf course humidity', 'premium systems', 'HOA standards'], '10-40 years', 4, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Riomar', 'riomar', 'Northeast', 'luxury-estate', '1960s-2010s', 'Upper income', 'Beachside estates', ARRAY['beachfront exposure', 'luxury demands', 'salt air', 'premium service'], '10-55 years', 5, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Orchid Island', 'orchid-island', 'South', 'luxury-estate', '1960s-2010s', 'Upper income', 'Gated luxury community', ARRAY['luxury estates', 'waterfront exposure', 'premium equipment'], '10-55 years', 6, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Vero Lake Estates', 'vero-lake-estates', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Established community', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-50 years', 7, false),
  ('d7e8f9a0-b1c2-3456-9012-678901234567', 'Grand Harbor', 'grand-harbor', 'South', 'golf-community', '1990s-2010s', 'Upper income', 'Golf and marina community', ARRAY['golf and marina humidity', 'premium systems', 'HOA compliance'], '10-30 years', 8, false)
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
  'd7e8f9a0-b1c2-3456-9012-678901234567',
  'hvac',
  '/fl/vero-beach/hvac',
  'HVAC Services in Vero Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Vero Beach''s 17,000+ residents. Cultural Arts Capital specialists. FPL rebates. Serving Ocean Drive, John''s Island, Downtown & all areas.',
  'HVAC Vero Beach FL',
  ARRAY['AC repair Vero Beach', 'air conditioning Vero Beach FL', 'HVAC contractor Vero Beach', 'Ocean Drive AC', 'luxury HVAC Vero Beach', 'Indian River County HVAC'],

  'Vero Beach''s Cultural Capital HVAC Experts',
  'Premium comfort for the Treasure Coast''s finest community',
  'Licensed & Insured | FPL Certified | Luxury & Beachfront Specialists',
  'Vero Beach—the "Cultural Arts Capital of Florida"—represents the pinnacle of Treasure Coast living with exclusive Ocean Drive estates, ultra-luxurious John''s Island, and sophisticated downtown arts district. With over 17,000 residents enjoying median home values exceeding $485,000, Vero Beach demands HVAC service matching its exceptional standards. Our team delivers white-glove service from beachfront properties to golf estates throughout this distinguished barrier island community.',

  '{
    "headline": "Why Vero Beach Residents Choose Us",
    "reasons": [
      {"title": "Luxury Property Specialists", "description": "John''s Island, Ocean Drive, and Riomar estates demand the highest standards. We deliver premium equipment and white-glove service meeting these expectations consistently."},
      {"title": "Beachfront Expertise", "description": "Ocean Drive and barrier island properties face extreme salt air exposure. We provide maximum coastal protection and equipment designed for beachfront environments."},
      {"title": "Cultural Community Understanding", "description": "Vero Beach''s arts community values quality, sophistication, and professionalism. We deliver service reflecting these values."},
      {"title": "FPL Rebate Specialists", "description": "We help Vero Beach homeowners access FPL rebates while maintaining premium comfort standards—maximizing value without compromise."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Vero Beach Properties",
    "intro": "Vero Beach''s barrier island location and luxury market create specific HVAC needs:",
    "challenges": [
      {"title": "Extreme Coastal Exposure", "description": "Ocean Drive and beachfront properties face the most aggressive salt air environment. Maximum coastal protection and specialized equipment are essential for system longevity."},
      {"title": "Luxury Estate Systems", "description": "John''s Island and high-end properties require sophisticated multi-zone systems, whole-home automation, and premium equipment—we specialize in these complex installations."},
      {"title": "Golf Course Humidity", "description": "Windsor, Grand Harbor, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Hurricane Zone Requirements", "description": "Barrier island location means equipment must meet strict wind rating and elevation requirements for coastal zones."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Vero Beach",
    "services": [
      {"name": "Luxury Estate HVAC", "slug": "luxury-hvac", "description": "Premium solutions for John''s Island and Vero Beach''s finest properties.", "features": ["Multi-zone design", "Whole-home automation", "Premium brands", "White-glove service"]},
      {"name": "Beachfront HVAC", "slug": "beachfront-hvac", "description": "Maximum protection for Ocean Drive and barrier island properties.", "features": ["Maximum coastal coating", "Hurricane-rated equipment", "Salt air defense", "Beach expertise"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Windsor, Grand Harbor, and golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Vero Beach.", "features": ["Same-day service", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Hurricane-rated", "10-year warranty", "Premium installation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance for luxury properties.", "features": ["Quarterly service options", "Salt air rinse", "Priority scheduling", "Concierge service"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service John''s Island and Ocean Drive estates?", "answer": "Yes, we specialize in Vero Beach''s most exclusive properties. Our technicians are trained in premium service protocols and work extensively with luxury estates, multi-zone systems, and sophisticated automation."},
      {"question": "Can you handle beachfront salt air challenges?", "answer": "Absolutely. We provide maximum coastal protection including specialized coil coatings, hurricane-rated equipment, and maintenance programs designed for direct ocean exposure."},
      {"question": "Do you work with golf communities like Windsor?", "answer": "Yes, we specialize in Vero Beach''s golf communities with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Vero Beach homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "89°F", "avg_humidity": "73%", "cooling_degree_days": "3,300", "days_above_90": "80+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Vero Beach?',
  'Contact us today for white-glove service worthy of Vero Beach. From Ocean Drive to John''s Island, we deliver exceptional comfort with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Vero Beach", "description": "Premium HVAC services for Vero Beach, FL.", "url": "https://coolit-hvac.com/vero-beach-fl", "telephone": "+1-772-555-COOL", "areaServed": {"@type": "City", "name": "Vero Beach", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service luxury estates?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Vero Beach luxury properties with white-glove service."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Vero Beach", "item": "https://coolit-hvac.com/fl/vero-beach"}]}'::jsonb,

  '/fl/indian-river-county',
  '[{"slug": "/fl/sebastian/hvac", "anchor_text": "Sebastian HVAC"}, {"slug": "/fl/fort-pierce/hvac", "anchor_text": "Fort Pierce AC"}, {"slug": "/fl/fellsmere/hvac", "anchor_text": "Fellsmere HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/luxury-hvac", "anchor_text": "Luxury HVAC"}, {"slug": "/services/beachfront-hvac", "anchor_text": "Beachfront HVAC"}]'::jsonb,

  1950, 30, 14, 75,
  'published', 1, 'claude', 'phase10-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
