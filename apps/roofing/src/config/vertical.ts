// Roofing Vertical Configuration

export interface Service {
  id: string;
  slug: string;
  name: string;
  shortName: string;
  description: string;
  icon: string;
  avgLeadValue: number;
  keywords: string[];
  urgencyWeight: {
    emergency: number;
    urgent: number;
    planned: number;
  };
}

export const vertical = {
  id: 'roofing',
  name: 'Roofing',
  slug: 'roofing',
  description: 'Professional roofing services',
};

export const services: Service[] = [
  {
    id: 'roof-repair',
    slug: 'roof-repair',
    name: 'Roof Repair',
    shortName: 'Roof Repair',
    description: 'Professional roof repair services',
    icon: '🏠',
    avgLeadValue: 120,
    keywords: ['roof repair', 'roof leak', 'damaged roof', 'fix roof'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'roof-replacement',
    slug: 'roof-replacement',
    name: 'Roof Replacement',
    shortName: 'Roof Replacement',
    description: 'Complete roof replacement services',
    icon: '🏗️',
    avgLeadValue: 200,
    keywords: ['roof replacement', 'new roof', 're-roof', 'roof installation'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.4 },
  },
  {
    id: 'roof-inspection',
    slug: 'roof-inspection',
    name: 'Roof Inspection',
    shortName: 'Roof Inspection',
    description: 'Thorough roof inspection services',
    icon: '🔍',
    avgLeadValue: 40,
    keywords: ['roof inspection', 'roof check', 'roof assessment', 'roof survey'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.3 },
  },
  {
    id: 'shingle-repair',
    slug: 'shingle-repair',
    name: 'Shingle Repair',
    shortName: 'Shingle Repair',
    description: 'Expert shingle repair and replacement',
    icon: '🏚️',
    avgLeadValue: 85,
    keywords: ['shingle repair', 'missing shingles', 'replace shingles', 'shingle replacement'],
    urgencyWeight: { emergency: 1.4, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'metal-roofing',
    slug: 'metal-roofing',
    name: 'Metal Roofing',
    shortName: 'Metal Roofing',
    description: 'Metal roof installation and repair',
    icon: '🔩',
    avgLeadValue: 180,
    keywords: ['metal roofing', 'metal roof installation', 'steel roof', 'metal roof repair'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.4 },
  },
  {
    id: 'flat-roof-repair',
    slug: 'flat-roof-repair',
    name: 'Flat Roof Repair',
    shortName: 'Flat Roof',
    description: 'Professional flat roof repair services',
    icon: '📐',
    avgLeadValue: 95,
    keywords: ['flat roof repair', 'flat roof leak', 'commercial roof repair', 'flat roof maintenance'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'roof-leak-repair',
    slug: 'roof-leak-repair',
    name: 'Roof Leak Repair',
    shortName: 'Leak Repair',
    description: 'Emergency roof leak detection and repair',
    icon: '💧',
    avgLeadValue: 110,
    keywords: ['roof leak repair', 'leaking roof', 'roof leak detection', 'stop roof leak'],
    urgencyWeight: { emergency: 1.7, urgent: 1.3, planned: 1.0 },
  },
  {
    id: 'gutter-installation',
    slug: 'gutter-installation',
    name: 'Gutter Installation',
    shortName: 'Gutter Installation',
    description: 'Professional gutter installation services',
    icon: '🌧️',
    avgLeadValue: 75,
    keywords: ['gutter installation', 'new gutters', 'install gutters', 'gutter system'],
    urgencyWeight: { emergency: 0.9, urgent: 1.0, planned: 1.3 },
  },
  {
    id: 'gutter-repair',
    slug: 'gutter-repair',
    name: 'Gutter Repair',
    shortName: 'Gutter Repair',
    description: 'Expert gutter repair and cleaning',
    icon: '🌧️',
    avgLeadValue: 55,
    keywords: ['gutter repair', 'gutter cleaning', 'clogged gutters', 'fix gutters'],
    urgencyWeight: { emergency: 1.2, urgent: 1.1, planned: 1.0 },
  },
  {
    id: 'storm-damage',
    slug: 'storm-damage',
    name: 'Storm Damage Repair',
    shortName: 'Storm Damage',
    description: 'Emergency storm damage repair',
    icon: '⛈️',
    avgLeadValue: 150,
    keywords: ['storm damage', 'hurricane damage', 'wind damage', 'hail damage'],
    urgencyWeight: { emergency: 1.8, urgent: 1.4, planned: 1.0 },
  },
  {
    id: 'emergency-roofing',
    slug: 'emergency-roofing',
    name: 'Emergency Roofing',
    shortName: 'Emergency',
    description: '24/7 emergency roofing services',
    icon: '🚨',
    avgLeadValue: 130,
    keywords: ['emergency roofing', '24/7 roofer', 'emergency roof repair', 'roofing emergency'],
    urgencyWeight: { emergency: 2.0, urgent: 1.5, planned: 0.8 },
  },
];

export function getService(slug: string): Service | undefined {
  return services.find(s => s.slug === slug);
}

export function isValidService(slug: string): boolean {
  return services.some(s => s.slug === slug);
}

export function getAllServices(): Service[] {
  return services;
}
