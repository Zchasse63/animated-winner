import { z } from 'zod';

const serviceStepSchema = z.object({
  serviceType: z.enum(["ac-repair", "heating-repair", "hvac-installation", "maintenance", "drain-cleaning", "water-heater", "leak-repair", "pipe-repair", "roof-repair", "roof-replacement", "roof-inspection", "storm-damage"], {
    required_error: "Please select a service type"
  }),
  urgency: z.enum(["emergency", "urgent", "planned"], {
    required_error: "Please select urgency level"
  })
});
const propertyStepSchema = z.object({
  propertyType: z.enum(["single-family", "multi-family", "commercial"], {
    required_error: "Please select property type"
  }),
  address: z.string().min(5, "Please enter your street address"),
  city: z.string().min(2, "Please enter your city"),
  state: z.string().length(2, "Please select your state"),
  zip: z.string().regex(/^\d{5}$/, "Please enter a valid 5-digit ZIP code")
});
const contactStepSchema = z.object({
  name: z.string().min(2, "Please enter your full name"),
  email: z.string().email("Please enter a valid email address"),
  phone: z.string().regex(/^\(\d{3}\) \d{3}-\d{4}$/, "Please enter a valid phone number"),
  bestTime: z.enum(["morning", "afternoon", "evening", "anytime"]).optional(),
  tcpaConsent: z.literal(true, {
    errorMap: () => ({ message: "You must agree to receive calls and texts" })
  })
});
const leadFormSchema = serviceStepSchema.merge(propertyStepSchema).merge(contactStepSchema);
const serviceOptions = {
  hvac: [
    { value: "ac-repair", label: "AC Repair", icon: "❄️" },
    { value: "heating-repair", label: "Heating Repair", icon: "🔥" },
    { value: "hvac-installation", label: "New Installation", icon: "🏠" },
    { value: "maintenance", label: "Tune-Up", icon: "🔧" }
  ],
  plumbing: [
    { value: "drain-cleaning", label: "Drain Cleaning", icon: "🚿" },
    { value: "water-heater", label: "Water Heater", icon: "🔥" },
    { value: "leak-repair", label: "Leak Repair", icon: "💧" },
    { value: "pipe-repair", label: "Pipe Repair", icon: "🔧" }
  ],
  roofing: [
    { value: "roof-repair", label: "Roof Repair", icon: "🏠" },
    { value: "roof-replacement", label: "Replacement", icon: "🏗️" },
    { value: "roof-inspection", label: "Inspection", icon: "🔍" },
    { value: "storm-damage", label: "Storm Damage", icon: "⛈️" }
  ]
};
const urgencyOptions = [
  { value: "emergency", label: "Emergency", description: "Need help NOW", color: "red" },
  { value: "urgent", label: "Soon", description: "Within 48 hours", color: "orange" },
  { value: "planned", label: "Planning", description: "Just getting quotes", color: "gray" }
];
const propertyTypeOptions = [
  { value: "single-family", label: "Single Family", icon: "🏠" },
  { value: "multi-family", label: "Multi-Family", icon: "🏢" },
  { value: "commercial", label: "Commercial", icon: "🏬" }
];
const bestTimeOptions = [
  { value: "morning", label: "Morning (8am-12pm)" },
  { value: "afternoon", label: "Afternoon (12pm-5pm)" },
  { value: "evening", label: "Evening (5pm-8pm)" },
  { value: "anytime", label: "Anytime" }
];
const stateOptions = [
  { value: "FL", label: "Florida" },
  { value: "GA", label: "Georgia" },
  { value: "AL", label: "Alabama" },
  { value: "SC", label: "South Carolina" },
  { value: "NC", label: "North Carolina" },
  { value: "TN", label: "Tennessee" },
  { value: "MS", label: "Mississippi" },
  { value: "LA", label: "Louisiana" }
];
function formatPhoneNumber(value) {
  const cleaned = value.replace(/\D/g, "");
  const match = cleaned.match(/^(\d{0,3})(\d{0,3})(\d{0,4})$/);
  if (!match) return value;
  const [, area, prefix, line] = match;
  if (line) return `(${area}) ${prefix}-${line}`;
  if (prefix) return `(${area}) ${prefix}`;
  if (area) return `(${area}`;
  return "";
}

export { stateOptions as a, bestTimeOptions as b, serviceStepSchema as c, propertyStepSchema as d, contactStepSchema as e, formatPhoneNumber as f, leadFormSchema as l, propertyTypeOptions as p, serviceOptions as s, urgencyOptions as u };
