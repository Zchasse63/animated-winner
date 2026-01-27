import type { APIRoute } from 'astro';
import { createServerClient } from '@leadgen/shared';
import { leadFormSchema } from '@leadgen/shared';
import { vertical } from '@/config/vertical';

const MAX_REQUEST_SIZE = 10 * 1024; // 10KB limit for lead submissions

export const POST: APIRoute = async ({ request }) => {
  try {
    // CSRF protection: Validate origin and referer
    const origin = request.headers.get('origin');
    const referer = request.headers.get('referer');
    const siteUrl = import.meta.env.PUBLIC_SITE_URL;

    // Fail-closed: reject if site URL not configured
    if (!siteUrl) {
      console.error('CSRF check failed: PUBLIC_SITE_URL not configured');
      return new Response(
        JSON.stringify({ success: false, error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Require either origin or referer header for CSRF protection
    if (!origin && !referer) {
      return new Response(
        JSON.stringify({ success: false, error: 'Missing security headers' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (origin && !origin.startsWith(siteUrl)) {
      return new Response(
        JSON.stringify({ success: false, error: 'Invalid origin' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (referer && !referer.startsWith(siteUrl)) {
      return new Response(
        JSON.stringify({ success: false, error: 'Invalid referer' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check Content-Length header for request size limit (DoS protection)
    const contentLength = parseInt(request.headers.get('content-length') || '0', 10);
    if (contentLength > MAX_REQUEST_SIZE) {
      return new Response(
        JSON.stringify({ success: false, error: 'Request too large' }),
        { status: 413, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Use server client to bypass RLS for admin operations
    const supabase = createServerClient();

    // Parse JSON with size validation
    let body;
    try {
      const rawBody = await request.text();
      if (rawBody.length > MAX_REQUEST_SIZE) {
        return new Response(
          JSON.stringify({ success: false, error: 'Request too large' }),
          { status: 413, headers: { 'Content-Type': 'application/json' } }
        );
      }
      body = JSON.parse(rawBody);
    } catch (parseError) {
      return new Response(
        JSON.stringify({ success: false, error: 'Invalid request format' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

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

    // Parse name safely
    const nameParts = data.name.trim().split(/\s+/);
    const first_name = nameParts[0] || '';
    const last_name = nameParts.slice(1).join(' ') || '';

    // Prepare lead data for insertion
    const leadData = {
      first_name,
      last_name,
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
      vertical: vertical.id, // Server-enforced from config, NOT client input
      tcpa_consent: data.tcpaConsent,
      trusted_form_cert: body.trustedFormCertUrl || null,
      source_url: body.source || null,
      user_agent: body.userAgent || null,
      ip_address: request.headers.get('x-forwarded-for')?.split(',')[0].trim() || request.headers.get('cf-connecting-ip') || null,
      status: 'new',
    };

    // Insert into Supabase
    const { data: lead, error: insertError } = await supabase
      .from('leads')
      .insert(leadData)
      .select()
      .single();

    if (insertError) {
      console.error('Failed to save lead to database');
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
    console.error('API error:', error instanceof Error ? error.message : 'Unknown error');
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
  const supabase = createServerClient();

  try {
    // Check if record exists for today (use maybeSingle to handle 0 rows gracefully)
    const { data: existing } = await supabase
      .from('daily_stats')
      .select('id, leads_count')
      .eq('date', today)
      .eq('vertical', vertical)
      .eq('city', city)
      .eq('state', state)
      .maybeSingle();

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
    console.error('Failed to update daily stats:', error instanceof Error ? error.message : 'Unknown error');
  }
}
