-- supabase/migrations/002_calls_table.sql
-- Ringba call tracking data

CREATE TABLE IF NOT EXISTS calls (
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

-- Indexes
CREATE INDEX IF NOT EXISTS idx_calls_created_at ON calls(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_calls_state ON calls(state);
CREATE INDEX IF NOT EXISTS idx_calls_vertical ON calls(vertical);
CREATE INDEX IF NOT EXISTS idx_calls_converted ON calls(converted);
CREATE INDEX IF NOT EXISTS idx_calls_buyer ON calls(buyer_name);
CREATE INDEX IF NOT EXISTS idx_calls_ringba_id ON calls(ringba_call_id);

-- Enable Row Level Security
ALTER TABLE calls ENABLE ROW LEVEL SECURITY;

-- Only service role can access calls
CREATE POLICY "Allow service role full access" ON calls
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);
