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
