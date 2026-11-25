@echo off
setlocal
title NEXORA - Repair Dependencies and Build
cd /d "%~dp0"

echo.
echo ============================================================
echo  NEXORA AI v4.1.0 - WINDOWS REPAIR AND PRODUCTION BUILD
echo ============================================================
echo.

where npm >nul 2>nul
if errorlevel 1 (
  echo ERROR: npm was not found. Install Node.js LTS, then reopen this script.
  pause
  exit /b 1
)

where py >nul 2>nul
if errorlevel 1 (
  echo ERROR: Python launcher was not found. Install Python 3.12 or newer.
  pause
  exit /b 1
)

echo [1/4] Reinstalling backend packages without optional PyYAML extras...
if not exist "backend\.venv\Scripts\python.exe" py -3 -m venv "backend\.venv"
if errorlevel 1 goto backend_error
"backend\.venv\Scripts\python.exe" -m pip install --only-binary=:all: -r "backend\requirements.txt"
if errorlevel 1 goto backend_error

echo.
echo [2/4] Removing stale frontend node_modules...
if exist "frontend\node_modules" rmdir /s /q "frontend\node_modules"
if exist "frontend\node_modules" (
  echo ERROR: Could not remove frontend\node_modules. Close editors or terminals using it and retry.
  pause
  exit /b 1
)

echo.
echo [3/4] Installing Windows-compatible frontend packages...
cd /d "%~dp0frontend"
call npm ci --include=optional --no-audit --no-fund
if errorlevel 1 goto frontend_error

echo.
echo [4/4] Creating the Vite production build...
call npm run build
if errorlevel 1 goto build_error

echo.
echo SUCCESS: Vite production build completed.
echo Output folder: %~dp0frontend\dist
echo.
echo The build was created on this Windows computer, so npm selected the Windows Rollup binary.
echo No Linux Rollup binary is required.
pause
exit /b 0

:backend_error
echo.
echo BACKEND INSTALL FAILED. Check the Python version and the pip error above.
pause
exit /b 1

:frontend_error
echo.
echo FRONTEND INSTALL FAILED. Check internet access and the npm error above.
echo The script requests optional platform packages for Windows.
pause
exit /b 1

:build_error
echo.
echo VITE BUILD FAILED. The full error is shown above.
pause
exit /b 1
