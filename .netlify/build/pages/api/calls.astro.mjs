import { s as supabase } from '../../chunks/supabase_CzzrOyyL.mjs';
export { renderers } from '../../renderers.mjs';

const POST = async ({ request }) => {
  try {
    const body = await request.json();
    const callData = {
      caller_id: body.caller_id || body.callerNumber || null,
      trackdrive_call_id: body.call_id || body.callId || null,
      campaign_id: body.campaign_id || body.campaignId || null,
      publisher_id: body.publisher_id || body.publisherId || null,
      target_id: body.target_id || body.targetId || null,
      target_name: body.target_name || body.targetName || null,
      call_status: body.call_status || body.callStatus || "unknown",
      duration_seconds: body.duration || body.durationSeconds || 0,
      is_converted: body.is_converted || body.converted || false,
      revenue: body.revenue || body.payout || 0,
      city: body.city || null,
      state: body.state || null,
      vertical: body.vertical || body.tag1 || "hvac",
      source_url: body.source_url || body.landing_page || null,
      recording_url: body.recording_url || body.recordingUrl || null
    };
    const { data: call, error: insertError } = await supabase.from("calls").insert(callData).select().single();
    if (insertError) {
      console.error("Failed to insert call:", insertError);
      return new Response(
        JSON.stringify({ success: false, error: "Failed to save call" }),
        { status: 500, headers: { "Content-Type": "application/json" } }
      );
    }
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
      { status: 200, headers: { "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("Call webhook error:", error);
    return new Response(
      JSON.stringify({ success: false, error: "Internal server error" }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
};
async function updateDailyCallStats(vertical, city, state, revenue) {
  const today = (/* @__PURE__ */ new Date()).toISOString().split("T")[0];
  try {
    const { data: existing } = await supabase.from("daily_stats").select("id, calls_count, revenue").eq("date", today).eq("vertical", vertical).eq("city", city).eq("state", state).single();
    if (existing) {
      await supabase.from("daily_stats").update({
        calls_count: existing.calls_count + 1,
        revenue: existing.revenue + revenue
      }).eq("id", existing.id);
    } else {
      await supabase.from("daily_stats").insert({
        date: today,
        vertical,
        city,
        state,
        leads_count: 0,
        calls_count: 1,
        revenue
      });
    }
  } catch (error) {
    console.error("Failed to update call stats:", error);
  }
}

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  POST
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
