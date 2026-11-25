# NEXORA v1.9.0 testing report

## Passed
- Python backend source compilation (`python -m compileall -q app`).
- Backend test suite: **16 passed**.
- Test coverage includes health/version, material catalogue, comparison, removal of old country-profile endpoints, AI status key-safety, reserve/resource/production wording safeguards, OpenAI response/citation normalization, Gemini grounding-source normalization, source registry, observation validation and CSV import preview.
- Old static country profile module and country profile JSON dataset are absent from the release tree.
- New country research endpoints are present: `/api/ai/status` and `/api/ai/country-research`.
- Frontend JSX delimiter counts were checked; full compiler validation remains pending.

## Not verified in this environment
- Vite production build: `npm ci` did not complete before the environment timeout; consequently `npm run build` reports `vite: not found` here. Run `REPAIR_AND_BUILD.bat` on Windows with working npm registry access.
- Live OpenAI/Gemini requests: not run because no user API keys were supplied. Provider request/response parsing was verified with mocked API payloads.
- Browser interaction and real-world reserve report accuracy: must be checked after configuring a provider key on the user's computer. Validate cited source links and the original source report before relying on numerical claims.

## Recommendation
Configure at least one API key in `backend/.env`, run the Windows repair/build script, launch NEXORA, select a test country, and compare the AI's reserve values with the linked national geological/petroleum authority reports.
