import { useState, useEffect } from 'react';
import { formatPhoneDisplay, formatPhoneTel, trackCallClick, getRingbaNumber } from '../lib/ringba';

interface ClickToCallIslandProps {
  defaultPhone?: string;
  variant?: 'primary' | 'secondary' | 'cta' | 'text';
  size?: 'sm' | 'md' | 'lg';
  showIcon?: boolean;
  className?: string;
  trackingSource?: string;
  vertical?: string;
}

const sizeClasses = {
  sm: 'text-sm py-2 px-4',
  md: 'text-base py-3 px-6',
  lg: 'text-lg py-4 px-8',
};

const variantClasses = {
  primary: 'bg-teal hover:bg-teal-600 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition-all',
  secondary: 'bg-white border-2 border-teal text-teal hover:bg-teal hover:text-white font-semibold rounded-lg transition-all',
  cta: 'bg-orange hover:bg-orange-600 text-white font-bold rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all',
  text: 'text-teal hover:text-teal-600 font-semibold hover:underline',
};

export function ClickToCallIsland({
  defaultPhone = '(813) 555-1234',
  variant = 'cta',
  size = 'md',
  showIcon = true,
  className = '',
  trackingSource = 'component',
  vertical = 'hvac',
}: ClickToCallIslandProps) {
  const [phone, setPhone] = useState(defaultPhone);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Wait for Ringba to potentially swap the number
    const checkRingba = () => {
      const ringbaNumber = getRingbaNumber();
      if (ringbaNumber) {
        setPhone(formatPhoneDisplay(ringbaNumber));
      }
      setIsLoading(false);
    };

    // Check immediately
    checkRingba();

    // Also check after a short delay (Ringba may load async)
    const timeout = setTimeout(checkRingba, 1500);

    // Listen for Ringba number swap events
    const observer = new MutationObserver(() => {
      const ringbaNumber = getRingbaNumber();
      if (ringbaNumber) {
        setPhone(formatPhoneDisplay(ringbaNumber));
      }
    });

    // Observe body for Ringba changes
    observer.observe(document.body, {
      childList: true,
      subtree: true,
      characterData: true,
    });

    return () => {
      clearTimeout(timeout);
      observer.disconnect();
    };
  }, []);

  const handleClick = () => {
    trackCallClick(phone, trackingSource);
  };

  const buttonClass = variant === 'text'
    ? variantClasses[variant]
    : `${variantClasses[variant]} ${sizeClasses[size]}`;

  return (
    <a
      href={`tel:${formatPhoneTel(phone)}`}
      onClick={handleClick}
      className={`inline-flex items-center justify-center gap-2 ${buttonClass} ${className}`}
      data-tracking-source={trackingSource}
      data-vertical={vertical}
    >
      {showIcon && (
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
          />
        </svg>
      )}
      <span className={isLoading ? 'opacity-70' : ''}>
        {isLoading ? 'Loading...' : phone}
      </span>
    </a>
  );
}
