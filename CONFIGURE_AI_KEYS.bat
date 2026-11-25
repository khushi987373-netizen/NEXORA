@echo off
setlocal
cd /d "%~dp0"
if not exist "backend\.env" (
  copy "backend\.env.example" "backend\.env" >nul
  echo Created backend\.env from the example file.
)
notepad "backend\.env"
echo.
echo Save your API key changes, close Notepad, then restart NEXORA.
pause
