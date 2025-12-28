import type { UseFormReturn } from 'react-hook-form';
import type { LeadFormData } from '../../lib/validation';
import { bestTimeOptions, formatPhoneNumber } from '../../lib/validation';

interface ContactStepProps {
  form: UseFormReturn<LeadFormData>;
  companyName?: string;
}

export function ContactStep({ form, companyName = 'HomeService Leads' }: ContactStepProps) {
  const { register, watch, setValue, formState: { errors } } = form;
  const tcpaConsent = watch('tcpaConsent');

  const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const formatted = formatPhoneNumber(e.target.value);
    setValue('phone', formatted);
  };

  return (
    <div className="space-y-6">
      {/* Name */}
      <div>
        <label htmlFor="name" className="form-label">Full Name</label>
        <input
          id="name"
          type="text"
          placeholder="John Smith"
          {...register('name')}
          className="form-input"
        />
        {errors.name && (
          <p className="form-error">{errors.name.message}</p>
        )}
      </div>

      {/* Email */}
      <div>
        <label htmlFor="email" className="form-label">Email Address</label>
        <input
          id="email"
          type="email"
          placeholder="john@example.com"
          {...register('email')}
          className="form-input"
        />
        {errors.email && (
          <p className="form-error">{errors.email.message}</p>
        )}
      </div>

      {/* Phone */}
      <div>
        <label htmlFor="phone" className="form-label">Phone Number</label>
        <input
          id="phone"
          type="tel"
          placeholder="(555) 123-4567"
          {...register('phone')}
          onChange={handlePhoneChange}
          className="form-input"
        />
        {errors.phone && (
          <p className="form-error">{errors.phone.message}</p>
        )}
      </div>

      {/* Best Time to Call */}
      <div>
        <label htmlFor="bestTime" className="form-label">Best Time to Call (Optional)</label>
        <select
          id="bestTime"
          {...register('bestTime')}
          className="form-input"
        >
          <option value="">Select a time...</option>
          {bestTimeOptions.map((option) => (
            <option key={option.value} value={option.value}>
              {option.label}
            </option>
          ))}
        </select>
      </div>

      {/* TCPA Consent */}
      <div className="bg-gray-50 rounded-lg p-4">
        <label className="flex items-start gap-3 cursor-pointer">
          <input
            type="checkbox"
            {...register('tcpaConsent')}
            className="mt-1 h-5 w-5 rounded border-gray-300 text-teal focus:ring-teal"
          />
          <span className="text-xs text-gray-600 leading-relaxed">
            I agree to receive calls and text messages from <strong>{companyName}</strong> and
            up to 4 home service providers at the phone number provided, including by
            autodialer and prerecorded message. Consent is not a condition of purchase.
            Message and data rates may apply. Reply STOP to opt out.
          </span>
        </label>
        {errors.tcpaConsent && (
          <p className="form-error mt-2">{errors.tcpaConsent.message}</p>
        )}
      </div>

      {/* Hidden field for TrustedForm */}
      <input type="hidden" name="xxTrustedFormCertUrl" id="xxTrustedFormCertUrl" />
    </div>
  );
}
