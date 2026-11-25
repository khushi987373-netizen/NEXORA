# NEXORA Material Lab v1.8.0 — validation report

## Passed
- Python compile check: `python -m compileall -q app import_observations.py`
- Backend tests: **18 passed**
- Dashboard endpoint contract test: observations, filter facets and interpretation note are present
- Existing material, country directory, evidence, source-ingestion and comparison tests remain green

## Not verified in this build environment
- Frontend production build: `npm ci` could not complete because dependency installation timed out; `vite` was therefore unavailable. Run `npm ci` and `npm run build` on the Windows PC with internet access.
- Live BGS API import: not run from this environment. Run it from Evidence Centre on the target PC after the backend is online.

No external production data was preloaded. The dashboard starts with a truthful empty state and displays imported evidence only.
