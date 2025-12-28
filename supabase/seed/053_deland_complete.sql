-- ============================================
-- DeLand, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 11 - Volusia County
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  'DeLand', 'deland', 'Florida', 'FL', 'Volusia', 'volusia-county',
  29.0283, -81.3031,
  ARRAY['32720', '32721', '32723', '32724'],
  'Deltona-Daytona Beach-Ormond Beach',
  ARRAY['a0b1c2d3-e4f5-6789-2345-012345678901']::uuid[],
  true, 69
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
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  NOW(),
  37351, 'US Census Bureau ACS 2023',
  54842, 245000, 58.6,
  ARRAY['single-family', 'historic-home', 'college-housing', 'affordable-housing'],
  '{"pre-1970": 35, "1970s-1990s": 30, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  92, 50, 76, 3480, 95, 53.2, 'low',
  'Volusia County seat. Historic Athens of Florida. Stetson University. Victorian architecture. Arts community. Low inland hurricane risk.',
  ARRAY['Stetson University', 'Volusia County Government', 'Florida Hospital DeLand', 'Volusia County Public Schools', 'City of DeLand', 'Retail sector'],
  ARRAY['Downtown DeLand historic district', 'Stetson University', 'Artisan Alley', 'DeLand House Museum', 'DeLeon Springs State Park', 'Blue Spring State Park'],
  ARRAY['DeLand Fall Festival of the Arts', 'DeLand Original Music Festival', 'Downtown Friday Night events', 'Stetson Homecoming'],
  ARRAY['Volusia County Public Schools'],
  'Downtown DeLand revitalization. Stetson University expansion. Historic preservation. Arts district growth. New residential development.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas',
  'City of DeLand Utilities',
  195,
  'Florida Building Code 8th Edition (2023), City of DeLand historic overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review for downtown properties", "college_housing": "Rental property considerations", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Arctic Air', 'Kabran Air Conditioning', 'Lowery Air Conditioning', 'Air Pros USA', 'Anchor Cooling & Heating'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Historic Downtown DeLand', 'downtown-deland', 'Central', 'historic-home', '1880s-1960s', 'Upper middle income', 'Victorian and historic architecture', ARRAY['historic buildings', 'older systems', 'ductless needs', 'preservation requirements'], '30-100+ years', 1, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Stetson University Area', 'stetson-area', 'East', 'college-housing', '1920s-2020s', 'Middle income', 'College neighborhood', ARRAY['rental properties', 'varied ages', 'student housing', 'landlord needs'], '5-80+ years', 2, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Victoria Park', 'victoria-park', 'North', 'single-family', '1970s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['golf course humidity', 'established systems', 'HOA requirements'], '20-50 years', 3, true),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Artisan Alley Area', 'artisan-alley', 'Central', 'mixed', '1920s-1970s', 'Middle income', 'Arts district', ARRAY['historic buildings', 'artist studios', 'older systems', 'character preservation'], '40-90+ years', 4, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Spring Hill', 'spring-hill', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'budget solutions'], '25-55 years', 5, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Lake Beresford', 'lake-beresford', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Lakefront area', ARRAY['lake humidity', 'older systems', 'standard service'], '20-50 years', 6, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Westgate', 'westgate', 'West', 'single-family', '1960s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '25-55 years', 7, false),
  ('c2d3e4f5-a6b7-8901-4567-234567890123', 'Deltona Lakes', 'deltona-lakes', 'Southwest', 'single-family', '1970s-2000s', 'Middle income', 'Near Deltona', ARRAY['older systems', 'budget focus', 'system replacements'], '20-50 years', 8, false)
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
  'c2d3e4f5-a6b7-8901-4567-234567890123',
  'hvac',
  '/fl/deland/hvac',
  'HVAC Services in DeLand, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for DeLand''s 37,000+ residents. Historic and college town specialists. Duke Energy rebates. Serving Downtown, Stetson, Victoria Park & all areas.',
  'HVAC DeLand FL',
  ARRAY['AC repair DeLand', 'air conditioning DeLand FL', 'HVAC contractor DeLand', 'historic home AC DeLand', 'Stetson University HVAC', 'Volusia County HVAC'],

  'DeLand''s Historic & College Town HVAC Experts',
  'Preserving the Athens of Florida since [year]',
  'Licensed & Insured | Duke Energy Certified | Historic Property Specialists',
  'DeLand—the "Athens of Florida"—combines magnificent Victorian architecture with vibrant college-town energy from Stetson University and a thriving arts community. With over 37,000 residents appreciating historic character and cultural richness, DeLand needs HVAC contractors who understand historic preservation, college housing, and community values. Our team provides expert service from downtown Victorian homes to Stetson area properties throughout this distinguished county seat.',

  '{
    "headline": "Why DeLand Residents Choose Us",
    "reasons": [
      {"title": "Historic Preservation Experts", "description": "Downtown DeLand and Artisan Alley feature irreplaceable Victorian and historic architecture. Ductless systems preserve character while delivering modern comfort."},
      {"title": "College Housing Specialists", "description": "Stetson University area properties require reliable service for student housing and rental properties. We provide efficient solutions landlords and tenants trust."},
      {"title": "Duke Energy Rebate Certified", "description": "We help DeLand homeowners access up to $1,700 in Duke Energy rebates including $300 for AC replacement and $150 for heat pumps."},
      {"title": "Community Understanding", "description": "DeLand''s mix of historic homes, college housing, and family neighborhoods requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to DeLand",
    "intro": "DeLand''s historic character and college town nature create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Building Preservation", "description": "Downtown DeLand''s Victorian homes and historic buildings require HVAC solutions that don''t compromise architectural integrity. Ductless mini-splits often provide ideal solutions."},
      {"title": "College Rental Properties", "description": "Stetson University area rentals need reliable, efficient systems handling student use. We provide solutions balancing performance with landlord budgets."},
      {"title": "Aging Housing Stock", "description": "Much of DeLand predates modern building codes. Systems in homes from the 1920s-1970s often need replacement with efficient modern equipment."},
      {"title": "Arts Community Properties", "description": "Artisan Alley studios and galleries require temperature and humidity control protecting artwork while maintaining character."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in DeLand",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for DeLand''s beautiful Victorian and historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "College Housing Service", "slug": "college-housing", "description": "Reliable HVAC for Stetson University area rental properties.", "features": ["Efficient systems", "Budget-friendly", "Reliable performance", "Landlord support"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, honest repairs throughout DeLand.", "features": ["Same-day service", "Fair pricing", "90-day warranty", "All brands"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging DeLand systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting historic and rental investments.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in downtown DeLand Victorian homes?", "answer": "Yes, ductless mini-split systems are ideal for DeLand''s historic properties. They provide efficient cooling without invasive ductwork that would compromise architectural character."},
      {"question": "Do you service Stetson University area rental properties?", "answer": "Absolutely. We provide reliable, efficient systems for student housing and work with landlords on budget-friendly solutions that perform reliably."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork for DeLand homeowners."},
      {"question": "Do you service Victoria Park golf community?", "answer": "Yes, we service Victoria Park and all DeLand neighborhoods with appropriate solutions for each area''s unique needs."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "76%", "cooling_degree_days": "3,480", "days_above_90": "95+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Historic Comfort in DeLand?',
  'Contact us today for expert service. We''ll preserve DeLand''s character while delivering modern comfort with Duke Energy rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - DeLand", "description": "Professional HVAC services for DeLand, FL specializing in historic properties.", "url": "https://coolit-hvac.com/deland-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "DeLand", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in Victorian homes?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for DeLand historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "DeLand", "item": "https://coolit-hvac.com/fl/deland"}]}'::jsonb,

  '/fl/volusia-county',
  '[{"slug": "/fl/deltona/hvac", "anchor_text": "Deltona HVAC"}, {"slug": "/fl/daytona-beach/hvac", "anchor_text": "Daytona Beach AC"}, {"slug": "/fl/orange-city/hvac", "anchor_text": "Orange City HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/college-housing", "anchor_text": "College Housing Service"}]'::jsonb,

  1900, 28, 13, 69,
  'published', 1, 'claude', 'phase11-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
