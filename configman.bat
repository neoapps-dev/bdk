set "CONFIG_FILE=%1"
for /f "usebackq tokens=*" %%a in ("%CONFIG_FILE%") do (
    call :parse_config_line "%%a"
)

exit /b

:parse_config_line
set "line=%~1"
for /f "tokens=1,* delims==" %%k in ("%line%") do (
    set "@ini.%%k=%%l"
)
goto :eof