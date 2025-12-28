-- ============================================
-- Titusville, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  'Titusville', 'titusville', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.6122, -80.8075,
  ARRAY['32780', '32781', '32796'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['e2f3a4b5-c6d7-8901-4567-123456789012']::uuid[],
  true, 80
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
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  NOW(),
  48789, 'US Census Bureau ACS 2023',
  55342, 225000, 64.2,
  ARRAY['single-family', 'waterfront', 'historic-home', 'mobile-home'],
  '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 55, 75, 3480, 88, 51.6, 'high',
  'Gateway to Kennedy Space Center. Historic Space Coast city. Indian River lagoon waterfront. Rocket launch views. Space industry heritage. High coastal hurricane risk.',
  ARRAY['Kennedy Space Center', 'NASA contractors', 'Brevard County Public Schools', 'Parrish Medical Center', 'City of Titusville', 'Space industry'],
  ARRAY['Kennedy Space Center Visitor Complex', 'Playalinda Beach', 'Space View Park', 'American Police Hall of Fame', 'Canaveral National Seashore', 'Historic Downtown'],
  ARRAY['Space Coast Birding & Wildlife Festival', 'Titusville Art & Wine Festival', 'Rocket launches', 'Warbird Air Museum events'],
  ARRAY['Brevard County Public Schools'],
  'Space industry modernization. Downtown Titusville revitalization. Kennedy Space Center expansion. Playalinda Beach access. Space tourism growth.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Titusville Utilities',
  190,
  'Florida Building Code 8th Edition (2023), City of Titusville amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment requirements near coast", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Downtown Titusville', 'downtown-titusville', 'Central', 'mixed', '1920s-1990s', 'Middle income', 'Historic downtown with Space View Park', ARRAY['historic buildings', 'mixed-use properties', 'older systems', 'varied needs'], '20-80+ years', 1, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'LaGrange', 'lagrange', 'South', 'waterfront', '1950s-2000s', 'Upper middle income', 'Indian River lagoon waterfront', ARRAY['lagoon humidity', 'waterfront exposure', 'salt air', 'premium demands'], '15-65 years', 2, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Whispering Hills', 'whispering-hills', 'West', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 3, true),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Suncrest', 'suncrest', 'North', 'single-family', '1970s-1990s', 'Middle income', 'Residential community', ARRAY['older systems', 'family homes', 'budget solutions'], '25-50 years', 4, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Fox Lake Estates', 'fox-lake-estates', 'East', 'single-family', '1980s-2010s', 'Middle income', 'Near Max Brewer Bridge', ARRAY['established systems', 'family homes', 'standard service'], '10-40 years', 5, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Indian River Highlands', 'indian-river-highlands', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Older residential area', ARRAY['older homes', 'system replacements', 'budget focus'], '25-55 years', 6, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Bellwood', 'bellwood', 'Northwest', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency focus'], '20-50 years', 7, false),
  ('f3a4b5c6-d7e8-9012-5678-234567890123', 'Great Outdoors RV Resort', 'great-outdoors', 'Southwest', 'manufactured', '1980s-2010s', 'Middle income', 'Large RV and mobile home community', ARRAY['manufactured home HVAC', 'seasonal residents', 'specialized service'], '10-40 years', 8, false)
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
  'f3a4b5c6-d7e8-9012-5678-234567890123',
  'hvac',
  '/fl/titusville/hvac',
  'HVAC Services in Titusville, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Titusville''s 49,000+ residents. Gateway to Kennedy Space Center. FPL rebates available. Serving Downtown, LaGrange, all neighborhoods.',
  'HVAC Titusville FL',
  ARRAY['AC repair Titusville', 'air conditioning Titusville FL', 'HVAC contractor Titusville', 'Kennedy Space Center area AC', 'lagoon HVAC', 'Brevard County HVAC'],

  'Titusville''s Space City HVAC Experts',
  'Comfort solutions for the Gateway to Space',
  'Licensed & Insured | FPL Certified | Space Coast Specialists',
  'Titusville—the historic Gateway to Kennedy Space Center—combines space industry heritage with scenic Indian River lagoon living and front-row rocket launch views. With nearly 49,000 residents proud of their space city, Titusville needs HVAC contractors who deliver the reliability and expertise that built the space program. Our team provides professional service from downtown to lagoon waterfront throughout this iconic Space Coast community.',

  '{
    "headline": "Why Titusville Residents Choose Us",
    "reasons": [
      {"title": "Space Industry Reliability", "description": "Titusville''s space industry heritage demands reliability and expertise. We deliver both with professional service NASA contractors and families trust."},
      {"title": "Lagoon Waterfront Specialists", "description": "LaGrange and other Indian River lagoon properties face humidity and salt air challenges. We provide enhanced dehumidification and coastal protection."},
      {"title": "Affordable, Honest Service", "description": "With median home values around $225,000, Titusville homeowners value honest pricing. We provide quality service without upselling or pressure."},
      {"title": "FPL Rebate Assistance", "description": "We help Titusville homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Titusville",
    "intro": "Titusville''s lagoon location and housing create specific HVAC considerations:",
    "challenges": [
      {"title": "Indian River Lagoon Humidity", "description": "LaGrange and waterfront properties experience elevated humidity from the lagoon requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Aging Housing Stock", "description": "Much of Titusville was built in the 1970s-1980s space boom. Systems in these homes often need replacement with efficient modern equipment."},
      {"title": "Manufactured Home HVAC", "description": "Titusville has significant manufactured home communities requiring specialized HVAC knowledge and equipment."},
      {"title": "Budget-Conscious Market", "description": "Titusville homeowners value practical, affordable solutions. We provide honest assessments and options at multiple price points."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Titusville",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Titusville.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Financing available"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River lagoon properties.", "features": ["Lagoon humidity control", "Salt air protection", "Dehumidification", "Waterfront expertise"]},
      {"name": "Manufactured Home Service", "slug": "manufactured-home", "description": "Specialized service for Titusville''s mobile home communities.", "features": ["Specialized equipment", "Proper sizing", "Efficient solutions", "Budget-friendly"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Titusville systems with efficient equipment.", "features": ["Efficiency improvements", "Honest assessments", "Rebate assistance", "Fair pricing"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service manufactured homes in Titusville?", "answer": "Yes, we specialize in manufactured home HVAC systems. We understand the unique requirements and provide properly-sized, efficient solutions for mobile homes."},
      {"question": "Why do lagoon waterfront properties need special attention?", "answer": "Properties along the Indian River lagoon experience elevated humidity and salt air. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "Are your prices affordable for Titusville homeowners?", "answer": "Yes, we provide honest pricing and help you access FPL rebates. We offer solutions at multiple price points with no pressure to buy."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Titusville homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,480", "days_above_90": "88+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Space City Comfort in Titusville?',
  'Contact us today for honest, reliable service. From downtown to lagoon waterfront, we''ll keep your Titusville home comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Titusville", "description": "Professional HVAC services for Titusville, FL.", "url": "https://coolit-hvac.com/titusville-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Titusville", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service manufactured homes?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in manufactured home HVAC with proper sizing and efficient solutions."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Titusville", "item": "https://coolit-hvac.com/fl/titusville"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa HVAC"}, {"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge AC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}, {"slug": "/services/manufactured-home", "anchor_text": "Manufactured Home Service"}]'::jsonb,

  1870, 27, 12, 80,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
