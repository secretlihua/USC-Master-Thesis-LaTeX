@echo off
setlocal EnableExtensions DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
set "LC_ALL=C"
set "LANG=C"
where latexmk >nul 2>nul
if errorlevel 1 goto missing
if not exist "latexmkrc" goto incomplete
if not exist "usc-thesis.cls" goto incomplete
set "entry="
set /a entry_count=0 >nul
for %%F in (*.tex) do (
  findstr /l /c:"{usc-thesis}" "%%F" >nul 2>nul
  if not errorlevel 1 (
    set "entry=%%~nxF"
    set /a entry_count+=1 >nul
  )
)
if not "%entry_count%"=="1" goto ambiguous
latexmk -norc -r latexmkrc -cd "%entry%"
set "result=%errorlevel%"
if not "%result%"=="0" goto failed
echo.
echo Build completed. PDF and SyncTeX are beside the root TeX file.
echo Intermediate files are in auxiliary.
goto finish
:missing
echo ERROR: latexmk was not found. Install TeX Live and reopen this window.
set "result=1"
goto finish
:incomplete
echo ERROR: Missing project configuration or document class.
set "result=1"
goto finish
:ambiguous
echo ERROR: Keep exactly one root TeX file using the usc-thesis class here.
set "result=1"
goto finish
:failed
echo.
echo Build failed. Read the FIRST error above; auxiliary contains the log.
:finish
popd
if not defined USC_NONINTERACTIVE pause
exit /b %result%
