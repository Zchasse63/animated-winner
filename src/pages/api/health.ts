import type { APIRoute } from 'astro';
import { supabase } from '../../lib/supabase';

export const GET: APIRoute = async () => {
  const health = {
    status: 'ok',
    timestamp: new Date().toISOString(),
    services: {
      supabase: 'unknown',
    },
  };

  // Check Supabase connection
  try {
    const { error } = await supabase.from('leads').select('id').limit(1);
    health.services.supabase = error ? 'error' : 'ok';
  } catch {
    health.services.supabase = 'error';
  }

  const allHealthy = Object.values(health.services).every(s => s === 'ok');
  health.status = allHealthy ? 'ok' : 'degraded';

  return new Response(JSON.stringify(health, null, 2), {
    status: allHealthy ? 200 : 503,
    headers: { 'Content-Type': 'application/json' },
  });
};
