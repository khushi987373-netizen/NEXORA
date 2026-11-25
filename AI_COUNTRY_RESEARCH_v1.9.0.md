# NEXORA v1.9.0 — Country AI Research Analyst

## What changed

The old static country intelligence/profile layer has been removed, including its country profile JSON catalogue and `/api/countries` endpoints. The interactive 3D globe and country directory remain only as geographic selectors. Selecting a country no longer loads a hard-coded profile.

The new **Country AI analyst** can research a selected country using either:

- **OpenAI Responses API + web search** (`OPENAI_API_KEY`, default model `gpt-5.4`).
- **Google Gemini + Google Search grounding** (`GEMINI_API_KEY`, default model `gemini-3.8-flash`).

You can configure one provider or both and switch between them in the app. Keys are read only by FastAPI and are never sent to the browser.

## Configure the AI keys on Windows

1. Open the extracted NEXORA folder.
2. Open `backend`.
3. Copy `.env.example` and rename the copy to `.env`.
4. Open `.env` in Notepad.
5. Paste your key after `OPENAI_API_KEY=` or `GEMINI_API_KEY=` (or configure both).
6. Save the file and restart NEXORA.
7. Open **Country AI analyst**, select a country, choose the provider and click **Generate full country resource report**.

Get keys from:
- OpenAI: https://platform.openai.com/api-keys
- Google AI Studio: https://aistudio.google.com/app/apikey

API usage may incur charges or be subject to account quotas. Review provider pricing and terms before use. Never paste a secret key into a public frontend, source file, screenshot or shared ZIP.

## What the research prompt covers

- Metallic ores and critical minerals, including iron ore, bauxite, copper, gold, silver, zinc, lead, nickel, cobalt, lithium, manganese, chromium, tin, tungsten, uranium, rare earths, graphite and other relevant commodities.
- Industrial minerals and gemstones where relevant.
- Proven/proved, probable and possible reserves where separately reported; measured, indicated, inferred and other resources separately.
- Crude oil and natural gas reserves, production, major fields and sedimentary basins; offshore/onshore context; LNG, refineries, pipelines, export infrastructure and operators.
- Quantity, unit, data year/reference date, classification, grade/quality, deposits/fields and producing status.
- Geology, tectonic provinces, mining/refining capacity, supply chains, trade, regulation, fiscal terms, environment, community factors and outlook.
- Source list and data gaps.

The model is explicitly instructed not to invent reserve figures, promote resources into reserves, or confuse annual production with reserves. It should flag missing or conflicting data and provide citations/source URLs returned by the provider.

## API

- `GET /api/ai/status` — reports whether each provider key is configured and which model is selected. It does not reveal keys.
- `POST /api/ai/country-research` — accepts `country`, `iso3`, `provider` (`openai` or `gemini`), `question`, and recent `history`.

## Important limitations

AI web research can still miss documents, misread units, or summarise inconsistent reserve definitions. National reserve statements and technical reports change over time. Always inspect the original cited government, geological survey, regulator and competent-person reports before making investment, lending, engineering, licensing or public-reporting decisions. An AI-generated report is not a competent-person reserve statement, audited database, feasibility study or investment advice.

## Local security

`backend/.env` is ignored by Git. Do not share it or put it in the project ZIP. The `.env.example` file contains blank placeholders only. For any public deployment, add authentication, request quotas, abuse protection, HTTPS, secure secret management and operational monitoring before exposing the AI endpoint.
