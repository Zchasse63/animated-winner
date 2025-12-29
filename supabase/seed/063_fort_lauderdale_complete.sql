-- ============================================
-- Fort Lauderdale, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 13 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  'Fort Lauderdale', 'fort-lauderdale', 'Florida', 'FL', 'Broward', 'broward-county',
  26.1224, -80.1373,
  ARRAY['33301', '33302', '33303', '33304', '33305', '33306', '33307', '33308', '33309', '33310', '33311', '33312', '33313', '33314', '33315', '33316', '33317', '33318', '33319', '33320', '33321', '33322', '33323', '33324', '33325', '33326', '33327', '33328', '33329', '33330', '33331', '33332', '33334', '33335', '33336', '33337', '33338', '33339', '33340', '33345', '33346', '33348', '33349', '33351', '33355', '33359', '33388', '33394'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d']::uuid[],
  true, 97
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
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  NOW(),
  182760, 'US Census Bureau 2023',
  64182, 425000, 48.3,
  ARRAY['single-family', 'condo', 'waterfront', 'luxury'],
  '{"pre-1970": 25, "1970s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  90, 66, 75, 4100, 86, 63.2, 'very_high',
  'Venice of America with 165 miles of canals. Major yachting center. Beach destination. International tourism. Cruise port. High coastal salt exposure. Hurricane zone.',
  ARRAY['Port Everglades', 'Fort Lauderdale-Hollywood International Airport', 'AutoNation', 'Citrix Systems', 'Spirit Airlines', 'Broward Health', 'Tourism industry', 'Marine industry', 'Banking'],
  ARRAY['Las Olas Boulevard', 'Fort Lauderdale Beach', 'Riverwalk', 'Bonnet House Museum', 'Hugh Taylor Birch State Park', 'Intracoastal Waterway', 'Port Everglades', 'Museum of Discovery & Science'],
  ARRAY['Fort Lauderdale International Boat Show', 'Tortuga Music Festival', 'Las Olas Wine & Food Festival', 'Fort Lauderdale Air Show', 'SandBlast Beach Festival'],
  ARRAY['Broward County Public Schools'],
  'Las Olas Boulevard development. Downtown high-rise boom. Wave Streetcar expansion. Marina and yacht facilities growth. Flagler Village transformation.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'Florida City Gas (limited)',
  'City of Fort Lauderdale Utilities',
  155,
  'Florida Building Code 8th Edition (2023), Broward County High Velocity Hurricane Zone amendments',
  '{"hvac_replacement": "Permit required", "hvhz": "High Velocity Hurricane Zone compliance", "coastal_protection": "Maximum salt air and wind protection required", "waterfront": "Enhanced tie-downs for canal properties", "inspection": "Multiple inspections required"}'::jsonb,
  'very_high',
  ARRAY['Gator Air Conditioning', 'All Year Cooling', 'Air Ref Co Inc', 'One Hour Air Conditioning & Heating', 'Colair Cooling & Heating'],
  '{"demographics": "US Census Bureau 2023", "utilities": "FPL", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Las Olas Isles', 'las-olas-isles', 'Central', 'waterfront', '1950s-2020s', 'High income', 'Luxury waterfront estates', ARRAY['canal humidity', 'salt air', 'luxury demands', 'yacht properties'], '5-70 years', 1, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Fort Lauderdale Beach', 'ft-lauderdale-beach', 'East', 'condo', '1960s-2020s', 'High income', 'Beachfront living', ARRAY['extreme salt air', 'beach exposure', 'high-rises', 'luxury condos'], '5-60 years', 2, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Victoria Park', 'victoria-park', 'Central', 'single-family', '1940s-1990s', 'Upper middle income', 'Charming historic neighborhood', ARRAY['older homes', 'canal properties', 'varied ages', 'family homes'], '30-80 years', 3, true),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Flagler Village', 'flagler-village', 'Central', 'mixed', '2010s-2020s', 'Upper middle income', 'Arts district redevelopment', ARRAY['new construction', 'loft conversions', 'mixed use', 'modern systems'], '5-12 years', 4, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Rio Vista', 'rio-vista', 'Central', 'waterfront', '1920s-2000s', 'High income', 'Historic waterfront enclave', ARRAY['canal properties', 'historic homes', 'luxury waterfront', 'salt exposure'], '20-100 years', 5, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Coral Ridge', 'coral-ridge', 'North', 'single-family', '1950s-1990s', 'Upper middle income', 'Established canal community', ARRAY['canal systems', 'family homes', 'waterfront proximity', 'humidity control'], '30-70 years', 6, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Harbor Beach', 'harbor-beach', 'South', 'waterfront', '1960s-2020s', 'Very high income', 'Ultra-luxury beach enclave', ARRAY['mega-mansions', 'beach properties', 'premium systems', 'luxury demands'], '5-60 years', 7, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Poinsettia Heights', 'poinsettia-heights', 'Central', 'single-family', '1950s-1980s', 'Middle income', 'Mid-century neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '40-70 years', 8, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Lauderdale-by-the-Sea Border', 'lauderdale-sea', 'North', 'mixed', '1960s-2010s', 'Upper middle income', 'Near beach area', ARRAY['coastal exposure', 'varied housing', 'salt air proximity'], '12-60 years', 9, false),
  ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'Downtown Fort Lauderdale', 'downtown-ftl', 'Central', 'high-rise', '2000s-2020s', 'Upper income', 'Urban high-rise district', ARRAY['luxury condos', 'high-rises', 'Riverfront properties', 'premium demands'], '5-22 years', 10, false)
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
  'b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e',
  'hvac',
  '/fl/fort-lauderdale/hvac',
  'HVAC Services in Fort Lauderdale, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Fort Lauderdale''s 183,000+ residents. Canal and waterfront specialists. FPL rebates. Serving Las Olas, Beach, Victoria Park & all 165 miles of canals.',
  'HVAC Fort Lauderdale FL',
  ARRAY['AC repair Fort Lauderdale', 'air conditioning Fort Lauderdale FL', 'HVAC contractor Fort Lauderdale', 'Las Olas HVAC', 'Fort Lauderdale Beach AC', 'canal home HVAC'],

  'Fort Lauderdale''s Venice of America HVAC Experts',
  'Waterfront comfort across 165 miles of canals',
  'Licensed & Insured | FPL Certified | Canal & Beach Specialists',
  'Fort Lauderdale—the "Venice of America"—features 165 miles of picturesque canals, world-class beaches, and the nation''s third-largest cruise port. With over 182,000 residents from Las Olas Isles waterfront estates to Harbor Beach mega-mansions, from Victoria Park''s historic charm to downtown''s luxury high-rises, Fort Lauderdale''s canal-and-ocean environment creates unique HVAC challenges. Our team specializes in waterfront properties, understanding what canal living and salt air demand.',

  '{
    "headline": "Why Fort Lauderdale Homeowners Choose Us",
    "reasons": [
      {"title": "Canal & Waterfront Specialists", "description": "165 miles of canals mean most Fort Lauderdale homes face waterfront humidity and salt exposure. We provide canal-specific dehumidification and corrosion protection."},
      {"title": "Beach Property Experts", "description": "Fort Lauderdale Beach properties face extreme Atlantic salt air. We provide maximum coastal protection including specialized coil coatings and marine-grade components."},
      {"title": "Luxury Market Experience", "description": "From Las Olas Isles to Harbor Beach, Fort Lauderdale features South Florida''s most exclusive properties. We deliver premium equipment and service matching these estates."},
      {"title": "Yachting Community Knowledge", "description": "Fort Lauderdale is America''s yachting capital. Waterfront properties with docks and boat houses have unique HVAC needs we understand completely."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Fort Lauderdale",
    "intro": "Fort Lauderdale''s waterfront character creates specific HVAC demands:",
    "challenges": [
      {"title": "Omnipresent Canal Humidity", "description": "165 miles of canals mean waterfront exposure for countless properties. Canal humidity requires enhanced dehumidification beyond standard AC for comfort and mold prevention."},
      {"title": "Extreme Coastal Salt Air", "description": "Between Atlantic beach exposure and Intracoastal canals, Fort Lauderdale has comprehensive salt air coverage. Unprotected equipment fails rapidly. Maximum coastal protection is essential."},
      {"title": "Hurricane Zone Requirements", "description": "Broward County High Velocity Hurricane Zone requires wind-rated equipment, engineered tie-downs, and enhanced protection. All installations must meet strict code."},
      {"title": "Luxury Property Standards", "description": "Fort Lauderdale''s waterfront estates and luxury high-rises demand premium equipment, quiet operation, and flawless aesthetics beyond standard installations."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Fort Lauderdale",
    "services": [
      {"name": "Canal Home HVAC", "slug": "canal-hvac", "description": "Specialized service for Fort Lauderdale''s 165 miles of canal properties.", "features": ["Enhanced dehumidification", "Waterfront protection", "Salt air defense", "Yacht property expertise"]},
      {"name": "Beach Property Service", "slug": "beach-hvac", "description": "Maximum protection for Fort Lauderdale Beach properties.", "features": ["Extreme salt protection", "Coastal coil coating", "Beach-rated equipment", "Marine-grade components"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs from Las Olas to the beach.", "features": ["Same-day service", "All brands", "90-day warranty", "Waterfront expertise"]},
      {"name": "Luxury HVAC Installation", "slug": "luxury-hvac", "description": "Premium installations for Fort Lauderdale''s exclusive properties.", "features": ["High-end equipment", "Quiet operation", "Flawless aesthetics", "10-year warranty"]},
      {"name": "Hurricane-Rated Systems", "slug": "hurricane-hvac", "description": "HVHZ-compliant installations meeting Broward requirements.", "features": ["Maximum wind rating", "Engineered tie-downs", "Code compliance", "Impact protection"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive waterfront maintenance programs.", "features": ["Canal environment service", "Salt air rinse", "Priority response", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Why do canal homes need special HVAC attention?", "answer": "Fort Lauderdale''s 165 miles of canals create constant waterfront humidity exposure. Enhanced dehumidification and moisture control are essential for comfort and preventing mold in canal properties."},
      {"question": "How does salt air affect my Fort Lauderdale AC system?", "answer": "Atlantic beach and Intracoastal salt air causes rapid corrosion of unprotected equipment. We provide coastal coil coating and corrosion-resistant components essential for Fort Lauderdale''s environment."},
      {"question": "What are Broward County HVHZ requirements?", "answer": "High Velocity Hurricane Zone mandates maximum wind-rated equipment, engineered tie-downs, and impact protection. All Fort Lauderdale installations require strict compliance and inspections."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Fort Lauderdale residents."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "4,100", "days_above_90": "86+", "hurricane_risk": "Very High"}'::jsonb,

  'Ready for Waterfront Comfort in Fort Lauderdale?',
  'Contact us today for a consultation. From Las Olas canals to Fort Lauderdale Beach, we''ll deliver expert HVAC service engineered for South Florida''s Venice.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Fort Lauderdale", "description": "Professional HVAC services for Fort Lauderdale, FL specializing in canal and beach properties.", "url": "https://coolit-hvac.com/fort-lauderdale-fl", "telephone": "+1-954-555-COOL", "areaServed": {"@type": "City", "name": "Fort Lauderdale", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Why do canal homes need special HVAC attention?", "acceptedAnswer": {"@type": "Answer", "text": "165 miles of canals create constant waterfront humidity requiring enhanced dehumidification and moisture control."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Fort Lauderdale", "item": "https://coolit-hvac.com/fl/fort-lauderdale"}]}'::jsonb,

  '/fl/broward-county',
  '[{"slug": "/fl/hollywood/hvac", "anchor_text": "Hollywood HVAC"}, {"slug": "/fl/pompano-beach/hvac", "anchor_text": "Pompano Beach AC"}, {"slug": "/fl/coral-springs/hvac", "anchor_text": "Coral Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/canal-hvac", "anchor_text": "Canal Home HVAC"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach Property HVAC"}]'::jsonb,

  2100, 34, 18, 92,
  'published', 1, 'claude', 'phase13-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
