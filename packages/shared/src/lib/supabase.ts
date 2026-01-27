import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

// Supabase 2025-2026 API Key Format:
// - Publishable keys (sb_publishable_...) are safe for client-side/browser use with RLS
// - Secret keys (sb_secret_...) are for server-side only, bypass RLS

// Client for browser/frontend use (respects Row Level Security)
// Lazy initialization to avoid errors during build when env vars are not required
let _supabase: ReturnType<typeof createClient<Database>> | null = null;

export const supabase = new Proxy({} as ReturnType<typeof createClient<Database>>, {
  get(target, prop) {
    if (!_supabase) {
      const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
      const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

      if (!supabaseUrl || !supabasePublishableKey) {
        throw new Error('Missing required configuration for database connection');
      }

      _supabase = createClient<Database>(supabaseUrl, supabasePublishableKey);
    }
    return (_supabase as any)[prop];
  }
});

// Server client with secret key (for API routes/server-side operations)
// WARNING: This bypasses Row Level Security - use only on server-side
export function createServerClient() {
  const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
  const secretKey = import.meta.env.SUPABASE_SECRET_KEY;

  if (!supabaseUrl || !secretKey) {
    throw new Error('Missing required server configuration for database connection');
  }

  return createClient<Database>(supabaseUrl, secretKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}
