# NEXORA AI v3.1.0 — connected Earth intelligence

## Implemented

- Added NASA GIBS layer catalogue and dated WMS preview URL endpoint.
- Added in-app NASA imagery preview with layer and date selection.
- Added a live World Bank Pink Sheet workbook connector with current workbook discovery, parsing of monthly metal benchmark series, source URL and retrieval timestamp.
- Added connected-source catalogue for NASA GIBS, Copernicus Data Space, USGS Mineral Resources, BGS World Mineral Statistics, World Bank and IEA.
- Added country evidence registry endpoint with separate counts for reserves, resources, production, occurrences and trade.
- Connected the country analyst panel to the country evidence registry.
- Preserved the existing AI country research flow, globe, material lab and other v2 features.
- Added data interpretation notes and NASA attribution in documentation.

## Automated checks completed

- Python compilation: passed.
- Backend unit tests: 18/18 passed.
- NASA GIBS layer catalogue and WMS URL generation tests: passed.
- Country evidence missing-data guardrail test: passed.
- Source catalogue test: passed.
- ZIP integrity check: to be run after packaging.

## Not verified in this environment

- Live NASA GIBS imagery retrieval, World Bank workbook download, BGS network sync and Copernicus downloads could not be exercised because this build environment has no outbound DNS/network access. The connectors are implemented but live publisher availability must be checked on the user's computer.
- Frontend production build and browser interaction tests were not run because frontend npm dependencies are not installed and the environment cannot reach npm. Run `REPAIR_AND_BUILD.bat` on Windows to install the correct platform dependencies and build.
- USGS country reserve tables are linked to the official MCS/USMIN sources and can be researched by the web-grounded country analyst. They are not yet bulk-ingested into a complete structured global reserve database. The country evidence registry only reports records actually imported.

## Important limitations

- NASA imagery shows surface/environmental patterns; it does not directly identify buried ore bodies or certify reserves.
- World Bank Pink Sheet values are monthly global benchmarks, not real-time exchange prices or country-level sale prices.
- BGS historical production is not reserves.
- USGS reserve/resource coverage is commodity- and country-specific; absence of a table entry is not evidence of zero reserves.
- OpenAI web search/Gemini grounding require configured credentials. Ollama is local and does not perform live web search.
