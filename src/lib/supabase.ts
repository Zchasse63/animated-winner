import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

// Supabase 2025-2026 API Key Format:
// - Publishable keys (sb_publishable_...) are safe for client-side/browser use with RLS
// - Secret keys (sb_secret_...) are for server-side only, bypass RLS
const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

if (!supabaseUrl || !supabasePublishableKey) {
  throw new Error('Missing Supabase environment variables (PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_PUBLISHABLE_KEY)');
}

// Client for browser/frontend use (respects Row Level Security)
export const supabase = createClient<Database>(supabaseUrl, supabasePublishableKey);

// Server client with secret key (for API routes/server-side operations)
// WARNING: This bypasses Row Level Security - use only on server-side
export function createServerClient() {
  const secretKey = import.meta.env.SUPABASE_SECRET_KEY;

  if (!secretKey) {
    throw new Error('Missing SUPABASE_SECRET_KEY');
  }

  return createClient<Database>(supabaseUrl, secretKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}
