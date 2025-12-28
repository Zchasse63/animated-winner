import type { LeadFormData } from '../../lib/validation';

interface ConfirmationStepProps {
  data: LeadFormData;
  phone?: string;
}

export function ConfirmationStep({ data, phone = '(813) 555-1234' }: ConfirmationStepProps) {
  const serviceLabels: Record<string, string> = {
    'ac-repair': 'AC Repair',
    'heating-repair': 'Heating Repair',
    'hvac-installation': 'HVAC Installation',
    'maintenance': 'Maintenance/Tune-Up',
    'drain-cleaning': 'Drain Cleaning',
    'water-heater': 'Water Heater Service',
    'leak-repair': 'Leak Repair',
    'pipe-repair': 'Pipe Repair',
    'roof-repair': 'Roof Repair',
    'roof-replacement': 'Roof Replacement',
    'roof-inspection': 'Roof Inspection',
    'storm-damage': 'Storm Damage Repair',
  };

  const urgencyLabels: Record<string, string> = {
    emergency: 'Emergency',
    urgent: 'Within 48 hours',
    planned: 'Planning/Getting quotes',
  };

  const firstName = data.name.split(' ')[0];

  return (
    <div className="text-center py-4">
      {/* Success Animation */}
      <div className="w-20 h-20 bg-success/10 rounded-full flex items-center justify-center mx-auto mb-6 animate-pulse-slow">
        <svg className="w-10 h-10 text-success" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
        </svg>
      </div>

      {/* Success Message */}
      <h3 className="text-2xl font-bold text-navy mb-2">
        Thank You, {firstName}!
      </h3>
      <p className="text-gray-600 mb-6">
        A local professional will contact you within <strong>30 minutes</strong>.
      </p>

      {/* Request Summary */}
      <div className="bg-gray-50 rounded-lg p-4 text-left mb-6">
        <h4 className="font-semibold text-navy mb-3">Your Request Summary:</h4>
        <dl className="space-y-2 text-sm">
          <div className="flex justify-between">
            <dt className="text-gray-500">Service:</dt>
            <dd className="font-medium text-navy">{serviceLabels[data.serviceType] || data.serviceType}</dd>
          </div>
          <div className="flex justify-between">
            <dt className="text-gray-500">Urgency:</dt>
            <dd className="font-medium text-navy">{urgencyLabels[data.urgency] || data.urgency}</dd>
          </div>
          <div className="flex justify-between">
            <dt className="text-gray-500">Location:</dt>
            <dd className="font-medium text-navy">{data.city}, {data.state}</dd>
          </div>
          <div className="flex justify-between">
            <dt className="text-gray-500">Contact:</dt>
            <dd className="font-medium text-navy">{data.phone}</dd>
          </div>
        </dl>
      </div>

      {/* Urgent Call Option */}
      <div className="border border-orange/30 bg-orange/5 rounded-lg p-4">
        <p className="text-sm text-gray-600 mb-3">
          Need immediate assistance?
        </p>
        <a
          href={`tel:${phone.replace(/\D/g, '')}`}
          className="inline-flex items-center gap-2 text-orange font-semibold hover:underline"
        >
          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
          </svg>
          Call {phone}
        </a>
      </div>
    </div>
  );
}
