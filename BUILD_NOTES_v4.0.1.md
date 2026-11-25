# NEXORA AI v4.0.1 — Mineral Atlas repair

## Fixed
- Country ranking now follows the selected measure: reserves or mine production. Previously the ranking always filtered for reserves, so selecting mine production incorrectly produced an empty reserve message.
- Empty states now distinguish between a commodity with no imported country records, a measure with no records, and filters that return no matches.
- Added a dataset coverage notice and a one-click return to the available rare-earth records when a catalogue-only commodity is selected.

## Data coverage reminder
The v4.0 starter database contains country-level total rare-earth production and reserve records from the USGS 2026 summary. LREE/HREE are currently taxonomy categories only; lithium, cobalt, nickel, graphite and copper are catalogued but their country-level records are not yet imported. Missing records are not zeros.

## Verification
- Reviewed the ranking/filter logic against the seeded SQLite records.
- Backend dataset and API are unchanged from v4.0.
- Frontend production build should be run locally with `npm install` followed by `npm run build` (network/dependency installation was not available in the build environment).
