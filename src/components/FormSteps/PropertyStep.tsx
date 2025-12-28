import type { UseFormReturn } from 'react-hook-form';
import type { LeadFormData } from '../../lib/validation';
import { propertyTypeOptions, stateOptions } from '../../lib/validation';

interface PropertyStepProps {
  form: UseFormReturn<LeadFormData>;
  defaultCity?: string;
  defaultState?: string;
}

export function PropertyStep({ form, defaultCity = '', defaultState = 'FL' }: PropertyStepProps) {
  const { register, watch, formState: { errors } } = form;
  const selectedPropertyType = watch('propertyType');

  return (
    <div className="space-y-6">
      {/* Property Type Selection */}
      <div>
        <label className="form-label mb-3 block">What type of property is this?</label>
        <div className="grid grid-cols-3 gap-3">
          {propertyTypeOptions.map((option) => (
            <label
              key={option.value}
              className={`selection-card cursor-pointer ${
                selectedPropertyType === option.value ? 'selected' : ''
              }`}
            >
              <input
                type="radio"
                value={option.value}
                {...register('propertyType')}
                className="sr-only"
              />
              <span className="text-2xl mb-1">{option.icon}</span>
              <span className="selection-card-label text-xs">{option.label}</span>
            </label>
          ))}
        </div>
        {errors.propertyType && (
          <p className="form-error">{errors.propertyType.message}</p>
        )}
      </div>

      {/* Address Fields */}
      <div>
        <label htmlFor="address" className="form-label">Street Address</label>
        <input
          id="address"
          type="text"
          placeholder="123 Main Street"
          {...register('address')}
          className="form-input"
        />
        {errors.address && (
          <p className="form-error">{errors.address.message}</p>
        )}
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label htmlFor="city" className="form-label">City</label>
          <input
            id="city"
            type="text"
            placeholder="Tampa"
            defaultValue={defaultCity}
            {...register('city')}
            className="form-input"
          />
          {errors.city && (
            <p className="form-error">{errors.city.message}</p>
          )}
        </div>

        <div>
          <label htmlFor="state" className="form-label">State</label>
          <select
            id="state"
            defaultValue={defaultState}
            {...register('state')}
            className="form-input"
          >
            {stateOptions.map((state) => (
              <option key={state.value} value={state.value}>
                {state.label}
              </option>
            ))}
          </select>
          {errors.state && (
            <p className="form-error">{errors.state.message}</p>
          )}
        </div>
      </div>

      <div className="w-1/2">
        <label htmlFor="zip" className="form-label">ZIP Code</label>
        <input
          id="zip"
          type="text"
          placeholder="33601"
          maxLength={5}
          {...register('zip')}
          className="form-input"
        />
        {errors.zip && (
          <p className="form-error">{errors.zip.message}</p>
        )}
      </div>
    </div>
  );
}
