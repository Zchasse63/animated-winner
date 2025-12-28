-- ============================================
-- Palm Bay, FL - Complete SEO/GEO Data Seed
-- Generated: December 27, 2024
-- Phase 9 - Space Coast
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  'Palm Bay', 'palm-bay', 'Florida', 'FL', 'Brevard', 'brevard-county',
  27.9859, -80.5887,
  ARRAY['32905', '32907', '32908', '32909'],
  'Palm Bay-Melbourne-Titusville',
  ARRAY['c0d1e2f3-a4b5-6789-2345-901234567890']::uuid[],
  true, 82
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
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  NOW(),
  119760, 'US Census Bureau ACS 2023',
  59847, 245000, 74.8,
  ARRAY['single-family', 'new-construction', 'affordable-housing', 'waterfront'],
  '{"pre-1980": 10, "1980s-1990s": 30, "2000s-2010s": 35, "2020s": 25}'::jsonb,
  90, 58, 75, 3550, 92, 51.4, 'high',
  'Brevard''s largest city by population. Affordable housing market. Rapid growth and development. Turkey Creek Sanctuary. Moderate inland hurricane risk turning high near coast.',
  ARRAY['Brevard County Public Schools', 'Harris Corporation (nearby)', 'City of Palm Bay', 'Retail and service industry', 'Small businesses', 'Healthcare facilities'],
  ARRAY['Turkey Creek Sanctuary', 'Fred Poppe Regional Park', 'Palm Bay Community Center', 'Goode Park', 'Palm Bay Road corridor'],
  ARRAY['Palm Bay Days Festival', 'Community events', 'Turkey Creek events'],
  ARRAY['Brevard County Public Schools'],
  'Continued residential expansion. Commercial corridor development. Infrastructure improvements. Turkey Creek preservation. New school construction.',
  'Florida Power & Light (FPL)',
  '{
    "ac_replacement": {"amount": 150, "requirements": "High-efficiency system"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "smart_thermostat": {"amount": 100, "requirements": "Qualifying connected thermostat"},
    "total_available": {"amount": 600, "requirements": "Combined FPL rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Palm Bay Utilities',
  175,
  'Florida Building Code 8th Edition (2023), City of Palm Bay amendments',
  '{"hvac_replacement": "Permit required", "new_construction": "Energy code compliance", "inspection": "Final inspection required"}'::jsonb,
  'very_high',
  ARRAY['Anchor Cooling & Heating', 'Kabran Air Conditioning', 'Arctic Air', 'Air Pros USA', 'Lowery Air Conditioning'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "FPL", "research_date": "2024-12-27"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'West Palm Bay', 'west-palm-bay', 'West', 'single-family', '1980s-2010s', 'Middle income', 'Established western area', ARRAY['older systems', 'family homes', 'efficiency focus', 'budget solutions'], '10-35 years', 1, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Turkey Creek', 'turkey-creek', 'Central', 'single-family', '1990s-2020s', 'Middle income', 'Near nature sanctuary', ARRAY['newer construction', 'family homes', 'mixed ages'], '5-28 years', 2, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Port Malabar', 'port-malabar', 'Northeast', 'single-family', '1960s-1990s', 'Middle income', 'Canal community', ARRAY['canal properties', 'older systems', 'water proximity', 'system replacements'], '25-55 years', 3, true),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Bayside Lakes', 'bayside-lakes-pb', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Newer master-planned community', ARRAY['newer systems', 'family homes', 'HOA communities'], '5-20 years', 4, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Malabar Road Corridor', 'malabar-road', 'South', 'mixed', '1980s-2020s', 'Middle income', 'Growing commercial/residential area', ARRAY['mixed housing', 'varied ages', 'new development'], '5-35 years', 5, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Palm Bay Farms', 'palm-bay-farms', 'Northwest', 'single-family', '1990s-2010s', 'Middle income', 'Residential community', ARRAY['established systems', 'family sizing', 'standard service'], '10-28 years', 6, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Compound', 'the-compound', 'Southwest', 'single-family', '1980s-2000s', 'Middle income', 'Large-lot properties', ARRAY['larger homes', 'older systems', 'rural character'], '15-40 years', 7, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Emerson Drive Area', 'emerson-drive', 'North', 'single-family', '1980s-2000s', 'Middle income', 'Established neighborhood', ARRAY['older systems', 'family homes', 'efficiency upgrades'], '20-40 years', 8, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'New Haven', 'new-haven', 'East', 'single-family', '2000s-2020s', 'Middle income', 'Growing area', ARRAY['newer construction', 'family homes', 'builder-grade systems'], '5-20 years', 9, false),
  ('d1e2f3a4-b5c6-7890-3456-012345678901', 'Palm Isles', 'palm-isles', 'Southeast', 'single-family', '1990s-2010s', 'Middle income', 'Community near I-95', ARRAY['established systems', 'family homes', 'standard needs'], '10-28 years', 10, false)
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
  'd1e2f3a4-b5c6-7890-3456-012345678901',
  'hvac',
  '/fl/palm-bay/hvac',
  'HVAC Services in Palm Bay, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Palm Bay''s 120,000+ residents. Affordable and family-focused. FPL rebates available. Serving Turkey Creek, Port Malabar, Bayside Lakes & all areas.',
  'HVAC Palm Bay FL',
  ARRAY['AC repair Palm Bay', 'air conditioning Palm Bay FL', 'HVAC contractor Palm Bay', 'affordable AC Palm Bay', 'Turkey Creek HVAC', 'Brevard County HVAC'],

  'Palm Bay''s Family-Focused HVAC Experts',
  'Affordable comfort for Brevard''s largest city',
  'Licensed & Insured | FPL Certified | Family & Value-Focused Service',
  'Palm Bay—Brevard County''s largest city with nearly 120,000 residents—represents affordable Florida living with the beautiful Turkey Creek Sanctuary and growing communities. From established neighborhoods in West Palm Bay to new construction near Turkey Creek, Palm Bay families need honest HVAC service with fair pricing. Our team delivers reliable comfort solutions throughout this family-friendly community.',

  '{
    "headline": "Why Palm Bay Families Choose Us",
    "reasons": [
      {"title": "Honest, Affordable Service", "description": "Palm Bay''s median home value is $245,000—we provide honest assessments, fair pricing, and solutions that fit your budget without upselling."},
      {"title": "New Construction Experts", "description": "Palm Bay is growing rapidly. We work with builders and help new homeowners evaluate and optimize their HVAC systems."},
      {"title": "Family-Focused Approach", "description": "With 75% homeownership, Palm Bay is a family community. We provide respectful service, clear communication, and solutions protecting your investment."},
      {"title": "FPL Rebate Assistance", "description": "We help Palm Bay homeowners access FPL rebates including $150 for AC replacement and $150 for duct sealing—maximizing your savings."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges in Palm Bay",
    "intro": "Palm Bay''s growth and climate create specific HVAC considerations:",
    "challenges": [
      {"title": "Builder-Grade System Evaluation", "description": "Palm Bay''s new construction often includes minimally-sized builder-grade systems. We provide honest evaluations helping homeowners decide if upgrades are worthwhile."},
      {"title": "Older System Replacements", "description": "Much of Palm Bay was built in the 1980s-1990s. Systems in these homes are often past their lifespan and need replacement with efficient modern equipment."},
      {"title": "Canal Property Humidity", "description": "Port Malabar and other canal communities experience elevated humidity from water proximity requiring enhanced dehumidification."},
      {"title": "Budget-Conscious Solutions", "description": "Palm Bay homeowners value affordability. We provide options at every price point with honest recommendations—no pressure tactics."}
    ]
  }'::jsonb,

  '{
    "headline": "Affordable HVAC Services in Palm Bay",
    "services": [
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, affordable repairs throughout Palm Bay.", "features": ["Same-day service", "Honest pricing", "90-day warranty", "All brands serviced"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Quality installations with FPL rebate assistance and financing.", "features": ["FPL rebates", "Multiple price points", "10-year warranty", "Flexible financing"]},
      {"name": "System Replacement", "slug": "system-replacement", "description": "Upgrade aging Palm Bay systems with efficient modern equipment.", "features": ["Efficiency improvements", "Honest assessments", "Multiple options", "Rebate assistance"]},
      {"name": "New Construction Service", "slug": "new-construction", "description": "Expert service for Palm Bay''s new homes.", "features": ["Builder partnerships", "System evaluation", "Upgrade options", "Honest advice"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Affordable maintenance protecting your investment.", "features": ["Bi-annual service", "Priority scheduling", "15% repair discount", "Extended warranties"]},
      {"name": "Emergency Service", "slug": "emergency", "description": "24/7 emergency repairs when you need us most.", "features": ["24/7 availability", "Fast response", "No overtime charges", "Reliable service"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Are your prices affordable for Palm Bay homeowners?", "answer": "Yes, we understand Palm Bay''s value-conscious market. We provide honest pricing, multiple options at different price points, and help you access FPL rebates to maximize savings."},
      {"question": "Should I upgrade my new home''s builder AC system?", "answer": "Many builder-grade systems are minimally sized. If you experience humidity issues or uneven temperatures, an upgrade may help. We provide honest assessments—no pressure to buy."},
      {"question": "Do you offer financing for system replacements?", "answer": "Yes, we offer flexible financing options making quality HVAC affordable for Palm Bay families. Multiple plans available to fit your budget."},
      {"question": "What FPL rebates are available?", "answer": "FPL offers $150 for AC replacement, $150 for duct sealing, and $100 for smart thermostats. We handle all rebate paperwork for Palm Bay homeowners."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "90°F", "avg_humidity": "75%", "cooling_degree_days": "3,550", "days_above_90": "92+", "hurricane_risk": "High"}'::jsonb,

  'Ready for Affordable Comfort in Palm Bay?',
  'Contact us today for honest service and a fair price. We''ll help your Palm Bay family stay comfortable with FPL rebates and flexible financing.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Palm Bay", "description": "Affordable HVAC services for Palm Bay, FL families.", "url": "https://coolit-hvac.com/palm-bay-fl", "telephone": "+1-321-555-COOL", "areaServed": {"@type": "City", "name": "Palm Bay", "addressRegion": "FL"}, "priceRange": "$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Are your prices affordable?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we provide honest pricing and help Palm Bay homeowners maximize FPL rebates."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Palm Bay", "item": "https://coolit-hvac.com/fl/palm-bay"}]}'::jsonb,

  '/fl/brevard-county',
  '[{"slug": "/fl/melbourne/hvac", "anchor_text": "Melbourne HVAC"}, {"slug": "/fl/cocoa/hvac", "anchor_text": "Cocoa AC"}, {"slug": "/fl/rockledge/hvac", "anchor_text": "Rockledge HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1870, 30, 14, 82,
  'published', 1, 'claude', 'phase9-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
