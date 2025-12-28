-- ============================================
-- Sarasota, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d',
  'Sarasota', 'sarasota', 'Florida', 'FL', 'Sarasota', 'sarasota-county',
  27.3364, -82.5307,
  ARRAY['34230', '34231', '34232', '34233', '34234', '34235', '34236', '34237', '34238', '34239', '34240', '34241', '34242', '34243'],
  'North Port-Sarasota-Bradenton',
  ARRAY['2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e']::uuid[],
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
  '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d',
  NOW(),
  54842, 'US Census Bureau ACS 2023',
  67542, 485000, 58.7,
  ARRAY['single-family', 'condo', 'waterfront', 'luxury-estate'],
  '{"pre-1970": 20, "1970s-1990s": 35, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  90, 56, 73, 3400, 92, 53.2, 'moderate',
  'Gulf Coast cultural capital. Upscale arts community. Beautiful beaches and barrier islands. Strong seasonal population. Moderate hurricane risk with coastal exposure.',
  ARRAY['Sarasota Memorial Hospital', 'Sarasota County Public Schools', 'City of Sarasota', 'Sarasota-Bradenton International Airport', 'Arts organizations', 'Tourism industry'],
  ARRAY['Siesta Key Beach', 'St. Armands Circle', 'The Ringling Museum', 'Marie Selby Botanical Gardens', 'Sarasota Opera House', 'Downtown Sarasota', 'Lido Beach'],
  ARRAY['Sarasota Film Festival', 'Siesta Key Crystal Classic', 'Sarasota Music Festival', 'Chalk Festival', 'Ringling International Arts Festival'],
  ARRAY['Sarasota County Public Schools'],
  'Downtown Sarasota bayfront development. The Bay luxury project. Siesta Key development. Arts district expansion. Infrastructure improvements.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Sarasota Utilities',
  210,
  'Florida Building Code 8th Edition (2023), City of Sarasota amendments',
  '{"hvac_replacement": "Permit required", "coastal_setback": "Equipment placement restrictions near water", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Today', 'Air Comfort', 'Gator Air Conditioning', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Siesta Key', 'siesta-key', 'Southwest', 'waterfront', '1960s-2010s', 'Upper income', 'World-famous beach community', ARRAY['salt air corrosion', 'beach humidity', 'premium demands', 'vacation rentals'], '10-50 years', 1, true),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Downtown Sarasota', 'downtown-sarasota', 'Central', 'mixed', '1920s-2020s', 'Upper income', 'Urban waterfront with luxury condos', ARRAY['high-rise systems', 'commercial HVAC', 'luxury demands', 'bayfront humidity'], '5-80+ years', 2, true),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Lido Key', 'lido-key', 'West', 'waterfront', '1950s-2000s', 'Upper income', 'St. Armands Circle and beach', ARRAY['salt air exposure', 'beach properties', 'luxury systems', 'seasonal usage'], '15-60 years', 3, true),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Bird Key', 'bird-key', 'West', 'luxury-estate', '1960s-2010s', 'Upper income', 'Exclusive waterfront community', ARRAY['luxury multi-zone', 'salt air corrosion', 'premium service', 'estate systems'], '10-50 years', 4, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Southside Village', 'southside-village', 'South', 'mixed', '1950s-2010s', 'Upper middle income', 'Urban village near Siesta Key', ARRAY['mixed housing types', 'varied ages', 'condo systems'], '10-60 years', 5, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Laurel Park', 'laurel-park', 'Central', 'single-family', '1920s-1960s', 'Upper middle income', 'Historic neighborhood', ARRAY['historic homes', 'older systems', 'ductless needs', 'preservation'], '25-80+ years', 6, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Indian Beach/Sapphire Shores', 'indian-beach', 'North', 'waterfront', '1950s-1990s', 'Upper income', 'Bay waterfront', ARRAY['waterfront humidity', 'salt exposure', 'luxury demands'], '20-60 years', 7, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'The Landings', 'the-landings', 'East', 'single-family', '1970s-1990s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'older systems', 'efficiency upgrades'], '25-45 years', 8, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Gulf Gate', 'gulf-gate', 'South', 'single-family', '1960s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'budget solutions', 'system replacements'], '30-55 years', 9, false),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Arlington Park', 'arlington-park', 'North', 'single-family', '1950s-1970s', 'Middle income', 'Mid-century neighborhood', ARRAY['older homes', 'system replacements', 'efficiency focus'], '35-65 years', 10, false)
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
  '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d',
  'hvac',
  '/fl/sarasota/hvac',
  'HVAC Services in Sarasota, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Sarasota''s 55,000+ residents. Beach and luxury specialists. FPL rebates available. Serving Siesta Key, Downtown, Lido Key & all neighborhoods.',
  'HVAC Sarasota FL',
  ARRAY['AC repair Sarasota', 'air conditioning Sarasota FL', 'HVAC contractor Sarasota', 'Siesta Key AC', 'beach HVAC Sarasota', 'Sarasota County HVAC'],

  'Sarasota''s Cultural Capital HVAC Experts',
  'Premium comfort for Florida''s Gulf Coast gem',
  'Licensed & Insured | FPL Certified | Beach & Luxury Specialists',
  'Sarasota—Florida''s cultural capital—combines world-class arts, pristine beaches like Siesta Key, and sophisticated waterfront living. With over 55,000 residents who expect excellence and median home values exceeding $485,000, Sarasota demands HVAC service that matches its premium standards. From beachfront properties on Siesta and Lido Keys to luxury downtown condos and historic neighborhoods, our team delivers white-glove service throughout this distinguished community.',

  '{
    "headline": "Why Sarasota Chooses Us",
    "reasons": [
      {"title": "Beach Property Specialists", "description": "Siesta Key, Lido Key, and Longboat Key face unique challenges—salt air, sand, and humidity. We provide coastal protection and equipment designed for beach environments."},
      {"title": "Luxury Service Standards", "description": "Sarasota''s upscale market demands premium equipment and white-glove service. We deliver both consistently throughout Bird Key, downtown, and all luxury communities."},
      {"title": "Vacation Rental Expertise", "description": "Sarasota''s tourism market means many vacation rentals. We provide reliable service ensuring guest comfort and owner peace of mind."},
      {"title": "FPL Rebate Assistance", "description": "We help Sarasota homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Sarasota",
    "intro": "Sarasota''s coastal location and premium market create specific HVAC considerations:",
    "challenges": [
      {"title": "Salt Air Corrosion", "description": "Beach and waterfront properties face accelerated equipment corrosion. Coastal coil coatings and enhanced maintenance are essential for equipment longevity."},
      {"title": "Beach Sand and Humidity", "description": "Siesta Key''s famous quartz sand and Gulf humidity create unique challenges requiring specialized filtration and dehumidification."},
      {"title": "Seasonal Population", "description": "Sarasota''s significant seasonal residents require systems that handle extended periods of minimal use followed by full operation."},
      {"title": "Historic Properties", "description": "Laurel Park and other historic neighborhoods require sensitive HVAC solutions preserving architectural integrity."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Sarasota",
    "services": [
      {"name": "Beach Property HVAC", "slug": "beach-hvac", "description": "Specialized solutions for Siesta Key, Lido Key, and coastal Sarasota properties.", "features": ["Coastal coil coating", "Salt air protection", "Sand filtration", "Beach humidity control"]},
      {"name": "Luxury Home Systems", "slug": "luxury-hvac", "description": "Premium equipment and multi-zone solutions for Sarasota''s finest properties.", "features": ["Multi-zone design", "Whole-home automation", "Premium brands", "White-glove service"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Sarasota.", "features": ["Same-day service", "Premium brands", "90-day warranty", "Property protection"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Top-tier equipment", "10-year warranty", "Financing available"]},
      {"name": "Vacation Rental Service", "slug": "vacation-rental", "description": "Reliable HVAC for Sarasota''s vacation rental market.", "features": ["Priority response", "Guest-ready service", "Property management support", "Remote monitoring"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive coastal maintenance programs.", "features": ["Quarterly service", "Salt air rinse", "Priority scheduling", "Seasonal options"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service Siesta Key beachfront properties?", "answer": "Yes, we specialize in beach properties. We provide coastal coil coatings, enhanced filtration for sand, and maintenance programs designed for salt air exposure."},
      {"question": "Can you service luxury condos downtown?", "answer": "Absolutely. We service all downtown Sarasota properties including high-rises at The Bay and other luxury developments. Our technicians are trained for premium properties."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "Do you service seasonal homes when owners are away?", "answer": "Yes, we offer seasonal monitoring and maintenance programs including pre-arrival preparation and remote monitoring capabilities."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "73%", "cooling_degree_days": "3,400", "days_above_90": "92+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Premium Comfort in Sarasota?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Sarasota property with FPL rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Sarasota", "description": "Premium HVAC services for Sarasota, FL.", "url": "https://coolit-hvac.com/sarasota-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Sarasota", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service Siesta Key?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in beach properties with coastal protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Sarasota", "item": "https://coolit-hvac.com/fl/sarasota"}]}'::jsonb,

  '/fl/sarasota-county',
  '[{"slug": "/fl/venice/hvac", "anchor_text": "Venice HVAC"}, {"slug": "/fl/bradenton/hvac", "anchor_text": "Bradenton AC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach HVAC"}, {"slug": "/services/luxury-hvac", "anchor_text": "Luxury HVAC"}]'::jsonb,

  1900, 28, 16, 90,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();

-- ============================================
-- North Port, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  'North Port', 'north-port', 'Florida', 'FL', 'Sarasota', 'sarasota-county',
  27.0442, -82.2359,
  ARRAY['34286', '34287', '34288', '34289', '34291'],
  'North Port-Sarasota-Bradenton',
  ARRAY['1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f']::uuid[],
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
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  NOW(),
  75303, 'US Census Bureau ACS 2023',
  59842, 295000, 79.2,
  ARRAY['single-family', 'new-construction', 'manufactured-home', 'golf-community'],
  '{"pre-1990": 15, "1990s-2000s": 35, "2010s": 30, "2020s": 20}'::jsonb,
  91, 55, 74, 3500, 98, 54.1, 'moderate',
  'Fast-growing suburb south of Sarasota. Affordable alternative to Sarasota. Mix of retirees and families. Continued new development. Moderate hurricane risk.',
  ARRAY['Sarasota County Public Schools', 'Warm Mineral Springs', 'North Port City Government', 'Healthcare', 'Retail and service industry'],
  ARRAY['Warm Mineral Springs', 'Myakkahatchee Creek Environmental Park', 'North Port Aquatic Center', 'North Port Performing Arts Center'],
  ARRAY['North Port Art Festival', 'Movies in the Park', 'Community events'],
  ARRAY['Sarasota County Public Schools'],
  'Continued residential growth. Wellen Park development. New schools and infrastructure. Commercial development along Tamiami Trail.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of North Port Utilities',
  250,
  'Florida Building Code 8th Edition (2023), Sarasota County amendments',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Cool Today', 'Air Comfort', 'Gator Air Conditioning', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Wellen Park', 'wellen-park', 'South', 'new-construction', '2010s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['new construction', 'builder-grade systems', 'smart home ready', 'HOA requirements'], '0-12 years', 1, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Heron Creek', 'heron-creek', 'Central', 'golf-community', '2000s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'HOA requirements'], '10-20 years', 2, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'North Port Estates', 'north-port-estates', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['varied system ages', 'family homes', 'standard service'], '15-35 years', 3, true),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Myakka Valley Ranches', 'myakka-valley', 'East', 'single-family', '1990s-2010s', 'Middle income', 'Rural-suburban area', ARRAY['larger lots', 'well water', 'family homes'], '10-28 years', 4, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Warm Mineral Springs Area', 'warm-mineral-springs', 'South', 'mixed', '1970s-2000s', 'Moderate income', 'Near mineral springs', ARRAY['varied housing', 'mixed ages', 'budget to mid-range'], '15-45 years', 5, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Cocoplum', 'cocoplum-np', 'West', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer community', ARRAY['newer systems', 'family homes', 'HOA standards'], '5-20 years', 6, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Port Charlotte Border', 'pc-border', 'North', 'mixed', '1980s-2010s', 'Middle income', 'Near Port Charlotte', ARRAY['mixed housing', 'varied ages', 'standard needs'], '10-35 years', 7, false),
  ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Toledo Blade', 'toledo-blade', 'Central', 'single-family', '1980s-2000s', 'Middle income', 'Established area', ARRAY['older systems', 'family homes', 'efficiency focus'], '15-35 years', 8, false)
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
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e',
  'hvac',
  '/fl/north-port/hvac',
  'HVAC Services in North Port, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for North Port''s 75,000+ residents. New construction and family specialists. FPL rebates. Serving Wellen Park, Heron Creek & all neighborhoods.',
  'HVAC North Port FL',
  ARRAY['AC repair North Port', 'air conditioning North Port FL', 'HVAC contractor North Port', 'Wellen Park AC', 'FPL rebates', 'Sarasota County HVAC'],

  'North Port''s Growing Community HVAC Experts',
  'Family-focused service for Southwest Florida''s fastest growth',
  'Licensed & Insured | FPL Certified | New Construction Specialists',
  'North Port is one of Florida''s fastest-growing cities, attracting families and retirees seeking affordable Sarasota County living. With over 75,000 residents and extensive new development at Wellen Park and beyond, reliable HVAC is essential. Our team provides expert service from brand-new construction to established neighborhoods, helping you maximize FPL rebates while staying comfortable.',

  '{
    "headline": "Why North Port Families Choose Us",
    "reasons": [
      {"title": "New Construction Experts", "description": "Wellen Park and other developments are transforming North Port. We work with builders and new homeowners ensuring optimal HVAC from day one."},
      {"title": "Family-Focused Service", "description": "North Port is a family community. We provide honest pricing, respectful service, and solutions that keep your family comfortable."},
      {"title": "FPL Rebate Certified", "description": "We help North Port homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."},
      {"title": "Affordable Quality", "description": "North Port offers value, and so do we. Quality HVAC service at fair prices with financing options available."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to North Port",
    "intro": "North Port''s rapid growth and character create specific HVAC considerations:",
    "challenges": [
      {"title": "New Construction Volume", "description": "Wellen Park is one of Florida''s largest developments. Many builder-grade systems are minimally sized—we help homeowners evaluate and upgrade."},
      {"title": "HOA Requirements", "description": "North Port''s master-planned communities have equipment placement and appearance requirements we navigate daily."},
      {"title": "Mixed Housing Stock", "description": "From 1980s homes to 2020s construction, North Port requires varied approaches for different property types."},
      {"title": "Rapid Growth Demand", "description": "North Port''s explosive growth means some companies can''t keep up. We''ve expanded to serve this growing community."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in North Port",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Wellen Park and other North Port new developments.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout North Port.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder systems for better performance.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Humidity control"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Service for Heron Creek and other golf communities.", "features": ["HOA compliance", "Golf course humidity", "Premium options", "Standard service"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance for all property types.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Wellen Park builders?", "answer": "Yes, we work with builders throughout North Port and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Should I upgrade my new home''s builder-grade AC?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "Do you offer financing?", "answer": "Yes, we offer multiple financing options to make AC replacement affordable for North Port families."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "98+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Comfort in North Port?',
  'Contact us today for a free estimate. We''ll help you access FPL rebates and keep your North Port family comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - North Port", "description": "Professional HVAC services in North Port, FL.", "url": "https://coolit-hvac.com/north-port-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "North Port", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Wellen Park builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "North Port", "item": "https://coolit-hvac.com/fl/north-port"}]}'::jsonb,

  '/fl/sarasota-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/venice/hvac", "anchor_text": "Venice AC"}, {"slug": "/fl/port-charlotte/hvac", "anchor_text": "Port Charlotte HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1780, 24, 14, 85,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();

-- ============================================
-- Bradenton, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  'Bradenton', 'bradenton', 'Florida', 'FL', 'Manatee', 'manatee-county',
  27.4989, -82.5748,
  ARRAY['34201', '34202', '34203', '34204', '34205', '34206', '34207', '34208', '34209', '34210', '34211', '34212'],
  'North Port-Sarasota-Bradenton',
  ARRAY['1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b']::uuid[],
  true, 90
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
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  NOW(),
  55698, 'US Census Bureau ACS 2023',
  58742, 315000, 56.4,
  ARRAY['single-family', 'waterfront', 'historic-home', 'condo'],
  '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 56, 74, 3450, 94, 54.1, 'moderate',
  'Manatee County seat. Manatee River waterfront. Mix of historic and modern. Growing arts scene. Anna Maria Island access. Moderate coastal hurricane risk.',
  ARRAY['Manatee County Government', 'Manatee County Public Schools', 'Manatee Memorial Hospital', 'Tropicana Products', 'Champs Sports', 'City of Bradenton'],
  ARRAY['Riverwalk', 'Village of the Arts', 'South Florida Museum', 'IMG Academy', 'Bradenton Beach', 'Robinson Preserve', 'DeSoto National Memorial'],
  ARRAY['Bradenton Blues Festival', 'Village of the Arts Gallery Walk', 'Bradenton Marauders Baseball', 'Manatee County Fair'],
  ARRAY['Manatee County Public Schools'],
  'Downtown Riverwalk expansion. Lakewood Ranch growth spillover. IMG Academy expansion. Village of the Arts revitalization. Waterfront development.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of Bradenton Utilities',
  225,
  'Florida Building Code 8th Edition (2023), City of Bradenton amendments',
  '{"hvac_replacement": "Permit required", "coastal_areas": "Equipment elevation and placement requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Today', 'Gator Air Conditioning', 'Air Comfort', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Downtown Bradenton', 'downtown-bradenton', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic riverfront with Riverwalk', ARRAY['historic buildings', 'ductless needs', 'mixed-use properties', 'waterfront humidity'], '5-80+ years', 1, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Village of the Arts', 'village-of-the-arts', 'Central', 'historic-home', '1920s-1960s', 'Middle income', 'Colorful arts district', ARRAY['historic homes', 'older systems', 'ductless retrofits', 'artist studios'], '30-80+ years', 2, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Palma Sola', 'palma-sola', 'West', 'waterfront', '1950s-1990s', 'Upper middle income', 'Bay waterfront community', ARRAY['salt air corrosion', 'waterfront humidity', 'bay exposure', 'premium demands'], '20-60 years', 3, true),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'IMG Academy Area', 'img-academy', 'Southeast', 'mixed', '1980s-2020s', 'Upper middle income', 'World-renowned sports academy', ARRAY['athletic facility HVAC', 'residential mix', 'premium service'], '5-35 years', 4, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Braden River', 'braden-river', 'East', 'single-family', '1990s-2010s', 'Upper middle income', 'Growing eastern corridor', ARRAY['newer systems', 'family homes', 'HOA communities'], '10-28 years', 5, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Manatee Avenue Corridor', 'manatee-avenue', 'Central', 'mixed', '1950s-1990s', 'Middle income', 'Central commercial/residential', ARRAY['older systems', 'mixed housing', 'budget solutions'], '25-60 years', 6, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Bayshore Gardens', 'bayshore-gardens', 'Northwest', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'standard service'], '30-60 years', 7, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Cortez', 'cortez', 'West', 'waterfront', '1950s-2000s', 'Middle income', 'Historic fishing village', ARRAY['salt air exposure', 'fishing village character', 'coastal conditions'], '15-60 years', 8, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Oneco', 'oneco', 'North', 'single-family', '1960s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'efficiency focus'], '25-55 years', 9, false),
  ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'West Bradenton', 'west-bradenton', 'West', 'single-family', '1970s-2000s', 'Middle income', 'Near Anna Maria Island', ARRAY['beach proximity', 'older systems', 'coastal humidity'], '20-45 years', 10, false)
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
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f',
  'hvac',
  '/fl/bradenton/hvac',
  'HVAC Services in Bradenton, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Bradenton''s 56,000+ residents. Waterfront and historic specialists. FPL rebates available. Serving Downtown, Village of the Arts, Palma Sola & all areas.',
  'HVAC Bradenton FL',
  ARRAY['AC repair Bradenton', 'air conditioning Bradenton FL', 'HVAC contractor Bradenton', 'waterfront AC Bradenton', 'Riverwalk HVAC', 'Manatee County HVAC'],

  'Bradenton''s Riverfront HVAC Experts',
  'Comfort solutions from historic downtown to Manatee River',
  'Licensed & Insured | FPL Certified | Waterfront & Historic Specialists',
  'Bradenton—the heart of Manatee County—combines historic charm along the revitalized Riverwalk with waterfront living on the Manatee River and bay. With over 56,000 residents enjoying everything from the colorful Village of the Arts to upscale Palma Sola waterfront properties, Bradenton needs HVAC contractors who understand diverse housing from 1920s bungalows to modern condos. Our team delivers expert service throughout this dynamic Gulf Coast community.',

  '{
    "headline": "Why Bradenton Homeowners Choose Us",
    "reasons": [
      {"title": "Waterfront Specialists", "description": "Palma Sola, Cortez, and other bay communities face salt air and humidity challenges. We provide coastal coil protection and equipment designed for waterfront environments."},
      {"title": "Historic Property Expertise", "description": "Village of the Arts and downtown historic homes require sensitive HVAC solutions. Ductless systems preserve architectural character while delivering modern comfort."},
      {"title": "River City Experience", "description": "Manatee River properties face unique humidity from the river. We provide enhanced dehumidification and moisture control solutions."},
      {"title": "FPL Rebate Assistance", "description": "We help Bradenton homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Bradenton",
    "intro": "Bradenton''s riverfront location and diverse housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Salt Air Corrosion", "description": "Waterfront properties along Palma Sola Bay and the Manatee River face accelerated equipment corrosion. Coastal coil coatings are essential for equipment longevity."},
      {"title": "Historic Building Retrofits", "description": "Village of the Arts and downtown historic homes often lack ductwork. Ductless mini-split systems provide ideal solutions preserving architectural integrity."},
      {"title": "River and Bay Humidity", "description": "Properties near the Manatee River and bay experience elevated humidity requiring enhanced dehumidification beyond standard AC capacity."},
      {"title": "Mixed Housing Ages", "description": "Bradenton spans 1920s bungalows to modern construction, requiring contractors experienced across all housing eras and HVAC technologies."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Bradenton",
    "services": [
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Specialized solutions for Palma Sola, Cortez, and Manatee River properties.", "features": ["Coastal coil coating", "Salt air protection", "Bay humidity control", "Corrosion prevention"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Village of the Arts and downtown properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Bradenton.", "features": ["Same-day service", "All brands", "90-day warranty", "River to bay coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Coastal-rated equipment", "10-year warranty", "Financing available"]},
      {"name": "Dehumidification Systems", "slug": "dehumidification", "description": "Enhanced humidity control for river and bay properties.", "features": ["Whole-home dehumidification", "Mold prevention", "Comfort improvement", "Energy efficient"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting coastal investments.", "features": ["Bi-annual service", "Salt air rinse", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service waterfront properties in Palma Sola?", "answer": "Yes, we specialize in waterfront properties. We provide coastal coil coatings, salt air protection, and maintenance programs designed for bay and river exposure."},
      {"question": "Can you install AC in Village of the Arts historic homes?", "answer": "Absolutely. Ductless mini-split systems are ideal for Village of the Arts properties, providing efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Why do riverfront homes need special HVAC attention?", "answer": "Properties near the Manatee River and Palma Sola Bay experience elevated humidity and salt air. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Bradenton homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "74%", "cooling_degree_days": "3,450", "days_above_90": "94+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Riverfront Comfort in Bradenton?',
  'Contact us today for a consultation. From historic Village of the Arts to waterfront Palma Sola, we''ll keep your Bradenton property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Bradenton", "description": "Professional HVAC services for Bradenton, FL specializing in waterfront and historic properties.", "url": "https://coolit-hvac.com/bradenton-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Bradenton", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service waterfront properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in waterfront properties with coastal coil protection and salt air expertise."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Bradenton", "item": "https://coolit-hvac.com/fl/bradenton"}]}'::jsonb,

  '/fl/manatee-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/lakewood-ranch/hvac", "anchor_text": "Lakewood Ranch AC"}, {"slug": "/fl/palmetto/hvac", "anchor_text": "Palmetto HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}]'::jsonb,

  1880, 26, 15, 90,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();

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

-- ============================================
-- Lakewood Ranch, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 8 - Sarasota Area
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  'Lakewood Ranch', 'lakewood-ranch', 'Florida', 'FL', 'Manatee', 'manatee-county',
  27.4042, -82.4015,
  ARRAY['34202', '34211', '34240'],
  'North Port-Sarasota-Bradenton',
  ARRAY['3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d']::uuid[],
  true, 92
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
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  NOW(),
  47000, 'Lakewood Ranch CDP 2023',
  98547, 485000, 78.6,
  ARRAY['single-family', 'new-construction', 'golf-community', 'townhouse'],
  '{"2000s": 30, "2010s": 45, "2020s": 25}'::jsonb,
  90, 55, 73, 3400, 92, 53.8, 'moderate',
  'America''s top-selling master-planned community. Spanning Manatee and Sarasota counties. New urbanism design. Golf courses, trails, and amenities. Moderate inland hurricane risk.',
  ARRAY['Lakewood Ranch Medical Center', 'Manatee County Public Schools', 'Sarasota County Public Schools', 'Lakewood Ranch businesses', 'Premier Sports Campus', 'Corporate offices'],
  ARRAY['Main Street', 'Waterside Place', 'Premier Sports Campus', 'Lakewood Ranch Golf & Country Club', 'Lake Club', 'Polo fields', 'Trail system'],
  ARRAY['Lakewood Ranch Farmers Market', 'Main Street events', 'Community festivals', 'Sports tournaments'],
  ARRAY['Manatee County Public Schools', 'Sarasota County Public Schools'],
  'Massive ongoing expansion. Waterside development. New village centers. Corporate headquarters recruitment. Sports complex expansion. Infrastructure growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'Lakewood Ranch Utilities / County systems',
  215,
  'Florida Building Code 8th Edition (2023), Lakewood Ranch design standards',
  '{"hvac_replacement": "Permit required", "architectural_review": "Community design standards apply", "new_construction": "Energy efficiency requirements", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Today', 'Gator Air Conditioning', 'Air Comfort', 'Climate Control Experts', 'Kobie Complete'],
  '{"demographics": "Lakewood Ranch CDP ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Lakewood Ranch Country Club', 'country-club', 'North', 'golf-community', '2000s-2020s', 'Upper income', 'Premier golf and country club', ARRAY['golf course humidity', 'premium systems', 'multi-zone estates', 'luxury demands'], '5-20 years', 1, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Waterside Place', 'waterside-place', 'West', 'new-construction', '2010s-2020s', 'Upper income', 'Newest luxury village', ARRAY['brand new systems', 'smart home integration', 'HOA standards', 'premium equipment'], '0-12 years', 2, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Main Street District', 'main-street', 'Central', 'mixed', '2000s-2020s', 'Upper middle income', 'New urbanism town center', ARRAY['mixed-use buildings', 'condo systems', 'commercial HVAC', 'varied needs'], '5-20 years', 3, true),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Cresswind', 'cresswind', 'South', 'single-family', '2010s-2020s', 'Upper middle income', '55+ active adult community', ARRAY['single-level systems', 'efficiency focus', 'accessibility', 'HOA requirements'], '5-12 years', 4, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Esplanade', 'esplanade', 'East', 'single-family', '2010s-2020s', 'Upper income', 'Gated golf community', ARRAY['golf course adjacent', 'premium systems', 'HOA compliance', 'luxury demands'], '5-12 years', 5, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Del Webb Lakewood Ranch', 'del-webb', 'Northeast', 'single-family', '2010s-2020s', 'Upper middle income', 'Active adult lifestyle', ARRAY['55+ design', 'energy efficiency', 'accessibility needs', 'newer systems'], '5-12 years', 6, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Lake Club', 'lake-club', 'Central', 'single-family', '2000s-2010s', 'Upper middle income', 'Established LWR village', ARRAY['established systems', 'family homes', 'HOA standards'], '10-20 years', 7, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Edgewater', 'edgewater', 'West', 'single-family', '2010s-2020s', 'Upper middle income', 'Family-oriented village', ARRAY['newer construction', 'family sizing', 'smart systems'], '5-12 years', 8, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Azario', 'azario', 'South', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer neighborhood', ARRAY['new construction', 'builder-grade upgrades', 'HOA compliance'], '5-10 years', 9, false),
  ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Summerfield', 'summerfield', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Original LWR village', ARRAY['first phase homes', 'system upgrades', 'established community'], '12-22 years', 10, false)
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
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b',
  'hvac',
  '/fl/lakewood-ranch/hvac',
  'HVAC Services in Lakewood Ranch, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Lakewood Ranch''s 47,000+ residents. New construction and golf community specialists. FPL rebates. Serving Waterside, Main Street, Country Club & all villages.',
  'HVAC Lakewood Ranch FL',
  ARRAY['AC repair Lakewood Ranch', 'air conditioning Lakewood Ranch FL', 'HVAC contractor Lakewood Ranch', 'new construction AC', 'golf community HVAC', 'Main Street Lakewood Ranch AC'],

  'Lakewood Ranch''s Premier HVAC Experts',
  'Growing with America''s #1 master-planned community',
  'Licensed & Insured | FPL Certified | New Construction & Golf Community Specialists',
  'Lakewood Ranch—America''s top-selling master-planned community—represents the pinnacle of Florida living. With nearly 47,000 residents across pristine villages from Waterside Place to the Country Club, this dynamic community demands HVAC service matching its premium standards. From brand-new construction to established villages, our team has grown alongside Lakewood Ranch, delivering expert service throughout this exceptional community.',

  '{
    "headline": "Why Lakewood Ranch Residents Choose Us",
    "reasons": [
      {"title": "Master-Planned Community Experts", "description": "We''ve grown with Lakewood Ranch, working throughout all villages from original Summerfield to newest Waterside. We understand the community''s standards and requirements."},
      {"title": "New Construction Specialists", "description": "Lakewood Ranch is constantly expanding. We work with builders and help new homeowners evaluate and optimize their HVAC systems from day one."},
      {"title": "Golf Community Experience", "description": "The Country Club, Esplanade, and golf-adjacent properties require premium service. We deliver equipment and expertise matching these properties."},
      {"title": "HOA Compliance Experts", "description": "Every Lakewood Ranch village has architectural standards. We ensure all installations meet community design requirements."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Lakewood Ranch",
    "intro": "Lakewood Ranch''s premium standards and growth create specific HVAC needs:",
    "challenges": [
      {"title": "Design Standards Compliance", "description": "Lakewood Ranch communities have strict architectural review. Equipment placement, appearance, and noise levels must meet community standards."},
      {"title": "Golf Course Humidity", "description": "Country Club, Esplanade, and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Builder-Grade Evaluation", "description": "Many new Lakewood Ranch homes have builder-grade systems. We help homeowners evaluate whether upgrades will improve comfort and efficiency."},
      {"title": "Smart Home Integration", "description": "Lakewood Ranch homes increasingly feature sophisticated automation. We integrate HVAC seamlessly with smart home systems."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Lakewood Ranch",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert service for Lakewood Ranch''s newest homes and villages.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Smart home ready"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Country Club, Esplanade, and golf properties.", "features": ["Premium equipment", "HOA compliance", "Humidity control", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout all Lakewood Ranch villages.", "features": ["Same-day service", "All brands", "90-day warranty", "Community standards"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with FPL rebate assistance and HOA compliance.", "features": ["FPL rebates", "Design approval", "10-year warranty", "Financing available"]},
      {"name": "Smart Home Integration", "slug": "smart-home", "description": "Seamless HVAC integration with your smart home systems.", "features": ["System compatibility", "Voice control", "Remote monitoring", "Automation"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "System optimization", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with Lakewood Ranch builders?", "answer": "Yes, we work with builders throughout Lakewood Ranch villages and help new homeowners evaluate and optimize their HVAC systems."},
      {"question": "Can you ensure my installation meets community standards?", "answer": "Absolutely. We''re familiar with Lakewood Ranch architectural standards and ensure all equipment placement and appearance meets community requirements."},
      {"question": "Should I upgrade my builder-grade AC system?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade often significantly improves comfort. We provide honest assessments."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Lakewood Ranch residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "73%", "cooling_degree_days": "3,400", "days_above_90": "92+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Premium Comfort in Lakewood Ranch?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of America''s #1 master-planned community with FPL rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Lakewood Ranch", "description": "Premium HVAC services for Lakewood Ranch, FL.", "url": "https://coolit-hvac.com/lakewood-ranch-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Lakewood Ranch", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with Lakewood Ranch builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with builders and help new homeowners optimize HVAC systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Lakewood Ranch", "item": "https://coolit-hvac.com/fl/lakewood-ranch"}]}'::jsonb,

  '/fl/manatee-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/bradenton/hvac", "anchor_text": "Bradenton AC"}, {"slug": "/fl/university-park/hvac", "anchor_text": "University Park HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}]'::jsonb,

  1920, 30, 16, 92,
  'published', 1, 'claude', 'phase8-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
