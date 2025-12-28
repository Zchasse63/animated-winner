-- ============================================
-- Riverview, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Riverview Core Data
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
  'f6a7b8c9-d0e1-2345-f012-678901234567', -- Fixed UUID for Riverview
  'Riverview',
  'riverview',
  'Florida',
  'FL',
  'Hillsborough',
  'hillsborough-county',
  27.8752,
  -82.3265,
  ARRAY['33569', '33578', '33579'],
  'Tampa Bay',
  ARRAY[
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa
    'd4e5f6a7-b8c9-0123-def0-456789012345'  -- Brandon
  ]::uuid[],
  true,
  88
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Riverview Research Data
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
  'f6a7b8c9-d0e1-2345-f012-678901234567', -- Riverview city_id
  NOW(),

  -- Demographics
  119714,
  'US Census Bureau American Community Survey 2023',
  100475,
  385000,
  76.0,
  ARRAY['single-family', 'townhouse', 'new-construction'],
  '{"pre-1990": 10, "1990s-2000s": 25, "2010s": 40, "2020s": 25}'::jsonb,

  -- Climate
  91,
  52,
  73,
  3450,
  95,
  52.1,
  'moderate',
  'Humid subtropical climate with hot, humid summers and mild winters. Inland location slightly hotter than coastal areas. Strong afternoon thunderstorms common May-September. Hurricane risk moderate due to inland position.',

  -- Local Context
  ARRAY['Hillsborough County Public Schools', 'FishHawk Ranch businesses', 'Summerfield Crossings Golf Club', 'Amazon Fulfillment Centers', 'Mosaic Company', 'Tampa Premium Outlets (nearby)', 'HCA Florida Brandon Hospital', 'Bell Shoals Baptist Church', 'AdventHealth Riverview (planned)'],
  ARRAY['Alafia River State Park', 'Bell Creek Nature Preserve', 'Balm-Boyette Preserve', 'FishHawk Ranch', 'Summerfield Crossings Golf Club', 'Riverview Civic Center', 'Boyette Springs Park', 'Riverview Regional Park'],
  ARRAY['FishHawk Ranch community events', 'Summerfield community festivals', 'Alafia River Rendezvous', 'Riverview Holiday Parade', 'Boyette Blueberry Festival'],
  ARRAY['Hillsborough County Public Schools'],
  'Rapid population growth with new master-planned communities. FishHawk Ranch expansion continues. New commercial development along Big Bend Road. AdventHealth hospital construction. Significant infrastructure improvements on US-301.',

  -- Utilities & Rebates
  'Tampa Electric (TECO)',
  '{
    "ac_replacement": {
      "amount": 436,
      "requirements": "15+ SEER system with qualifying efficiency ratings",
      "notes": "Higher rebates for higher SEER ratings"
    },
    "heat_pump": {
      "amount": 700,
      "requirements": "Qualifying heat pump system installation"
    },
    "smart_thermostat": {
      "amount": 75,
      "requirements": "ENERGY STAR certified smart thermostat"
    },
    "duct_sealing": {
      "amount": 200,
      "requirements": "Professional duct testing and sealing"
    },
    "total_available": {
      "amount": 2500,
      "requirements": "Combined energy efficiency rebates through TECO"
    }
  }'::jsonb,
  'TECO Peoples Gas',
  'Hillsborough County Water',
  220,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), Hillsborough County amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "hoa_approval": "Many communities require HOA approval for exterior equipment"
  }'::jsonb,
  'very high',

  -- Competitive Landscape
  ARRAY['Easy A/C', 'Comfort Temp', 'The A/C Guy of Tampa Bay', 'Air Rescue', 'One Hour Heating & Air Conditioning'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, Census Reporter",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Tampa Electric (TECO) website, rebate programs",
    "employers": "Hillsborough County Economic Development",
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
-- 3. NEIGHBORHOODS TABLE - Riverview Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- FishHawk Ranch
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'FishHawk Ranch', 'fishhawk-ranch', 'East', 'single-family', '2000s-2020s', 'Upper middle income', 'Master-planned community with extensive amenities', ARRAY['larger home zoning requirements', 'multi-zone systems', 'high-efficiency demands', 'smart home integration'], '5-15 years', 1, true),
  -- Summerfield
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Summerfield', 'summerfield', 'Central', 'mixed', '1990s-2010s', 'Middle income', 'Golf community with varied housing types', ARRAY['varied housing types', 'villa HVAC', 'townhome systems', 'golf course humidity'], '10-20 years', 2, true),
  -- Boyette
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Boyette', 'boyette', 'Northeast', 'single-family', '2000s-2010s', 'Upper middle income', 'Larger lots near nature preserves', ARRAY['larger lot homes', 'well water considerations', 'rural area dust', 'preserve proximity humidity'], '8-18 years', 3, true),
  -- Boyette Springs
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Boyette Springs', 'boyette-springs', 'Northeast', 'single-family', '2000s-2010s', 'Upper middle income', 'Family-friendly near natural springs', ARRAY['2000s era systems aging', 'mature landscaping shade', 'natural spring humidity', 'quality school proximity'], '10-18 years', 4, false),
  -- Panther Trace
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Panther Trace', 'panther-trace', 'South', 'single-family', '2010s-2020s', 'Middle income', 'Newer development with community amenities', ARRAY['newer construction systems', 'builder-grade upgrades', 'community pool humidity', 'HOA equipment requirements'], '3-12 years', 5, false),
  -- South Fork
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'South Fork', 'south-fork', 'Southeast', 'single-family', '2000s-2010s', 'Upper income', 'Upscale homes with premium features', ARRAY['upscale home requirements', 'multi-story cooling', 'wine cellar climate control', 'whole-home automation'], '8-18 years', 6, false),
  -- Waterset
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Waterset', 'waterset', 'West', 'single-family', '2010s-2020s', 'Middle income', 'New construction with water features', ARRAY['new construction standards', 'water feature humidity', 'energy code compliance', 'smart thermostat integration'], '2-10 years', 7, false),
  -- Winthrop
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Winthrop', 'winthrop', 'West', 'mixed', '2000s-2010s', 'Middle income', 'Walkable town center community', ARRAY['walkable community needs', 'town center commercial', 'live-work unit HVAC', 'arts district requirements'], '8-18 years', 8, false),
  -- Riverview Proper
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Riverview Proper', 'riverview-proper', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Original Riverview core area', ARRAY['older system replacements', '1980s-90s ductwork', 'renovation HVAC upgrades', 'budget-friendly options'], '20-35 years', 9, false),
  -- Alafia
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Alafia', 'alafia', 'North', 'single-family', '1990s-2000s', 'Middle income', 'Near Alafia River with nature access', ARRAY['river proximity humidity', 'flood zone considerations', 'elevated home systems', 'outdoor unit placement'], '15-25 years', 10, false),
  -- Bloomingdale
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Bloomingdale', 'bloomingdale', 'Northwest', 'single-family', '1990s-2000s', 'Middle income', 'Established neighborhood near shopping', ARRAY['established community updates', 'system modernization', 'efficiency upgrades', 'duct cleaning needs'], '15-25 years', 11, false),
  -- Rivercrest
  ('f6a7b8c9-d0e1-2345-f012-678901234567', 'Rivercrest', 'rivercrest', 'North', 'single-family', '2000s-2010s', 'Upper middle income', 'Waterfront community near Alafia River', ARRAY['waterfront humidity control', 'premium system demands', 'whole-home solutions', 'dehumidification needs'], '10-20 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Riverview HVAC Content
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
  'f6a7b8c9-d0e1-2345-f012-678901234567',
  'hvac',
  '/fl/riverview/hvac',
  'HVAC Services in Riverview, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Riverview, Florida''s 120,000+ residents. TECO rebates up to $2,500. Serving FishHawk Ranch, Summerfield, Boyette & all communities. Call today!',
  'HVAC Riverview FL',
  ARRAY['AC repair Riverview', 'air conditioning Riverview FL', 'HVAC contractor Riverview', 'FishHawk HVAC', 'TECO rebates Riverview', 'Hillsborough County HVAC'],

  'Riverview''s Premier HVAC Specialists',
  'Trusted by over 10,000 Hillsborough County homeowners',
  'Licensed & Insured | TECO Certified | Same-Day Service',
  'Riverview is one of Florida''s fastest-growing communities, and our HVAC team has grown right alongside it. From the luxury homes of FishHawk Ranch to the established neighborhoods near Alafia River, we understand the unique cooling demands of this diverse area. With household incomes averaging over $100,000, Riverview homeowners expect quality workmanship and premium service. That''s exactly what we deliver, along with expert guidance on TECO''s generous rebate programs that can save you up to $2,500 on qualifying installations.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Riverview Families Choose Us",
    "reasons": [
      {
        "title": "TECO Rebate Maximizers",
        "description": "Tampa Electric offers Florida''s best utility rebates—up to $700 for heat pumps and $436 for AC systems. We handle all paperwork to ensure you receive every dollar you''re entitled to."
      },
      {
        "title": "Master-Planned Community Experts",
        "description": "From FishHawk''s 4,000+ acres to Summerfield''s 3,758 homes, we understand HOA requirements, builder-grade equipment upgrades, and multi-zone solutions for larger homes."
      },
      {
        "title": "New Construction Specialists",
        "description": "With 65% of Riverview homes built since 2010, we specialize in warranty repairs, builder-grade upgrades, and systems designed for today''s energy codes."
      },
      {
        "title": "Same-Day Service Guarantee",
        "description": "Your comfort can''t wait. We offer guaranteed same-day service throughout Riverview, including FishHawk, Boyette, Panther Trace, and all surrounding communities."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Specific to Riverview",
    "intro": "Riverview''s location and rapid growth create unique demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Extreme Summer Heat",
        "description": "Riverview''s inland location means summer highs reach 91°F regularly—2-3 degrees hotter than coastal areas. Systems work harder here, requiring robust equipment and regular maintenance."
      },
      {
        "title": "Master-Planned Community Requirements",
        "description": "FishHawk, Summerfield, and Panther Trace all have HOA guidelines for equipment placement, noise levels, and aesthetic standards. We navigate these requirements daily."
      },
      {
        "title": "Newer Home System Upgrades",
        "description": "Many Riverview homes came with builder-grade HVAC systems that underperform. We specialize in upgrading these systems for better efficiency and comfort."
      },
      {
        "title": "Large Home Zoning Challenges",
        "description": "FishHawk and South Fork homes often exceed 3,000 square feet. Single-zone systems struggle in these homes—we design and install multi-zone solutions that deliver consistent comfort."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Riverview",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, expert repairs for all makes and models. We stock common parts for same-day fixes in Riverview''s hottest months.",
        "features": ["Same-day service available", "All brands serviced", "90-day repair warranty", "Upfront pricing"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Premium installations using Manual J load calculations. We right-size your system for Riverview''s climate and your home''s specific needs.",
        "features": ["Manual J load calculations", "TECO rebate up to $436", "Up to 22 SEER2 efficiency", "10-year parts warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps are ideal for Riverview''s climate, providing efficient heating and cooling. TECO offers up to $700 in rebates for qualifying installations.",
        "features": ["$700 TECO rebate available", "Year-round efficiency", "Lower operating costs", "Quiet operation"]
      },
      {
        "name": "Multi-Zone Systems",
        "slug": "zoning",
        "description": "Perfect for FishHawk''s larger homes. Zoned systems deliver customized comfort to each area of your home while reducing energy waste.",
        "features": ["Room-by-room control", "Energy savings 20-30%", "Ideal for 2-story homes", "Smart thermostat compatible"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "New construction homes are built tight for efficiency, but this can trap pollutants. Our IAQ solutions ensure healthy air throughout your home.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Fresh air ventilation"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with regular maintenance. Especially important for newer homes still under builder warranty.",
        "features": ["Bi-annual tune-ups", "Priority scheduling", "15% repair discount", "Warranty protection"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "What TECO rebates are available for Riverview homeowners?",
        "answer": "Tampa Electric offers generous rebates: up to $700 for heat pump installations, $436 for high-efficiency AC systems, $200 for duct sealing, and $75 for smart thermostats. Combined, you could save up to $2,500 on qualifying upgrades."
      },
      {
        "question": "How do I handle HOA requirements for HVAC equipment in FishHawk?",
        "answer": "We''re familiar with FishHawk''s HOA guidelines and other Riverview community standards. We help you submit required documentation and ensure equipment placement meets all aesthetic and noise requirements."
      },
      {
        "question": "Should I upgrade my builder-grade AC system?",
        "answer": "Many Riverview homes built in the 2010s came with 14 SEER systems that are now outdated. Upgrading to 16+ SEER can cut cooling costs 15-30% and often qualifies for TECO rebates that offset upgrade costs."
      },
      {
        "question": "Why is my new home so humid inside?",
        "answer": "Modern energy-efficient homes are built tight, which can trap humidity. This is common in Riverview''s newer communities. We recommend whole-home dehumidification integrated with your HVAC system."
      },
      {
        "question": "How often should I service my AC in Riverview?",
        "answer": "We recommend bi-annual maintenance—spring and fall. Riverview''s hot summers and high humidity put significant stress on systems, and regular maintenance prevents breakdowns and maintains efficiency."
      },
      {
        "question": "Do you service FishHawk Ranch and Boyette areas?",
        "answer": "Absolutely. We serve all Riverview communities including FishHawk Ranch, Boyette, Summerfield, Panther Trace, South Fork, Waterset, and Winthrop. Same-day service is available throughout the area."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "73%",
    "cooling_degree_days": "3,450",
    "days_above_90": "95+",
    "hurricane_risk": "Moderate"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Riverview Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access TECO rebates up to $2,500 and find the perfect system for your FishHawk, Summerfield, or Boyette home.',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Riverview",
    "description": "Professional HVAC services in Riverview, FL including AC repair, installation, and maintenance for residential customers in FishHawk, Summerfield, Boyette and all communities.",
    "url": "https://coolit-hvac.com/riverview-fl",
    "telephone": "+1-813-555-COOL",
    "email": "riverview@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Riverview",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.8752,
      "longitude": -82.3265
    },
    "openingHoursSpecification": [
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        "opens": "07:00",
        "closes": "19:00"
      },
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": "Saturday",
        "opens": "08:00",
        "closes": "17:00"
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
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Multi-Zone Systems"}},
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
        "name": "What TECO rebates are available for Riverview homeowners?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa Electric offers generous rebates: up to $700 for heat pump installations, $436 for high-efficiency AC systems, $200 for duct sealing, and $75 for smart thermostats."
        }
      },
      {
        "@type": "Question",
        "name": "How do I handle HOA requirements for HVAC equipment in FishHawk?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "We are familiar with FishHawk''s HOA guidelines and other Riverview community standards. We help you submit required documentation and ensure equipment placement meets all requirements."
        }
      },
      {
        "@type": "Question",
        "name": "Should I upgrade my builder-grade AC system?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Many Riverview homes built in the 2010s came with 14 SEER systems that are now outdated. Upgrading to 16+ SEER can cut cooling costs 15-30%."
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
      {"@type": "ListItem", "position": 3, "name": "Riverview", "item": "https://coolit-hvac.com/fl/riverview"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/hillsborough-county',
  '[{"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC Services"}, {"slug": "/fl/tampa/hvac", "anchor_text": "Tampa AC Repair"}, {"slug": "/fl/valrico/hvac", "anchor_text": "Valrico HVAC"}, {"slug": "/fl/lithia/hvac", "anchor_text": "Lithia AC Services"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/heat-pumps", "anchor_text": "Heat Pumps"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1920,
  26,
  14,
  88,

  'published',
  1,
  'claude',
  'phase2-v1'
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
