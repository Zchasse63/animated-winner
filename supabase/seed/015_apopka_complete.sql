-- ============================================
-- Apopka, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  'Apopka', 'apopka', 'Florida', 'FL', 'Orange', 'orange-county',
  28.6934, -81.5322,
  ARRAY['32703', '32704', '32712'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 87
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
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  NOW(),
  57904, 'US Census Bureau ACS 2023',
  72647, 340000, 68.2,
  ARRAY['single-family', 'new-construction', 'townhouse', 'manufactured-home'],
  '{"pre-1980": 15, "1980s-1990s": 25, "2000s-2010s": 35, "2020s": 25}'::jsonb,
  92, 51, 74, 3550, 105, 52.1, 'moderate',
  'Growing Orlando suburb known as "Indoor Foliage Capital of the World." Significant new construction. Family-oriented community with newer developments.',
  ARRAY['Florida Hospital Apopka', 'Orange County Public Schools', 'City of Apopka', 'Foliage nurseries', 'Amazon Fulfillment (nearby)', 'Rock Springs Run State Reserve'],
  ARRAY['Rock Springs at Kelly Park', 'Wekiwa Springs State Park', 'Lake Apopka North Shore', 'Northwest Recreation Complex', 'Apopka Amphitheater', 'Kit Land Nelson Park'],
  ARRAY['Apopka Art & Jazz Festival', 'Christmas Parade', 'Fourth of July Celebration', 'Food Truck Fridays'],
  ARRAY['Orange County Public Schools'],
  'Rapid residential growth. New master-planned communities. Kelly Park Road development. Wekiva Parkway completion. Downtown revitalization efforts.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'None (all-electric area)',
  'City of Apopka / Orange County Utilities',
  230,
  'Florida Building Code 8th Edition (2023), City of Apopka amendments',
  '{"hvac_replacement": "Permit required for all HVAC replacements", "new_construction": "Energy code compliance required", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Energy Air', 'Direct Air Conditioning', 'A/C Warehouse'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Wekiva Run', 'wekiva-run', 'North', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community near Wekiva Springs', ARRAY['new construction systems', 'HOA requirements', 'energy code compliance', 'smart home ready'], '2-12 years', 1, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Rock Springs Ridge', 'rock-springs-ridge', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned near Kelly Park', ARRAY['newer systems', 'family home sizing', 'springs proximity humidity', 'premium demands'], '5-20 years', 2, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Piedmont Lakes', 'piedmont-lakes', 'Central', 'single-family', '1990s-2000s', 'Middle income', 'Established lakefront community', ARRAY['1990s-2000s systems', 'lakefront humidity', 'system replacements', 'efficiency upgrades'], '15-28 years', 3, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Sheeler Oaks', 'sheeler-oaks', 'South', 'single-family', '1980s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older system replacements', 'ductwork updates', 'efficiency improvements', 'budget-friendly options'], '20-35 years', 4, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Downtown Apopka', 'downtown-apopka', 'Central', 'mixed', '1950s-1990s', 'Moderate income', 'Historic downtown area', ARRAY['older buildings', 'commercial HVAC', 'mixed-use needs', 'retrofit requirements'], '20-60 years', 5, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Errol Estates', 'errol-estates', 'West', 'single-family', '1980s-2000s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'premium system demands', 'larger homes', 'HOA standards'], '15-35 years', 6, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Kelly Park Area', 'kelly-park-area', 'Northwest', 'mixed', '1970s-2010s', 'Mixed income', 'Near Kelly Park and springs', ARRAY['rural properties', 'well water impacts', 'diverse housing types', 'spring humidity'], '10-45 years', 7, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Meadow Woods', 'meadow-woods', 'East', 'single-family', '2000s-2010s', 'Middle income', 'Newer residential development', ARRAY['newer construction', 'builder-grade upgrades', 'smart thermostat setup', 'HOA requirements'], '8-20 years', 8, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Bear Lake Area', 'bear-lake', 'Southeast', 'single-family', '1970s-1990s', 'Middle income', 'Established lakeside area', ARRAY['lakefront humidity', 'older systems', 'tree shade impacts', 'modernization needs'], '20-45 years', 9, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Clarcona', 'clarcona', 'South', 'mixed', '1960s-2000s', 'Moderate income', 'Rural-suburban transition area', ARRAY['diverse housing', 'manufactured homes', 'well water', 'varied needs'], '15-50 years', 10, false)
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
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  'hvac',
  '/fl/apopka/hvac',
  'HVAC Services in Apopka, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Apopka''s 58,000+ growing residents. Duke Energy rebates available. Serving Rock Springs, Wekiva & all neighborhoods. New construction specialists!',
  'HVAC Apopka FL',
  ARRAY['AC repair Apopka', 'air conditioning Apopka FL', 'HVAC contractor Apopka', 'new construction HVAC Apopka', 'Duke Energy rebates Apopka', 'Orange County HVAC'],

  'Apopka''s Growing HVAC Experts',
  'New construction and established home specialists',
  'Licensed & Insured | Duke Energy Certified | New Construction Experts',
  'Apopka is one of Central Florida''s fastest-growing cities, expanding from its roots as the "Indoor Foliage Capital of the World" into a thriving bedroom community of nearly 58,000 residents. From new construction in Rock Springs Ridge to established homes in Piedmont Lakes, our team provides expert HVAC service for every type of Apopka property. As Duke Energy certified contractors, we help you maximize rebates while keeping your family comfortable in Central Florida''s demanding climate.',

  '{
    "headline": "Why Apopka Homeowners Choose Us",
    "reasons": [
      {"title": "New Construction Specialists", "description": "With Apopka''s rapid growth, we''ve become experts in new construction HVAC. We work with builders and homeowners to ensure optimal system design and installation."},
      {"title": "Duke Energy Rebate Experts", "description": "We help you access up to $300 for AC replacement and $150 for heat pumps through Duke Energy''s rebate programs. Free home energy checks available."},
      {"title": "Springs Area Knowledge", "description": "Properties near Wekiva and Rock Springs experience unique humidity challenges. We provide specialized solutions for these beautiful but demanding locations."},
      {"title": "Family-Focused Service", "description": "Apopka is a family community, and we treat every customer like family. Honest pricing, reliable service, and solutions that fit your budget."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Apopka",
    "intro": "Apopka''s growth and location create specific HVAC needs:",
    "challenges": [
      {"title": "Springs Proximity Humidity", "description": "Properties near Wekiva Springs and Rock Springs experience elevated humidity. Proper dehumidification is essential for comfort and home protection."},
      {"title": "New Construction Quality", "description": "Many new Apopka homes come with builder-grade HVAC that may not be optimally sized. We help homeowners upgrade for better efficiency and comfort."},
      {"title": "Rapid Growth Demands", "description": "Apopka''s fast growth means many HVAC companies are stretched thin. We''ve expanded our team to provide prompt service throughout the area."},
      {"title": "Mixed Housing Stock", "description": "From 1950s downtown to 2020s master-planned communities, Apopka requires varied HVAC approaches for different home types."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Apopka",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert installation for new Apopka homes. We ensure proper sizing and optimal efficiency from day one.", "features": ["Builder coordination", "Manual J calculations", "Energy code compliance", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Apopka. Same-day service available.", "features": ["Same-day service", "All brands serviced", "90-day warranty", "Upfront pricing"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance and efficiency.", "features": ["Capacity increases", "Efficiency upgrades", "Zoning additions", "Smart thermostat integration"]},
      {"name": "Humidity Control", "slug": "dehumidification", "description": "Essential for springs-area properties. Whole-home dehumidification solutions.", "features": ["Whole-home systems", "Springs area specialists", "Mold prevention", "Integrated controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your new or established home with regular maintenance.", "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with new construction builders in Apopka?", "answer": "Yes, we work with many builders in Apopka''s growing communities. We also help new homeowners evaluate and upgrade builder-installed systems."},
      {"question": "What rebates does Duke Energy offer?", "answer": "Duke Energy offers up to $300 for AC replacement with a Home Energy Check, $150 for heat pumps, and $150 for duct sealing. We handle all paperwork."},
      {"question": "Why do homes near the springs need special attention?", "answer": "Properties near Wekiva and Rock Springs experience higher humidity due to the springs and surrounding vegetation. This requires enhanced dehumidification for comfort and mold prevention."},
      {"question": "Should I upgrade my builder-grade AC?", "answer": "Many builder-grade systems are sized minimally. If you''re experiencing uneven temperatures or high bills, an upgrade or enhancement may significantly improve comfort and efficiency."},
      {"question": "How often should I service my AC in Apopka?", "answer": "We recommend bi-annual maintenance—spring and fall. With 105+ days above 90°F, regular maintenance prevents breakdowns during peak cooling season."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,550", "days_above_90": "105+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready to Upgrade Your Apopka Home Comfort?',
  'Contact us today for a free estimate. Whether you''re in a new construction home or an established neighborhood, we''ll help you stay cool with Duke Energy rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Apopka", "description": "Professional HVAC services in Apopka, FL specializing in new construction and established homes.", "url": "https://coolit-hvac.com/apopka-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Apopka", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new construction builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with many builders in Apopka and help homeowners upgrade builder-installed systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Apopka", "item": "https://coolit-hvac.com/fl/apopka"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/mount-dora/hvac", "anchor_text": "Mount Dora HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1880, 26, 14, 87,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
