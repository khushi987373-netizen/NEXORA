# NEXORA MATERIAL LAB v1.9.0

## Main change
Removed the non-working static country intelligence profile layer and replaced it with an AI-powered, web-grounded country mineral and petroleum research workspace.

## Features
- Existing interactive 3D country globe and directory retained as geographic selectors only.
- Removed backend country profile endpoints and static 249-country resource profile dataset.
- Added provider selection: OpenAI Responses API with web search, or Google Gemini with Google Search grounding.
- Added country-specific full reports and follow-up questions.
- Source URLs returned by the providers are presented with the report.
- API keys are backend-only, read from `backend/.env`; status endpoint never returns keys.
- AI prompt requires reserve/resource/production distinctions, units, reference dates, uncertainty and source citations.
- Existing materials, periodic table, comparison, extraction, evidence registry and production dashboard retained.

## Verification
Backend tests include country profile removal, AI route presence, provider status key-safety and reserve/resource safeguards. Live provider calls require the user's own API key and were not executed during packaging. Frontend production build should be run using `REPAIR_AND_BUILD.bat` on Windows after extracting the ZIP.
