export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export interface Database {
  public: {
    Tables: {
      leads: {
        Row: {
          id: string;
          created_at: string | null;
          // Contact info
          name: string;
          email: string;
          phone: string;
          // Location
          address: string | null;
          address_standardized: string | null;
          city: string;
          state: string;
          zip: string;
          // Service details
          vertical: string;
          service_type: string;
          urgency: string;
          property_type: string | null;
          issue_description: string | null;
          // Attribution
          source_page: string | null;
          utm_source: string | null;
          utm_medium: string | null;
          utm_campaign: string | null;
          utm_content: string | null;
          referrer: string | null;
          // Compliance
          trustedform_cert_url: string | null;
          tcpa_consent_timestamp: string | null;
          ip_address: string | null;
          // Ping/Post tracking
          ping_status: string | null;
          ping_request_id: string | null;
          ping_bid_amount: number | null;
          ping_buyer_id: string | null;
          ping_timestamp: string | null;
          post_status: string | null;
          post_phone_number: string | null;
          post_timestamp: string | null;
          // Enrichment (light)
          address_valid: boolean | null;
          phone_valid: boolean | null;
          phone_type: string | null;
          // Enrichment (full)
          enrichment_data: Json | null;
          property_year_built: number | null;
          property_sqft: number | null;
          property_value: number | null;
          last_hvac_permit_date: string | null;
          years_since_hvac_permit: number | null;
          // Scoring
          raw_score: number | null;
          score_tier: string | null;
          score_factors: Json | null;
          // Sale tracking
          status: string | null;
          sold_to: string | null;
          sold_price: number | null;
          sold_at: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string | null;
          name: string;
          email: string;
          phone: string;
          address?: string | null;
          address_standardized?: string | null;
          city: string;
          state: string;
          zip: string;
          vertical: string;
          service_type: string;
          urgency: string;
          property_type?: string | null;
          issue_description?: string | null;
          source_page?: string | null;
          utm_source?: string | null;
          utm_medium?: string | null;
          utm_campaign?: string | null;
          utm_content?: string | null;
          referrer?: string | null;
          trustedform_cert_url?: string | null;
          tcpa_consent_timestamp?: string | null;
          ip_address?: string | null;
          ping_status?: string | null;
          ping_request_id?: string | null;
          ping_bid_amount?: number | null;
          ping_buyer_id?: string | null;
          ping_timestamp?: string | null;
          post_status?: string | null;
          post_phone_number?: string | null;
          post_timestamp?: string | null;
          address_valid?: boolean | null;
          phone_valid?: boolean | null;
          phone_type?: string | null;
          enrichment_data?: Json | null;
          property_year_built?: number | null;
          property_sqft?: number | null;
          property_value?: number | null;
          last_hvac_permit_date?: string | null;
          years_since_hvac_permit?: number | null;
          raw_score?: number | null;
          score_tier?: string | null;
          score_factors?: Json | null;
          status?: string | null;
          sold_to?: string | null;
          sold_price?: number | null;
          sold_at?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string | null;
          name?: string;
          email?: string;
          phone?: string;
          address?: string | null;
          address_standardized?: string | null;
          city?: string;
          state?: string;
          zip?: string;
          vertical?: string;
          service_type?: string;
          urgency?: string;
          property_type?: string | null;
          issue_description?: string | null;
          source_page?: string | null;
          utm_source?: string | null;
          utm_medium?: string | null;
          utm_campaign?: string | null;
          utm_content?: string | null;
          referrer?: string | null;
          trustedform_cert_url?: string | null;
          tcpa_consent_timestamp?: string | null;
          ip_address?: string | null;
          ping_status?: string | null;
          ping_request_id?: string | null;
          ping_bid_amount?: number | null;
          ping_buyer_id?: string | null;
          ping_timestamp?: string | null;
          post_status?: string | null;
          post_phone_number?: string | null;
          post_timestamp?: string | null;
          address_valid?: boolean | null;
          phone_valid?: boolean | null;
          phone_type?: string | null;
          enrichment_data?: Json | null;
          property_year_built?: number | null;
          property_sqft?: number | null;
          property_value?: number | null;
          last_hvac_permit_date?: string | null;
          years_since_hvac_permit?: number | null;
          raw_score?: number | null;
          score_tier?: string | null;
          score_factors?: Json | null;
          status?: string | null;
          sold_to?: string | null;
          sold_price?: number | null;
          sold_at?: string | null;
        };
        Relationships: [];
      };
      calls: {
        Row: {
          id: string;
          created_at: string | null;
          ringba_call_id: string;
          call_uuid: string | null;
          caller_phone: string | null;
          caller_city: string | null;
          caller_state: string | null;
          caller_zip: string | null;
          duration_seconds: number | null;
          connection_seconds: number | null;
          ring_duration_seconds: number | null;
          status: string | null;
          converted: boolean | null;
          revenue: number | null;
          payout: number | null;
          buyer_name: string | null;
          buyer_number: string | null;
          campaign: string | null;
          vertical: string | null;
          city: string | null;
          state: string | null;
          source: string | null;
          landing_page: string | null;
          keyword: string | null;
          ivr_selection: string | null;
          call_start: string | null;
          call_end: string | null;
          raw_payload: Json | null;
        };
        Insert: {
          id?: string;
          created_at?: string | null;
          ringba_call_id: string;
          call_uuid?: string | null;
          caller_phone?: string | null;
          caller_city?: string | null;
          caller_state?: string | null;
          caller_zip?: string | null;
          duration_seconds?: number | null;
          connection_seconds?: number | null;
          ring_duration_seconds?: number | null;
          status?: string | null;
          converted?: boolean | null;
          revenue?: number | null;
          payout?: number | null;
          buyer_name?: string | null;
          buyer_number?: string | null;
          campaign?: string | null;
          vertical?: string | null;
          city?: string | null;
          state?: string | null;
          source?: string | null;
          landing_page?: string | null;
          keyword?: string | null;
          ivr_selection?: string | null;
          call_start?: string | null;
          call_end?: string | null;
          raw_payload?: Json | null;
        };
        Update: {
          id?: string;
          created_at?: string | null;
          ringba_call_id?: string;
          call_uuid?: string | null;
          caller_phone?: string | null;
          caller_city?: string | null;
          caller_state?: string | null;
          caller_zip?: string | null;
          duration_seconds?: number | null;
          connection_seconds?: number | null;
          ring_duration_seconds?: number | null;
          status?: string | null;
          converted?: boolean | null;
          revenue?: number | null;
          payout?: number | null;
          buyer_name?: string | null;
          buyer_number?: string | null;
          campaign?: string | null;
          vertical?: string | null;
          city?: string | null;
          state?: string | null;
          source?: string | null;
          landing_page?: string | null;
          keyword?: string | null;
          ivr_selection?: string | null;
          call_start?: string | null;
          call_end?: string | null;
          raw_payload?: Json | null;
        };
        Relationships: [];
      };
      daily_stats: {
        Row: {
          id: string;
          date: string;
          state: string;
          vertical: string;
          source: string;
          web_leads_total: number | null;
          web_leads_sold: number | null;
          web_leads_revenue: number | null;
          web_avg_score: number | null;
          calls_total: number | null;
          calls_converted: number | null;
          calls_revenue: number | null;
          calls_avg_duration: number | null;
          // Generated columns
          total_leads: number | null;
          total_sold: number | null;
          total_revenue: number | null;
          web_conversion_rate: number | null;
          call_conversion_rate: number | null;
        };
        Insert: {
          id?: string;
          date: string;
          state: string;
          vertical: string;
          source: string;
          web_leads_total?: number | null;
          web_leads_sold?: number | null;
          web_leads_revenue?: number | null;
          web_avg_score?: number | null;
          calls_total?: number | null;
          calls_converted?: number | null;
          calls_revenue?: number | null;
          calls_avg_duration?: number | null;
        };
        Update: {
          id?: string;
          date?: string;
          state?: string;
          vertical?: string;
          source?: string;
          web_leads_total?: number | null;
          web_leads_sold?: number | null;
          web_leads_revenue?: number | null;
          web_avg_score?: number | null;
          calls_total?: number | null;
          calls_converted?: number | null;
          calls_revenue?: number | null;
          calls_avg_duration?: number | null;
        };
        Relationships: [];
      };
      pages: {
        Row: {
          id: string;
          created_at: string | null;
          slug: string;
          state: string;
          city: string;
          vertical: string;
          service: string | null;
          title: string;
          meta_description: string | null;
          h1: string;
          intro_paragraph: string | null;
          faq_content: Json | null;
          service_areas: Json | null;
          is_active: boolean | null;
          ringba_campaign_id: string | null;
          fallback_phone: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string | null;
          slug: string;
          state: string;
          city: string;
          vertical: string;
          service?: string | null;
          title: string;
          meta_description?: string | null;
          h1: string;
          intro_paragraph?: string | null;
          faq_content?: Json | null;
          service_areas?: Json | null;
          is_active?: boolean | null;
          ringba_campaign_id?: string | null;
          fallback_phone?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string | null;
          slug?: string;
          state?: string;
          city?: string;
          vertical?: string;
          service?: string | null;
          title?: string;
          meta_description?: string | null;
          h1?: string;
          intro_paragraph?: string | null;
          faq_content?: Json | null;
          service_areas?: Json | null;
          is_active?: boolean | null;
          ringba_campaign_id?: string | null;
          fallback_phone?: string | null;
        };
        Relationships: [];
      };
      buyers: {
        Row: {
          id: string;
          created_at: string | null;
          name: string;
          type: string;
          api_endpoint: string | null;
          api_key: string | null;
          active_states: string[] | null;
          active_verticals: string[] | null;
          active_zips: string[] | null;
          min_score: number | null;
          max_daily_leads: number | null;
          current_daily_count: number | null;
          is_active: boolean | null;
          contact_email: string | null;
          payment_terms: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string | null;
          name: string;
          type: string;
          api_endpoint?: string | null;
          api_key?: string | null;
          active_states?: string[] | null;
          active_verticals?: string[] | null;
          active_zips?: string[] | null;
          min_score?: number | null;
          max_daily_leads?: number | null;
          current_daily_count?: number | null;
          is_active?: boolean | null;
          contact_email?: string | null;
          payment_terms?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string | null;
          name?: string;
          type?: string;
          api_endpoint?: string | null;
          api_key?: string | null;
          active_states?: string[] | null;
          active_verticals?: string[] | null;
          active_zips?: string[] | null;
          min_score?: number | null;
          max_daily_leads?: number | null;
          current_daily_count?: number | null;
          is_active?: boolean | null;
          contact_email?: string | null;
          payment_terms?: string | null;
        };
        Relationships: [];
      };
      property_cache: {
        Row: {
          id: string;
          address_hash: string;
          smarty_data: Json | null;
          shovels_data: Json | null;
          rentcast_data: Json | null;
          census_data: Json | null;
          cached_at: string | null;
          expires_at: string | null;
        };
        Insert: {
          id?: string;
          address_hash: string;
          smarty_data?: Json | null;
          shovels_data?: Json | null;
          rentcast_data?: Json | null;
          census_data?: Json | null;
          cached_at?: string | null;
          expires_at?: string | null;
        };
        Update: {
          id?: string;
          address_hash?: string;
          smarty_data?: Json | null;
          shovels_data?: Json | null;
          rentcast_data?: Json | null;
          census_data?: Json | null;
          cached_at?: string | null;
          expires_at?: string | null;
        };
        Relationships: [];
      };
      enrichment_logs: {
        Row: {
          id: string;
          created_at: string | null;
          lead_id: string | null;
          call_id: string | null;
          step: string;
          status: string;
          request_data: Json | null;
          response_data: Json | null;
          error_message: string | null;
          duration_ms: number | null;
          cost_cents: number | null;
        };
        Insert: {
          id?: string;
          created_at?: string | null;
          lead_id?: string | null;
          call_id?: string | null;
          step: string;
          status: string;
          request_data?: Json | null;
          response_data?: Json | null;
          error_message?: string | null;
          duration_ms?: number | null;
          cost_cents?: number | null;
        };
        Update: {
          id?: string;
          created_at?: string | null;
          lead_id?: string | null;
          call_id?: string | null;
          step?: string;
          status?: string;
          request_data?: Json | null;
          response_data?: Json | null;
          error_message?: string | null;
          duration_ms?: number | null;
          cost_cents?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: 'enrichment_logs_lead_id_fkey';
            columns: ['lead_id'];
            isOneToOne: false;
            referencedRelation: 'leads';
            referencedColumns: ['id'];
          },
          {
            foreignKeyName: 'enrichment_logs_call_id_fkey';
            columns: ['call_id'];
            isOneToOne: false;
            referencedRelation: 'calls';
            referencedColumns: ['id'];
          }
        ];
      };
    };
    Views: Record<string, never>;
    Functions: {
      update_daily_stats: {
        Args: {
          p_date: string;
          p_state: string;
          p_vertical: string;
          p_source: string;
          p_web_leads?: number;
          p_web_sold?: number;
          p_web_revenue?: number;
          p_calls?: number;
          p_calls_converted?: number;
          p_calls_revenue?: number;
        };
        Returns: undefined;
      };
    };
    Enums: Record<string, never>;
    CompositeTypes: Record<string, never>;
  };
}

