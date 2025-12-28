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
