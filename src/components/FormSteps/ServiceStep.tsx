import type { UseFormReturn } from 'react-hook-form';
import type { LeadFormData } from '../../lib/validation';
import { serviceOptions, urgencyOptions } from '../../lib/validation';

interface ServiceStepProps {
  form: UseFormReturn<LeadFormData>;
  vertical: 'hvac' | 'plumbing' | 'roofing';
}

export function ServiceStep({ form, vertical }: ServiceStepProps) {
  const { register, watch, formState: { errors } } = form;
  const selectedService = watch('serviceType');
  const selectedUrgency = watch('urgency');

  const services = serviceOptions[vertical] || serviceOptions.hvac;

  return (
    <div className="space-y-6">
      {/* Service Type Selection */}
      <div>
        <label className="form-label mb-3 block">What type of service do you need?</label>
        <div className="grid grid-cols-2 gap-3">
          {services.map((service) => (
            <label
              key={service.value}
              className={`selection-card cursor-pointer ${
                selectedService === service.value ? 'selected' : ''
              }`}
            >
              <input
                type="radio"
                value={service.value}
                {...register('serviceType')}
                className="sr-only"
              />
              <span className="text-2xl mb-1">{service.icon}</span>
              <span className="selection-card-label">{service.label}</span>
            </label>
          ))}
        </div>
        {errors.serviceType && (
          <p className="form-error">{errors.serviceType.message}</p>
        )}
      </div>

      {/* Urgency Selection */}
      <div>
        <label className="form-label mb-3 block">How urgent is your need?</label>
        <div className="space-y-2">
          {urgencyOptions.map((option) => (
            <label
              key={option.value}
              className={`flex items-center gap-3 p-3 rounded-lg border-2 cursor-pointer transition-all ${
                selectedUrgency === option.value
                  ? 'border-teal bg-teal/5'
                  : 'border-gray-200 hover:border-gray-300'
              }`}
            >
              <input
                type="radio"
                value={option.value}
                {...register('urgency')}
                className="sr-only"
              />
              <div
                className={`w-3 h-3 rounded-full ${
                  option.color === 'red'
                    ? 'bg-red-500'
                    : option.color === 'orange'
                    ? 'bg-orange-500'
                    : 'bg-gray-400'
                }`}
              />
              <div className="flex-1">
                <span className="font-medium text-navy">{option.label}</span>
                <span className="text-gray-500 text-sm ml-2">- {option.description}</span>
              </div>
              {selectedUrgency === option.value && (
                <svg className="w-5 h-5 text-teal" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              )}
            </label>
          ))}
        </div>
        {errors.urgency && (
          <p className="form-error">{errors.urgency.message}</p>
        )}
      </div>
    </div>
  );
}
