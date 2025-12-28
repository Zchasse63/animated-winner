-- ============================================
-- HVAC Lead Generation Platform - Full Schema
-- Run this in Supabase SQL Editor
-- ============================================

-- ============================================
-- 001_initial_schema.sql - Leads Table
-- ============================================

CREATE TABLE IF NOT EXISTS leads (
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
  state TEXT NOT NULL,
  zip TEXT NOT NULL,

  -- Service details
  vertical TEXT NOT NULL,
  service_type TEXT NOT NULL,
  urgency TEXT NOT NULL,
  property_type TEXT,
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
  ping_status TEXT DEFAULT 'pending',
  ping_request_id TEXT,
  ping_bid_amount DECIMAL(10,2),
  ping_buyer_id TEXT,
  ping_timestamp TIMESTAMPTZ,

  post_status TEXT,
  post_phone_number TEXT,
  post_timestamp TIMESTAMPTZ,

  -- Enrichment (light)
  address_valid BOOLEAN,
  phone_valid BOOLEAN,
  phone_type TEXT,

  -- Enrichment (full)
  enrichment_data JSONB,
  property_year_built INTEGER,
  property_sqft INTEGER,
  property_value INTEGER,
  last_hvac_permit_date DATE,
  years_since_hvac_permit INTEGER,

  -- Scoring
  raw_score INTEGER,
  score_tier TEXT,
  score_factors JSONB,

  -- Sale tracking
  status TEXT DEFAULT 'new',
  sold_to TEXT,
  sold_price DECIMAL(10,2),
  sold_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_leads_created_at ON leads(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_leads_state ON leads(state);
CREATE INDEX IF NOT EXISTS idx_leads_vertical ON leads(vertical);
CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);
CREATE INDEX IF NOT EXISTS idx_leads_zip ON leads(zip);
CREATE INDEX IF NOT EXISTS idx_leads_ping_status ON leads(ping_status);

ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous inserts" ON leads
  FOR INSERT TO anon
  WITH CHECK (true);

CREATE POLICY "Allow service role full access" ON leads
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================
-- 002_calls_table.sql - Ringba Calls
-- ============================================

CREATE TABLE IF NOT EXISTS calls (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  ringba_call_id TEXT UNIQUE NOT NULL,
  call_uuid TEXT,

  caller_phone TEXT,
  caller_city TEXT,
  caller_state TEXT,
  caller_zip TEXT,

  duration_seconds INTEGER,
  connection_seconds INTEGER,
  ring_duration_seconds INTEGER,
  status TEXT,

  converted BOOLEAN DEFAULT FALSE,
  revenue DECIMAL(10,2) DEFAULT 0,
  payout DECIMAL(10,2) DEFAULT 0,

  buyer_name TEXT,
  buyer_number TEXT,
  campaign TEXT,

  vertical TEXT,
  city TEXT,
  state TEXT,
  source TEXT,
  landing_page TEXT,
  keyword TEXT,

  ivr_selection TEXT,

  call_start TIMESTAMPTZ,
  call_end TIMESTAMPTZ,

  raw_payload JSONB
);

CREATE INDEX IF NOT EXISTS idx_calls_created_at ON calls(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_calls_state ON calls(state);
CREATE INDEX IF NOT EXISTS idx_calls_vertical ON calls(vertical);
CREATE INDEX IF NOT EXISTS idx_calls_converted ON calls(converted);
CREATE INDEX IF NOT EXISTS idx_calls_buyer ON calls(buyer_name);
CREATE INDEX IF NOT EXISTS idx_calls_ringba_id ON calls(ringba_call_id);

ALTER TABLE calls ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role full access on calls" ON calls
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================
-- 003_daily_stats.sql - Unified Stats
-- ============================================

CREATE TABLE IF NOT EXISTS daily_stats (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date DATE NOT NULL,
  state TEXT NOT NULL,
  vertical TEXT NOT NULL,
  source TEXT NOT NULL,

  web_leads_total INTEGER DEFAULT 0,
  web_leads_sold INTEGER DEFAULT 0,
  web_leads_revenue DECIMAL(10,2) DEFAULT 0,
  web_avg_score INTEGER DEFAULT 0,

  calls_total INTEGER DEFAULT 0,
  calls_converted INTEGER DEFAULT 0,
  calls_revenue DECIMAL(10,2) DEFAULT 0,
  calls_avg_duration INTEGER DEFAULT 0,

  total_leads INTEGER GENERATED ALWAYS AS (web_leads_total + calls_total) STORED,
  total_sold INTEGER GENERATED ALWAYS AS (web_leads_sold + calls_converted) STORED,
  total_revenue DECIMAL(10,2) GENERATED ALWAYS AS (web_leads_revenue + calls_revenue) STORED,

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

CREATE INDEX IF NOT EXISTS idx_daily_stats_date ON daily_stats(date DESC);
CREATE INDEX IF NOT EXISTS idx_daily_stats_state ON daily_stats(state);
CREATE INDEX IF NOT EXISTS idx_daily_stats_vertical ON daily_stats(vertical);

ALTER TABLE daily_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role full access on daily_stats" ON daily_stats
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

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
-- 004_supporting_tables.sql - Pages, Buyers, Cache
-- ============================================

CREATE TABLE IF NOT EXISTS pages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  slug TEXT UNIQUE NOT NULL,
  state TEXT NOT NULL,
  city TEXT NOT NULL,
  vertical TEXT NOT NULL,
  service TEXT,

  title TEXT NOT NULL,
  meta_description TEXT,
  h1 TEXT NOT NULL,
  intro_paragraph TEXT,

  faq_content JSONB,
  service_areas JSONB,

  is_active BOOLEAN DEFAULT TRUE,

  ringba_campaign_id TEXT,
  fallback_phone TEXT
);

CREATE INDEX IF NOT EXISTS idx_pages_slug ON pages(slug);
CREATE INDEX IF NOT EXISTS idx_pages_state ON pages(state);
CREATE INDEX IF NOT EXISTS idx_pages_active ON pages(is_active);

ALTER TABLE pages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access on pages" ON pages
  FOR SELECT TO anon
  USING (is_active = true);

CREATE POLICY "Allow service role full access on pages" ON pages
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

CREATE TABLE IF NOT EXISTS buyers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  name TEXT NOT NULL,
  type TEXT NOT NULL,

  api_endpoint TEXT,
  api_key TEXT,

  active_states TEXT[],
  active_verticals TEXT[],
  active_zips TEXT[],

  min_score INTEGER DEFAULT 0,
  max_daily_leads INTEGER,
  current_daily_count INTEGER DEFAULT 0,

  is_active BOOLEAN DEFAULT TRUE,

  contact_email TEXT,
  payment_terms TEXT
);

ALTER TABLE buyers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role full access on buyers" ON buyers
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

CREATE TABLE IF NOT EXISTS property_cache (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  address_hash TEXT UNIQUE NOT NULL,

  smarty_data JSONB,
  shovels_data JSONB,
  rentcast_data JSONB,
  census_data JSONB,

  cached_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '30 days')
);

CREATE INDEX IF NOT EXISTS idx_property_cache_hash ON property_cache(address_hash);
CREATE INDEX IF NOT EXISTS idx_property_cache_expires ON property_cache(expires_at);

ALTER TABLE property_cache ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role full access on property_cache" ON property_cache
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

CREATE TABLE IF NOT EXISTS enrichment_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  lead_id UUID REFERENCES leads(id),
  call_id UUID REFERENCES calls(id),

  step TEXT NOT NULL,
  status TEXT NOT NULL,

  request_data JSONB,
  response_data JSONB,
  error_message TEXT,

  duration_ms INTEGER,
  cost_cents INTEGER
);

CREATE INDEX IF NOT EXISTS idx_enrichment_logs_lead ON enrichment_logs(lead_id);
CREATE INDEX IF NOT EXISTS idx_enrichment_logs_step ON enrichment_logs(step);
CREATE INDEX IF NOT EXISTS idx_enrichment_logs_created ON enrichment_logs(created_at DESC);

ALTER TABLE enrichment_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role full access on enrichment_logs" ON enrichment_logs
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

-- ============================================
-- Done! All tables created successfully.
-- ============================================
