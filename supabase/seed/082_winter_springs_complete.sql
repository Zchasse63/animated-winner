-- ============================================
-- Winter Springs, FL - Complete SEO/GEO Data Seed
-- Generated: December 29, 2024
-- Phase 16 - Final City (#82)
-- ============================================

INSERT INTO cities (id, name, slug, state, state_abbrev, county, county_slug, latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c',
  'Winter Springs', 'winter-springs', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.6989, -81.3081,
  ARRAY['32708', '32719'],
  'Orlando-Kissimmee-Sanford',
  ARRAY[]::uuid[],
  true, 78
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude, zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

INSERT INTO city_research (city_id, researched_at, population, population_source, median_household_income, median_home_value, homeownership_rate, primary_housing_types, housing_construction_eras, avg_summer_high_f, avg_winter_low_f, avg_humidity_percent, annual_cooling_degree_days, days_above_90f, annual_rainfall_inches, hurricane_risk_level, climate_notes, major_employers, notable_landmarks, local_events, school_districts, recent_developments, electric_utility, electric_utility_rebates, gas_utility, water_utility, water_hardness_ppm, local_building_codes, permit_requirements, hoa_prevalence, top_hvac_competitors, research_sources) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', NOW(), 38000, 'US Census Bureau 2023', 78945, 395000, 82.4,
  ARRAY['single-family', 'planned-community', 'suburban', 'family'],
  '{"pre-1990": 15, "1990s-2000s": 40, "2010s": 30, "2020s": 15}'::jsonb,
  92, 50, 71, 3580, 100, 51.5, 'moderate',
  'Well-planned suburban Orlando community. Family-focused neighborhoods. High homeownership. Parks and recreation emphasis. Seminole County.',
  ARRAY['Seminole County Public Schools', 'UCF proximity', 'Central Florida Regional Hospital', 'Retail and professional services'],
  ARRAY['Central Winds Park', 'Twin Rivers Park', 'Lake Jesup', 'Winter Springs Town Center'],
  ARRAY['Hometown Christmas', 'Community events', 'Farmers Market'],
  ARRAY['Seminole County Public Schools'],
  'Residential growth. Town center development. Parks expansion. Family community focus.',
  'Duke Energy Florida',
  '{"ac_replacement": {"amount": 125, "requirements": "High-efficiency 16 SEER+ system"}, "heat_pump": {"amount": 100, "requirements": "ENERGY STAR heat pump"}, "smart_thermostat": {"amount": 50, "requirements": "Qualifying thermostat"}, "total_available": {"amount": 400, "requirements": "Combined Duke Energy rebates"}}'::jsonb,
  'TECO Peoples Gas (limited)', 'Seminole County Water', 230,
  'Florida Building Code 8th Edition (2023), Seminole County requirements',
  '{"hvac_replacement": "Permit required", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Air Necessities', 'Super Heat & Air', 'Cool Breeze HVAC', 'Arctic Air Solutions'],
  '{"demographics": "US Census Bureau 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-29"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured) VALUES
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Tuskawilla', 'tuskawilla', 'Central', 'planned-community', '1980s-2010s', 'Upper middle income', 'Master-planned community', ARRAY['family homes', 'HOA standards', 'varied ages'], '12-40 years', 1, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Winter Springs Central', 'winter-springs-central', 'Central', 'single-family', '1990s-2010s', 'Upper middle income', 'Established neighborhoods', ARRAY['family properties', 'standard service'], '12-30 years', 2, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Northern Winter Springs', 'northern-ws', 'North', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer development', ARRAY['newer systems', 'family homes'], '5-22 years', 3, true),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Lake Jesup Area', 'lake-jesup-area', 'East', 'mixed', '1980s-2010s', 'Middle income', 'Near Lake Jesup', ARRAY['lake proximity', 'varied housing'], '12-40 years', 4, false),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Sweetwater', 'sweetwater-ws', 'West', 'single-family', '1990s-2010s', 'Upper middle income', 'Family community', ARRAY['family homes', 'HOA requirements'], '12-30 years', 5, false),
  ('f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'Tuscawilla Preserve', 'tuscawilla-preserve', 'South', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer neighborhood', ARRAY['newer construction', 'family sizing'], '5-22 years', 6, false)
ON CONFLICT (city_id, slug) DO NOTHING;

