import { s as supabase } from '../../chunks/supabase_CzzrOyyL.mjs';
import { l as leadFormSchema } from '../../chunks/validation_BKEfKeLE.mjs';
export { renderers } from '../../renderers.mjs';

const POST = async ({ request }) => {
  try {
    const body = await request.json();
    const validationResult = leadFormSchema.safeParse(body);
    if (!validationResult.success) {
      return new Response(
        JSON.stringify({
          success: false,
          error: "Validation failed",
          details: validationResult.error.flatten()
        }),
        {
          status: 400,
          headers: { "Content-Type": "application/json" }
        }
      );
    }
    const data = validationResult.data;
    const leadData = {
      first_name: data.name.split(" ")[0],
      last_name: data.name.split(" ").slice(1).join(" ") || "",
      email: data.email,
      phone: data.phone.replace(/\D/g, ""),
      // Store as digits only
      address: data.address,
      city: data.city,
      state: data.state,
      zip: data.zip,
      property_type: data.propertyType,
      service_type: data.serviceType,
      urgency: data.urgency,
      best_time: data.bestTime || null,
      vertical: body.vertical || "hvac",
      tcpa_consent: data.tcpaConsent,
      trusted_form_cert: body.trustedFormCertUrl || null,
      source_url: body.source || null,
      user_agent: body.userAgent || null,
      ip_address: request.headers.get("x-forwarded-for") || request.headers.get("cf-connecting-ip") || null,
      status: "new"
    };
    const { data: lead, error: insertError } = await supabase.from("leads").insert(leadData).select().single();
    if (insertError) {
      console.error("Supabase insert error:", insertError);
      return new Response(
        JSON.stringify({
          success: false,
          error: "Failed to save lead"
        }),
        {
          status: 500,
          headers: { "Content-Type": "application/json" }
        }
      );
    }
    await updateDailyStats(lead.vertical, lead.city, lead.state);
    return new Response(
      JSON.stringify({
        success: true,
        leadId: lead.id,
        message: "Lead submitted successfully"
      }),
      {
        status: 200,
        headers: { "Content-Type": "application/json" }
      }
    );
  } catch (error) {
    console.error("API error:", error);
    return new Response(
      JSON.stringify({
        success: false,
        error: "Internal server error"
      }),
      {
        status: 500,
        headers: { "Content-Type": "application/json" }
      }
    );
  }
};
async function updateDailyStats(vertical, city, state) {
  const today = (/* @__PURE__ */ new Date()).toISOString().split("T")[0];
  try {
    const { data: existing } = await supabase.from("daily_stats").select("id, leads_count").eq("date", today).eq("vertical", vertical).eq("city", city).eq("state", state).single();
    if (existing) {
      await supabase.from("daily_stats").update({ leads_count: existing.leads_count + 1 }).eq("id", existing.id);
    } else {
      await supabase.from("daily_stats").insert({
        date: today,
        vertical,
        city,
        state,
        leads_count: 1,
        calls_count: 0,
        revenue: 0
      });
    }
  } catch (error) {
    console.error("Failed to update daily stats:", error);
  }
}

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  POST
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
