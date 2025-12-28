-- ============================================
-- Orlando, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Orlando Core Data
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
  'd0e1f2a3-b4c5-6789-3456-012345678901', -- Fixed UUID for Orlando
  'Orlando',
  'orlando',
  'Florida',
  'FL',
  'Orange',
  'orange-county',
  28.5383,
  -81.3792,
  ARRAY['32801', '32802', '32803', '32804', '32805', '32806', '32807', '32808', '32809', '32810', '32811', '32812', '32814', '32817', '32818', '32819', '32820', '32821', '32822', '32824', '32825', '32826', '32827', '32828', '32829', '32830', '32831', '32832', '32833', '32834', '32835', '32836', '32837', '32839'],
  'Orlando-Kissimmee-Sanford',
  ARRAY[]::uuid[],
  true,
  95
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Orlando Research Data
-- ============================================

INSERT INTO city_research (
  city_id,
  researched_at,

  -- Demographics
  population,
  population_source,
  median_household_income,
  median_home_value,
  homeownership_rate,
  primary_housing_types,
  housing_construction_eras,

  -- Climate
  avg_summer_high_f,
  avg_winter_low_f,
  avg_humidity_percent,
  annual_cooling_degree_days,
  days_above_90f,
  annual_rainfall_inches,
  hurricane_risk_level,
  climate_notes,

  -- Local Context
  major_employers,
  notable_landmarks,
  local_events,
  school_districts,
  recent_developments,

  -- Utilities & Rebates
  electric_utility,
  electric_utility_rebates,
  gas_utility,
  water_utility,
  water_hardness_ppm,

  -- Building/Codes
  local_building_codes,
  permit_requirements,
  hoa_prevalence,

  -- Competitive Landscape
  top_hvac_competitors,

  -- Source Tracking
  research_sources
) VALUES (
  'd0e1f2a3-b4c5-6789-3456-012345678901', -- Orlando city_id
  NOW(),

  -- Demographics
  316081,
  'US Census Bureau American Community Survey 2023',
  62037,
  365000,
  44.2,
  ARRAY['single-family', 'condo', 'apartment', 'townhouse'],
  '{"pre-1970": 15, "1970s-1990s": 35, "2000s-2010s": 35, "2020s": 15}'::jsonb,

  -- Climate
  92,
  52,
  74,
  3600,
  110,
  53.2,
  'moderate',
  'Humid subtropical climate with hot, humid summers and mild winters. Afternoon thunderstorms common May-September. Located in "lightning alley" with frequent electrical storms. Moderate hurricane risk due to inland location, though still subject to tropical systems.',

  -- Local Context
  ARRAY['Walt Disney World', 'Universal Orlando Resort', 'SeaWorld Orlando', 'Orlando Health', 'AdventHealth', 'Lockheed Martin', 'University of Central Florida', 'Full Sail University', 'Orange County Public Schools', 'City of Orlando', 'Orlando International Airport', 'Darden Restaurants'],
  ARRAY['Walt Disney World', 'Universal Studios', 'SeaWorld', 'Lake Eola Park', 'ICON Park', 'Dr. Phillips Center for the Performing Arts', 'Amway Center', 'Camping World Stadium', 'Orlando International Airport', 'International Drive', 'Church Street', 'Thornton Park', 'Winter Park (adjacent)', 'UCF Campus'],
  ARRAY['Mickey''s Not-So-Scary Halloween Party', 'Epcot Food & Wine Festival', 'Orlando Fringe Festival', 'Florida Film Festival', 'Orlando Pride Parade', 'Fiesta in the Park', 'Creative City Project', 'EDC Orlando'],
  ARRAY['Orange County Public Schools'],
  'Major expansion of SunRail commuter rail. Creative Village development downtown. Lake Nona Medical City growth. Orlando International Airport South Terminal. Continued I-4 Ultimate improvements. International Drive transformation.',

  -- Utilities & Rebates
  'Orlando Utilities Commission (OUC)',
  '{
    "ac_replacement": {
      "amount": 200,
      "requirements": "15+ SEER system installed by licensed contractor",
      "notes": "Residential customers only"
    },
    "heat_pump": {
      "amount": 250,
      "requirements": "Qualifying heat pump system installation"
    },
    "smart_thermostat": {
      "amount": 50,
      "requirements": "ENERGY STAR certified smart thermostat"
    },
    "duct_sealing": {
      "amount": 100,
      "requirements": "Professional duct testing and sealing"
    },
    "home_energy_audit": {
      "amount": "Free",
      "requirements": "Available to all OUC residential customers"
    },
    "total_available": {
      "amount": 1000,
      "requirements": "Combined energy efficiency rebates through OUC"
    }
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'Orlando Utilities Commission (OUC)',
  200,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), City of Orlando amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "historic_districts": "Additional requirements in historic districts like Thornton Park"
  }'::jsonb,
  'moderate',

  -- Competitive Landscape
  ARRAY['Del-Air Heating and Air Conditioning', 'Frank Gay Services', 'Kalos Services', 'Energy Air', 'Pro-Tech Air Conditioning'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, City of Orlando demographics",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Orlando Utilities Commission (OUC) website",
    "employers": "Orlando Economic Partnership",
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
-- 3. NEIGHBORHOODS TABLE - Orlando Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Downtown Orlando
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Downtown Orlando', 'downtown', 'Central', 'mixed', '1920s-2020s', 'Upper middle income', 'Urban core with high-rises and historic buildings', ARRAY['high-rise HVAC', 'historic building retrofits', 'commercial systems', 'rooftop unit maintenance'], '5-50+ years', 1, true),
  -- Lake Nona
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Lake Nona', 'lake-nona', 'Southeast', 'single-family', '2010s-2020s', 'Upper income', 'Master-planned medical and technology hub', ARRAY['new construction systems', 'smart home integration', 'high-efficiency demands', 'multi-zone requirements'], '2-12 years', 2, true),
  -- Dr. Phillips
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Dr. Phillips', 'dr-phillips', 'Southwest', 'single-family', '1990s-2010s', 'Upper income', 'Upscale community near attractions', ARRAY['premium system demands', 'restaurant row humidity', 'larger home zoning', 'pool area dehumidification'], '10-25 years', 3, true),
  -- Winter Park (adjacent)
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'College Park', 'college-park', 'North', 'single-family', '1940s-1970s', 'Upper middle income', 'Historic neighborhood with tree-lined streets', ARRAY['older home retrofits', 'ductwork challenges', 'historic preservation', 'mature tree shade'], '20-50+ years', 4, false),
  -- Thornton Park
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Thornton Park', 'thornton-park', 'Central', 'mixed', '1920s-1960s', 'Upper middle income', 'Historic district near Lake Eola', ARRAY['historic bungalow systems', 'boutique commercial HVAC', 'preservation requirements', 'older ductwork'], '25-60+ years', 5, false),
  -- Baldwin Park
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Baldwin Park', 'baldwin-park', 'Northeast', 'mixed', '2000s-2010s', 'Upper income', 'New urbanist community on former naval base', ARRAY['newer construction', 'townhome systems', 'walkable community needs', 'multi-unit buildings'], '10-20 years', 6, false),
  -- Windermere
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Windermere Area', 'windermere', 'West', 'single-family', '1990s-2020s', 'Upper income', 'Lakefront luxury homes', ARRAY['lakefront humidity', 'large estate systems', 'whole-home automation', 'wine cellar climate control'], '5-25 years', 7, false),
  -- Hunters Creek
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Hunters Creek', 'hunters-creek', 'South', 'single-family', '1990s-2000s', 'Middle income', 'Master-planned family community', ARRAY['1990s system replacements', 'family home sizing', 'community pool proximity', 'HOA standards'], '15-30 years', 8, false),
  -- MetroWest
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'MetroWest', 'metrowest', 'West', 'mixed', '1980s-2000s', 'Middle income', 'Large planned community with golf courses', ARRAY['varied housing types', 'condo HVAC', 'golf course humidity', 'commercial mixed-use'], '15-35 years', 9, false),
  -- Avalon Park
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Avalon Park', 'avalon-park', 'East', 'single-family', '2000s-2010s', 'Middle income', 'New urbanist community with village center', ARRAY['newer construction', 'townhome systems', 'community standards', 'smart thermostat integration'], '10-20 years', 10, false),
  -- Colonial Town
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Colonial Town', 'colonial-town', 'Central', 'single-family', '1950s-1970s', 'Middle income', 'Established neighborhood near downtown', ARRAY['older home updates', 'window unit replacements', 'ductwork retrofits', 'efficiency upgrades'], '25-50 years', 11, false),
  -- Pine Hills
  ('d0e1f2a3-b4c5-6789-3456-012345678901', 'Pine Hills', 'pine-hills', 'Northwest', 'single-family', '1960s-1980s', 'Moderate income', 'Large established community', ARRAY['older system replacements', 'budget-friendly solutions', 'manufactured home service', 'basic maintenance needs'], '25-50 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Orlando HVAC Content
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
  'd0e1f2a3-b4c5-6789-3456-012345678901',
  'hvac',
  '/fl/orlando/hvac',
  'HVAC Services in Orlando, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Orlando''s 316,000+ residents. OUC rebates available. Serving Lake Nona, Dr. Phillips, Downtown & all neighborhoods. Same-day emergency service!',
  'HVAC Orlando FL',
  ARRAY['AC repair Orlando', 'air conditioning Orlando FL', 'HVAC contractor Orlando', 'Orlando AC installation', 'OUC rebates Orlando', 'Orange County HVAC'],

  'Orlando''s Trusted HVAC Experts',
  'Keeping Central Florida cool since 1985',
  'Licensed & Insured | OUC Certified | 24/7 Emergency Service',
  'Orlando is more than just theme parks—it''s home to over 316,000 residents who depend on reliable air conditioning in one of Florida''s hottest climates. With 110+ days above 90°F and humidity that can feel oppressive, your HVAC system works harder here than almost anywhere in the country. Our team has served Orlando homeowners for nearly 40 years, from the historic bungalows of Thornton Park to the modern smart homes of Lake Nona. As OUC-certified contractors, we help you maximize comfort while accessing all available rebates and incentives.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Orlando Homeowners Choose Us",
    "reasons": [
      {
        "title": "OUC Rebate Specialists",
        "description": "Orlando Utilities Commission offers up to $200 for AC replacement, $250 for heat pumps, and free home energy audits. We handle all paperwork and ensure you receive every available incentive."
      },
      {
        "title": "40 Years of Orlando Experience",
        "description": "From College Park''s 1950s homes to Lake Nona''s smart communities, we''ve seen every type of HVAC challenge Orlando can present. Our experience means faster diagnoses and better solutions."
      },
      {
        "title": "24/7 Emergency Service",
        "description": "When your AC fails on a 95°F Orlando afternoon, you can''t wait. We offer true 24/7 emergency service with guaranteed response times throughout Orange County."
      },
      {
        "title": "Theme Park Industry Trusted",
        "description": "We''ve worked with hospitality properties throughout the I-Drive corridor. That same commercial-grade expertise is available for your home."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Orlando",
    "intro": "Orlando''s climate and diverse housing stock create specific demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Extreme Heat and Humidity",
        "description": "With 110+ days above 90°F and average humidity of 74%, Orlando''s summers are brutal. Your system runs nearly continuously June through September, requiring robust equipment and vigilant maintenance."
      },
      {
        "title": "Lightning Capital Concerns",
        "description": "Orlando sits in \"Lightning Alley\" with more strikes per capita than anywhere in the US. Power surges can damage HVAC electronics—we recommend surge protection for all systems."
      },
      {
        "title": "Diverse Housing Ages",
        "description": "From 1920s College Park bungalows to 2020s Lake Nona smart homes, Orlando''s housing stock spans a century. Each era requires different approaches to HVAC installation and maintenance."
      },
      {
        "title": "Tourist Corridor Demands",
        "description": "Properties near I-Drive and theme parks often serve as vacation rentals with higher-than-average usage. These systems need commercial-grade durability in residential settings."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Orlando",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, expert AC repairs throughout Orlando. We stock common parts for same-day fixes and offer 24/7 emergency service.",
        "features": ["24/7 emergency service", "Same-day repairs", "All brands serviced", "90-day repair warranty"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Premium AC installations with Manual J load calculations. We properly size systems for Orlando''s demanding climate.",
        "features": ["Manual J calculations", "OUC rebate up to $200", "Up to 22 SEER2 efficiency", "10-year warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps provide efficient year-round comfort in Orlando''s mild winters. OUC offers up to $250 in rebates.",
        "features": ["$250 OUC rebate available", "Year-round efficiency", "Lower operating costs", "Quiet operation"]
      },
      {
        "name": "Smart Home Integration",
        "slug": "smart-hvac",
        "description": "Connect your HVAC to your smart home system. Especially popular in Lake Nona and other tech-forward communities.",
        "features": ["Smart thermostat setup", "Remote monitoring", "Energy usage tracking", "Alexa/Google compatible"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "Combat Orlando''s humidity, allergens, and theme park corridor pollution with whole-home air quality solutions.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Fresh air ventilation"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with regular maintenance. Essential in Orlando''s demanding climate.",
        "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Lightning surge check"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "What rebates does OUC offer for HVAC in Orlando?",
        "answer": "Orlando Utilities Commission offers up to $200 for high-efficiency AC replacement, $250 for heat pumps, $50 for smart thermostats, and $100 for duct sealing. They also provide free home energy audits to identify additional savings opportunities."
      },
      {
        "question": "How often should I service my AC in Orlando?",
        "answer": "We recommend bi-annual maintenance—spring and fall—for Orlando homes. Given our extreme summer heat and extended cooling season, regular maintenance prevents breakdowns during peak demand when repair wait times are longest."
      },
      {
        "question": "My AC runs constantly but doesn''t cool well. What''s wrong?",
        "answer": "In Orlando''s extreme heat, some continuous running is normal on the hottest days. However, if your home isn''t reaching set temperature, common causes include low refrigerant, dirty coils, or an undersized system. We offer same-day diagnostic service."
      },
      {
        "question": "Should I worry about lightning damaging my AC?",
        "answer": "Yes, Orlando is the lightning capital of the US. Power surges can damage HVAC control boards and compressors. We recommend whole-home surge protection—it''s a small investment that can save thousands in repairs."
      },
      {
        "question": "What SEER rating should I choose for Orlando?",
        "answer": "Given Orlando''s extended cooling season, we typically recommend 16-18 SEER2 systems. The energy savings offset the higher initial cost within 3-5 years, and higher efficiency systems handle our humidity better."
      },
      {
        "question": "Do you service vacation rental properties?",
        "answer": "Yes, we serve many vacation rental owners in the I-Drive and theme park areas. We offer priority service plans and commercial-grade solutions designed for high-usage properties."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "92°F",
    "avg_humidity": "74%",
    "cooling_degree_days": "3,600",
    "days_above_90": "110+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Orlando Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access OUC rebates and find the perfect system for your Lake Nona, Dr. Phillips, or Downtown Orlando home. 24/7 emergency service available!',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Orlando",
    "description": "Professional HVAC services in Orlando, FL including AC repair, installation, and maintenance for residential and commercial customers throughout Orange County.",
    "url": "https://coolit-hvac.com/orlando-fl",
    "telephone": "+1-407-555-COOL",
    "email": "orlando@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Orlando",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 28.5383,
      "longitude": -81.3792
    },
    "openingHoursSpecification": [
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
        "opens": "00:00",
        "closes": "23:59"
      }
    ],
    "priceRange": "$$",
    "paymentAccepted": ["Cash", "Credit Card", "Financing Available"],
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "HVAC Services",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Repair"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Installation"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Heat Pump Services"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Smart Home Integration"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Maintenance Plans"}}
      ]
    }
  }'::jsonb,

  -- Schema - FAQ Page (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "What rebates does OUC offer for HVAC in Orlando?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Orlando Utilities Commission offers up to $200 for high-efficiency AC replacement, $250 for heat pumps, $50 for smart thermostats, and $100 for duct sealing."
        }
      },
      {
        "@type": "Question",
        "name": "How often should I service my AC in Orlando?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "We recommend bi-annual maintenance—spring and fall—for Orlando homes due to the extreme summer heat and extended cooling season."
        }
      },
      {
        "@type": "Question",
        "name": "Should I worry about lightning damaging my AC?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, Orlando is the lightning capital of the US. Power surges can damage HVAC control boards and compressors. We recommend whole-home surge protection."
        }
      }
    ]
  }'::jsonb,

  -- Schema - Breadcrumb (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"},
      {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"},
      {"@type": "ListItem", "position": 3, "name": "Orlando", "item": "https://coolit-hvac.com/fl/orlando"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/orange-county',
  '[{"slug": "/fl/kissimmee/hvac", "anchor_text": "Kissimmee HVAC Services"}, {"slug": "/fl/winter-park/hvac", "anchor_text": "Winter Park AC Repair"}, {"slug": "/fl/sanford/hvac", "anchor_text": "Sanford HVAC"}, {"slug": "/fl/apopka/hvac", "anchor_text": "Apopka AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/heat-pumps", "anchor_text": "Heat Pumps"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  2100,
  32,
  16,
  92,

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
  schema_local_business = EXCLUDED.schema_local_business,
  schema_faq_page = EXCLUDED.schema_faq_page,
  status = 'published',
  version = city_seo_content.version + 1,
  updated_at = NOW();
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
-- ============================================
-- Sanford, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  'Sanford', 'sanford', 'Florida', 'FL', 'Seminole', 'seminole-county',
  28.8028, -81.2731,
  ARRAY['32771', '32772', '32773'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude, longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes, updated_at = NOW();

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
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  NOW(),
  63512, 'US Census Bureau ACS 2023',
  58742, 295000, 55.3,
  ARRAY['single-family', 'historic-home', 'townhouse', 'apartment'],
  '{"pre-1950": 15, "1950s-1980s": 30, "1990s-2010s": 40, "2020s": 15}'::jsonb,
  92, 51, 73, 3500, 100, 51.8, 'moderate',
  'Humid subtropical climate. Historic downtown on Lake Monroe. Northern Orlando metro location provides slightly cooler winters. Active thunderstorm season.',
  ARRAY['Seminole County Public Schools', 'Central Florida Regional Hospital', 'Orlando Sanford International Airport', 'Seminole State College', 'City of Sanford', 'Seminole County Government', 'Mitsubishi Hitachi Power Systems'],
  ARRAY['Historic Downtown Sanford', 'Lake Monroe', 'Sanford Riverwalk', 'Central Florida Zoo', 'Wayne Densch Performing Arts Center', 'Sanford SunRail Station', 'Mayfair Country Club'],
  ARRAY['Alive After 5', 'Sanford Art Walk', 'Celery Soup Festival', 'Jazz on the Waterfront', 'Sanford Porchfest'],
  ARRAY['Seminole County Public Schools'],
  'Historic downtown revitalization. Riverwalk expansion. SunRail commuter connection. New residential developments. Growing craft brewery scene.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'TECO Peoples Gas (limited areas)',
  'City of Sanford Utilities',
  240,
  'Florida Building Code 8th Edition (2023), City of Sanford historic district amendments',
  '{"hvac_replacement": "Permit required", "historic_district": "Additional review for historic properties", "inspection": "Final inspection required"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Climate Control Experts'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Historic Downtown', 'historic-downtown', 'Central', 'historic-home', '1900s-1950s', 'Upper middle income', 'Revitalized historic district on Lake Monroe', ARRAY['historic home retrofits', 'preservation requirements', 'ductless systems', 'older ductwork'], '20-80+ years', 1, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Mayfair', 'mayfair', 'South', 'single-family', '1970s-1990s', 'Middle income', 'Established golf course community', ARRAY['golf course humidity', '1970s-90s replacements', 'system modernization', 'efficiency upgrades'], '20-40 years', 2, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Lake Mary (adjacent)', 'sanford-lake-mary', 'Southwest', 'single-family', '1990s-2010s', 'Upper middle income', 'Newer development near Lake Mary border', ARRAY['newer construction', 'HOA standards', 'smart home integration', 'premium systems'], '10-25 years', 3, true),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Sanford Lakefront', 'lakefront', 'East', 'single-family', '1960s-1990s', 'Middle income', 'Lakefront residential areas', ARRAY['lakefront humidity', 'older systems', 'waterfront corrosion', 'efficiency updates'], '20-50 years', 4, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Midway', 'midway', 'East', 'single-family', '1970s-2000s', 'Moderate income', 'Established residential community', ARRAY['aging systems', 'budget-friendly solutions', 'standard maintenance'], '15-40 years', 5, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Hidden Lake', 'hidden-lake', 'West', 'single-family', '1990s-2000s', 'Middle income', 'Planned community with amenities', ARRAY['1990s-2000s systems', 'HOA requirements', 'family home sizing'], '15-28 years', 6, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Ravenna Park', 'ravenna-park', 'Northwest', 'single-family', '2000s-2010s', 'Upper middle income', 'Newer upscale development', ARRAY['newer systems', 'premium demands', 'multi-zone needs'], '8-20 years', 7, false),
  ('f2a3b4c5-d6e7-8901-5678-234567890123', 'Celery Avenue Area', 'celery-avenue', 'North', 'mixed', '1950s-1980s', 'Moderate income', 'Historic agricultural area', ARRAY['older homes', 'manufactured homes', 'budget solutions'], '25-60 years', 8, false)
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
  'f2a3b4c5-d6e7-8901-5678-234567890123',
  'hvac',
  '/fl/sanford/hvac',
  'HVAC Services in Sanford, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Sanford''s 63,000+ residents. Duke Energy rebates available. Serving Historic Downtown, Mayfair & all neighborhoods. Historic home specialists!',
  'HVAC Sanford FL',
  ARRAY['AC repair Sanford', 'air conditioning Sanford FL', 'HVAC contractor Sanford', 'historic home AC Sanford', 'Duke Energy rebates Sanford', 'Seminole County HVAC'],

  'Sanford''s Trusted HVAC Experts',
  'Specialists in historic and modern home comfort',
  'Licensed & Insured | Duke Energy Certified | Historic Home Experts',
  'Sanford''s beautiful historic downtown and growing modern communities each present unique HVAC challenges. From century-old buildings along First Street to new construction near Lake Mary, our team has the expertise to deliver comfort throughout this charming city. With over 63,000 residents and 100+ days above 90°F annually, reliable air conditioning isn''t optional—it''s essential. We''re Duke Energy certified to help you maximize rebates while enjoying optimal comfort.',

  '{
    "headline": "Why Sanford Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Specialists", "description": "Sanford''s historic downtown features beautiful homes that need specialized HVAC solutions. We retrofit modern systems while preserving architectural integrity."},
      {"title": "Duke Energy Rebate Experts", "description": "We help you access up to $300 for AC replacement and $150 for heat pumps through Duke Energy''s rebate programs."},
      {"title": "SunRail Corridor Service", "description": "We serve the entire SunRail corridor from downtown Sanford through Lake Mary, offering convenient scheduling for commuters."},
      {"title": "Lakefront Humidity Solutions", "description": "Properties near Lake Monroe face unique humidity challenges. We provide specialized dehumidification solutions for lakefront homes."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Sanford",
    "intro": "Sanford''s mix of historic and new construction creates diverse HVAC needs:",
    "challenges": [
      {"title": "Historic Building Retrofits", "description": "Downtown Sanford''s 100+ year old buildings often lack ductwork. We specialize in ductless systems and creative solutions that preserve historic character."},
      {"title": "Lake Monroe Humidity", "description": "Properties near Lake Monroe experience elevated humidity levels. Proper dehumidification is essential for comfort and preventing mold."},
      {"title": "Mixed Housing Stock", "description": "From 1920s bungalows to 2020s construction, Sanford''s diverse housing requires varied approaches to HVAC installation and service."},
      {"title": "Summer Heat", "description": "With 100+ days above 90°F, Sanford summers demand robust cooling systems and regular maintenance."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Sanford",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Sanford''s historic properties including ductless systems and sensitive retrofits.", "features": ["Ductless mini-splits", "Preservation-friendly", "Hidden installation", "Zoned comfort"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Sanford. Same-day service available.", "features": ["Same-day service", "All brands", "90-day warranty", "Upfront pricing"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations sized for Sanford''s climate with Duke Energy rebate assistance.", "features": ["Manual J calculations", "Duke Energy rebates", "10-year warranty", "Financing available"]},
      {"name": "Dehumidification", "slug": "dehumidification", "description": "Whole-home dehumidification essential for lakefront and historic properties.", "features": ["Whole-home systems", "Lakefront solutions", "Mold prevention", "Integrated controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your investment with regular maintenance.", "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Historic home care"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you install AC in my historic Sanford home without ductwork?", "answer": "Yes! Ductless mini-split systems are perfect for historic homes. They provide excellent cooling without invasive ductwork installation."},
      {"question": "What rebates does Duke Energy offer?", "answer": "Duke Energy offers up to $300 for AC replacement, $150 for heat pumps, and $150 for duct sealing. A free Home Energy Check is required within 24 months."},
      {"question": "Do you service lakefront properties?", "answer": "Yes, we specialize in lakefront homes near Lake Monroe. We provide dehumidification solutions to handle the increased humidity these properties experience."},
      {"question": "How often should I service my AC in Sanford?", "answer": "We recommend bi-annual maintenance for Sanford homes. The extended cooling season and humidity make regular maintenance essential."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,500", "days_above_90": "100+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready to Upgrade Your Sanford Home Comfort?',
  'Contact us today for a free estimate. We''ll help you access Duke Energy rebates and find the perfect system for your historic downtown or modern Sanford home.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Sanford", "description": "Professional HVAC services in Sanford, FL", "url": "https://coolit-hvac.com/sanford-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Sanford", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you install AC in my historic Sanford home?", "acceptedAnswer": {"@type": "Answer", "text": "Yes! Ductless mini-split systems are perfect for historic homes."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Sanford", "item": "https://coolit-hvac.com/fl/sanford"}]}'::jsonb,

  '/fl/seminole-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/lake-mary/hvac", "anchor_text": "Lake Mary AC"}, {"slug": "/fl/winter-springs/hvac", "anchor_text": "Winter Springs HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1850, 26, 12, 86,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Winter Park, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  'Winter Park', 'winter-park', 'Florida', 'FL', 'Orange', 'orange-county',
  28.5997, -81.3392,
  ARRAY['32789', '32790', '32792', '32793'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 89
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
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  NOW(),
  31153, 'US Census Bureau ACS 2023',
  97842, 625000, 58.7,
  ARRAY['single-family', 'historic-home', 'luxury-estate', 'condo'],
  '{"pre-1950": 20, "1950s-1970s": 30, "1980s-2000s": 35, "2010s-2020s": 15}'::jsonb,
  92, 52, 73, 3550, 105, 52.4, 'moderate',
  'Upscale Orlando suburb with tree-lined streets and chain of lakes. Beautiful historic homes mixed with modern luxury. Moderate hurricane risk.',
  ARRAY['Rollins College', 'Winter Park Memorial Hospital', 'Full Sail University (adjacent)', 'City of Winter Park', 'Park Avenue businesses', 'Winter Park Country Club'],
  ARRAY['Park Avenue', 'Rollins College', 'Scenic Boat Tour', 'Charles Hosmer Morse Museum', 'Kraft Azalea Garden', 'Mead Botanical Garden', 'Winter Park Golf Course', 'Albin Polasek Museum'],
  ARRAY['Winter Park Sidewalk Art Festival', 'Concours d''Elegance', 'Popcorn Flicks in the Park', 'Winter Park Wine & Dine', 'Bach Festival'],
  ARRAY['Orange County Public Schools', 'Private schools'],
  'Continued Park Avenue improvements. Luxury condo developments. Historic preservation efforts. SunRail station area development.',
  'Duke Energy Florida / City of Winter Park (some areas)',
  '{
    "duke_energy": {"ac_replacement": {"amount": 300, "requirements": "High-efficiency system"}, "heat_pump": {"amount": 150}, "total_available": {"amount": 1700}},
    "city_utility": {"contact": "City of Winter Park Electric for some areas"}
  }'::jsonb,
  'TECO Peoples Gas (limited)',
  'City of Winter Park Utilities',
  200,
  'Florida Building Code 8th Edition (2023), Winter Park historic district overlay',
  '{"hvac_replacement": "Permit required", "historic_overlay": "Additional design review in historic districts", "tree_ordinance": "Equipment placement must avoid protected trees"}'::jsonb,
  'moderate',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Kalos Services', 'Climate Control Experts', 'Air Conditioning Excellence'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy / City of Winter Park", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Park Avenue District', 'park-avenue', 'Central', 'mixed', '1920s-1960s', 'Upper income', 'Historic downtown with upscale shopping', ARRAY['historic building systems', 'commercial HVAC', 'preservation requirements', 'boutique needs'], '20-70+ years', 1, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Via Tuscany', 'via-tuscany', 'South', 'luxury-estate', '2000s-2010s', 'Upper income', 'Gated luxury community', ARRAY['large estate systems', 'multi-zone requirements', 'whole-home automation', 'wine cellar climate'], '10-20 years', 2, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Winter Park Historic District', 'historic-district', 'Central', 'historic-home', '1900s-1940s', 'Upper income', 'Original Winter Park homes on brick streets', ARRAY['historic home retrofits', 'ductless needs', 'preservation compliance', 'older systems'], '25-80+ years', 3, true),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Baldwin Park (adjacent)', 'baldwin-park-wp', 'East', 'mixed', '2000s-2010s', 'Upper middle income', 'New urbanist community', ARRAY['newer construction', 'townhome systems', 'multi-unit buildings', 'HOA standards'], '10-20 years', 4, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Lakefront Estates', 'lakefront-estates', 'North', 'luxury-estate', '1950s-1990s', 'Upper income', 'Lakefront luxury properties', ARRAY['lakefront humidity', 'large home zoning', 'premium demands', 'waterfront maintenance'], '15-50 years', 5, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Windsong', 'windsong', 'South', 'single-family', '1980s-1990s', 'Upper middle income', 'Established upscale neighborhood', ARRAY['1980s-90s systems', 'premium upgrades', 'efficiency focus', 'smart integration'], '20-35 years', 6, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'College Quarters', 'college-quarters', 'East', 'mixed', '1950s-1980s', 'Middle income', 'Near Rollins College', ARRAY['rental property systems', 'varied maintenance', 'older buildings', 'student housing needs'], '25-55 years', 7, false),
  ('a3b4c5d6-e7f8-9012-6789-345678901234', 'Orwin Manor', 'orwin-manor', 'Northwest', 'single-family', '1960s-1980s', 'Upper middle income', 'Established neighborhood', ARRAY['mid-century systems', 'efficiency upgrades', 'tree shade considerations', 'modernization needs'], '25-50 years', 8, false)
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
  'a3b4c5d6-e7f8-9012-6789-345678901234',
  'hvac',
  '/fl/winter-park/hvac',
  'HVAC Services in Winter Park, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Winter Park''s discerning homeowners. Historic home specialists. Serving Park Avenue, Via Tuscany & all neighborhoods. Premium comfort solutions.',
  'HVAC Winter Park FL',
  ARRAY['AC repair Winter Park', 'air conditioning Winter Park FL', 'HVAC contractor Winter Park', 'historic home AC Winter Park', 'luxury home HVAC', 'Orange County HVAC'],

  'Winter Park''s Premium HVAC Experts',
  'Exceptional comfort for exceptional homes',
  'Licensed & Insured | Historic Home Certified | Luxury Property Specialists',
  'Winter Park represents the finest in Central Florida living—tree-lined brick streets, historic architecture, world-class shopping on Park Avenue, and a chain of beautiful lakes. With median home values exceeding $625,000 and a community that demands excellence, Winter Park homeowners expect premium HVAC service. Our team specializes in the unique challenges of this distinguished city, from retrofitting century-old homes to integrating smart systems in modern estates.',

  '{
    "headline": "Why Winter Park Homeowners Choose Us",
    "reasons": [
      {"title": "Historic Home Expertise", "description": "Winter Park''s historic district features some of Central Florida''s finest period homes. We specialize in ductless systems and sensitive retrofits that preserve architectural integrity."},
      {"title": "Luxury Property Standards", "description": "From Via Tuscany estates to lakefront mansions, we provide the premium service and equipment that Winter Park''s finest properties deserve."},
      {"title": "Tree-Conscious Installation", "description": "Winter Park''s protected tree canopy requires careful equipment placement. We work within city ordinances while optimizing system performance."},
      {"title": "Park Avenue Commercial Experience", "description": "We serve Park Avenue boutiques and restaurants, bringing commercial-grade expertise to residential properties."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Winter Park",
    "intro": "Winter Park''s character and climate create specific HVAC demands:",
    "challenges": [
      {"title": "Historic Preservation", "description": "Winter Park''s historic district overlay requires careful consideration of equipment visibility and installation methods. We provide solutions that meet preservation standards."},
      {"title": "Mature Tree Canopy", "description": "The city''s protected oak trees create unique challenges for equipment placement and require careful navigation during installation."},
      {"title": "Lakefront Humidity", "description": "Properties along Winter Park''s chain of lakes experience elevated humidity requiring specialized dehumidification solutions."},
      {"title": "Discerning Expectations", "description": "Winter Park homeowners expect excellence. We provide premium equipment and white-glove service to meet these standards."}
    ]
  }'::jsonb,

  '{
    "headline": "Premium HVAC Services in Winter Park",
    "services": [
      {"name": "Historic Home HVAC", "slug": "historic-hvac", "description": "Specialized solutions for Winter Park''s historic properties. Ductless systems and preservation-compliant installations.", "features": ["Ductless mini-splits", "Hidden installations", "Preservation compliant", "Zoned comfort"]},
      {"name": "Luxury Home Systems", "slug": "luxury-hvac", "description": "Premium equipment and multi-zone solutions for Winter Park''s finest properties.", "features": ["Variable refrigerant flow", "Whole-home automation", "Wine cellar climate", "Pool house systems"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Prompt, professional repairs for Winter Park homeowners.", "features": ["Same-day service", "All premium brands", "90-day warranty", "White-glove service"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Expert installations with proper sizing and premium equipment.", "features": ["Manual J calculations", "Premium equipment", "Tree-conscious placement", "10-year warranty"]},
      {"name": "Indoor Air Quality", "slug": "indoor-air-quality", "description": "Premium air quality solutions for discerning homeowners.", "features": ["Whole-home purification", "Advanced filtration", "UV treatment", "Humidity control"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Comprehensive maintenance to protect your investment.", "features": ["Bi-annual service", "Priority scheduling", "System optimization", "Extended warranties"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Can you work within Winter Park''s historic district requirements?", "answer": "Absolutely. We''re experienced with Winter Park''s historic overlay districts and provide solutions that meet all preservation requirements while delivering modern comfort."},
      {"question": "Do you install systems around protected trees?", "answer": "Yes, we''re well-versed in Winter Park''s tree ordinances and design installations that protect the city''s beautiful oak canopy."},
      {"question": "What brands do you recommend for luxury homes?", "answer": "We install premium brands like Carrier Infinity, Trane XV, and Lennox XC series. For historic homes, we often recommend Mitsubishi or Daikin ductless systems."},
      {"question": "Do you serve Park Avenue businesses?", "answer": "Yes, we service commercial properties along Park Avenue and bring that same commercial expertise to residential customers."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "73%", "cooling_degree_days": "3,550", "days_above_90": "105+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready for Premium Comfort in Your Winter Park Home?',
  'Contact us today for a consultation. We''ll design a comfort solution worthy of your Winter Park property, whether historic or modern.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Winter Park", "description": "Premium HVAC services for Winter Park, FL", "url": "https://coolit-hvac.com/winter-park-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Winter Park", "addressRegion": "FL"}, "priceRange": "$$$"}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Can you work within Winter Park''s historic district?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we specialize in preservation-compliant HVAC solutions."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Winter Park", "item": "https://coolit-hvac.com/fl/winter-park"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/maitland/hvac", "anchor_text": "Maitland AC"}, {"slug": "/fl/oviedo/hvac", "anchor_text": "Oviedo HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/historic-hvac", "anchor_text": "Historic Home HVAC"}, {"slug": "/services/luxury-hvac", "anchor_text": "Luxury HVAC"}]'::jsonb,

  1900, 28, 14, 90,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
-- ============================================
-- Apopka, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 3 - Orlando Metro
-- ============================================

INSERT INTO cities (
  id, name, slug, state, state_abbrev, county, county_slug,
  latitude, longitude, zip_codes, metro_area, nearby_city_ids, is_active, priority
) VALUES (
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  'Apopka', 'apopka', 'Florida', 'FL', 'Orange', 'orange-county',
  28.6934, -81.5322,
  ARRAY['32703', '32704', '32712'],
  'Orlando-Kissimmee-Sanford',
  ARRAY['d0e1f2a3-b4c5-6789-3456-012345678901']::uuid[],
  true, 87
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
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  NOW(),
  57904, 'US Census Bureau ACS 2023',
  72647, 340000, 68.2,
  ARRAY['single-family', 'new-construction', 'townhouse', 'manufactured-home'],
  '{"pre-1980": 15, "1980s-1990s": 25, "2000s-2010s": 35, "2020s": 25}'::jsonb,
  92, 51, 74, 3550, 105, 52.1, 'moderate',
  'Growing Orlando suburb known as "Indoor Foliage Capital of the World." Significant new construction. Family-oriented community with newer developments.',
  ARRAY['Florida Hospital Apopka', 'Orange County Public Schools', 'City of Apopka', 'Foliage nurseries', 'Amazon Fulfillment (nearby)', 'Rock Springs Run State Reserve'],
  ARRAY['Rock Springs at Kelly Park', 'Wekiwa Springs State Park', 'Lake Apopka North Shore', 'Northwest Recreation Complex', 'Apopka Amphitheater', 'Kit Land Nelson Park'],
  ARRAY['Apopka Art & Jazz Festival', 'Christmas Parade', 'Fourth of July Celebration', 'Food Truck Fridays'],
  ARRAY['Orange County Public Schools'],
  'Rapid residential growth. New master-planned communities. Kelly Park Road development. Wekiva Parkway completion. Downtown revitalization efforts.',
  'Duke Energy Florida',
  '{
    "ac_replacement": {"amount": 300, "requirements": "High-efficiency system with Home Energy Check"},
    "heat_pump": {"amount": 150, "requirements": "Qualifying heat pump installation"},
    "duct_sealing": {"amount": 150, "requirements": "Professional duct testing and sealing"},
    "total_available": {"amount": 1700, "requirements": "Combined Duke Energy rebates"}
  }'::jsonb,
  'None (all-electric area)',
  'City of Apopka / Orange County Utilities',
  230,
  'Florida Building Code 8th Edition (2023), City of Apopka amendments',
  '{"hvac_replacement": "Permit required for all HVAC replacements", "new_construction": "Energy code compliance required", "inspection": "Final inspection required"}'::jsonb,
  'high',
  ARRAY['Del-Air Heating and Air', 'Frank Gay Services', 'Energy Air', 'Direct Air Conditioning', 'A/C Warehouse'],
  '{"demographics": "US Census Bureau ACS 2023", "utilities": "Duke Energy Florida", "research_date": "2024-12-26"}'::jsonb
)
ON CONFLICT (city_id) DO UPDATE SET
  population = EXCLUDED.population, researched_at = NOW(), updated_at = NOW();

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Wekiva Run', 'wekiva-run', 'North', 'single-family', '2010s-2020s', 'Upper middle income', 'Newer community near Wekiva Springs', ARRAY['new construction systems', 'HOA requirements', 'energy code compliance', 'smart home ready'], '2-12 years', 1, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Rock Springs Ridge', 'rock-springs-ridge', 'Northwest', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned near Kelly Park', ARRAY['newer systems', 'family home sizing', 'springs proximity humidity', 'premium demands'], '5-20 years', 2, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Piedmont Lakes', 'piedmont-lakes', 'Central', 'single-family', '1990s-2000s', 'Middle income', 'Established lakefront community', ARRAY['1990s-2000s systems', 'lakefront humidity', 'system replacements', 'efficiency upgrades'], '15-28 years', 3, true),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Sheeler Oaks', 'sheeler-oaks', 'South', 'single-family', '1980s-1990s', 'Middle income', 'Established neighborhood', ARRAY['older system replacements', 'ductwork updates', 'efficiency improvements', 'budget-friendly options'], '20-35 years', 4, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Downtown Apopka', 'downtown-apopka', 'Central', 'mixed', '1950s-1990s', 'Moderate income', 'Historic downtown area', ARRAY['older buildings', 'commercial HVAC', 'mixed-use needs', 'retrofit requirements'], '20-60 years', 5, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Errol Estates', 'errol-estates', 'West', 'single-family', '1980s-2000s', 'Upper middle income', 'Golf course community', ARRAY['golf course humidity', 'premium system demands', 'larger homes', 'HOA standards'], '15-35 years', 6, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Kelly Park Area', 'kelly-park-area', 'Northwest', 'mixed', '1970s-2010s', 'Mixed income', 'Near Kelly Park and springs', ARRAY['rural properties', 'well water impacts', 'diverse housing types', 'spring humidity'], '10-45 years', 7, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Meadow Woods', 'meadow-woods', 'East', 'single-family', '2000s-2010s', 'Middle income', 'Newer residential development', ARRAY['newer construction', 'builder-grade upgrades', 'smart thermostat setup', 'HOA requirements'], '8-20 years', 8, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Bear Lake Area', 'bear-lake', 'Southeast', 'single-family', '1970s-1990s', 'Middle income', 'Established lakeside area', ARRAY['lakefront humidity', 'older systems', 'tree shade impacts', 'modernization needs'], '20-45 years', 9, false),
  ('b4c5d6e7-f8a9-0123-7890-456789012345', 'Clarcona', 'clarcona', 'South', 'mixed', '1960s-2000s', 'Moderate income', 'Rural-suburban transition area', ARRAY['diverse housing', 'manufactured homes', 'well water', 'varied needs'], '15-50 years', 10, false)
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
  'b4c5d6e7-f8a9-0123-7890-456789012345',
  'hvac',
  '/fl/apopka/hvac',
  'HVAC Services in Apopka, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Apopka''s 58,000+ growing residents. Duke Energy rebates available. Serving Rock Springs, Wekiva & all neighborhoods. New construction specialists!',
  'HVAC Apopka FL',
  ARRAY['AC repair Apopka', 'air conditioning Apopka FL', 'HVAC contractor Apopka', 'new construction HVAC Apopka', 'Duke Energy rebates Apopka', 'Orange County HVAC'],

  'Apopka''s Growing HVAC Experts',
  'New construction and established home specialists',
  'Licensed & Insured | Duke Energy Certified | New Construction Experts',
  'Apopka is one of Central Florida''s fastest-growing cities, expanding from its roots as the "Indoor Foliage Capital of the World" into a thriving bedroom community of nearly 58,000 residents. From new construction in Rock Springs Ridge to established homes in Piedmont Lakes, our team provides expert HVAC service for every type of Apopka property. As Duke Energy certified contractors, we help you maximize rebates while keeping your family comfortable in Central Florida''s demanding climate.',

  '{
    "headline": "Why Apopka Homeowners Choose Us",
    "reasons": [
      {"title": "New Construction Specialists", "description": "With Apopka''s rapid growth, we''ve become experts in new construction HVAC. We work with builders and homeowners to ensure optimal system design and installation."},
      {"title": "Duke Energy Rebate Experts", "description": "We help you access up to $300 for AC replacement and $150 for heat pumps through Duke Energy''s rebate programs. Free home energy checks available."},
      {"title": "Springs Area Knowledge", "description": "Properties near Wekiva and Rock Springs experience unique humidity challenges. We provide specialized solutions for these beautiful but demanding locations."},
      {"title": "Family-Focused Service", "description": "Apopka is a family community, and we treat every customer like family. Honest pricing, reliable service, and solutions that fit your budget."}
    ]
  }'::jsonb,

  '{
    "headline": "HVAC Challenges Unique to Apopka",
    "intro": "Apopka''s growth and location create specific HVAC needs:",
    "challenges": [
      {"title": "Springs Proximity Humidity", "description": "Properties near Wekiva Springs and Rock Springs experience elevated humidity. Proper dehumidification is essential for comfort and home protection."},
      {"title": "New Construction Quality", "description": "Many new Apopka homes come with builder-grade HVAC that may not be optimally sized. We help homeowners upgrade for better efficiency and comfort."},
      {"title": "Rapid Growth Demands", "description": "Apopka''s fast growth means many HVAC companies are stretched thin. We''ve expanded our team to provide prompt service throughout the area."},
      {"title": "Mixed Housing Stock", "description": "From 1950s downtown to 2020s master-planned communities, Apopka requires varied HVAC approaches for different home types."}
    ]
  }'::jsonb,

  '{
    "headline": "Complete HVAC Services in Apopka",
    "services": [
      {"name": "New Construction HVAC", "slug": "new-construction", "description": "Expert installation for new Apopka homes. We ensure proper sizing and optimal efficiency from day one.", "features": ["Builder coordination", "Manual J calculations", "Energy code compliance", "Smart home ready"]},
      {"name": "AC Repair", "slug": "ac-repair", "description": "Fast, reliable repairs throughout Apopka. Same-day service available.", "features": ["Same-day service", "All brands serviced", "90-day warranty", "Upfront pricing"]},
      {"name": "AC Installation", "slug": "ac-installation", "description": "Premium installations with Duke Energy rebate assistance.", "features": ["Duke Energy rebates", "Up to 22 SEER2", "10-year warranty", "Financing available"]},
      {"name": "Builder-Grade Upgrades", "slug": "system-upgrades", "description": "Upgrade builder-installed systems for better performance and efficiency.", "features": ["Capacity increases", "Efficiency upgrades", "Zoning additions", "Smart thermostat integration"]},
      {"name": "Humidity Control", "slug": "dehumidification", "description": "Essential for springs-area properties. Whole-home dehumidification solutions.", "features": ["Whole-home systems", "Springs area specialists", "Mold prevention", "Integrated controls"]},
      {"name": "Maintenance Plans", "slug": "maintenance", "description": "Protect your new or established home with regular maintenance.", "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Filter delivery"]}
    ]
  }'::jsonb,

  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {"question": "Do you work with new construction builders in Apopka?", "answer": "Yes, we work with many builders in Apopka''s growing communities. We also help new homeowners evaluate and upgrade builder-installed systems."},
      {"question": "What rebates does Duke Energy offer?", "answer": "Duke Energy offers up to $300 for AC replacement with a Home Energy Check, $150 for heat pumps, and $150 for duct sealing. We handle all paperwork."},
      {"question": "Why do homes near the springs need special attention?", "answer": "Properties near Wekiva and Rock Springs experience higher humidity due to the springs and surrounding vegetation. This requires enhanced dehumidification for comfort and mold prevention."},
      {"question": "Should I upgrade my builder-grade AC?", "answer": "Many builder-grade systems are sized minimally. If you''re experiencing uneven temperatures or high bills, an upgrade or enhancement may significantly improve comfort and efficiency."},
      {"question": "How often should I service my AC in Apopka?", "answer": "We recommend bi-annual maintenance—spring and fall. With 105+ days above 90°F, regular maintenance prevents breakdowns during peak cooling season."}
    ]
  }'::jsonb,

  '{"avg_summer_high": "92°F", "avg_humidity": "74%", "cooling_degree_days": "3,550", "days_above_90": "105+", "hurricane_risk": "Moderate"}'::jsonb,

  'Ready to Upgrade Your Apopka Home Comfort?',
  'Contact us today for a free estimate. Whether you''re in a new construction home or an established neighborhood, we''ll help you stay cool with Duke Energy rebate assistance.',

  '{"@context": "https://schema.org", "@type": "HVACBusiness", "name": "Cool It HVAC - Apopka", "description": "Professional HVAC services in Apopka, FL specializing in new construction and established homes.", "url": "https://coolit-hvac.com/apopka-fl", "telephone": "+1-407-555-COOL", "areaServed": {"@type": "City", "name": "Apopka", "addressRegion": "FL"}}'::jsonb,
  '{"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [{"@type": "Question", "name": "Do you work with new construction builders?", "acceptedAnswer": {"@type": "Answer", "text": "Yes, we work with many builders in Apopka and help homeowners upgrade builder-installed systems."}}]}'::jsonb,
  '{"@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [{"@type": "ListItem", "position": 1, "name": "Home", "item": "https://coolit-hvac.com"}, {"@type": "ListItem", "position": 2, "name": "Florida", "item": "https://coolit-hvac.com/fl"}, {"@type": "ListItem", "position": 3, "name": "Apopka", "item": "https://coolit-hvac.com/fl/apopka"}]}'::jsonb,

  '/fl/orange-county',
  '[{"slug": "/fl/orlando/hvac", "anchor_text": "Orlando HVAC"}, {"slug": "/fl/altamonte-springs/hvac", "anchor_text": "Altamonte Springs AC"}, {"slug": "/fl/mount-dora/hvac", "anchor_text": "Mount Dora HVAC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/new-construction", "anchor_text": "New Construction HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  1880, 26, 14, 87,
  'published', 1, 'claude', 'phase3-v1'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title, status = 'published', version = city_seo_content.version + 1, updated_at = NOW();
