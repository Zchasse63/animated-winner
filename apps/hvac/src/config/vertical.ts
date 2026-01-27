// HVAC Vertical Configuration

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
  id: 'hvac',
  name: 'HVAC',
  slug: 'hvac',
  description: 'Heating, Ventilation, and Air Conditioning services',
};

export const services: Service[] = [
  {
    id: 'ac-repair',
    slug: 'ac-repair',
    name: 'AC Repair',
    shortName: 'AC Repair',
    description: 'Fast, reliable air conditioning repair services',
    icon: '❄️',
    avgLeadValue: 85,
    keywords: ['ac repair', 'air conditioner repair', 'ac not working', 'ac broken'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'ac-installation',
    slug: 'ac-installation',
    name: 'AC Installation',
    shortName: 'AC Installation',
    description: 'Professional air conditioning installation services',
    icon: '❄️',
    avgLeadValue: 150,
    keywords: ['ac installation', 'new ac', 'ac replacement', 'install air conditioner'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.3 },
  },
  {
    id: 'ac-maintenance',
    slug: 'ac-maintenance',
    name: 'AC Maintenance',
    shortName: 'AC Maintenance',
    description: 'Regular air conditioning maintenance and tune-up services',
    icon: '🔧',
    avgLeadValue: 45,
    keywords: ['ac maintenance', 'ac tune up', 'ac service', 'ac cleaning'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.2 },
  },
  {
    id: 'heating-repair',
    slug: 'heating-repair',
    name: 'Heating Repair',
    shortName: 'Heating Repair',
    description: 'Expert heating and furnace repair services',
    icon: '🔥',
    avgLeadValue: 80,
    keywords: ['heating repair', 'furnace repair', 'heater not working', 'no heat'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'heating-installation',
    slug: 'heating-installation',
    name: 'Heating Installation',
    shortName: 'Heating Installation',
    description: 'Professional heating system installation',
    icon: '🔥',
    avgLeadValue: 140,
    keywords: ['heating installation', 'new furnace', 'furnace replacement', 'install heater'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.3 },
  },
  {
    id: 'furnace-repair',
    slug: 'furnace-repair',
    name: 'Furnace Repair',
    shortName: 'Furnace Repair',
    description: 'Expert furnace repair and maintenance',
    icon: '🔥',
    avgLeadValue: 85,
    keywords: ['furnace repair', 'furnace broken', 'furnace not working', 'fix furnace'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'furnace-installation',
    slug: 'furnace-installation',
    name: 'Furnace Installation',
    shortName: 'Furnace Installation',
    description: 'Professional furnace installation services',
    icon: '🔥',
    avgLeadValue: 145,
    keywords: ['furnace installation', 'new furnace', 'furnace replacement', 'install furnace'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.3 },
  },
  {
    id: 'heat-pump-repair',
    slug: 'heat-pump-repair',
    name: 'Heat Pump Repair',
    shortName: 'Heat Pump Repair',
    description: 'Expert heat pump repair services',
    icon: '♨️',
    avgLeadValue: 90,
    keywords: ['heat pump repair', 'heat pump broken', 'heat pump not working', 'fix heat pump'],
    urgencyWeight: { emergency: 1.5, urgent: 1.2, planned: 1.0 },
  },
  {
    id: 'heat-pump-installation',
    slug: 'heat-pump-installation',
    name: 'Heat Pump Installation',
    shortName: 'Heat Pump Installation',
    description: 'Professional heat pump installation',
    icon: '♨️',
    avgLeadValue: 155,
    keywords: ['heat pump installation', 'new heat pump', 'heat pump replacement', 'install heat pump'],
    urgencyWeight: { emergency: 1.0, urgent: 1.1, planned: 1.3 },
  },
  {
    id: 'duct-cleaning',
    slug: 'duct-cleaning',
    name: 'Duct Cleaning',
    shortName: 'Duct Cleaning',
    description: 'Professional air duct cleaning services',
    icon: '💨',
    avgLeadValue: 60,
    keywords: ['duct cleaning', 'air duct cleaning', 'clean ducts', 'ductwork cleaning'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.2 },
  },
  {
    id: 'duct-repair',
    slug: 'duct-repair',
    name: 'Duct Repair',
    shortName: 'Duct Repair',
    description: 'Expert air duct repair and sealing',
    icon: '💨',
    avgLeadValue: 75,
    keywords: ['duct repair', 'air duct repair', 'ductwork repair', 'seal ducts'],
    urgencyWeight: { emergency: 1.3, urgent: 1.1, planned: 1.0 },
  },
  {
    id: 'thermostat-installation',
    slug: 'thermostat-installation',
    name: 'Thermostat Installation',
    shortName: 'Thermostat',
    description: 'Smart and programmable thermostat installation',
    icon: '🌡️',
    avgLeadValue: 35,
    keywords: ['thermostat installation', 'smart thermostat', 'install thermostat', 'nest installation'],
    urgencyWeight: { emergency: 0.7, urgent: 0.9, planned: 1.3 },
  },
  {
    id: 'indoor-air-quality',
    slug: 'indoor-air-quality',
    name: 'Indoor Air Quality',
    shortName: 'Air Quality',
    description: 'Indoor air quality testing and improvement services',
    icon: '🌬️',
    avgLeadValue: 55,
    keywords: ['indoor air quality', 'air purification', 'air quality testing', 'hvac air quality'],
    urgencyWeight: { emergency: 0.8, urgent: 1.0, planned: 1.2 },
  },
  {
    id: 'emergency-hvac',
    slug: 'emergency-hvac',
    name: 'Emergency HVAC Service',
    shortName: 'Emergency',
    description: '24/7 emergency HVAC repair services',
    icon: '🚨',
    avgLeadValue: 120,
    keywords: ['emergency hvac', '24/7 hvac', 'emergency ac repair', 'emergency heating repair'],
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
