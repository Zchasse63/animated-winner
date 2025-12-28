// Service configuration

export interface Service {
  id: string;
  slug: string;
  name: string;
  shortName: string;
  description: string;
  icon: string;
  vertical: string;
  avgLeadValue: number;
  keywords: string[];
  urgencyWeight: {
    emergency: number;
    urgent: number;
    planned: number;
  };
}

export const services: Record<string, Service> = {
  // HVAC Services
  'ac-repair': {
    id: 'ac-repair',
    slug: 'ac-repair',
    name: 'AC Repair',
    shortName: 'AC Repair',
    description: 'Fast, reliable air conditioning repair services',
    icon: '❄️',
    vertical: 'hvac',
    avgLeadValue: 85,
    keywords: ['ac repair', 'air conditioner repair', 'ac not working', 'ac broken'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  'heating-repair': {
    id: 'heating-repair',
    slug: 'heating-repair',
    name: 'Heating Repair',
    shortName: 'Heating',
    description: 'Expert heating and furnace repair services',
    icon: '🔥',
    vertical: 'hvac',
    avgLeadValue: 80,
    keywords: ['heating repair', 'furnace repair', 'heater not working', 'no heat'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  'hvac-installation': {
    id: 'hvac-installation',
    slug: 'hvac-installation',
    name: 'HVAC Installation',
    shortName: 'Installation',
    description: 'Professional HVAC system installation',
    icon: '🏠',
    vertical: 'hvac',
    avgLeadValue: 150,
    keywords: ['hvac installation', 'new ac', 'ac replacement', 'new furnace'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.3 },
  },
  'maintenance': {
    id: 'maintenance',
    slug: 'maintenance',
    name: 'Maintenance/Tune-Up',
    shortName: 'Tune-Up',
    description: 'Regular HVAC maintenance and tune-up services',
    icon: '🔧',
    vertical: 'hvac',
    avgLeadValue: 45,
    keywords: ['hvac maintenance', 'ac tune up', 'hvac service', 'ac cleaning'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.2 },
  },

  // Plumbing Services
  'drain-cleaning': {
    id: 'drain-cleaning',
    slug: 'drain-cleaning',
    name: 'Drain Cleaning',
    shortName: 'Drain',
    description: 'Professional drain cleaning and unclogging',
    icon: '🚿',
    vertical: 'plumbing',
    avgLeadValue: 65,
    keywords: ['drain cleaning', 'clogged drain', 'slow drain', 'drain clog'],
    urgencyWeight: { emergency: 1.4, urgent: 1.2, planned: 1.0 },
  },
  'water-heater': {
    id: 'water-heater',
    slug: 'water-heater',
    name: 'Water Heater Service',
    shortName: 'Water Heater',
    description: 'Water heater repair and installation',
    icon: '🔥',
    vertical: 'plumbing',
    avgLeadValue: 95,
    keywords: ['water heater', 'no hot water', 'water heater repair', 'tankless'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.1 },
  },
  'leak-repair': {
    id: 'leak-repair',
    slug: 'leak-repair',
    name: 'Leak Repair',
    shortName: 'Leak Repair',
    description: 'Fast leak detection and repair',
    icon: '💧',
    vertical: 'plumbing',
    avgLeadValue: 75,
    keywords: ['leak repair', 'water leak', 'pipe leak', 'faucet leak'],
    urgencyWeight: { emergency: 1.6, urgent: 1.3, planned: 1.0 },
  },
  'pipe-repair': {
    id: 'pipe-repair',
    slug: 'pipe-repair',
    name: 'Pipe Repair',
    shortName: 'Pipe Repair',
    description: 'Expert pipe repair and replacement',
    icon: '🔧',
    vertical: 'plumbing',
    avgLeadValue: 85,
    keywords: ['pipe repair', 'broken pipe', 'burst pipe', 'pipe replacement'],
    urgencyWeight: { emergency: 1.7, urgent: 1.3, planned: 1.0 },
  },

  // Roofing Services
  'roof-repair': {
    id: 'roof-repair',
    slug: 'roof-repair',
    name: 'Roof Repair',
    shortName: 'Repair',
    description: 'Professional roof repair services',
    icon: '🏠',
    vertical: 'roofing',
    avgLeadValue: 120,
    keywords: ['roof repair', 'roof leak', 'damaged roof', 'fix roof'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  'roof-replacement': {
    id: 'roof-replacement',
    slug: 'roof-replacement',
    name: 'Roof Replacement',
    shortName: 'Replacement',
    description: 'Complete roof replacement services',
    icon: '🏗️',
    vertical: 'roofing',
    avgLeadValue: 200,
    keywords: ['roof replacement', 'new roof', 're-roof', 'roof installation'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.4 },
  },
  'roof-inspection': {
    id: 'roof-inspection',
    slug: 'roof-inspection',
    name: 'Roof Inspection',
    shortName: 'Inspection',
    description: 'Thorough roof inspection services',
    icon: '🔍',
    vertical: 'roofing',
    avgLeadValue: 40,
    keywords: ['roof inspection', 'roof check', 'roof assessment', 'roof survey'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.3 },
  },
  'storm-damage': {
    id: 'storm-damage',
    slug: 'storm-damage',
    name: 'Storm Damage Repair',
    shortName: 'Storm Damage',
    description: 'Emergency storm damage repair',
    icon: '⛈️',
    vertical: 'roofing',
    avgLeadValue: 150,
    keywords: ['storm damage', 'hurricane damage', 'wind damage', 'hail damage'],
    urgencyWeight: { emergency: 1.8, urgent: 1.4, planned: 1.0 },
  },
};

export const serviceList = Object.values(services);

export function getService(slug: string): Service | undefined {
  return services[slug];
}

export function getServicesByVertical(vertical: string): Service[] {
  return serviceList.filter(s => s.vertical === vertical);
}

export function isValidService(slug: string): boolean {
  return slug in services;
}

export function isServiceInVertical(serviceSlug: string, verticalSlug: string): boolean {
  const service = services[serviceSlug];
  return service?.vertical === verticalSlug;
}
