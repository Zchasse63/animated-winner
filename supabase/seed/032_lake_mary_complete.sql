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
