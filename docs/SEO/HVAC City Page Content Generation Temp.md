# HVAC City Page Content Generation Template
## For Claude Code: Research-Driven, SEO/GEO Optimized Local Landing Pages

---

## INSTRUCTIONS FOR CLAUDE CODE

You are generating a unique, high-converting HVAC service landing page for a specific city. This is NOT a template-filling exercise. You must conduct real research on this city and create genuinely unique content that could only exist for this specific location.

### PHASE 1: MANDATORY RESEARCH (Do This First)

Before writing ANY content, you MUST research the following about {{CITY}}, {{STATE}}:

**Use web search to find:**

1. **Demographics & Housing**
   - Current population (cite source)
   - Median household income
   - Median home value
   - Homeownership rate vs rental rate
   - Predominant housing types (single-family, condos, townhomes)
   - Major neighborhoods/subdivisions with names
   - Housing construction eras (when were most homes built?)

2. **Climate Data**
   - Average summer high temperatures
   - Average humidity levels
   - Annual cooling degree days
   - Number of days above 90°F annually
   - Hurricane/tropical storm frequency
   - Any unique microclimate factors

3. **Local Context**
   - Major employers in the area
   - Notable landmarks, parks, or attractions
   - Local events or festivals
   - School districts (for family neighborhood references)
   - Any recent growth/development news
   - Local utility provider (for rebate programs)

4. **HVAC-Specific Research**
   - Local utility rebate programs for HVAC upgrades
   - Any city/county specific building codes
   - Common HVAC issues reported in this area (search local forums, Nextdoor mentions, local news)
   - Competitor landscape (who are the top HVAC companies serving this city?)

5. **Geographic Relationships**
   - Which county is this city in?
   - Nearby cities (for "also serving" section)
   - Distance to major metro area
   - Any relevant zip codes

**Store your research findings before proceeding to writing.**

---

### PHASE 2: CONTENT GENERATION

Using your research, generate the following content. Each section has specific requirements for uniqueness and local specificity.

---

## PAGE METADATA

```yaml
title: "{{PRIMARY_KEYWORD}} | {{BRAND_NAME}}"
# Example: "HVAC Repair & AC Service in Tampa, FL | CoolIt"
# Keep under 60 characters

meta_description: |
  # Must include: city name, primary service, one trust signal, CTA
  # Must be 150-160 characters
  # Example: "24/7 HVAC repair in Tampa, FL. Same-day AC service, upfront pricing. Trusted by 5,000+ Tampa homeowners. Call now for a free estimate."

primary_keyword: "HVAC repair {{CITY}} {{STATE_ABBREV}}"
secondary_keywords:
  - "AC repair {{CITY}}"
  - "air conditioning service {{CITY}}"
  - "HVAC contractor {{CITY}} {{STATE_ABBREV}}"
  - "emergency AC repair {{CITY}}"
  - "AC replacement {{CITY}}"
  - "heating repair {{CITY}}"

url_slug: "/{{STATE_ABBREV_LOWER}}/{{CITY_SLUG}}/hvac"
```

---

## HERO SECTION

**Requirements:**
- H1 must include city name and primary service
- Subheadline must reference something specific to this city (climate, population descriptor, or local reference)
- Include one hyperlocal trust signal

**Generate:**

```markdown
# [H1: 50-70 characters, includes city + service]

[Subheadline: 100-150 characters, must reference specific local context from your research - climate stat, neighborhood reference, or community descriptor]

[Trust bar: "Serving [X] [City] homeowners since [Year]" OR "[X]+ 5-star reviews from [City] residents" - use realistic numbers based on city population]
```

**Example of what NOT to write (too generic):**
> "Professional HVAC Services in Tampa, FL"
> "We provide quality heating and cooling services to homeowners in the Tampa area."

**Example of what TO write (specific and local):**
> "24/7 AC Repair & HVAC Service in Tampa, FL"
> "When Tampa's 90°F summers meet 75% humidity, your AC isn't optional—it's survival. Our technicians respond within 60 minutes across Seminole Heights, Hyde Park, and South Tampa."

---

## INTRO PARAGRAPH (150-200 words)

**Requirements:**
- First sentence must hook with a local-specific pain point
- Include at least 2 specific neighborhood names from your research
- Reference a specific climate statistic from your research
- Mention the primary service naturally
- End with a subtle CTA or value proposition

**Must Include:**
- City name (2-3 times naturally)
- At least one statistic from your research
- Specific neighborhood or area names
- A reference to local housing stock or demographics

**Banned Phrases:**
- "In today's world..."
- "Look no further..."
- "We pride ourselves..."
- "Whether you're a homeowner or..."
- "Don't hesitate to..."
- "Your comfort is our priority"
- Any sentence starting with "At [Company Name], we..."

**Generate intro paragraph here:**

---

## WHY [CITY] RESIDENTS CHOOSE US (Section 2)

**Requirements:**
- H2 must include city name
- 3-4 differentiators that connect to LOCAL context
- Each differentiator needs a "because" that ties to this specific city

