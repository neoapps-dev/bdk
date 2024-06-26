@echo off

:api_request
set "api_url=%1"
set "output_file=%2"
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "(Invoke-WebRequest '%api_url%').Content | Out-File -Encoding ASCII %output_file%" >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Failed to make API Request! >%output_file%
    exit /b %ERRORLEVEL%
)

exit /b