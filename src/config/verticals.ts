// Vertical (industry) configuration

export interface Vertical {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon: string;
  primaryColor: string;
  services: string[];
  keywords: string[];
}

export const verticals: Record<string, Vertical> = {
  hvac: {
    id: 'hvac',
    name: 'HVAC',
    slug: 'hvac',
    description: 'Heating, Ventilation & Air Conditioning',
    icon: '❄️',
    primaryColor: '#0891b2',
    services: ['ac-repair', 'heating-repair', 'hvac-installation', 'maintenance'],
    keywords: ['air conditioning', 'ac repair', 'heating', 'hvac', 'furnace', 'heat pump'],
  },
  plumbing: {
    id: 'plumbing',
    name: 'Plumbing',
    slug: 'plumbing',
    description: 'Professional Plumbing Services',
    icon: '🔧',
    primaryColor: '#0891b2',
    services: ['drain-cleaning', 'water-heater', 'leak-repair', 'pipe-repair'],
    keywords: ['plumber', 'plumbing', 'drain', 'water heater', 'leak', 'pipe'],
  },
  roofing: {
    id: 'roofing',
    name: 'Roofing',
    slug: 'roofing',
    description: 'Expert Roofing Services',
    icon: '🏠',
    primaryColor: '#0891b2',
    services: ['roof-repair', 'roof-replacement', 'roof-inspection', 'storm-damage'],
    keywords: ['roofing', 'roof repair', 'roof replacement', 'shingles', 'roof inspection'],
  },
};

export const verticalList = Object.values(verticals);

export function getVertical(slug: string): Vertical | undefined {
  return verticals[slug];
}

export function isValidVertical(slug: string): boolean {
  return slug in verticals;
}
