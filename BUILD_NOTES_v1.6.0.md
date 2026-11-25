# NEXORA Material Lab v1.6.0 — Build notes

## Added
- SQLite-backed observation registry for source-linked country/commodity measures.
- Pydantic validation for ISO3, measure type, evidence status, years, URLs and units.
- Distinct measure types for production, reserves, resources, occurrence, exploration, trade, mine/refining capacity and petroleum.
- Deduplication for repeated source/year/commodity observations.
- Source registry for USGS, BGS, World Mining Data, IEA, EIA and UN Comtrade.
- Data-quality endpoint reporting missing years/methodology and evidence guardrails.

## Important boundaries
- No publisher data is silently fabricated or automatically scraped.
- The source catalogue is a registry, not proof that a dataset has been ingested.
- Trade data does not imply deposits; production does not imply reserves/resources.
- Existing 249 country/territory directory and 20 expanded qualitative profiles are retained.

## API
- GET `/api/intelligence/sources`
- GET `/api/intelligence/observations`
- POST `/api/intelligence/observations`
- GET `/api/intelligence/quality`
