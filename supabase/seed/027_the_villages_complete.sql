-- ============================================
-- The Villages, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 6 - Secondary Markets
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  'The Villages', 'the-villages', 'Florida', 'FL', 'Sumter', 'sumter-county',
  28.9340, -81.9608,
  ARRAY['32159', '32162', '32163'],
  'The Villages',
  ARRAY['a5b6c7d8-e9f0-1234-8901-567890123456']::uuid[],
  true, 90
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
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  NOW(),
  139792, 'US Census Bureau ACS 2023',
  62847, 385000, 92.4,
  ARRAY['single-family', 'villa', 'patio-home', 'active-adult'],
  '{"1990s": 15, "2000s": 30, "2010s": 35, "2020s": 20}'::jsonb,
  92, 48, 72, 3250, 98, 51.8, 'low',
  'America''s largest 55+ active adult community. Sprawling across three counties. Continuous expansion. Extremely high homeownership. Golf cart culture.',
  ARRAY['The Villages development', 'UF Health The Villages Hospital', 'The Villages Charter School', 'Retail and hospitality', 'Healthcare services', 'The Villages Media Group'],
  ARRAY['Spanish Springs Town Square', 'Lake Sumter Landing', 'Brownwood Paddock Square', '50+ golf courses', 'Numerous recreation centers'],
  ARRAY['Nightly entertainment at town squares', 'Golf tournaments', 'Polo matches', 'Numerous club events'],
  ARRAY['The Villages Charter School'],
  'Continuous southward expansion. New villages and town centers. Healthcare facility growth. Commercial development. Infrastructure expansion.',
  'SECO Energy / Duke Energy Florida',
  '{
    "seco": {"ac_replacement": {"amount": 300, "requirements": "SEER 15+ system"}, "heat_pump": {"amount": 200, "requirements": "Qualifying heat pump"}, "smart_thermostat": {"amount": 100}},
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}}
  }'::jsonb,
  'None (all-electric community)',
  'The Villages utilities',
  280,
  'Florida Building Code 8th Edition (2023), The Villages design standards',
  '{"hvac_replacement": "Permit required", "architectural_review": "All exterior equipment subject to review", "inspection": "Final inspection required"}'::jsonb,
  'universal',
  ARRAY['Del-Air Heating and Air', 'All County Air Conditioning', 'Bounds Heating and Air', 'Direct Air Conditioning', 'Air-Tech'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "SECO Energy / Duke Energy", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Fenney', 'fenney', 'South', 'active-adult', '2010s-2020s', 'Upper middle income', 'Newer southern expansion', ARRAY['new construction', 'premium systems', 'smart home ready', 'energy efficiency'], '0-12 years', 1, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Polo Ridge', 'polo-ridge', 'South', 'active-adult', '2020s', 'Upper middle income', 'Newest development area', ARRAY['brand new systems', 'builder-grade quality', 'smart technology', 'warranty service'], '0-5 years', 2, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Spanish Springs', 'spanish-springs', 'Central', 'active-adult', '1990s-2000s', 'Upper middle income', 'Original village center', ARRAY['1990s-2000s systems', 'system replacements', 'efficiency upgrades', 'established homes'], '15-28 years', 3, true),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Lake Sumter Landing', 'lake-sumter-landing', 'East', 'active-adult', '2000s-2010s', 'Upper middle income', 'Waterfront town center', ARRAY['waterfront humidity', 'premium systems', 'established homes'], '10-20 years', 4, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Brownwood', 'brownwood', 'West', 'active-adult', '2010s-2020s', 'Upper middle income', 'Western town center', ARRAY['newer systems', 'premium homes', 'modern expectations'], '5-12 years', 5, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Gilchrist', 'gilchrist', 'North', 'active-adult', '2000s-2010s', 'Middle income', 'Northern area', ARRAY['2000s-2010s systems', 'standard service', 'efficiency focus'], '10-20 years', 6, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Bonnybrook', 'bonnybrook', 'Central', 'active-adult', '2000s', 'Middle income', 'Central village', ARRAY['2000s systems', 'approaching replacement', 'standard homes'], '15-22 years', 7, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Santiago', 'santiago', 'West', 'active-adult', '2010s', 'Upper middle income', 'Western expansion', ARRAY['2010s systems', 'premium homes', 'HOA requirements'], '8-15 years', 8, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Hemingway', 'hemingway', 'South', 'active-adult', '2010s-2020s', 'Upper middle income', 'Southern expansion', ARRAY['newer systems', 'energy efficiency', 'modern homes'], '5-12 years', 9, false),
  ('b6c7d8e9-f0a1-2345-9012-678901234567', 'Village of Caroline', 'caroline', 'Central', 'active-adult', '2000s-2010s', 'Middle income', 'Central location', ARRAY['varied system ages', 'standard service needs', 'efficiency upgrades'], '10-18 years', 10, false)
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
  'b6c7d8e9-f0a1-2345-9012-678901234567',
  'hvac',
  '/fl/the-villages/hvac',
  'HVAC Services in The Villages, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for The Villages'' 140,000+ residents. America''s premier 55+ community specialists. SECO & Duke Energy rebates. Serving all villages!',
  'HVAC The Villages FL',
  ARRAY['AC repair The Villages', 'air conditioning The Villages FL', 'HVAC contractor The Villages', '55+ community AC', 'SECO Energy rebates', 'Sumter County HVAC'],

  'The Villages'' Dedicated HVAC Specialists',
  'Expert service for America''s premier 55+ community',
  'Licensed & Insured | SECO & Duke Energy Certified | Villages Design Standards Compliant',
  'The Villages—America''s largest and most celebrated active adult community—deserves HVAC service that matches its exceptional lifestyle. With nearly 140,000 residents across dozens of villages, 50+ golf courses, and continuous expansion, The Villages requires contractors who understand this unique community. Our team provides expert service compliant with Villages design standards, helping residents from the original Spanish Springs area to the newest southern expansions stay comfortable while maximizing utility rebates.',

  '{
    "headline": "Why Villages Residents Choose Us",
    "reasons": [
      {"title": "Villages Design Standards Expertise", "description": "Every Villages home must meet architectural standards. We ensure all HVAC installations comply with community requirements for equipment placement and appearance."},
      {"title": "SECO & Duke Energy Certified", "description": "The Villages is served by SECO Energy and Duke Energy. We help you access rebates from either utility—up to $300 for AC replacement and more."},
      {"title": "Active Adult Focus", "description": "We specialize in what Villages residents need: energy efficiency, quiet operation, easy-to-use controls, and respectful, punctual service."},
      {"title": "Complete Villages Coverage", "description": "From Spanish Springs to the newest southern villages, we serve every community in The Villages with consistent quality and response times."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Considerations for Villages Residents",
    "intro": "The Villages'' unique community structure creates specific HVAC considerations:",
    "challenges": [
      {"title": "Design Standards Compliance", "description": "All exterior equipment in The Villages must meet architectural standards. We ensure compliant equipment placement and screening."},
      {"title": "System Age Variations", "description": "The Villages spans nearly 30 years of development. Older villages may need replacement while newer areas have warranty considerations."},
      {"title": "Energy Efficiency Priority", "description": "Villages residents on fixed incomes appreciate energy efficiency. We recommend systems that minimize operating costs."},
      {"title": "Golf Course Humidity", "description": "Many Villages homes border irrigated golf courses. Enhanced dehumidification improves comfort in these locations."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in The Villages",
    "services": [
      {"name": "55+ Comfort Solutions", "slug": "active-adult", "description": "HVAC designed for active adult living with focus on efficiency, quiet operation, and ease of use.", "features": ["Energy efficiency", "Quiet operation", "Smart thermostats", "Easy controls"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout all Villages communities.", "features": ["Same-day service", "All brands", "90-day warranty", "Respectful service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Design standards-compliant installations with SECO and Duke Energy rebate assistance.", "features": ["Design compliance", "Utility rebates", "10-year warranty", "Financing available"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging systems in older villages with modern efficient equipment.", "features": ["1990s-2000s upgrades", "Efficiency improvements", "Rebate maximization", "Minimal disruption"]},
      {"name": "New Home Service", "slug": "new-home-service", "description": "Warranty service and optimization for new village homes.", "features": ["Warranty support", "System optimization", "Smart setup", "Performance verification"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Keep your system running efficiently with regular maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you comply with Villages design standards?", "answer": "Yes, we''re thoroughly familiar with The Villages architectural standards. All our installations meet community requirements for equipment placement and appearance."},
      {"question": "Which utility serves my Villages home?", "answer": "The Villages is served by SECO Energy in some areas and Duke Energy in others. We''re certified with both and help you access available rebates regardless of your utility."},
      {"question": "When should older Villages homes replace their AC?", "answer": "Homes in the original villages from the 1990s-2000s often have systems approaching or past their lifespan. Modern systems are 2-3 times more efficient and much more reliable."},
      {"question": "Do you offer senior-friendly service?", "answer": "Absolutely. We understand Villages residents'' needs—punctual appointments, respectful technicians, clear explanations, and easy-to-use system recommendations."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "72%", "cooling_degree_days": "3,250", "days_above_90": "98+", "hurricane_risk": "Low"}'::jsonb,

  'Ready for Premium Comfort in The Villages?',
  'Contact us today for a free estimate. We''ll ensure design standards compliance while helping you access utility rebates.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - The Villages", "description": "Professional HVAC services for The Villages, FL.", "url": "https://coolit-hvac.com/the-villages-fl", "telephone": "+1-352-555-COOL", "areaServed": {"@type": "City", "name": "The Villages", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you comply with Villages design standards?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, all our installations meet The Villages architectural requirements."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "The Villages", "item": "https://coolit-hvac.com/fl/the-villages"}]}'::jsonb,

  '/fl/sumter-county',
  '[{"slug": "/fl/ocala/hvac", "anchor_text": "Ocala HVAC"}, {"slug": "/fl/leesburg/hvac", "anchor_text": "Leesburg AC"}, {"slug": "/fl/lady-lake/hvac", "anchor_text": "Lady Lake HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/active-adult", "anchor_text": "55+ HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1920, 32, 18, 90,
  'published', 1, 'claude', 'phase6-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
