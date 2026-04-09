 :: BatchGotAdmin
 :-------------------------------------
 REM  --> Check for permissions
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
 if '%errorlevel%' NEQ '0' (
     echo Requesting administrative privileges...
     goto UACPrompt
 ) else ( goto gotAdmin )

:UACPrompt
     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
     exit /B

:gotAdmin
     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
     pushd "%CD%"
     CD /D "%~dp0"
 :--------------------------------------

@echo off
:A
mode 1000
taskkill /F /im ClassM_Client.exe
taskkill /F /im ClassM_Client_Service.exe
taskkill /F /im SysCtrl.exe
taskkill /F /im mvnc.exe
taskkill /F /im hscagent.exe
taskkill /F /im hscdm.exe
taskkill /F /im hscfm.exe
taskkill /F /im hscrelay.exe

goto A
