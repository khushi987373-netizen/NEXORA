@echo off
setlocal
 title NEXORA - Install Free Local AI
 echo =====================================================
 echo NEXORA FREE LOCAL AI SETUP
 echo =====================================================
 where ollama >nul 2>nul
 if errorlevel 1 (
   echo Ollama is not installed.
   echo Opening the official Ollama download page...
   start "" "https://ollama.com/download/windows"
   echo Install Ollama for Windows, then close and reopen this setup file.
   pause
   exit /b 1
 )
 echo Downloading the Qwen 2.5 7B model. This is several GB and may take time.
 ollama pull qwen2.5:7b
 if errorlevel 1 (
   echo Model download failed. Check your internet connection and try again.
   pause
   exit /b 1
 )
 echo.
 echo Local AI model installed. Keep Ollama running, then start NEXORA.
 pause
