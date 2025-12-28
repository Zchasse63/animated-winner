/**
 * Seed script to generate page records in the database
 * Run with: npx tsx scripts/seed-pages.ts
 */

import { createClient } from '@supabase/supabase-js';
import { getEnabledCities } from '../src/config/geo';
import { verticalList } from '../src/config/verticals';
import { serviceList } from '../src/config/services';

// Load environment variables
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('Missing Supabase credentials. Set SUPABASE_URL and SUPABASE_SERVICE_KEY.');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function seedPages() {
  console.log('🌱 Starting page seeding...\n');

  const pages: {
    slug: string;
    state: string;
    city: string;
    vertical: string;
    service: string;
    meta_title: string;
    meta_description: string;
    is_active: boolean;
  }[] = [];

  const cities = getEnabledCities();

  for (const city of cities) {
    for (const vertical of verticalList) {
      for (const service of serviceList) {
        if (service.vertical !== vertical.id) continue;

        const slug = `/${city.stateSlug}/${city.slug}/${vertical.slug}/${service.slug}/`;
        const metaTitle = `${service.name} in ${city.name}, ${city.stateSlug.toUpperCase()} | Free Quotes`;
        const metaDescription = `Need ${service.name.toLowerCase()} in ${city.name}? Get free quotes from top-rated local ${vertical.name.toLowerCase()} pros. Fast response, no obligation!`;

        pages.push({
          slug,
          state: city.stateSlug.toUpperCase(),
          city: city.name,
          vertical: vertical.id,
          service: service.id,
          meta_title: metaTitle,
          meta_description: metaDescription,
          is_active: true,
        });
      }
    }
  }

  console.log(`📄 Generated ${pages.length} page records`);

  // Insert in batches of 100
  const batchSize = 100;
  let inserted = 0;

  for (let i = 0; i < pages.length; i += batchSize) {
    const batch = pages.slice(i, i + batchSize);

    const { error } = await supabase
      .from('pages')
      .upsert(batch, { onConflict: 'slug' });

    if (error) {
      console.error(`❌ Error inserting batch ${i / batchSize + 1}:`, error.message);
    } else {
      inserted += batch.length;
      console.log(`✅ Inserted batch ${i / batchSize + 1} (${inserted}/${pages.length})`);
    }
  }

  console.log(`\n🎉 Done! Inserted ${inserted} pages.`);
}

seedPages().catch(console.error);
