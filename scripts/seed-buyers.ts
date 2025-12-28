/**
 * Seed script to add sample buyers for testing
 * Run with: npx tsx scripts/seed-buyers.ts
 */

import { createClient } from '@supabase/supabase-js';

// Load environment variables
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('Missing Supabase credentials. Set SUPABASE_URL and SUPABASE_SERVICE_KEY.');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const sampleBuyers = [
  {
    name: 'Tampa Bay HVAC Pros',
    type: 'ping-post',
    verticals: ['hvac'],
    states: ['FL'],
    cities: ['Tampa', 'St. Petersburg', 'Clearwater', 'Brandon'],
    ping_url: 'https://api.example.com/leads/ping',
    post_url: 'https://api.example.com/leads/post',
    api_key: 'sample_key_1',
    is_active: true,
    daily_cap: 50,
    exclusive_price: 85.00,
    shared_price: 25.00,
    priority: 1,
  },
  {
    name: 'Florida Plumbing Network',
    type: 'direct',
    verticals: ['plumbing'],
    states: ['FL'],
    cities: null, // All cities in FL
    ping_url: null,
    post_url: 'https://api.flplumbing.example.com/leads',
    api_key: 'sample_key_2',
    is_active: true,
    daily_cap: 100,
    exclusive_price: 75.00,
    shared_price: 20.00,
    priority: 2,
  },
  {
    name: 'Southeast Roofing Contractors',
    type: 'ping-post',
    verticals: ['roofing'],
    states: ['FL', 'GA', 'AL', 'SC'],
    cities: null,
    ping_url: 'https://api.seroofing.example.com/ping',
    post_url: 'https://api.seroofing.example.com/post',
    api_key: 'sample_key_3',
    is_active: true,
    daily_cap: 75,
    exclusive_price: 150.00,
    shared_price: 45.00,
    priority: 1,
  },
  {
    name: 'Service Direct',
    type: 'ping-post',
    verticals: ['hvac', 'plumbing', 'roofing'],
    states: ['FL', 'GA', 'AL', 'SC', 'NC', 'TN'],
    cities: null,
    ping_url: 'https://api.servicedirect.com/v1/ping',
    post_url: 'https://api.servicedirect.com/v1/post',
    api_key: 'sd_live_key_placeholder',
    is_active: false, // Enable when you have real credentials
    daily_cap: 500,
    exclusive_price: 0, // Dynamic pricing
    shared_price: 0,
    priority: 10,
  },
];

async function seedBuyers() {
  console.log('🌱 Starting buyer seeding...\n');

  for (const buyer of sampleBuyers) {
    const { error } = await supabase
      .from('buyers')
      .upsert(buyer, { onConflict: 'name' });

    if (error) {
      console.error(`❌ Error inserting ${buyer.name}:`, error.message);
    } else {
      console.log(`✅ Inserted buyer: ${buyer.name}`);
    }
  }

  console.log('\n🎉 Done seeding buyers!');
}

seedBuyers().catch(console.error);
