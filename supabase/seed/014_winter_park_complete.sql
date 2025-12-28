-- ============================================
-- Winter Park, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  'Winter Park', 'winter-park', 'Florida', 'FL', 'Orange', 'orange-county',
  28.5997, -81.3392,
  ARRAY['32789', '32790', '32792', '32793'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
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
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  NOW(),
  31153, 'US Census Bureau ACS 2023',
  97842, 625000, 58.7,
  ARRAY['single-family', 'historic-home', 'luxury-estate', 'condo'],
  '{"pre-1950": 20, "1950s-1970s": 30, "1980s-2000s": 35, "2010s-2020s": 15}'::jsonb,
  92, 52, 73, 3550, 105, 52.4, 'moderate',
  'Upscale Orlando suburb with tree-lined streets and chain of lakes. Beautiful historic homes mixed with modern luxury. Moderate hurricane risk.',
  ARRAY['Rollins College', 'Winter Park Memorial Hospital', 'Full Sail University (adjacent)', 'City of Winter Park', 'Park Avenue businesses', 'Winter Park Country Club'],
  ARRAY['Park Avenue', 'Rollins College', 'Scenic Boat Tour', 'Charles Hosmer Morse Museum', 'Kraft Azalea Garden', 'Mead Botanical Garden', 'Winter Park Golf Course', 'Albin Polasek Museum'],
  ARRAY['Winter Park Sidewalk Art Festival', 'Concours d''Elegance', 'Popcorn Flicks in the Park', 'Winter Park Wine & Dine', 'Bach Festival'],
  ARRAY['Orange County Public Schools', 'Private schools'],
  'Continued Park Avenue improvements. Luxury condo developments. Historic preservation efforts. SunRail station area development.',
  'Duke Energy Florida / City of Winter Park (some areas)',
  '{
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}, "total_available": {"amount": 1700}},
    "city_utility": {"contact": "City of Winter Park Electric for some areas"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Winter Park Utilities',
  200,
  'Florida Building Code 8th Edition (2023), Winter Park historic district overlay',
  '{"hvac_replacement": "Permit required", "historic_overlay": "Additional design review in historic districts", "tree_ordinance": "Equipment placement must avoid protected trees"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Climate Control Experts', 'Air Conditioning Excellence'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy / City of Winter Park", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Park Avenue District', 'park-avenue', 'Central', 'mixed', '1920s-1960s', 'Upper income', 'Historic downtown with upscale shopping', ARRAY['historic building systems', 'commercial HVAC', 'preservation requirements', 'boutique needs'], '20-70+ years', 1, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Via Tuscany', 'via-tuscany', 'South', 'luxury-estate', '2000s-2010s', 'Upper income', 'Gated luxury community', ARRAY['large estate systems', 'multi-zone requirements', 'whole-home automation', 'wine cellar climate'], '10-20 years', 2, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Winter Park Historic District', 'historic-district', 'Central', 'historic-home', '1900s-1940s', 'Upper income', 'Original Winter Park homes on brick streets', ARRAY['historic home retrofits', 'ductless needs', 'preservation compliance', 'older systems'], '25-80+ years', 3, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Baldwin Park (adjacent)', 'baldwin-park-wp', 'East', 'mixed', '2000s-2010s', 'Upper middle income', 'New urbanist community', ARRAY['newer construction', 'townhome systems', 'multi-unit buildings', 'HOA standards'], '10-20 years', 4, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Lakefront Estates', 'lakefront-estates', 'North', 'luxury-estate', '1950s-1990s', 'Upper income', 'Lakefront luxury properties', ARRAY['lakefront humidity', 'large home zoning', 'premium demands', 'waterfront maintenance'], '15-50 years', 5, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Windsong', 'windsong', 'South', 'single-family', '1980s-1990s', 'Upper middle income', 'Established upscale neighborhood', ARRAY['1980s-90s systems', 'premium upgrades', 'efficiency focus', 'smart integration'], '20-35 years', 6, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'College Quarters', 'college-quarters', 'East', 'mixed', '1950s-1980s', 'Middle income', 'Near Rollins College', ARRAY['rental property systems', 'varied maintenance', 'older buildings', 'student housing needs'], '25-55 years', 7, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Orwin Manor', 'orwin-manor', 'Northwest', 'single-family', '1960s-1980s', 'Upper middle income', 'Established neighborhood', ARRAY['mid-century systems', 'efficiency upgrades', 'tree shade considerations', 'modernization needs'], '25-50 years', 8, false)
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
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  'hvac',
  '/fl/winter-park/hvac',
  'HVAC Services in Winter Park, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Park''s discerning homeowners. Historic home specialists. Serving Park Avenue, Via Tuscany & all neighborhoods. Premium comfort solutions.',
  'HVAC Winter Park FL',
  ARRAY['AC repair Winter Park', 'air conditioning Winter Park FL', 'HVAC contractor Winter Park', 'historic home AC Winter Park', 'luxury home HVAC', 'Orange County HVAC'],

  'Winter Park''s Premium HVAC Experts',
  'Exceptional comfort for exceptional homes',
  'Licensed & Insured | Historic Home Certified | Luxury Property Specialists',
  'Winter Park represents the finest in Central Florida living—tree-lined brick streets, historic architecture, world-class shopping on Park Avenue, and a chain of beautiful lakes. With median home values exceeding $625,000 and a community that demands excellence, Winter Park homeowners expect premium HVAC service. Our team specializes in the unique challenges of this distinguished city, from retrofitting century-old homes to integrating smart systems in modern estates.',

  '{
    "headline": "Why Winter Park Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Expertise", "description": "Winter Park''s historic district features some of Central Florida''s finest period homes. We specialize in ductless systems and sensitive retrofits that preserve architectural integrity."},
      {"title": "Luxury Property Standards", "description": "From Via Tuscany estates to lakefront mansions, we provide the premium service and equipment that Winter Park''s finest properties deserve."},
      {"title": "Tree-Conscious Installation", "description": "Winter Park''s protected tree canopy requires careful equipment placement. We work within city ordinances while optimizing system performance."},
      {"title": "Park Avenue Commercial Experience", "description": "We serve Park Avenue boutiques and restaurants, bringing commercial-grade expertise to residential properties."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Winter Park",
    "intro": "Winter Park''s character and climate create specific HVAC demands:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Winter Park''s historic district overlay requires careful consideration of equipment visibility and installation methods. We provide solutions that meet preservation standards."},
      {"title": "Mature Tree Canopy", "description": "The city''s protected oak trees create unique challenges for equipment placement and require careful navigation during installation."},
      {"title": "Lakefront Humidity", "description": "Properties along Winter Park''s chain of lakes experience elevated humidity requiring specialized dehumidification solutions."},
      {"title": "Discerning Expectations", "description": "Winter Park homeowners expect excellence. We provide premium equipment and white-glove service to meet these standards."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Winter Park",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Winter Park''s historic properties. Ductless systems and preservation-compliant installations.", "features": ["Ductless mini-splits", "Hidden installations", "Preservation compliant", "Zoned comfort"]},
      {"name": "Luxury Home Systems", "slug": "luxury-hvac", "description": "Premium equipment and multi-zone solutions for Winter Park''s finest properties.", "features": ["Variable refrigerant flow", "Whole-home automation", "Wine cellar climate", "Pool house systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Prompt, professional repairs for Winter Park homeowners.", "features": ["Same-day service", "All premium brands", "90-day warranty", "White-glove service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with proper sizing and premium equipment.", "features": ["Manual J calculations", "Premium equipment", "Tree-conscious placement", "10-year warranty"]},
      {"name": "Indoor Air Quality", "slug": "indoor-air-quality", "description": "Premium air quality solutions for discerning homeowners.", "features": ["Whole-home purification", "Advanced filtration", "UV treatment", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance to protect your investment.", "features": ["Bi-annual service", "Priority scheduling", "System optimization", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work within Winter Park''s historic district requirements?", "answer": "Absolutely. We''re experienced with Winter Park''s historic overlay districts and provide solutions that meet all preservation requirements while delivering modern comfort."},
      {"question": "Do you install systems around protected trees?", "answer": "Yes, we''re well-versed in Winter Park''s tree ordinances and design installations that protect the city''s beautiful oak canopy."},
      {"question": "What brands do you recommend for luxury homes?", "answer": "We install premium brands like Carrier Infinity, Trane XV, and Lennox XC series. For historic homes, we often recommend Mitsubishi or Daikin ductless systems."},
      {"question": "Do you serve Park Avenue businesses?", "answer": "Yes, we service commercial properties along Park Avenue and bring that same commercial expertise to residential customers."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,550", "days_above_90": "105+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Premium Comfort in Your Winter Park Home?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Winter Park property, whether historic or modern.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Park", "description": "Premium HVAC services for Winter Park, FL", "url": "https://coolit-hvac.com/winter-park-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Winter Park", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you work within Winter Park''s historic district?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in preservation-compliant HVAC solutions."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Park", "item": "https://coolit-hvac.com/fl/winter-park"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/maitland/hvac", "anchor_text": "Maitland AC"}, {"slug": "/fl/oviedo/hvac", "anchor_text": "Oviedo HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/luxury-hvac", "anchor_text": "Luxury HVAC"}]'::jsonb,

  1900, 28, 14, 90,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
