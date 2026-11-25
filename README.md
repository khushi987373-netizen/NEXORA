# NEXORA AI v4.1.0 — Unified Global Mineral Intelligence
**INTELLIGENCE BEYOND THE SURFACE**

NEXORA v4.1.0 expands the existing React/Vite + FastAPI research workspace. It is an incremental upgrade, not a replacement. It preserves the v2.0.0 local AI country research, Ollama integration, optional OpenAI/Gemini providers, 3D country globe, production evidence registry, material screening, 118-element periodic table, OCR, CSV workflows and extraction comparison.

## Workspace modules retained and expanded

- **Global Mineral Atlas:** expanded 27-entry commodity taxonomy, unified source-linked observation view, BGS production sync, and distinct reserves/resources/production/trade/capacity filters.
- **Earth Intelligence:** existing interactive globe and AI country mineral/petroleum research.
- **Satellite Vision:** links to NASA Worldview, USGS EarthExplorer, Copernicus Data Space and BGS GeoIndex, plus an interpretation checklist.
- **DeepCore Explorer:** interactive educational Earth-layer schematic and exploration workflow. The diagram is not to scale and is not a measured subsurface model.
- **Global Markets:** commodity research links and a market-analysis checklist. No unverified live prices are fabricated.
- **Material Lab:** retained application-led screening and comparison of up to eight candidates.
- **Material Library / Periodic Table:** retained catalogue and all 118 element entries.
- **Extraction Comparison:** retained method comparison.
- **Evidence Centre / Global Production:** retained evidence registry, source ingestion and production dashboard.
- **NEXORA Academy:** geology learning topics and an interactive knowledge check.
- **NEXORA AI Guide:** existing local workspace assistant and screenshot OCR.

## Windows installation

1. Install Node.js 20+ (LTS recommended) and Python 3.12+.
2. Extract this ZIP to a writable folder.
3. Run `REPAIR_AND_BUILD.bat` once. It performs a clean Windows npm install including optional platform packages, installs backend dependencies and attempts the frontend production build.
4. Run `START_NEXORA.bat`.
5. Open the local frontend URL shown in the terminal (normally `http://127.0.0.1:5173`). The API normally runs at `http://127.0.0.1:8000`; docs at `/docs`.

Keep both terminal windows open while using the app. Do not copy `node_modules` from another operating system.

## Local AI and optional providers

- Ollama is the local provider; install Ollama and pull the configured model (Qwen 2.5 7B in the supplied setup). Local inference does not provide live web grounding by itself.
- OpenAI and Gemini are optional. Configure keys in `backend/.env` using `backend/.env.example` and keep secrets out of the frontend.
- Run `CONFIGURE_AI_KEYS.bat` for the guided key setup.

## Scientific integrity

NEXORA distinguishes reserves, resources, occurrences, prospects, production, refining and trade. Missing values are not zero. Market portals link to publishers rather than presenting invented live quotes. Satellite imagery can show surface patterns but does not directly confirm underground ore. DeepCore is educational and schematic. Material comparisons are qualitative screening, not certified engineering advice.

## Test status for this package

- Backend unit tests: **26/26 passed** in the build environment.
- Backend Python byte-compilation: passed.
- Frontend production build: **not verified** in this environment because dependency installation timed out. Run `REPAIR_AND_BUILD.bat` on Windows.
- Browser interaction tests: **not performed** here. Use `BROWSER_TEST_CHECKLIST.md` and test the actual browser workflows after installation.
- External imagery/data portals and AI provider credentials require internet access and user-side configuration.

See `BUILD_NOTES_v3.0.0.md` and `TESTING_REPORT_v3.0.0.md` for details.


## NEXORA v3.1 — connected Earth and market sources

New live connector endpoints:

- `GET /api/earth/sources` — source catalogue for NASA GIBS/Worldview, Copernicus, USGS, BGS, World Bank and IEA.
- `GET /api/earth/nasa/layers` — supported NASA GIBS visualization layers.
- `GET /api/earth/nasa/preview?layer=MODIS_Terra_CorrectedReflectance_TrueColor&date=YYYY-MM-DD` — NASA GIBS WMS GetMap URL for a dated global imagery preview.
- `GET /api/markets/world-bank?limit=12` — fetches the latest linked World Bank Pink Sheet monthly workbook and returns recent global benchmark observations for common metal series. Requires `openpyxl`; the backend discovers the current workbook URL from the official World Bank Commodity Markets page.
- `GET /api/intelligence/country/{ISO3}` — returns only source-linked records already imported for that country, with explicit counts for reserves, resources, production, occurrences and trade.

