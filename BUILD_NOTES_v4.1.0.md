# NEXORA AI v4.1.0 — Unified Global Mineral Atlas

## Implemented
- Expanded the Atlas catalogue from 8 to 28 commodity/family entries spanning rare earths, battery minerals, base metals, ferrous minerals, industrial minerals, precious metals, energy minerals and selected critical minerals.
- Added conservative exact-label commodity aliases. Unknown source labels remain in the evidence registry and are not silently misclassified.
- Atlas record queries now merge curated atlas_records with compatible source-linked observations from the shared observations registry.
- Merged observations retain original commodity labels, source-defined units, measure type, data year, publication year, evidence status, source organization, title, URL, methodology and limitations.
- Added BGS sync action in the Atlas, calling the existing paginated BGS OGC API importer (production observations only).
- Added Atlas measure filters for resources, trade imports/exports, mine capacity and refining capacity in addition to reserves and production.
- Updated API health/version and package metadata to 4.1.0.
- Expanded local fallback catalogue so it matches the backend taxonomy.

## Data integrity rules
- Production is not reserves or resources.
- Trade is not domestic production or geological evidence.
- Refining capacity is not mine production.
- Original units and source commodity names are retained; no unit conversion is implied.
- Unknown source commodity labels are not mapped by fuzzy matching.
- Missing observations remain missing; no zero values are generated.
- LREE/HREE remain classifications, not estimated splits of total REO.

## Connectors and current status
- BGS World Mineral Statistics: live API ingestion is available through the Atlas button. This importer currently ingests production only. BGS describes API archive coverage as 1970–2022 and warns that API 0/NULL notation differs from yearbook symbols.
- USGS MCS 2026: source files are separate CSV tables. They still require explicit, table-specific column mapping before automatic import; USGS global production/reserve tables must not be confused with US-only salient statistics.
- World Mining Data 2026: workbook staging remains available; source-specific layouts and metal-content conventions require explicit mapping.
- IEA, World Bank, UN Comtrade, NASA and Copernicus connectors retain their distinct scopes. Price and scenario datasets are not treated as geological reserves.

## Testing
- Backend unit tests: 24 passed after the 4.1.0 changes.
- Python compileall: passed.
- Frontend production build: not verified in this environment because npm dependency installation could not complete (registry package unavailable in offline cache / install timeout). Run REPAIR_AND_BUILD.bat on Windows to install the correct Windows packages and build locally.
- Live BGS ingestion: not run automatically during packaging. Use the new Atlas button while the backend has internet access.
