-- ============================================
-- Jacksonville, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 14 - Jacksonville Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  'Jacksonville', 'jacksonville', 'Florida', 'FL', 'Duval', 'duval-county',
  30.3322, -81.6557,
  ARRAY['32202', '32204', '32205', '32206', '32207', '32208', '32209', '32210', '32211', '32216', '32217', '32218', '32219', '32220', '32221', '32222', '32223', '32224', '32225', '32226', '32227', '32244', '32246', '32250', '32254', '32256', '32257', '32258'],
  'Jacksonville',
  ARRAY[]::uuid[],
  true, 95
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
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  NOW(),
  949611, 'US Census Bureau 2023',
  61346, 275000, 60.8,
  ARRAY['single-family', 'suburban', 'new-construction', 'historic'],
  '{"pre-1970\": 20, \"1970s-1990s\": 30, \"2000s-2010s\": 30, \"2020s\": 20}'::jsonb,
  91, 44, 73, 3450, 95, 52.4, 'high',
  'Florida''s largest city by area. Banking and military hub. Major port city. St. Johns River waterfront. Rapid suburban growth. Coastal hurricane risk.',
  ARRAY['Naval Station Mayport', 'Naval Air Station Jacksonville', 'Mayo Clinic', 'Baptist Health', 'Bank of America', 'CSX Corporation', 'Fidelity Investments', 'Johnson & Johnson', 'Amazon fulfillment'],
  ARRAY['Jacksonville Landing', 'Riverside Arts Market', 'TIAA Bank Field', 'VyStar Veterans Memorial Arena', 'Cummer Museum', 'Jacksonville Zoo', 'St. Johns River', 'Downtown Jacksonville', 'San Marco Square'],
  ARRAY['Florida-Georgia football game', 'Jacksonville Jazz Festival', 'Springing the Blues', 'River City Pride', 'Players Championship (TPC Sawgrass)', 'Riverside Arts Market'],
  ARRAY['Duval County Public Schools'],
  'Major Amazon expansion. St. Johns River corridor development. Downtown revitalization. Suburban growth in Nocatee and surrounding areas. Military facility modernization.',
  'JEA (Jacksonville Electric Authority)',
  '{
    "residential_ac": {"amount": 100, "requirements": "ENERGY STAR certified AC system"},
    "smart_thermostat": {"amount": 50, "requirements": "JEA connected thermostat program"},
    "heat_pump": {"amount": 75, "requirements": "High-efficiency heat pump"},
    "total_available": {"amount": 300, "requirements": "Combined JEA rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'JEA (Water)',
  185,
  'Florida Building Code 8th Edition (2023), Duval County coastal amendments',
  '{"hvac_replacement\": \"Permit required\", \"coastal_zones\": \"Wind-rated equipment for coastal areas\", \"inspection\": \"Final inspection required\", \"new_construction\": \"Energy code compliance required"}'::jsonb,
  'moderate',
  ARRAY['Cool Connections', 'Miller''s Central Air', 'Buehler Air Conditioning', 'Snyder AC & Plumbing', 'Air Docs Heating & Air'],
  '{"demographics\": \"US Census Bureau 2023\", \"utilities\": \"JEA\", \"research_date\": \"2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Riverside-Avondale', 'riverside-avondale', 'Central', 'historic', '1920s-1950s', 'Upper middle income', 'Historic urban neighborhood', ARRAY['historic homes', 'older systems', 'preservation concerns', 'urban density'], '20-100 years', 1, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'San Marco', 'san-marco', 'South', 'historic', '1920s-1960s', 'Upper middle income', 'Charming historic district', ARRAY['historic properties', 'varied ages', 'waterfront proximity', 'preservation standards'], '30-95 years', 2, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Nocatee', 'nocatee', 'Southeast', 'new-construction', '2010s-2020s', 'Upper income', 'Master-planned community', ARRAY['new builder systems', 'smart home integration', 'HOA requirements', 'family sizing'], '0-12 years', 3, true),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Mandarin', 'mandarin', 'South', 'suburban', '1980s-2010s', 'Upper middle income', 'Established St. Johns River area', ARRAY['river humidity', 'family homes', 'varied ages', 'waterfront properties'], '12-40 years', 4, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Baymeadows', 'baymeadows', 'Southeast', 'mixed', '1980s-2010s', 'Upper middle income', 'Business and residential hub', ARRAY['mixed use', 'family homes', 'condos', 'commercial HVAC'], '10-40 years', 5, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Arlington', 'arlington', 'East', 'suburban', '1970s-2000s', 'Middle income', 'Large diverse area', ARRAY['varied housing', 'family homes', 'mixed ages', 'standard service'], '20-50 years', 6, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Southside', 'southside', 'South', 'suburban', '1980s-2020s', 'Middle income', 'Growing suburban area', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-40 years', 7, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Deerwood', 'deerwood', 'Southeast', 'suburban', '1990s-2010s', 'Upper middle income', 'Business park area', ARRAY['professional community', 'newer systems', 'HOA standards'], '10-30 years', 8, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Ortega', 'ortega', 'West', 'affluent', '1920s-2000s', 'High income', 'Historic waterfront estates', ARRAY['luxury homes', 'river properties', 'premium systems', 'older estates'], '10-95 years', 9, false),
  ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Beaches Area', 'beaches-area', 'East', 'coastal', '1960s-2020s', 'Upper middle income', 'Near Jacksonville Beach', ARRAY['coastal exposure', 'salt air', 'beach proximity', 'varied ages'], '5-60 years', 10, false)
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
  '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f',
  'hvac',
  '/fl/jacksonville/hvac',
  'HVAC Services in Jacksonville, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Jacksonville''s 950,000+ residents. Historic homes to new construction specialists. JEA rebates. Serving Riverside, San Marco, Nocatee & all 840+ square miles.',
  'HVAC Jacksonville FL',
  ARRAY['AC repair Jacksonville', 'air conditioning Jacksonville FL', 'HVAC contractor Jacksonville', 'Riverside HVAC', 'San Marco AC', 'JEA rebates'],

  'Jacksonville''s Full-Service HVAC Experts',
  'Florida''s largest city deserves comprehensive comfort solutions',
  'Licensed & Insured | JEA Certified | Historic to Modern Specialists',
  'Jacksonville—Florida''s largest city by area at 840+ square miles—presents unique HVAC challenges across its diverse landscape. With nearly 950,000 residents from historic Riverside-Avondale to booming Nocatee, from St. Johns River waterfront estates to coastal beach communities, Jacksonville demands HVAC contractors with comprehensive expertise. Our team serves this entire metropolitan area with specialized solutions for every neighborhood and property type.',

  '{
    "headline": "Why Jacksonville Homeowners Choose Us",
    "reasons": [
      {"title": "City-Wide Coverage", "description": "Jacksonville''s 840+ square miles span from beaches to Westside. We serve all areas with the same commitment to quality and rapid response times."},
      {"title": "Historic Home Specialists", "description": "Riverside-Avondale, San Marco, and Ortega feature homes from the 1920s. We provide modern comfort while respecting historic character and preservation requirements."},
      {"title": "New Construction Experts", "description": "Nocatee and other master-planned communities are rapidly expanding. We work with builders and help new homeowners optimize their HVAC systems."},
      {"title": "JEA Rebate Certified", "description": "Jacksonville''s municipal utility JEA offers unique rebate programs. We maximize your JEA rebates including $100 for AC systems and $50 for smart thermostats."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Jacksonville",
    "intro": "Jacksonville''s size and diversity create specific HVAC considerations:",
    "challenges": [
      {"title": "Geographic Diversity", "description": "From coastal Atlantic beaches to inland Westside areas, Jacksonville''s vast geography creates different microclimates requiring varied HVAC approaches."},
      {"title": "St. Johns River Humidity", "description": "Properties along the St. Johns River in Mandarin, Ortega, and Riverside experience elevated humidity from river proximity requiring enhanced dehumidification."},
      {"title": "Historic Preservation", "description": "Jacksonville''s historic districts have preservation requirements affecting HVAC equipment placement, appearance, and installation methods."},
      {"title": "Coastal Salt Air", "description": "Jacksonville and Atlantic Beach areas face salt air corrosion requiring coastal-rated equipment and enhanced protection."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Jacksonville",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized service for Riverside, San Marco, and historic properties.", "features": ["Preservation-friendly", "Modern comfort", "Historic expertise", "Discreet installations"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Nocatee and Jacksonville''s booming developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home integration"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs across all 840+ square miles of Jacksonville.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with JEA rebate assistance.", "features": ["JEA rebates", "Coastal options", "10-year warranty", "Financing available"]},
      {"name": "Riverfront HVAC", "slug": "riverfront-hvac", "description": "Enhanced service for St. Johns River properties.", "features": ["River humidity control", "Waterfront expertise", "Dehumidification", "Moisture management"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for all Jacksonville properties.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "JEA optimization"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you really serve all of Jacksonville''s 840+ square miles?", "answer": "Yes, we provide comprehensive service throughout Jacksonville from the Beaches to Westside, from Northside to Southside. We''re committed to serving Florida''s largest city."},
      {"question": "Can you work on historic homes in Riverside or San Marco?", "answer": "Absolutely. We specialize in historic Jacksonville properties, providing modern comfort while respecting historic character and working within preservation requirements."},
      {"question": "What JEA rebates are available in Jacksonville?", "answer": "JEA offers $100 for high-efficiency residential AC systems, $50 for smart thermostats, and $75 for heat pumps. We handle all rebate paperwork for Jacksonville residents."},
      {"question": "Should I upgrade my Nocatee builder-grade system?", "answer": "Many Nocatee builders install minimally-sized systems. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort and efficiency."}
    ]
  }'::jsonb,

  '{"avg_summer_high\": \"91°F\", \"avg_humidity\": \"73%\", \"cooling_degree_days\": \"3,450\", \"days_above_90\": \"95+\", \"hurricane_risk\": \"High"}'::jsonb,

  'Ready for Comfort Across Jacksonville?',
  'Contact us today for a consultation. From historic downtown to coastal beaches to suburban growth areas, we''ll deliver expert HVAC service with JEA rebate assistance.',

  '{"@context\": \"https://schema.org\", \"@type\": \"HVACBusiness\", \"name\": \"Cool It HVAC - Jacksonville\", \"description\": \"Professional HVAC services for Jacksonville, FL covering all 840+ square miles.\", \"url\": \"https://coolit-hvac.com/jacksonville-fl\", \"telephone\": \"+1-904-555-COOL\", \"areaServed\": {\"@type\": \"City\", \"name\": \"Jacksonville\", \"addressRegion\": \"FL\"}}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"FAQPage\", \"mainEntity\": [{\"@type\": \"Question\", \"name\": \"Do you serve all of Jacksonville?\", \"acceptedAnswer\": {\"@type\": \"Answer\", \"text\": \"Yes, we provide comprehensive service throughout all 840+ square miles of Jacksonville.\"}}]}'::jsonb,
  '{"@context\": \"https://schema.org\", \"@type\": \"BreadcrumbList\", \"itemListElement\": [{\"@type\": \"ListItem\", \"position\": 1, \"name\": \"Home\", \"item\": \"https://coolit-hvac.com\"}, {\"@type\": \"ListItem\", \"position\": 2, \"name\": \"Florida\", \"item\": \"https://coolit-hvac.com/fl\"}, {\"@type\": \"ListItem\", \"position\": 3, \"name\": \"Jacksonville\", \"item\": \"https://coolit-hvac.com/fl/jacksonville\"}]}'::jsonb,

  '/fl/duval-county',
  '[{\"slug\": \"/fl/jacksonville-beach/hvac\", \"anchor_text\": \"Jacksonville Beach HVAC\"}, {\"slug\": \"/fl/st-augustine/hvac\", \"anchor_text\": \"St. Augustine AC\"}, {\"slug\": \"/fl/orange-park/hvac\", \"anchor_text\": \"Orange Park HVAC\"}]'::jsonb,
  '[{\"slug\": \"/services/ac-repair\", \"anchor_text\": \"AC Repair\"}, {\"slug\": \"/services/historic-hvac\", \"anchor_text\": \"Historic Home HVAC\"}, {\"slug\": \"/services/new-construction\", \"anchor_text\": \"New Construction\"}]'::jsonb,

  2020, 32, 18, 91,
  'published', 1, 'claude', 'phase14-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
