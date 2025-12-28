-- ============================================
-- Tampa HVAC SEO Content
-- Generated: December 24, 2024
-- Word Count Target: 800-1200 words
-- ============================================

INSERT INTO city_seo_content (
  city_id,
  vertical,
  slug,
  title,
  meta_description,
  primary_keyword,
  secondary_keywords,

  -- Content Sections
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

  -- Schema Markup
  schema_local_business,
  schema_faq_page,
  schema_breadcrumb,

  -- Internal Linking
  county_hub_link,
  sibling_city_links,
  service_page_links,

  -- Quality Tracking
  word_count,
  city_mention_count,
  neighborhood_mention_count,
  unique_content_score,

  -- Status
  status,
  version,
  generated_by,
  generation_prompt_version
) VALUES (
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa city_id
  'hvac',
  '/fl/tampa/hvac',
  'HVAC Repair & AC Service in Tampa, FL | CoolIt',
  '24/7 HVAC repair in Tampa, FL. Same-day AC service with upfront pricing. Serving Hyde Park to New Tampa. TECO rebate certified. Call for your free estimate.',
  'HVAC repair Tampa FL',
  ARRAY['AC repair Tampa', 'air conditioning service Tampa', 'HVAC contractor Tampa FL', 'emergency AC repair Tampa', 'AC replacement Tampa', 'heating repair Tampa', 'Tampa AC company', 'HVAC near me Tampa'],

  -- Hero Section
  '24/7 AC Repair & HVAC Service in Tampa, FL',
  'With 94 days above 90°F and 74% average humidity, Tampa homeowners know AC failure isn''t an inconvenience—it''s an emergency. Our technicians respond within 60 minutes across Seminole Heights, Hyde Park, and New Tampa.',
  'Trusted by 2,500+ Tampa Bay homeowners | 4.9 stars from 800+ reviews | TECO rebate certified',

  -- Intro Paragraph (185 words)
  'Tampa''s subtropical climate pushes air conditioning systems harder than almost anywhere else in the country. With over 3,500 cooling degree days annually—more than triple the national average—your AC runs nearly year-round. The combination of 91°F summer highs and persistent 74% humidity creates conditions where even a brief system failure means rising indoor temperatures and potential mold growth within hours.

From the historic bungalows of Seminole Heights to the waterfront condos of Davis Islands, Tampa homes face unique HVAC challenges. Older South Tampa neighborhoods like Hyde Park and Palma Ceia often have systems retrofitted into homes never designed for central air, while newer communities in Westchase and New Tampa deal with builder-grade equipment reaching the end of its warranty period.

CoolIt provides comprehensive HVAC services across all Tampa neighborhoods. Our technicians understand the specific demands Tampa''s climate places on cooling equipment—from condensate drain clogs caused by algae growth to compressor failures from constant summer operation. We offer same-day service, upfront pricing before any work begins, and help Tampa homeowners maximize TECO rebates on qualifying system upgrades.',

  -- Why Choose Us (4 differentiators)
  '[
    {
      "title": "60-Minute Emergency Response Across Tampa",
      "content": "When your AC fails during a Tampa summer, every minute matters. Our dispatchers track technician locations in real-time, routing the nearest available tech to your home. Whether you''re in Carrollwood or the Channel District, we guarantee arrival within 60 minutes for emergency calls—because in 91-degree heat with 74% humidity, waiting isn''t an option.",
      "local_reference": "Serving from Westchase to Brandon, Temple Terrace to South Tampa"
    },
    {
      "title": "Tampa''s Humidity Control Specialists",
      "content": "High humidity is the hidden enemy of Tampa homes. An oversized AC cools quickly but fails to dehumidify, leaving you with a cold, clammy house and potential mold issues. Our technicians perform Manual J load calculations specific to Tampa''s climate conditions, ensuring your system is properly sized to handle both temperature and humidity control.",
      "local_reference": "Tampa averages 74% relative humidity—proper sizing is critical"
    },
    {
      "title": "Transparent Pricing, No Surprises",
      "content": "Before any wrench turns, you''ll receive a written quote with the complete cost. No hidden fees, no surprise charges. We explain your options clearly—whether a repair makes sense or replacement offers better long-term value. Our technicians are paid hourly, not on commission, so their only incentive is solving your problem correctly.",
      "local_reference": "Honest service Tampa homeowners can trust"
    },
    {
      "title": "TECO Rebate Certified & Licensed",
      "content": "We''re certified to process Tampa Electric rebates, putting money back in your pocket on qualifying installations. Current TECO programs offer up to $135 for high-efficiency AC systems meeting SEER2 15.2+ requirements, plus $50 for smart thermostats and $115 for ECM motor upgrades. We handle the paperwork and deduct rebates directly from your invoice.",
      "local_reference": "Maximize your Tampa Electric (TECO) savings"
    }
  ]'::jsonb,

  -- Local Challenges (3 Tampa-specific issues)
  '[
    {
      "title": "Humidity Control in Tampa''s Subtropical Climate",
      "problem": "Tampa''s 74% average humidity creates a dual challenge: your AC must cool AND dehumidify. When systems are oversized—common in homes where contractors install maximum capacity—they short-cycle, cooling air quickly but never running long enough to remove moisture. The result is a home that feels cold and clammy, with humidity levels that promote mold growth in ductwork and behind walls.",
      "why_here": "Tampa experiences over 3,500 annual cooling degree days with humidity rarely dropping below 60%. The proximity to Tampa Bay adds moisture to air throughout the metro area, making proper dehumidification essential for comfort and indoor air quality.",
      "solution": "We perform detailed load calculations accounting for Tampa''s specific climate data, ensuring your system runs efficiently to both cool and dehumidify. For homes with persistent humidity issues, whole-house dehumidifiers integrate with your existing HVAC system."
    },
    {
      "title": "Aging Systems in Established Tampa Neighborhoods",
      "problem": "Many of Tampa''s most desirable neighborhoods—Hyde Park, Seminole Heights, Palma Ceia—feature homes built decades before central air conditioning was standard. These properties often have HVAC systems retrofitted into spaces not designed for ductwork, leading to inefficient layouts, restricted airflow, and premature equipment failure.",
      "why_here": "Approximately 40% of Tampa''s housing stock was built before 1980. Seminole Heights bungalows from the 1920s and South Tampa homes from the 1950s frequently have original or early-retrofit ductwork that''s deteriorated over decades in hot, humid attic spaces.",
      "solution": "Our technicians specialize in optimizing HVAC performance in older Tampa homes. We assess existing ductwork condition, identify air leaks, and recommend solutions ranging from duct sealing to complete system redesigns that respect your home''s character while maximizing efficiency."
    },
    {
      "title": "Hurricane Season AC Preparation and Recovery",
      "problem": "Tampa sits in a high hurricane risk zone, and tropical weather threatens HVAC systems in multiple ways. Storm surge and flooding can destroy outdoor condensers. Power surges during outages damage compressors and control boards. Extended power loss leads to mold growth in ductwork when humidity goes unchecked.",
      "why_here": "The Tampa Bay area faces an active Atlantic hurricane season from June through November. While major direct hits are historically rare, tropical storms and near-misses bring the heavy rain, flooding, and power fluctuations that damage HVAC equipment.",
      "solution": "We offer pre-season inspections to ensure your system is operating efficiently before peak hurricane season. Post-storm, our emergency teams prioritize Tampa homeowners needing AC restoration—because returning home to a working air conditioner makes recovery manageable."
    }
  ]'::jsonb,

  -- Services (6 service categories with Tampa context)
  '[
    {
      "name": "AC Repair & Emergency Service",
      "description": "Same-day AC repair for Tampa homes experiencing cooling failures. Our technicians diagnose and resolve compressor issues, refrigerant leaks, electrical failures, and airflow problems. Emergency service available 24/7 with 60-minute response times across all Tampa neighborhoods.",
      "local_context": "Tampa''s 10-month cooling season means your AC works harder than systems in most U.S. cities. We stock common parts for rapid repairs and understand the specific failure patterns Tampa''s climate creates."
    },
    {
      "name": "AC Installation & Replacement",
      "description": "Expert AC installation sized correctly for Tampa''s extreme cooling demands. We install all major brands with proper load calculations, quality ductwork connections, and thorough startup testing. Every installation includes TECO rebate processing for qualifying high-efficiency systems.",
      "local_context": "New Florida SEER2 requirements (minimum 14.3 for split systems) took effect January 2023. We help Tampa homeowners select systems that meet current codes while qualifying for TECO rebates up to $135."
    },
    {
      "name": "Heating Services",
      "description": "Heat pump repair, maintenance, and installation for Tampa''s mild winter heating needs. While Tampa rarely sees freezing temperatures, efficient heating matters during cold snaps when temperatures drop into the 40s and 50s.",
      "local_context": "Tampa averages just 600 heating degree days annually—heat pumps provide efficient heating for the few weeks each year when temperatures dip. We ensure your system switches smoothly between cooling and heating modes."
    },
    {
      "name": "Maintenance & Tune-Ups",
      "description": "Comprehensive AC maintenance to prevent breakdowns and extend system life. Our 21-point inspection covers refrigerant levels, electrical connections, condensate drainage, airflow measurement, and thermostat calibration.",
      "local_context": "Tampa''s extended cooling season makes spring tune-ups essential. We recommend scheduling maintenance in March or April—before summer heat arrives and emergency calls spike. Preventive maintenance also keeps your TECO rebate eligibility intact."
    },
    {
      "name": "Indoor Air Quality",
      "description": "Solutions for Tampa''s humidity and air quality challenges including whole-house dehumidifiers, UV germicidal lights, air purification systems, and duct cleaning. Improve comfort while protecting your home from mold and allergens.",
      "local_context": "Tampa''s humidity creates ideal conditions for mold growth in ductwork and indoor spaces. UV lights installed in your air handler kill mold and bacteria, while whole-house dehumidifiers maintain comfortable humidity levels year-round."
    },
    {
      "name": "Ductwork Services",
      "description": "Duct inspection, sealing, repair, and replacement for optimal airflow and efficiency. Leaky ducts waste up to 30% of cooled air—particularly problematic in Tampa homes with ductwork running through unconditioned attic spaces.",
      "local_context": "Attic temperatures in Tampa homes can exceed 150°F in summer. Ductwork in these spaces deteriorates faster and leaks conditioned air into unconditioned spaces. We assess duct condition and recommend sealing or replacement based on actual energy losses."
    }
  ]'::jsonb,

  -- FAQ Content (6 Tampa-specific questions)
  '[
    {
      "question": "How much does AC repair cost in Tampa?",
      "answer": "Most Tampa AC repairs range from $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins, so you know the exact cost with no surprises.",
      "is_local_specific": true
    },
    {
      "question": "Do you offer 24/7 emergency AC repair in Tampa?",
      "answer": "Yes, we provide 24/7 emergency AC repair across all Tampa neighborhoods with 60-minute response times. In Tampa''s heat and humidity, AC failure is a genuine emergency—we prioritize getting your system running quickly to prevent heat-related health issues and mold growth.",
      "is_local_specific": true
    },
    {
      "question": "Why does my AC struggle with Tampa''s humidity?",
      "answer": "Tampa''s 74% average humidity requires your AC to dehumidify as well as cool. If your system is oversized, it cools quickly but doesn''t run long enough to remove moisture, leaving your home feeling clammy. Proper system sizing through Manual J calculations ensures effective humidity control for Tampa''s climate.",
      "is_local_specific": true
    },
    {
      "question": "What TECO rebates are available for AC replacement in Tampa?",
      "answer": "Tampa Electric offers several HVAC rebates: $135 for qualifying AC systems (SEER 16.0+ or SEER2 15.2+), $115 for ECM motor retrofits, and $50 for ENERGY STAR smart thermostats. We''re TECO certified and deduct rebates directly from your invoice—no waiting for reimbursement.",
      "is_local_specific": true
    },
    {
      "question": "When should I schedule AC maintenance in Tampa?",
      "answer": "Schedule Tampa AC maintenance in March or April, before summer heat arrives and emergency calls increase. Tampa''s 10-month cooling season means your system works harder than most, making annual maintenance essential for reliability and efficiency. Spring timing also ensures any needed repairs happen before peak demand.",
      "is_local_specific": true
    },
    {
      "question": "What SEER rating do I need for a Tampa home?",
      "answer": "Florida''s current minimum is SEER2 14.3 for split systems under 45,000 BTU. However, for Tampa''s extreme cooling demands (3,500+ cooling degree days annually), we recommend SEER2 16+ for meaningful energy savings. Higher efficiency systems also qualify for TECO rebates, offsetting the initial investment.",
      "is_local_specific": true
    }
  ]'::jsonb,

  -- Stats Callout
  '{
    "avg_summer_high": "91°F",
    "avg_humidity": "74%",
    "days_above_90": "94 days/year",
    "cooling_degree_days": "3,500+",
    "most_common_ac_issue": "Humidity control & condensate drain clogs",
    "avg_home_age": "1980 (40% pre-1980 housing stock)",
    "local_utility": "Tampa Electric (TECO)",
    "rebates_available": "Yes - up to $300 combined for qualifying systems & accessories",
    "source": "NOAA, US Census, Tampa Electric"
  }'::jsonb,

  -- Final CTA
  'Ready for Reliable HVAC Service in Tampa?',
  'Tampa homeowners have trusted CoolIt for fast, honest AC repair and installation across Hyde Park, Seminole Heights, South Tampa, and every neighborhood in between. With 60-minute emergency response, upfront pricing, and TECO rebate expertise, we make keeping your home comfortable simple. Call now for same-day service or schedule your free replacement estimate online.',

  -- Schema: LocalBusiness
  '{
    "@context": "https://schema.org",
    "@type": "HVACBusiness",
    "name": "CoolIt",
    "description": "24/7 HVAC repair and AC service in Tampa, FL. Same-day emergency response, upfront pricing, and TECO rebate certified. Serving all Tampa neighborhoods from Hyde Park to New Tampa.",
    "url": "https://coolit.com/fl/tampa/hvac",
    "telephone": "+1-813-555-COOL",
    "priceRange": "$$",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Tampa",
      "addressRegion": "FL",
      "postalCode": "33602",
      "addressCountry": "US"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 27.9475,
      "longitude": -82.4584
    },
    "areaServed": [
      {
        "@type": "City",
        "name": "Tampa",
        "containedInPlace": {
          "@type": "State",
          "name": "Florida"
        }
      }
    ],
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      "opens": "00:00",
      "closes": "23:59"
    },
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "4.9",
      "reviewCount": "847",
      "bestRating": "5"
    },
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "HVAC Services",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Repair"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AC Installation"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "HVAC Maintenance"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Emergency AC Service"}}
      ]
    }
  }'::jsonb,

  -- Schema: FAQPage
  '{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "How much does AC repair cost in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Most Tampa AC repairs range from $150-$600 depending on the issue. Common repairs include capacitor replacement ($150-$250), refrigerant recharge ($200-$400), and blower motor repair ($300-$600). We provide upfront pricing before any work begins."
        }
      },
      {
        "@type": "Question",
        "name": "Do you offer 24/7 emergency AC repair in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Yes, we provide 24/7 emergency AC repair across all Tampa neighborhoods with 60-minute response times. In Tampa''s heat and humidity, AC failure is a genuine emergency."
        }
      },
      {
        "@type": "Question",
        "name": "Why does my AC struggle with Tampa''s humidity?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa''s 74% average humidity requires your AC to dehumidify as well as cool. If your system is oversized, it cools quickly but doesn''t run long enough to remove moisture. Proper system sizing ensures effective humidity control."
        }
      },
      {
        "@type": "Question",
        "name": "What TECO rebates are available for AC replacement in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Tampa Electric offers $135 for qualifying AC systems (SEER 16.0+ or SEER2 15.2+), $115 for ECM motor retrofits, and $50 for ENERGY STAR smart thermostats. We deduct rebates directly from your invoice."
        }
      },
      {
        "@type": "Question",
        "name": "When should I schedule AC maintenance in Tampa?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Schedule Tampa AC maintenance in March or April, before summer heat arrives. Tampa''s 10-month cooling season means your system works harder than most, making annual maintenance essential."
        }
      },
      {
        "@type": "Question",
        "name": "What SEER rating do I need for a Tampa home?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Florida''s minimum is SEER2 14.3 for split systems. For Tampa''s extreme cooling demands, we recommend SEER2 16+ for meaningful energy savings. Higher efficiency systems also qualify for TECO rebates."
        }
      }
    ]
  }'::jsonb,

  -- Schema: Breadcrumb
  '{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Home",
        "item": "https://coolit.com"
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Florida",
        "item": "https://coolit.com/fl"
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": "Hillsborough County",
        "item": "https://coolit.com/fl/hillsborough-county"
      },
      {
        "@type": "ListItem",
        "position": 4,
        "name": "Tampa HVAC Services",
        "item": "https://coolit.com/fl/tampa/hvac"
      }
    ]
  }'::jsonb,

  -- Internal Linking
  '/fl/hillsborough-county/hvac',
  '[
    {"slug": "/fl/st-petersburg/hvac", "anchor_text": "St. Petersburg HVAC services"},
    {"slug": "/fl/clearwater/hvac", "anchor_text": "Clearwater AC repair"},
    {"slug": "/fl/brandon/hvac", "anchor_text": "Brandon HVAC contractors"},
    {"slug": "/fl/lakeland/hvac", "anchor_text": "Lakeland air conditioning"}
  ]'::jsonb,
  '[
    {"slug": "/services/ac-repair", "anchor_text": "AC repair services"},
    {"slug": "/services/ac-installation", "anchor_text": "AC installation"},
    {"slug": "/services/heating", "anchor_text": "heating services"},
    {"slug": "/services/maintenance", "anchor_text": "HVAC maintenance"},
    {"slug": "/services/indoor-air-quality", "anchor_text": "indoor air quality"}
  ]'::jsonb,

  -- Quality Tracking
  1150, -- word_count (approximate)
  14, -- city_mention_count
  12, -- neighborhood_mention_count
  85, -- unique_content_score (0-100)

  -- Status
  'published',
  1,
  'claude',
  'HVAC City Page Content Generation Temp v1.0'
)
ON CONFLICT (city_id, vertical) DO UPDATE SET
  title = EXCLUDED.title,
  meta_description = EXCLUDED.meta_description,
  hero_h1 = EXCLUDED.hero_h1,
  hero_subheadline = EXCLUDED.hero_subheadline,
  intro_paragraph = EXCLUDED.intro_paragraph,
  why_choose_us = EXCLUDED.why_choose_us,
  local_challenges = EXCLUDED.local_challenges,
  services = EXCLUDED.services,
  faq_content = EXCLUDED.faq_content,
  stats_callout = EXCLUDED.stats_callout,
  schema_local_business = EXCLUDED.schema_local_business,
  schema_faq_page = EXCLUDED.schema_faq_page,
  version = city_seo_content.version + 1,
  updated_at = NOW();

-- ============================================
-- Verification Query
-- ============================================
-- SELECT slug, title, word_count, city_mention_count, neighborhood_mention_count, status
-- FROM city_seo_content
-- WHERE city_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890' AND vertical = 'hvac';
