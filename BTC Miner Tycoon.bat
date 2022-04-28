@echo off
title Bitcoin Miner Tycoon
color 0e
setlocal enabledelayedexpansion
chcp 65001 >nul
set /a bitcoin=0
set /a bitcoinclickvalue=1
set /a money=0
set /a moneyexchangevalue=3
set /a devmode=false
set /a debounce=0
set eastereggowned=0
set pageauth=0
set "hidecursor=<nul set /p=[?25l"
set "showcursor=<nul set /p=[?25h"
set "el=underline=[4m,underlineoff=[24m,black=[30m,red=[31m,green=[32m,yellow=[33m,blue=[34m,magenta=[35m,cyan=[36m,white=[37m,bgblack=[40m,bgyellow=[43m,bgwhite=[47m,brightblack=[90m,brightred=[91m,brightblue=[94m,brightmagenta=[95m"
set "%el:,=" && set "%"
set "ps=powershell"
set /a mysteryboxuses=1
::Checks for missing files
::------------------------
for %%A in (
"%~dp0gamelib.bat"
) do (
if not exist "%%~A" (
echo Game Files Missing
echo Files Missing: "%%~A"
pause >nul
)
)
:ftpserver

::updatecheck
::<version.txt set /p "local_version="
::for /f "delims=" %%A in ('curl -k https://raw.githubusercontent.com/ThedubBrothers/Bitcoin-Miner-Tycoon/updatesystem/version.txt') do set "remote_version=%%A"
::if not "%local_version%"=="%remote_version%" (
::echo Update Detected Would You Like To Update.
::echo 1 - Yes
::echo 2 - No
::choice /c 12 /n >nul
::if %errorlevel%==1 (
::cls
::curl -k https://github.com/ThedubBrothers/Bitcoin-Miner-Tycoon/blob/updatesystem/BTC%20Miner%20Tycoon.bat "BTC Miner Tycoon.bat"
::curl -k https://github.com/ThedubBrothers/Bitcoin-Miner-Tycoon/blob/updatesystem/version.txt -o "version.txt"
::cls
::goto languagecheck
::)
::if %errorlevel%==2 (
::cls
::goto languagecheck
::)
::)
:languagecheck
cls
::reg query "HKEY_CURRENT_USER\SOFTWARE\Ozzer Studios\Bitcoin Miner Tycoon" 
::cls
::if %errorlevel% EQU 1 (
::reg add "HKEY_CURRENT_USER\SOFTWARE\Ozzer Studios" >nul
::reg add "HKEY_CURRENT_USER\SOFTWARE\Ozzer Studios\Bitcoin Miner Tycoon" >nul
::reg add "HKEY_CURRENT_USER\SOFTWARE\Ozzer Studios\Bitcoin Miner Tycoon" /v "FirstLaunch" /t REG_DWORD /d 0 >nul
::)
cls
::Lets you select the language you want to use in the game
::--------------------------------------------------------
set baselang=EN
echo !underline!Please Choose Your Language.!underlineoff!
echo 1: English
echo 2: French
echo 3: German
choice /c 123 /n >nul
if %errorlevel%==1 (
cls
goto btcmine
)
if %errorlevel%==2 (
cls
goto btcminefr
)
if %errorlevel%==3 (
cls
goto btcminede
)
:btcmine
::English Game UI
::---------------
%hidecursor%
echo MINE
echo Bitcoin: %bitcoin%
echo Money: %money%
echo 1: Mine %bitcoinclickvalue% Bitcoin
echo 2: Goto Exchange
echo 3: Goto Upgrade Station
echo 4: Save
echo 5: Load
echo 6: Settings
echo 7: Shop
echo 8: Wheel Spin
echo !underline!MAKE SURE TO SAVE BEFORE CLOSING!underlineoff!
choice /c 12345678 /n >nul
if %errorlevel%==1 (
if %debounce%==1 (
timeout 1 /nobreak >nul
set /a %debounce%=0
cls
goto btcmine
)
if %debounce%==0 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
set /a %debounce%=1
cls
goto btcmine
)
)
if %errorlevel%==2 (goto btcexchange)
if %errorlevel%==3 (goto btcupgrade)
if %errorlevel%==4 (goto save)
if %errorlevel%==5 (goto load)
if %errorlevel%==6 (goto settings)
if %errorlevel%==7 (goto shop)
if %errorlevel%==8 (goto mysterybox)
:btcmineru
echo ????
echo ???????: %bitcoin%
echo ?????: %money%

