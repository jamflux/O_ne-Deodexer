@echo OFF
SETLOCAL ENABLEDELAYEDEXPANSION
set APP_DESCRIPTION=Deodexer Tool for android 6-8
set CYGWIN=nodosfilewarning
set CECHO=bin\cecho.exe
set busybox=bin\busybox.exe
set rom=system
set memory=1024
TITLE One Deodexer [by JamFlux]


if exist work rmdir /q /s work
if exist work2 rmdir /q /s work2
if exist bin\temp rmdir /q /s bin\temp
if exist work\cpu del work\cpu
if exist *.txt del *.txt
if exist *.dex del *.dex
if exist *.zip del *.zip
set api=null
for /f "delims=" %%a in ('!busybox! grep -i -m 1 "ro.build.version.sdk=" "system/build.prop" ^| !busybox! cut -d"=" -f2') do set api=%%a
if not exist work mkdir work
if exist system\framework\arm64 (echo arm64>>work\cpu) else echo arm>>work\cpu
set /p cpu=<work\cpu

:init
echo.
echo.
echo.
%cecho%                   {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%                 {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%                 {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%                 {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%                 {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%                 {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%                   {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%                          {06}mmmmmmm{#}
echo.
echo                                          ,,                                    
echo   `7MM"""Yb.                           `7MM                                    
echo     MM    `Yb.                           MM                                    
echo     MM     `Mb  .gP"Ya   ,pW"Wq.    ,M""bMM  .gP"Ya `7M'   `MF'.gP"Ya `7Mb,od8 
echo     MM      MM ,M'   Yb 6W'   `Wb ,AP    MM ,M'   Yb  `VA ,V' ,M'   Yb  MM' "' 
echo     MM     ,MP 8M"""""" 8M     M8 8MI    MM 8M""""""    XMX   8M""""""  MM     
echo     MM    ,dP' YM.    , YA.   ,A9 `Mb    MM YM.    ,  ,V' VA. YM.    ,  MM     
echo   .JMMmmmdP'    `Mbmmd'  `Ybmd9'   `Wbmd"MML.`Mbmmd'.AM.   .MA.`Mbmmd'.JMML.   
%cecho%                                                                   {06}by JamFlux{#}
TIMEOUT /T 2 /nobreak > NUL & CLS
if not exist system\build.prop (
mode con:cols=40 lines=35
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
echo.
echo.
echo.
echo   -Can't continue.
echo.
%cecho%    No {06}build.prop{#} has been found.
echo.
echo.
pause>nul
exit
)


:menu
mode con:cols=40 lines=35
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo ----------------------------------------
%cecho%                 {06}Main Menu{#}
echo.
echo ----------------------------------------
echo 1 : Create working directory
echo 2 : Deodex all system files
echo 3 : Add deodexed files to zip
echo 4 : Change java heap size
echo ----------------------------------------
%cecho%              system api: {06}!api!{#}
echo.
%cecho%              cpu: {06}!cpu!{#}
echo.
%cecho%              heap size: {06}!memory!{#}
echo.
echo ========================================
echo.
set /p NUM="Choice : 
if not defined NUM goto menu
if "%NUM%"=="1" goto set_work
if "%NUM%"=="2" goto deodex
if "%NUM%"=="3" goto add2zip
if "%NUM%"=="4" goto heap_size
if "%NUM%"=="" goto menu

:heap_size
mode con:cols=40 lines=35
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
echo.
echo.
echo.
echo   -Please set heap size for java:
echo    example: 128, 256, 512, 2048
echo.
echo.
set /p memory=*  Set to: 
goto menu


:set_work
cls
if not exist system mkdir system
goto menu

:add2zip
mode con:cols=40 lines=35
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
set Exts=*.odex
For /R system %%A in (%Exts%) do (
  if exist %%A goto odexed
)
copy /y bin\deodex_installer.zip "%~dp0" >nul
echo.
echo.
echo.
echo.
echo   -Zipping...
bin\7za a "deodex_installer.zip" -o+ system >nul 2>nul
echo   -Done.
TIMEOUT /T 3 /nobreak > NUL & CLS
goto menu


:: here start the main work
:deodex
mode con:cols=40 lines=35
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
For /D /R system %%g IN (*.apk) do (
	if not exist %%~ng.odex echo   No .odex files to process
	echo.
	echo   System files seems to be deodexed.
	pause>nul
	goto menu
)
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
if !api! geq 23 (
goto deodex_nougat
) else (
echo.
echo.
echo.
echo.
%cecho%   Api version {06}[!api!]{#} is not supported.
echo.
echo.
pause>nul
goto menu
)

:deodex_cleaner
::managing framework deodexed files
if not exist bin\temp\odexed_fram mkdir bin\temp\odexed_fram >nul
for /r bin\temp\fram_files %%F in (*.odex) do (
    set odexed=%%~dpnF.jar
    if exist !odexed! (
			move /y %%F bin\temp\odexed_fram >nul
			move /y !odexed! bin\temp\odexed_fram >nul
		)
	)
if exist bin\temp\fram_files\*.jar move /y bin\temp\fram_files\*.jar bin\temp\dex_files >nul
if exist bin\temp\fram_files rmdir /q /s bin\temp\fram_files
move bin\temp\odexed_fram bin\temp\fram_files >nul
::managing vendor deodexed files
if not exist bin\temp\odexed_vendor mkdir bin\temp\odexed_vendor
for /r bin\temp\vendor_files %%F in (*.odex) do (
    set odexed=%%~dpnF.apk
    if exist !odexed! (
			move /y %%F bin\temp\odexed_vendor >nul
			move /y !odexed! bin\temp\odexed_vendor >nul
		)
	)
if exist bin\temp\vendor_files rmdir /q /s bin\temp\vendor_files >nul
move bin\temp\odexed_vendor bin\temp\vendor_files >nul
::managing app deodexed files
if not exist bin\temp\odexed_app mkdir bin\temp\odexed_app
for /r bin\temp\app_files %%F in (*.odex) do (
    set odexed=%%~dpnF.apk
    if exist !odexed! (
			move /y %%F bin\temp\odexed_app >nul
			move /y !odexed! bin\temp\odexed_app >nul
		)
	)
if exist bin\temp\app_files rmdir /q /s bin\temp\app_files >nul
move bin\temp\odexed_app bin\temp\app_files >nul
::managing priv-app deodexed files
if not exist bin\temp\odexed_priv mkdir bin\temp\odexed_priv >nul
for /r bin\temp\priv_files %%F in (*.odex) do (
    set odexed=%%~dpnF.apk
    if exist !odexed! (
			move /y %%F bin\temp\odexed_priv >nul
			move /y !odexed! bin\temp\odexed_priv >nul
		)
	)
if exist bin\temp\priv_files rmdir /q /s bin\temp\priv_files
move bin\temp\odexed_priv bin\temp\priv_files >nul
goto:eof

:deodex_nougat
set STARTTIME=%TIME%
mode con:cols=40 lines=35
if exist system\framework\oat\arm64 rmdir /q /s system\framework\oat\arm >nul
if exist system\framework\arm64 rmdir /q /s system\framework\arm >nul
if exist "!rom!\framework\!cpu!\*.oat" (
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	echo.
	echo.
	echo.
	::Removing conflictive GApps
	echo   -Removing conflictive GApps
	if exist !rom!\app\BasicDreams rmdir /q /s !rom!\app\BasicDreams >nul
	if exist !rom!\app\Chrome rmdir /q /s !rom!\app\Chrome >nul
	if exist !rom!\app\Drive rmdir /q /s !rom!\app\Drive >nul
	if exist !rom!\app\Duo rmdir /q /s !rom!\app\Duo >nul
	if exist !rom!\app\Gmail2 rmdir /q /s !rom!\app\Gmail2 >nul
	if exist !rom!\app\Hangouts rmdir /q /s !rom!\app\Hangouts >nul
	if exist !rom!\app\LiveWallpapersPicker rmdir /q /s !rom!\app\LiveWallpapersPicker >nul
	if exist !rom!\app\Maps rmdir /q /s !rom!\app\Maps >nul
	if exist !rom!\app\Music2 rmdir /q /s !rom!\app\Music2 >nul
	if exist !rom!\app\Photos rmdir /q /s !rom!\app\Photos >nul
	if exist !rom!\app\PhotoTable rmdir /q /s !rom!\app\PhotoTable >nul
	if exist !rom!\app\Videos rmdir /q /s !rom!\app\Videos >nul
	if exist !rom!\app\YouTube rmdir /q /s !rom!\app\YouTube >nul
	echo   -Deoptimizing OAT files from
	%cecho%    {06}[!rom!\framework\!cpu!]{#}
	echo.
	java -Xmx!memory!m -jar bin\oat2dex_v089.jar boot !rom!/framework/!cpu! >nul 2>nul
	if exist !rom!\framework\!cpu!-dex\miui.dex move !rom!\framework\!cpu!-dex\miui.dex classes.dex >nul
	if exist classes.dex bin\aapt add !rom!\app\miui\miui.apk classes.dex >nul 2>nul
	if exist classes.dex del classes.dex >nul 2>nul
	if exist !rom!\app\miui\oat rmdir /q /s !rom!\app\miui\oat >nul
	if exist !rom!\framework\!cpu!-dex\miuisystem.dex move !rom!\framework\!cpu!-dex\miuisystem.dex classes.dex >nul
	if exist classes.dex bin\aapt add !rom!\app\miuisystem\miuisystem.apk classes.dex >nul 2>nul
	if exist classes.dex del classes.dex >nul 2>nul
	if exist !rom!\app\miuisystem\oat rmdir /q /s !rom!\app\miuisystem\oat >nul
	)
if not exist bin\temp mkdir bin\temp
if not exist bin\temp\dex_files mkdir bin\temp\dex_files
::moving framework's dex file to framework's temporary folder
echo   -Moving dex files
move /y !rom!\framework\!cpu!-dex\*.dex bin\temp\dex_files >nul
if exist !rom!\framework\!cpu!-dex rmdir /q /s !rom!\framework\!cpu!-dex >nul
if exist !rom!\framework\!cpu!\dex rmdir /q /s !rom!\framework\!cpu!\dex >nul
::copying jars, apks and odex files to app, framework, priv-app and vendor temporary folders
echo   -Copying jars, apks and odex files
For /R system\framework %%g IN (*.odex *.jar) do (
if not exist bin\temp\fram_files mkdir bin\temp\fram_files >nul
	copy /y "%%g" bin\temp\fram_files >nul 2>nul
)
For /R system\vendor %%g IN (*.odex *.apk) do (
	if not exist bin\temp\vendor_files mkdir bin\temp\vendor_files >nul
	copy /y "%%g" bin\temp\vendor_files >nul
)
For /R system\app %%g IN (*.odex *.apk) do (
	if not exist bin\temp\app_files mkdir bin\temp\app_files >nul
	copy /y "%%g" bin\temp\app_files >nul
)
For /R system\priv-app %%g IN (*.odex *.apk) do (
	if not exist bin\temp\priv_files mkdir bin\temp\priv_files >nul
	copy /y "%%g" bin\temp\priv_files >nul
)
echo   -Removing deodexed files
call :deodex_cleaner
::counting all files and list them
set total_files=0
for /f "delims=" %%a in ('bin\find bin/temp -name *.odex ^| !busybox! wc -l') do set total_files=%%a
%cecho%   -Total files to deodex are: {06}[!total_files!]{#}
TIMEOUT /T 2 /nobreak > NUL & CLS
::###framework part
:framework_part nougat
::counting files in framework folder...
set show_count=0
set fram_files=0
for /f "delims=" %%a in ('bin\find bin/temp/fram_files -name *.odex ^| !busybox! wc -l') do set fram_files=%%a
::deodexer log
echo O_Ne Deodexer [by JamFlux]>>deodex_log.txt
echo.>>deodex_log.txt
echo DEODEX LOG FOR CURRENT ROM>>deodex_log.txt
echo.>>deodex_log.txt
echo --FRAMEWORK FILES:>>deodex_log.txt
echo.>>deodex_log.txt
for %%i in (bin\temp\fram_files\*.jar) do (
	if exist bin\temp\fram_files\%%~ni.odex (
	set /a show_count+=1
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Deodexing framework files
    echo.
	echo    File !show_count! of !fram_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ni.jar]{#}
	echo.
	echo.
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\fram_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work\%%~ni -o %%~ni.dex >nul 2>nul
	move %%~ni.dex bin\temp\dex_files >nul
	if not exist bin\temp\dex_files\%%~ni.dex (echo Deodex Status is [FAILED] for: [%%~ni.jar]>>deodex_log.txt) else echo Deodex Status is [OK] for: [%%~ni.jar]>>deodex_log.txt
	rmdir /Q /S work\%%~ni
	del bin\temp\fram_files\%%~ni.odex
	cls
	) else (
	if not exist work2 mkdir work2
	cls
	echo.
	echo   -Deodexing framework files
    echo.
	echo    File !show_count! of !fram_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ni.jar]{#}
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\fram_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work2\%%~ni -o %%~ni-classes2.dex >nul 2>nul
	move %%~ni-classes2.dex bin\temp\dex_files >nul 2>nul
	rmdir /Q /S work2\%%~ni
	del bin\temp\fram_files\%%~ni.odex
	echo Deodex Status is [ALREADY DEODEXED] for: [%%i]>>deodex_log.txt
	)
)
::adding other .dex files to bin\temp\fram_files folder
move /y bin\temp\fram_files\*.jar bin\temp\dex_files >nul
if exist bin\temp\fram_files rmdir /q /s bin\temp\fram_files
move /y bin\temp\dex_files bin\temp\fram_files >nul
::Adding dex files to current .jar files...
::counting files in framework folder...
set show_count=0
set dex_files=0
for /f "delims=" %%a in ('bin\find bin\temp\fram_files -name *.dex ^| !busybox! wc -l') do set dex_files=%%a
for %%s in (bin\temp\fram_files\*.jar) do (
	if exist "bin\temp\fram_files\%%~ns.dex" (
	set /a show_count+=1
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Adding .dex files
    echo.
	echo    File !show_count! of !dex_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ns.jar]{#}
	echo.
	echo.
	move bin\temp\fram_files\%%~ns.dex classes.dex >nul
	bin\aapt add bin\temp\fram_files\%%~ns.jar classes.dex >nul 2>nul
	echo bin\temp\fram_files\%%~ns.jar>>bin\temp\oat_framework_list.txt
	del classes.dex >nul 2>nul
	cls
	set count=2
	for %%m in (bin\temp\fram_files\%%~ns-classes*.dex) do (
	move %%m classes!count!.dex >nul
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Adding .dex files
    echo.
	echo    File !show_count! of !dex_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ns.jar]{#}
	echo.
	echo.
		bin\aapt add bin\temp\fram_files\%%~ns.jar classes!count!.dex >nul 2>nul
		echo bin\temp\fram_files\%%~ns-classes!count!.jar>>bin\temp\oat_framework_list.txt
		del classes!count!.dex >nul 2>nul
				)
			)
		)
	)
::erasing unnecessary framework folders	
rmdir /q /s system\framework\oat
move /y bin\temp\fram_files\*.jar system\framework >nul
rmdir /q /s bin\temp\fram_files
::###vendor part
:vendor_part nougat
::Counting system apks for deodexing process
set vendor_files=0
set show_count=0
for /f "delims=" %%a in ('bin\find bin/temp/vendor_files -name *.apk ^| !busybox! wc -l') do set vendor_files=%%a
echo.>>deodex_log.txt
echo --VENDOR FILES:>>deodex_log.txt
echo.>>deodex_log.txt
::Deodexing vendor folder apks
for %%i in (bin\temp\vendor_files\*.apk) do (
	if exist bin\temp\vendor_files\%%~ni.odex (
	set /a show_count+=1
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Deodexing vendor files
    echo.
	echo    File !show_count! of !vendor_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ni.apk]{#}
	echo.
	echo.
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\vendor_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work\%%~ni -o classes.dex >nul 2>nul
	if not exist classes.dex (echo Deodex Status is [FAILED] for: [%%~ni.apk]>>deodex_log.txt) else echo Deodex Status is [OK] for: [%%~ni.apk]>>deodex_log.txt
	bin\aapt add %%i classes.dex >nul 2>nul
	if exist classes.dex del classes.dex >nul 2>nul
	if exist work\%%~ni rmdir /Q /S work\%%~ni >nul 2>nul
	if exist bin\temp\vendor_files\%%~ni.odex del bin\temp\vendor_files\%%~ni.odex >nul 2>nul
	move /y bin\temp\vendor_files\%%~ni.apk system\vendor\app\%%~ni >nul
	rmdir /q /s system\vendor\app\%%~ni\oat>nul
	cls
	) else (
	if not exist work2 mkdir work2
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\vendor_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work2\%%~ni -o classes2.dex >nul 2>nul
	bin\aapt add %%i classes2.dex >nul 2>nul
	del classes2.dex
	rmdir /Q /S work\%%~ni
	del bin\temp\vendor_files\%%~ni.odex
	move bin\temp\vendor_files\%%~ni.apk system\vendor\app\%%~ni
	rmdir /q /s system\vendor\app\%%~ni\oat>nul
	echo Deodex Status is [ALREADY DEODEXED] for: [%%~ni]>>deodex_log.txt
	)
)
::Deleting workable vendor_files folder
rmdir /q /s bin\temp\vendor_files >nul
::###app part
:app_part nougat
::Counting system apks for deodexing process
set app_files=0
set show_count=0
for /f "delims=" %%a in ('bin\find bin/temp/app_files -name *.apk ^| !busybox! wc -l') do set app_files=%%a
echo.>>deodex_log.txt
echo --APP FILES:>>deodex_log.txt
echo.>>deodex_log.txt
::Deodexing app folder apks
for %%i in (bin\temp\app_files\*.apk) do (
	if exist bin\temp\app_files\%%~ni.odex (
	set /a show_count+=1
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Deodexing app files
    echo.
	echo    File !show_count! of !app_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ni.apk]{#}
	echo.
	echo.
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\app_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work\%%~ni -o classes.dex >nul 2>nul
	if not exist classes.dex (echo Deodex Status is [FAILED] for: [%%~ni.apk]>>deodex_log.txt) else echo Deodex Status is [OK] for: [%%~ni.apk]>>deodex_log.txt
	bin\aapt add %%i classes.dex >nul 2>nul
	if exist classes.dex del classes.dex >nul 2>nul
	if exist work\%%~ni rmdir /Q /S work\%%~ni >nul 2>nul
	if exist bin\temp\app_files\%%~ni.odex del bin\temp\app_files\%%~ni.odex >nul 2>nul
	move /y bin\temp\app_files\%%~ni.apk system\app\%%~ni >nul
	rmdir /q /s system\app\%%~ni\oat>nul
	cls
	) else (
	if not exist work2 mkdir work2
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\app_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work2\%%~ni -o classes2.dex >nul 2>nul
	bin\aapt add %%i classes2.dex >nul 2>nul
	del classes2.dex
	rmdir /Q /S work\%%~ni
	del bin\temp\app_files\%%~ni.odex
	move bin\temp\app_files\%%~ni.apk system\app\%%~ni
	rmdir /q /s system\app\%%~ni\oat>nul
	echo Deodex Status is [ALREADY DEODEXED] for: [%%~ni]>>deodex_log.txt
	)
)
::Deleting workable app_files folder
rmdir /q /s bin\temp\app_files >nul
::###priv-app part
:priv-app_part nougat
::Counting system apks for deodexing process
set priv_files=0
set show_count=0
for /f "delims=" %%a in ('bin\find bin/temp/priv_files -name *.apk ^| !busybox! wc -l') do set priv_files=%%a
echo.>>deodex_log.txt
echo --PRIV-APP FILES:>>deodex_log.txt
echo.>>deodex_log.txt
::Deodexing priv-app folder apks
for %%i in (bin\temp\priv_files\*.apk) do (
	if exist bin\temp\priv_files\%%~ni.odex (
	set /a show_count+=1
	cls
	echo.
	echo.
	echo.
	%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
	echo.
	%cecho%   {06}.dP'    `YM.   MMN.    M{#}
	echo.
	%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
	echo.
	%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
	echo.
	%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
	echo.
	%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
	echo.
	%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
	echo.
	%cecho%            {06}deodexer{#}
	echo.
	%cecho%                          {03}by JamFlux{#}
	echo.
	echo.
	%cecho%                  Total files: {06}[!total_files!]{#}
	echo.
	echo.
	echo   -Deodexing priv-app files
    echo.
	echo    File !show_count! of !priv_files!
	echo.
	%cecho%   -Deodexing {06}[%%~ni.apk]{#}
	echo.
	echo.
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\priv_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work\%%~ni -o classes.dex >nul 2>nul
	if not exist classes.dex (echo Deodex Status is [FAILED] for: [%%~ni.apk]>>deodex_log.txt) else echo Deodex Status is [OK] for: [%%~ni.apk]>>deodex_log.txt
	bin\aapt add %%i classes.dex >nul 2>nul
	if exist classes.dex del classes.dex >nul 2>nul
	if exist work\%%~ni rmdir /Q /S work\%%~ni >nul 2>nul
	if exist bin\temp\priv_files\%%~ni.odex del bin\temp\priv_files\%%~ni.odex >nul 2>nul
	move /y bin\temp\priv_files\%%~ni.apk system\priv-app\%%~ni >nul
	rmdir /q /s system\priv-app\%%~ni\oat>nul
	cls
	) else (
	if not exist work2 mkdir work2
	java -Xmx!memory!m -jar bin\baksmali.jar deodex bin\temp\priv_files\%%~ni.odex -o work\%%~ni -b system\framework\!cpu!\boot.oat >nul 2>nul
	java -Xmx!memory!m -jar bin\smali.jar assemble -a !api! work2\%%~ni -o classes2.dex >nul 2>nul
	bin\aapt add %%i classes2.dex >nul 2>nul
	del classes2.dex
	rmdir /Q /S work\%%~ni
	del bin\temp\priv_files\%%~ni.odex
	move bin\temp\priv_files\%%~ni.apk system\priv-app\%%~ni
	rmdir /q /s system\priv-app\%%~ni\oat>nul
	echo Deodex Status is [ALREADY DEODEXED] for: [%%~ni]>>deodex_log.txt
	)
)
::Deleting workable priv_files folder
rmdir /q /s bin\temp\priv_files >nul
cls
if exist !rom!\framework\!cpu! rmdir /q /s !rom!\framework\!cpu! >nul
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
echo.
echo.
echo.
echo   -Done.
set ENDTIME=%TIME%
call :time
echo   -Elapsed time: %DURATION%
pause>nul
goto menu

:time
rem Change formatting for the start and end times
    for /F "tokens=1-4 delims=:.," %%a in ("%STARTTIME%") do (
       set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
    )
	for /F "tokens=1-4 delims=:.," %%a in ("%ENDTIME%") do (
       set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
    )
	rem Calculate the elapsed time by subtracting values
    set /A elapsed=end-start
	rem Format the results for output
    set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
    if %hh% lss 10 set hh=0%hh%
    if %mm% lss 10 set mm=0%mm%
    if %ss% lss 10 set ss=0%ss%
    if %cc% lss 10 set cc=0%cc%
	set DURATION=%hh%:%mm%:%ss%,%cc%
	echo.>>deodex_log.txt
	echo --INVESTED TIME:>>deodex_log.txt
	echo.>>deodex_log.txt
	echo Start    : %STARTTIME% >>deodex_log.txt
    echo Finish   : %ENDTIME% >>deodex_log.txt
    echo          --------------- >>deodex_log.txt
    echo Duration : %DURATION% >>deodex_log.txt
	goto:eof

:odexed
cls
echo.
echo.
echo.
%cecho%     {06}.g8""8q.   `7MN.   `7MF'{#}
echo.
%cecho%   {06}.dP'    `YM.   MMN.    M{#}
echo.
%cecho%   {06}dM'      `MM   M YMb   M  .gP"Ya{#}
echo.
%cecho%   {06}MM        MM   M  `MN. M ,M'   Yb{#}
echo.
%cecho%   {06}MM.      ,MP   M   `MM.M 8M""""""{#}
echo.
%cecho%   {06}`Mb.    ,dP'   M     YMM YM.    ,{#}
echo.
%cecho%     {06}`"bmmd"'   .JML.    YM  `Mbmmd'{#}
echo.
%cecho%            {06}deodexer{#}
echo.
%cecho%                          {03}by JamFlux{#}
echo.
echo.
echo.
echo.
echo.
%cecho%   -It seems that system is {06}odexed{#}.
echo.
echo    Can't zip.
pause>nul
goto menu

