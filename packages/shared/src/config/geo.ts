// Geographic configuration for Southeast US

export interface City {
  name: string;
  slug: string;
  state: string;
  stateSlug: string;
  population: number;
  metro?: string;
  enabled: boolean;
}

export interface State {
  name: string;
  slug: string;
  abbreviation: string;
  enabled: boolean;
}

export const states: Record<string, State> = {
  fl: { name: 'Florida', slug: 'fl', abbreviation: 'FL', enabled: true },
  ga: { name: 'Georgia', slug: 'ga', abbreviation: 'GA', enabled: true },
  al: { name: 'Alabama', slug: 'al', abbreviation: 'AL', enabled: true },
  sc: { name: 'South Carolina', slug: 'sc', abbreviation: 'SC', enabled: true },
  nc: { name: 'North Carolina', slug: 'nc', abbreviation: 'NC', enabled: true },
  tn: { name: 'Tennessee', slug: 'tn', abbreviation: 'TN', enabled: true },
  ms: { name: 'Mississippi', slug: 'ms', abbreviation: 'MS', enabled: false },
  la: { name: 'Louisiana', slug: 'la', abbreviation: 'LA', enabled: false },
};

export const cities: City[] = [
  // Florida
  { name: 'Tampa', slug: 'tampa', state: 'Florida', stateSlug: 'fl', population: 384959, metro: 'Tampa Bay', enabled: true },
  { name: 'St. Petersburg', slug: 'st-petersburg', state: 'Florida', stateSlug: 'fl', population: 258308, metro: 'Tampa Bay', enabled: true },
  { name: 'Clearwater', slug: 'clearwater', state: 'Florida', stateSlug: 'fl', population: 117292, metro: 'Tampa Bay', enabled: true },
  { name: 'Orlando', slug: 'orlando', state: 'Florida', stateSlug: 'fl', population: 307573, metro: 'Orlando', enabled: true },
  { name: 'Jacksonville', slug: 'jacksonville', state: 'Florida', stateSlug: 'fl', population: 949611, metro: 'Jacksonville', enabled: true },
  { name: 'Miami', slug: 'miami', state: 'Florida', stateSlug: 'fl', population: 442241, metro: 'Miami', enabled: true },
  { name: 'Fort Lauderdale', slug: 'fort-lauderdale', state: 'Florida', stateSlug: 'fl', population: 182760, metro: 'Miami', enabled: true },
  { name: 'Sarasota', slug: 'sarasota', state: 'Florida', stateSlug: 'fl', population: 57738, metro: 'Sarasota', enabled: true },
  { name: 'Lakeland', slug: 'lakeland', state: 'Florida', stateSlug: 'fl', population: 112641, metro: 'Lakeland', enabled: true },
  { name: 'Brandon', slug: 'brandon', state: 'Florida', stateSlug: 'fl', population: 115911, metro: 'Tampa Bay', enabled: true },

  // Georgia
  { name: 'Atlanta', slug: 'atlanta', state: 'Georgia', stateSlug: 'ga', population: 498715, metro: 'Atlanta', enabled: true },
  { name: 'Savannah', slug: 'savannah', state: 'Georgia', stateSlug: 'ga', population: 147780, metro: 'Savannah', enabled: true },
  { name: 'Augusta', slug: 'augusta', state: 'Georgia', stateSlug: 'ga', population: 202081, metro: 'Augusta', enabled: true },
  { name: 'Marietta', slug: 'marietta', state: 'Georgia', stateSlug: 'ga', population: 60867, metro: 'Atlanta', enabled: true },
  { name: 'Alpharetta', slug: 'alpharetta', state: 'Georgia', stateSlug: 'ga', population: 67213, metro: 'Atlanta', enabled: true },

  // Alabama
  { name: 'Birmingham', slug: 'birmingham', state: 'Alabama', stateSlug: 'al', population: 200733, metro: 'Birmingham', enabled: true },
  { name: 'Montgomery', slug: 'montgomery', state: 'Alabama', stateSlug: 'al', population: 200603, metro: 'Montgomery', enabled: true },
  { name: 'Mobile', slug: 'mobile', state: 'Alabama', stateSlug: 'al', population: 187041, metro: 'Mobile', enabled: true },
  { name: 'Huntsville', slug: 'huntsville', state: 'Alabama', stateSlug: 'al', population: 215006, metro: 'Huntsville', enabled: true },

  // South Carolina
  { name: 'Charleston', slug: 'charleston', state: 'South Carolina', stateSlug: 'sc', population: 150227, metro: 'Charleston', enabled: true },
  { name: 'Columbia', slug: 'columbia', state: 'South Carolina', stateSlug: 'sc', population: 136632, metro: 'Columbia', enabled: true },
  { name: 'Greenville', slug: 'greenville', state: 'South Carolina', stateSlug: 'sc', population: 72095, metro: 'Greenville', enabled: true },
  { name: 'Myrtle Beach', slug: 'myrtle-beach', state: 'South Carolina', stateSlug: 'sc', population: 35682, metro: 'Myrtle Beach', enabled: true },

  // North Carolina
  { name: 'Charlotte', slug: 'charlotte', state: 'North Carolina', stateSlug: 'nc', population: 874579, metro: 'Charlotte', enabled: true },
  { name: 'Raleigh', slug: 'raleigh', state: 'North Carolina', stateSlug: 'nc', population: 467665, metro: 'Raleigh', enabled: true },
  { name: 'Durham', slug: 'durham', state: 'North Carolina', stateSlug: 'nc', population: 283506, metro: 'Raleigh', enabled: true },
  { name: 'Greensboro', slug: 'greensboro', state: 'North Carolina', stateSlug: 'nc', population: 299035, metro: 'Greensboro', enabled: true },
  { name: 'Wilmington', slug: 'wilmington', state: 'North Carolina', stateSlug: 'nc', population: 115451, metro: 'Wilmington', enabled: true },

  // Tennessee
  { name: 'Nashville', slug: 'nashville', state: 'Tennessee', stateSlug: 'tn', population: 689447, metro: 'Nashville', enabled: true },
  { name: 'Memphis', slug: 'memphis', state: 'Tennessee', stateSlug: 'tn', population: 633104, metro: 'Memphis', enabled: true },
  { name: 'Knoxville', slug: 'knoxville', state: 'Tennessee', stateSlug: 'tn', population: 190740, metro: 'Knoxville', enabled: true },
  { name: 'Chattanooga', slug: 'chattanooga', state: 'Tennessee', stateSlug: 'tn', population: 181099, metro: 'Chattanooga', enabled: true },
];

export function getState(slug: string): State | undefined {
  return states[slug.toLowerCase()];
}

export function getCity(slug: string, stateSlug?: string): City | undefined {
  if (stateSlug) {
    return cities.find(c => c.slug === slug && c.stateSlug === stateSlug.toLowerCase());
  }
  return cities.find(c => c.slug === slug);
}

export function getCitiesByState(stateSlug: string): City[] {
  return cities.filter(c => c.stateSlug === stateSlug.toLowerCase() && c.enabled);
}

export function getEnabledStates(): State[] {
  return Object.values(states).filter(s => s.enabled);
}

export function getEnabledCities(): City[] {
  return cities.filter(c => c.enabled);
}

export function isValidState(slug: string): boolean {
  const state = states[slug.toLowerCase()];
  return state?.enabled ?? false;
}

export function isValidCity(citySlug: string, stateSlug: string): boolean {
  const city = getCity(citySlug, stateSlug);
  return city?.enabled ?? false;
}

// Generate all valid URL paths
export function getAllPaths(): { state: string; city: string }[] {
  const paths: { state: string; city: string }[] = [];

  for (const city of getEnabledCities()) {
    paths.push({
      state: city.stateSlug,
      city: city.slug,
    });
  }

  return paths;
}
