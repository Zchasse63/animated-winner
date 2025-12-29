-- ============================================
-- Tallahassee, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Remaining High Priority
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  'Tallahassee', 'tallahassee', 'Florida', 'FL', 'Leon', 'leon-county',
  30.4383, -84.2807,
  ARRAY['32301', '32303', '32304', '32305', '32306', '32307', '32308', '32309', '32310', '32311', '32312', '32313', '32314', '32315', '32316', '32317', '32399'],
  'Tallahassee',
  ARRAY[]::uuid[],
  true, 94
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
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  NOW(),
  196000, 'US Census Bureau 2023',
  52657, 235000, 47.3,
  ARRAY['single-family', 'apartment', 'student-housing', 'historic'],
  '{"pre-1960": 15, "1960s-1990s": 35, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  91, 41, 70, 2900, 92, 61.8, 'moderate',
  'Florida''s capital city. Major university town (FSU, FAMU). Government center. Canopy roads and historic districts. North Florida location has cooler winters than South Florida. Inland moderate hurricane risk.',
  ARRAY['State of Florida government', 'Florida State University', 'Florida A&M University', 'Tallahassee Memorial Healthcare', 'Capital Regional Medical Center', 'Leon County Schools', 'City of Tallahassee'],
  ARRAY['Florida State Capitol', 'FSU football stadium', 'Cascades Park', 'Museum of Florida History', 'Goodwood Museum', 'Canopy roads', 'Railroad Square Art District', 'St. Marks Wildlife Refuge'],
  ARRAY['FSU football games', 'Springtime Tallahassee', 'Downtown GetDown', 'Market Days', 'Word of South Festival', 'Tallahassee Film Festival'],
  ARRAY['Leon County Schools'],
  'Downtown revitalization. Cascades Park development. College Town growth. Gaines Street corridor transformation. Medical district expansion. FSU campus development.',
  'City of Tallahassee (Utilities)',
  '{
    "residential_heat_pump": {"amount": 200, "requirements": "ENERGY STAR certified heat pump water heater"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying connected thermostat"},
    "hvac_tune_up": {"amount": 50, "requirements": "Annual system tune-up"},
    "total_available": {"amount": 450, "requirements": "Combined City of Tallahassee rebates"}
  }'::jsonb,
  'City of Tallahassee Gas',
  'City of Tallahassee Water',
  95,
  'Florida Building Code 8th Edition (2023), Leon County requirements',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required", "energy_code": "Energy compliance required"}'::jsonb,
  'moderate',
  ARRAY['Discount Air & Heat', 'Keith Lawson AC', 'Parker Services', 'Miller''s Central Air', 'Air Dynamics'],
  '{"demographics": "US Census Bureau 2023", "utilities": "City of Tallahassee", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'College Town', 'college-town', 'West', 'mixed', '2010s-2020s', 'Middle income', 'New urbanist FSU development', ARRAY['student housing', 'new construction', 'modern systems', 'mixed use'], '2-12 years', 1, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Midtown', 'midtown', 'Central', 'mixed', '1950s-2020s', 'Upper middle income', 'Trendy urban corridor', ARRAY['mixed housing', 'renovations', 'varied ages', 'urban living'], '5-70 years', 2, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Betton Hills', 'betton-hills', 'North', 'single-family', '1950s-1980s', 'Upper middle income', 'Established canopy road area', ARRAY['canopy roads', 'family homes', 'older systems', 'tree-lined streets'], '40-70 years', 3, true),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Killearn Estates', 'killearn-estates', 'Northeast', 'single-family', '1970s-2000s', 'Upper middle income', 'Large suburban community', ARRAY['family homes', 'varied ages', 'standard service', 'established area'], '20-50 years', 4, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Southwood', 'southwood', 'South', 'mixed', '1990s-2020s', 'Upper middle income', 'Master-planned community', ARRAY['newer construction', 'family homes', 'HOA standards', 'modern systems'], '5-30 years', 5, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Myers Park', 'myers-park', 'Northeast', 'single-family', '1950s-1970s', 'Middle income', 'Mid-century neighborhood', ARRAY['older homes', 'family properties', 'system replacements'], '50-70 years', 6, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Indian Head Acres', 'indian-head', 'East', 'single-family', '1960s-1980s', 'Middle income', 'Family neighborhood', ARRAY['established homes', 'older systems', 'standard service'], '40-60 years', 7, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Lafayette Park', 'lafayette-park', 'Central', 'single-family', '1920s-1950s', 'Upper middle income', 'Historic near-downtown', ARRAY['historic homes', 'older systems', 'character properties'], '70-100 years', 8, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Waverly Hills', 'waverly-hills', 'Northeast', 'single-family', '1950s-1970s', 'Middle income', 'Established community', ARRAY['family homes', 'older systems', 'efficiency upgrades'], '50-70 years', 9, false),
  ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b', 'Canopy Area', 'canopy', 'North', 'single-family', '1960s-2000s', 'Upper middle income', 'Scenic canopy roads', ARRAY['canopy road properties', 'varied ages', 'family homes'], '20-60 years', 10, false)
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
  'e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b',
  'hvac',
  '/fl/tallahassee/hvac',
  'HVAC Services in Tallahassee, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Tallahassee''s 196,000+ residents. Capital city and college town specialists. City rebates. Serving College Town, Midtown, Betton Hills & all areas.',
  'HVAC Tallahassee FL',
  ARRAY['AC repair Tallahassee', 'air conditioning Tallahassee FL', 'HVAC contractor Tallahassee', 'FSU HVAC', 'College Town AC', 'capital city HVAC'],

  'Tallahassee''s Capital City HVAC Experts',
  'Serving Florida''s government center and college community',
  'Licensed & Insured | City of Tallahassee Certified | College & Government Specialists',
  'Tallahassee—Florida''s capital city—combines government center gravitas with vibrant college town energy. With nearly 196,000 residents from FSU''s College Town to historic canopy road neighborhoods, from Midtown''s urban revival to Southwood''s master-planned excellence, Tallahassee presents unique HVAC demands. Our team serves Florida''s capital with expertise spanning student housing, government buildings, historic districts, and family communities throughout Leon County.',

  '{
    "headline": "Why Tallahassee Residents Choose Us",
    "reasons": [
      {"title": "College Town Specialists", "description": "FSU and FAMU create unique demands. We work with student housing, understand semester schedules, and provide service matching Tallahassee''s academic calendar."},
      {"title": "North Florida Climate Expertise", "description": "Tallahassee has cooler winters than South Florida with occasional freezing. We provide heat pump systems and service appropriate for North Florida''s climate variation."},
      {"title": "City Rebate Certified", "description": "Unlike most Florida cities, Tallahassee has municipal utilities with unique rebate programs. We maximize City of Tallahassee rebates including $200 for heat pump water heaters."},
      {"title": "Historic District Experience", "description": "Lafayette Park and canopy road neighborhoods feature historic homes. We provide modern comfort while respecting Tallahassee''s historic character."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Tallahassee",
    "intro": "Tallahassee''s character creates specific HVAC considerations:",
    "challenges": [
      {"title": "North Florida Climate Variation", "description": "Unlike South Florida, Tallahassee experiences cooler winters with occasional freezing. Heat pump systems with auxiliary heat are more common than South Florida''s cooling-only approach."},
      {"title": "Student Housing Demands", "description": "FSU and FAMU student housing requires durable systems, efficient operation for budget-conscious students, and service aligned with academic calendars."},
      {"title": "Canopy Road Considerations", "description": "Tallahassee''s famous canopy roads create shaded, humid microclimates. Properties under heavy tree canopy may need enhanced dehumidification."},
      {"title": "Historic Preservation", "description": "Lafayette Park and historic districts have character homes requiring HVAC solutions providing modern comfort without compromising historic integrity."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Tallahassee",
    "services": [
      {"name": "Heat Pump Systems", "slug": "heat-pump", "description": "Efficient heating and cooling for Tallahassee''s climate.", "features": ["Heating and cooling", "North Florida appropriate", "Energy efficient", "City rebates available"]},
      {"name": "Student Housing Service", "slug": "student-housing", "description": "Reliable service for FSU and FAMU area properties.", "features": ["Budget-friendly", "Fast repairs", "Durable systems", "Academic schedule aware"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Tallahassee.", "features": ["Same-day service", "All brands", "90-day warranty", "City-wide coverage"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with City rebate assistance.", "features": ["City rebates", "Heat pump options", "10-year warranty", "Financing available"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized service for Tallahassee''s historic properties.", "features": ["Character respect", "Modern comfort", "Discreet installations", "Preservation-friendly"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for Tallahassee''s climate.", "features": ["Heating & cooling service", "Priority scheduling", "15% repair discount", "System optimization"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do I need heating in Tallahassee?", "answer": "Yes. Unlike South Florida, Tallahassee experiences occasional freezing temperatures. Heat pumps provide efficient heating and cooling, with backup heat for cold winter nights."},
      {"question": "Can you work with FSU student housing schedules?", "answer": "Absolutely. We understand academic calendars and provide flexible scheduling for student housing, semester turnover, and summer maintenance when properties are vacant."},
      {"question": "What City of Tallahassee rebates are available?", "answer": "Tallahassee offers $200 for heat pump water heaters, $75 for smart thermostats, and $50 for system tune-ups. We handle all rebate paperwork for Tallahassee residents."},
      {"question": "Can you service historic homes near downtown?", "answer": "Yes, we specialize in Lafayette Park and historic Tallahassee properties. We provide modern comfort while respecting historic character and architectural integrity."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "91°F", "avg_winter_low": "41°F", "avg_humidity": "70%", "cooling_degree_days": "2,900", "days_above_90": "92+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Capital City Comfort in Tallahassee?',
  'Contact us today for a consultation. From FSU''s College Town to historic canopy roads to Southwood, we''ll deliver expert HVAC service with City rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Tallahassee", "description": "Professional HVAC services for Tallahassee, FL specializing in college town and capital city needs.", "url": "https://coolit-hvac.com/tallahassee-fl", "telephone": "+1-850-555-COOL", "areaServed": {"@type": "City", "name": "Tallahassee", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do I need heating in Tallahassee?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, Tallahassee experiences occasional freezing requiring heat pump systems with backup heat."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Tallahassee", "item": "https://coolit-hvac.com/fl/tallahassee"}]}'::jsonb,

  '/fl/leon-county',
  '[{"slug": "/fl/gainesville/hvac", "anchor_text": "Gainesville HVAC"}, {"slug": "/fl/pensacola/hvac", "anchor_text": "Pensacola AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/heat-pump", "anchor_text": "Heat Pump Systems"}, {"slug": "/services/student-housing", "anchor_text": "Student Housing HVAC"}]'::jsonb,

  2050, 30, 16, 91,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
