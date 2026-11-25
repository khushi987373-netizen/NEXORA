# Build notes — NEXORA Material Lab v1.5.0

- Expanded the country data directory to all 249 ISO 3166-1 entries (countries and territories).
- Retained the 20 existing expanded qualitative profiles and added ISO alpha-2/alpha-3 identifiers to support stable Natural Earth/API matching.
- Added 229 baseline profiles with capital/geographic metadata where available, continental-scale geological context, research source links and explicit limitations.
- Added ISO-based API lookup so Natural Earth display-name variations resolve to the correct canonical country record.
- Updated the globe to Natural Earth 1:50m boundaries for a more complete country/territory directory.
- Commodity-level numeric data remain explicitly uncurated unless supported by claim-level sources; no invented production/reserve values were added.
- Backend tests: 11/11 passed. Frontend production build and live boundary download are not certified in this environment.

## Research basis
- USGS International Minerals Statistics and Information / Minerals Yearbook Volume III: https://www.usgs.gov/centers/national-minerals-information-center/international-minerals-statistics-and-information
- USGS Mineral Commodity Summaries 2026: https://doi.org/10.3133/mcs2026
- World Mining Data 2026: https://www.bmf.gv.at/en/topics/mining/mineral-resources-policy/wmd.html
- British Geological Survey World Mineral Statistics: https://www.bgs.ac.uk/mineralsuk/statistics/world-mineral-statistics/
- UN Comtrade: https://comtradeplus.un.org/en/trade-statistics?cmd=26

These are research routes and statistical references, not claim-level citations for every baseline country description.

Natural Earth 1:50m admin-0 country boundaries: https://github.com/nvkelso/natural-earth-vector/blob/master/geojson/ne_50m_admin_0_countries.geojson (source describes 258 mapped entities including dependencies).
