-- ============================================
-- 005_city_seo_tables.sql - City SEO/GEO Data Model
-- Normalized structure for scalable city content
-- ============================================

-- ============================================
-- CITIES: Master reference table
-- Single source of truth for city identifiers
-- ============================================
CREATE TABLE IF NOT EXISTS cities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),

  -- Identifiers
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  state TEXT NOT NULL,
  state_abbrev TEXT NOT NULL,
  county TEXT,
  county_slug TEXT,

  -- Geography
  latitude DECIMAL(10, 7),
  longitude DECIMAL(10, 7),
  zip_codes TEXT[], -- Array of relevant zip codes

  -- Relationships
  metro_area TEXT,
  nearby_city_ids UUID[], -- References to other cities for internal linking

  -- Status
  is_active BOOLEAN DEFAULT TRUE,
  priority INTEGER DEFAULT 0, -- Higher = more important for rollout

  UNIQUE(slug, state_abbrev)
);

CREATE INDEX IF NOT EXISTS idx_cities_slug ON cities(slug);
CREATE INDEX IF NOT EXISTS idx_cities_state ON cities(state_abbrev);
CREATE INDEX IF NOT EXISTS idx_cities_active ON cities(is_active);
CREATE INDEX IF NOT EXISTS idx_cities_priority ON cities(priority DESC);

-- ============================================
-- CITY_RESEARCH: Factual data from research
-- Updated infrequently, shared across verticals
-- ============================================
CREATE TABLE IF NOT EXISTS city_research (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  researched_at TIMESTAMPTZ DEFAULT NOW(),

  -- Demographics
  population INTEGER,
  population_source TEXT,
  median_household_income INTEGER,
  median_home_value INTEGER,
  homeownership_rate DECIMAL(5, 2), -- Percentage
  primary_housing_types TEXT[], -- ['single-family', 'condo', 'townhome']
  housing_construction_eras JSONB, -- {"1960s-1970s": 35, "1980s-1990s": 45, "2000s+": 20}

  -- Climate
  avg_summer_high_f INTEGER,
  avg_winter_low_f INTEGER,
  avg_humidity_percent INTEGER,
  annual_cooling_degree_days INTEGER,
  days_above_90f INTEGER,
  annual_rainfall_inches DECIMAL(5, 2),
  hurricane_risk_level TEXT, -- 'high', 'moderate', 'low'
  climate_notes TEXT,

  -- Local Context
  major_employers TEXT[],
  notable_landmarks TEXT[],
  local_events TEXT[],
  school_districts TEXT[],
  recent_developments TEXT,

  -- Utilities & Rebates
  electric_utility TEXT,
  electric_utility_rebates JSONB, -- {"ac_replacement": 400, "smart_thermostat": 75}
  gas_utility TEXT,
  water_utility TEXT,
  water_hardness_ppm INTEGER, -- For plumbing vertical

  -- Building/Codes
  local_building_codes TEXT,
  permit_requirements TEXT,
  hoa_prevalence TEXT, -- 'high', 'moderate', 'low'

  -- Competitive Landscape
  top_hvac_competitors TEXT[],
  top_plumbing_competitors TEXT[],
  top_roofing_competitors TEXT[],

  -- Source Tracking (for GEO citations)
  research_sources JSONB, -- {"population": "US Census 2023", "climate": "NOAA"}

  UNIQUE(city_id)
);

CREATE INDEX IF NOT EXISTS idx_city_research_city ON city_research(city_id);

-- ============================================
-- NEIGHBORHOODS: Granular area data
-- Used for "Areas We Serve" and local specificity
-- ============================================
CREATE TABLE IF NOT EXISTS neighborhoods (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),

  name TEXT NOT NULL,
  slug TEXT,
  region TEXT, -- Grouping: 'North Tampa', 'South Tampa', 'Downtown'

  -- Characteristics
  housing_type TEXT, -- 'single-family', 'mixed', 'condo'
  avg_home_age TEXT, -- '1960s ranch homes', 'new construction'
  income_level TEXT, -- 'upper', 'middle', 'mixed'
  notable_features TEXT, -- 'Historic district', 'Waterfront', 'Golf community'

  -- HVAC-specific
  common_hvac_issues TEXT[],
  typical_system_age TEXT,

  display_order INTEGER DEFAULT 0,
  is_featured BOOLEAN DEFAULT FALSE, -- Show in hero/intro

  UNIQUE(city_id, slug)
);

CREATE INDEX IF NOT EXISTS idx_neighborhoods_city ON neighborhoods(city_id);