**Format:**

```markdown
## Why {{CITY}} Homeowners Trust Us for HVAC Service

### [Differentiator 1 - Speed/Response]
[Connect to local context: distance/traffic patterns, summer emergency frequency, etc.]

### [Differentiator 2 - Local Expertise]  
[Reference specific neighborhoods, housing types, or common local HVAC issues from your research]

### [Differentiator 3 - Transparency/Pricing]
[Connect to local income levels or cost-of-living context if relevant]

### [Differentiator 4 - Credentials/Trust]
[Reference any local licensing requirements, local utility partnerships, or community involvement]
```

**Each differentiator must be 50-75 words and include at least one specific local reference.**

---

## HVAC CHALLENGES IN [CITY] (Section 3)

**This section is your PRIMARY differentiator from other city pages.**

**Requirements:**
- H2 must include city name
- Research-backed content about THIS city's specific HVAC challenges
- At least 3 challenges, each with:
  - The problem (with local data/context)
  - Why it happens in THIS city specifically
  - Brief mention of solution

**Topics to cover (select 3-4 most relevant based on research):**

1. **Humidity Control** - Use actual humidity stats for this city
2. **Aging AC Systems** - Reference when most homes in this city were built
3. **Salt Air Corrosion** - If coastal city
4. **Hard Water Impact on HVAC** - If applicable to this city's water
5. **Hurricane Season Preparation** - Specific storm history if relevant
6. **High Energy Bills** - Reference local utility rates if available
7. **Mold in Ductwork** - Tie to local humidity levels
8. **Oversized/Undersized Systems** - Common in specific housing types found in this city

**Generate 3-4 challenge subsections, each 75-100 words:**

---

## OUR HVAC SERVICES IN [CITY] (Section 4)

**Requirements:**
- H2 with city name
- Brief intro paragraph connecting services to local needs
- Service list with LOCAL context for each

**Services to Include:**

```markdown
## HVAC Services We Provide in {{CITY}}

[Intro: 50-75 words connecting service offerings to this city's specific needs based on your research]

### AC Repair & Emergency Service
[50-75 words - reference response times to specific areas of this city, common AC problems you found in research]

### AC Installation & Replacement
[50-75 words - reference SEER2 requirements, local utility rebates you found, common system sizes for local home sizes]

### Heating Services
[50-75 words - acknowledge Florida's mild winters but address heat pump needs, reference coldest month temps from research]

### Maintenance & Tune-Ups
[50-75 words - tie to local seasonal patterns, pre-summer timing, humidity control]

### Indoor Air Quality
[50-75 words - connect to local humidity, any air quality concerns specific to this area]

### Ductwork Services
[50-75 words - reference housing ages in this city, common ductwork issues]
```

---

## NEIGHBORHOODS WE SERVE IN [CITY] (Section 5)

**Requirements:**
- List ALL major neighborhoods/subdivisions from your research
- Group by area if city is large enough
- Include brief descriptors that show you know these areas

**Format:**

```markdown
## Areas We Serve in {{CITY}}

Our HVAC technicians provide fast service across all {{CITY}} neighborhoods, including:

**[Area/Region 1]:**
[Neighborhood 1], [Neighborhood 2], [Neighborhood 3]...

**[Area/Region 2]:**
[Neighborhood 1], [Neighborhood 2], [Neighborhood 3]...

[Include a sentence about response times or service area specifics]

**Also Serving Nearby:**
[List 3-5 nearby cities/communities]
```

---

## FREQUENTLY ASKED QUESTIONS (Section 6)

**Requirements:**
- 5-7 FAQs
- At least 3 must be specific to THIS city (not generic HVAC questions)
- Answers should be 50-100 words each
- Include local data/context in answers

**Required FAQ Topics:**

1. **Cost Question** - "How much does AC repair cost in {{CITY}}?"
   - Reference local price ranges, factors specific to this area
   
2. **Emergency Question** - "Do you offer 24/7 emergency AC repair in {{CITY}}?"
   - Reference response times to specific neighborhoods

3. **Local-Specific Question** - Based on your research (examples):
   - "Why does my AC struggle with {{CITY}}'s humidity?"
   - "What SEER rating do I need for a home in {{CITY}}?"
   - "Are there utility rebates for AC replacement in {{CITY}}?"

4. **Timing Question** - "When should I schedule AC maintenance in {{CITY}}?"
   - Reference local seasonal patterns

5. **Trust Question** - "How do I choose an HVAC company in {{CITY}}?"
   - Reference local licensing, what to look for

6. **[Optional] Unique Local Question** - Based on anything unusual from your research

**Generate FAQs with schema-ready formatting:**

```markdown
### Q: [Question]?
**A:** [Answer - 50-100 words, includes local specifics]
```

---

## LOCAL STATS CALLOUT BOX (Section 7)

**Pull from your research to populate:**

