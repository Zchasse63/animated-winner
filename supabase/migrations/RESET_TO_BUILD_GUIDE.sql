-- ============================================
-- RESET DATABASE TO BUILD GUIDE SCHEMA
-- WARNING: This will DROP all existing tables!
-- ============================================

-- Drop existing tables (order matters due to foreign keys)
DROP TABLE IF EXISTS enrichment_logs CASCADE;
DROP TABLE IF EXISTS property_cache CASCADE;
DROP TABLE IF EXISTS buyers CASCADE;
DROP TABLE IF EXISTS daily_stats CASCADE;
DROP TABLE IF EXISTS calls CASCADE;
DROP TABLE IF EXISTS leads CASCADE;
DROP TABLE IF EXISTS cities CASCADE;
DROP TABLE IF EXISTS pages CASCADE;

-- Drop existing functions
DROP FUNCTION IF EXISTS update_daily_stats CASCADE;

-- ============================================
-- LEADS TABLE - Web form submissions
-- ============================================

CREATE TABLE leads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- Contact info
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,

  -- Location
  address TEXT,
  address_standardized TEXT,
  city TEXT NOT NULL,
  state TEXT NOT NULL,  -- 2 char: FL, GA, etc.
  zip TEXT NOT NULL,

  -- Service details
  vertical TEXT NOT NULL,  -- hvac, plumbing, roofing
  service_type TEXT NOT NULL,  -- ac-repair, drain-cleaning, etc.
  urgency TEXT NOT NULL,  -- emergency, urgent, planned
  property_type TEXT,  -- single-family, multi-family, commercial
  issue_description TEXT,

  -- Attribution
  source_page TEXT,
  utm_source TEXT,
  utm_medium TEXT,
  utm_campaign TEXT,
  utm_content TEXT,
  referrer TEXT,

  -- Compliance
  trustedform_cert_url TEXT,
  tcpa_consent_timestamp TIMESTAMPTZ,
  ip_address TEXT,

  -- Ping/Post tracking
  ping_status TEXT DEFAULT 'pending',  -- pending, sent, bid_received, no_bid
  ping_request_id TEXT,
  ping_bid_amount DECIMAL(10,2),
  ping_buyer_id TEXT,
  ping_timestamp TIMESTAMPTZ,

  post_status TEXT,  -- pending, accepted, rejected
  post_phone_number TEXT,  -- forwarding number from buyer
  post_timestamp TIMESTAMPTZ,

  -- Enrichment (light - before ping)
  address_valid BOOLEAN,
  phone_valid BOOLEAN,
  phone_type TEXT,  -- mobile, landline

  -- Enrichment (full - after sale)
  enrichment_data JSONB,
  property_year_built INTEGER,
  property_sqft INTEGER,
  property_value INTEGER,
  last_hvac_permit_date DATE,
  years_since_hvac_permit INTEGER,

  -- Scoring
  raw_score INTEGER,  -- 0-100
  score_tier TEXT,  -- premium, good, standard, nurture
  score_factors JSONB,

  -- Sale tracking
  status TEXT DEFAULT 'new',  -- new, processing, sold, rejected, nurture
  sold_to TEXT,
  sold_price DECIMAL(10,2),
  sold_at TIMESTAMPTZ
);

CREATE INDEX idx_leads_created_at ON leads(created_at DESC);
CREATE INDEX idx_leads_state ON leads(state);
CREATE INDEX idx_leads_vertical ON leads(vertical);
CREATE INDEX idx_leads_status ON leads(status);
CREATE INDEX idx_leads_zip ON leads(zip);
CREATE INDEX idx_leads_ping_status ON leads(ping_status);

ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "leads_anon_insert" ON leads
  FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "leads_service_role" ON leads
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- CALLS TABLE - Ringba call tracking
-- ============================================

