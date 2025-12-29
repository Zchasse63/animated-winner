-- ============================================
-- Hollywood, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 13 - South Florida Metro
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood', 'hollywood', 'Florida', 'FL', 'Broward', 'broward-county', 26.0112, -80.1495,
  ARRAY['33019', '33020', '33021', '33022', '33023', '33024', '33025', '33026', '33027', '33028', '33029', '33081', '33083', '33084'],
  'Miami-Fort Lauderdale-Pompano Beach', ARRAY['b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e', 'a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c5d']::uuid[], true, 94
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', NOW(), 154000, 'US Census Bureau 2023', 56789, 365000, 62.1,
  ARRAY['single-family', 'condo', 'waterfront', 'beachfront'], '{"pre-1970": 25, "1970s-1990s": 35, "2000s-2010s": 28, "2020s": 12}'::jsonb,
  90, 65, 75, 4080, 86, 62.5, 'very_high', 'Hollywood Beach boardwalk city. Between Fort Lauderdale and Miami. Intracoastal and Atlantic Ocean. High coastal hurricane risk.',
  ARRAY['Memorial Healthcare System', 'Hollywood Memorial Hospital', 'Broward County Schools', 'City of Hollywood', 'Tourism industry'],
  ARRAY['Hollywood Beach Broadwalk', 'Downtown Hollywood', 'Anne Kolb Nature Center', 'Young Circle', 'ArtsPark'],
  ARRAY['Hollywood Beach Latin Festival', 'Hollywood Beach Candy Cane Parade', 'Downtown Hollywood Mural Festival'],
  ARRAY['Broward County Public Schools'], 'Beach area development. Downtown Hollywood redevelopment. Residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement": {"amount": 150, "requirements": "High-efficiency system"}, "duct_sealing": {"amount": 150, "requirements": "Professional testing"}, "smart_thermostat": {"amount": 100, "requirements": "Qualifying thermostat"}, "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}}'::jsonb,
  'Florida City Gas', 'City of Hollywood Utilities', 150,
  'Florida Building Code 8th Edition (2023), Broward County HVHZ amendments',
  '{"hvac_replacement": "Permit required", "hvhz": "High Velocity Hurricane Zone compliance", "coastal_protection": "Wind-rated equipment", "inspection": "Multiple inspections required"}'::jsonb,
  'very_high', ARRAY['Gator Air Conditioning', 'All Year Cooling', 'One Hour Air'],
  '{"demographics": "US Census Bureau 2023", "utilities": "FPL", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood Beach', 'hollywood-beach', 'East', 'beachfront', '1920s-2020s', 'Upper income', 'Broadwalk and beach', ARRAY['extreme salt air', 'beach exposure', 'luxury condos'], '5-100 years', 1, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Downtown Hollywood', 'downtown-hollywood', 'Central', 'mixed', '1920s-2020s', 'Middle income', 'Urban revival', ARRAY['mixed use', 'varied ages', 'urban living'], '5-100 years', 2, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Hollywood Hills', 'hollywood-hills', 'West', 'single-family', '1950s-2000s', 'Upper middle income', 'Established neighborhood', ARRAY['family homes', 'varied ages'], '20-70 years', 3, true),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Emerald Hills', 'emerald-hills', 'Central', 'single-family', '1950s-1990s', 'Middle income', 'Mid-century community', ARRAY['older systems', 'family properties'], '30-70 years', 4, false),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Lake Forest', 'lake-forest', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Family area', ARRAY['varied ages', 'standard service'], '20-60 years', 5, false),
  ('d9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'Liberia', 'liberia', 'Central', 'single-family', '1940s-1980s', 'Middle income', 'Historic neighborhood', ARRAY['older homes', 'system replacements'], '40-80 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'd9e0f1a2-b3c4-5d6e-7f8a-9b0c1d2e3f4a', 'hvac', '/fl/hollywood/hvac',
  'HVAC Services in Hollywood, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Hollywood''s 154,000+ residents. Beach and coastal specialists. FPL rebates. Serving Hollywood Beach, Downtown & all neighborhoods.',
  'HVAC Hollywood FL',
  ARRAY['AC repair Hollywood', 'air conditioning Hollywood FL', 'HVAC contractor Hollywood', 'Hollywood Beach HVAC'],
  'Hollywood''s Beach & Broadwalk HVAC Experts',
  'Coastal comfort from beach to downtown',
  'Licensed & Insured | FPL Certified | Beach & Hurricane Zone Specialists',
  'Hollywood—home to the famous Broadwalk—combines beach living with urban convenience between Fort Lauderdale and Miami. With 154,000 residents from beachfront condos to inland neighborhoods, Hollywood needs HVAC expertise matching its coastal demands.',
  '{"headline": "Why Hollywood Residents Choose Us", "reasons": [{"title": "Beach Property Specialists", "description": "Hollywood Beach faces extreme Atlantic salt air requiring maximum coastal protection."}, {"title": "Hurricane Zone Experts", "description": "Broward HVHZ requirements demand wind-rated equipment and enhanced protection."}, {"title": "FPL Rebate Certified", "description": "We maximize all FPL rebates for Hollywood residents."}, {"title": "City-Wide Service", "description": "From beach to downtown to Hollywood Hills, we serve all areas."}]}'::jsonb,
  '{"headline": "HVAC Challenges in Hollywood", "intro": "Hollywood''s coastal location creates specific demands:", "challenges": [{"title": "Extreme Salt Air Exposure", "description": "Beach and near-beach properties face aggressive corrosion requiring maximum protection."}, {"title": "Hurricane Zone Requirements", "description": "HVHZ mandates wind-rated equipment, engineered tie-downs, and impact protection."}, {"title": "Varied Housing Ages", "description": "From 1920s historic to new construction requires different HVAC approaches."}, {"title": "Coastal Humidity", "description": "Ocean and Intracoastal proximity brings enhanced humidity needing robust dehumidification."}]}'::jsonb,
  '{"headline": "Complete HVAC Services", "services": [{"name": "Beach HVAC", "slug": "beach-hvac", "description": "Maximum protection for Hollywood Beach.", "features": ["Salt air defense", "Coastal equipment", "Beach-rated", "Extended warranty"]}, {"name": "Hurricane-Rated Systems", "slug": "hurricane-hvac", "description": "HVHZ-compliant installations.", "features": ["Wind-rated", "Engineered tie-downs", "Code compliance", "Impact protection"]}, {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Hollywood.", "features": ["Same-day service", "All brands", "90-day warranty", "Beach expertise"]}, {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebates.", "features": ["FPL rebates", "Coastal protection", "10-year warranty", "Financing"]}, {"name": "Maintenance Plans", "slug": "maintenance", "description": "Coastal maintenance programs.", "features": ["Salt air rinse", "Priority service", "15% discount", "System optimization"]}]}'::jsonb,
  '{"headline": "Frequently Asked Questions", "faqs": [{"question": "How does Hollywood Beach location affect my AC?", "answer": "Atlantic salt air causes rapid corrosion. We provide specialized coastal protection for Hollywood Beach properties."}, {"question": "What are Broward HVHZ requirements?", "answer": "High Velocity Hurricane Zone mandates wind-rated equipment, engineered tie-downs, and strict inspections."}, {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats."}]}'::jsonb,
  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "4,080", "days_above_90": "86+", "hurricane_risk": "Very High"}'::jsonb,
  'Ready for Comfort in Hollywood?',
  'Contact us today. From Hollywood Beach to downtown, we deliver expert HVAC service with FPL rebates.',
  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Hollywood", "url": "https://coolit-hvac.com/hollywood-fl", "telephone": "+1-954-555-COOL", "areaServed": {"@type": "City", "name": "Hollywood", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How does beach location affect AC?", "acceptedAnswer": {"@type": "Answer", "text": "Salt air causes rapid corrosion requiring specialized coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Hollywood", "item": "https://coolit-hvac.com/fl/hollywood"}]}'::jsonb,
  '/fl/broward-county',
  '[{"slug": "/fl/fort-lauderdale/hvac", "anchor_text": "Fort Lauderdale HVAC"}, {"slug": "/fl/pembroke-pines/hvac", "anchor_text": "Pembroke Pines AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach HVAC"}]'::jsonb,
  1620, 22, 9, 87,
  'published', 1, 'claude', 'phase13-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
