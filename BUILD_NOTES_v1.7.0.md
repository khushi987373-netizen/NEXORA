# NEXORA Material Lab v1.7.0

## Added
- `backend/app/source_ingestion.py`: BGS OGC API production ingestion, source status, run history and normalized CSV preview/import.
- `backend/import_observations.py`: command-line CSV preview/commit utility.
- `backend/data/ingest/normalized_observations_template.csv`: documented normalized import header and explicitly fictitious example row.
- `DATA_INGESTION_v1.7.0.md`: USGS/BGS/WMD source-specific workflow and methodological limitations.
- Evidence Centre BGS live-import control and result display.

## Validation
- Python compilation: passed.
- Backend tests: 17 passed.
- Normalized CSV dry-run: passed; no records committed.
- Frontend production build: not run successfully; Vite executable is not installed in this environment (`vite: not found`). Run `npm ci` then `npm run build` on the target Windows machine.
- Live BGS sync: not executed in this environment because outbound DNS/network access is unavailable. Use the Evidence Centre import button on a machine with internet access.

## Data integrity notes
- BGS imports only rows whose statistic type contains `production`; BGS trade rows are excluded.
- Imported BGS observations are labelled `reported`; they are not independently audited by NEXORA.
- The BGS API landing page describes the service as beta and states archive coverage through 2022. Its zero/NULL encoding differs from the yearbook symbols; inspect the original notes.
- USGS 2026 is a set of distinct CSV tables and metadata, not one undifferentiated table. Explicit table mapping is required.
- WMD 2026 workbook has source-specific layout and calculated metal-content conventions; explicit mapping is required.
- Trade is never used to infer mineral deposits, reserves or mine production.
