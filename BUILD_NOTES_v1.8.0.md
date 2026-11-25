# NEXORA Material Lab v1.8.0 build notes

## New in this release
- Evidence-backed Production Intelligence dashboard.
- Filters for commodity, measure, reporting year and unit.
- Time-series view, country leaderboard, source comparison, observation register and CSV export.
- New API endpoint: `GET /api/intelligence/dashboard`.
- Empty-state messaging prevents unimported or illustrative values from appearing as facts.

## Data integrity
- Trends and rankings are computed only for a selected commodity and unit.
- Source comparisons retain publisher labels and methodology caveats.
- Production is not reserves/resources; trade is not geological occurrence evidence; missing values are not zero.

## Validation
- Python compileall and backend test suite are run for this package.
- Run `npm ci` and `npm run build` in `frontend` on the target PC to validate the production frontend bundle.
