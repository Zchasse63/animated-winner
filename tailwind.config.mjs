/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        // Primary Colors (Trust + Professionalism)
        navy: {
          DEFAULT: '#0f172a',
          light: '#1e293b',
          dark: '#020617',
        },
        // Secondary Colors (Action + Energy)
        teal: {
          DEFAULT: '#0891b2',
          light: '#22d3ee',
          dark: '#0e7490',
        },
        // CTA Colors
        orange: {
          DEFAULT: '#f97316',
          light: '#fb923c',
          dark: '#ea580c',
        },
        // Semantic Colors
        success: '#22c55e',
        warning: '#f59e0b',
        error: '#dc2626',
        // Neutral Colors
        slate: {
          DEFAULT: '#334155',
          light: '#64748b',
          lighter: '#94a3b8',
        },
        gray: {
          50: '#f8fafc',
          100: '#f1f5f9',
          200: '#e2e8f0',
          300: '#cbd5e1',
          400: '#94a3b8',
          500: '#64748b',
          600: '#475569',
          700: '#334155',
          800: '#1e293b',
          900: '#0f172a',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
      fontSize: {
        // Custom sizes matching design guide
        'h1': ['48px', { lineHeight: '1.1', fontWeight: '700', letterSpacing: '-0.02em' }],
        'h1-mobile': ['32px', { lineHeight: '1.2', fontWeight: '700', letterSpacing: '-0.02em' }],
        'h2': ['32px', { lineHeight: '1.2', fontWeight: '700', letterSpacing: '-0.01em' }],
        'h3': ['24px', { lineHeight: '1.3', fontWeight: '600' }],
        'body': ['18px', { lineHeight: '1.6', fontWeight: '400' }],
        'body-small': ['14px', { lineHeight: '1.5', fontWeight: '400' }],
        'caption': ['12px', { lineHeight: '1.5', fontWeight: '500' }],
      },
      spacing: {
        // Section spacing
        'section': '80px',
        'section-mobile': '48px',
        // Card padding
        'card': '32px',
        'card-mobile': '24px',
      },
      borderRadius: {
        'card': '12px',
        'button': '8px',
        'input': '8px',
      },
      boxShadow: {
        'card': '0 4px 24px rgba(0, 0, 0, 0.1)',
        'card-hover': '0 8px 32px rgba(0, 0, 0, 0.15)',
        'button': '0 4px 14px rgba(249, 115, 22, 0.3)',
        'button-hover': '0 8px 24px rgba(249, 115, 22, 0.4)',
        'header': '0 2px 8px rgba(0, 0, 0, 0.08)',
      },
      animation: {
        'fade-in': 'fadeIn 0.3s ease-in-out',
        'slide-up': 'slideUp 0.4s ease-out',
        'slide-left': 'slideLeft 0.3s ease-out',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        slideLeft: {
          '0%': { opacity: '0', transform: 'translateX(20px)' },
          '100%': { opacity: '1', transform: 'translateX(0)' },
        },
      },
    },
  },
  plugins: [],
};
