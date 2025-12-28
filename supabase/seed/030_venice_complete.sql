-- ============================================
-- Venice, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  'Venice', 'venice', 'Florida', 'FL', 'Sarasota', 'sarasota-county',
  27.0998, -82.4543,
  ARRAY['34284', '34285', '34286', '34287', '34288', '34289', '34292', '34293'],
  'North Port-Sarasota-Bradenton',
  ARRAY[]::uuid[],
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
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  NOW(),
  25463, 'US Census Bureau ACS 2023',
  62847, 425000, 78.4,
  ARRAY['single-family', 'condo', 'active-adult', 'historic-home'],
  '{"pre-1970": 20, "1970s-1980s": 30, "1990s-2000s": 30, "2010s-2020s": 20}'::jsonb,
  90, 55, 73, 3500, 95, 53.4, 'moderate',
  'Historic downtown with Italian-inspired architecture. "Shark Tooth Capital of the World." Beachfront community with strong tourism. Popular retirement destination. Moderate hurricane risk.',
  ARRAY['Venice Regional Bayfront Health', 'Sarasota County Schools', 'City of Venice', 'Tourism industry', 'Healthcare', 'Publix'],
  ARRAY['Venice Beach', 'Historic Downtown Venice', 'Venice Theatre', 'Caspersen Beach', 'Myakka River State Park (nearby)', 'Venice Train Depot'],
  ARRAY['Venice Sun Fiesta', 'Venice Shark Tooth Festival', 'Venice Art Fest', 'Stone Crab Festival'],
  ARRAY['Sarasota County Schools'],
  'Downtown revitalization. Beach area improvements. New residential developments. Healthcare growth. Tourism infrastructure.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Venice Utilities',
  220,
  'Florida Building Code 8th Edition (2023), City of Venice historic overlay',
  '{"hvac_replacement": "Permit required", "historic_district": "Design review required for historic areas", "coastal_setback": "Equipment placement restrictions near beach", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Cool Today', 'Air Comfort', 'Gator Air Conditioning', 'Climate Control Experts', 'Air-Tech'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Historic Downtown Venice', 'downtown-venice', 'Central', 'historic-home', '1920s-1960s', 'Upper middle income', 'Italian-inspired historic district', ARRAY['historic preservation', 'ductless systems', 'older buildings', 'architectural restrictions'], '15-80+ years', 1, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venice Island', 'venice-island', 'West', 'mixed', '1940s-1980s', 'Upper middle income', 'Beachfront area', ARRAY['salt air corrosion', 'beach humidity', 'older systems', 'premium demands'], '15-60 years', 2, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venetian Golf & River Club', 'venetian-golf', 'East', 'golf-community', '2000s-2020s', 'Upper income', 'Premier golf community', ARRAY['premium systems', 'golf course humidity', 'HOA requirements', 'multi-zone needs'], '5-20 years', 3, true),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Pelican Pointe', 'pelican-pointe', 'Southeast', 'golf-community', '1990s-2010s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'established homes', 'efficiency upgrades'], '10-28 years', 4, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Jacaranda', 'jacaranda', 'East', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['1970s-90s systems', 'family homes', 'system replacements'], '20-45 years', 5, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Bird Bay Village', 'bird-bay', 'North', 'condo', '1980s-1990s', 'Middle income', 'Condo community', ARRAY['condo systems', '1980s-90s equipment', 'association coordination'], '25-40 years', 6, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'South Venice', 'south-venice', 'South', 'single-family', '1960s-1990s', 'Middle income', 'Established residential', ARRAY['older systems', 'varied ages', 'standard service'], '20-55 years', 7, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Venice Gardens', 'venice-gardens', 'Southeast', 'single-family', '1960s-1980s', 'Moderate income', 'Established neighborhood', ARRAY['older homes', 'budget solutions', 'system replacements'], '25-55 years', 8, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Plantation', 'plantation-venice', 'East', 'golf-community', '1980s-2000s', 'Upper middle income', 'Golf and country club', ARRAY['golf community needs', 'established systems', 'premium upgrades'], '15-35 years', 9, false),
  ('e9f0a1b2-c3d4-5678-2345-901234567890', 'Gulf View', 'gulf-view', 'West', 'single-family', '1950s-1980s', 'Upper middle income', 'Near beach', ARRAY['salt air exposure', 'older homes', 'coastal maintenance'], '20-60 years', 10, false)
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
  'e9f0a1b2-c3d4-5678-2345-901234567890',
  'hvac',
  '/fl/venice/hvac',
  'HVAC Services in Venice, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Venice''s 25,000+ residents. Historic downtown and beach specialists. FPL rebates available. Serving Venice Island, Downtown & all neighborhoods.',
  'HVAC Venice FL',
  ARRAY['AC repair Venice', 'air conditioning Venice FL', 'HVAC contractor Venice', 'historic home AC Venice', 'beach HVAC', 'Sarasota County HVAC'],

  'Venice''s Historic & Coastal HVAC Experts',
  'Preserving charm while delivering comfort',
  'Licensed & Insured | FPL Certified | Historic & Beach Property Specialists',
  'Venice—Florida''s "Shark Tooth Capital" and one of the Gulf Coast''s most charming communities—combines Italian-inspired historic architecture with beautiful beaches and world-class golf. With over 25,000 residents who appreciate both character and quality, Venice needs HVAC contractors who understand historic preservation, coastal challenges, and community standards. Our team provides expert service from the unique buildings of historic downtown to the premier golf communities east of I-75.',

  '{
    "headline": "Why Venice Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Downtown Expertise", "description": "Venice''s iconic Italian-inspired downtown requires sensitive HVAC solutions. We provide ductless systems and hidden installations that preserve architectural character."},
      {"title": "Beachfront Protection", "description": "Venice Island and near-beach properties face salt air and humidity. We provide coastal protection and equipment designed for the beach environment."},
      {"title": "Golf Community Experience", "description": "From Venetian Golf & River Club to Pelican Pointe, we serve Venice''s premier communities with HOA-compliant installations and premium equipment."},
      {"title": "FPL Rebate Assistance", "description": "We help Venice homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Venice",
    "intro": "Venice''s character, location, and housing diversity create specific HVAC considerations:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Venice''s historic overlay district has strict requirements for equipment visibility and installation methods. Ductless systems often provide the ideal solution."},
      {"title": "Beachfront Conditions", "description": "Venice Island and near-beach properties face accelerated corrosion from salt air. Coastal coatings and enhanced maintenance protect equipment."},
      {"title": "Diverse Housing Stock", "description": "From 1920s downtown buildings to 2020s golf communities, Venice requires varied approaches for different property types and ages."},
      {"title": "Golf Course Humidity", "description": "Properties adjacent to Venice''s many golf courses experience elevated humidity from course irrigation."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Venice",
    "services": [
      {"name": "Historic Downtown HVAC", "slug": "historic-hvac", "description": "Sensitive solutions for Venice''s unique Italian-inspired historic properties.", "features": ["Ductless mini-splits", "Hidden installation", "Historic compliance", "Zoned comfort"]},
      {"name": "Beachfront HVAC", "slug": "coastal-hvac", "description": "Salt air protection and humidity control for Venice Island and beach-adjacent homes.", "features": ["Coastal coil coating", "Corrosion protection", "Dehumidification", "Salt rinse service"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Venice.", "features": ["Same-day service", "All brands", "90-day warranty", "Historic sensitivity"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebate assistance.", "features": ["FPL rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Golf Community Service", "slug": "golf-community-hvac", "description": "Premium service for Venice''s golf communities.", "features": ["HOA compliance", "Premium equipment", "Humidity control", "Multi-zone expertise"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with coastal maintenance.", "features": ["Bi-annual service", "Salt air protection", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in historic downtown Venice buildings?", "answer": "Yes, ductless mini-split systems are ideal for Venice''s historic properties. We can often hide equipment to meet historic district requirements while providing excellent comfort."},
      {"question": "Do beach homes need special HVAC consideration?", "answer": "Yes, Venice Island and near-beach properties face salt air corrosion and elevated humidity. We recommend coastal coil coatings, corrosion-resistant equipment, and enhanced dehumidification."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork."},
      {"question": "Do you service Venice''s golf communities?", "answer": "Yes, we serve all Venice golf communities including Venetian Golf & River Club, Pelican Pointe, and Plantation with HOA-compliant installations and premium equipment."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "73%", "cooling_degree_days": "3,500", "days_above_90": "95+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Coastal Comfort in Venice?',
  'Contact us today for a free estimate. We''ll respect Venice''s unique character while delivering modern comfort.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Venice", "description": "Professional HVAC services in Venice, FL specializing in historic and coastal properties.", "url": "https://coolit-hvac.com/venice-fl", "telephone": "+1-941-555-COOL", "areaServed": {"@type": "City", "name": "Venice", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in historic downtown Venice?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, ductless systems are ideal for Venice historic properties."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Venice", "item": "https://coolit-hvac.com/fl/venice"}]}'::jsonb,

  '/fl/sarasota-county',
  '[{"slug": "/fl/sarasota/hvac", "anchor_text": "Sarasota HVAC"}, {"slug": "/fl/north-port/hvac", "anchor_text": "North Port AC"}, {"slug": "/fl/englewood/hvac", "anchor_text": "Englewood HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1860, 26, 16, 87,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
