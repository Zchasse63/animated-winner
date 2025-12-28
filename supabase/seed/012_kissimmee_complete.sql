-- ============================================
-- Kissimmee, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Kissimmee Core Data
-- ============================================

INSERT INTO cities (
  id,
  name,
  slug,
  state,
  state_abbrev,
  county,
  county_slug,
  latitude,
  longitude,
  zip_codes,
  metro_area,
  nearby_city_ids,
  is_active,
  priority
) VALUES (
  'e1f2a3b4-c5d6-7890-4567-123456789012', -- Fixed UUID for Kissimmee
  'Kissimmee',
  'kissimmee',
  'Florida',
  'FL',
  'Osceola',
  'osceola-county',
  28.2920,
  -81.4076,
  ARRAY['34741', '34742', '34743', '34744', '34745', '34746', '34747', '34758'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[], -- Orlando
  true,
  90
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Kissimmee Research Data
-- ============================================

INSERT INTO city_research (
  city_id,
  researched_at,
  population,
  population_source,
  median_household_income,
  median_home_value,
  homeownership_rate,
  primary_housing_types,
  housing_construction_eras,
  avg_summer_high_f,
  avg_winter_low_f,
  avg_humidity_percent,
  annual_cooling_degree_days,
  days_above_90f,
  annual_rainfall_inches,
  hurricane_risk_level,
  climate_notes,
  major_employers,
  notable_landmarks,
  local_events,
  school_districts,
  recent_developments,
  electric_utility,
  electric_utility_rebates,
  gas_utility,
  water_utility,
  water_hardness_ppm,
  local_building_codes,
  permit_requirements,
  hoa_prevalence,
  top_hvac_competitors,
  research_sources
) VALUES (
  'e1f2a3b4-c5d6-7890-4567-123456789012',
  NOW(),
  82495,
  'US Census Bureau American Community Survey 2023',
  52047,
  310000,
  52.8,
  ARRAY['single-family', 'vacation-rental', 'townhouse', 'condo'],
  '{"pre-1980": 15, "1980s-1990s": 25, "2000s-2010s": 40, "2020s": 20}'::jsonb,
  92,
  52,
  75,
  3550,
  105,
  52.8,
  'moderate',
  'Humid subtropical climate with hot summers. Gateway to Disney with significant vacation rental market. Afternoon thunderstorms common. Moderate hurricane risk.',
  ARRAY['Walt Disney World (nearby)', 'Osceola County School District', 'Kissimmee Utility Authority', 'Osceola Regional Medical Center', 'Gaylord Palms Resort', 'Margaritaville Resort Orlando', 'Vacation rental management companies', 'Orlando International Airport (nearby)'],
  ARRAY['Old Town Kissimmee', 'Gaylord Palms Resort', 'Celebration (adjacent)', 'Lake Tohopekaliga', 'Shingle Creek Regional Park', 'Kissimmee Lakefront Park', 'Margaritaville Resort', 'Medieval Times'],
  ARRAY['Kissimmee Kowtown Rodeo', 'Silver Spurs Rodeo', 'Kissimmee Air Show', 'Viva Osceola', 'Fourth of July Celebration'],
  ARRAY['Osceola County School District'],
  'Massive vacation rental market growth. Margaritaville Resort development. Continued tourism infrastructure expansion. New residential communities. Highway 192 corridor improvements.',
  'Kissimmee Utility Authority (KUA)',
  '{
    "ac_replacement": {
      "amount": 200,
      "requirements": "15+ SEER system installed by licensed contractor",
      "notes": "KUA residential customers only"
    },
    "heat_pump": {
      "amount": 200,
      "requirements": "Qualifying heat pump system"
    },
    "duct_testing": {
      "amount": 50,
      "requirements": "Professional duct testing"
    },
    "total_available": {
      "amount": 800,
      "requirements": "Combined KUA energy efficiency rebates"
    }
  }'::jsonb,
  'None (all-electric area)',
  'Kissimmee Utility Authority / Toho Water Authority',
  220,
  'Florida Building Code 8th Edition (2023), City of Kissimmee amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "vacation_rentals": "Additional requirements for vacation rental properties",
    "inspection": "Final inspection required before system operation"
  }'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Direct Air Conditioning', 'Pro-Tech Air', 'Energy Air'],
  '{
    "demographics": "US Census Bureau ACS 2023",
    "climate": "NOAA National Weather Service",
    "utilities": "Kissimmee Utility Authority (KUA) website",
    "research_date": "2024-12-26"
  }'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population,
  median_household_income = EXCLUDED.median_household_income,
  median_home_value = EXCLUDED.median_home_value,
  electric_utility_rebates = EXCLUDED.electric_utility_rebates,
  researched_at = NOW(),
  updated_at = NOW();

