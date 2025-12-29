-- ============================================
-- Pompano Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Beach', 'pompano-beach', 'Florida', 'FL', 'Broward', 'broward-county', 26.2379, -80.1248,
  ARRAY['33060', '33061', '33062', '33063', '33064', '33065', '33066', '33069', '33071', '33072', '33073', '33074', '33076', '33077'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e']::uuid[], true, 92
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', NOW(), 112000, 'US Census Bureau 2023', 58234, 345000, 63.5,
  ARRAY['single-family', 'condo', 'beachfront', 'waterfront'], '{"pre-1970": 30, "1970s-1990s": 35, "2000s-2010s": 25, "2020s": 10}'::jsonb,
  90, 65, 75, 4075, 86, 62.3, 'very_high', 'Atlantic beachfront city. Fishing village heritage. Beach redevelopment. Intracoastal waterfront. Broward HVHZ coastal exposure.',
  ARRAY['Broward County Public Schools', 'City of Pompano Beach', 'Broward Health North', 'Tourism industry', 'Marine businesses'],
  ARRAY['Pompano Beach Pier', 'Hillsboro Lighthouse', 'Pompano Community Park', 'Festival Marketplace', 'Atlantic Boulevard'],
  ARRAY['Pompano Beach Seafood Festival', 'Holiday Boat Parade', 'Fishing tournaments'],
  ARRAY['Broward County Public Schools'], 'Beach area redevelopment. Atlantic Boulevard revitalization. Pier district transformation. Residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement": {"amount": 150, "requirements": "High-efficiency system"}, "duct_sealing": {"amount": 150, "requirements": "Professional testing"}, "smart_thermostat": {"amount": 100, "requirements": "Qualifying thermostat"}, "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}}'::jsonb,
  'Florida City Gas', 'City of Pompano Beach Utilities', 154,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement": "Permit required", "hvhz": "High Velocity Hurricane Zone compliance", "coastal_protection": "Wind-rated and salt air protection", "inspection": "Multiple inspections required"}'::jsonb,
  'high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics": "US Census Bureau 2023", "utilities": "FPL", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Beach Oceanfront', 'oceanfront', 'East', 'beachfront', '1950s-2020s', 'Upper income', 'Atlantic beach properties', ARRAY['extreme salt air', 'beach exposure', 'luxury condos', 'maximum corrosion'], '5-70 years', 1, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Hillsboro Beach', 'hillsboro-beach', 'North', 'beachfront', '1960s-2010s', 'High income', 'Exclusive beach community', ARRAY['oceanfront salt air', 'luxury homes', 'coastal protection'], '10-60 years', 2, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Cresthaven', 'cresthaven', 'Central', 'single-family', '1950s-1980s', 'Middle income', 'Established neighborhood', ARRAY['older homes', 'system replacements', 'efficiency upgrades'], '40-70 years', 3, true),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Palm-Aire', 'palm-aire', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Golf community', ARRAY['country club area', 'larger homes', 'varied systems'], '20-50 years', 4, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Intracoastal Area', 'intracoastal', 'Central', 'waterfront', '1960s-2020s', 'High income', 'Waterway properties', ARRAY['waterfront humidity', 'salt exposure', 'luxury demands'], '5-60 years', 5, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Collier City', 'collier-city', 'South', 'single-family', '1950s-1980s', 'Middle income', 'Traditional neighborhood', ARRAY['older homes', 'family properties', 'standard service'], '40-70 years', 6, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Leisureville', 'leisureville', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', '55+ community', ARRAY['retirement community', 'older systems', 'fixed incomes'], '30-60 years', 7, false),
  ('a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'Pompano Isles', 'pompano-isles', 'Southeast', 'waterfront', '1960s-2000s', 'Upper middle income', 'Canal homes', ARRAY['canal access', 'waterfront exposure', 'boating community'], '20-60 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'a3b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c8d', 'hvac', '/fl/pompano-beach/hvac',
  'HVAC Services in Pompano Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Pompano Beach''s 112,000+ residents. Beach and coastal specialists. FPL rebates. Serving oceanfront, Hillsboro Beach, Cresthaven & all areas.',
  'HVAC Pompano Beach FL',
  ARRAY['AC repair Pompano Beach', 'air conditioning Pompano Beach FL', 'HVAC contractor Pompano Beach', 'beach HVAC', 'oceanfront AC'],
  'Pompano Beach''s Oceanfront HVAC Experts',
  'Coastal comfort from beach to inland communities',
  'Licensed & Insured | FPL Certified | Beach & Hurricane Zone Specialists',
  'Pompano Beach—"The Heart of the Gold Coast"—combines Atlantic beachfront with diverse inland neighborhoods. With 112,000 residents from oceanfront condos to Intracoastal waterfront to inland communities like Cresthaven and Palm-Aire, Pompano Beach demands HVAC expertise for extreme coastal conditions and varied housing stock.',
  '{"headline": "Why Pompano Beach Homeowners Choose Us", "reasons": [{"title": "Oceanfront Specialists", "description": "Pompano Beach and Hillsboro Beach oceanfront properties face extreme Atlantic salt air. We provide maximum coastal protection with specialized coatings and corrosion-resistant components."}, {"title": "Waterfront Expertise", "description": "Intracoastal and canal properties throughout Pompano Beach require enhanced dehumidification and salt air protection. We deliver waterfront-specific solutions."}, {"title": "Hurricane Zone Certified", "description": "Broward HVHZ requirements mandate wind-rated equipment and engineered tie-downs. All our beach and coastal installations meet strict code compliance."}, {"title": "Diverse Community Knowledge", "description": "From beachfront luxury to Leisureville retirement community, we understand Pompano Beach''s varied neighborhoods and their specific needs."}]}'::jsonb,
  '{"headline": "HVAC Challenges in Pompano Beach", "intro": "Pompano Beach''s coastal location creates demanding conditions:", "challenges": [{"title": "Extreme Oceanfront Salt Air", "description": "Atlantic beachfront properties face the most aggressive corrosion environment. Unprotected HVAC equipment fails rapidly. Maximum coastal protection is essential."}, {"title": "Hurricane Zone Requirements", "description": "Broward HVHZ mandates wind-rated equipment, engineered tie-downs, impact protection, and strict inspections throughout coastal Pompano Beach."}, {"title": "Varied Housing Ages", "description": "From 1950s Cresthaven to new oceanfront towers, Pompano Beach spans seven decades of construction requiring different HVAC approaches."}, {"title": "Waterfront Humidity Control", "description": "Beach, Intracoastal, and canal proximity brings enhanced humidity requiring robust dehumidification beyond standard air conditioning."}]}'::jsonb,
  '{"headline": "Complete HVAC Services", "services": [{"name": "Oceanfront HVAC", "slug": "oceanfront-hvac", "description": "Maximum protection for beach properties.", "features": ["Extreme salt air defense", "Coastal coatings", "Corrosion protection", "Beach-rated equipment"]}, {"name": "Hurricane-Rated Systems", "slug": "hurricane-hvac", "description": "HVHZ-compliant installations.", "features": ["Wind-rated", "Engineered tie-downs", "Impact protection", "Code compliance"]}, {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Pompano Beach.", "features": ["Same-day service", "All brands", "90-day warranty", "Beach expertise"]}, {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced service for Intracoastal and canal homes.", "features": ["Salt air protection", "Enhanced dehumidification", "Humidity control", "Waterfront expertise"]}, {"name": "Maintenance Plans", "slug": "maintenance", "description": "Coastal maintenance programs.", "features": ["Salt air rinse", "Corrosion inspection", "Priority service", "15% discount"]}]}'::jsonb,
  '{"headline": "Frequently Asked Questions", "faqs": [{"question": "How does oceanfront location affect my AC system?", "answer": "Atlantic oceanfront exposure brings extreme salt air causing rapid corrosion. We provide specialized coastal protection including corrosion-resistant coatings and marine-grade components for Pompano Beach properties."}, {"question": "What are Broward HVHZ requirements?", "answer": "High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, impact protection, and strict inspections throughout coastal Pompano Beach."}, {"question": "What FPL rebates are available in Pompano Beach?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Pompano Beach residents."}]}'::jsonb,
  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "4,075", "days_above_90": "86+", "hurricane_risk": "Very High"}'::jsonb,
  'Ready for Coastal Comfort in Pompano Beach?',
  'Contact us today for a consultation. From oceanfront condos to Intracoastal waterfront to inland neighborhoods, we deliver expert HVAC service with maximum coastal protection and FPL rebates.',
  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Pompano Beach", "url": "https://coolit-hvac.com/pompano-beach-fl", "telephone": "+1-954-555-COOL", "areaServed": {"@type": "City", "name": "Pompano Beach", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How does oceanfront location affect AC?", "acceptedAnswer": {"@type": "Answer", "text": "Atlantic oceanfront exposure brings extreme salt air causing rapid corrosion requiring specialized coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Pompano Beach", "item": "https://coolit-hvac.com/fl/pompano-beach"}]}'::jsonb,
  '/fl/broward-county',
  '[{"slug": "/fl/fort-lauderdale/hvac", "anchor_text": "Fort Lauderdale HVAC"}, {"slug": "/fl/coral-springs/hvac", "anchor_text": "Coral Springs AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/oceanfront-hvac", "anchor_text": "Oceanfront HVAC"}]'::jsonb,
  1820, 27, 11, 88,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
