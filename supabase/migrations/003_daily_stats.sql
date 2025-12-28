-- supabase/migrations/003_daily_stats.sql
-- Unified daily statistics for reporting

CREATE TABLE IF NOT EXISTS daily_stats (
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

CREATE INDEX IF NOT EXISTS idx_daily_stats_date ON daily_stats(date DESC);
CREATE INDEX IF NOT EXISTS idx_daily_stats_state ON daily_stats(state);
CREATE INDEX IF NOT EXISTS idx_daily_stats_vertical ON daily_stats(vertical);

-- Enable Row Level Security
ALTER TABLE daily_stats ENABLE ROW LEVEL SECURITY;

-- Only service role can access stats
CREATE POLICY "Allow service role full access" ON daily_stats
  FOR ALL TO service_role
  USING (true)
  WITH CHECK (true);

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
