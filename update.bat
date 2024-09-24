:: © Dream Hunter Studio 2024.
:: All rights reserved.
::
:: This software, including all its code, documentation, images, and related materials, is the exclusive property of the
:: program author. Unauthorized copying, modification, distribution, or commercial use of any part of this software is
:: strictly prohibited without prior written consent from the program author. The software is provided "as is," without
:: any express or implied warranties, including but not limited to implied warranties of merchantability or fitness for a
:: particular purpose. The program author assumes no liability for any direct or indirect damages arising from the use or
:: inability to use the software.
::
:: Description : Project Builder
::
:: Reversion   :
::   Rev.        Date        Designer    Description
::   1.0         2024-09-24  summer      Initial version
::

@echo off
setlocal

set "target_dir=%cd%"
echo Current Path: %target_dir%

timeout /t 3 /nobreak

for /D %%d in ("%target_dir%\*") do (
    if /I not "%%~nxd"=="data" if /I not "%%~nxd"=="downloads" (
        rmdir /S /Q "%%d"
    )
)

for %%f in ("%target_dir%\*") do (
    if not "%%~nxf"=="data" if not "%%~nxf"=="downloads" (
        del /Q "%%f"
    )
)

xcopy "downloads\*" "%target_dir%" /E /H /C /Y

start "" "CsItemManager.exe"

endlocal