Country narrative research remains available for every country/territory in the globe through the AI Country Analyst. OpenAI web search and Gemini grounding can research current country-specific publications; local Ollama does not have live web search and must not be represented as grounded. The USGS Mineral Commodity Summaries 2026 release is a primary source for country reserve/resource tables where each commodity chapter reports them. The country registry will remain incomplete until those source tables are mapped/imported; it does not invent values for missing country/commodity combinations.

### Data interpretation

- NASA GIBS layers are pre-rendered satellite visualizations, not raw sensor data and not direct detection of buried ore bodies.
- World Bank Pink Sheet prices are global monthly benchmark prices in nominal USD and series-specific units; they are not national transaction prices or real-time quotes.
- BGS World Mineral Statistics contains historical production/trade statistics; it does not establish reserves. Its API has special NULL/zero conventions that must be checked against the yearbook.
- IEA critical-minerals scenario data is market/demand analysis, not a geological reserve inventory.
- A country with no imported reserve record is marked as a data gap, never as having zero reserves.

NASA GIBS attribution: “We acknowledge the use of imagery provided by services from NASA's Global Imagery Browse Services (GIBS), part of NASA's Earth Science Data and Information System (ESDIS).”


## NEXORA v4.0 — Global Mineral Intelligence

### Global Mineral Atlas
- New `/api/atlas/*` API and **Global Mineral Atlas** workspace page.
- Curated starter records transcribed from the USGS *Mineral Commodity Summaries 2026*, Rare Earths chapter: 2025 mine production and reserve figures for countries where the report publishes values.
- Figures retain REO-equivalent units, data year, publication year, publisher and report URL. Unavailable (`NA`) values are omitted rather than converted to zero.
- The 17-element family is shown (15 lanthanides, yttrium and scandium). USGS states that this REO series includes lanthanides and yttrium but excludes most scandium. LREE/HREE families are classified for reference, but the source table is not split into country-level LREE/HREE reserves. NEXORA does not invent that split.
- Deposit registry supports source-linked named deposits, geology, coordinates, status and evidence class through `POST /api/atlas/deposits`; the initial release intentionally contains no invented deposit locations.
- The official rare-earth chapter table reports Brazil at 21 Mt REO reserves. Australia is reported at 6.3 Mt total reserves, with a footnote identifying 3.3 Mt as JORC-compliant or equivalent.

### New API endpoints
- `GET /api/atlas/summary`
- `GET /api/atlas/commodities`
- `GET /api/atlas/records?country_iso3=CHN&commodity_id=ree-total&measure_type=reserves`
- `GET /api/atlas/deposits?country_iso3=USA&commodity=rare`
- `POST /api/atlas/deposits` — add a deposit with a claim-level source URL

### Important coverage note
This is the first curated slice, not a complete database of all minerals or all countries. Lithium and other commodities are not populated in this release pending table-level validation and source reconciliation. Continue importing evidence through reviewed source-specific adapters; production, resources, reserves, trade and refining capacity must remain separate measures.


## v4.0.1 Mineral Atlas repair
The ranking panel now follows the selected measure (reserves or mine production), and empty states explain whether a commodity has not yet been imported or a filter simply has no matches. See `BUILD_NOTES_v4.0.1.md`.


## v4.1.0 — Unified Global Mineral Atlas

- The Atlas catalogue now contains 27 mineral groups/commodities. A catalogue entry is not a claim that country-level data exists for it.
- Atlas records merge curated reserve/production records with matching source-linked observations in the shared intelligence registry. Source commodity labels, units, years, publisher, source URL and limitations remain visible.
- Use **Sync BGS production** in the Atlas to import BGS World Mineral Statistics production observations. This is a live, user-triggered request and requires backend internet access.
- The Atlas measure selector now includes reserves, resources, mine production, trade imports, trade exports, mine capacity and refining capacity. These measures are never combined.
- USGS MCS 2026 and World Mining Data remain staged sources: their separate tables/workbooks need explicit table-specific mapping before import.
- See `BUILD_NOTES_v4.1.0.md`, `TESTING_REPORT_v4.1.0.md` and `INSTALL_v4.1.0.txt`.
