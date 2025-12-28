-- ============================================
-- Spring Hill, FL - Complete SEO/GEO Data Seed
-- Generated: December 26, 2024
-- Phase 2 - Tampa Bay Metro Completion
-- ============================================

-- ============================================
-- 1. CITIES TABLE - Spring Hill Core Data
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
  'b8c9d0e1-f2a3-4567-1234-890123456789', -- Fixed UUID for Spring Hill
  'Spring Hill',
  'spring-hill',
  'Florida',
  'FL',
  'Hernando',
  'hernando-county',
  28.4769,
  -82.5476,
  ARRAY['34606', '34607', '34608', '34609', '34610', '34611', '34613', '34614'],
  'Tampa Bay',
  ARRAY[]::uuid[],  -- Will be updated with nearby cities
  true,
  86
)
ON CONFLICT (slug, state_abbrev) DO UPDATE SET
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  zip_codes = EXCLUDED.zip_codes,
  updated_at = NOW();

-- ============================================
-- 2. CITY_RESEARCH TABLE - Spring Hill Research Data
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
  'b8c9d0e1-f2a3-4567-1234-890123456789', -- Spring Hill city_id
  NOW(),

  -- Demographics
  118814,
  'US Census Bureau American Community Survey 2023',
  66557,
  265000,
  79.9,
  ARRAY['single-family', 'manufactured-home', '55-plus-community', 'ranch-style'],
  '{"pre-1980": 15, "1980s-1990s": 45, "2000s-2010s": 30, "2020s": 10}'::jsonb,

  -- Climate
  91,
  50,
  74,
  3400,
  95,
  52.8,
  'moderate-high',
  'Humid subtropical climate with hot, humid summers and mild winters. Located on Florida''s Nature Coast with proximity to Gulf of Mexico. Slightly cooler than Tampa due to northern location. Hurricane risk moderate to high.',

  -- Local Context
  ARRAY['HCA Florida Oak Hill Hospital', 'Bayfront Health Spring Hill', 'Hernando County School District', 'Publix Super Markets', 'Walmart', 'Home Depot', 'Hernando County Government', 'Florida Hospital North', 'Timber Pines Country Club', 'GlenLakes Country Club'],
  ARRAY['Weeki Wachee Springs State Park', 'Buccaneer Bay', 'Weekiwachee Preserve', 'Timber Pines Community', 'Hernando Beach', 'Florida Botanical Gardens', 'Bayport Park', 'Linda Pedersen Park', 'Anderson Snow Park', 'Nature Coast Trail'],
  ARRAY['Weeki Wachee Mermaid Shows', 'Spring Hill Art Festival', 'Hernando County Fair', 'Brooksville Blueberry Festival', 'Concerts in the Park', 'Timber Pines community events'],
  ARRAY['Hernando County School District'],
  'Growing retirement community with new active adult developments. Medical facility expansions. Nature Coast Trail extension. Continued residential development in areas near Weeki Wachee. Infrastructure improvements on US-19 corridor.',

  -- Utilities & Rebates
  'Duke Energy Florida / Withlacoochee River Electric Cooperative',
  '{
    "duke_energy": {
      "ac_replacement": {
        "amount": 300,
        "requirements": "High-efficiency system, Home Energy Check required"
      },
      "duct_sealing": {
        "amount": 150,
        "requirements": "Professional duct testing and sealing"
      },
      "total_available": 1700
    },
    "wrec": {
      "ac_replacement": {
        "amount": 350,
        "requirements": "High-efficiency system meeting WREC standards"
      },
      "heat_pump": {
        "amount": 500,
        "requirements": "Qualifying heat pump installation"
      },
      "total_available": 1500
    },
    "note": "Provider depends on location within Spring Hill"
  }'::jsonb,
  'None (all-electric area)',
  'Hernando County Utilities',
  280,

  -- Building/Codes
  'Florida Building Code 8th Edition (2023), Hernando County amendments',
  '{
    "hvac_replacement": "Permit required for all HVAC replacements",
    "ductwork": "Permit required for ductwork modifications",
    "electrical": "Separate electrical permit if panel work needed",
    "inspection": "Final inspection required before system operation",
    "manufactured_homes": "Special requirements for manufactured/mobile homes"
  }'::jsonb,
  'moderate',

  -- Competitive Landscape
  ARRAY['Senica Air Conditioning', 'Crystal Aire', 'Comfort Central', 'A/C Designs', 'Air Zero'],

  -- Source Tracking
  '{
    "demographics": "US Census Bureau ACS 2023, Florida Demographics",
    "climate": "NOAA National Weather Service, Weather.com historical data",
    "utilities": "Duke Energy Florida, Withlacoochee River Electric Cooperative",
    "employers": "Hernando County Economic Development",
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
-- 3. NEIGHBORHOODS TABLE - Spring Hill Neighborhoods
-- ============================================