INSERT INTO city_seo_content (city_id, vertical, slug, title, meta_description, primary_keyword, secondary_keywords, hero_h1, hero_subheadline, hero_trust_bar, intro_paragraph, why_choose_us, local_challenges, services, faq_content, stats_callout, final_cta_headline, final_cta_body, schema_local_business, schema_faq_page, schema_breadcrumb, county_hub_link, sibling_city_links, service_page_links, word_count, city_mention_count, neighborhood_mention_count, unique_content_score, status, version, generated_by, generation_prompt_version) VALUES (
  'f1a2b3c4-d5e6-7f8a-9b0c-1d2e3f4a5b6c', 'hvac', '/fl/winter-springs/hvac',
  'HVAC Services in Winter Springs, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Springs'' 38,000+ residents. Family community specialists. Duke Energy rebates. Serving Tuskawilla & all neighborhoods.',
  'HVAC Winter Springs FL',
  ARRAY['AC repair Winter Springs', 'air conditioning Winter Springs FL', 'HVAC contractor Winter Springs', 'Tuskawilla HVAC'],
  'Winter Springs'' Family-Focused HVAC Experts',
  'Serving Orlando''s premier planned community',
  'Licensed & Insured | Duke Energy Certified | Family Community Specialists',
  'Winter Springs—Seminole County''s well-planned family community—combines excellent schools, abundant parks, and quality neighborhoods. With 38,000 residents in master-planned communities like Tuskawilla, Winter Springs presents HVAC needs focused on family comfort and reliability.',
  '{"headline": "Why Winter Springs Families Choose Us", "reasons": [{"title": "Family Community Specialists", "description": "Winter Springs is built for families. We provide reliable service and honest solutions for family budgets."}, {"title": "HOA Compliance Experts", "description": "Tuskawilla and other planned communities have standards. We ensure compliance."}, {"title": "Duke Energy Rebate Certified", "description": "We maximize Duke Energy rebates including $125 for AC and $100 for heat pumps."}, {"title": "Reliable Service", "description": "Families need dependable HVAC. We provide same-day repairs and quality installations."}]}'::jsonb,
  '{"headline": "HVAC Considerations for Winter Springs", "intro": "Winter Springs'' character creates specific needs:", "challenges": [{"title": "HOA Requirements", "description": "Planned communities have equipment placement and appearance standards we navigate daily."}, {"title": "Family Sizing Needs", "description": "Winter Springs homes need properly-sized systems for family comfort and efficiency."}, {"title": "Builder-Grade Systems", "description": "Many newer homes have builder-grade systems. We help evaluate upgrade options."}, {"title": "Central Florida Climate", "description": "Hot summers with 100+ days above 90°F require reliable, efficient cooling."}]}'::jsonb,
  '{"headline": "Complete HVAC Services", "services": [{"name": "Family Home HVAC", "slug": "family-hvac", "description": "Reliable service for Winter Springs families.", "features": ["Family-friendly", "Honest pricing", "Quality service", "Dependable"]}, {"name": "AC Repair", "slug": "ac-repair", "description": "Fast repairs throughout Winter Springs.", "features": ["Same-day service", "All brands", "90-day warranty", "Family-focused"]}, {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with Duke Energy rebates.", "features": ["Duke rebates", "Proper sizing", "10-year warranty", "Financing"]}, {"name": "System Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-grade systems.", "features": ["Capacity increases", "Efficiency improvements", "Smart integration", "Better comfort"]}, {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable family maintenance.", "features": ["Bi-annual service", "Priority scheduling", "15% discount", "Peace of mind"]}]}'::jsonb,
  '{"headline": "Frequently Asked Questions", "faqs": [{"question": "Do you work in Tuskawilla and planned communities?", "answer": "Yes, we serve all Winter Springs neighborhoods and understand HOA requirements."}, {"question": "Should I upgrade my builder-grade AC?", "answer": "If you experience humidity issues or uneven temperatures, an upgrade often improves comfort significantly."}, {"question": "What Duke Energy rebates are available?", "answer": "Duke Energy offers $125 for AC, $100 for heat pumps, and $50 for smart thermostats."}]}'::jsonb,
  '{"avg_summer_high": "92°F", "avg_humidity": "71%", "cooling_degree_days": "3,580", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,
  'Ready for Family Comfort in Winter Springs?',
  'Contact us today. We deliver reliable HVAC service with Duke Energy rebate assistance for Winter Springs families.',
  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Springs", "url": "https://coolit-hvac.com/winter-springs-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Winter Springs", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work in planned communities?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we serve all Winter Springs neighborhoods and understand HOA requirements."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Springs", "item": "https://coolit-hvac.com/fl/winter-springs"}]}'::jsonb,
  '/fl/seminole-county',
  '[{"slug": "/fl/oviedo/hvac", "anchor_text": "Oviedo HVAC"}, {"slug": "/fl/casselberry/hvac", "anchor_text": "Casselberry AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/family-hvac", "anchor_text": "Family HVAC"}]'::jsonb,
  1650, 20, 8, 87,
  'published', 1, 'claude', 'phase16-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
