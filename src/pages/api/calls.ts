import type { APIRoute } from 'astro';
import { supabase } from '../../lib/supabase';

// Ringba webhook endpoint for call tracking
export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();

    // Validate Ringba webhook signature if needed
    // const signature = request.headers.get('x-ringba-signature');

    // Extract call data from Ringba payload
    const callData = {
      caller_id: body.caller_id || body.callerNumber || null,
      ringba_call_id: body.call_id || body.callId || null,
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

    // Insert call record
    const { data: call, error: insertError } = await supabase
      .from('calls')
      .insert(callData)
      .select()
      .single();

    if (insertError) {
      console.error('Failed to insert call:', insertError);
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
    console.error('Call webhook error:', error);
    return new Response(
      JSON.stringify({ success: false, error: 'Internal server error' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};

async function updateDailyCallStats(
  vertical: string,
  city: string,
  state: string,
  revenue: number
) {
  const today = new Date().toISOString().split('T')[0];

  try {
    const { data: existing } = await supabase
      .from('daily_stats')
      .select('id, calls_count, revenue')
      .eq('date', today)
      .eq('vertical', vertical)
      .eq('city', city)
      .eq('state', state)
      .single();

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
    console.error('Failed to update call stats:', error);
  }
}