CREATE TABLE calls (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- Ringba identifiers
  ringba_call_id TEXT UNIQUE NOT NULL,
  call_uuid TEXT,

  -- Caller information
  caller_phone TEXT,
  caller_city TEXT,
  caller_state TEXT,
  caller_zip TEXT,

  -- Call metrics
  duration_seconds INTEGER,
  connection_seconds INTEGER,
  ring_duration_seconds INTEGER,
  status TEXT,  -- completed, missed, voicemail

  -- Conversion/Revenue
  converted BOOLEAN DEFAULT FALSE,
  revenue DECIMAL(10,2) DEFAULT 0,
  payout DECIMAL(10,2) DEFAULT 0,

  -- Routing
  buyer_name TEXT,
  buyer_number TEXT,
  campaign TEXT,

  -- Attribution (from Ringba tags)
  vertical TEXT,
  city TEXT,
  state TEXT,
  source TEXT,
  landing_page TEXT,
  keyword TEXT,

  -- IVR
  ivr_selection TEXT,  -- emergency, repair, estimate

  -- Timestamps
  call_start TIMESTAMPTZ,
  call_end TIMESTAMPTZ,

  -- Raw data
  raw_payload JSONB
);

CREATE INDEX idx_calls_created_at ON calls(created_at DESC);
CREATE INDEX idx_calls_state ON calls(state);
CREATE INDEX idx_calls_vertical ON calls(vertical);
CREATE INDEX idx_calls_converted ON calls(converted);
CREATE INDEX idx_calls_buyer ON calls(buyer_name);
CREATE INDEX idx_calls_ringba_id ON calls(ringba_call_id);

ALTER TABLE calls ENABLE ROW LEVEL SECURITY;

CREATE POLICY "calls_service_role" ON calls
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- DAILY_STATS TABLE - Unified reporting
-- ============================================

CREATE TABLE daily_stats (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date DATE NOT NULL,
  state TEXT NOT NULL,
  vertical TEXT NOT NULL,
  source TEXT NOT NULL,  -- organic, google_ads, facebook, direct

  -- Web lead metrics
  web_leads_total INTEGER DEFAULT 0,
  web_leads_sold INTEGER DEFAULT 0,
  web_leads_revenue DECIMAL(10,2) DEFAULT 0,
  web_avg_score INTEGER DEFAULT 0,

  -- Call metrics
  calls_total INTEGER DEFAULT 0,
  calls_converted INTEGER DEFAULT 0,
  calls_revenue DECIMAL(10,2) DEFAULT 0,
  calls_avg_duration INTEGER DEFAULT 0,

  -- Combined (generated columns)
  total_leads INTEGER GENERATED ALWAYS AS (web_leads_total + calls_total) STORED,
  total_sold INTEGER GENERATED ALWAYS AS (web_leads_sold + calls_converted) STORED,
  total_revenue DECIMAL(10,2) GENERATED ALWAYS AS (web_leads_revenue + calls_revenue) STORED,

  -- Conversion rates (generated columns)
  web_conversion_rate DECIMAL(5,2) GENERATED ALWAYS AS (
    CASE WHEN web_leads_total > 0
    THEN (web_leads_sold::DECIMAL / web_leads_total * 100)
    ELSE 0 END
  ) STORED,
  call_conversion_rate DECIMAL(5,2) GENERATED ALWAYS AS (
    CASE WHEN calls_total > 0
    THEN (calls_converted::DECIMAL / calls_total * 100)
    ELSE 0 END
  ) STORED,

  UNIQUE(date, state, vertical, source)
);

CREATE INDEX idx_daily_stats_date ON daily_stats(date DESC);
CREATE INDEX idx_daily_stats_state ON daily_stats(state);
CREATE INDEX idx_daily_stats_vertical ON daily_stats(vertical);

ALTER TABLE daily_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "daily_stats_service_role" ON daily_stats
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- Function to update daily stats (upsert pattern)
CREATE OR REPLACE FUNCTION update_daily_stats(
  p_date DATE,
  p_state TEXT,
  p_vertical TEXT,
  p_source TEXT,
  p_web_leads INTEGER DEFAULT 0,
  p_web_sold INTEGER DEFAULT 0,
  p_web_revenue DECIMAL DEFAULT 0,
  p_calls INTEGER DEFAULT 0,
  p_calls_converted INTEGER DEFAULT 0,
  p_calls_revenue DECIMAL DEFAULT 0
)
RETURNS VOID AS $$
BEGIN
  INSERT INTO daily_stats (
    date, state, vertical, source,
    web_leads_total, web_leads_sold, web_leads_revenue,
    calls_total, calls_converted, calls_revenue
  )
  VALUES (
    p_date, p_state, p_vertical, p_source,
    p_web_leads, p_web_sold, p_web_revenue,
    p_calls, p_calls_converted, p_calls_revenue
  )
  ON CONFLICT (date, state, vertical, source)
  DO UPDATE SET
    web_leads_total = daily_stats.web_leads_total + p_web_leads,
    web_leads_sold = daily_stats.web_leads_sold + p_web_sold,
    web_leads_revenue = daily_stats.web_leads_revenue + p_web_revenue,
    calls_total = daily_stats.calls_total + p_calls,
    calls_converted = daily_stats.calls_converted + p_calls_converted,
    calls_revenue = daily_stats.calls_revenue + p_calls_revenue;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- PAGES TABLE - CMS-like page generation
