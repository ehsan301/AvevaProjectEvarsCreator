@echo off
setlocal enabledelayedexpansion

:: Get the current directory name
for %%I in (.) do set "fileName=%%~nxI"

:: Set the output file name
set "output_file=evars_%fileName%.bat"

:: Clear the output file if it exists
if exist "%output_file%" del "%output_file%"

:: Get the current directory
set "current_dir=%~dp0"
set "current_dir=!current_dir:~0,-1!"

:: set project folders
for /d %%i in (*) do (
    :: Check if it's a directory (not a file)
    if exist "%%i\" (
        echo set %%i=!current_dir!\%%i >> "%output_file%"
    )
)

:: set project ID
for /d %%i in (*) do (
    set "ProjID=%%i"
    goto :projectID
)

:projectID
echo set !ProjID!ID=%fileName% >> "%output_file%"