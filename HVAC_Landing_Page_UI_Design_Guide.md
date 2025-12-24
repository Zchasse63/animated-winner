# HVAC Lead Generation Landing Page
## UI Design Specifications & AI Tool Prompts

Based on conversion research and home services industry best practices.

---

## Executive Summary: What Works

| Element | Best Practice | Impact |
|---------|--------------|--------|
| Multi-step forms | 3-4 steps, progress indicator | +86-300% conversion vs single-step |
| Above-fold CTA | Form or button visible without scroll | +30% conversion |
| Page load speed | Under 3 seconds | 83% of traffic is mobile |
| Trust badges | Above fold, near form | +35% credibility |
| Social proof | Real photos, specific results | +25-35% trust |
| Headline clarity | Service + Location + USP | 8/10 people only read headline |
| Color scheme | Navy blue (#003366) primary | 57% prefer blue, highest trust |

---

## Color Palette

HVAC-specific color psychology based on industry research:

```
PRIMARY COLORS (Trust + Professionalism)
├── Navy Blue: #0f172a (headers, primary buttons)
├── Deep Blue: #1e3a5f (accents, secondary elements)
└── Slate: #334155 (body text)

SECONDARY COLORS (Action + Energy)
├── Teal/Cyan: #0891b2 (links, highlights)
├── Orange: #f97316 (emergency/urgent CTAs)
└── Green: #16a34a (success states, trust badges)

NEUTRAL COLORS (Background + Structure)
├── White: #ffffff (primary background)
├── Light Gray: #f8fafc (section backgrounds)
├── Medium Gray: #e2e8f0 (borders, dividers)
└── Dark Gray: #64748b (secondary text)

SEMANTIC COLORS
├── Emergency Red: #dc2626 (24/7, urgent messaging)
├── Success Green: #22c55e (form success, checkmarks)
└── Warning Amber: #f59e0b (caution, highlights)
```

**Why these colors:**
- Blue is the #1 trusted color globally (57% preference)
- Navy blue signals authority and premium service
- Teal connects to HVAC (air/water) while maintaining professionalism
- Orange creates urgency for emergency services without being aggressive

---

## Typography

```
HEADINGS
├── Font: Inter, system-ui, sans-serif
├── H1: 48px / 700 weight / -0.02em tracking
├── H2: 32px / 700 weight / -0.01em tracking
└── H3: 24px / 600 weight

BODY TEXT
├── Font: Inter, system-ui, sans-serif
├── Body: 18px / 400 weight / 1.6 line-height
├── Small: 14px / 400 weight / 1.5 line-height
└── Caption: 12px / 500 weight / uppercase for labels

FORM LABELS
├── Size: 14px / 500 weight
├── Color: #334155
└── Spacing: 4px margin-bottom

BUTTON TEXT
├── Size: 16px / 600 weight
├── Uppercase: No (feels more approachable)
└── Letter-spacing: normal
```

---

## Page Structure & Layout

### Above the Fold (0-3 seconds)
The critical zone that determines if visitors stay or leave.

```
┌─────────────────────────────────────────────────────────────┐
│  HEADER (Sticky)                                            │
│  ┌─────────────────────────────────────────────────────────┐│
│  │ Logo          [Phone: (555) 123-4567]  [Get Free Quote] ││
│  └─────────────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────────────┤
│  HERO SECTION (Navy Blue Background #0f172a)                │
│  ┌─────────────────────────────────────────────────────────┐│
│  │                                                          ││
│  │  ⭐⭐⭐⭐⭐ Rated 4.9/5 (500+ Reviews)              ││
│  │                                                          ││
│  │  [H1] AC Repair in Tampa, FL                            ││
│  │  [H2] 24/7 Emergency Service • Licensed & Insured       ││
│  │                                                          ││
│  │  ┌─────────────────────────────────────────────────┐    ││
│  │  │  TRUST BADGES ROW                                │    ││
│  │  │  [24/7] [Licensed] [Satisfaction] [Same-Day]    │    ││
│  │  └─────────────────────────────────────────────────┘    ││
│  │                                                          ││
│  │  [        GET YOUR FREE QUOTE →        ]  (Orange CTA)  ││
│  │                                                          ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

### Form Section (Primary Conversion Zone)

```
┌─────────────────────────────────────────────────────────────┐
│  FORM SECTION (Light Gray Background #f8fafc)              │
│  ┌─────────────────────────────────────────────────────────┐│
│  │  "Get Connected With Top-Rated Local HVAC Pros"         ││
│  │                                                          ││
│  │  ┌───────────────────────────────────────────────────┐  ││
│  │  │  MULTI-STEP FORM (White Card, Shadow)              │  ││
│  │  │                                                     │  ││
│  │  │  ══════════════════════════════════════            │  ││
│  │  │  Step 1 of 4                    [●][○][○][○]       │  ││
│  │  │  ══════════════════════════════════════            │  ││
│  │  │                                                     │  ││
│  │  │  What type of service do you need?                 │  ││
│  │  │                                                     │  ││
│  │  │  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐  │  ││
│  │  │  │ ❄️      │ │ 🔥      │ │ 🔧      │ │ 📋      │  │  ││
│  │  │  │ AC      │ │ Heating │ │ Install │ │ Tune-Up │  │  ││
│  │  │  │ Repair  │ │ Repair  │ │ /Replace│ │         │  │  ││
│  │  │  └─────────┘ └─────────┘ └─────────┘ └─────────┘  │  ││
│  │  │                                                     │  ││
│  │  │  [          Continue →          ]                  │  ││
│  │  │                                                     │  ││
│  │  │  🔒 Your information is secure                     │  ││
│  │  └───────────────────────────────────────────────────┘  ││
│  │                                                          ││
│  │  As seen on: [Google] [BBB] [HomeAdvisor]              ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

### Below the Fold Sections

```
1. WHY CHOOSE US (3 benefits with icons)
2. HOW IT WORKS (3 simple steps)
3. SERVICE AREAS (City list)
4. TESTIMONIALS (Real photos, names, specific results)
5. FAQ ACCORDION (5-7 questions)
6. FINAL CTA (Repeat form or scroll-to-form button)
7. FOOTER (Contact, legal, TCPA disclosure)
```

---

## Multi-Step Form Specifications

### Form Psychology
- Start with easy, non-threatening questions (service type)
- Save personal info (email, phone) for later steps
- Show progress indicator to reduce abandonment
- Use image/icon buttons instead of dropdowns where possible

### Step 1: Service Selection
```
Question: "What type of service do you need?"

Options (visual cards with icons):
├── AC Repair (snowflake icon)
├── Heating Repair (flame icon)
├── New System Installation (house + gear icon)
└── Maintenance/Tune-Up (wrench icon)

Secondary: "How urgent is your need?"
├── Emergency - Need help NOW (red indicator)
├── Soon - Within 48 hours
└── Planning - Getting quotes
```

### Step 2: Property Information
```
Fields:
├── Property Type (visual cards):
│   ├── Single Family Home
│   ├── Townhouse/Condo
│   └── Multi-Family/Commercial
├── Street Address (text input)
├── City (pre-filled, editable)
├── State (dropdown, pre-filled)
└── ZIP Code (5 digits, validated)
```

### Step 3: Contact Information
```
Fields:
├── Full Name
├── Email Address (validated)
├── Phone Number (formatted: (555) 123-4567)
├── Best Time to Call (Morning/Afternoon/Evening/Anytime)
└── TCPA Consent Checkbox (required):
    "I agree to receive calls/texts from licensed contractors 
    at the number provided. Msg & data rates may apply."
```

### Step 4: Confirmation
```
Elements:
├── Success checkmark animation
├── "Thank You, [Name]!"
├── "A local HVAC professional will contact you within 30 minutes"
├── Summary of their request
└── Phone number to call if urgent
```

### Form Styling
```css
/* Form card */
- Background: white
- Border-radius: 12px
- Box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1)
- Padding: 32px (desktop), 24px (mobile)
- Max-width: 480px

/* Progress bar */
- Height: 4px
- Background: #e2e8f0
- Fill color: #0891b2 (teal)
- Animated transition

/* Input fields */
- Height: 48px
- Border: 1px solid #e2e8f0
- Border-radius: 8px
- Focus: border-color #0891b2, ring

/* Primary button */
- Background: #f97316 (orange)
- Hover: #ea580c
- Height: 52px
- Border-radius: 8px
- Full width
- Font: 16px, 600 weight
```

---

## Trust Elements

### Trust Badges (Above Fold)
```
Badge Row (4 items, horizontal):
├── "24/7 Emergency Service" (clock icon)
├── "Licensed & Insured" (shield icon)
├── "Satisfaction Guaranteed" (checkmark icon)
└── "Same-Day Service" (calendar icon)

Styling:
- Background: rgba(255, 255, 255, 0.1) on dark bg
- Border-radius: 6px
- Padding: 8px 16px
- Icon + text inline
- Icon color: #22c55e (green)
```

### Social Proof
```
Elements to include:
├── Star rating with count: "⭐⭐⭐⭐⭐ 4.9/5 (500+ Reviews)"
├── "As seen on" logos: Google, BBB, HomeAdvisor
├── Real customer testimonials with:
│   ├── Photo (real person, not stock)
│   ├── Full name
│   ├── City
│   └── Specific result ("Fixed my AC in 2 hours!")
└── Review count/source badges
```

### Form Trust Indicators
```
Below form button:
├── 🔒 "Your information is secure"
├── "We respect your privacy"
└── Small: "By submitting, you agree to our Terms & Privacy Policy"

Near form:
├── BBB Accredited badge
├── Google rating badge
└── "No spam, ever" text
```

---

## Mobile Specifications

83% of landing page visits are mobile. Design mobile-first.

```
MOBILE LAYOUT CHANGES:

Header:
├── Logo (smaller)
├── Phone icon (tap to call)
└── Hamburger menu (optional, minimal)

Hero:
├── H1: 32px (vs 48px desktop)
├── Trust badges: 2x2 grid
└── Reduce padding

Form:
├── Full width (no side margins)
├── Larger touch targets (48px minimum)
├── Sticky "Continue" button at bottom
└── Progress dots instead of bar

Buttons:
├── Minimum height: 52px
├── Minimum width: 100%
└── Thumb-friendly placement

Font sizes:
├── H1: 28-32px
├── Body: 16px
└── Form labels: 14px
```

---

## Component Specifications

### Header (Sticky)
```
- Height: 64px (desktop), 56px (mobile)
- Background: white
- Border-bottom: 1px solid #e2e8f0
- Box-shadow on scroll: 0 2px 8px rgba(0,0,0,0.08)
- Logo: left aligned
- Phone: click-to-call, visible number
- CTA button: right aligned, orange
```

### Hero Section
```
- Background: Navy gradient or solid #0f172a
- Text color: white
- Min-height: 500px (desktop), 400px (mobile)
- Content: centered
- Optional: subtle pattern or HVAC-related background image at 10% opacity
```

### Service Cards (Form Step 1)
```
- Display: grid, 2x2
- Background: white
- Border: 2px solid #e2e8f0
- Border-radius: 12px
- Hover: border-color #0891b2, subtle shadow
- Selected: border-color #0891b2, bg tint
- Icon: 32px, centered
- Text: 14px, 600 weight, below icon
- Padding: 20px
- Cursor: pointer
```

### FAQ Accordion
```
- Use native <details><summary> for no-JS
- Question: 18px, 600 weight
- Answer: 16px, 400 weight, #64748b
- Border-bottom: 1px solid #e2e8f0
- Padding: 20px 0
- Icon: chevron, rotates on open
```

### Footer
```
- Background: #0f172a (navy)
- Text: white
- Sections: Contact, Services, Areas, Legal
- TCPA disclosure: small print at bottom
- Phone number: prominent
```

---

# AI UI TOOL PROMPTS

Use these prompts with v0, Bolt, Lovable, or similar AI design tools.

---

## Prompt 1: Overall Page Generation

```
Create a high-converting HVAC lead generation landing page with these specifications:

**Page Purpose:** Capture leads for AC repair services in Tampa, FL

**Color Scheme:**
- Primary: Navy blue #0f172a
- Secondary: Teal #0891b2
- Accent/CTA: Orange #f97316
- Text: Slate #334155
- Background: White #ffffff and light gray #f8fafc

**Typography:**
- Font family: Inter (Google Fonts)
- H1: 48px bold
- H2: 32px bold
- Body: 18px regular

**Page Structure:**

1. STICKY HEADER
- Logo placeholder on left
- Phone number with click-to-call in center/right
- "Get Free Quote" orange button on right
- White background with subtle shadow on scroll

2. HERO SECTION (Navy background)
- Star rating badge: "⭐⭐⭐⭐⭐ 4.9/5 (500+ Reviews)"
- H1: "AC Repair in Tampa, FL"
- Subheadline: "24/7 Emergency Service • Licensed & Insured"
- Trust badges row: 4 items (24/7, Licensed, Guaranteed, Same-Day) with icons
- Large orange CTA button: "Get Your Free Quote →"

3. FORM SECTION (Light gray background)
- Centered white card with shadow
- Headline above form: "Get Connected With Top-Rated Local HVAC Pros"
- Multi-step form (show step 1 of 4)
- Progress indicator at top
- Service selection with 4 icon cards (AC Repair, Heating, Install, Maintenance)
- Orange "Continue" button
- "🔒 Your information is secure" text below
- "As seen on" logos row below form

4. HOW IT WORKS SECTION
- 3 numbered steps with icons
- Step 1: "Tell Us Your Need"
- Step 2: "Get Matched"
- Step 3: "Get Fast Service"

5. FAQ SECTION
- 5 expandable FAQ items using accordion
- Questions about pricing, timing, service areas

6. FINAL CTA SECTION (Navy background)
- "Ready to Get Started?"
- Orange button scrolls to form

7. FOOTER (Navy background)
- Contact information
- Service areas
- TCPA disclosure in small print

**Design Requirements:**
- Mobile-first, fully responsive
- Clean, professional, trustworthy aesthetic
- No stock photos of people
- Smooth animations on interactions
- Form cards have hover states
- Accessibility compliant

Use Tailwind CSS for styling. Make it a single-page React component or Astro page.
```

---

## Prompt 2: Multi-Step Form Component

```
Create a multi-step lead capture form React component with these specifications:

**Props:**
- city: string (default: "Tampa")
- state: string (default: "FL")
- service: string (default: "ac-repair")

**Form Steps (4 total):**

STEP 1 - Service Selection:
- Heading: "What type of service do you need?"
- 4 visual card options in 2x2 grid:
  * AC Repair (snowflake icon)
  * Heating Repair (flame icon)
  * New Installation (building icon)
  * Maintenance (wrench icon)
- Cards have: icon, label, hover effect, selected state
- Below cards: "How urgent is your need?" with 3 radio options:
  * Emergency (red dot) - "Need help NOW"
  * Soon - "Within 48 hours"
  * Planning - "Just getting quotes"

STEP 2 - Property Information:
- Heading: "Tell us about your property"
- Property type cards (3 options):
  * Single Family Home
  * Townhouse/Condo
  * Commercial
- Text inputs:
  * Street Address (full width)
  * City (half width, pre-filled)
  * State dropdown (quarter width, pre-filled)
  * ZIP Code (quarter width, 5-digit validation)

STEP 3 - Contact Information:
- Heading: "How can we reach you?"
- Inputs:
  * Full Name
  * Email (with validation)
  * Phone (with formatting mask: (555) 123-4567)
  * Best time to call (dropdown: Morning, Afternoon, Evening, Anytime)
- TCPA checkbox (required):
  "I agree to receive calls and texts from licensed contractors at the number provided. Message and data rates may apply. Reply STOP to opt out."

STEP 4 - Confirmation:
- Green checkmark animation
- "Thank You, [Name]!"
- "A local HVAC professional will contact you within 30 minutes"
- Summary card showing their selections
- "Need immediate help? Call [phone number]"

**Form Features:**
- Progress bar at top (filled portion = current step / 4)
- Step indicator dots
- "Back" button on steps 2-4 (left side)
- "Continue" / "Get My Quote" button (right side, orange #f97316)
- Form validation with inline error messages
- Loading spinner on submit
- Smooth slide transitions between steps
- Keyboard accessible

**Styling (Tailwind):**
- Card: white bg, rounded-xl, shadow-lg, p-8
- Progress bar: h-1, bg-gray-200, fill bg-teal-500
- Input: h-12, rounded-lg, border-gray-200, focus:ring-teal-500
- Button: h-14, rounded-lg, bg-orange-500, hover:bg-orange-600
- Error text: text-red-500, text-sm

**On Submit:**
- POST to /api/leads with all form data
- Include UTM params from URL
- Include source page slug
- Handle success and error states

Use React Hook Form with Zod validation. Make it a TypeScript component.
```

---

## Prompt 3: Trust Badges Component

```
Create a trust badges component for an HVAC landing page:

**Badge Set 1 - Hero Trust Badges (4 items, horizontal row)**
Display on dark navy background in hero section.

Badges:
1. "24/7 Emergency Service" - Clock icon
2. "Licensed & Insured" - Shield with check icon
3. "Satisfaction Guaranteed" - Thumbs up or ribbon icon
4. "Same-Day Service" - Calendar with check icon

Styling:
- Background: rgba(255, 255, 255, 0.1)
- Border: 1px solid rgba(255, 255, 255, 0.2)
- Border-radius: 8px
- Padding: 12px 20px
- Icon: 20px, color #22c55e (green)
- Text: 14px, white, font-medium
- Layout: flex row, gap-4, flex-wrap on mobile

**Badge Set 2 - Form Trust Indicators**
Display below the form submit button.

Elements:
- Lock icon + "Your information is 100% secure"
- Text: 12px, gray-500

**Badge Set 3 - "As Seen On" Logos**
Display below the form card.

Elements:
- "As seen on:" label
- Logo placeholders for: Google, BBB, HomeAdvisor, Angi
- Grayscale logos, subtle hover color effect

Styling:
- Logos: max-height 32px, grayscale filter
- Spacing: gap-8
- Alignment: center

**Badge Set 4 - Footer Certifications**
Display in footer.

Badges:
- BBB Accredited Business
- State License #
- NATE Certified

Create as reusable Astro/React components with Tailwind CSS.
Include both light and dark background variants.
```

---

## Prompt 4: FAQ Accordion Component

```
Create an FAQ accordion component for an HVAC landing page:

**Requirements:**
- Pure HTML/CSS accordion using <details> and <summary> (no JavaScript)
- Accessible and SEO-friendly
- Generates FAQ schema JSON-LD automatically

**Props:**
- faqs: Array of { question: string, answer: string }

**Default FAQ Content for HVAC:**
1. Q: "How much does AC repair cost in Tampa?"
   A: "AC repair costs typically range from $150-$600 depending on the issue. We provide free estimates so you know the cost upfront before any work begins."

2. Q: "Do you offer emergency HVAC service?"
   A: "Yes! We provide 24/7 emergency service throughout the Tampa Bay area. Our technicians can typically arrive within 1-2 hours for urgent situations."

3. Q: "Are your technicians licensed and insured?"
   A: "Absolutely. All our partnered contractors are fully licensed, bonded, and insured in the state of Florida. We verify credentials before connecting you."

4. Q: "How quickly can someone come out?"
   A: "For emergencies, we aim for same-day service. For non-urgent repairs, we can usually schedule within 24-48 hours based on your preference."

5. Q: "What areas do you serve?"
   A: "We serve Tampa and surrounding areas including St. Petersburg, Clearwater, Brandon, and all of Hillsborough County."

**Styling (Tailwind):**
- Container: max-w-3xl, mx-auto
- Section heading: "Frequently Asked Questions" - text-3xl, font-bold, text-center, mb-8
- Each item: border-b border-gray-200
- Summary (question):
  * py-5, text-lg, font-semibold, text-gray-900
  * Cursor pointer
  * Chevron icon on right that rotates when open
  * Hover: text-teal-600
- Answer:
  * pb-5, text-gray-600, leading-relaxed
  * Smooth expand animation

**JSON-LD Output:**
Generate FAQPage schema that can be injected into page head.

Create as Astro component. Make the chevron rotation work with CSS only (details[open] selector).
```

---

## Prompt 5: Hero Section Component

```
Create a hero section component for an HVAC landing page:

**Props:**
- city: string
- state: string
- service: string
- headline?: string (optional override)
- subheadline?: string (optional override)
- rating?: number (default: 4.9)
- reviewCount?: number (default: 500)

**Default Content Generation:**
Based on service prop, generate appropriate headline:
- "ac-repair" → "AC Repair in [City], [State]"
- "heating-repair" → "Heating Repair in [City], [State]"
- "hvac-installation" → "HVAC Installation in [City], [State]"
- "maintenance" → "HVAC Maintenance in [City], [State]"

**Layout:**
```
┌─────────────────────────────────────────────────────────┐
│                                                          │
│     ⭐⭐⭐⭐⭐ 4.9/5 (500+ Reviews)                  │
│                                                          │
│     [H1] AC Repair in Tampa, FL                         │
│                                                          │
│     24/7 Emergency Service • Licensed & Insured         │
│                                                          │
│     ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐                │
│     │ 24/7 │ │Shield│ │ ✓    │ │ Cal  │                │
│     └──────┘ └──────┘ └──────┘ └──────┘                │
│                                                          │
│     [     GET YOUR FREE QUOTE →     ]                   │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

**Styling:**
- Background: gradient from #0f172a to #1e293b (navy to slate)
- Min-height: 70vh on desktop, auto on mobile
- Content: centered, max-width 4xl
- Padding: py-20 px-4

- Rating badge:
  * bg-white/10, rounded-full, px-4 py-2
  * Yellow stars, white text

- H1:
  * text-5xl (desktop), text-3xl (mobile)
  * font-bold, text-white
  * mb-4

- Subheadline:
  * text-xl, text-gray-300
  * mb-8

- Trust badges:
  * Flex row, gap-3, flex-wrap justify-center
  * Use TrustBadges component

- CTA Button:
  * bg-orange-500, hover:bg-orange-600
  * text-white, text-lg, font-semibold
  * px-8 py-4, rounded-lg
  * Shadow, hover:shadow-lg
  * Scroll to #lead-form on click

Create as Astro component with Tailwind CSS.
```

---

## Prompt 6: Complete Landing Page Template

```
Create a complete, production-ready HVAC landing page with all sections:

**Tech Stack:**
- Astro 4.x
- React (for form component only)
- Tailwind CSS
- TypeScript

**Page: /[city]/[service].astro**

Generate a full landing page that includes:

1. SEO Meta Tags
- Dynamic title: "[Service] in [City], [State] | 24/7 Emergency HVAC"
- Dynamic description
- Open Graph tags
- Canonical URL

2. JSON-LD Structured Data
- LocalBusiness schema
- FAQPage schema
- BreadcrumbList schema

3. All Sections (in order):
- Sticky header
- Hero with trust badges
- Form section (React island with client:load)
- "How It Works" 3-step process
- "Why Choose Us" benefits
- Service areas grid
- Testimonials (3 cards)
- FAQ accordion
- Final CTA section
- Footer with TCPA disclosure

**Dynamic Content:**
Accept these props and generate appropriate content:
- city: string
- state: string
- service: "ac-repair" | "heating-repair" | "hvac-installation" | "maintenance"

**Performance Requirements:**
- Zero JavaScript except form island (~15KB)
- Optimized images (if any)
- Lazy load below-fold content
- Lighthouse score target: 95+

**Accessibility:**
- Semantic HTML
- Skip to content link
- Proper heading hierarchy
- Focus states on all interactive elements
- ARIA labels where needed

**Mobile:**
- Mobile-first design
- Touch-friendly (48px minimum tap targets)
- Readable without zooming

Create the complete page with all components inline or imported from a components directory.
```

---

## Design System Summary

### Quick Reference Card

```
COLORS
├── Navy (Primary):     #0f172a
├── Teal (Secondary):   #0891b2
├── Orange (CTA):       #f97316
├── Green (Success):    #22c55e
├── Slate (Text):       #334155
├── Gray (Light BG):    #f8fafc
└── White:              #ffffff

TYPOGRAPHY
├── Font: Inter
├── H1: 48px/700
├── H2: 32px/700
├── Body: 18px/400
└── Small: 14px/400

SPACING
├── Section padding: 80px (desktop), 48px (mobile)
├── Card padding: 32px (desktop), 24px (mobile)
├── Element gap: 16-24px
└── Form field gap: 16px

BORDERS
├── Radius (cards): 12px
├── Radius (buttons): 8px
├── Radius (inputs): 8px
└── Border color: #e2e8f0

SHADOWS
├── Card: 0 4px 24px rgba(0,0,0,0.1)
├── Button hover: 0 8px 24px rgba(249,115,22,0.3)
└── Header scroll: 0 2px 8px rgba(0,0,0,0.08)

BREAKPOINTS
├── Mobile: < 640px
├── Tablet: 640px - 1024px
└── Desktop: > 1024px
```

---

## Implementation Notes for AI Tools

When using these prompts:

1. **Start with Prompt 6** (complete page) to get the overall structure
2. **Refine individual components** using Prompts 2-5 as needed
3. **Iterate on the form** - it's the most critical conversion element
4. **Test mobile first** - 83% of traffic is mobile
5. **Check accessibility** - proper labels, focus states, contrast

### Common Issues to Watch For:
- Form validation messages not visible on mobile
- Touch targets too small (minimum 48px)
- CTA buttons not prominent enough
- Trust badges lost on mobile (ensure they wrap properly)
- Progress indicator not clear on which step user is on
- Phone number not click-to-call on mobile

### Key Conversion Elements (Don't Skip):
- Star rating above H1
- Trust badges in hero
- Progress indicator on form
- TCPA consent checkbox
- "Your info is secure" messaging
- Click-to-call phone number
