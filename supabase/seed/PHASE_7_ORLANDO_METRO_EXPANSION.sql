-- ============================================
-- Altamonte Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  'Altamonte Springs', 'altamonte-springs', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6611, -81.3656,
  ARRAY['32701', '32714', '32715', '32716'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'f2a3b4c5-d6e7-8901-5678-234567890123']::uuid[],
  true, 88
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
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  NOW(),
  46356, 'US Census Bureau ACS 2023',
  62847, 295000, 54.2,
  ARRAY['single-family', 'condo', 'apartment', 'townhouse'],
  '{"pre-1980": 20, "1980s-1990s": 40, "2000s-2010s": 30, "2020s": 10}'::jsonb,
  92, 52, 74, 3500, 100, 52.8, 'moderate',
  'Central Seminole County location. Major retail hub with Altamonte Mall. I-4 corridor access. Mix of residential and commercial. Strong employment center.',
  ARRAY['AdventHealth Altamonte Springs', 'Seminole County Public Schools', 'Altamonte Mall retailers', 'City of Altamonte Springs', 'Healthcare industry', 'Corporate offices'],
  ARRAY['Altamonte Mall', 'Cranes Roost Park', 'Uptown Altamonte', 'Lake Lotus Park', 'Westmonte Park'],
  ARRAY['Red Hot & Boom', 'Jazz at Cranes Roost', 'Movies by the Lake', 'Altamonte Springs Art Festival'],
  ARRAY['Seminole County Public Schools'],
  'Uptown Altamonte redevelopment. SunRail station connectivity. Mixed-use development. I-4 corridor improvements.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Altamonte Springs Utilities',
  220,
  'Florida Building Code 8th Edition (2023), Seminole County amendments',
  '{"hvac_replacement": "Permit required", "commercial": "Commercial HVAC requires additional permitting", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Uptown Altamonte', 'uptown-altamonte', 'Central', 'mixed', '2000s-2020s', 'Upper middle income', 'Mixed-use urban development', ARRAY['high-rise condos', 'mixed-use systems', 'commercial HVAC', 'modern construction'], '5-20 years', 1, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Cranes Roost', 'cranes-roost', 'Central', 'condo', '1990s-2010s', 'Upper middle income', 'Lakefront condo community', ARRAY['condo systems', 'lakefront humidity', 'association coordination', 'high-rise needs'], '10-28 years', 2, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Spring Lake Hills', 'spring-lake-hills', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['1970s-90s systems', 'family homes', 'system replacements', 'efficiency upgrades'], '20-45 years', 3, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Eastbrook', 'eastbrook', 'East', 'single-family', '1980s-2000s', 'Middle income', 'Family neighborhood', ARRAY['1980s-2000s systems', 'standard maintenance', 'family sizing'], '15-35 years', 4, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Sanlando Springs', 'sanlando-springs', 'North', 'single-family', '1980s-1990s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', '1980s-90s systems', 'efficiency updates'], '25-40 years', 5, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Wekiva Hunt Club', 'wekiva-hunt-club', 'Northwest', 'single-family', '1980s-2000s', 'Upper middle income', 'Established community', ARRAY['established systems', 'family homes', 'HOA requirements'], '15-35 years', 6, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Altamonte Heights', 'altamonte-heights', 'West', 'single-family', '1960s-1980s', 'Middle income', 'Older established area', ARRAY['older systems', 'budget solutions', 'system replacements'], '25-55 years', 7, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Pearl Lake', 'pearl-lake', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Lakefront neighborhood', ARRAY['lakefront humidity', 'older systems', 'standard service'], '20-45 years', 8, false)
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
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  'hvac',
  '/fl/altamonte-springs/hvac',
  'HVAC Services in Altamonte Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Altamonte Springs'' 46,000+ residents. Commercial & residential specialists. Duke Energy rebates available. Serving Uptown, Cranes Roost & all areas.',
  'HVAC Altamonte Springs FL',
  ARRAY['AC repair Altamonte Springs', 'air conditioning Altamonte Springs FL', 'HVAC contractor Altamonte Springs', 'commercial HVAC Altamonte', 'Duke Energy rebates', 'Seminole County HVAC'],

  'Altamonte Springs'' I-4 Corridor HVAC Experts',
  'Commercial and residential comfort solutions',
  'Licensed & Insured | Duke Energy Certified | Commercial & Residential Specialists',
  'Altamonte Springs is a thriving I-4 corridor city combining vibrant urban development at Uptown Altamonte with established residential neighborhoods. With over 46,000 residents and major commercial centers like Altamonte Mall, reliable HVAC is essential for both businesses and homes. Our team provides expert service throughout Altamonte Springs, from high-rise condos at Cranes Roost to family homes in Spring Lake Hills, helping you maximize Duke Energy rebates while staying comfortable.',

  '{
    "headline": "Why Altamonte Springs Chooses Us",
    "reasons": [
      {"title": "Commercial HVAC Expertise", "description": "Altamonte Springs is a major employment and retail hub. We service office buildings, retail spaces, and restaurants with the same dedication we bring to residential properties."},
      {"title": "High-Rise Specialists", "description": "Uptown Altamonte and Cranes Roost feature high-rise condos requiring specialized service. We understand condo systems and work seamlessly with associations."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Altamonte Springs homeowners and businesses access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "I-4 Corridor Coverage", "description": "Central location means fast response times throughout Altamonte Springs and surrounding areas."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Altamonte Springs",
    "intro": "Altamonte Springs'' mix of commercial and residential creates specific HVAC needs:",
    "challenges": [
      {"title": "Mixed-Use Development", "description": "Uptown Altamonte combines residential, retail, and commercial in one complex. Systems must handle diverse needs efficiently."},
      {"title": "High-Rise Condo Systems", "description": "Cranes Roost and other high-rises require specialized approaches including coordination with HOAs and understanding of shared systems."},
      {"title": "1980s Housing Stock", "description": "Many Altamonte Springs neighborhoods were built during the 1980s boom. Original systems are due for replacement with efficient modern equipment."},
      {"title": "Commercial Demands", "description": "Retail and office properties need reliable HVAC with minimal downtime and responsive service."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Altamonte Springs",
    "services": [
      {"name": "Commercial HVAC", "slug": "commercial-hvac", "description": "Complete commercial HVAC service for Altamonte Springs businesses including retail, office, and restaurant properties.", "features": ["Preventive maintenance", "Emergency service", "System design", "Energy efficiency"]},
      {"name": "High-Rise Condo Service", "slug": "condo-hvac", "description": "Specialized service for Altamonte Springs high-rise condos and apartments.", "features": ["HOA coordination", "Association billing", "Individual units", "Common areas"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs for homes and businesses throughout Altamonte Springs.", "features": ["Same-day service", "24/7 emergency", "All brands", "90-day warranty"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade 1980s-era systems with modern efficient equipment.", "features": ["Efficiency improvements", "Rebate assistance", "Minimal disruption", "Modern controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Commercial plans", "Residential plans", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service commercial properties in Altamonte Springs?", "answer": "Yes, we provide complete commercial HVAC service for retail, office, and restaurant properties throughout Altamonte Springs including preventive maintenance and emergency repairs."},
      {"question": "Can you work on high-rise condo systems?", "answer": "Yes, we specialize in high-rise properties at Cranes Roost and Uptown Altamonte. We coordinate with HOAs and understand both individual unit and common area systems."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork for residential and commercial customers."},
      {"question": "Do you offer 24/7 emergency service?", "answer": "Yes, we provide 24/7 emergency service for commercial and residential customers throughout Altamonte Springs."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Reliable Comfort in Altamonte Springs?',
  'Contact us today for a free estimate. Whether residential or commercial, we''ll help you access Duke Energy rebates and stay comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Altamonte Springs", "description": "Professional HVAC services in Altamonte Springs, FL.", "url": "https://coolit-hvac.com/altamonte-springs-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Altamonte Springs", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service commercial properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide complete commercial HVAC service throughout Altamonte Springs."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Altamonte Springs", "item": "https://coolit-hvac.com/fl/altamonte-springs"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/sanford/hvac", "anchor_text": "Sanford HVAC"}, {"slug": "/fl/lake-mary/hvac", "anchor_text": "Lake Mary AC"}, {"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/commercial-hvac", "anchor_text": "Commercial HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 12, 87,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Lake Mary, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a1b2c3d4-e5f6-7890-4567-123456789012',
  'Lake Mary', 'lake-mary', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.7589, -81.3178,
  ARRAY['32746', '32795'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['f2a3b4c5-d6e7-8901-5678-234567890123', 'f0a1b2c3-d4e5-6789-3456-012345678901']::uuid[],
  true, 89
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
  'a1b2c3d4-e5f6-7890-4567-123456789012',
  NOW(),
  17316, 'US Census Bureau ACS 2023',
  105847, 485000, 76.8,
  ARRAY['single-family', 'townhouse', 'new-construction', 'golf-community'],
  '{"1990s": 35, "2000s": 40, "2010s": 20, "2020s": 5}'::jsonb,
  92, 51, 73, 3450, 98, 52.4, 'low',
  'Affluent Seminole County community. Corporate headquarters hub. Top-rated schools. Master-planned communities. Low hurricane risk inland location.',
  ARRAY['AAA National Headquarters', 'FARO Technologies', 'Seminole County Public Schools', 'Mitsubishi Power Americas', 'HSBC', 'City of Lake Mary'],
  ARRAY['Lake Mary Events Center', 'Central Winds Park', 'Lake Mary Sports Complex', 'SunRail Station', 'Town Center area'],
  ARRAY['Lake Mary Farmers Market', 'Movies in the Park', 'Tree Lighting Ceremony', 'Community events'],
  ARRAY['Seminole County Public Schools'],
  'Town Center expansion. Corporate headquarters growth. Residential development. I-4 improvements. SunRail connectivity.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Lake Mary Utilities',
  210,
  'Florida Building Code 8th Edition (2023), City of Lake Mary amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Heathrow', 'heathrow', 'West', 'golf-community', '1990s-2010s', 'Upper income', 'Premier golf and country club', ARRAY['premium systems', 'golf course humidity', 'multi-zone estates', 'luxury demands'], '10-28 years', 1, true),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Timacuan', 'timacuan', 'South', 'golf-community', '1990s-2000s', 'Upper income', 'Gated golf community', ARRAY['premium systems', 'golf course adjacent', 'established luxury', 'HOA standards'], '15-28 years', 2, true),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Markham Woods', 'markham-woods', 'North', 'single-family', '1990s-2010s', 'Upper middle income', 'Family-oriented community', ARRAY['family homes', 'established systems', 'efficiency focus'], '10-28 years', 3, true),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Bridgewater', 'bridgewater', 'Central', 'single-family', '1990s-2000s', 'Upper middle income', 'Established neighborhood', ARRAY['1990s-2000s systems', 'family homes', 'HOA requirements'], '15-28 years', 4, false),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Raintree', 'raintree', 'East', 'single-family', '1990s-2000s', 'Upper middle income', 'Near I-4 corridor', ARRAY['established systems', 'family sizing', 'standard service'], '15-28 years', 5, false),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Grande Oaks', 'grande-oaks', 'Northeast', 'single-family', '2000s-2010s', 'Upper middle income', 'Newer community', ARRAY['newer systems', 'family homes', 'HOA compliance'], '10-20 years', 6, false),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Stonewood Reserve', 'stonewood-reserve', 'South', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer construction', 'smart systems', 'energy efficiency'], '5-20 years', 7, false),
  ('a1b2c3d4-e5f6-7890-4567-123456789012', 'Lake Emma', 'lake-emma', 'West', 'single-family', '1990s-2010s', 'Upper middle income', 'Lakefront community', ARRAY['lakefront humidity', 'established homes', 'premium preferences'], '10-28 years', 8, false)
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
  'a1b2c3d4-e5f6-7890-4567-123456789012',
  'hvac',
  '/fl/lake-mary/hvac',
  'HVAC Services in Lake Mary, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lake Mary''s 17,000+ affluent residents. Premium golf community specialists. Duke Energy rebates. Serving Heathrow, Timacuan & all neighborhoods.',
  'HVAC Lake Mary FL',
  ARRAY['AC repair Lake Mary', 'air conditioning Lake Mary FL', 'HVAC contractor Lake Mary', 'Heathrow AC', 'premium HVAC Lake Mary', 'Seminole County HVAC'],

  'Lake Mary''s Premier HVAC Specialists',
  'Premium service for premium communities',
  'Licensed & Insured | Duke Energy Certified | Golf Community Experts',
  'Lake Mary represents the finest in Seminole County living—prestigious golf communities like Heathrow and Timacuan, top-rated schools, and a thriving corporate environment home to AAA and other headquarters. With median home values exceeding $485,000 and residents who expect excellence, Lake Mary demands HVAC service that matches its premium standards. Our team provides white-glove service throughout this exceptional community.',

  '{
    "headline": "Why Lake Mary Homeowners Choose Us",
    "reasons": [
      {"title": "Premium Community Expertise", "description": "Lake Mary''s golf communities like Heathrow and Timacuan demand the highest standards. We deliver premium equipment and service that meets these expectations."},
      {"title": "Multi-Zone Specialists", "description": "Lake Mary''s larger estates often require sophisticated multi-zone systems. We design and maintain complex comfort solutions."},
      {"title": "Duke Energy Rebate Experts", "description": "We help Lake Mary homeowners access up to $1,700 in Duke Energy rebates while maintaining premium comfort standards."},
      {"title": "Responsive Service", "description": "Lake Mary residents value their time. We provide prompt scheduling, punctual arrivals, and efficient service."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Lake Mary Properties",
    "intro": "Lake Mary''s premium communities create specific HVAC expectations:",
    "challenges": [
      {"title": "Golf Course Humidity", "description": "Heathrow, Timacuan, and other golf properties experience elevated humidity from irrigated courses requiring enhanced dehumidification."},
      {"title": "Premium Standards", "description": "Lake Mary homeowners expect top-tier equipment, quiet operation, and professional service. We meet these expectations consistently."},
      {"title": "HOA Requirements", "description": "Lake Mary''s communities have specific requirements for equipment placement and appearance. We ensure full compliance."},
      {"title": "Smart Home Integration", "description": "Many Lake Mary homes feature sophisticated automation. We integrate HVAC seamlessly with existing smart systems."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Lake Mary",
    "services": [
      {"name": "Premium Golf Community HVAC", "slug": "golf-community-hvac", "description": "White-glove service for Heathrow, Timacuan, and other Lake Mary golf communities.", "features": ["Premium equipment", "HOA compliance", "Humidity control", "Multi-zone expertise"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs for Lake Mary homeowners.", "features": ["Same-day service", "Premium brands", "90-day warranty", "Respectful service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with top-tier equipment and Duke Energy rebates.", "features": ["Duke Energy rebates", "Premium brands", "10-year warranty", "Smart integration"]},
      {"name": "Multi-Zone Systems", "slug": "multi-zone", "description": "Sophisticated comfort solutions for larger Lake Mary estates.", "features": ["Zoned comfort", "Individual control", "Energy efficiency", "Whole-home automation"]},
      {"name": "Smart Home Integration", "slug": "smart-home", "description": "Seamless HVAC integration with your smart home systems.", "features": ["System compatibility", "Voice control", "Remote monitoring", "Energy optimization"]},
      {"name": "Premium Maintenance", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "System optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service premium golf communities like Heathrow?", "answer": "Yes, we specialize in Lake Mary''s premier communities. Our technicians are trained in premium service protocols and respect for fine properties."},
      {"question": "Can you integrate HVAC with smart home systems?", "answer": "Absolutely. We integrate with all major smart home platforms including Control4, Crestron, and others common in Lake Mary homes."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."},
      {"question": "Do you work with Lake Mary HOAs?", "answer": "Yes, we''re familiar with requirements for Heathrow, Timacuan, and other communities, ensuring all installations meet HOA standards."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,450", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Premium Comfort in Lake Mary?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Lake Mary home with Duke Energy rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Lake Mary", "description": "Premium HVAC services for Lake Mary, FL.", "url": "https://coolit-hvac.com/lake-mary-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Lake Mary", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Heathrow?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Lake Mary''s premier golf communities."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Lake Mary", "item": "https://coolit-hvac.com/fl/lake-mary"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/sanford/hvac", "anchor_text": "Sanford HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/longwood/hvac", "anchor_text": "Longwood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1820, 24, 14, 89,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Oviedo, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  'Oviedo', 'oviedo', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6700, -81.2081,
  ARRAY['32765', '32766'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'a3b4c5d6-e7f8-9012-6789-345678901234']::uuid[],
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
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  NOW(),
  43069, 'US Census Bureau ACS 2023',
  95847, 425000, 80.4,
  ARRAY['single-family', 'new-construction', 'golf-community', 'townhouse'],
  '{"pre-1990": 15, "1990s-2000s": 35, "2010s": 30, "2020s": 20}'::jsonb,
  92, 51, 74, 3500, 102, 53.1, 'low',
  'Family-oriented community with small-town charm. Rapid growth with new development. UCF proximity. "Chicken Capital of the World" heritage. Low inland hurricane risk.',
  ARRAY['Seminole County Public Schools', 'University of Central Florida (nearby)', 'Oviedo Medical Center', 'City of Oviedo', 'Siemens (nearby)', 'Retail and service industry'],
  ARRAY['Historic Downtown Oviedo', 'Oviedo Mall', 'Black Hammock', 'Riverside Park', 'Twin Rivers Park'],
  ARRAY['Taste of Oviedo', 'Great Day in the Country', 'Winter Springs Farmer''s Market (nearby)', 'A Night Under the Stars'],
  ARRAY['Seminole County Public Schools'],
  'Continued residential growth. Oviedo on the Park development. UCF partnership expansion. SR 417 corridor development. New schools construction.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Oviedo Utilities / Seminole County',
  240,
  'Florida Building Code 8th Edition (2023), City of Oviedo amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Oviedo on the Park', 'oviedo-on-the-park', 'Central', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'smart home ready', 'energy efficiency', 'HOA requirements'], '0-12 years', 1, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'The Preserve', 'the-preserve', 'East', 'golf-community', '2000s-2010s', 'Upper income', 'Premier golf community', ARRAY['golf course humidity', 'premium systems', 'multi-zone estates', 'HOA standards'], '10-20 years', 2, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Stonebridge', 'stonebridge', 'West', 'single-family', '2000s-2010s', 'Upper middle income', 'Family-friendly community', ARRAY['family homes', 'newer systems', 'HOA requirements'], '10-20 years', 3, true),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Carillon', 'carillon', 'South', 'single-family', '1990s-2010s', 'Upper middle income', 'Established neighborhood', ARRAY['established systems', 'family sizing', 'efficiency focus'], '10-28 years', 4, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Chuluota (adjacent)', 'chuluota-oviedo', 'East', 'mixed', '1980s-2010s', 'Middle income', 'Rural-suburban mix', ARRAY['varied housing', 'well water', 'mixed needs'], '10-35 years', 5, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Canterbury Retreat', 'canterbury-retreat', 'North', 'single-family', '1990s-2000s', 'Upper middle income', 'Established community', ARRAY['1990s-2000s systems', 'family homes', 'standard service'], '15-28 years', 6, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Live Oak Reserve', 'live-oak-reserve', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community', ARRAY['newer construction', 'smart systems', 'energy efficiency'], '5-12 years', 7, false),
  ('b2c3d4e5-f6a7-8901-5678-234567890123', 'Historic Downtown', 'downtown-oviedo', 'Central', 'mixed', '1900s-1980s', 'Middle income', 'Original Oviedo area', ARRAY['older buildings', 'varied systems', 'renovation needs'], '15-80+ years', 8, false)
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
  'b2c3d4e5-f6a7-8901-5678-234567890123',
  'hvac',
  '/fl/oviedo/hvac',
  'HVAC Services in Oviedo, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Oviedo''s 43,000+ residents. Family home and new construction specialists. Duke Energy rebates. Serving Oviedo on the Park, The Preserve & all areas.',
  'HVAC Oviedo FL',
  ARRAY['AC repair Oviedo', 'air conditioning Oviedo FL', 'HVAC contractor Oviedo', 'new construction AC Oviedo', 'Duke Energy rebates', 'Seminole County HVAC'],

  'Oviedo''s Family-Focused HVAC Experts',
  'Growing with Orlando''s family-friendly community',
  'Licensed & Insured | Duke Energy Certified | New Construction Specialists',
  'Oviedo combines small-town charm with rapid growth, attracting families seeking excellent schools, safe neighborhoods, and proximity to UCF. With over 43,000 residents and an 80% homeownership rate, Oviedo homeowners take pride in their properties. From new construction at Oviedo on the Park to established communities like Carillon, our team provides expert HVAC service while helping you maximize Duke Energy rebates.',

  '{
    "headline": "Why Oviedo Families Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Oviedo is growing rapidly with communities like Oviedo on the Park and Live Oak Reserve. We work with builders and new homeowners to ensure optimal HVAC from day one."},
      {"title": "Family-Focused Service", "description": "Oviedo is a family community. We provide honest pricing, respectful service, and solutions that keep your family comfortable."},
      {"title": "Duke Energy Rebate Specialists", "description": "We help Oviedo homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Golf Community Experience", "description": "The Preserve and other golf communities require premium service. We deliver equipment and expertise matching these properties."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Oviedo",
    "intro": "Oviedo''s growth and character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Quality", "description": "Many Oviedo builder-grade systems are minimally sized. We help homeowners evaluate and upgrade for optimal comfort and efficiency."},
      {"title": "HOA Requirements", "description": "Oviedo''s numerous master-planned communities have equipment placement and appearance standards we navigate daily."},
      {"title": "Golf Course Humidity", "description": "The Preserve and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Rapid Growth", "description": "Oviedo''s fast growth means many HVAC companies are stretched thin. We''ve expanded to provide responsive service."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Oviedo",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Oviedo''s new homes including system evaluation and upgrades.", "features": ["Builder coordination", "System evaluation", "Upgrades available", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs for Oviedo families.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for The Preserve and other golf communities.", "features": ["HOA compliance", "Premium equipment", "Humidity control", "Multi-zone systems"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Oviedo new home builders?", "answer": "Yes, we work with builders throughout Oviedo and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Should I upgrade my new home''s builder-grade AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."},
      {"question": "Do you service The Preserve and other golf communities?", "answer": "Yes, we specialize in Oviedo''s golf communities with HOA-compliant installations and premium equipment."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "102+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Family Comfort in Oviedo?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and keep your Oviedo family comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Oviedo", "description": "Professional HVAC services in Oviedo, FL.", "url": "https://coolit-hvac.com/oviedo-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Oviedo", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new home builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Oviedo", "item": "https://coolit-hvac.com/fl/oviedo"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 14, 87,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Winter Garden, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  'Winter Garden', 'winter-garden', 'Florida', 'FL', 'Orange', 'orange-county',
  28.5653, -81.5862,
  ARRAY['34777', '34778', '34787'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 88
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
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  NOW(),
  51826, 'US Census Bureau ACS 2023',
  92547, 435000, 74.8,
  ARRAY['single-family', 'new-construction', 'townhouse', 'historic-home'],
  '{"pre-1990": 10, "1990s-2000s": 25, "2010s": 40, "2020s": 25}'::jsonb,
  92, 52, 73, 3450, 100, 52.6, 'low',
  'Historic downtown with modern growth. One of Florida''s fastest-growing cities. West Orange Trail hub. Mix of charm and new development. Low inland hurricane risk.',
  ARRAY['Orange County Public Schools', 'AdventHealth Winter Garden', 'City of Winter Garden', 'West Orange Healthcare District', 'Retail and service industry', 'Small businesses'],
  ARRAY['Historic Downtown Winter Garden', 'West Orange Trail', 'Plant Street Market', 'Garden Theatre', 'Tucker Ranch', 'SunRail Station'],
  ARRAY['Winter Garden Farmers Market', 'Taste of Winter Garden', 'Plant Street Market events', 'Bike Night'],
  ARRAY['Orange County Public Schools'],
  'Massive westward residential growth. Horizon West development. Downtown revitalization. SunRail extension. New schools and infrastructure.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Winter Garden Utilities',
  230,
  'Florida Building Code 8th Edition (2023), Winter Garden historic district overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for historic properties", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Air Zero', 'Climate Control Experts', 'Kalos Services'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Horizon West', 'horizon-west', 'West', 'new-construction', '2010s-2020s', 'Upper middle income', 'Massive master-planned development', ARRAY['new construction', 'builder-grade systems', 'smart home ready', 'HOA requirements'], '0-12 years', 1, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Historic Downtown', 'downtown-winter-garden', 'Central', 'historic-home', '1900s-1960s', 'Upper middle income', 'Charming historic downtown', ARRAY['historic retrofits', 'ductless needs', 'preservation compliance', 'older buildings'], '15-80+ years', 2, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Stoneybrook West', 'stoneybrook-west', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Large planned community', ARRAY['newer systems', 'family homes', 'HOA requirements'], '5-20 years', 3, true),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Independence', 'independence', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'family sizing', 'energy efficiency'], '0-12 years', 4, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Oakland', 'oakland-wg', 'North', 'single-family', '1990s-2010s', 'Middle income', 'Historic adjacent area', ARRAY['varied ages', 'family homes', 'mixed needs'], '10-28 years', 5, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Hamlin', 'hamlin', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Growing community', ARRAY['newer construction', 'family homes', 'HOA standards'], '5-20 years', 6, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Windermere Trails', 'windermere-trails', 'South', 'single-family', '2000s-2010s', 'Upper middle income', 'Established community', ARRAY['established systems', 'family sizing', 'standard service'], '10-20 years', 7, false),
  ('c3d4e5f6-a7b8-9012-6789-345678901234', 'Tucker Ranch', 'tucker-ranch', 'North', 'single-family', '1990s-2000s', 'Middle income', 'Near West Orange Trail', ARRAY['1990s-2000s systems', 'family homes', 'efficiency focus'], '15-28 years', 8, false)
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
  'c3d4e5f6-a7b8-9012-6789-345678901234',
  'hvac',
  '/fl/winter-garden/hvac',
  'HVAC Services in Winter Garden, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Garden''s 52,000+ residents. New construction and historic specialists. Duke Energy rebates. Serving Horizon West, Downtown & all neighborhoods.',
  'HVAC Winter Garden FL',
  ARRAY['AC repair Winter Garden', 'air conditioning Winter Garden FL', 'HVAC contractor Winter Garden', 'Horizon West AC', 'historic home HVAC', 'Orange County HVAC'],

  'Winter Garden''s Fastest-Growing HVAC Experts',
  'From historic charm to modern expansion, we keep Winter Garden comfortable',
  'Licensed & Insured | Duke Energy Certified | Historic & New Construction Specialists',
  'Winter Garden is one of Florida''s most dynamic communities—a charming historic downtown along the West Orange Trail combined with explosive westward growth in Horizon West. With over 52,000 residents and thousands more arriving annually, Winter Garden needs HVAC contractors who understand both historic preservation and modern new construction. Our team serves the entire Winter Garden area, from century-old downtown gems to brand-new Horizon West homes.',

  '{
    "headline": "Why Winter Garden Homeowners Choose Us",
    "reasons": [
      {"title": "Horizon West Experts", "description": "We''ve grown with Winter Garden''s westward expansion. From Stoneybrook West to Independence, we work with builders and new homeowners ensuring optimal HVAC."},
      {"title": "Historic Preservation Specialists", "description": "Downtown Winter Garden''s historic buildings deserve sensitive HVAC solutions. We provide ductless systems and retrofits that preserve character."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Winter Garden homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "Rapid Response", "description": "Winter Garden''s growth creates demand. We''ve expanded our team to provide fast service throughout the area."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Winter Garden",
    "intro": "Winter Garden''s rapid growth and historic character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Volume", "description": "Horizon West is one of Florida''s largest developments. Many builder-grade systems are minimally sized—we help homeowners evaluate and upgrade."},
      {"title": "Historic Preservation", "description": "Downtown Winter Garden''s historic overlay requires sensitive HVAC solutions that don''t compromise architectural integrity."},
      {"title": "HOA Requirements", "description": "Winter Garden''s numerous master-planned communities have specific requirements for equipment placement and appearance."},
      {"title": "Rapid Growth Demand", "description": "Winter Garden''s explosive growth means some HVAC companies can''t keep up. We''ve expanded to serve this growing community."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Winter Garden",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Horizon West and other Winter Garden new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Winter Garden''s charming historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Winter Garden.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade Horizon West builder systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Horizon West builders?", "answer": "Yes, we work with builders throughout Horizon West and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Can you install AC in historic downtown buildings?", "answer": "Yes, ductless mini-split systems are ideal for Winter Garden''s historic properties. They provide efficient cooling without invasive ductwork."},
      {"question": "Should I upgrade my new Horizon West home''s AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,450", "days_above_90": "100+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Comfort in Winter Garden?',
  'Contact us today for a free estimate. From downtown historic to Horizon West new construction, we''ll keep your Winter Garden home comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Garden", "description": "Professional HVAC services in Winter Garden, FL.", "url": "https://coolit-hvac.com/winter-garden-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Winter Garden", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Horizon West builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Garden", "item": "https://coolit-hvac.com/fl/winter-garden"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/ocoee/hvac", "anchor_text": "Ocoee AC"}, {"slug": "/fl/windermere/hvac", "anchor_text": "Windermere HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1860, 28, 14, 88,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Maitland, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  'Maitland', 'maitland', 'Florida', 'FL', 'Orange', 'orange-county',
  28.6278, -81.3631,
  ARRAY['32751', '32794'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'a3b4c5d6-e7f8-9012-6789-345678901234']::uuid[],
  true, 86
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
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  NOW(),
  19543, 'US Census Bureau ACS 2023',
  87542, 425000, 62.4,
  ARRAY['single-family', 'condo', 'historic-home', 'townhouse'],
  '{"pre-1970": 25, "1970s-1980s": 30, "1990s-2000s": 30, "2010s-2020s": 15}'::jsonb,
  92, 52, 74, 3500, 100, 52.6, 'moderate',
  'Historic Central Florida city. I-4 corridor location. Mix of historic charm and modern development. Corporate headquarters presence. Adjacent to Winter Park.',
  ARRAY['AAA National Headquarters (nearby)', 'Orange County Public Schools', 'AdventHealth (nearby)', 'City of Maitland', 'Professional offices', 'Retail businesses'],
  ARRAY['Lake Lily Park', 'Maitland Art Center', 'Maitland Historical Society', 'Lake Sybelia', 'Maitland Community Park', 'SunRail Station'],
  ARRAY['Maitland Rotary Riverwalk Ramble', 'Maitland Art Festival', 'Maitland Farmers Market'],
  ARRAY['Orange County Public Schools'],
  'Downtown Maitland revitalization. SunRail connectivity. Mixed-use development. I-4 corridor improvements. Historic preservation efforts.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Maitland Utilities',
  220,
  'Florida Building Code 8th Edition (2023), Maitland historic overlay',
  '{"hvac_replacement": "Permit required", "historic_properties": "Additional review for historic buildings", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Downtown Maitland', 'downtown-maitland', 'Central', 'mixed', '1920s-1970s', 'Upper middle income', 'Historic downtown area', ARRAY['historic buildings', 'ductless needs', 'older systems', 'preservation requirements'], '20-80+ years', 1, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Lake Lily Area', 'lake-lily', 'Central', 'single-family', '1940s-1980s', 'Upper middle income', 'Lakefront historic neighborhood', ARRAY['lakefront humidity', 'older homes', 'historic character', 'system upgrades'], '25-70 years', 2, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Dommerich Hills', 'dommerich-hills', 'North', 'single-family', '1950s-1980s', 'Upper middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-60 years', 3, true),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Lake Sybelia', 'lake-sybelia', 'East', 'single-family', '1950s-1990s', 'Upper middle income', 'Lakefront area', ARRAY['lakefront humidity', 'varied ages', 'premium demands'], '20-60 years', 4, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Maitland Center', 'maitland-center', 'West', 'mixed', '1980s-2010s', 'Upper middle income', 'Office and residential mix', ARRAY['commercial HVAC', 'condo systems', 'mixed-use needs'], '10-35 years', 5, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Pebble Creek', 'pebble-creek', 'South', 'single-family', '1980s-1990s', 'Middle income', 'Established community', ARRAY['1980s-90s systems', 'family homes', 'standard service'], '25-40 years', 6, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Swoope Avenue Area', 'swoope-avenue', 'Central', 'single-family', '1940s-1970s', 'Middle income', 'Historic residential', ARRAY['older homes', 'system replacements', 'budget solutions'], '35-70 years', 7, false),
  ('d4e5f6a7-b8c9-0123-7890-456789012345', 'Maitland Woods', 'maitland-woods', 'Northwest', 'single-family', '1970s-1990s', 'Middle income', 'Wooded neighborhood', ARRAY['older systems', 'tree shade impacts', 'standard maintenance'], '25-45 years', 8, false)
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
  'd4e5f6a7-b8c9-0123-7890-456789012345',
  'hvac',
  '/fl/maitland/hvac',
  'HVAC Services in Maitland, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Maitland''s 20,000+ residents. Historic and lakefront specialists. Duke Energy rebates. Serving Downtown, Lake Lily & all neighborhoods.',
  'HVAC Maitland FL',
  ARRAY['AC repair Maitland', 'air conditioning Maitland FL', 'HVAC contractor Maitland', 'historic home AC Maitland', 'lakefront HVAC', 'Orange County HVAC'],

  'Maitland''s Historic & Lakefront HVAC Experts',
  'Preserving charm, delivering comfort',
  'Licensed & Insured | Duke Energy Certified | Historic Property Specialists',
  'Maitland combines Central Florida history with modern convenience—from the charming downtown and Lake Lily Park to contemporary mixed-use developments at Maitland Center. With nearly 20,000 residents who appreciate both character and quality, Maitland needs HVAC contractors who understand historic preservation, lakefront challenges, and community standards. Our team provides expert service throughout this distinguished community adjacent to Winter Park.',

  '{
    "headline": "Why Maitland Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Preservation Expertise", "description": "Maitland''s historic downtown and neighborhoods feature beautiful period homes requiring sensitive HVAC solutions that preserve architectural integrity."},
      {"title": "Lakefront Specialists", "description": "Lake Lily and Lake Sybelia properties face unique humidity challenges. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Maitland homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "Community Knowledge", "description": "Maitland''s mix of historic homes, lakefront properties, and modern developments requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Maitland",
    "intro": "Maitland''s character and location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Many Maitland properties are historic, requiring HVAC solutions that don''t compromise architectural character. Ductless systems often provide ideal solutions."},
      {"title": "Lakefront Humidity", "description": "Properties around Lake Lily and Lake Sybelia experience elevated humidity requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Older Housing Stock", "description": "Much of Maitland predates modern building codes. Systems in homes from the 1940s-1970s often need replacement with efficient modern equipment."},
      {"title": "Mixed Use Development", "description": "Maitland Center and other areas combine residential and commercial, requiring contractors experienced in both applications."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Maitland",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Maitland''s beautiful historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Zoned comfort"]},
      {"name": "Lakefront HVAC", "slug": "lakefront-hvac", "description": "Enhanced humidity control for Lake Lily and Lake Sybelia properties.", "features": ["Whole-home dehumidification", "Lakefront expertise", "Mold prevention", "Premium equipment"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Maitland.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic sensitivity"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in older Maitland homes.", "features": ["Efficiency improvements", "Modern comfort", "Rebate assistance", "Minimal disruption"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in my historic Maitland home?", "answer": "Yes, ductless mini-split systems are ideal for Maitland''s historic homes. They provide efficient cooling without invasive ductwork installation."},
      {"question": "Why do lakefront homes need special HVAC attention?", "answer": "Properties around Lake Lily and Lake Sybelia experience elevated humidity. Whole-home dehumidification beyond standard AC is often essential for comfort and preventing mold."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork."},
      {"question": "Do you service Maitland Center commercial properties?", "answer": "Yes, we provide commercial HVAC service for office buildings and businesses throughout Maitland Center and the entire city."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Historic Comfort in Maitland?',
  'Contact us today for a free estimate. We''ll respect Maitland''s character while delivering modern comfort with Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Maitland", "description": "Professional HVAC services in Maitland, FL specializing in historic and lakefront homes.", "url": "https://coolit-hvac.com/maitland-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Maitland", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in my historic home?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless mini-split systems are ideal for Maitland historic homes."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Maitland", "item": "https://coolit-hvac.com/fl/maitland"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/winter-park/hvac", "anchor_text": "Winter Park HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1820, 24, 12, 86,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