-- ============================================

CREATE TABLE pages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- URL structure
  slug TEXT UNIQUE NOT NULL,  -- florida/tampa/hvac/ac-repair
  state TEXT NOT NULL,
  city TEXT NOT NULL,
  vertical TEXT NOT NULL,
  service TEXT,  -- null for city/vertical hub pages

  -- SEO
  title TEXT NOT NULL,
  meta_description TEXT,
  h1 TEXT NOT NULL,
  intro_paragraph TEXT,

  -- Content
  faq_content JSONB,
  service_areas JSONB,

  -- Status
  is_active BOOLEAN DEFAULT TRUE,

  -- Ringba
  ringba_campaign_id TEXT,
  fallback_phone TEXT
);

CREATE INDEX idx_pages_slug ON pages(slug);
CREATE INDEX idx_pages_state ON pages(state);
CREATE INDEX idx_pages_active ON pages(is_active);

ALTER TABLE pages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "pages_public_read" ON pages
  FOR SELECT TO anon
  USING (is_active = true);

CREATE POLICY "pages_service_role" ON pages
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- BUYERS TABLE - Lead buyer configuration
-- ============================================

CREATE TABLE buyers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  name TEXT NOT NULL,
  type TEXT NOT NULL,  -- service_direct, elocal, direct

  -- API config
  api_endpoint TEXT,
  api_key TEXT,

  -- Coverage
  active_states TEXT[],
  active_verticals TEXT[],
  active_zips TEXT[],  -- empty = all zips

  -- Limits
  min_score INTEGER DEFAULT 0,
  max_daily_leads INTEGER,
  current_daily_count INTEGER DEFAULT 0,

  -- Status
  is_active BOOLEAN DEFAULT TRUE,

  -- Contact
  contact_email TEXT,
  payment_terms TEXT
);

ALTER TABLE buyers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "buyers_service_role" ON buyers
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- PROPERTY_CACHE TABLE - Avoid redundant API calls
-- ============================================

CREATE TABLE property_cache (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  address_hash TEXT UNIQUE NOT NULL,  -- MD5 of standardized address

  -- Cached data
  smarty_data JSONB,
  shovels_data JSONB,
  rentcast_data JSONB,
  census_data JSONB,

  -- Timestamps
  cached_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '30 days')
);

CREATE INDEX idx_property_cache_hash ON property_cache(address_hash);
CREATE INDEX idx_property_cache_expires ON property_cache(expires_at);

ALTER TABLE property_cache ENABLE ROW LEVEL SECURITY;

CREATE POLICY "property_cache_service_role" ON property_cache
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- ENRICHMENT_LOGS TABLE - Debugging/optimization
-- ============================================

CREATE TABLE enrichment_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  lead_id UUID REFERENCES leads(id) ON DELETE SET NULL,
  call_id UUID REFERENCES calls(id) ON DELETE SET NULL,

  step TEXT NOT NULL,  -- smarty, shovels, rentcast, census, gemini
  status TEXT NOT NULL,  -- success, error, cached

  request_data JSONB,
  response_data JSONB,
  error_message TEXT,

  duration_ms INTEGER,
  cost_cents INTEGER
);

CREATE INDEX idx_enrichment_logs_lead ON enrichment_logs(lead_id);
CREATE INDEX idx_enrichment_logs_call ON enrichment_logs(call_id);
CREATE INDEX idx_enrichment_logs_step ON enrichment_logs(step);
CREATE INDEX idx_enrichment_logs_created ON enrichment_logs(created_at DESC);

ALTER TABLE enrichment_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "enrichment_logs_service_role" ON enrichment_logs
  FOR ALL TO service_role
  USING (true) WITH CHECK (true);

-- ============================================
-- DONE! Schema reset complete.
-- Tables created: leads, calls, daily_stats, pages, buyers, property_cache, enrichment_logs
-- ============================================