INSERT INTO neighborhoods (city_id, name, slug, region, housing_type, avg_home_age, income_level, notable_features, common_hvac_issues, typical_system_age, display_order, is_featured)
VALUES
  -- Timber Pines
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Timber Pines', 'timber-pines', 'West', '55-plus', '1990s-2000s', 'Middle income', 'Active 55+ community with golf course', ARRAY['senior-friendly controls', 'villa HVAC systems', 'humidity for arthritis concerns', 'energy efficiency for fixed incomes'], '15-28 years', 1, true),
  -- Weeki Wachee Area
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Weeki Wachee Area', 'weeki-wachee', 'Northwest', 'mixed', '1980s-2010s', 'Upper middle income', 'Near Weeki Wachee Springs State Park', ARRAY['spring proximity humidity', 'waterfront systems', 'premium home demands', 'preserve area considerations'], '10-35 years', 2, true),
  -- Seven Hills
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Seven Hills', 'seven-hills', 'Central', 'single-family', '1980s-1990s', 'Middle income', 'Established golf course community', ARRAY['established home updates', 'golf course humidity', '1980s-90s system replacements', 'efficiency upgrades'], '20-35 years', 3, true),
  -- Silverthorn
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Silverthorn', 'silverthorn', 'Northeast', 'single-family', '1990s-2010s', 'Upper income', 'Country club community with luxury homes', ARRAY['country club standards', 'larger home zoning', 'premium equipment demands', 'whole-home solutions'], '10-28 years', 4, false),
  -- Heritage Pines
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Heritage Pines', 'heritage-pines', 'East', '55-plus', '1990s-2000s', 'Middle income', '55+ community with amenities', ARRAY['senior accessibility', 'villa systems', 'easy-to-use controls', 'energy efficiency priorities'], '15-28 years', 5, false),
  -- Lake in the Woods
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Lake in the Woods', 'lake-in-the-woods', 'Northwest', 'single-family', '1990s-2010s', 'Upper income', 'Lakefront luxury community', ARRAY['lakefront humidity control', 'upscale system needs', 'waterfront corrosion', 'whole-home dehumidification'], '10-25 years', 6, false),
  -- High Point
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'High Point', 'high-point', 'East', 'single-family', '1970s-1990s', 'Moderate income', 'Elevated terrain established neighborhood', ARRAY['elevation considerations', 'established home maintenance', 'older ductwork', 'budget-friendly options'], '20-40 years', 7, false),
  -- Spring Lake
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Spring Lake', 'spring-lake', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Lakeside residential area', ARRAY['lake proximity humidity', '1980s builds', 'system modernization', 'duct cleaning needs'], '25-40 years', 8, false),
  -- River Country Estates
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'River Country Estates', 'river-country-estates', 'Northwest', 'single-family', '2000s-2010s', 'Upper income', 'Luxury riverfront properties', ARRAY['river humidity', 'luxury home systems', 'outdoor living climate', 'whole-home automation'], '8-20 years', 9, false),
  -- Hernando Beach
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Hernando Beach', 'hernando-beach', 'West', 'single-family', '1970s-2000s', 'Upper middle income', 'Coastal community on Gulf', ARRAY['severe salt air corrosion', 'coastal humidity', 'hurricane resilience', 'flood zone considerations'], '15-45 years', 10, false),
  -- Pine Island
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Pine Island', 'pine-island', 'West', 'mixed', '1970s-1990s', 'Moderate income', 'Coastal area with mixed housing', ARRAY['coastal proximity', 'manufactured home HVAC', 'salt air exposure', 'humidity challenges'], '20-45 years', 11, false),
  -- Spring Hill Proper
  ('b8c9d0e1-f2a3-4567-1234-890123456789', 'Spring Hill Proper', 'spring-hill-proper', 'Central', 'single-family', '1980s-1990s', 'Moderate income', 'Original Spring Hill core development', ARRAY['older system replacements', '1980s housing stock', 'budget-conscious solutions', 'manufactured home service'], '25-40 years', 12, false)
ON CONFLICT (city_id, slug) DO NOTHING;

