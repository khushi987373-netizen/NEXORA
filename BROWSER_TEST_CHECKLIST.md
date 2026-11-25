# NEXORA v1.3.0 — Browser smoke-test checklist

This checklist is for the Windows machine after `REPAIR_AND_BUILD.bat` completes successfully. It is not a claim that browser tests have already been run.

## Start the application

1. Run `START_NEXORA.bat`.
2. Keep both terminal windows open.
3. Open `http://127.0.0.1:5173` in Chrome or Edge.
4. Open `http://127.0.0.1:8000/api/health` in another tab and confirm the JSON status is `ok`.

## Check these interactions

- [ ] Dashboard renders without a blank screen or red browser-console exception.
- [ ] Main navigation opens Overview, Material Lab, Earth Explorer, Material Library, Periodic Table, Extraction Comparison, Evidence Centre and NEXORA Guide.
- [ ] Material Lab accepts a plain-language application brief and displays candidate suggestions.
- [ ] Search filters the material catalogue.
- [ ] Add candidates to comparison; confirm the interface prevents adding a ninth candidate.
- [ ] Open a material profile and follow an associated element link.
- [ ] Periodic Table displays all 118 elements and opens an element detail.
- [ ] Earth Explorer renders the interactive globe after external map assets load.
- [ ] Click India, then another country; verify the selected country, ISO identifiers, continent and details panel update without reloading.
- [ ] Expand/collapse Metallic ores, Industrial minerals, Petroleum & natural gas, and Rare-earth & critical minerals.
- [ ] Confirm unverified commodity rows display “Data not currently available from verified sources.” and are not presented as zero production or absent deposits.
- [ ] Confirm the country panel shows coverage status and source limitations.
- [ ] Open a country without a curated profile; verify the UI clearly labels missing country-specific information.
- [ ] Evidence/source links open their original publishers.
- [ ] OCR accepts an image containing text and displays extracted text or a clear error.
- [ ] CSV export downloads a readable file.
- [ ] Resize the browser to a narrow/mobile width; confirm navigation and panels remain usable.

## Report a failure

If an item fails, record the browser name/version, the exact step, and the first red error from Chrome/Edge DevTools Console. Do not treat a globe data-provider timeout as a frontend build failure; the globe depends on external assets/data and should show an understandable loading or error state.


## NEXORA v3.0 expansion checks

- [ ] Sidebar opens Satellite Vision and each external data portal link.
- [ ] Satellite interpretation checklist is visible on mobile and desktop.
- [ ] DeepCore layer buttons select Crust, Mantle, Outer Core and Inner Core descriptions.
- [ ] DeepCore diagram remains labelled schematic / not to scale.
- [ ] Global Markets commodity selector changes the research topic label.
- [ ] Global Markets source links open their publishers; no live price is implied.
- [ ] NEXORA Academy answer selection and Check answer feedback work.
- [ ] NEXORA Guide routes satellite, DeepCore, market and Academy questions to the matching module.
- [ ] Version metadata and page title show NEXORA AI v3.0.
