-- ============================================
-- Gainesville, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 12 - North Central Florida
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f5a6b7c8-d9e0-1234-7890-567890123456',
  'Gainesville', 'gainesville', 'Florida', 'FL', 'Alachua', 'alachua-county',
  29.6516, -82.3248,
  ARRAY['32601', '32603', '32605', '32606', '32607', '32608', '32609', '32610', '32611', '32612', '32615'],
  'Gainesville',
  ARRAY[]::uuid[],
  true, 66
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
  'f5a6b7c8-d9e0-1234-7890-567890123456',
  NOW(),
  145214, 'US Census Bureau ACS 2023',
  49842, 245000, 42.8,
  ARRAY['single-family', 'college-housing', 'condo', 'historic-home'],
  '{"pre-1970": 25, "1970s-1990s": 30, "2000s-2010s": 30, "2020s": 15}'::jsonb,
  92, 45, 77, 3520, 98, 49.6, 'low',
  'University of Florida college town. North Central Florida hub. Gators athletics. Research and healthcare center. Low inland hurricane risk.',
  ARRAY['University of Florida', 'UF Health Shands Hospital', 'Alachua County Public Schools', 'North Florida Regional Medical Center', 'City of Gainesville', 'Santa Fe College'],
  ARRAY['University of Florida', 'Ben Hill Griffin Stadium (The Swamp)', 'Depot Park', 'Florida Museum of Natural History', 'Kanapaha Botanical Gardens', 'Downtown Gainesville'],
  ARRAY['Gainesville Downtown Festival & Art Show', 'Gator Growl', 'UF Homecoming', 'Hoggetowne Medieval Faire'],
  ARRAY['Alachua County Public Schools'],
  'Innovation Square development. Downtown revitalization. UF campus expansion. Healthcare growth. Tech corridor development.',
  'Gainesville Regional Utilities (GRU)',
  '{
    "ac_replacement": {"amount": 200, "requirements": "High-efficiency system through GRU program"},
    "heat_pump": {"amount": 100, "requirements": "Qualifying heat pump installation"},
    "smart_thermostat": {"amount": 75, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 500, "requirements": "Combined GRU rebates"}
  }'::jsonb,
  'Gainesville Regional Utilities (natural gas)',
  'Gainesville Regional Utilities',
  140,
  'Florida Building Code 8th Edition (2023), City of Gainesville amendments',
  '{"hvac_replacement": "Permit required", "college_housing": "Rental property considerations", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Cool Air USA', 'Arctic Air', 'All Temp Air', 'Air Pros', 'Elite HVAC'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "GRU", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'University of Florida Area', 'uf-area', 'Central', 'college-housing', '1950s-2020s', 'Middle income', 'Campus and student housing', ARRAY['rental properties', 'student housing', 'varied ages', 'landlord needs'], '5-65 years', 1, true),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Haile Plantation', 'haile-plantation', 'Southwest', 'golf-community', '1990s-2020s', 'Upper income', 'Premier golf and village community', ARRAY['golf course humidity', 'premium systems', 'HOA standards', 'luxury demands'], '5-30 years', 2, true),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Downtown Gainesville', 'downtown-gainesville', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Historic downtown district', ARRAY['historic buildings', 'mixed-use properties', 'ductless needs', 'varied systems'], '5-90+ years', 3, true),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Duckpond', 'duckpond', 'Northeast', 'historic-home', '1920s-1970s', 'Upper middle income', 'Historic neighborhood', ARRAY['historic homes', 'older systems', 'character preservation', 'ductless retrofits'], '40-90+ years', 4, false),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Tioga', 'tioga', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer master-planned community', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-20 years', 5, false),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Oakmont', 'oakmont', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 6, false),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Jonesville', 'jonesville', 'West', 'single-family', '1990s-2010s', 'Middle income', 'Suburban community', ARRAY['established systems', 'family homes', 'standard service'], '10-30 years', 7, false),
  ('f5a6b7c8-d9e0-1234-7890-567890123456', 'Tower Road Area', 'tower-road', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Residential area', ARRAY['older systems', 'family homes', 'budget solutions'], '20-50 years', 8, false)
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
  'f5a6b7c8-d9e0-1234-7890-567890123456',
  'hvac',
  '/fl/gainesville/hvac',
  'HVAC Services in Gainesville, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Gainesville''s 145,000+ residents. University and college town specialists. GRU rebates. Serving UF, Haile Plantation, Downtown & all areas.',
  'HVAC Gainesville FL',
  ARRAY['AC repair Gainesville', 'air conditioning Gainesville FL', 'HVAC contractor Gainesville', 'UF student housing AC', 'Haile Plantation HVAC', 'Alachua County HVAC'],

  'Gainesville''s Gator Country HVAC Experts',
  'Go Gators! Professional comfort for North Central Florida',
  'Licensed & Insured | GRU Certified | College Town & Golf Community Specialists',
  'Gainesville—home of the University of Florida Gators and North Central Florida''s hub—combines vibrant college-town energy with premier golf communities like Haile Plantation and established neighborhoods. With over 145,000 residents including students, faculty, and families, Gainesville needs HVAC contractors who understand college housing, historic properties, and diverse community needs. Our team provides expert service throughout this dynamic university city.',

  '{
    "headline": "Why Gainesville Residents Choose Us",
    "reasons": [
      {"title": "College Housing Specialists", "description": "UF area properties require reliable service for student housing and rental properties. We provide efficient solutions landlords and tenants trust."},
      {"title": "Haile Plantation Experts", "description": "Haile''s premier golf community demands top-tier service. We deliver premium equipment and expertise with enhanced humidity control."},
      {"title": "GRU Rebate Certified", "description": "We help Gainesville homeowners access up to $500 in GRU rebates including $200 for AC replacement."},
      {"title": "University Town Understanding", "description": "Gainesville''s unique mix of student housing, family homes, and golf communities requires varied approaches. We understand this community."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Gainesville",
    "intro": "Gainesville''s college town character and climate create specific HVAC considerations:",
    "challenges": [
      {"title": "Student Rental Properties", "description": "UF area rentals need reliable, efficient systems handling student use. We provide solutions balancing performance with landlord budgets."},
      {"title": "Golf Course Humidity", "description": "Haile Plantation and golf-adjacent properties experience elevated humidity from course irrigation requiring enhanced dehumidification."},
      {"title": "Historic Preservation", "description": "Duckpond and downtown historic properties require HVAC solutions preserving architectural character. Ductless systems often provide ideal solutions."},
      {"title": "High Cooling Demand", "description": "With 98+ days above 90°F and 3,520 cooling degree days, Gainesville''s hot climate demands reliable, efficient HVAC systems."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Gainesville",
    "services": [
      {"name": "College Housing Service", "slug": "college-housing", "description": "Reliable HVAC for UF area student rental properties.", "features": ["Efficient systems", "Budget-friendly", "Reliable performance", "Landlord support"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for Haile Plantation and golf properties.", "features": ["Premium equipment", "HOA compliance", "Humidity control", "Multi-zone systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Gainesville.", "features": ["Same-day service", "All brands", "90-day warranty", "Student-friendly"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with GRU rebate assistance.", "features": ["GRU rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Duckpond and downtown historic properties.", "features": ["Ductless mini-splits", "Preservation-friendly", "Character protection", "Efficient cooling"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance for homes and rentals.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Rental property plans"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service UF student rental properties?", "answer": "Yes, we provide reliable, efficient systems for student housing and work with landlords on budget-friendly solutions that perform reliably throughout the academic year."},
      {"question": "Do you work with Haile Plantation golf community?", "answer": "Absolutely. We specialize in Haile Plantation with HOA-compliant installations, premium equipment, and enhanced humidity control for golf-adjacent properties."},
      {"question": "What GRU rebates are available?", "answer": "GRU offers up to $200 for AC replacement, $100 for heat pumps, and $75 for smart thermostats. We handle all rebate paperwork for Gainesville homeowners."},
      {"question": "Can you install AC in Duckpond historic homes?", "answer": "Yes, ductless mini-split systems are ideal for Duckpond''s historic properties, providing efficient cooling without invasive ductwork that compromises architectural character."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "77%", "cooling_degree_days": "3,520", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Gator-Great Comfort in Gainesville?',
  'Contact us today for expert service. From UF to Haile Plantation, we''ll keep your Gainesville property comfortable with GRU rebates. Go Gators!',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Gainesville", "description": "Professional HVAC services for Gainesville, FL.", "url": "https://coolit-hvac.com/gainesville-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "Gainesville", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service UF student rentals?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide reliable systems for student housing with landlord support."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Gainesville", "item": "https://coolit-hvac.com/fl/gainesville"}]}'::jsonb,

  '/fl/alachua-county',
  '[{"slug": "/fl/alachua/hvac", "anchor_text": "Alachua HVAC"}, {"slug": "/fl/newberry/hvac", "anchor_text": "Newberry AC"}, {"slug": "/fl/high-springs/hvac", "anchor_text": "High Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/college-housing", "anchor_text": "College Housing Service"}, {"slug": "/services/golf-community-hvac", "anchor_text": "Golf Community HVAC"}]'::jsonb,

  1920, 30, 14, 66,
  'published', 1, 'claude', 'phase12-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