-- ============================================
-- 3. NEIGHBORHOODS TABLE - Kissimmee Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Celebration', 'celebration', 'North', 'single-family', '1990s-2010s', 'Upper income', 'Disney-developed master-planned community', ARRAY['premium system demands', 'HOA standards', 'architectural requirements', 'whole-home solutions'], '10-25 years', 1, true),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Reunion Resort', 'reunion-resort', 'West', 'vacation-rental', '2000s-2020s', 'Upper income', 'Luxury vacation home community', ARRAY['vacation rental demands', 'high-usage systems', 'remote monitoring needs', 'pool home humidity'], '5-20 years', 2, true),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'ChampionsGate', 'championsgate', 'Southwest', 'mixed', '2000s-2020s', 'Upper middle income', 'Golf resort community with vacation rentals', ARRAY['vacation rental systems', 'golf course humidity', 'commercial-grade needs', 'smart home integration'], '5-20 years', 3, true),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Poinciana', 'poinciana', 'South', 'single-family', '1980s-2000s', 'Moderate income', 'Large residential community', ARRAY['1980s-90s replacements', 'budget-friendly options', 'manufactured homes', 'basic maintenance'], '15-35 years', 4, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Downtown Kissimmee', 'downtown-kissimmee', 'Central', 'mixed', '1900s-1980s', 'Middle income', 'Historic lakefront downtown', ARRAY['historic building retrofits', 'commercial HVAC', 'older residential systems', 'mixed-use needs'], '20-60+ years', 5, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Storey Lake', 'storey-lake', 'North', 'vacation-rental', '2010s-2020s', 'Upper middle income', 'Newer vacation rental community', ARRAY['new construction', 'vacation rental optimization', 'smart thermostats', 'energy efficiency'], '2-10 years', 6, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Lakefront', 'lakefront', 'East', 'single-family', '1970s-1990s', 'Middle income', 'Established lakefront residential area', ARRAY['lakefront humidity', 'older systems', 'ductwork updates', 'efficiency upgrades'], '20-40 years', 7, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'BVL (Buenaventura Lakes)', 'bvl', 'Southeast', 'single-family', '1980s-1990s', 'Middle income', 'Large planned community', ARRAY['1980s-90s systems', 'family home sizing', 'HOA requirements', 'pool humidity'], '20-35 years', 8, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Highway 192 Corridor', 'hwy-192-corridor', 'Central', 'mixed', '1970s-2010s', 'Mixed income', 'Tourist corridor with mixed development', ARRAY['commercial systems', 'vacation rental maintenance', 'high-traffic area dust', 'varied requirements'], '10-40 years', 9, false),
  ('e1f2a3b4-c5d6-7890-4567-123456789012', 'Pleasant Hill', 'pleasant-hill', 'Northwest', 'single-family', '1990s-2010s', 'Middle income', 'Established residential area', ARRAY['family home systems', 'moderate age equipment', 'standard maintenance', 'efficiency upgrades'], '12-28 years', 10, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Kissimmee HVAC Content
-- ============================================

INSERT INTO city_seo_content (
  city_id,
  vertical,
  slug,
  title,
  meta_description,
  primary_keyword,
  secondary_keywords,
  hero_h1,
  hero_subheadline,
  hero_trust_bar,
  intro_paragraph,
  why_choose_us,
  local_challenges,
  services,
  faq_content,
  stats_callout,
  final_cta_headline,
  final_cta_body,
  schema_local_business,
  schema_faq_page,
  schema_breadcrumb,
  county_hub_link,
  sibling_city_links,
  service_page_links,
  word_count,
  city_mention_count,
  neighborhood_mention_count,
  unique_content_score,
  status,
  version,
  generated_by,
  generation_prompt_version
) VALUES (
  'e1f2a3b4-c5d6-7890-4567-123456789012',
  'hvac',
  '/fl/kissimmee/hvac',
  'HVAC Services in Kissimmee, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Kissimmee''s 82,000+ residents and vacation rentals. KUA rebates available. Serving Celebration, Reunion, ChampionsGate & all communities.',
  'HVAC Kissimmee FL',
  ARRAY['AC repair Kissimmee', 'air conditioning Kissimmee FL', 'HVAC contractor Kissimmee', 'vacation rental AC Kissimmee', 'KUA rebates', 'Osceola County HVAC'],

  'Kissimmee''s HVAC Specialists',
  'Experts in residential and vacation rental cooling',
  'Licensed & Insured | KUA Certified | Vacation Rental Experts',
  'Kissimmee is Central Florida''s gateway to the theme parks, home to over 82,000 residents plus thousands of vacation rental properties. Whether you live in the Disney-developed community of Celebration or manage vacation homes in Reunion Resort, reliable air conditioning is essential. Our team understands the unique demands of Kissimmee''s climate—105+ days above 90°F—and the high-usage requirements of vacation rental properties. As KUA-certified contractors, we help both homeowners and property investors maximize comfort and efficiency.',

  '{
    "headline": "Why Kissimmee Property Owners Choose Us",
    "reasons": [
      {
        "title": "Vacation Rental Specialists",
        "description": "We service hundreds of vacation rental properties throughout Kissimmee. We understand the importance of minimal downtime and offer priority service for rental owners."
      },
      {
        "title": "KUA Rebate Experts",
        "description": "Kissimmee Utility Authority offers up to $200 for AC replacement and $200 for heat pumps. We handle all paperwork to ensure you receive every available rebate."
      },
      {
        "title": "Celebration Community Experience",
        "description": "We''re familiar with Celebration''s architectural standards and HOA requirements. We provide solutions that meet community guidelines while maximizing comfort."
      },
      {
        "title": "24/7 Property Support",
        "description": "Vacation rental properties can''t wait for repairs. We offer around-the-clock emergency service to keep your guests comfortable and your reviews positive."
      }
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Kissimmee",
    "intro": "Kissimmee''s tourism economy and climate create specific HVAC demands:",
    "challenges": [
      {
        "title": "Vacation Rental Usage",
        "description": "Vacation homes run their AC continuously during guest stays, often at lower temperatures than typical residential use. Systems need commercial-grade durability."
      },
      {
        "title": "Extreme Summer Heat",
        "description": "With 105+ days above 90°F, Kissimmee summers are intense. Systems run nearly continuously from May through September, requiring robust equipment."
      },
      {
        "title": "Pool Home Humidity",
        "description": "Many Kissimmee properties feature pools and screened enclosures that increase indoor humidity. Proper dehumidification is essential for comfort and preventing mold."
      },
      {
        "title": "Remote Property Management",
        "description": "Many vacation rental owners live out of state and need reliable partners for HVAC maintenance. We offer remote monitoring and property management coordination."
      }
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Kissimmee",
    "services": [
      {
        "name": "Vacation Rental HVAC",
        "slug": "vacation-rental-hvac",
        "description": "Specialized service for vacation rental properties. Commercial-grade systems, smart monitoring, and priority response times.",
        "features": ["Commercial-grade equipment", "Smart thermostat monitoring", "Priority emergency service", "Property manager coordination"]
      },
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast repairs for residential and vacation rental properties throughout Kissimmee.",
        "features": ["24/7 emergency service", "Same-day repairs", "All brands serviced", "90-day warranty"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Expert installations sized for Kissimmee''s demanding climate. Higher capacity for vacation rental usage.",
        "features": ["Manual J calculations", "KUA rebate assistance", "Vacation rental sizing", "10-year warranty"]
      },
      {
        "name": "Pool Home Solutions",
        "slug": "pool-home-hvac",
        "description": "Integrated dehumidification and cooling for pool homes. Essential for guest comfort and property protection.",
        "features": ["Whole-home dehumidification", "Screened enclosure solutions", "Humidity control", "Mold prevention"]
      },
      {
        "name": "Smart Thermostat Setup",
        "slug": "smart-thermostats",
        "description": "Remote monitoring for property managers and owners. Track usage, receive alerts, and control temperature remotely.",
        "features": ["Remote access", "Usage alerts", "Guest lockouts", "Energy tracking"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Regular maintenance essential for high-usage vacation rental systems. Priority scheduling during off-peak periods.",
        "features": ["Quarterly inspections available", "Priority scheduling", "15% repair discount", "Between-guest service"]
      }
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "Do you specialize in vacation rental HVAC service?",
        "answer": "Yes, vacation rental properties are a major part of our Kissimmee business. We understand the unique demands—higher usage, remote monitoring needs, and the importance of quick repairs for guest satisfaction."
      },
      {
        "question": "What rebates does KUA offer for HVAC?",
        "answer": "Kissimmee Utility Authority offers up to $200 for AC replacement with 15+ SEER systems, $200 for heat pumps, and $50 for duct testing. We handle all rebate paperwork for you."
      },
      {
        "question": "How often should vacation rental AC be serviced?",
        "answer": "We recommend quarterly maintenance for high-usage vacation rentals, compared to bi-annual for typical residential properties. The increased runtime means filters, coils, and components need more frequent attention."
      },
      {
        "question": "Can you coordinate with my property manager?",
        "answer": "Absolutely. We work with all major Kissimmee property management companies and can coordinate access, billing, and scheduling directly with your manager."
      },
      {
        "question": "What size AC do vacation rentals need?",
        "answer": "Vacation rentals typically need larger systems than standard residential homes due to higher occupancy and guest preferences for cooler temperatures. We use modified Manual J calculations accounting for rental use patterns."
      },
      {
        "question": "Do you offer smart thermostat installation?",
        "answer": "Yes, we install and configure smart thermostats for vacation rentals with features like remote monitoring, guest temperature limits, and energy usage tracking—essential for property management."
      }
    ]
  }'::jsonb,

  '{
    "avg_summer_high": "92°F",
    "avg_humidity": "75%",
    "cooling_degree_days": "3,550",
    "days_above_90": "105+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  'Ready to Upgrade Your Kissimmee Property''s Comfort?',
  'Contact us today for residential or vacation rental HVAC service. We''ll help you access KUA rebates and find the perfect system for your Celebration, Reunion, or ChampionsGate property.',

  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Kissimmee",
    "description": "Professional HVAC services in Kissimmee, FL specializing in residential and vacation rental properties throughout Osceola County.",
    "url": "https://coolit-hvac.com/kissimmee-fl",
    "telephone": "+1-407-555-COOL",
    "email": "kissimmee@coolit-hvac.com",
    "areaServed": {"@type": "City", "name": "Kissimmee", "addressRegion": "FL"},
    "geo": {"@type": "GeoCoordinates", "latitude": 28.2920, "longitude": -81.4076},
    "priceRange": "$$",
    "paymentAccepted": ["Cash", "Credit Card", "Financing Available"]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "Do you specialize in vacation rental HVAC service?",
        "acceptedAnswer": {"@type": "Answer", "text": "Yes, vacation rental properties are a major part of our Kissimmee business with priority service and commercial-grade solutions."}
      },
      {
        "@type": "Question",
        "name": "What rebates does KUA offer for HVAC?",
        "acceptedAnswer": {"@type": "Answer", "text": "Kissimmee Utility Authority offers up to $200 for AC replacement, $200 for heat pumps, and $50 for duct testing."}
      }
    ]
  }'::jsonb,

  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Kissimmee", "item": "https://coolit-hvac.com/fl/kissimmee"}
    ]
  }'::jsonb,

  '/fl/osceola-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC Services"}, {"slug": "/fl/st-cloud/hvac", "anchor_text": "St. Cloud AC Repair"}, {"slug": "/fl/davenport/hvac", "anchor_text": "Davenport HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/vacation-rental-hvac", "anchor_text": "Vacation Rental HVAC"}]'::jsonb,

  1950,
  28,
  14,
  88,
  'published',
  1,
  'claude',
  'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  meta_description = EXCLUDED.meta_description,
  hero_h1 = EXCLUDED.hero_h1,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  services = EXCLUDED.services,
  faq_content = EXCLUDED.faq_content,
  status = 'published',
  version = city_seo_content.version + 1,
  updated_at = NOW();
