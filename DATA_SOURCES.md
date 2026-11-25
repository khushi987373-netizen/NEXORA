# NEXORA v1.3.0 — Data-source register and evidence policy

A source link is a research entry point. It does not by itself validate a specific country-resource statement. Use the exact report, dataset release, country record, definitions and data period supporting each claim.

| Publisher | Dataset / publication | Intended use | Important limitation |
|---|---|---|---|
| USGS | [Mineral Commodity Summaries 2026](https://www.usgs.gov/publications/mineral-commodity-summaries-2026) | Commodity-level production and reserve statistics where reported | Coverage and definitions differ by commodity; consult the individual chapter. |
| USGS | [Mineral Resources Data](https://www.usgs.gov/programs/mineral-resources-program/mineral-resources-data) | Mineral occurrence/resource data discovery | Dataset scope, geography, vintage and status must be checked. |
| British Geological Survey | [World Mineral Statistics](https://www.bgs.ac.uk/mineralsuk/statistics/world-mineral-statistics/) | Country-level mineral production statistics where reported | Production does not establish reserves, resources or occurrences. |
| Austrian Federal Ministry / World Mining Data | [World Mining Data](https://www.bmf.gv.at/en/topics/mining/mineral-resources-policy/wmd.html) | International mineral production comparisons | Production is not a reserve or resource estimate. |
| US Energy Information Administration | [International Analysis](https://www.eia.gov/international/analysis/world) | Petroleum and natural-gas country context where published | Distinguish production, consumption, proved reserves and resources. |
| International Energy Agency | [Critical Minerals Data Explorer](https://www.iea.org/data-and-statistics/data-tools/critical-minerals-data-explorer) | Critical-mineral mining, refining, supply and demand context | Not a national deposit register; check scenario and data definitions. |
| International Energy Agency | [Critical Minerals Dataset](https://www.iea.org/data-and-statistics/data-product/critical-minerals-dataset) | Downloadable critical-mineral data | Check release date, scope, units and licensing. |
| UN Comtrade | [Trade statistics](https://comtradeplus.un.org/en/trade-statistics?cmd=26) | Reported international trade in ores and related products | Trade flows are not proof of domestic reserves or deposits. |

## National geological authorities

- Australia — [Geoscience Australia](https://www.ga.gov.au/)
- Brazil — [Brazilian Geological Survey](https://www.sgb.gov.br/)
- Canada — [Natural Resources Canada](https://natural-resources.canada.ca/)
- Chile — [SERNAGEOMIN](https://www.sernageomin.cl/)
- Democratic Republic of the Congo — [USGS National Minerals Information Center](https://www.usgs.gov/centers/national-minerals-information-center)
- India — [Geological Survey of India](https://www.gsi.gov.in/)
- Indonesia — [Ministry of Energy and Mineral Resources](https://www.esdm.go.id/)
- Japan — [Geological Survey of Japan / AIST](https://www.gsj.jp/en/)
- Mexico — [Servicio Geológico Mexicano](https://www.sgm.gob.mx/)
- Peru — [INGEMMET](https://www.gob.pe/ingemmet)
- South Africa — [Council for Geoscience](https://www.geoscience.org.za/)
- Türkiye — [MTA](https://www.mta.gov.tr/)
- United States — [USGS](https://www.usgs.gov/)

## Required claim-level fields

Every numeric or specific country-resource claim added to the database must include:

- Country identifier and canonical country name.
- Commodity and category.
- Evidence class: occurrence, exploration prospect, resource, reserve, production, refining/processing capacity or trade.
- Value and unit, when numeric.
- Data period and publication year.
- Publisher and exact report/dataset record URL.
- Definition and methodology used by the source.
- Geographic scope and relevant deposit/basin/region, where documented.
- Limitations and uncertainty.

## Scientific guardrails

- Production is not reserves; reserves are not total resources.
- A mineral occurrence is not automatically an economic deposit.
- Exploration prospects are not proven resources.
- Refining capacity does not prove domestic mining.
- Trade does not prove domestic deposits.
- Basin presence does not prove commercially recoverable petroleum or gas.
- Missing data is not evidence of geological absence.
- Do not fill gaps with generic prose or extrapolation.

## v1.3 coverage statement

The API now provides a structured resource schema and explicit commodity rows for every requested country profile. The inherited qualitative overview summaries remain limited to the curated country set. Commodity-specific, claim-level records have not yet been researched and independently verified country-by-country. The UI therefore labels those records as not curated and displays “Data not currently available from verified sources.” This is intentional and scientifically safer than invented values.


## Country intelligence expansion (v1.4.0)

The country profile records now include qualitative geological setting/history, geological provinces, selected formations, resource-sector context and mining/processing context for the 20 country seed records. These are research-oriented syntheses and discovery guides, not a fully cited deposit register. National geological survey links are starting points; users should consult the exact map sheet, bulletin, mineral yearbook or dataset for any deposit-specific claim.

Cross-country reference frameworks used to guide the evidence model:
- USGS, *Mineral Commodity Summaries 2026* (2025 world production estimates and commodity-specific reserve/resource tables): https://doi.org/10.3133/mcs2026
- Austrian Federal Ministry of Finance, *World Mining Data 2026* (country/commodity production series): https://www.bmf.gv.at/en/topics/mining/mineral-resources-policy/wmd.html
- British Geological Survey, *World Mineral Statistics*: https://www.bgs.ac.uk/mineralsuk/statistics/world-mineral-statistics/
- US Energy Information Administration, International: https://www.eia.gov/international/

No new numerical production, reserve or resource values were inserted in v1.4.0. Commodity-level rows remain explicitly uncurated until the exact source, publication year, data period, unit, definition and geographic scope are recorded.


## v3.1 connected source integrations

- NASA GIBS / Worldview WMS & WMTS: https://nasa-gibs.github.io/gibs-api-docs/ — image visualization services.
- Copernicus Data Space APIs (STAC, OData, Sentinel Hub Catalog, openEO): https://documentation.dataspace.copernicus.eu/APIs.html
- USGS Mineral Resources Data and MCS 2026: https://www.usgs.gov/programs/mineral-resources-program/mineral-resources-data and https://www.usgs.gov/publications/mineral-commodity-summaries-2026
- BGS World Mineral Statistics OGC API: https://ogcapi.bgs.ac.uk/collections/world-mineral-statistics
- World Bank Commodity Markets Pink Sheet: https://www.worldbank.org/en/research/commodity-markets
- IEA Critical Minerals Data Explorer: https://www.iea.org/data-and-statistics/data-tools/critical-minerals-data-explorer

The connectors are intentionally source-specific. Satellite visualization, production statistics, benchmark prices, reserve tables and scenario projections are separate evidence classes and must not be merged into one “resource” number.


## v4.0 curated Global Mineral Atlas data

- **USGS Mineral Commodity Summaries 2026**, Rare Earths chapter, pp. 152–153 in the full report. The table reports 2025 mine production and reserves in metric tonnes of rare-earth-oxide (REO) equivalent. Full report: https://pubs.usgs.gov/periodicals/mcs2026/mcs2026.pdf
- **USGS Rare Earths chapter PDF**: https://pubs.usgs.gov/periodicals/mcs2026/mcs2026-rare-earths.pdf. A Brazil reserve figure differs from the full report; the atlas records this conflict rather than hiding it.
- LREE/HREE element groupings are presented as a taxonomy only. The cited country table does not provide separate country-level LREE/HREE reserve figures.
- USGS `NA` is treated as unavailable; an em dash is treated as zero only where the report's footnotes explicitly define it as zero.


## v4.1.0 unified Atlas ingestion notes

The Atlas can display exact-name-mapped observations from the shared evidence registry. BGS World Mineral Statistics live sync currently imports production records only. Its OGC API archive covers 1970–2022 according to BGS service documentation, and its API encodes unavailable, nil and estimated values differently from the yearbook; consult the original source notes before interpreting zeros or nulls.

USGS MCS 2026 is a set of separate CSV entities and metadata files covering more than 90 nonfuel mineral commodities. The release includes U.S. salient statistics and world production/reserve tables; each table must be mapped independently to avoid treating U.S.-only values as global country observations. World Mining Data uses its own workbook layout and contained-metal conventions. Both remain staging sources until each table's fields and units have been reviewed.

Exact commodity aliases are intentionally conservative. If a publisher uses a new or ambiguous label, the observation remains available in the evidence registry but is not forced into an Atlas commodity category.
