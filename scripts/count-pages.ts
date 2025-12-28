/**
 * Utility to count total generated pages
 * Run with: npx tsx scripts/count-pages.ts
 */

import { getEnabledCities } from '../src/config/geo';
import { verticalList } from '../src/config/verticals';
import { serviceList } from '../src/config/services';

function countPages() {
  const cities = getEnabledCities();
  let total = 0;
  const breakdown: Record<string, Record<string, number>> = {};

  for (const city of cities) {
    if (!breakdown[city.stateSlug]) {
      breakdown[city.stateSlug] = {};
    }

    for (const vertical of verticalList) {
      if (!breakdown[city.stateSlug][vertical.id]) {
        breakdown[city.stateSlug][vertical.id] = 0;
      }

      for (const service of serviceList) {
        if (service.vertical === vertical.id) {
          total++;
          breakdown[city.stateSlug][vertical.id]++;
        }
      }
    }
  }

  console.log('📊 Page Count Summary\n');
  console.log(`Total Cities: ${cities.length}`);
  console.log(`Total Verticals: ${verticalList.length}`);
  console.log(`Total Services: ${serviceList.length}`);
  console.log(`\n🌐 Total Pages: ${total}\n`);

  console.log('By State & Vertical:');
  for (const [state, verticals] of Object.entries(breakdown)) {
    console.log(`\n  ${state.toUpperCase()}:`);
    for (const [vertical, count] of Object.entries(verticals)) {
      console.log(`    ${vertical}: ${count} pages`);
    }
  }

  console.log('\n📈 Estimated build time: ~' + Math.ceil(total / 100) + ' minutes');
}

countPages();
