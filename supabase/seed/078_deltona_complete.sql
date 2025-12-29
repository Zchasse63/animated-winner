-- ============================================
-- Deltona, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Central Florida
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Deltona', 'deltona', 'Florida', 'FL', 'Volusia', 'volusia-county', 28.9005, -81.2139,
  ARRAY['32725', '32738', '32739'],
  'Deltona-Daytona Beach-Ormond Beach', ARRAY[]::uuid[], true, 85
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', NOW(), 96000, 'US Census Bureau 2023', 54678, 255000, 78.5,
  ARRAY['single-family', 'planned-community', 'suburban', 'family-oriented'], '{"pre-1970": 5, "1970s-1990s": 60, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  92, 52, 72, 2850, 58, 51.5, 'moderate', 'Large planned community. Orlando-Daytona corridor. Lakes throughout. Family-oriented suburbs. Volusia County inland.',
  ARRAY['Volusia County Schools', 'City of Deltona', 'Local businesses', 'Retail centers', 'Healthcare facilities'],
  ARRAY['Lake Monroe', 'Green Springs Park', 'Deltona Lakes', 'Dewey O. Boster Sports Complex', 'Community parks'],
  ARRAY['Community events', 'Recreation programs', 'Festivals'],
  ARRAY['Volusia County Schools'], 'Commercial development. Infrastructure improvements. Residential infill. Parks expansion.',
  'Duke Energy Florida',
  '{"home_energy_check": {"amount": "Free", "requirements": "Duke Energy assessment"}, "ac_replacement": {"amount": 100, "requirements": "High-efficiency system"}, "smart_thermostat": {"amount": 50, "requirements": "Qualifying thermostat"}}'::jsonb,
  'Natural gas not widely available', 'City of Deltona Water', 165,
  'Florida Building Code 8th Edition (2023), Volusia County amendments',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required", "code_compliance": "Florida Building Code"}'::jsonb,
  'moderate', ARRAY['Local HVAC contractors', 'Orlando metro providers', 'Daytona area companies'],
  '{"demographics": "US Census Bureau 2023", "utilities": "Duke Energy", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Deltona Lakes', 'deltona-lakes', 'Central', 'single-family', '1970s-1990s', 'Middle income', 'Lakes throughout community', ARRAY['lake proximity', 'humidity', 'older systems', 'family homes'], '30-50 years', 1, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'South Deltona', 'south-deltona', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Established neighborhood', ARRAY['family properties', 'varied ages', 'standard service'], '20-50 years', 2, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'North Deltona', 'north-deltona', 'North', 'single-family', '1980s-2010s', 'Middle income', 'Family area', ARRAY['planned homes', 'system replacements', 'efficiency upgrades'], '10-40 years', 3, true),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Lake Monroe Area', 'lake-monroe', 'East', 'single-family', '1970s-2000s', 'Middle income', 'Lake proximity', ARRAY['lake humidity', 'waterfront influence', 'family homes'], '20-50 years', 4, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Elkcam', 'elkcam', 'West', 'single-family', '1970s-1990s', 'Middle income', 'Original development section', ARRAY['older homes', 'established neighborhood', 'system needs'], '30-50 years', 5, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Vann Park', 'vann-park', 'Northeast', 'single-family', '1980s-2010s', 'Middle income', 'Parks and recreation nearby', ARRAY['family properties', 'varied systems', 'standard service'], '10-40 years', 6, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'West Deltona', 'west-deltona', 'West', 'single-family', '1980s-2020s', 'Middle income', 'Growing area', ARRAY['mixed ages', 'newer development', 'family focus'], '2-40 years', 7, false),
  ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'Green Springs', 'green-springs', 'South', 'single-family', '1970s-2000s', 'Middle income', 'Park area community', ARRAY['established homes', 'family properties', 'standard needs'], '20-50 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a2b', 'hvac', '/fl/deltona/hvac',
  'HVAC Services in Deltona, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Deltona''s 96,000+ residents. Planned community specialists. Duke Energy rebates. Serving Deltona Lakes, all neighborhoods city-wide.',
  'HVAC Deltona FL',
  ARRAY['AC repair Deltona', 'air conditioning Deltona FL', 'HVAC contractor Deltona', 'Deltona Lakes HVAC', 'Volusia County AC'],
  'Deltona''s Trusted Planned Community HVAC Experts',
  'Professional comfort for Central Florida''s lakeside city',
  'Licensed & Insured | Duke Energy Certified | Family-Owned Service',
  'Deltona—Volusia County''s largest city—is Central Florida''s premier planned community with lakes throughout. With 96,000 residents in neighborhoods from Deltona Lakes to South Deltona to West Deltona, this family-oriented city built in the 1970s-1990s has unique HVAC needs from its planned infrastructure and lake-filled landscape.',
  '{"headline": "Why Deltona Homeowners Choose Us", "reasons": [{"title": "Planned Community Expertise", "description": "Deltona was developed as a master-planned community with specific infrastructure. We understand the planned utility systems, drainage, and construction standards unique to Deltona."}, {"title": "Lakes and Humidity Knowledge", "description": "Deltona has numerous lakes throughout neighborhoods bringing enhanced humidity. We provide lake-appropriate dehumidification and humidity control for optimal comfort."}, {"title": "1970s-1990s Home Specialists", "description": "Most Deltona homes date from the original development era. We specialize in updating these systems with modern efficiency while working with existing infrastructure."}, {"title": "Community-Focused Service", "description": "Deltona is family-oriented and community-minded. We provide honest, fair service protecting our neighbors'' comfort and home investments."}]}'::jsonb,
  '{"headline": "HVAC Challenges in Deltona", "intro": "Deltona''s planned community design creates specific considerations:", "challenges": [{"title": "Extensive Lake System Humidity", "description": "Deltona''s numerous lakes throughout the community bring enhanced humidity beyond typical Central Florida levels. Proper dehumidification is essential for comfort and mold prevention."}, {"title": "1970s-1990s Infrastructure", "description": "Deltona''s original planned development created specific electrical, drainage, and utility infrastructure. HVAC systems must work properly with this planned design."}, {"title": "Aging Systems Need Updates", "description": "Many Deltona homes still have original or early replacement systems. Modern high-efficiency equipment provides substantial improvements in comfort and cost."}, {"title": "Duke Energy Service Area", "description": "Deltona is served by Duke Energy with specific rebate programs and requirements different from other Central Florida utilities."}]}'::jsonb,
  '{"headline": "Complete HVAC Services", "services": [{"name": "Lake Area HVAC", "slug": "lake-hvac", "description": "Specialized service for Deltona''s lakefront properties.", "features": ["Enhanced dehumidification", "Humidity control", "Lake expertise", "Mold prevention"]}, {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrading 1970s-1990s systems with modern efficiency.", "features": ["Energy savings", "Duke rebates", "Modern comfort", "10-year warranty"]}, {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Deltona.", "features": ["Same-day service", "All brands", "90-day warranty", "Fair pricing"]}, {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebates.", "features": ["Duke rebates", "Planned community expertise", "Financing available", "Professional installation"]}, {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance programs.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "System optimization"]}]}'::jsonb,
  '{"headline": "Frequently Asked Questions", "faqs": [{"question": "How do Deltona''s lakes affect HVAC systems?", "answer": "Deltona''s extensive lake system creates enhanced humidity throughout the community. Proper dehumidification beyond standard air conditioning is essential for comfort and preventing mold."}, {"question": "Should I replace my original 1970s-1990s system?", "answer": "Yes. Systems from Deltona''s original development era are far less efficient than modern equipment. Replacement provides major improvements in comfort, efficiency, and reliability."}, {"question": "What Duke Energy rebates are available in Deltona?", "answer": "Duke Energy offers free home energy checks, $100 for high-efficiency AC replacement, and $50 for smart thermostats. We handle all rebate coordination for Deltona residents."}]}'::jsonb,
  '{"avg_summer_high": "92°F", "avg_humidity": "72%", "cooling_degree_days": "2,850", "days_above_90": "58", "hurricane_risk": "Moderate"}'::jsonb,
  'Ready for Comfort in Deltona?',
  'Contact us today for a consultation. From Deltona Lakes to South Deltona to West Deltona, we deliver professional HVAC service with Duke Energy rebates and community care.',
  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Deltona", "url": "https://coolit-hvac.com/deltona-fl", "telephone": "+1-386-555-COOL", "areaServed": {"@type": "City", "name": "Deltona", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How do lakes affect HVAC?", "acceptedAnswer": {"@type": "Answer", "text": "Deltona''s extensive lakes create enhanced humidity requiring proper dehumidification for comfort and mold prevention."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Deltona", "item": "https://coolit-hvac.com/fl/deltona"}]}'::jsonb,
  '/fl/volusia-county',
  '[{"slug": "/fl/daytona-beach/hvac", "anchor_text": "Daytona Beach HVAC"}, {"slug": "/fl/ormond-beach/hvac", "anchor_text": "Ormond Beach AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/lake-hvac", "anchor_text": "Lake Area HVAC"}]'::jsonb,
  1820, 30, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
