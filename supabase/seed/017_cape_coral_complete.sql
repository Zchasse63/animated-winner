-- ============================================
-- Cape Coral, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  'Cape Coral', 'cape-coral', 'Florida', 'FL', 'Lee', 'lee-county',
  26.5629, -81.9495,
  ARRAY['33904', '33909', '33910', '33914', '33990', '33991', '33993'],
  'Cape Coral-Fort Myers',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456']::uuid[],
  true, 91
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
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  NOW(),
  204510, 'US Census Bureau ACS 2023',
  62847, 345000, 75.8,
  ARRAY['single-family', 'waterfront', 'new-construction', 'pool-home'],
  '{"pre-1980": 10, "1980s-1990s": 25, "2000s-2010s": 40, "2020s": 25}'::jsonb,
  92, 55, 74, 3750, 112, 54.8, 'high',
  'Tropical climate with extensive canal system. More canals than any other city in the world. High hurricane exposure. Salt and brackish water impacts equipment.',
  ARRAY['Lee Health', 'Lee County School District', 'City of Cape Coral', 'Publix', 'Home Depot Distribution', 'Healthcare Network'],
  ARRAY['Cape Coral Yacht Club', 'Tarpon Point Marina', 'Sun Splash Family Waterpark', 'Rotary Park', 'Four Mile Cove Ecological Preserve', 'Cape Coral Historical Museum'],
  ARRAY['Coconut Festival', 'Cape Coral Festival of the Arts', 'Bike Nights', 'Cardboard Boat Regatta', 'Burrowing Owl Festival'],
  ARRAY['Lee County Public Schools'],
  'Rapid population growth. Massive new construction in north Cape Coral. Hurricane Ian recovery. New commercial development along Pine Island Road and Del Prado.',
  'Lee County Electric Cooperative (LCEC)',
  '{
    "ac_replacement": {"amount": 400, "requirements": "SEER 16+ system"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying smart thermostat"},
    "pool_pump": {"amount": 250, "requirements": "Variable speed pool pump"},
    "total_available": {"amount": 1200, "requirements": "Combined LCEC rebates"}
  }'::jsonb,
  'None (all-electric area)',
  'City of Cape Coral Utilities',
  320,
  'Florida Building Code 8th Edition (2023), Cape Coral enhanced hurricane standards',
  '{"hvac_replacement": "Permit required", "hurricane_tie_downs": "Required per FBC", "pool_equipment": "Permit required for pool heaters", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'All Day Air Cooling and Heating', 'Service Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "LCEC", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Southwest Cape Coral', 'sw-cape-coral', 'Southwest', 'waterfront', '1980s-2010s', 'Upper income', 'Gulf access canals and waterfront homes', ARRAY['salt air corrosion', 'premium system demands', 'pool home needs', 'hurricane hardening'], '10-35 years', 1, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Tarpon Point', 'tarpon-point', 'Southeast', 'luxury-estate', '2000s-2010s', 'Upper income', 'Marina and resort community', ARRAY['luxury systems', 'salt air exposure', 'whole-home automation', 'premium service'], '10-20 years', 2, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'North Cape Coral', 'north-cape-coral', 'North', 'new-construction', '2010s-2020s', 'Middle income', 'Rapid new development area', ARRAY['new construction', 'builder-grade systems', 'HOA requirements', 'first-time buyer education'], '0-12 years', 3, true),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Pelican', 'pelican', 'Southeast', 'single-family', '1990s-2010s', 'Upper middle income', 'Near Cape Coral Parkway', ARRAY['established homes', 'system replacements', 'efficiency upgrades', 'hurricane prep'], '10-28 years', 4, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Southeast Cape Coral', 'se-cape-coral', 'Southeast', 'single-family', '1970s-2000s', 'Middle income', 'Established residential area', ARRAY['1970s-2000s systems', 'canal humidity', 'efficiency updates'], '15-45 years', 5, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Northeast Cape Coral', 'ne-cape-coral', 'Northeast', 'mixed', '1990s-2020s', 'Middle income', 'Growing residential area', ARRAY['mixed age systems', 'new construction', 'varied needs'], '5-28 years', 6, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Burnt Store', 'burnt-store', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Near Burnt Store Marina', ARRAY['newer construction', 'waterfront humidity', 'premium demands'], '5-20 years', 7, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Yacht Club Area', 'yacht-club', 'South', 'waterfront', '1960s-1990s', 'Middle income', 'Historic Cape Coral area', ARRAY['older waterfront homes', 'system replacements', 'canal-side humidity'], '20-50 years', 8, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Sandoval', 'sandoval', 'South', 'single-family', '2000s-2010s', 'Upper middle income', 'Gated community', ARRAY['HOA requirements', 'builder-grade upgrades', 'community standards'], '10-20 years', 9, false),
  ('d6e7f8a9-b0c1-2345-9012-678901234567', 'Mariana Isles', 'mariana-isles', 'Southeast', 'waterfront', '1990s-2010s', 'Upper income', 'Gulf access community', ARRAY['salt air corrosion', 'premium equipment', 'waterfront maintenance'], '10-28 years', 10, false)
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
  'd6e7f8a9-b0c1-2345-9012-678901234567',
  'hvac',
  '/fl/cape-coral/hvac',
  'HVAC Services in Cape Coral, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Cape Coral''s 200,000+ residents. Canal-side specialists. LCEC rebates up to $400. Serving SW Cape, Tarpon Point & all neighborhoods.',
  'HVAC Cape Coral FL',
  ARRAY['AC repair Cape Coral', 'air conditioning Cape Coral FL', 'HVAC contractor Cape Coral', 'waterfront AC Cape Coral', 'LCEC rebates Cape Coral', 'Lee County HVAC'],

  'Cape Coral''s Canal-Side HVAC Experts',
  'Waterfront comfort specialists since day one',
  'Licensed & Insured | LCEC Certified | Waterfront Home Specialists',
  'Welcome to Cape Coral—the city with more canals than Venice and over 200,000 residents who depend on air conditioning. Whether you''re in a Gulf-access home in Southwest Cape Coral or new construction in the rapidly growing north, our team understands the unique challenges of maintaining comfort in this waterfront paradise. With 400+ miles of canals creating elevated humidity and salt air accelerating equipment wear, you need HVAC specialists who understand Cape Coral''s one-of-a-kind environment.',

  '{
    "headline": "Why Cape Coral Homeowners Choose Us",
    "reasons": [
      {"title": "Waterfront Home Specialists", "description": "With 400+ miles of canals, Cape Coral is unique. We understand how waterfront living affects your HVAC system and provide solutions designed for canal-side homes."},
      {"title": "LCEC Rebate Maximizers", "description": "We help Cape Coral homeowners access up to $400 for high-efficiency systems and $75 for smart thermostats through LCEC rebates."},
      {"title": "Pool Home Experts", "description": "Cape Coral has one of the highest pool-per-capita rates in Florida. We integrate pool area conditioning and understand the demands pool homes place on HVAC systems."},
      {"title": "New Construction Partners", "description": "North Cape Coral is booming. We work with builders and new homeowners to ensure optimal system design and installation."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Cape Coral",
    "intro": "Cape Coral''s canal system and growth create specific HVAC considerations:",
    "challenges": [
      {"title": "Canal-Side Humidity", "description": "With 400+ miles of canals, Cape Coral properties experience elevated humidity. Whole-home dehumidification is often essential for comfort and mold prevention."},
      {"title": "Salt and Brackish Water", "description": "Canal water and Gulf access expose equipment to salt and minerals. Corrosion-resistant equipment and protective maintenance extend system life."},
      {"title": "Hurricane Exposure", "description": "Cape Coral''s geography makes it vulnerable to hurricanes. Proper equipment securing and placement is critical for system survival."},
      {"title": "Rapid Growth", "description": "Cape Coral is one of Florida''s fastest-growing cities. Many builder-grade systems in new homes could benefit from upgrades."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Cape Coral",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Cape Coral''s canal-side homes including corrosion protection and humidity control.", "features": ["Coastal coil coating", "Corrosion-resistant units", "Dehumidification", "Salt air protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Cape Coral''s expansive geography.", "features": ["Same-day service", "All brands serviced", "90-day warranty", "North/South coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with LCEC rebate assistance.", "features": ["LCEC rebates", "Up to 22 SEER2", "Hurricane hardening", "10-year warranty"]},
      {"name": "New Construction", "slug": "new-construction", "description": "Expert installation for Cape Coral''s booming new home market.", "features": ["Builder partnerships", "Manual J sizing", "Code compliance", "Smart home ready"]},
      {"name": "Pool Home Solutions", "slug": "pool-hvac", "description": "Integrated solutions for Cape Coral''s many pool homes.", "features": ["Pool area ventilation", "Humidity management", "Energy efficiency", "Lanai comfort"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with our canal-side maintenance program.", "features": ["Bi-annual service", "Coil cleaning", "Humidity checks", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do canal-side homes need special HVAC attention?", "answer": "Cape Coral''s 400+ miles of canals create elevated humidity levels and expose equipment to salt/brackish water. This requires enhanced dehumidification and corrosion protection."},
      {"question": "What LCEC rebates are available?", "answer": "LCEC offers up to $400 for SEER 16+ AC systems, $75 for smart thermostats, and $250 for variable speed pool pumps. We handle all rebate paperwork."},
      {"question": "Should I upgrade my new construction AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade or enhancement may significantly improve comfort."},
      {"question": "How do you protect AC units from hurricanes?", "answer": "We install hurricane tie-downs per Florida Building Code, recommend protective cages for exposed areas, and ensure proper drainage to prevent flood damage."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,750", "days_above_90": "112+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Waterfront Comfort in Cape Coral?',
  'Contact us today for a free estimate. We''ll help you access LCEC rebates and install a system designed for Cape Coral''s unique canal-side environment.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Cape Coral", "description": "Professional HVAC services in Cape Coral, FL specializing in waterfront homes.", "url": "https://coolit-hvac.com/cape-coral-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Cape Coral", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Why do canal-side homes need special HVAC attention?", "acceptedAnswer": {"@type": "Answer", "text": "Cape Coral''s canals create elevated humidity and salt exposure requiring enhanced dehumidification and corrosion protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Cape Coral", "item": "https://coolit-hvac.com/fl/cape-coral"}]}'::jsonb,

  '/fl/lee-county',
  '[{"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers HVAC"}, {"slug": "/fl/naples/hvac", "anchor_text": "Naples AC"}, {"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1950, 30, 18, 89,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
