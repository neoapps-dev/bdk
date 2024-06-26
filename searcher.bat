@echo off
setlocal enabledelayedexpansion

rem Usage: search_string.bat "search_term" "directory" "log_file" "exclude_files" "exclude_dirs"

set "search_term=%~1"
set "search_dir=%~2"
set "log_file=%~3"
set "exclude_files=%~4"
set "exclude_dirs=%~5"

if "%search_term%"=="" (
    echo Usage: %0 "search_term" "directory" "log_file" "exclude_files" "exclude_dirs"
    exit /b 1
)

if "%search_dir%"=="" (
    echo Usage: %0 "search_term" "directory" "log_file" "exclude_files" "exclude_dirs"
    exit /b 1
)

if "%log_file%"=="" (
    echo Usage: %0 "search_term" "directory" "log_file" "exclude_files" "exclude_dirs"
    exit /b 1
)

if not exist "%search_dir%" (
    echo Directory not found: %search_dir%
    exit /b 1
)

rem Parse the exclude files into an array
set "exclude_files_array="
for %%e in (%exclude_files%) do (
    set "exclude_files_array=!exclude_files_array!%%e "
)

rem Parse the exclude directories into an array
set "exclude_dirs_array="
for %%d in (%exclude_dirs%) do (
    set "exclude_dirs_array=!exclude_dirs_array!%%d "
)

echo Searching for "%search_term%" in %search_dir% and logging to %log_file%
echo --- Search results for "%search_term%" in %search_dir% --- > "%log_file%"

for /r "%search_dir%" %%f in (*) do (
    set "exclude_file=0"
    set "exclude_dir=0"
    
    rem Check if the file should be excluded
    for %%e in (%exclude_files_array%) do (
        if "%%~nxf"=="%%~nxe" (
            set "exclude_file=1"
        )
    )

    rem Check if the file is in an excluded directory
    for %%d in (%exclude_dirs_array%) do (
        if "!exclude_dir!"=="0" (
            echo %%f | findstr /i "%%d\\" > nul
            if !errorlevel! equ 0 (
                set "exclude_dir=1"
            )
        )
    )

    if "!exclude_file!"=="0" if "!exclude_dir!"=="0" (
        echo Searching in %%f
        findstr /n /i "%search_term%" "%%f" >> "%log_file%"
    )
)

echo Search complete. Results saved to %log_file%.
exit /b 0