:modsen
cls
if %pageauth%==0 (
cls
echo Page Not Authenticated This Is Likeley Due To A Mod Opening The Incorrect Page, Try Disabling This Mod And Try Again.
timeout 2 /nobreak >nul
cls
goto btcmine
)
if %pageauth%==1 (
echo Mods List
cd Mods
dir /B *.bat
if %errorlevel%==1 (cls&echo No Mods Found!)
cd ..
echo 1: Activate Mods (Expiremental)
choice /c 1 /n >nul
if %errorlevel%==1 (
cls
echo Please Enter The Mods Filename (Without .bat)
set /p modname=
if exist Mods\%modname%.bat  (
call Mods\%modname%.bat
cls
goto btcmine
)


if /I %modname%==22:10 (
cls
if %eastereggowned%==0 (
echo Easter Egg 1 Aquired!
set /a money=%money% + 2210
set eastereggowned=1
timeout 2 /nobreak >nul
cls
goto btcmine
)
if %eastereggowned%==1 (
echo This Mod Is Not Found Please Check Your Spelling And Try Again.
timeout 2 /nobreak >nul
cls
goto modsen
)
)
)
if not exist Mods\%modname%.bat (
echo This Mod Is Not Found Please Check Your Spelling And Try Again.
timeout 2 /nobreak >nul
cls
goto modsen
)
)
:btcminefr
echo MIENNE
echo Bitcoin: %bitcoin%
echo De l'argent: %money%
echo 1: Mienne %bitcoinclickvalue% Bitcoin
echo 2: Allez Ã©changer
echo 3: Aller Ã  la station de mise Ã  niveau
echo 4: sauvegarder
echo 5: charge
echo 6: ParamÃ¨tres
echo 7: magasin
echo 8: charlatane
choice /c 12345678 /n >nul
if %errorlevel%==1 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
cls
goto btcminefr
)
if %errorlevel%==2 (goto btcexchangefr)
if %errorlevel%==3 (goto btcupgradefr)
if %errorlevel%==4 (goto savefr)
if %errorlevel%==5 (goto loadfr)
if %errorlevel%==6 (goto settingsfr)
if %errorlevel%==7 (goto shop)
if %errorlevel%==8 (echo Something is a bit quacky^..&&pause >nul&&goto btcminefr)
:btcminede
echo BERGWERK
echo Bitcoin: %bitcoin%
echo Geld: %money%
echo 1: Bergwerk %bitcoinclickvalue% Bitcoin
echo 2: Gehe zu Exchange
echo 3: Gehe zu Upgrade-Station
echo 4: Save
echo 5: Load
echo 6: Einstellungen
echo 7: Unternehmen
choice /c 1234567 /n >nul
if %errorlevel%==1 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
cls
goto btcminede
)
if %errorlevel%==2 (goto btcexchange)
if %errorlevel%==3 (goto btcupgrade)
if %errorlevel%==4 (goto save)
if %errorlevel%==5 (goto load)
if %errorlevel%==6 (goto settings)
if %errorlevel%==7 (goto shop)
:btcexchange
cls
echo 1 Bitcoin = %moneyexchangevalue%$
echo Do You Want To Exchange 1 Bitcoin?
echo 1: Yes
echo 2: No
echo 3: Exchange All
choice /c 123 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Error you Cannot Exchange 0 Bitcoin
timeout 2 /nobreak >nul
cls
goto btcmine
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcmine
)
if %errorlevel%==2 (
cls
echo Alright!
timeout 1 /nobreak >nul
cls
goto btcmine
)
if %errorlevel%==3 (
cls
set /a money = %money% + %bitcoin% * %moneyexchangevalue%
set /a bitcoin = 0
goto btcmine
)
:btcexchangefr
cls
echo 1 Bitcoin = %moneyexchangevalue%â‚¬
echo Voulez-vous Ã©changer 1 Bitcoin?
echo 1: Oui
echo 2: Nine
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Erreur, vous ne pouvez pas Ã©changer 0 Bitcoin
timeout 2 /nobreak >nul
cls
goto btcminefr
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcminefr
)
if %errorlevel%==2 (
cls
echo D'accord!
timeout 1 /nobreak >nul
cls
goto btcminefr
)
:btcexchangede
cls
echo 1 Bitcoin = %moneyexchangevalue%â‚¬
echo MÃ¶chten Sie 1 Bitcoin umtauschen?
echo 1: Ja
echo 2: Nein
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Fehler Sie kÃ¶nnen 0 Bitcoin nicht umtauschen
timeout 2 /nobreak >nul
cls
goto btcminede
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcminede
)
if %errorlevel%==2 (
cls
echo okay!
timeout 1 /nobreak >nul
cls
goto btcminede
)
:btcupgrade
cls
echo 1: Upgrade Bitcoin Click Value (10)
echo 2: Exit Shop
choice /c 12 /n >nul
if %errorlevel%==1 (
cls
set /a bitcoinclickvalue = %bitcoinclickvalue% + 1
set /a money = %money% - 10
cls
goto btcupgrade
)
if %errorlevel%==2 (cls&&goto btcmine)
:btcupgradefr
cls
echo 1: Mettre Ã  niveau la valeur de clic Bitcoin (10)
echo 2: Quitter la boutique
choice /c 12 /n >nul
if %errorlevel%==1 (
cls
set /a bitcoinclickvalue = %bitcoinclickvalue% + 1
set /a money = %money% - 10
cls
goto btcupgradefr
)
if %errorlevel%==2 (
cls
goto btcminefr
)
:save
cls
attrib -r %~dp0\save.game
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
echo %debounce%
echo %eastereggowned%
) > save.game
attrib +r %~dp0\save.game
cls
goto btcmine
:savefr
attrib -r %~dp0\save.game
cls
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
) > enregistrer.game
attrib +r %~dp0\enregistrer.game
cls
goto btcminefr
:load
if exist enregistrer.game (
cls
< enregistrer.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcmine
)
else
cls
< save.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 set /p debounce=
 set /p eastereggowned=
 )
