@echo off
:: Check if the script is already running with admin privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto :run )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:run
:: Set the time zone (replace "India Standard Time" with your desired time zone)
set TimeZoneName=India Standard Time
tzutil /s "%TimeZoneName%"
echo Setting time zone to %TimeZoneName%.
echo (You can list available time zones by running tzutil /l)

:: Try to configure time synchronization, show an error if it fails
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:YES /update
net stop w32time
net start w32time
w32tm /resync

:: Check if synchronization was successful
if %errorlevel% neq 0 (
    msg * "Time synchronization failed. Please ensure you have an active internet connection and try again."
)

::pause
