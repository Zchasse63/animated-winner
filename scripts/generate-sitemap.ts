/**
 * Generate sitemap.xml for all dynamic pages
 * Run with: npx tsx scripts/generate-sitemap.ts > public/sitemap.xml
 */

import { getEnabledCities } from '../src/config/geo';
import { verticalList } from '../src/config/verticals';
import { serviceList } from '../src/config/services';

const BASE_URL = process.env.SITE_URL || 'https://homeserviceleads.com';

function generateSitemap() {
  const urls: { loc: string; priority: string; changefreq: string }[] = [];

  // Homepage
  urls.push({
    loc: BASE_URL,
    priority: '1.0',
    changefreq: 'daily',
  });

  // Dynamic pages
  const cities = getEnabledCities();

  for (const city of cities) {
    for (const vertical of verticalList) {
      for (const service of serviceList) {
        if (service.vertical !== vertical.id) continue;

        const path = `/${city.stateSlug}/${city.slug}/${vertical.slug}/${service.slug}/`;

        urls.push({
          loc: `${BASE_URL}${path}`,
          priority: '0.8',
          changefreq: 'weekly',
        });
      }
    }
  }

  // Build XML
  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls
  .map(
    (url) => `  <url>
    <loc>${url.loc}</loc>
    <changefreq>${url.changefreq}</changefreq>
    <priority>${url.priority}</priority>
  </url>`
  )
  .join('\n')}
</urlset>`;

  console.log(xml);
}

generateSitemap();
