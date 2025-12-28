-- ============================================
-- Master Seed File - Tampa Bay Metro Cities
-- Generated: December 24, 2024
-- ============================================

-- ============================================
-- HOW TO RUN IN SUPABASE SQL EDITOR
-- ============================================
--
-- Option 1: Use the combined file (RECOMMENDED)
-- Copy and paste the contents of ALL_CITY_SEEDS.sql into Supabase SQL Editor
-- This file contains all cities in one 120KB file (~2100 lines)
--
-- Option 2: Run individual files in order
-- 1. 001_tampa_complete.sql
-- 2. 002_tampa_hvac_content.sql
-- 3. 003_st_petersburg_complete.sql
-- 4. 004_clearwater_complete.sql
-- 5. 005_brandon_complete.sql
-- Then run the UPDATE statements below
--
-- ============================================

-- ============================================
-- Update nearby_city_ids after all cities exist
-- (Run this AFTER all city files are loaded)
-- ============================================

-- Tampa: link to St. Pete, Clearwater, Brandon
UPDATE cities SET nearby_city_ids = ARRAY[
  'b2c3d4e5-f6a7-8901-bcde-f23456789012', -- St. Petersburg
  'c3d4e5f6-a7b8-9012-cdef-345678901234', -- Clearwater
  'd4e5f6a7-b8c9-0123-def0-456789012345'  -- Brandon
]::uuid[]
WHERE id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- St. Petersburg: link to Tampa, Clearwater
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa
  'c3d4e5f6-a7b8-9012-cdef-345678901234'  -- Clearwater
]::uuid[]
WHERE id = 'b2c3d4e5-f6a7-8901-bcde-f23456789012';

-- Clearwater: link to Tampa, St. Pete
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890', -- Tampa
  'b2c3d4e5-f6a7-8901-bcde-f23456789012'  -- St. Petersburg
]::uuid[]
WHERE id = 'c3d4e5f6-a7b8-9012-cdef-345678901234';

-- Brandon: link to Tampa
UPDATE cities SET nearby_city_ids = ARRAY[
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890'  -- Tampa
]::uuid[]
WHERE id = 'd4e5f6a7-b8c9-0123-def0-456789012345';

-- ============================================
-- Verification Queries
-- ============================================

SELECT
  'Cities' as table_name,
  COUNT(*) as count
FROM cities
WHERE state_abbrev = 'FL'

UNION ALL

SELECT
  'City Research' as table_name,
  COUNT(*) as count
FROM city_research

UNION ALL

SELECT
  'Neighborhoods' as table_name,
  COUNT(*) as count
FROM neighborhoods

UNION ALL

SELECT
  'SEO Content' as table_name,
  COUNT(*) as count
FROM city_seo_content;

-- Show all cities with content status
SELECT
  c.name,
  c.state_abbrev,
  cr.population,
  (SELECT COUNT(*) FROM neighborhoods n WHERE n.city_id = c.id) as neighborhoods,
  csc.status as content_status,
  csc.word_count
FROM cities c
LEFT JOIN city_research cr ON c.id = cr.city_id
LEFT JOIN city_seo_content csc ON c.id = csc.city_id AND csc.vertical = 'hvac'
ORDER BY c.priority DESC;
