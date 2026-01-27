// Phone utilities for call tracking

// Format phone number for display
export function formatPhoneDisplay(phone: string): string {
  const cleaned = phone.replace(/\D/g, '');
  if (cleaned.length === 10) {
    return `(${cleaned.slice(0, 3)}) ${cleaned.slice(3, 6)}-${cleaned.slice(6)}`;
  }
  if (cleaned.length === 11 && cleaned[0] === '1') {
    return `(${cleaned.slice(1, 4)}) ${cleaned.slice(4, 7)}-${cleaned.slice(7)}`;
  }
  return phone;
}

// Format phone number for tel: href
export function formatPhoneTel(phone: string): string {
  const cleaned = phone.replace(/\D/g, '');
  if (cleaned.length === 10) {
    return `+1${cleaned}`;
  }
  if (cleaned.length === 11 && cleaned[0] === '1') {
    return `+${cleaned}`;
  }
  return cleaned;
}

// Track call event (for analytics)
export function trackCallClick(phone: string, source: string): void {
  if (typeof window === 'undefined') return;

  // Google Analytics 4 event
  if ((window as any).gtag) {
    (window as any).gtag('event', 'call_click', {
      phone_number: phone,
      source: source,
      page_url: window.location.href,
    });
  }

  // Facebook Pixel event
  if ((window as any).fbq) {
    (window as any).fbq('track', 'Contact', {
      content_name: 'Phone Call',
      content_category: source,
    });
  }
}

// Default phone numbers by vertical (fallbacks)
export const defaultPhones: Record<string, string> = {
  hvac: '(813) 555-1234',
  plumbing: '(813) 555-2345',
  roofing: '(813) 555-3456',
  default: '(813) 555-0000',
};

// Get appropriate phone number for a vertical
export function getPhoneNumber(vertical?: string): string {
  if (vertical && defaultPhones[vertical]) {
    return defaultPhones[vertical];
  }
  return defaultPhones.default;
}