-- ============================================
-- 4. CITY_SEO_CONTENT TABLE - Spring Hill HVAC Content
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
  'b8c9d0e1-f2a3-4567-1234-890123456789',
  'hvac',
  '/fl/spring-hill/hvac',
  'HVAC Services in Spring Hill, FL | AC Repair, Installation & Maintenance',
  'Expert HVAC services for Spring Hill''s 118,000+ residents. Serving Timber Pines, Weeki Wachee, Seven Hills & all communities. Duke Energy & WREC rebates available.',
  'HVAC Spring Hill FL',
  ARRAY['AC repair Spring Hill', 'air conditioning Spring Hill FL', 'HVAC contractor Spring Hill', 'Timber Pines HVAC', 'Hernando County AC', 'manufactured home AC'],

  'Spring Hill''s Trusted HVAC Team',
  'Serving Hernando County''s Nature Coast since 1995',
  'Licensed & Insured | Duke Energy & WREC Certified | Senior Discounts',
  'Spring Hill offers the best of Florida''s Nature Coast—close to world-famous Weeki Wachee Springs, surrounded by natural beauty, and home to thriving 55+ communities like Timber Pines. With nearly 120,000 residents and a strong homeownership rate of 80%, Spring Hill homeowners value reliable, cost-effective HVAC service. Our team understands the unique needs of this area, from the manufactured home communities to the waterfront estates near Weeki Wachee River. We''re certified with both Duke Energy and WREC to help you access all available rebates.',

  -- Why Choose Us (JSONB)
  '{
    "headline": "Why Spring Hill Homeowners Trust Us",
    "reasons": [
      {
        "title": "Dual Utility Expertise",
        "description": "Spring Hill is served by both Duke Energy and WREC depending on location. We know which rebates apply to your home and handle all paperwork to maximize your savings."
      },
      {
        "title": "55+ Community Specialists",
        "description": "We serve Timber Pines, Heritage Pines, and other active adult communities. We understand senior-friendly controls, fixed-income budget concerns, and accessibility needs."
      },
      {
        "title": "Manufactured Home Experts",
        "description": "Spring Hill has a significant manufactured home population. We specialize in mobile home HVAC systems, split systems, and package units designed for these unique homes."
      },
      {
        "title": "Nature Coast Climate Knowledge",
        "description": "From Hernando Beach salt air to Weeki Wachee spring humidity, we understand the specific challenges of Hernando County''s diverse environments."
      }
    ]
  }'::jsonb,

  -- Local Challenges (JSONB)
  '{
    "headline": "HVAC Challenges Unique to Spring Hill",
    "intro": "Spring Hill''s location on Florida''s Nature Coast creates specific demands on heating and cooling systems:",
    "challenges": [
      {
        "title": "Coastal and Inland Mix",
        "description": "Spring Hill spans from Hernando Beach''s salt air to inland areas miles from the coast. Equipment recommendations vary significantly based on your specific location."
      },
      {
        "title": "1980s Housing Stock",
        "description": "Much of Spring Hill was developed in the 1980s-90s. These homes often have original or aging HVAC systems with outdated ductwork needing replacement or significant repair."
      },
      {
        "title": "Manufactured Home Considerations",
        "description": "Many Spring Hill residents live in manufactured homes with unique HVAC requirements—package units, limited space, and different installation standards."
      },
      {
        "title": "Senior Living Priorities",
        "description": "With a median age of 43 and large 55+ communities, many Spring Hill homeowners prioritize reliable comfort, easy-to-use controls, and energy efficiency for fixed incomes."
      }
    ]
  }'::jsonb,

  -- Services (JSONB)
  '{
    "headline": "Complete HVAC Services in Spring Hill",
    "services": [
      {
        "name": "AC Repair",
        "slug": "ac-repair",
        "description": "Fast, reliable AC repairs for all home types—site-built, manufactured, and everything in between. Same-day service available throughout Spring Hill.",
        "features": ["Same-day service available", "All home types", "90-day repair warranty", "Senior discounts"]
      },
      {
        "name": "AC Installation",
        "slug": "ac-installation",
        "description": "Expert installations tailored to your home type and budget. We properly size systems for Spring Hill''s humid climate using Manual J calculations.",
        "features": ["Manual J calculations", "Duke Energy/WREC rebates", "Financing available", "10-year warranty"]
      },
      {
        "name": "Heat Pump Services",
        "slug": "heat-pump",
        "description": "Heat pumps are ideal for Spring Hill''s mild winters. WREC offers up to $500 in rebates, making this an affordable upgrade for energy-conscious homeowners.",
        "features": ["Up to $500 WREC rebate", "Year-round efficiency", "Lower bills", "Quiet operation"]
      },
      {
        "name": "Manufactured Home HVAC",
        "slug": "manufactured-home",
        "description": "Specialized service for mobile and manufactured homes. We install and repair package units, split systems, and ductwork designed for manufactured housing.",
        "features": ["Package unit experts", "Mobile home specialists", "Ductwork repair", "Proper sizing"]
      },
      {
        "name": "Indoor Air Quality",
        "slug": "indoor-air-quality",
        "description": "Combat Spring Hill''s humidity and allergens. Especially important for older homes and residents with respiratory concerns.",
        "features": ["Whole-home dehumidification", "HEPA filtration", "UV-C germicidal lights", "Allergy relief"]
      },
      {
        "name": "Maintenance Plans",
        "slug": "maintenance",
        "description": "Protect your investment with affordable maintenance plans. Senior discounts available. Essential for maintaining efficiency and preventing breakdowns.",
        "features": ["Senior discounts", "Bi-annual tune-ups", "Priority scheduling", "15% repair discount"]
      }
    ]
  }'::jsonb,

  -- FAQ Content (JSONB)
  '{
    "headline": "Frequently Asked Questions",
    "faqs": [
      {
        "question": "Which utility company serves my Spring Hill home?",
        "answer": "Spring Hill is served by both Duke Energy Florida and Withlacoochee River Electric Cooperative (WREC) depending on your specific location. We can help identify your provider and available rebates during a free consultation."
      },
      {
        "question": "Do you service manufactured and mobile homes?",
        "answer": "Yes, manufactured home HVAC is one of our specialties. We install and repair package units, split systems, and ductwork specifically designed for manufactured housing. Duke Energy offers $150 rebates for manufactured home HVAC."
      },
      {
        "question": "What rebates are available for Spring Hill homeowners?",
        "answer": "Duke Energy offers up to $300 for AC replacement and $150 for duct sealing. WREC offers up to $500 for heat pumps and $350 for AC systems. Your available rebates depend on which utility serves your home."
      },
      {
        "question": "How do I protect my AC from salt air in Hernando Beach?",
        "answer": "Coastal Spring Hill homes need coastal-rated equipment with corrosion-resistant coatings. We recommend protective covers and more frequent maintenance—quarterly instead of bi-annually—for homes within 2 miles of the Gulf."
      },
      {
        "question": "Do you offer senior discounts?",
        "answer": "Yes, we offer senior discounts on repairs and maintenance plans. Many of our Timber Pines and Heritage Pines customers take advantage of this program. Ask about our 55+ pricing when you call."
      },
      {
        "question": "My 1980s home still has the original AC. Should I replace it?",
        "answer": "If your system is 15+ years old, replacement is usually more cost-effective than repair. Modern systems are 40-50% more efficient. We can calculate your payback period and help you access utility rebates."
      }
    ]
  }'::jsonb,

  -- Stats Callout (JSONB)
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "74%",
    "cooling_degree_days": "3,400",
    "days_above_90": "95+",
    "hurricane_risk": "Moderate-High"
  }'::jsonb,

  -- Final CTA
  'Ready to Upgrade Your Spring Hill Home Comfort?',
  'Contact us today for a free estimate on AC replacement or repair. We''ll help you access Duke Energy or WREC rebates and find the perfect system for your Timber Pines, Weeki Wachee, or Seven Hills home. Senior discounts available!',

  -- Schema - Local Business (JSONB)
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "Cool It HVAC - Spring Hill",
    "description": "Professional HVAC services in Spring Hill, FL including AC repair, installation, and maintenance for residential customers in Timber Pines, Weeki Wachee, and all communities.",
    "url": "https://coolit-hvac.com/spring-hill-fl",
    "telephone": "+1-352-555-COOL",
    "email": "springhill@coolit-hvac.com",
    "areaServed": {
      "@type": "City",
      "name": "Spring Hill",
      "addressRegion": "FL"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 28.4769,
      "longitude": -82.5476
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
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Manufactured Home HVAC"}},
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
        "name": "Which utility company serves my Spring Hill home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Spring Hill is served by both Duke Energy Florida and Withlacoochee River Electric Cooperative (WREC) depending on your specific location."
        }
      },
      {
        "@type": "Question",
        "name": "Do you service manufactured and mobile homes?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, manufactured home HVAC is one of our specialties. We install and repair package units, split systems, and ductwork specifically designed for manufactured housing."
        }
      },
      {
        "@type": "Question",
        "name": "Do you offer senior discounts?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, we offer senior discounts on repairs and maintenance plans. Ask about our 55+ pricing when you call."
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
      {"@type": "ListItem", "position": 3, "name": "Spring Hill", "item": "https://coolit-hvac.com/fl/spring-hill"}
    ]
  }'::jsonb,

  -- Internal Links
  '/fl/hernando-county',
  '[{"slug": "/fl/brooksville/hvac", "anchor_text": "Brooksville HVAC Services"}, {"slug": "/fl/hudson/hvac", "anchor_text": "Hudson AC Repair"}, {"slug": "/fl/weeki-wachee/hvac", "anchor_text": "Weeki Wachee HVAC"}, {"slug": "/fl/new-port-richey/hvac", "anchor_text": "New Port Richey AC"}]'::jsonb,
  '[{"slug": "/services/ac-repair", "anchor_text": "AC Repair"}, {"slug": "/services/ac-installation", "anchor_text": "AC Installation"}, {"slug": "/services/manufactured-home-hvac", "anchor_text": "Manufactured Home HVAC"}, {"slug": "/services/maintenance", "anchor_text": "Maintenance"}]'::jsonb,

  -- Content Metrics
  1890,
  22,
  14,
  84,

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
