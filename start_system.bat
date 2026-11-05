@echo off
title Campus Club Event & OD Approval System
echo ===================================================
echo   Starting Campus Club Event & OD Approval System
echo ===================================================
echo.

REM 1. Check / start MongoDB if not running
echo Checking MongoDB on port 27017...
netstat -ano | findstr :27017 >nul 2>&1
if %errorlevel% neq 0 (
    echo Starting local MongoDB server...
    start "MongoDB Server" "C:\Program Files\MongoDB\Server\9.0\bin\mongod.exe" --dbpath "%~dp0backend\data\db" --port 27017
    timeout /t 3 /nobreak >nul
) else (
    echo MongoDB is already active.
)

REM 2. Start Backend Server
cd /d "%~dp0backend"
echo.
echo Starting Backend Server on http://localhost:5000...
start "Backend Server" cmd /k "node server.js"

REM 3. Open Browser
timeout /t 2 /nobreak >nul
start http://localhost:5000

echo.
echo ===================================================
echo System is running!
echo Access the UI at: http://localhost:5000
echo ===================================================
pause
