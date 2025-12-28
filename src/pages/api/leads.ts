import type { APIRoute } from 'astro';
import { supabase } from '../../lib/supabase';
import { leadFormSchema } from '../../lib/validation';

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();

    // Validate the incoming data
    const validationResult = leadFormSchema.safeParse(body);
    if (!validationResult.success) {
      return new Response(
        JSON.stringify({
          success: false,
          error: 'Validation failed',
          details: validationResult.error.flatten(),
        }),
        {
          status: 400,
          headers: { 'Content-Type': 'application/json' },
        }
      );
    }

    const data = validationResult.data;

    // Prepare lead data for insertion
    const leadData = {
      first_name: data.name.split(' ')[0],
      last_name: data.name.split(' ').slice(1).join(' ') || '',
      email: data.email,
      phone: data.phone.replace(/\D/g, ''), // Store as digits only
      address: data.address,
      city: data.city,
      state: data.state,
      zip: data.zip,
      property_type: data.propertyType,
      service_type: data.serviceType,
      urgency: data.urgency,
      best_time: data.bestTime || null,
      vertical: body.vertical || 'hvac',
      tcpa_consent: data.tcpaConsent,
      trusted_form_cert: body.trustedFormCertUrl || null,
      source_url: body.source || null,
      user_agent: body.userAgent || null,
      ip_address: request.headers.get('x-forwarded-for') || request.headers.get('cf-connecting-ip') || null,
      status: 'new',
    };

    // Insert into Supabase
    const { data: lead, error: insertError } = await supabase
      .from('leads')
      .insert(leadData)
      .select()
      .single();

    if (insertError) {
      console.error('Supabase insert error:', insertError);
      return new Response(
        JSON.stringify({
          success: false,
          error: 'Failed to save lead',
        }),
        {
          status: 500,
          headers: { 'Content-Type': 'application/json' },
        }
      );
    }

    // TODO: Trigger ping/post to buyers (Phase 8)
    // await pingBuyers(lead);

    // Update daily stats
    await updateDailyStats(lead.vertical, lead.city, lead.state);

    return new Response(
      JSON.stringify({
        success: true,
        leadId: lead.id,
        message: 'Lead submitted successfully',
      }),
      {
        status: 200,
        headers: { 'Content-Type': 'application/json' },
      }
    );
  } catch (error) {
    console.error('API error:', error);
    return new Response(
      JSON.stringify({
        success: false,
        error: 'Internal server error',
      }),
      {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      }
    );
  }
};

// Helper to update daily statistics
async function updateDailyStats(vertical: string, city: string, state: string) {
  const today = new Date().toISOString().split('T')[0];

  try {
    // Check if record exists for today
    const { data: existing } = await supabase
      .from('daily_stats')
      .select('id, leads_count')
      .eq('date', today)
      .eq('vertical', vertical)
      .eq('city', city)
      .eq('state', state)
      .single();

    if (existing) {
      // Update existing record
      await supabase
        .from('daily_stats')
        .update({ leads_count: existing.leads_count + 1 })
        .eq('id', existing.id);
    } else {
      // Create new record
      await supabase
        .from('daily_stats')
        .insert({
          date: today,
          vertical,
          city,
          state,
          leads_count: 1,
          calls_count: 0,
          revenue: 0,
        });
    }
  } catch (error) {
    // Non-critical, log but don't fail the request
    console.error('Failed to update daily stats:', error);
  }
}
