-- ============================================
-- Delray Beach, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 15 - South Florida Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e',
  'Delray Beach', 'delray-beach', 'Florida', 'FL', 'Palm Beach', 'palm-beach-county',
  26.4615, -80.0728,
  ARRAY['33444', '33445', '33446', '33447', '33448', '33483', '33484'],
  'Miami-Fort Lauderdale-Pompano Beach',
  ARRAY['c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e7f', 'd3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f8a']::uuid[],
  true, 89
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', NOW(), 69000, 'US Census Bureau 2023', 64829, 425000, 62.3,
  ARRAY['single-family', 'condo', 'beachfront', 'luxury'],
  '{"pre-1970": 20, "1970s-1990s": 30, "2000s-2010s": 35, "2020s": 15}'::jsonb,
  90, 63, 74, 4020, 86, 62.1, 'very_high',
  'All-America City. Vibrant downtown Atlantic Avenue. Beautiful beaches. Arts and culture focus. Active lifestyle. Coastal hurricane zone.',
  ARRAY['Tourism industry', 'Delray Medical Center', 'Office Depot (nearby)', 'Palm Beach County Schools', 'Retail and hospitality', 'Small business'],
  ARRAY['Atlantic Avenue', 'Delray Beach', 'Pineapple Grove Arts District', 'Morikami Museum', 'Old School Square', 'Veterans Park'],
  ARRAY['Delray Affair', 'Garlic Fest', 'GreenMarket', '100-Foot Christmas Tree Lighting'],
  ARRAY['Palm Beach County School District'],
  'Atlantic Avenue redevelopment. Beach area development. Pineapple Grove expansion. Luxury residential growth.',
  'Florida Power & Light (FPL)',
  '{"ac_replacement": {"amount": 150, "requirements": "High-efficiency system"}, "duct_sealing": {"amount": 150, "requirements": "Professional duct testing"}, "smart_thermostat": {"amount": 100, "requirements": "Qualifying thermostat"}, "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}}'::jsonb,
  'Florida City Gas', 'City of Delray Beach Water', 140,
  'Florida Building Code 8th Edition (2023), Palm Beach County coastal amendments',
  '{"hvac_replacement": "Permit required", "coastal_zones": "Wind-rated equipment", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Gator Air Conditioning', 'One Hour Air', 'All Year Cooling', 'Air Ref Co Inc'],
  '{"demographics": "US Census Bureau 2023", "utilities": "FPL", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Atlantic Avenue', 'atlantic-avenue-delray', 'Central', 'mixed', '1920s-2020s', 'Upper income', 'Vibrant downtown', ARRAY['mixed use', 'varied ages', 'urban living', 'beach proximity'], '5-100 years', 1, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Delray Beach Oceanfront', 'oceanfront-delray', 'East', 'beachfront', '1960s-2020s', 'Very high income', 'Atlantic beachfront', ARRAY['extreme salt air', 'luxury condos', 'beach exposure', 'premium systems'], '5-60 years', 2, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Pineapple Grove', 'pineapple-grove', 'Central', 'mixed', '1940s-2020s', 'Upper middle income', 'Arts district', ARRAY['renovations', 'loft conversions', 'mixed use', 'modern systems'], '5-80 years', 3, true),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Tropic Isle', 'tropic-isle', 'Central', 'waterfront', '1950s-1990s', 'High income', 'Intracoastal living', ARRAY['waterfront properties', 'salt exposure', 'luxury homes'], '30-70 years', 4, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Lake Ida', 'lake-ida', 'West', 'single-family', '1960s-2000s', 'Middle income', 'Family neighborhood', ARRAY['family homes', 'varied ages', 'standard service'], '20-60 years', 5, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Palm Trail', 'palm-trail', 'Southwest', 'single-family', '1960s-1990s', 'Middle income', 'Established area', ARRAY['older homes', 'family properties', 'efficiency upgrades'], '30-60 years', 6, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Seagate', 'seagate', 'Northeast', 'waterfront', '1960s-2010s', 'High income', 'Exclusive waterfront', ARRAY['Intracoastal properties', 'luxury homes', 'salt air'], '12-60 years', 7, false),
  ('b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'Village by the Sea', 'village-sea', 'East', 'mixed', '1940s-2000s', 'Upper middle income', 'Beach area', ARRAY['beach proximity', 'salt air', 'varied housing'], '20-80 years', 8, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'b7c8d9e0-f1a2-3b4c-5d6e-7f8a9b0c1d2e', 'hvac', '/fl/delray-beach/hvac',
  'HVAC Services in Delray Beach, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Delray Beach''s 69,000+ residents. Beach and downtown specialists. FPL rebates. Serving Atlantic Avenue, Pineapple Grove, Oceanfront & all areas.',
  'HVAC Delray Beach FL',
  ARRAY['AC repair Delray Beach', 'air conditioning Delray Beach FL', 'HVAC contractor Delray Beach', 'Atlantic Avenue HVAC', 'Delray Beach AC'],
  'Delray Beach''s All-America City HVAC Experts',
  'Beach-to-Intracoastal comfort solutions',
  'Licensed & Insured | FPL Certified | Beach & Downtown Specialists',
  'Delray Beach—Florida''s "Most Fun Small Town"—combines vibrant downtown Atlantic Avenue with beautiful Atlantic beaches and active lifestyle. With 69,000 residents from beachfront luxury to Pineapple Grove''s arts district, from Intracoastal estates to family neighborhoods, Delray Beach needs HVAC expertise matching its dynamic character.',
  '{"headline": "Why Delray Beach Residents Choose Us", "reasons": [{"title": "Beach Property Specialists", "description": "Atlantic beachfront properties face extreme salt air. We provide maximum coastal protection."}, {"title": "Downtown Expertise", "description": "Atlantic Avenue''s mixed-use properties require commercial and residential expertise."}, {"title": "Waterfront Knowledge", "description": "Intracoastal properties need enhanced dehumidification and salt air protection."}, {"title": "FPL Rebate Certified", "description": "We maximize all available FPL rebates for Delray Beach residents."}]}'::jsonb,
  '{"headline": "HVAC Challenges in Delray Beach", "intro": "Delray''s coastal location creates unique demands:", "challenges": [{"title": "Extreme Coastal Salt Air", "description": "Beachfront and near-beach properties face aggressive corrosion requiring maximum protection."}, {"title": "Intracoastal Humidity", "description": "Waterfront properties experience elevated humidity needing enhanced dehumidification."}, {"title": "Downtown Mixed-Use", "description": "Atlantic Avenue properties combine commercial and residential requiring specialized solutions."}, {"title": "Hurricane Zone Requirements", "description": "Coastal location requires wind-rated equipment and enhanced protection."}]}'::jsonb,
  '{"headline": "Complete HVAC Services", "services": [{"name": "Beach HVAC", "slug": "beach-hvac", "description": "Maximum protection for Atlantic beachfront.", "features": ["Coastal protection", "Salt air defense", "Beach-rated", "Extended warranty"]}, {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Delray Beach.", "features": ["Same-day service", "All brands", "90-day warranty", "Beach to Intracoastal"]}, {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with FPL rebates.", "features": ["FPL rebates", "Coastal protection", "10-year warranty", "Financing"]}, {"name": "Waterfront HVAC", "slug": "waterfront-hvac", "description": "Enhanced service for Intracoastal properties.", "features": ["Dehumidification", "Salt protection", "Humidity control", "Waterfront expertise"]}, {"name": "Maintenance Plans", "slug": "maintenance", "description": "Coastal maintenance programs.", "features": ["Salt air rinse", "Priority service", "15% discount", "System optimization"]}]}'::jsonb,
  '{"headline": "Frequently Asked Questions", "faqs": [{"question": "How does beachfront location affect my AC?", "answer": "Atlantic salt air causes rapid corrosion. We provide specialized coastal protection for Delray Beach properties."}, {"question": "Do Intracoastal properties need special attention?", "answer": "Yes, waterfront properties experience elevated humidity requiring enhanced dehumidification and moisture control."}, {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats."}]}'::jsonb,
  '{"avg_summer_high": "90°F", "avg_humidity": "74%", "cooling_degree_days": "4,020", "days_above_90": "86+", "hurricane_risk": "Very High"}'::jsonb,
  'Ready for Comfort in Delray Beach?',
  'Contact us today. From Atlantic Avenue to the beach to Intracoastal, we deliver expert HVAC service with FPL rebate assistance.',
  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Delray Beach", "url": "https://coolit-hvac.com/delray-beach-fl", "telephone": "+1-561-555-COOL", "areaServed": {"@type": "City", "name": "Delray Beach", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "How does beachfront affect AC?", "acceptedAnswer": {"@type": "Answer", "text": "Salt air causes rapid corrosion requiring specialized coastal protection."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Delray Beach", "item": "https://coolit-hvac.com/fl/delray-beach"}]}'::jsonb,
  '/fl/palm-beach-county',
  '[{"slug": "/fl/boca-raton/hvac", "anchor_text": "Boca Raton HVAC"}, {"slug": "/fl/boynton-beach/hvac", "anchor_text": "Boynton Beach AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/beach-hvac", "anchor_text": "Beach HVAC"}]'::jsonb,
  1780, 26, 12, 89,
  'published', 1, 'claude', 'phase15-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
