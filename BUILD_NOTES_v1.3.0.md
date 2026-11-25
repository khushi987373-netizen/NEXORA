# NEXORA v1.3.0 — Build notes

## Windows dependency strategy

- Backend requirements continue to use core `uvicorn` rather than `uvicorn[standard]`; no optional PyYAML extra is required by this application.
- `REPAIR_AND_BUILD.bat` performs a clean npm install with `npm ci --include=optional --no-audit --no-fund` and then invokes `npm run build` on the Windows host.
- The existing `package-lock.json` is retained and its root package version is updated to 1.3.0. Platform-specific optional Rollup dependencies remain lockfile-managed; do not install or copy Linux binaries onto Windows.

## v1.3 changes

- Added the external structured country seed file at `backend/data/country_resources.json`.
- Added explicit API fields for ISO identifiers, geological context, coverage, commodity evidence rows, petroleum/gas fields, mining/processing context, source provenance, freshness and limitations.
- Added source adapter primitives for bounded JSON retrieval, timeout, TTL cache, response-size limit and graceful failure.
- Added expandable resource category UI in Earth Explorer.
- Added `COUNTRY_DATA_SCHEMA.md`, expanded source documentation and updated browser checklist.

## Verification status

Backend compilation and nine unit tests passed. HTTP smoke tests passed for health, country lookup (including aliases and an uncurated fallback), materials and comparison (eight accepted; ninth rejected). Frontend JSX syntax parsing passed.

The packaging environment could not finish `npm ci` before timeout; a build attempt then reported `vite: not found`. Therefore a fresh Vite production build and real browser interaction test remain unverified and must be run on Windows using `REPAIR_AND_BUILD.bat` and `BROWSER_TEST_CHECKLIST.md`.
