@echo off
setlocal
title NEXORA AI v4.1.0 - GLOBAL MINERAL INTELLIGENCE
cd /d "%~dp0"

where py >nul 2>nul
if errorlevel 1 (
  echo Python launcher not found. Install Python 3.12 or newer.
  pause
  exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
  echo Node.js and npm not found. Install Node.js LTS.
  pause
  exit /b 1
)

if not exist "backend\.venv\Scripts\python.exe" py -3 -m venv "backend\.venv"
if errorlevel 1 (
  echo Could not create the backend virtual environment.
  pause
  exit /b 1
)

start "NEXORA Backend" cmd /k "cd /d ""%~dp0backend"" && .venv\Scripts\python.exe -m pip install --only-binary=:all: -r requirements.txt && .venv\Scripts\python.exe -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"

cd /d "%~dp0frontend"
if not exist "node_modules\vite\bin\vite.js" (
  echo Installing frontend dependencies for this Windows computer...
  call npm ci --include=optional --no-audit --no-fund
  if errorlevel 1 (
    echo Frontend dependency installation failed.
    pause
    exit /b 1
  )
)
call npm run dev -- --host 127.0.0.1
