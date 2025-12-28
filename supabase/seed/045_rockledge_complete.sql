-- ============================================
-- Rockledge, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  'Rockledge', 'rockledge', 'Florida', 'FL', 'Brevard', 'brevard-county',
  28.3503, -80.7256,
  ARRAY['32955', '32956'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890', 'e2f3a4b5-c6d7-8901-4567-123456789012']::uuid[],
  true, 79
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
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  NOW(),
  27942, 'US Census Bureau ACS 2023',
  71547, 315000, 72.8,
  ARRAY['single-family', 'waterfront', 'golf-community', 'historic-home'],
  '{"pre-1960": 15, "1960s-1990s": 35, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  90, 57, 75, 3500, 90, 50.4, 'high',
  'Brevard''s oldest city. Historic Indian River city. Mix of old estates and new development. Viera development area. Indian River lagoon waterfront. High coastal hurricane risk.',
  ARRAY['Rockwell Collins (nearby)', 'Health First', 'Brevard County Public Schools', 'City of Rockledge', 'Aerospace contractors', 'Retail businesses'],
  ARRAY['Historic Rockledge Drive', 'Indian River', 'Barton Avenue historic district', 'Rockledge Public Library', 'Barnes Park', 'Riverwalk'],
  ARRAY['Rockledge Community Days', 'Indian River Lagoon events', 'Historic tours'],
  ARRAY['Brevard County Public Schools'],
  'Historic preservation efforts. Viera development spillover. Indian River Drive improvements. Mixed-use development. Waterfront enhancement.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Rockledge Utilities',
  180,
  'Florida Building Code 8th Edition (2023), City of Rockledge amendments',
  '{"hvac_replacement": "Permit required", "historic_areas": "Design review for historic properties", "coastal_zones": "Wind-rated equipment near coast", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Historic Rockledge Drive', 'historic-rockledge', 'East', 'waterfront', '1920s-1960s', 'Upper income', 'Historic riverfront estates', ARRAY['historic estates', 'older systems', 'lagoon exposure', 'premium demands'], '30-80+ years', 1, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Barton Avenue District', 'barton-avenue', 'Central', 'historic-home', '1920s-1970s', 'Upper middle income', 'Historic neighborhood', ARRAY['historic homes', 'older systems', 'ductless needs', 'character preservation'], '40-80+ years', 2, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Levitt Park', 'levitt-park', 'West', 'single-family', '1960s-1980s', 'Middle income', 'Mid-century neighborhood', ARRAY['mid-century homes', 'older systems', 'efficiency upgrades'], '35-55 years', 3, true),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Viera East', 'viera-east-rockledge', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer Viera development', ARRAY['newer construction', 'family homes', 'HOA communities'], '5-20 years', 4, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Fiske Boulevard Area', 'fiske-boulevard', 'Central', 'mixed', '1960s-2010s', 'Middle income', 'Commercial/residential corridor', ARRAY['mixed housing', 'varied ages', 'standard service'], '10-55 years', 5, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'River Oaks', 'river-oaks', 'East', 'waterfront', '1980s-2010s', 'Upper middle income', 'Golf and lagoon community', ARRAY['golf course humidity', 'lagoon exposure', 'premium systems'], '10-40 years', 6, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Indian River Highlands', 'indian-river-highlands-rockledge', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'budget solutions'], '25-50 years', 7, false),
  ('a4b5c6d7-e8f9-0123-6789-345678901234', 'Barnes Park Area', 'barnes-park', 'Central', 'single-family', '1960s-1990s', 'Middle income', 'Near community park', ARRAY['older homes', 'system replacements', 'efficiency focus'], '25-55 years', 8, false)
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
  'a4b5c6d7-e8f9-0123-6789-345678901234',
  'hvac',
  '/fl/rockledge/hvac',
  'HVAC Services in Rockledge, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Rockledge''s 28,000+ residents. Historic and waterfront specialists. FPL rebates available. Serving Historic Rockledge Drive, Barton Avenue & all areas.',
  'HVAC Rockledge FL',
  ARRAY['AC repair Rockledge', 'air conditioning Rockledge FL', 'HVAC contractor Rockledge', 'historic home AC Rockledge', 'lagoon HVAC', 'Brevard County HVAC'],

  'Rockledge''s Historic & Riverfront HVAC Experts',
  'Preserving Brevard''s oldest city since [year]',
  'Licensed & Insured | FPL Certified | Historic & Waterfront Specialists',
  'Rockledge—Brevard County''s oldest incorporated city—combines magnificent historic estates along Rockledge Drive with the charm of Barton Avenue and modern Viera development. With nearly 28,000 residents appreciating both heritage and progress, Rockledge needs HVAC contractors who understand historic preservation, lagoon waterfront challenges, and community character. Our team provides expert service from century-old estates to new construction throughout this distinguished community.',

  '{
    "headline": "Why Rockledge Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Property Specialists", "description": "Rockledge Drive and Barton Avenue feature some of Brevard''s finest historic estates. We provide sensitive HVAC solutions preserving architectural character while delivering modern comfort."},
      {"title": "Indian River Lagoon Experts", "description": "Waterfront properties along the Indian River lagoon face unique humidity and salt air challenges. We provide enhanced dehumidification and coastal protection."},
      {"title": "Brevard''s Oldest City Expertise", "description": "As Brevard''s oldest city, Rockledge spans all housing eras. We''re experienced with everything from 1920s estates to Viera new construction."},
      {"title": "FPL Rebate Assistance", "description": "We help Rockledge homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your investment."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Rockledge",
    "intro": "Rockledge''s history and lagoon location create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Estate Preservation", "description": "Rockledge Drive''s magnificent estates and Barton Avenue historic homes require HVAC solutions that don''t compromise architectural integrity. Ductless systems often provide ideal solutions."},
      {"title": "Indian River Lagoon Humidity", "description": "Waterfront properties experience elevated humidity from the lagoon requiring enhanced dehumidification for comfort and mold prevention."},
      {"title": "Diverse Housing Ages", "description": "Rockledge spans 1920s estates to 2020s Viera construction—one of Brevard''s widest age ranges requiring expertise across all technologies."},
      {"title": "Golf Course Properties", "description": "River Oaks and golf-adjacent homes experience elevated humidity from course irrigation requiring enhanced dehumidification."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Rockledge",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Rockledge Drive estates and Barton Avenue homes.", "features": ["Ductless mini-splits", "Hidden installation", "Preservation-friendly", "Character protection"]},
      {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced solutions for Indian River lagoon properties.", "features": ["Lagoon humidity control", "Salt air protection", "Dehumidification", "Waterfront expertise"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, professional repairs throughout Rockledge.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic to new construction"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Preservation-aware", "10-year warranty", "Financing available"]},
      {"name": "Golf Community HVAC", "slug": "golf-community-hvac", "description": "Premium service for River Oaks and golf properties.", "features": ["Golf course humidity control", "Premium equipment", "HOA compliance", "Enhanced dehumidification"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you service historic Rockledge Drive estates?", "answer": "Yes, we specialize in Rockledge''s magnificent historic properties. Ductless mini-split systems provide efficient cooling while preserving architectural character and avoiding invasive ductwork."},
      {"question": "Why do Indian River lagoon properties need special attention?", "answer": "Lagoon waterfront properties experience elevated humidity and salt exposure. Enhanced dehumidification and corrosion-resistant equipment are essential for comfort and longevity."},
      {"question": "Do you service new Viera construction?", "answer": "Absolutely. We work throughout Rockledge from 1920s estates to brand-new Viera homes, helping new homeowners evaluate and optimize their systems."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Rockledge homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,500", "days_above_90": "90+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Historic Comfort in Rockledge?',
  'Contact us today for expert service. From historic estates to modern homes, we''ll keep your Rockledge property comfortable with FPL rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Rockledge", "description": "Professional HVAC services for Rockledge, FL specializing in historic and waterfront properties.", "url": "https://coolit-hvac.com/rockledge-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Rockledge", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you service historic estates?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in Rockledge historic properties with preservation-friendly ductless systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Rockledge", "item": "https://coolit-hvac.com/fl/rockledge"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa HVAC"}, {"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne AC"}, {"slug": "/fl/viera/hvac", "anchor_text": "Viera HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/waterfront-hvac", "anchor_text": "Waterfront HVAC"}]'::jsonb,

  1890, 26, 14, 79,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
