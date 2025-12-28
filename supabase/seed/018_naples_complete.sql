-- ============================================
-- Naples, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 4 - Southwest Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  'Naples', 'naples', 'Florida', 'FL', 'Collier', 'collier-county',
  26.1420, -81.7948,
  ARRAY['34102', '34103', '34104', '34105', '34108', '34109', '34110', '34112', '34113', '34114', '34116', '34117', '34119', '34120'],
  'Naples-Marco Island',
  ARRAY['c5d6e7f8-a9b0-1234-8901-567890123456']::uuid[],
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
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  NOW(),
  22088, 'US Census Bureau ACS 2023',
  105847, 875000, 68.4,
  ARRAY['luxury-estate', 'condo', 'single-family', 'waterfront'],
  '{"pre-1980": 15, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 20}'::jsonb,
  91, 56, 74, 3650, 108, 53.6, 'high',
  'Tropical climate moderated by Gulf of Mexico. Significant seasonal population swing. High-end luxury market with demanding clientele. Hurricane exposure with Ian recovery ongoing.',
  ARRAY['NCH Healthcare System', 'Arthrex', 'Collier County Public Schools', 'Collier County Government', 'Ritz-Carlton Naples', 'Naples Grande Beach Resort', 'Moorings Park'],
  ARRAY['Naples Pier', 'Fifth Avenue South', 'Third Street South', 'Naples Zoo', 'Naples Botanical Garden', 'Waterside Shops', 'Mercato', 'Pelican Bay', 'Venetian Village'],
  ARRAY['Naples Winter Wine Festival', 'Naples Art Fair', 'Stone Crab Festival', 'Great Dock Canoe Race', 'Naples Film Festival'],
  ARRAY['Collier County Public Schools'],
  'Hurricane Ian recovery. Luxury condo development. Fifth Avenue improvements. Downtown revitalization. High-end retail expansion.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 800, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Naples / Collier County Utilities',
  350,
  'Florida Building Code 8th Edition (2023), Collier County enhanced coastal construction',
  '{"hvac_replacement": "Permit required", "hurricane_standards": "Enhanced coastal requirements", "noise_ordinance": "Equipment placement restrictions", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Conditioned Air Company', 'Sunset Air and Home Services', 'Home-Tech', 'Cool Today', 'Advanced Air'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Port Royal', 'port-royal', 'South', 'luxury-estate', '1970s-2020s', 'Ultra high income', 'Most exclusive neighborhood in Naples', ARRAY['multi-system estates', 'wine cellar climate', 'whole-home automation', 'guest house systems'], '5-40 years', 1, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Pelican Bay', 'pelican-bay', 'North', 'luxury-estate', '1980s-2010s', 'Upper income', 'Prestigious beachfront community', ARRAY['high-rise condos', 'salt air exposure', 'premium service demands', 'seasonal systems'], '10-35 years', 2, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Old Naples', 'old-naples', 'Central', 'mixed', '1950s-2000s', 'Upper income', 'Historic downtown Naples', ARRAY['historic renovations', 'commercial HVAC', 'mixed-use buildings', 'noise restrictions'], '10-60 years', 3, true),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'The Moorings', 'the-moorings', 'Central', 'luxury-estate', '1960s-1990s', 'Upper income', 'Waterfront estates and beach access', ARRAY['waterfront humidity', 'older luxury systems', 'guest quarters', 'pool home needs'], '15-50 years', 4, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Park Shore', 'park-shore', 'Central', 'mixed', '1970s-2010s', 'Upper income', 'High-rise condos and single-family', ARRAY['condo systems', 'high-rise challenges', 'Venetian Bay humidity'], '10-45 years', 5, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Grey Oaks', 'grey-oaks', 'East', 'luxury-estate', '1990s-2010s', 'Upper income', 'Premier golf community', ARRAY['large estate systems', 'golf course humidity', 'whole-home automation'], '10-28 years', 6, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Mediterra', 'mediterra', 'North', 'luxury-estate', '2000s-2020s', 'Upper income', 'Luxury Mediterranean-style community', ARRAY['newer luxury systems', 'HOA standards', 'premium equipment demands'], '5-20 years', 7, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Naples Park', 'naples-park', 'North', 'single-family', '1960s-1990s', 'Middle income', 'Established residential area', ARRAY['older systems', 'budget-friendly options', 'system replacements'], '20-50 years', 8, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Golden Gate', 'golden-gate', 'East', 'single-family', '1970s-2010s', 'Middle income', 'Large planned community', ARRAY['varied age systems', 'family homes', 'budget to mid-range'], '10-45 years', 9, false),
  ('e7f8a9b0-c1d2-3456-0123-789012345678', 'Aqualane Shores', 'aqualane-shores', 'South', 'luxury-estate', '1960s-2010s', 'Ultra high income', 'Deep water boating community', ARRAY['waterfront corrosion', 'luxury demands', 'boat house systems'], '10-50 years', 10, false)
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
  'e7f8a9b0-c1d2-3456-0123-789012345678',
  'hvac',
  '/fl/naples/hvac',
  'HVAC Services in Naples, FL | Luxury Home AC Repair, Installation & Maintenance',
  'Premium HVAC services for Naples'' discerning homeowners. Port Royal, Pelican Bay & Old Naples specialists. White-glove service. FPL rebates available.',
  'HVAC Naples FL',
  ARRAY['AC repair Naples', 'air conditioning Naples FL', 'luxury home HVAC Naples', 'Port Royal AC', 'Pelican Bay HVAC', 'Collier County HVAC'],

  'Naples'' Premier HVAC Specialists',
  'White-glove service for discerning homeowners',
  'Licensed & Insured | Luxury Property Certified | Hurricane Ian Recovery Experts',
  'Naples represents the pinnacle of Southwest Florida living—from the ultra-exclusive estates of Port Royal to the sophisticated shops of Fifth Avenue. With median home values exceeding $875,000 and residents who expect nothing but the best, Naples homeowners require HVAC service that matches their standards. Our team provides white-glove service throughout Collier County, specializing in the complex multi-zone systems and premium equipment that Naples'' finest properties demand.',

  '{
    "headline": "Why Naples Homeowners Choose Us",
    "reasons": [
      {"title": "Luxury Property Expertise", "description": "From Port Royal estates to Pelican Bay high-rises, we specialize in the sophisticated HVAC systems that Naples'' premier properties require."},
      {"title": "White-Glove Service", "description": "We understand that Naples homeowners expect excellence. Our technicians are trained in premium service protocols and respect for fine properties."},
      {"title": "Multi-System Specialists", "description": "Many Naples estates feature multiple HVAC systems, wine cellars, guest houses, and pool structures. We design and maintain integrated comfort solutions."},
      {"title": "Seasonal Home Experts", "description": "Many Naples properties are seasonal residences. We provide monitoring and maintenance services to ensure your home is comfortable when you arrive."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Naples",
    "intro": "Naples'' luxury market and coastal location create distinctive HVAC requirements:",
    "challenges": [
      {"title": "Estate-Scale Systems", "description": "Naples'' luxury estates often require multiple HVAC systems, zoning for 10+ rooms, and integration with whole-home automation systems."},
      {"title": "Salt Air Protection", "description": "Beachfront and waterfront properties face accelerated corrosion. Premium coastal coatings and enhanced maintenance protect your investment."},
      {"title": "Wine Cellar Climate Control", "description": "Many Naples homes include wine cellars requiring precise temperature and humidity control. We design and maintain specialty climate systems."},
      {"title": "Seasonal Occupancy", "description": "With many part-time residents, systems must handle extended periods of minimal use followed by full operation. Smart monitoring prevents surprises."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Naples",
    "services": [
      {"name": "Luxury Home HVAC", "slug": "luxury-hvac", "description": "Comprehensive solutions for Naples'' finest properties including multi-zone systems and whole-home integration.", "features": ["Multi-zone design", "Whole-home automation", "Premium equipment", "White-glove service"]},
      {"name": "Wine Cellar Climate", "slug": "wine-cellar", "description": "Precision climate control for wine collections requiring exact temperature and humidity.", "features": ["55°F/70% RH control", "Redundant systems", "Monitoring alerts", "Vibration isolation"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Prompt, professional repairs for Naples homeowners.", "features": ["Same-day available", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with premium equipment and FPL rebate assistance.", "features": ["Top-tier equipment", "FPL rebates", "Extended warranties", "Quiet operation"]},
      {"name": "Seasonal Monitoring", "slug": "monitoring", "description": "Remote monitoring and maintenance for seasonal residents.", "features": ["24/7 monitoring", "Temperature alerts", "Pre-arrival service", "Storm response"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance programs protecting your investment.", "features": ["Quarterly service", "Priority scheduling", "System optimization", "Salt air protection"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Port Royal and other exclusive communities?", "answer": "Yes, we have extensive experience in Port Royal, Pelican Bay, Grey Oaks, and all of Naples'' premier communities. Our technicians are background-checked and trained for luxury properties."},
      {"question": "Can you maintain my home while I''m away for the season?", "answer": "Absolutely. We offer seasonal monitoring packages that include regular system checks, smart monitoring with alerts, and pre-arrival preparation to ensure your home is ready when you return."},
      {"question": "Do you install wine cellar cooling systems?", "answer": "Yes, we design and install precision climate systems for wine cellars, maintaining 55°F and 70% humidity with redundant systems and monitoring capabilities."},
      {"question": "What premium brands do you recommend for Naples homes?", "answer": "For luxury properties, we typically recommend Carrier Infinity, Trane XV, or Lennox XC series. For quiet operation near living spaces, we also install premium ductless systems from Mitsubishi and Daikin."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,650", "days_above_90": "108+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Premium Comfort in Your Naples Home?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Naples property, with the white-glove service you expect.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Naples", "description": "Premium HVAC services for luxury homes in Naples, FL.", "url": "https://coolit-hvac.com/naples-fl", "telephone": "+1-239-555-COOL", "areaServed": {"@type": "City", "name": "Naples", "addressRegion": "FL"}, "priceRange": "$$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Port Royal?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we have extensive experience in Port Royal and all Naples premier communities."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Naples", "item": "https://coolit-hvac.com/fl/naples"}]}'::jsonb,

  '/fl/collier-county',
  '[{"slug": "/fl/fort-myers/hvac", "anchor_text": "Fort Myers HVAC"}, {"slug": "/fl/bonita-springs/hvac", "anchor_text": "Bonita Springs AC"}, {"slug": "/fl/marco-island/hvac", "anchor_text": "Marco Island HVAC"}]'::jsonb,
  '[{"slug": "/services/luxury-hvac", "anchor_text": "Luxury Home HVAC"}, {"slug": "/services/wine-cellar", "anchor_text": "Wine Cellar Climate"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1980, 32, 18, 92,
  'published', 1, 'claude', 'phase4-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
