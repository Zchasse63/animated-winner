// Plumbing Vertical Configuration

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
  id: 'plumbing',
  name: 'Plumbing',
  slug: 'plumbing',
  description: 'Professional plumbing services',
};

export const services: Service[] = [
  {
    id: 'drain-cleaning',
    slug: 'drain-cleaning',
    name: 'Drain Cleaning',
    shortName: 'Drain Cleaning',
    description: 'Professional drain cleaning and unclogging',
    icon: '🚿',
    avgLeadValue: 65,
    keywords: ['drain cleaning', 'clogged drain', 'slow drain', 'drain clog'],
    urgencyWeight: { emergency: 1.4, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'leak-repair',
    slug: 'leak-repair',
    name: 'Leak Repair',
    shortName: 'Leak Repair',
    description: 'Fast leak detection and repair',
    icon: '💧',
    avgLeadValue: 75,
    keywords: ['leak repair', 'water leak', 'pipe leak', 'faucet leak'],
    urgencyWeight: { emergency: 1.6, urgent: 1.3, planned: 1.0 },
  },
  {
    id: 'pipe-repair',
    slug: 'pipe-repair',
    name: 'Pipe Repair',
    shortName: 'Pipe Repair',
    description: 'Expert pipe repair and replacement',
    icon: '🔧',
    avgLeadValue: 85,
    keywords: ['pipe repair', 'broken pipe', 'burst pipe', 'pipe replacement'],
    urgencyWeight: { emergency: 1.7, urgent: 1.3, planned: 1.0 },
  },
  {
    id: 'water-heater-repair',
    slug: 'water-heater-repair',
    name: 'Water Heater Repair',
    shortName: 'Water Heater Repair',
    description: 'Expert water heater repair services',
    icon: '🔥',
    avgLeadValue: 90,
    keywords: ['water heater repair', 'no hot water', 'water heater broken', 'fix water heater'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.1 },
  },
  {
    id: 'water-heater-installation',
    slug: 'water-heater-installation',
    name: 'Water Heater Installation',
    shortName: 'Water Heater Installation',
    description: 'Professional water heater installation services',
    icon: '🔥',
    avgLeadValue: 120,
    keywords: ['water heater installation', 'new water heater', 'tankless water heater', 'install water heater'],
    urgencyWeight: { emergency: 1.3, urgent: 1.2, planned: 1.2 },
  },
  {
    id: 'toilet-repair',
    slug: 'toilet-repair',
    name: 'Toilet Repair',
    shortName: 'Toilet Repair',
    description: 'Expert toilet repair and replacement',
    icon: '🚽',
    avgLeadValue: 55,
    keywords: ['toilet repair', 'toilet broken', 'running toilet', 'toilet leaking'],
    urgencyWeight: { emergency: 1.4, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'faucet-repair',
    slug: 'faucet-repair',
    name: 'Faucet Repair',
    shortName: 'Faucet Repair',
    description: 'Professional faucet repair and installation',
    icon: '🚰',
    avgLeadValue: 50,
    keywords: ['faucet repair', 'leaky faucet', 'dripping faucet', 'faucet installation'],
    urgencyWeight: { emergency: 1.2, urgent: 1.1, planned: 1.0 },
  },
  {
    id: 'sewer-line-repair',
    slug: 'sewer-line-repair',
    name: 'Sewer Line Repair',
    shortName: 'Sewer Line',
    description: 'Expert sewer line repair and replacement',
    icon: '🔧',
    avgLeadValue: 150,
    keywords: ['sewer line repair', 'sewer backup', 'sewer line replacement', 'main sewer line'],
    urgencyWeight: { emergency: 1.8, urgent: 1.4, planned: 1.0 },
  },
  {
    id: 'garbage-disposal',
    slug: 'garbage-disposal',
    name: 'Garbage Disposal',
    shortName: 'Garbage Disposal',
    description: 'Garbage disposal repair and installation',
    icon: '🗑️',
    avgLeadValue: 45,
    keywords: ['garbage disposal', 'disposal repair', 'disposal installation', 'disposal broken'],
    urgencyWeight: { emergency: 1.1, urgent: 1.0, planned: 1.0 },
  },
  {
    id: 'sump-pump',
    slug: 'sump-pump',
    name: 'Sump Pump Service',
    shortName: 'Sump Pump',
    description: 'Sump pump installation, repair, and maintenance',
    icon: '⚙️',
    avgLeadValue: 70,
    keywords: ['sump pump', 'sump pump repair', 'sump pump installation', 'basement flooding'],
    urgencyWeight: { emergency: 1.6, urgent: 1.3, planned: 1.1 },
  },
  {
    id: 'emergency-plumbing',
    slug: 'emergency-plumbing',
    name: 'Emergency Plumbing',
    shortName: 'Emergency',
    description: '24/7 emergency plumbing services',
    icon: '🚨',
    avgLeadValue: 110,
    keywords: ['emergency plumbing', '24/7 plumber', 'emergency plumber', 'plumbing emergency'],
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