// ============================================
// Helper Types for easier usage
// ============================================

// Leads
export type Lead = Database['public']['Tables']['leads']['Row'];
export type LeadInsert = Database['public']['Tables']['leads']['Insert'];
export type LeadUpdate = Database['public']['Tables']['leads']['Update'];

// Calls
export type Call = Database['public']['Tables']['calls']['Row'];
export type CallInsert = Database['public']['Tables']['calls']['Insert'];
export type CallUpdate = Database['public']['Tables']['calls']['Update'];

// Daily Stats
export type DailyStats = Database['public']['Tables']['daily_stats']['Row'];
export type DailyStatsInsert = Database['public']['Tables']['daily_stats']['Insert'];

// Pages
export type Page = Database['public']['Tables']['pages']['Row'];
export type PageInsert = Database['public']['Tables']['pages']['Insert'];
export type PageUpdate = Database['public']['Tables']['pages']['Update'];

// Buyers
export type Buyer = Database['public']['Tables']['buyers']['Row'];
export type BuyerInsert = Database['public']['Tables']['buyers']['Insert'];
export type BuyerUpdate = Database['public']['Tables']['buyers']['Update'];

// Property Cache
export type PropertyCache = Database['public']['Tables']['property_cache']['Row'];
export type PropertyCacheInsert = Database['public']['Tables']['property_cache']['Insert'];

// Enrichment Logs
export type EnrichmentLog = Database['public']['Tables']['enrichment_logs']['Row'];
export type EnrichmentLogInsert = Database['public']['Tables']['enrichment_logs']['Insert'];

// ============================================
// Enum-like types for consistency
// ============================================

export type Vertical = 'hvac' | 'plumbing' | 'roofing';

export type Urgency = 'emergency' | 'urgent' | 'planned';

export type PropertyType = 'single-family' | 'multi-family' | 'commercial';

export type LeadStatus = 'new' | 'processing' | 'sold' | 'rejected' | 'nurture';

export type PingStatus = 'pending' | 'sent' | 'bid_received' | 'no_bid';

export type PostStatus = 'pending' | 'accepted' | 'rejected';

export type ScoreTier = 'premium' | 'good' | 'standard' | 'nurture';

export type BuyerType = 'service_direct' | 'elocal' | 'direct';

export type EnrichmentStep = 'smarty' | 'shovels' | 'rentcast' | 'census' | 'gemini';

export type EnrichmentStatus = 'success' | 'error' | 'cached';
