import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import type { LeadFormData } from '../lib/validation';
import { leadFormSchema, serviceStepSchema, propertyStepSchema, contactStepSchema } from '../lib/validation';
import { ServiceStep } from './FormSteps/ServiceStep';
import { PropertyStep } from './FormSteps/PropertyStep';
import { ContactStep } from './FormSteps/ContactStep';
import { ConfirmationStep } from './FormSteps/ConfirmationStep';

interface LeadFormProps {
  vertical: 'hvac' | 'plumbing' | 'roofing';
  city?: string;
  state?: string;
  phone?: string;
  companyName?: string;
}

const stepSchemas = [serviceStepSchema, propertyStepSchema, contactStepSchema];

const stepTitles = [
  'Service Details',
  'Property Info',
  'Contact Info',
];

export function LeadForm({
  vertical,
  city = '',
  state = 'FL',
  phone = '(813) 555-1234',
  companyName = 'HomeService Leads'
}: LeadFormProps) {
  const [currentStep, setCurrentStep] = useState(0);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isComplete, setIsComplete] = useState(false);
  const [submittedData, setSubmittedData] = useState<LeadFormData | null>(null);

  const form = useForm<LeadFormData>({
    resolver: zodResolver(leadFormSchema),
    mode: 'onChange',
    defaultValues: {
      city,
      state,
      tcpaConsent: false,
    },
  });

  const { trigger, getValues, handleSubmit } = form;

  const validateCurrentStep = async () => {
    const currentSchema = stepSchemas[currentStep];
    const fields = Object.keys(currentSchema.shape) as (keyof LeadFormData)[];
    return await trigger(fields);
  };

  const nextStep = async () => {
    const isValid = await validateCurrentStep();
    if (isValid && currentStep < 2) {
      setCurrentStep((prev) => prev + 1);
    }
  };

  const prevStep = () => {
    if (currentStep > 0) {
      setCurrentStep((prev) => prev - 1);
    }
  };

  const onSubmit = async (data: LeadFormData) => {
    setIsSubmitting(true);

    try {
      // Get TrustedForm certificate URL
      const certUrl = (document.getElementById('xxTrustedFormCertUrl') as HTMLInputElement)?.value || '';

      const response = await fetch('/api/leads', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...data,
          vertical,
          trustedFormCertUrl: certUrl,
          source: window.location.pathname,
          userAgent: navigator.userAgent,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to submit lead');
      }

      setSubmittedData(data);
      setIsComplete(true);
    } catch (error) {
      console.error('Lead submission error:', error);
      // Show error state - could add error handling UI here
    } finally {
      setIsSubmitting(false);
    }
  };

  // Show confirmation step after successful submission
  if (isComplete && submittedData) {
    return (
      <div className="bg-white rounded-2xl shadow-form p-6 md:p-8">
        <ConfirmationStep data={submittedData} phone={phone} />
      </div>
    );
  }

  return (
    <div className="bg-white rounded-2xl shadow-form p-6 md:p-8">
      {/* Progress Bar */}
      <div className="mb-8">
        <div className="flex justify-between mb-2">
          {stepTitles.map((title, index) => (
            <div
              key={title}
              className={`text-xs font-medium transition-colors ${
                index <= currentStep ? 'text-teal' : 'text-gray-400'
              }`}
            >
              {title}
            </div>
          ))}
        </div>
        <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
          <div
            className="h-full bg-teal rounded-full transition-all duration-500 ease-out"
            style={{ width: `${((currentStep + 1) / 3) * 100}%` }}
          />
        </div>
        <div className="flex justify-between mt-1">
          <span className="text-xs text-gray-500">Step {currentStep + 1} of 3</span>
          <span className="text-xs text-gray-500">{Math.round(((currentStep + 1) / 3) * 100)}% Complete</span>
        </div>
      </div>

      {/* Form Steps */}
      <form onSubmit={handleSubmit(onSubmit)}>
        <div className="min-h-[400px]">
          {currentStep === 0 && (
            <ServiceStep form={form} vertical={vertical} />
          )}
          {currentStep === 1 && (
            <PropertyStep form={form} defaultCity={city} defaultState={state} />
          )}
          {currentStep === 2 && (
            <ContactStep form={form} companyName={companyName} />
          )}
        </div>

        {/* Navigation Buttons */}
        <div className="flex gap-3 mt-8">
          {currentStep > 0 && (
            <button
              type="button"
              onClick={prevStep}
              className="flex-1 py-3 px-6 rounded-lg border-2 border-gray-300 text-gray-600 font-semibold hover:bg-gray-50 transition-colors"
            >
              Back
            </button>
          )}

          {currentStep < 2 ? (
            <button
              type="button"
              onClick={nextStep}
              className="flex-1 btn-primary py-3 px-6"
            >
              Continue
            </button>
          ) : (
            <button
              type="submit"
              disabled={isSubmitting}
              className="flex-1 btn-cta py-3 px-6 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {isSubmitting ? (
                <span className="flex items-center justify-center gap-2">
                  <svg className="animate-spin h-5 w-5" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                  </svg>
                  Submitting...
                </span>
              ) : (
                'Get Free Quotes'
              )}
            </button>
          )}
        </div>

        {/* Trust Message */}
        <p className="text-center text-xs text-gray-500 mt-4">
          <svg className="inline w-4 h-4 mr-1 text-success" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
          </svg>
          Your information is secure and will never be sold to third parties.
        </p>
      </form>
    </div>
  );
}
