@echo off
title "Python Installer"
cls
echo.
echo ========================
echo Python Installer
echo ========================
:main
echo.
echo Type START to start the program
echo Type EXIT to exit the program

set /p antw=
if %antw%  == START goto start
if %antw%  == EXIT goto :exit

:start

REM Definieer de URL van het Python-zipbestand
set "python_url=https://www.python.org/ftp/python/3.12.0/python-3.12.0-embed-amd64.zip"

REM Definieer de doelmap
set "target_path=C:\python"

REM Maak de doelmap als deze niet bestaat
if not exist "%target_path%" mkdir "%target_path%"

REM Download het Python-zipbestand
echo Downloading Python...
bitsadmin /transfer "PythonDownload" "%python_url%" "%target_path%\python-3.12.0-embed-amd64.zip"

REM Als de download is voltooid, pak het zipbestand uit
if exist "%target_path%\python-3.12.0-embed-amd64.zip" (
    echo Extracting Python...
    powershell Expand-Archive -Path "%target_path%\python-3.12.0-embed-amd64.zip" -DestinationPath "%target_path%"
    echo Python has been downloaded and extracted to %target_path%
) else (
    echo Failed to download Python.
)

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

:exit
pause
exit