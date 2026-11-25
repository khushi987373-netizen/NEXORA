# NEXORA AI v4.0.2 — Commodity catalogue reliability fix

## Fixed
- The Atlas commodity selector now starts with a local built-in catalogue of eight commodities/groups, so it is not blank while the backend loads.
- The commodity catalogue request now checks HTTP status and validates the response shape.
- If the catalogue endpoint fails or is missing on an older backend, the UI keeps the built-in list and displays a clear warning rather than silently rendering an empty selector.
- Atlas record API failures now explain that the user should restart NEXORA from the v4.0.2 folder.
- Backend health/version reports v4.0.2.

## Data integrity
- The built-in catalogue is taxonomy/metadata only. It does not invent country reserve or production values. The curated country-level data remains the USGS 2026 total rare-earth starter dataset.
- Lithium, cobalt, nickel, graphite and copper remain catalogue entries pending source-validated country data ingestion. LREE/HREE remain classifications, not separate reserve estimates.
