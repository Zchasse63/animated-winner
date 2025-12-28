-- supabase/migrations/004_supporting_tables.sql
-- Pages, buyers, cache, and enrichment logs

-- Pages table (for CMS-like page generation)
CREATE TABLE IF NOT EXISTS pages (
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

CREATE INDEX IF NOT EXISTS idx_pages_slug ON pages(slug);
CREATE INDEX IF NOT EXISTS idx_pages_state ON pages(state);
CREATE INDEX IF NOT EXISTS idx_pages_active ON pages(is_active);

-- Enable Row Level Security
ALTER TABLE pages ENABLE ROW LEVEL SECURITY;

-- Allow public read access to pages
CREATE POLICY "Allow public read access" ON pages
  FOR SELECT TO anon
  USING (is_active = true);

-- Allow service role full access
CREATE POLICY "Allow service role full access" ON pages
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);


-- Buyers table
CREATE TABLE IF NOT EXISTS buyers (
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

-- Enable Row Level Security
ALTER TABLE buyers ENABLE ROW LEVEL SECURITY;

-- Only service role can access buyers
CREATE POLICY "Allow service role full access" ON buyers
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);


-- Property cache (avoid redundant API calls)
CREATE TABLE IF NOT EXISTS property_cache (
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

CREATE INDEX IF NOT EXISTS idx_property_cache_hash ON property_cache(address_hash);
CREATE INDEX IF NOT EXISTS idx_property_cache_expires ON property_cache(expires_at);

-- Enable Row Level Security
ALTER TABLE property_cache ENABLE ROW LEVEL SECURITY;

-- Only service role can access cache
CREATE POLICY "Allow service role full access" ON property_cache
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);


-- Enrichment logs (debugging/optimization)
CREATE TABLE IF NOT EXISTS enrichment_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),

  lead_id UUID REFERENCES leads(id),
  call_id UUID REFERENCES calls(id),

  step TEXT NOT NULL,  -- smarty, shovels, rentcast, census, gemini
  status TEXT NOT NULL,  -- success, error, cached

  request_data JSONB,
  response_data JSONB,
  error_message TEXT,

  duration_ms INTEGER,
  cost_cents INTEGER
);

CREATE INDEX IF NOT EXISTS idx_enrichment_logs_lead ON enrichment_logs(lead_id);
CREATE INDEX IF NOT EXISTS idx_enrichment_logs_step ON enrichment_logs(step);
CREATE INDEX IF NOT EXISTS idx_enrichment_logs_created ON enrichment_logs(created_at DESC);

-- Enable Row Level Security
ALTER TABLE enrichment_logs ENABLE ROW LEVEL SECURITY;

-- Only service role can access logs
CREATE POLICY "Allow service role full access" ON enrichment_logs
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);