-- ============================================
-- CITY_SEO_CONTENT: Generated content per vertical
-- This is what gets regenerated when SEO strategy changes
-- ============================================
CREATE TABLE IF NOT EXISTS city_seo_content (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),

  -- Vertical targeting
  vertical TEXT NOT NULL, -- 'hvac', 'plumbing', 'roofing'

  -- Page Metadata
  slug TEXT NOT NULL, -- Full path: '/fl/tampa/hvac'
  title TEXT NOT NULL, -- <title> tag
  meta_description TEXT, -- 150-160 chars
  primary_keyword TEXT,
  secondary_keywords TEXT[],

  -- Content Sections (generated)
  hero_h1 TEXT,
  hero_subheadline TEXT,
  hero_trust_bar TEXT,
  intro_paragraph TEXT, -- 150-200 words

  why_choose_us JSONB, -- [{title, content, local_reference}]
  local_challenges JSONB, -- [{title, problem, why_here, solution}]
  services JSONB, -- [{name, description, local_context}]

  faq_content JSONB, -- [{question, answer, is_local_specific}]

  stats_callout JSONB, -- {avg_summer_high, humidity, etc.}

  final_cta_headline TEXT,
  final_cta_body TEXT,

  -- Schema Markup (pre-generated JSON-LD)
  schema_local_business JSONB,
  schema_faq_page JSONB,
  schema_breadcrumb JSONB,

  -- Internal Linking
  county_hub_link TEXT,
  sibling_city_links JSONB, -- [{slug, anchor_text}]
  service_page_links JSONB,

  -- Quality Tracking
  word_count INTEGER,
  city_mention_count INTEGER,
  neighborhood_mention_count INTEGER,
  unique_content_score INTEGER, -- 0-100

  -- Status & Versioning
  status TEXT DEFAULT 'draft', -- 'draft', 'review', 'published', 'needs_update'
  version INTEGER DEFAULT 1,
  published_at TIMESTAMPTZ,
  last_reviewed_at TIMESTAMPTZ,
  review_notes TEXT,

  -- Generation Metadata
  generated_by TEXT, -- 'claude', 'manual'
  generation_prompt_version TEXT, -- Track which template version was used

  UNIQUE(city_id, vertical)
);

CREATE INDEX IF NOT EXISTS idx_city_seo_content_city ON city_seo_content(city_id);
CREATE INDEX IF NOT EXISTS idx_city_seo_content_vertical ON city_seo_content(vertical);
CREATE INDEX IF NOT EXISTS idx_city_seo_content_slug ON city_seo_content(slug);
CREATE INDEX IF NOT EXISTS idx_city_seo_content_status ON city_seo_content(status);

-- ============================================
-- CONTENT_REVISIONS: Audit trail for content changes
-- Track what changed and when for compliance/optimization
-- ============================================
CREATE TABLE IF NOT EXISTS content_revisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  content_id UUID NOT NULL REFERENCES city_seo_content(id) ON DELETE CASCADE,
  version INTEGER NOT NULL,

  -- Snapshot of content at this version
  content_snapshot JSONB NOT NULL,

  -- Change tracking
  changed_by TEXT, -- 'system', 'manual', 'claude'
  change_reason TEXT, -- 'initial', 'seo_refresh', 'data_update', 'manual_edit'
  change_summary TEXT
);

CREATE INDEX IF NOT EXISTS idx_content_revisions_content ON content_revisions(content_id);

-- ============================================
-- Helper function: Update timestamps
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cities_updated_at
  BEFORE UPDATE ON cities
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER city_research_updated_at
  BEFORE UPDATE ON city_research
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER city_seo_content_updated_at
  BEFORE UPDATE ON city_seo_content
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- Row Level Security
-- ============================================
ALTER TABLE cities ENABLE ROW LEVEL SECURITY;
ALTER TABLE city_research ENABLE ROW LEVEL SECURITY;
ALTER TABLE neighborhoods ENABLE ROW LEVEL SECURITY;
ALTER TABLE city_seo_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE content_revisions ENABLE ROW LEVEL SECURITY;

-- Public read access for active content
CREATE POLICY "Allow public read on cities" ON cities
  FOR SELECT TO anon
  USING (is_active = true);

CREATE POLICY "Allow public read on city_research" ON city_research
  FOR SELECT TO anon
  USING (true);

CREATE POLICY "Allow public read on neighborhoods" ON neighborhoods
  FOR SELECT TO anon
  USING (true);

CREATE POLICY "Allow public read on published content" ON city_seo_content
  FOR SELECT TO anon
  USING (status = 'published');

-- Service role full access
CREATE POLICY "Service role full access on cities" ON cities
  FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "Service role full access on city_research" ON city_research
  FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "Service role full access on neighborhoods" ON neighborhoods
  FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "Service role full access on city_seo_content" ON city_seo_content
  FOR ALL TO service_role USING (true) WITH CHECK (true);

CREATE POLICY "Service role full access on content_revisions" ON content_revisions
  FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================
-- View: Full city page data (denormalized for queries)
-- ============================================
CREATE OR REPLACE VIEW city_page_full AS
SELECT
  c.id as city_id,
  c.name as city_name,
  c.slug as city_slug,
  c.state,
  c.state_abbrev,
  c.county,
  c.latitude,
  c.longitude,
  c.metro_area,

  cr.population,
  cr.median_household_income,
  cr.median_home_value,
  cr.avg_summer_high_f,
  cr.avg_humidity_percent,
  cr.days_above_90f,
  cr.electric_utility,
  cr.electric_utility_rebates,
  cr.research_sources,
  cr.researched_at,

  csc.id as content_id,
  csc.vertical,
  csc.slug as page_slug,
  csc.title,
  csc.meta_description,
  csc.hero_h1,
  csc.hero_subheadline,
  csc.intro_paragraph,
  csc.why_choose_us,
  csc.local_challenges,
  csc.services,
  csc.faq_content,
  csc.stats_callout,
  csc.schema_local_business,
  csc.schema_faq_page,
  csc.status,
  csc.version,
  csc.published_at

FROM cities c
LEFT JOIN city_research cr ON c.id = cr.city_id
LEFT JOIN city_seo_content csc ON c.id = csc.city_id
WHERE c.is_active = true;

-- ============================================
-- Done! City SEO tables created successfully.
-- ============================================
