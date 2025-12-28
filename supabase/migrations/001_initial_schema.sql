-- supabase/migrations/001_initial_schema.sql
-- Core leads table for web form submissions

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

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_leads_created_at ON leads(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_leads_state ON leads(state);
CREATE INDEX IF NOT EXISTS idx_leads_vertical ON leads(vertical);
CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);
CREATE INDEX IF NOT EXISTS idx_leads_zip ON leads(zip);
CREATE INDEX IF NOT EXISTS idx_leads_ping_status ON leads(ping_status);

-- Enable Row Level Security
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

-- Allow inserts from authenticated and anon (for form submissions)
CREATE POLICY "Allow anonymous inserts" ON leads
  FOR INSERT TO anon
  WITH CHECK (true);

-- Allow service role full access
CREATE POLICY "Allow service role full access" ON leads
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);
