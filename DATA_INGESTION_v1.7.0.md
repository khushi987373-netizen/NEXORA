# NEXORA v1.7.0 — source ingestion

## What is automated

### BGS World Mineral Statistics API

The Evidence Centre now has an **Import BGS production** action. It calls `POST /api/intelligence/sync?source=bgs-wms&dry_run=false` and imports records whose BGS statistic type is production. The adapter retains the BGS commodity label, country ISO3, year, quantity and units. It does not import BGS trade rows and does not convert production into reserves, resources or occurrences.

BGS describes its OGC API as a beta archive. Its collection landing page currently states archive coverage through 2022. The service documents special symbol handling: unavailable values may be `NULL`; nil is `0`; estimated values may also be represented as `0`. Therefore review the original yearbook/table notes before using ambiguous values in analysis. The import is labelled `reported`, not `verified`.

Official endpoints:
- Collection: https://ogcapi.bgs.ac.uk/collections/world-mineral-statistics
- Items: https://ogcapi.bgs.ac.uk/collections/world-mineral-statistics/items
- BGS API terms and conditions: https://www.bgs.ac.uk/mineralsuk/statistics/world-mineral-statistics/world-mineral-statistics-data-download/

## USGS Mineral Commodity Summaries 2026

USGS publishes separate CSV table files and metadata files in the 2026 data release (DOI: https://doi.org/10.5066/P1WKQ63T). The tables have different meanings (US salient statistics, world production, reserves/resources and related metadata). Do not merge them into one generic quantity column or treat a US-only statistic as a world-country observation.

Download the appropriate CSV table(s) from the official release page, map the columns into the normalized template below, and preview before committing. Preserve the specific table name, row definition, unit, data period, publication year, source URL and any US-only/world scope in the row metadata.

Official release: https://www.usgs.gov/data/mineral-commodity-summaries-2026-data-release
Publication: https://www.usgs.gov/publications/mineral-commodity-summaries-2026

## World Mining Data 2026

The Austrian Federal Ministry of Finance publishes Excel workbooks, including Chapter 6.4 (production of mineral raw materials by country and mineral) and Chapter 6.5 (country shares of world production). The 2026 edition covers 65 mineral commodities and 168 countries, with 2020–2024 production series. Its methodology notes that some unavailable producer-area figures are carefully estimated and that the statistics largely relate to calculated metal content in concentrates. Retain these distinctions and do not label estimates as measured mine output.

Download the exact workbook from the official page. Inspect the workbook's sheet names, header rows, units, notes and calculation basis before mapping. The source-specific spreadsheet is not auto-flattened because its multi-level layout and metal-content conventions require a reviewed mapping.

Official page: https://www.bmf.gv.at/en/topics/mining/mineral-resources-policy/wmd.html

## Normalized CSV import

A template is provided at `backend/data/ingest/normalized_observations_template.csv`.

Required columns:

`country_iso3,country_name,commodity,measure_type,value,unit,data_year,publication_year,evidence_status,source_organization,source_title,source_url`

Optional columns:

`definition,methodology,geographic_scope,limitations`

Allowed measure types are `production`, `reserves`, `resources`, `occurrence`, `exploration_prospect`, `trade_imports`, `trade_exports`, `mine_capacity`, `refining_capacity`, `petroleum_production`, and `petroleum_reserves`.

Preview (no database changes):

```bash
cd backend
python import_observations.py data/ingest/your_normalized_file.csv --source usgs-mcs-2026
```

Commit after reviewing the preview:

```bash
python import_observations.py data/ingest/your_normalized_file.csv --source usgs-mcs-2026 --commit
```

Replace `usgs-mcs-2026` with `world-mining-data-2026` or `bgs-wms` as appropriate. Imports are idempotent for the same country, commodity, measure, year and source URL.

## API

- `GET /api/intelligence/sources` — source catalogue and ingestion modes.
- `POST /api/intelligence/sync?source=bgs-wms&dry_run=true` — preview BGS import.
- `POST /api/intelligence/sync?source=bgs-wms&dry_run=false` — import BGS production.
- `GET /api/intelligence/sync/history` — prior sync runs.
- `GET /api/intelligence/observations` — query observations.
- `GET /api/intelligence/quality` — registry quality summary.
- `GET /api/intelligence/dashboard` — observations and filter facets for the Production Intelligence dashboard (added in v1.8.0).

## Operational cautions

- The app does not silently infer mineral deposits from trade, export, processing or production data.
- Keep production, reserves, resources, occurrences, exploration, trade and capacity in distinct measure types.
- Preserve source publication year separately from data year.
- `reported` is the default status for imported aggregate statistics; only upgrade evidence status after claim-level validation.
- Check publisher licensing and attribution requirements before redistributing data. BGS terms differ from USGS CC0; World Mining Data workbook use must follow the publisher's terms.
- A successful API response means the records were retrieved and stored, not that the underlying source values were independently audited by NEXORA.