cls
goto btcmine
:settings
cls
echo 1: Developer Mode
echo 2: Mods
echo 3: Auto Apply Save File
choice /c 123 /n >nul
if %errorlevel%==1 (
cls
if %devmode%==1 (cls&goto devroom)
else
goto devmodeprompt
)
if %errorlevel%==2 (
cls
set pageauth=1
goto modsen
)
if %errorlevel% EQU 3 (
   cls
)
:settingsfr
cls
echo Aucun n'est disponible actuellement
timeout 1 /nobreak >nul
cls
goto btcminefr
:shop
cls
echo 1: Buy Basic GPU (+10 Bitcoin Clicks Each) (200)
echo 2: Exit Shop
choice /c 12 /n >nul
if %errorlevel%==1 (
   if %money% LSS 200 (
      cls
      echo You Cannot Afford Item: "Basic GPU"!
      timeout 2 /nobreak >nul
      cls
      goto btcmine
   )
   else
set /a gpu=%gpu% + 1
set /a bitcoinclickvalue=%bitcoinclickvalue% + 10
set /a money=%money% - 200
cls
goto shop
)
if %errorlevel%==2 (cls&goto btcmine)
:devmodeprompt
cls
if %devmode%==1 (goto devroom&end)
echo Due To This Being Dev Only Please Enter Your Developer Key.
set /p devkey=
if %devkey%==21546826 (
set /a devmode=1
cls
goto devroom
)
echo.
echo Invalid Key
timeout 2 /nobreak >nul
cls
goto btcmine
:devroom
cls
echo 1: Insane Stats
echo 2: Opt-Into Accounts
choice /c 12 /n >nul
if %errorlevel%==1 (
set /a bitcoin=%bitcoin% + 100000
set /a bitcoinclickvalue=%bitcoinclickvalue% + 100000
set /a money=%money% + 100000
set /a moneyexchangevalue=%moneyexchangevalue% + 100000
cls
goto btcmine
)
if %errorlevel%==2 (
call:accounts
)
:mysterybox
cls
echo Uses left: %mysteryboxuses%
echo 1: Spin
echo 2: Back
choice /c 12 /n >nul
if %errorlevel%==1 (
   if %mysteryboxuses%==1 (
      cls
set /a mysteryboxuses=%mysteryboxuses% - 1
call:chancefunc "Test" 0 "Impossible"
echo This is a later update
echo Item Given: !mysteryitem!
echo Chance: !chance!
echo Rarity: !rarity!
pause >nul
cls
goto btcmine
    )
)
if %errorlevel%==2 (cls&goto btcmine)
:chancefunc
set mysteryitem=%~1
set chance=%~2
set rarity=%~3
goto:eof
:prompt
rem Paramaters: message_description number1 numebr2 title
rem Number 1: 0 = Ok Button 1 = Ok/Cancel Button 2 = Abort/Retry/Ignore button 3 = Yes/No/Cancel 4 = Yes/No
rem Number 2: 16 – Critical Icon 32 – Warning Icon 48 – Warning Message Icon 64 – Information Icon
cd %temp%
echo X=MsgBox("%~1",%~2+%~3,"%~4") >msg.vbs
call msg.vbs
del msg.vbs
cd %~dp0
goto:eof
:wget
powershell wget %~1 -outfile %~2 >nul
goto:eof
:accounts
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do you have an Account?', 'Account', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\acc.tmp
set /p account=<%temp%\acc.tmp
if /i %account%== no (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Would you like to Sign-Up?', 'Sign-Up', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\sup.tmp)
set /p signup=<%TEMP%\sup.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Username:', 'Username')}" > %TEMP%\username.tmp)
set /p username=<%TEMP%\username.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Password:', 'Password')}" > %TEMP%\password.tmp)
set /p password=<%TEMP%\password.tmp
cls
%hidecursor%
title Bitcoin Miner Tycoon ^| Username: %username%
goto btcmine
:setstat
set /a %~1=%~2
goto:eof