```markdown
## {{CITY}} HVAC Facts

| Metric | Data |
|--------|------|
| Average Summer High | [X]°F |
| Average Humidity | [X]% |
| Days Above 90°F | [X] days/year |
| Most Common AC Issue | [From research] |
| Average Home Age | [From research] |
| Local Utility | [Name] |
| Available Rebates | [Yes/No + brief detail] |
```

---

## FINAL CTA SECTION (Section 8)

**Requirements:**
- H2 with city name
- Urgency appropriate to context (not fake scarcity)
- Clear next step
- Phone number prominence

```markdown
## Ready for Reliable HVAC Service in {{CITY}}?

[2-3 sentences: Summarize value prop, reference local context one more time, clear CTA]

**Call Now: {{PHONE_NUMBER}}**
[Supporting text: hours, response time promise, or current availability]

[Alternative CTA: Schedule Online button text]
```

---

## CONTENT QUALITY CHECKLIST

Before finalizing, verify:

- [ ] City name appears 10-15 times naturally throughout content
- [ ] At least 5 specific neighborhoods are mentioned by name
- [ ] At least 3 local statistics are cited (climate, demographics, housing)
- [ ] Zero banned phrases are used
- [ ] Each section contains unique local context
- [ ] Word count is 800-1200 words total
- [ ] All research findings are incorporated
- [ ] Content could NOT be used for any other city without major rewrites
- [ ] FAQs include at least 3 city-specific questions
- [ ] Nearby cities are mentioned for internal linking

---

## SCHEMA MARKUP TO GENERATE

```json
{
  "@context": "https://schema.org",
  "@type": "HVACBusiness",
  "name": "{{BRAND_NAME}}",
  "description": "[Generate 150-200 char description]",
  "url": "{{PAGE_URL}}",
  "telephone": "{{PHONE_NUMBER}}",
  "areaServed": {
    "@type": "City",
    "name": "{{CITY}}",
    "containedInPlace": {
      "@type": "State",
      "name": "{{STATE}}"
    }
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "[RESEARCH: City latitude]",
    "longitude": "[RESEARCH: City longitude]"
  },
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
    "opens": "00:00",
    "closes": "23:59"
  },
  "priceRange": "$$",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "reviewCount": "[REALISTIC NUMBER BASED ON CITY SIZE]"
  }
}
```

Also generate FAQPage schema for all FAQs.

---

## INTERNAL LINKING REQUIREMENTS

Include natural links to:
- County hub page: `/{{STATE_ABBREV_LOWER}}/{{COUNTY_SLUG}}/hvac`
- 2-3 nearby city pages
- Service-specific pages if they exist:
  - `/services/ac-repair`
  - `/services/ac-installation`
  - `/services/heating`

---

## VARIABLES TO REPLACE

| Variable | Description |
|----------|-------------|
| `{{CITY}}` | City name (proper case) |
| `{{STATE}}` | Full state name |
| `{{STATE_ABBREV}}` | Two-letter state abbreviation (caps) |
| `{{STATE_ABBREV_LOWER}}` | Two-letter state abbreviation (lowercase) |
| `{{CITY_SLUG}}` | URL-friendly city name (lowercase, hyphens) |
| `{{COUNTY}}` | County name |
| `{{COUNTY_SLUG}}` | URL-friendly county name |
| `{{BRAND_NAME}}` | "CoolIt" |
| `{{PHONE_NUMBER}}` | Local tracking number for this area |
| `{{PAGE_URL}}` | Full page URL |

---

## EXAMPLE OUTPUT STRUCTURE

When you generate content, output in this format:

```markdown
---
# Frontmatter/Metadata
title: "[Generated Title]"
description: "[Generated Meta Description]"
keywords: [array of keywords]
city: "{{CITY}}"
state: "{{STATE}}"
county: "{{COUNTY}}"
---

# [H1]

[Hero subheadline]

[Trust bar]

---

[Intro paragraph]

---

## Why {{CITY}} Homeowners Trust Us...

[Content]

---

## HVAC Challenges in {{CITY}}

[Content]

---

[Continue with all sections...]

---

<!-- Schema Markup -->
<script type="application/ld+json">
[Generated Schema]
</script>
```

---

## FINAL INSTRUCTIONS

1. **RESEARCH FIRST** - Do not skip the research phase. Web search each data point.
2. **BE SPECIFIC** - Generic content fails. Every paragraph should have local details.
3. **CITE YOUR SOURCES** - When you find statistics, note where they came from.
4. **QUALITY OVER SPEED** - Take time to make this content genuinely unique.
5. **VERIFY ACCURACY** - Double-check city/county relationships, neighborhood names, and statistics.

**This content will be used to generate leads. Generic content = wasted ad spend. Local, specific, trustworthy content = conversions.**

---

## TO GENERATE A PAGE, CALL THIS PROMPT WITH:

```
Generate HVAC city page content for:
City: [CITY NAME]
State: [STATE NAME]
Brand: CoolIt
Phone: [TRACKING NUMBER]
```

The AI will then execute the full research and content generation process above.