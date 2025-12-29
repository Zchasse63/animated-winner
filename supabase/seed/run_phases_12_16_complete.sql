-- ============================================================================
-- Florida HVAC Cities - Phases 12-16 Consolidated Seed Script
-- ============================================================================
-- This file runs all city seed data for Phases 12 through 16
-- Cities 058-082 (25 cities total)
--
-- Phase 12: North Central Florida (058-060)
-- Phase 13: South Florida - Fort Lauderdale Area (063, 071-074)
-- Phase 14: Jacksonville Metro (061, 068, 075-077)
-- Phase 15: South Florida - Miami/Palm Beach (062, 064-065, 069-070)
-- Phase 16: Central Florida & Panhandle (066-067, 078-082)
--
-- Run this file to populate all 25 cities at once
-- ============================================================================

-- Set client encoding
SET client_encoding = 'UTF8';

-- ============================================================================
-- PHASE 12: NORTH CENTRAL FLORIDA (3 cities)
-- ============================================================================

\echo 'Loading Phase 12: North Central Florida...'

-- City 058: Clermont
\i 058_clermont_complete.sql

-- City 059: Lady Lake
\i 059_lady_lake_complete.sql

-- City 060: Eustis
\i 060_eustis_complete.sql

\echo 'Phase 12 complete: 3 cities loaded'

-- ============================================================================
-- PHASE 13: SOUTH FLORIDA - FORT LAUDERDALE AREA (5 cities)
-- ============================================================================

\echo 'Loading Phase 13: South Florida - Fort Lauderdale Area...'

-- City 063: Fort Lauderdale
\i 063_fort_lauderdale_complete.sql

-- City 071: Hollywood
\i 071_hollywood_complete.sql

-- City 072: Pembroke Pines
\i 072_pembroke_pines_complete.sql

-- City 073: Coral Springs
\i 073_coral_springs_complete.sql

-- City 074: Pompano Beach
\i 074_pompano_beach_complete.sql

\echo 'Phase 13 complete: 5 cities loaded'

-- ============================================================================
-- PHASE 14: JACKSONVILLE METRO (5 cities)
-- ============================================================================

\echo 'Loading Phase 14: Jacksonville Metro...'

-- City 061: Jacksonville
\i 061_jacksonville_complete.sql

-- City 068: St. Augustine
\i 068_st_augustine_complete.sql

-- City 075: Jacksonville Beach
\i 075_jacksonville_beach_complete.sql

-- City 076: Ponte Vedra Beach
\i 076_ponte_vedra_beach_complete.sql

-- City 077: Orange Park
\i 077_orange_park_complete.sql

\echo 'Phase 14 complete: 5 cities loaded'

-- ============================================================================
-- PHASE 15: SOUTH FLORIDA - MIAMI/PALM BEACH (5 cities)
-- ============================================================================

\echo 'Loading Phase 15: South Florida - Miami/Palm Beach...'

-- City 062: Miami
\i 062_miami_complete.sql

-- City 064: West Palm Beach
\i 064_west_palm_beach_complete.sql

-- City 065: Boca Raton
\i 065_boca_raton_complete.sql

-- City 069: Delray Beach
\i 069_delray_beach_complete.sql

-- City 070: Boynton Beach
\i 070_boynton_beach_complete.sql

\echo 'Phase 15 complete: 5 cities loaded'

-- ============================================================================
-- PHASE 16: CENTRAL FLORIDA & PANHANDLE (7 cities)
-- ============================================================================

\echo 'Loading Phase 16: Central Florida & Panhandle...'

-- City 066: Tallahassee
\i 066_tallahassee_complete.sql

-- City 067: Pensacola
\i 067_pensacola_complete.sql

-- City 078: Deltona
\i 078_deltona_complete.sql

-- City 079: St. Cloud
\i 079_st_cloud_complete.sql

-- City 080: Poinciana
\i 080_poinciana_complete.sql

-- City 081: Casselberry
\i 081_casselberry_complete.sql

-- City 082: Winter Springs
\i 082_winter_springs_complete.sql

\echo 'Phase 16 complete: 7 cities loaded'

-- ============================================================================
-- COMPLETION SUMMARY
-- ============================================================================

\echo ''
\echo '============================================================================'
\echo 'Phases 12-16 Complete!'
\echo '============================================================================'
\echo 'Total cities loaded: 25'
\echo '  - Phase 12 (North Central): 3 cities'
\echo '  - Phase 13 (Fort Lauderdale Area): 5 cities'
\echo '  - Phase 14 (Jacksonville Metro): 5 cities'
\echo '  - Phase 15 (Miami/Palm Beach): 5 cities'
\echo '  - Phase 16 (Central FL & Panhandle): 7 cities'
\echo ''
\echo 'All 82 Florida HVAC cities are now complete!'
\echo '============================================================================'
