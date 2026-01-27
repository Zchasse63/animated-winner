import type { APIRoute } from 'astro';
import { createServerClient } from '@leadgen/shared';

const TRACKDRIVE_API_KEY = import.meta.env.TRACKDRIVE_API_KEY;

// TrackDrive webhook endpoint for call tracking
export const POST: APIRoute = async ({ request }) => {
  try {
    // Read body once for signature verification
    const rawBody = await request.text();

    // Validate TrackDrive webhook signature
    const signature = request.headers.get('x-trackdrive-signature');
    if (TRACKDRIVE_API_KEY && !(await verifySignature(signature, rawBody))) {
      return new Response(
        JSON.stringify({ success: false, error: 'Unauthorized' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Parse JSON with explicit try-catch to prevent crashes from malformed JSON
    let body;
    try {
      body = JSON.parse(rawBody);
    } catch (parseError) {
      return new Response(
        JSON.stringify({ success: false, error: 'Invalid JSON payload' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Extract call data from TrackDrive payload
    // Note: Field names may need adjustment based on TrackDrive's actual webhook format
    const callData = {
      caller_id: body.caller_id || body.callerNumber || null,
      trackdrive_call_id: body.call_id || body.callId || null,
      campaign_id: body.campaign_id || body.campaignId || null,
      publisher_id: body.publisher_id || body.publisherId || null,
      target_id: body.target_id || body.targetId || null,
      target_name: body.target_name || body.targetName || null,
      call_status: body.call_status || body.callStatus || 'unknown',
      duration_seconds: body.duration || body.durationSeconds || 0,
      is_converted: body.is_converted || body.converted || false,
      revenue: body.revenue || body.payout || 0,
      city: body.city || null,
      state: body.state || null,
      vertical: body.vertical || body.tag1 || 'hvac',
      source_url: body.source_url || body.landing_page || null,
      recording_url: body.recording_url || body.recordingUrl || null,
    };

    // Use server client to bypass RLS
    const supabase = createServerClient();

    // Insert call record
    const { data: call, error: insertError } = await supabase
      .from('calls')
      .insert(callData)
      .select()
      .single();

    if (insertError) {
      console.error('Failed to insert call record to database');
      return new Response(
        JSON.stringify({ success: false, error: 'Failed to save call' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Update daily stats if call was converted
    if (callData.is_converted && callData.city && callData.state) {
      await updateDailyCallStats(
        callData.vertical,
        callData.city,
        callData.state,
        callData.revenue
      );
    }

    return new Response(
      JSON.stringify({ success: true, callId: call.id }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (error) {
    console.error('Call webhook error:', error instanceof Error ? error.message : 'Unknown error');
    return new Response(
      JSON.stringify({ success: false, error: 'Internal server error' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};

// Verify TrackDrive webhook signature using HMAC SHA256
async function verifySignature(signature: string | null, body: string): Promise<boolean> {
  if (!signature || !TRACKDRIVE_API_KEY) return false;

  try {
    const encoder = new TextEncoder();
    const keyData = encoder.encode(TRACKDRIVE_API_KEY);
    const bodyData = encoder.encode(body);

    const cryptoKey = await crypto.subtle.importKey(
      'raw',
      keyData,
      { name: 'HMAC', hash: 'SHA-256' },
      false,
      ['sign']
    );

    const signatureBuffer = await crypto.subtle.sign('HMAC', cryptoKey, bodyData);
    const expectedSignature = Array.from(new Uint8Array(signatureBuffer))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('');

    return signature.toLowerCase() === expectedSignature;
  } catch {
    return false;
  }
}

async function updateDailyCallStats(
  vertical: string,
  city: string,
  state: string,
  revenue: number
) {
  const today = new Date().toISOString().split('T')[0];
  const supabase = createServerClient();

  try {
    // Use maybeSingle to handle 0 rows gracefully (avoid "no rows" error)
    const { data: existing } = await supabase
      .from('daily_stats')
      .select('id, calls_count, revenue')
      .eq('date', today)
      .eq('vertical', vertical)
      .eq('city', city)
      .eq('state', state)
      .maybeSingle();

    if (existing) {
      await supabase
        .from('daily_stats')
        .update({
          calls_count: existing.calls_count + 1,
          revenue: existing.revenue + revenue,
        })
        .eq('id', existing.id);
    } else {
      await supabase
        .from('daily_stats')
        .insert({
          date: today,
          vertical,
          city,
          state,
          leads_count: 0,
          calls_count: 1,
          revenue,
        });
    }
  } catch (error) {
    console.error('Failed to update call stats:', error instanceof Error ? error.message : 'Unknown error');
  }
}
