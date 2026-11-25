# NEXORA Material Lab v1.4.0 — Testing report

## Passed
- Python compilation of `backend/app/countries.py`.
- Backend unit suite: 10/10 tests passed.
- All 20 country seed records return expanded qualitative geology and industry fields.
- Each country profile includes at least three named geological regions and two formations/units.
- Existing material catalogue, comparison, country aliases, source-adapter failure handling and missing-country evidence guardrails pass.
- ZIP archive integrity checked after packaging.

## Not completed
- Frontend production build was not run: `npm ci` did not finish before the environment time limit, so frontend dependencies were unavailable.
- Browser interaction tests were not run. Please run `REPAIR_AND_BUILD.bat` on Windows and complete `BROWSER_TEST_CHECKLIST.md`.

## Coverage note
The expanded data file contains 20 curated country seed records. The globe directory is dynamically loaded from Natural Earth and can display additional countries/territories; these still receive the explicit not-curated fallback in this release. The release does not claim full geological intelligence for every Natural Earth feature.
