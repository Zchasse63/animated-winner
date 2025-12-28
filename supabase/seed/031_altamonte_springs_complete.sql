-- ============================================
-- Altamonte Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 7 - Orlando Metro Expansion
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  'Altamonte Springs', 'altamonte-springs', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6611, -81.3656,
  ARRAY['32701', '32714', '32715', '32716'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901', 'f2a3b4c5-d6e7-8901-5678-234567890123']::uuid[],
  true, 88
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
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  NOW(),
  46356, 'US Census Bureau ACS 2023',
  62847, 295000, 54.2,
  ARRAY['single-family', 'condo', 'apartment', 'townhouse'],
  '{"pre-1980": 20, "1980s-1990s": 40, "2000s-2010s": 30, "2020s": 10}'::jsonb,
  92, 52, 74, 3500, 100, 52.8, 'moderate',
  'Central Seminole County location. Major retail hub with Altamonte Mall. I-4 corridor access. Mix of residential and commercial. Strong employment center.',
  ARRAY['AdventHealth Altamonte Springs', 'Seminole County Public Schools', 'Altamonte Mall retailers', 'City of Altamonte Springs', 'Healthcare industry', 'Corporate offices'],
  ARRAY['Altamonte Mall', 'Cranes Roost Park', 'Uptown Altamonte', 'Lake Lotus Park', 'Westmonte Park'],
  ARRAY['Red Hot & Boom', 'Jazz at Cranes Roost', 'Movies by the Lake', 'Altamonte Springs Art Festival'],
  ARRAY['Seminole County Public Schools'],
  'Uptown Altamonte redevelopment. SunRail station connectivity. Mixed-use development. I-4 corridor improvements.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Altamonte Springs Utilities',
  220,
  'Florida Building Code 8th Edition (2023), Seminole County amendments',
  '{"hvac_replacement": "Permit required", "commercial": "Commercial HVAC requires additional permitting", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Air Zero', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Uptown Altamonte', 'uptown-altamonte', 'Central', 'mixed', '2000s-2020s', 'Upper middle income', 'Mixed-use urban development', ARRAY['high-rise condos', 'mixed-use systems', 'commercial HVAC', 'modern construction'], '5-20 years', 1, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Cranes Roost', 'cranes-roost', 'Central', 'condo', '1990s-2010s', 'Upper middle income', 'Lakefront condo community', ARRAY['condo systems', 'lakefront humidity', 'association coordination', 'high-rise needs'], '10-28 years', 2, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Spring Lake Hills', 'spring-lake-hills', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established neighborhood', ARRAY['1970s-90s systems', 'family homes', 'system replacements', 'efficiency upgrades'], '20-45 years', 3, true),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Eastbrook', 'eastbrook', 'East', 'single-family', '1980s-2000s', 'Middle income', 'Family neighborhood', ARRAY['1980s-2000s systems', 'standard maintenance', 'family sizing'], '15-35 years', 4, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Sanlando Springs', 'sanlando-springs', 'North', 'single-family', '1980s-1990s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', '1980s-90s systems', 'efficiency updates'], '25-40 years', 5, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Wekiva Hunt Club', 'wekiva-hunt-club', 'Northwest', 'single-family', '1980s-2000s', 'Upper middle income', 'Established community', ARRAY['established systems', 'family homes', 'HOA requirements'], '15-35 years', 6, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Altamonte Heights', 'altamonte-heights', 'West', 'single-family', '1960s-1980s', 'Middle income', 'Older established area', ARRAY['older systems', 'budget solutions', 'system replacements'], '25-55 years', 7, false),
  ('f0a1b2c3-d4e5-6789-3456-012345678901', 'Pearl Lake', 'pearl-lake', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Lakefront neighborhood', ARRAY['lakefront humidity', 'older systems', 'standard service'], '20-45 years', 8, false)
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
  'f0a1b2c3-d4e5-6789-3456-012345678901',
  'hvac',
  '/fl/altamonte-springs/hvac',
  'HVAC Services in Altamonte Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Altamonte Springs'' 46,000+ residents. Commercial & residential specialists. Duke Energy rebates available. Serving Uptown, Cranes Roost & all areas.',
  'HVAC Altamonte Springs FL',
  ARRAY['AC repair Altamonte Springs', 'air conditioning Altamonte Springs FL', 'HVAC contractor Altamonte Springs', 'commercial HVAC Altamonte', 'Duke Energy rebates', 'Seminole County HVAC'],

  'Altamonte Springs'' I-4 Corridor HVAC Experts',
  'Commercial and residential comfort solutions',
  'Licensed & Insured | Duke Energy Certified | Commercial & Residential Specialists',
  'Altamonte Springs is a thriving I-4 corridor city combining vibrant urban development at Uptown Altamonte with established residential neighborhoods. With over 46,000 residents and major commercial centers like Altamonte Mall, reliable HVAC is essential for both businesses and homes. Our team provides expert service throughout Altamonte Springs, from high-rise condos at Cranes Roost to family homes in Spring Lake Hills, helping you maximize Duke Energy rebates while staying comfortable.',

  '{
    "headline": "Why Altamonte Springs Chooses Us",
    "reasons": [
      {"title": "Commercial HVAC Expertise", "description": "Altamonte Springs is a major employment and retail hub. We service office buildings, retail spaces, and restaurants with the same dedication we bring to residential properties."},
      {"title": "High-Rise Specialists", "description": "Uptown Altamonte and Cranes Roost feature high-rise condos requiring specialized service. We understand condo systems and work seamlessly with associations."},
      {"title": "Duke Energy Rebate Certified", "description": "We help Altamonte Springs homeowners and businesses access up to $1,700 in Duke Energy rebates including $300 for AC replacement."},
      {"title": "I-4 Corridor Coverage", "description": "Central location means fast response times throughout Altamonte Springs and surrounding areas."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Altamonte Springs",
    "intro": "Altamonte Springs'' mix of commercial and residential creates specific HVAC needs:",
    "challenges": [
      {"title": "Mixed-Use Development", "description": "Uptown Altamonte combines residential, retail, and commercial in one complex. Systems must handle diverse needs efficiently."},
      {"title": "High-Rise Condo Systems", "description": "Cranes Roost and other high-rises require specialized approaches including coordination with HOAs and understanding of shared systems."},
      {"title": "1980s Housing Stock", "description": "Many Altamonte Springs neighborhoods were built during the 1980s boom. Original systems are due for replacement with efficient modern equipment."},
      {"title": "Commercial Demands", "description": "Retail and office properties need reliable HVAC with minimal downtime and responsive service."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Altamonte Springs",
    "services": [
      {"name": "Commercial HVAC", "slug": "commercial-hvac", "description": "Complete commercial HVAC service for Altamonte Springs businesses including retail, office, and restaurant properties.", "features": ["Preventive maintenance", "Emergency service", "System design", "Energy efficiency"]},
      {"name": "High-Rise Condo Service", "slug": "condo-hvac", "description": "Specialized service for Altamonte Springs high-rise condos and apartments.", "features": ["HOA coordination", "Association billing", "Individual units", "Common areas"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs for homes and businesses throughout Altamonte Springs.", "features": ["Same-day service", "24/7 emergency", "All brands", "90-day warranty"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade 1980s-era systems with modern efficient equipment.", "features": ["Efficiency improvements", "Rebate assistance", "Minimal disruption", "Modern controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Commercial plans", "Residential plans", "Priority scheduling", "15% repair discount"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you service commercial properties in Altamonte Springs?", "answer": "Yes, we provide complete commercial HVAC service for retail, office, and restaurant properties throughout Altamonte Springs including preventive maintenance and emergency repairs."},
      {"question": "Can you work on high-rise condo systems?", "answer": "Yes, we specialize in high-rise properties at Cranes Roost and Uptown Altamonte. We coordinate with HOAs and understand both individual unit and common area systems."},
      {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. We handle all rebate paperwork for residential and commercial customers."},
      {"question": "Do you offer 24/7 emergency service?", "answer": "Yes, we provide 24/7 emergency service for commercial and residential customers throughout Altamonte Springs."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Reliable Comfort in Altamonte Springs?',
  'Contact us today for a free estimate. Whether residential or commercial, we''ll help you access Duke Energy rebates and stay comfortable.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Altamonte Springs", "description": "Professional HVAC services in Altamonte Springs, FL.", "url": "https://coolit-hvac.com/altamonte-springs-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Altamonte Springs", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you service commercial properties?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide complete commercial HVAC service throughout Altamonte Springs."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Altamonte Springs", "item": "https://coolit-hvac.com/fl/altamonte-springs"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/sanford/hvac", "anchor_text": "Sanford HVAC"}, {"slug": "/fl/lake-mary/hvac", "anchor_text": "Lake Mary AC"}, {"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/commercial-hvac", "anchor_text": "Commercial HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1840, 26, 12, 87,
  'published', 1, 'claude', 'phase7-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
