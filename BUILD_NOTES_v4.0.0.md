# NEXORA AI v4.0.0 — Global Mineral Intelligence

## Delivered
- Added Global Mineral Atlas workspace page.
- Added atlas API for summary, commodity taxonomy, country records and source-linked deposits.
- Seeded USGS MCS 2026 rare-earth 2025 mine production/reserve records (REO equivalent).
- Added LREE/HREE element-family taxonomy without fabricating separate reserve estimates.
- Added deposit registry with coordinate, geology, status and source fields.
- Updated version and Windows launcher labels.

## Validation
- Backend unit tests: 26 passed.
- Python compilation: passed.
- Frontend production build: not yet verified in this environment because npm dependencies are not installed and network access is unavailable.

## Known data limitations
- Initial data slice is rare earths only. Other mineral commodities are staged in the catalogue but not yet populated.
- No deposit coordinates are seeded without claim-level source validation.
- The official USGS rare-earth chapter reports Brazil at 21 Mt REO reserves in both the full MCS 2026 report and the versioned chapter PDF; the earlier draft discrepancy note was removed after checking the official chapter table.
- The rare-earth family taxonomy includes 17 elements (15 lanthanides, yttrium and scandium). The USGS total REO series includes lanthanides and yttrium but excludes most scandium. Total REO does not establish country-level LREE/HREE reserve composition.
