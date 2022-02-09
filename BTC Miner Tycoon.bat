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
if %errorlevel%==0 (
echo Macro "1" Error: 0 >> log.log
call log.log
exit
)
if %debounce%==1 (
timeout 0.50 /nobreak >nul
call:setstat debounce 0
cls
goto btcmine
)
if %debounce%==0 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
call:setstat debounce 1
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
echo 2: Allez échanger
echo 3: Aller à la station de mise à niveau
echo 4: sauvegarder
echo 5: charge
echo 6: Paramètres
echo 7: magasin
choice /c 1234567 /n >nul
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
echo 1 Bitcoin = %moneyexchangevalue%€
echo Voulez-vous échanger 1 Bitcoin?
echo 1: Oui
echo 2: Nine
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Erreur, vous ne pouvez pas échanger 0 Bitcoin
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
echo 1 Bitcoin = %moneyexchangevalue%€
echo Möchten Sie 1 Bitcoin umtauschen?
echo 1: Ja
echo 2: Nein
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Fehler Sie können 0 Bitcoin nicht umtauschen
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
echo 1: Mettre à niveau la valeur de clic Bitcoin (10)
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
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
echo %debounce%
echo %eastereggowned%
) > save.game
cls
goto btcmine
:savefr
cls
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
) > enregistrer.game
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
end
)
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
:loadfr
if exist save.game (
cls
< save.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcminefr
end
)
cls
< enregistrer.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcminefr
:settings
cls
echo 1: Developer Mode
echo 2: Mods
choice /c 12 /n >nul
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
rem Number 2: 16 � Critical Icon 32 � Warning Icon 48 � Warning Message Icon 64 � Information Icon
cd %temp%
echo X=MsgBox("%~1",%~2+%~3,"%~4") >msg.vbs
call msg.vbs
del msg.vbs
cd %~dp0
goto:eof
:wget
powershell wget %~1 -outfile %~2 >nul
goto:eof
:codeinbase64
rem QGVjaG8gb2ZmCnRpdGxlIEJpdGNvaW4gTWluZXIgVHljb29uCmNvbG9yIDBlCnNldGxvY2FsIGVuYWJsZWRlbGF5ZWRleHBhbnNpb24KY2hjcCA2NTAwMSA+bnVsCnNldCAvYSBiaXRjb2luPTAKc2V0IC9hIGJpdGNvaW5jbGlja3ZhbHVlPTEKc2V0IC9hIG1vbmV5PTAKc2V0IC9hIG1vbmV5ZXhjaGFuZ2V2YWx1ZT0zCnNldCAvYSBkZXZtb2RlPWZhbHNlCnNldCAvYSBkZWJvdW5jZT0wCnNldCBlYXN0ZXJlZ2dvd25lZD0wCnNldCBwYWdlYXV0aD0wCnNldCAiaGlkZWN1cnNvcj08bnVsIHNldCAvcD0bWz8yNWwiCnNldCAic2hvd2N1cnNvcj08bnVsIHNldCAvcD0bWz8yNWgiCnNldCAiZWw9dW5kZXJsaW5lPRtbNG0sdW5kZXJsaW5lb2ZmPRtbMjRtLGJsYWNrPRtbMzBtLHJlZD0bWzMxbSxncmVlbj0bWzMybSx5ZWxsb3c9G1szM20sYmx1ZT0bWzM0bSxtYWdlbnRhPRtbMzVtLGN5YW49G1szNm0sd2hpdGU9G1szN20sYmdibGFjaz0bWzQwbSxiZ3llbGxvdz0bWzQzbSxiZ3doaXRlPRtbNDdtLGJyaWdodGJsYWNrPRtbOTBtLGJyaWdodHJlZD0bWzkxbSxicmlnaHRibHVlPRtbOTRtLGJyaWdodG1hZ2VudGE9G1s5NW0iCnNldCAiJWVsOiw9IiAmJiBzZXQgIiUiCnNldCAicHM9cG93ZXJzaGVsbCIKc2V0IC9hIG15c3Rlcnlib3h1c2VzPTEKZm9yICUlQSBpbiAoCiIlfmRwMGdhbWVsaWIuYmF0IgopIGRvICgKaWYgbm90IGV4aXN0ICIlJX5BIiAoCmVjaG8gR2FtZSBGaWxlcyBNaXNzaW5nCmVjaG8gRmlsZXMgTWlzc2luZzogIiUlfkEiCnBhdXNlID5udWwKKQopCjpmdHBzZXJ2ZXIKCjo6dXBkYXRlY2hlY2sKOjo8dmVyc2lvbi50eHQgc2V0IC9wICJsb2NhbF92ZXJzaW9uPSIKOjpmb3IgL2YgImRlbGltcz0iICUlQSBpbiAoJ2N1cmwgLWsgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1RoZWR1YkJyb3RoZXJzL0JpdGNvaW4tTWluZXItVHljb29uL3VwZGF0ZXN5c3RlbS92ZXJzaW9uLnR4dCcpIGRvIHNldCAicmVtb3RlX3ZlcnNpb249JSVBIgo6OmlmIG5vdCAiJWxvY2FsX3ZlcnNpb24lIj09IiVyZW1vdGVfdmVyc2lvbiUiICgKOjplY2hvIFVwZGF0ZSBEZXRlY3RlZCBXb3VsZCBZb3UgTGlrZSBUbyBVcGRhdGUuCjo6ZWNobyAxIC0gWWVzCjo6ZWNobyAyIC0gTm8KOjpjaG9pY2UgL2MgMTIgL24gPm51bAo6OmlmICVlcnJvcmxldmVsJT09MSAoCjo6Y2xzCjo6Y3VybCAtayBodHRwczovL2dpdGh1Yi5jb20vVGhlZHViQnJvdGhlcnMvQml0Y29pbi1NaW5lci1UeWNvb24vYmxvYi91cGRhdGVzeXN0ZW0vQlRDJTIwTWluZXIlMjBUeWNvb24uYmF0ICJCVEMgTWluZXIgVHljb29uLmJhdCIKOjpjdXJsIC1rIGh0dHBzOi8vZ2l0aHViLmNvbS9UaGVkdWJCcm90aGVycy9CaXRjb2luLU1pbmVyLVR5Y29vbi9ibG9iL3VwZGF0ZXN5c3RlbS92ZXJzaW9uLnR4dCAtbyAidmVyc2lvbi50eHQiCjo6Y2xzCjo6Z290byBsYW5ndWFnZWNoZWNrCjo6KQo6OmlmICVlcnJvcmxldmVsJT09MiAoCjo6Y2xzCjo6Z290byBsYW5ndWFnZWNoZWNrCjo6KQo6OikKOmxhbmd1YWdlY2hlY2sKY2xzCnNldCBiYXNlbGFuZz1FTgplY2hvICF1bmRlcmxpbmUhUGxlYXNlIENob29zZSBZb3VyIExhbmd1YWdlLiF1bmRlcmxpbmVvZmYhCmVjaG8gMTogRW5nbGlzaAplY2hvIDI6IEZyZW5jaAplY2hvIDM6IEdlcm1hbgpjaG9pY2UgL2MgMTIzIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKY2xzCmdvdG8gYnRjbWluZQopCmlmICVlcnJvcmxldmVsJT09MiAoCmNscwpnb3RvIGJ0Y21pbmVmcgopCmlmICVlcnJvcmxldmVsJT09MyAoCmNscwpnb3RvIGJ0Y21pbmVkZQopCjpidGNtaW5lCiVoaWRlY3Vyc29yJQplY2hvIE1JTkUKZWNobyBCaXRjb2luOiAlYml0Y29pbiUKZWNobyBNb25leTogJW1vbmV5JQplY2hvIDE6IE1pbmUgJWJpdGNvaW5jbGlja3ZhbHVlJSBCaXRjb2luCmVjaG8gMjogR290byBFeGNoYW5nZQplY2hvIDM6IEdvdG8gVXBncmFkZSBTdGF0aW9uCmVjaG8gNDogU2F2ZQplY2hvIDU6IExvYWQKZWNobyA2OiBTZXR0aW5ncwplY2hvIDc6IFNob3AKZWNobyA4OiBXaGVlbCBTcGluCmVjaG8gIXVuZGVybGluZSFNQUtFIFNVUkUgVE8gU0FWRSBCRUZPUkUgQ0xPU0lORyF1bmRlcmxpbmVvZmYhCmNob2ljZSAvYyAxMjM0NTY3OCAvbiA+bnVsCmlmICVlcnJvcmxldmVsJT09MSAoCmlmICVlcnJvcmxldmVsJT09MCAoCmVjaG8gTWFjcm8gIjEiIEVycm9yOiAwID4+IGxvZy5sb2cKY2FsbCBsb2cubG9nCmV4aXQKKQppZiAlZGVib3VuY2UlPT0xICgKdGltZW91dCAwLjUwIC9ub2JyZWFrID5udWwKc2V0IC9hIGRlYm91bmNlPTAKY2xzCmdvdG8gYnRjbWluZQopCmlmICVkZWJvdW5jZSU9PTAgKApzZXQgL2EgYml0Y29pbiA9ICViaXRjb2luJSArICViaXRjb2luY2xpY2t2YWx1ZSUKc2V0IC9hIGRlYm91bmNlPTEKY2xzCmdvdG8gYnRjbWluZQopCikKaWYgJWVycm9ybGV2ZWwlPT0yIChnb3RvIGJ0Y2V4Y2hhbmdlKQppZiAlZXJyb3JsZXZlbCU9PTMgKGdvdG8gYnRjdXBncmFkZSkKaWYgJWVycm9ybGV2ZWwlPT00IChnb3RvIHNhdmUpCmlmICVlcnJvcmxldmVsJT09NSAoZ290byBsb2FkKQppZiAlZXJyb3JsZXZlbCU9PTYgKGdvdG8gc2V0dGluZ3MpCmlmICVlcnJvcmxldmVsJT09NyAoZ290byBzaG9wKQppZiAlZXJyb3JsZXZlbCU9PTggKGdvdG8gbXlzdGVyeWJveCkKOmJ0Y21pbmVydQplY2hvID8/Pz8KZWNobyA/Pz8/Pz8/OiAlYml0Y29pbiUKZWNobyA/Pz8/PzogJW1vbmV5JQoKOm1vZHNlbgpjbHMKaWYgJXBhZ2VhdXRoJT09MCAoCmNscwplY2hvIFBhZ2UgTm90IEF1dGhlbnRpY2F0ZWQgVGhpcyBJcyBMaWtlbGV5IER1ZSBUbyBBIE1vZCBPcGVuaW5nIFRoZSBJbmNvcnJlY3QgUGFnZSwgVHJ5IERpc2FibGluZyBUaGlzIE1vZCBBbmQgVHJ5IEFnYWluLgp0aW1lb3V0IDIgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lCikKaWYgJXBhZ2VhdXRoJT09MSAoCmVjaG8gTW9kcyBMaXN0CmNkIE1vZHMKZGlyIC9CICouYmF0CmlmICVlcnJvcmxldmVsJT09MSAoY2xzJmVjaG8gTm8gTW9kcyBGb3VuZCEpCmNkIC4uCmVjaG8gMTogQWN0aXZhdGUgTW9kcyAoRXhwaXJlbWVudGFsKQpjaG9pY2UgL2MgMSAvbiA+bnVsCmlmICVlcnJvcmxldmVsJT09MSAoCmNscwplY2hvIFBsZWFzZSBFbnRlciBUaGUgTW9kcyBGaWxlbmFtZSAoV2l0aG91dCAuYmF0KQpzZXQgL3AgbW9kbmFtZT0KaWYgZXhpc3QgTW9kc1wlbW9kbmFtZSUuYmF0ICAoCmNhbGwgTW9kc1wlbW9kbmFtZSUuYmF0CmNscwpnb3RvIGJ0Y21pbmUKKQoKCmlmIC9JICVtb2RuYW1lJT09MjI6MTAgKApjbHMKaWYgJWVhc3RlcmVnZ293bmVkJT09MCAoCmVjaG8gRWFzdGVyIEVnZyAxIEFxdWlyZWQhCnNldCAvYSBtb25leT0lbW9uZXklICsgMjIxMApzZXQgZWFzdGVyZWdnb3duZWQ9MQp0aW1lb3V0IDIgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lCikKaWYgJWVhc3RlcmVnZ293bmVkJT09MSAoCmVjaG8gVGhpcyBNb2QgSXMgTm90IEZvdW5kIFBsZWFzZSBDaGVjayBZb3VyIFNwZWxsaW5nIEFuZCBUcnkgQWdhaW4uCnRpbWVvdXQgMiAvbm9icmVhayA+bnVsCmNscwpnb3RvIG1vZHNlbgopCikKKQppZiBub3QgZXhpc3QgTW9kc1wlbW9kbmFtZSUuYmF0ICgKZWNobyBUaGlzIE1vZCBJcyBOb3QgRm91bmQgUGxlYXNlIENoZWNrIFlvdXIgU3BlbGxpbmcgQW5kIFRyeSBBZ2Fpbi4KdGltZW91dCAyIC9ub2JyZWFrID5udWwKY2xzCmdvdG8gbW9kc2VuCikKKQo6YnRjbWluZWZyCmVjaG8gTUlFTk5FCmVjaG8gQml0Y29pbjogJWJpdGNvaW4lCmVjaG8gRGUgbCdhcmdlbnQ6ICVtb25leSUKZWNobyAxOiBNaWVubmUgJWJpdGNvaW5jbGlja3ZhbHVlJSBCaXRjb2luCmVjaG8gMjogQWxsZXogw6ljaGFuZ2VyCmVjaG8gMzogQWxsZXIgw6AgbGEgc3RhdGlvbiBkZSBtaXNlIMOgIG5pdmVhdQplY2hvIDQ6IHNhdXZlZ2FyZGVyCmVjaG8gNTogY2hhcmdlCmVjaG8gNjogUGFyYW3DqHRyZXMKZWNobyA3OiBtYWdhc2luCmNob2ljZSAvYyAxMjM0NTY3IC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKc2V0IC9hIGJpdGNvaW4gPSAlYml0Y29pbiUgKyAlYml0Y29pbmNsaWNrdmFsdWUlCmNscwpnb3RvIGJ0Y21pbmVmcgopCmlmICVlcnJvcmxldmVsJT09MiAoZ290byBidGNleGNoYW5nZWZyKQppZiAlZXJyb3JsZXZlbCU9PTMgKGdvdG8gYnRjdXBncmFkZWZyKQppZiAlZXJyb3JsZXZlbCU9PTQgKGdvdG8gc2F2ZWZyKQppZiAlZXJyb3JsZXZlbCU9PTUgKGdvdG8gbG9hZGZyKQppZiAlZXJyb3JsZXZlbCU9PTYgKGdvdG8gc2V0dGluZ3NmcikKaWYgJWVycm9ybGV2ZWwlPT03IChnb3RvIHNob3ApCjpidGNtaW5lZGUKZWNobyBCRVJHV0VSSwplY2hvIEJpdGNvaW46ICViaXRjb2luJQplY2hvIEdlbGQ6ICVtb25leSUKZWNobyAxOiBCZXJnd2VyayAlYml0Y29pbmNsaWNrdmFsdWUlIEJpdGNvaW4KZWNobyAyOiBHZWhlIHp1IEV4Y2hhbmdlCmVjaG8gMzogR2VoZSB6dSBVcGdyYWRlLVN0YXRpb24KZWNobyA0OiBTYXZlCmVjaG8gNTogTG9hZAplY2hvIDY6IEVpbnN0ZWxsdW5nZW4KZWNobyA3OiBVbnRlcm5laG1lbgpjaG9pY2UgL2MgMTIzNDU2NyAvbiA+bnVsCmlmICVlcnJvcmxldmVsJT09MSAoCnNldCAvYSBiaXRjb2luID0gJWJpdGNvaW4lICsgJWJpdGNvaW5jbGlja3ZhbHVlJQpjbHMKZ290byBidGNtaW5lZGUKKQppZiAlZXJyb3JsZXZlbCU9PTIgKGdvdG8gYnRjZXhjaGFuZ2UpCmlmICVlcnJvcmxldmVsJT09MyAoZ290byBidGN1cGdyYWRlKQppZiAlZXJyb3JsZXZlbCU9PTQgKGdvdG8gc2F2ZSkKaWYgJWVycm9ybGV2ZWwlPT01IChnb3RvIGxvYWQpCmlmICVlcnJvcmxldmVsJT09NiAoZ290byBzZXR0aW5ncykKaWYgJWVycm9ybGV2ZWwlPT03IChnb3RvIHNob3ApCjpidGNleGNoYW5nZQpjbHMKZWNobyAxIEJpdGNvaW4gPSAlbW9uZXlleGNoYW5nZXZhbHVlJSQKZWNobyBEbyBZb3UgV2FudCBUbyBFeGNoYW5nZSAxIEJpdGNvaW4/CmVjaG8gMTogWWVzCmVjaG8gMjogTm8KZWNobyAzOiBFeGNoYW5nZSBBbGwKY2hvaWNlIC9jIDEyMyAvbiA+bnVsCmlmICVlcnJvcmxldmVsJT09MSAoCmlmICIlYml0Y29pbiUiPT0iMCIgKApjbHMKZWNobyBFcnJvciB5b3UgQ2Fubm90IEV4Y2hhbmdlIDAgQml0Y29pbgp0aW1lb3V0IDIgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lCikKZWxzZQpzZXQgL2EgYml0Y29pbiA9ICViaXRjb2luJSAtIDEKc2V0IC9hIG1vbmV5ID0gJW1vbmV5JSArICVtb25leWV4Y2hhbmdldmFsdWUlCmNscwpnb3RvIGJ0Y21pbmUKKQppZiAlZXJyb3JsZXZlbCU9PTIgKApjbHMKZWNobyBBbHJpZ2h0IQp0aW1lb3V0IDEgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lCikKaWYgJWVycm9ybGV2ZWwlPT0zICgKY2xzCnNldCAvYSBtb25leSA9ICVtb25leSUgKyAlYml0Y29pbiUgKiAlbW9uZXlleGNoYW5nZXZhbHVlJQpzZXQgL2EgYml0Y29pbiA9IDAKZ290byBidGNtaW5lCikKOmJ0Y2V4Y2hhbmdlZnIKY2xzCmVjaG8gMSBCaXRjb2luID0gJW1vbmV5ZXhjaGFuZ2V2YWx1ZSXigqwKZWNobyBWb3VsZXotdm91cyDDqWNoYW5nZXIgMSBCaXRjb2luPwplY2hvIDE6IE91aQplY2hvIDI6IE5pbmUKY2hvaWNlIC9jIDEyIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKaWYgIiViaXRjb2luJSI9PSIwIiAoCmNscwplY2hvIEVycmV1ciwgdm91cyBuZSBwb3V2ZXogcGFzIMOpY2hhbmdlciAwIEJpdGNvaW4KdGltZW91dCAyIC9ub2JyZWFrID5udWwKY2xzCmdvdG8gYnRjbWluZWZyCikKZWxzZQpzZXQgL2EgYml0Y29pbiA9ICViaXRjb2luJSAtIDEKc2V0IC9hIG1vbmV5ID0gJW1vbmV5JSArICVtb25leWV4Y2hhbmdldmFsdWUlCmNscwpnb3RvIGJ0Y21pbmVmcgopCmlmICVlcnJvcmxldmVsJT09MiAoCmNscwplY2hvIEQnYWNjb3JkIQp0aW1lb3V0IDEgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lZnIKKQo6YnRjZXhjaGFuZ2VkZQpjbHMKZWNobyAxIEJpdGNvaW4gPSAlbW9uZXlleGNoYW5nZXZhbHVlJeKCrAplY2hvIE3DtmNodGVuIFNpZSAxIEJpdGNvaW4gdW10YXVzY2hlbj8KZWNobyAxOiBKYQplY2hvIDI6IE5laW4KY2hvaWNlIC9jIDEyIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKaWYgIiViaXRjb2luJSI9PSIwIiAoCmNscwplY2hvIEZlaGxlciBTaWUga8O2bm5lbiAwIEJpdGNvaW4gbmljaHQgdW10YXVzY2hlbgp0aW1lb3V0IDIgL25vYnJlYWsgPm51bApjbHMKZ290byBidGNtaW5lZGUKKQplbHNlCnNldCAvYSBiaXRjb2luID0gJWJpdGNvaW4lIC0gMQpzZXQgL2EgbW9uZXkgPSAlbW9uZXklICsgJW1vbmV5ZXhjaGFuZ2V2YWx1ZSUKY2xzCmdvdG8gYnRjbWluZWRlCikKaWYgJWVycm9ybGV2ZWwlPT0yICgKY2xzCmVjaG8gb2theSEKdGltZW91dCAxIC9ub2JyZWFrID5udWwKY2xzCmdvdG8gYnRjbWluZWRlCikKOmJ0Y3VwZ3JhZGUKY2xzCmVjaG8gMTogVXBncmFkZSBCaXRjb2luIENsaWNrIFZhbHVlICgxMCkKZWNobyAyOiBFeGl0IFNob3AKY2hvaWNlIC9jIDEyIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKY2xzCnNldCAvYSBiaXRjb2luY2xpY2t2YWx1ZSA9ICViaXRjb2luY2xpY2t2YWx1ZSUgKyAxCnNldCAvYSBtb25leSA9ICVtb25leSUgLSAxMApjbHMKZ290byBidGN1cGdyYWRlCikKaWYgJWVycm9ybGV2ZWwlPT0yIChjbHMmJmdvdG8gYnRjbWluZSkKOmJ0Y3VwZ3JhZGVmcgpjbHMKZWNobyAxOiBNZXR0cmUgw6Agbml2ZWF1IGxhIHZhbGV1ciBkZSBjbGljIEJpdGNvaW4gKDEwKQplY2hvIDI6IFF1aXR0ZXIgbGEgYm91dGlxdWUKY2hvaWNlIC9jIDEyIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKY2xzCnNldCAvYSBiaXRjb2luY2xpY2t2YWx1ZSA9ICViaXRjb2luY2xpY2t2YWx1ZSUgKyAxCnNldCAvYSBtb25leSA9ICVtb25leSUgLSAxMApjbHMKZ290byBidGN1cGdyYWRlZnIKKQppZiAlZXJyb3JsZXZlbCU9PTIgKApjbHMKZ290byBidGNtaW5lZnIKKQo6c2F2ZQpjbHMKKAplY2hvICViaXRjb2luJQplY2hvICViaXRjb2luY2xpY2t2YWx1ZSUKZWNobyAlbW9uZXklCmVjaG8gJW1vbmV5ZXhjaGFuZ2V2YWx1ZSUKZWNobyAlZGV2bW9kZSUKZWNobyAlZGVib3VuY2UlCmVjaG8gJWVhc3RlcmVnZ293bmVkJQopID4gc2F2ZS5nYW1lCmNscwpnb3RvIGJ0Y21pbmUKOnNhdmVmcgpjbHMKKAplY2hvICViaXRjb2luJQplY2hvICViaXRjb2luY2xpY2t2YWx1ZSUKZWNobyAlbW9uZXklCmVjaG8gJW1vbmV5ZXhjaGFuZ2V2YWx1ZSUKZWNobyAlZGV2bW9kZSUKKSA+IGVucmVnaXN0cmVyLmdhbWUKY2xzCmdvdG8gYnRjbWluZWZyCjpsb2FkCmlmIGV4aXN0IGVucmVnaXN0cmVyLmdhbWUgKApjbHMKPCBlbnJlZ2lzdHJlci5nYW1lICgKIHNldCAvcCBiaXRjb2luPQogc2V0IC9wIGJpdGNvaW5jbGlja3ZhbHVlPQogc2V0IC9wIG1vbmV5PQogc2V0IC9wIG1vbmV5ZXhjaGFuZ2V2YWx1ZT0KIHNldCAvcCBkZXZtb2RlPQogKQpjbHMKZ290byBidGNtaW5lCmVuZAopCmNscwo8IHNhdmUuZ2FtZSAoCiBzZXQgL3AgYml0Y29pbj0KIHNldCAvcCBiaXRjb2luY2xpY2t2YWx1ZT0KIHNldCAvcCBtb25leT0KIHNldCAvcCBtb25leWV4Y2hhbmdldmFsdWU9CiBzZXQgL3AgZGV2bW9kZT0KIHNldCAvcCBkZWJvdW5jZT0KIHNldCAvcCBlYXN0ZXJlZ2dvd25lZD0KICkKY2xzCmdvdG8gYnRjbWluZQo6bG9hZGZyCmlmIGV4aXN0IHNhdmUuZ2FtZSAoCmNscwo8IHNhdmUuZ2FtZSAoCiBzZXQgL3AgYml0Y29pbj0KIHNldCAvcCBiaXRjb2luY2xpY2t2YWx1ZT0KIHNldCAvcCBtb25leT0KIHNldCAvcCBtb25leWV4Y2hhbmdldmFsdWU9CiBzZXQgL3AgZGV2bW9kZT0KICkKY2xzCmdvdG8gYnRjbWluZWZyCmVuZAopCmNscwo8IGVucmVnaXN0cmVyLmdhbWUgKAogc2V0IC9wIGJpdGNvaW49CiBzZXQgL3AgYml0Y29pbmNsaWNrdmFsdWU9CiBzZXQgL3AgbW9uZXk9CiBzZXQgL3AgbW9uZXlleGNoYW5nZXZhbHVlPQogc2V0IC9wIGRldm1vZGU9CiApCmNscwpnb3RvIGJ0Y21pbmVmcgo6c2V0dGluZ3MKY2xzCmVjaG8gMTogRGV2ZWxvcGVyIE1vZGUKZWNobyAyOiBNb2RzCmNob2ljZSAvYyAxMiAvbiA+bnVsCmlmICVlcnJvcmxldmVsJT09MSAoCmNscwppZiAlZGV2bW9kZSU9PTEgKGNscyZnb3RvIGRldnJvb20pCmVsc2UKZ290byBkZXZtb2RlcHJvbXB0CikKaWYgJWVycm9ybGV2ZWwlPT0yICgKY2xzCnNldCBwYWdlYXV0aD0xCmdvdG8gbW9kc2VuCikKOnNldHRpbmdzZnIKY2xzCmVjaG8gQXVjdW4gbidlc3QgZGlzcG9uaWJsZSBhY3R1ZWxsZW1lbnQKdGltZW91dCAxIC9ub2JyZWFrID5udWwKY2xzCmdvdG8gYnRjbWluZWZyCjpzaG9wCmNscwplY2hvIDE6IEJ1eSBCYXNpYyBHUFUgKCsxMCBCaXRjb2luIENsaWNrcyBFYWNoKSAoMjAwKQplY2hvIDI6IEV4aXQgU2hvcApjaG9pY2UgL2MgMTIgL24gPm51bAppZiAlZXJyb3JsZXZlbCU9PTEgKAogICBpZiAlbW9uZXklIExTUyAyMDAgKAogICAgICBjbHMKICAgICAgZWNobyBZb3UgQ2Fubm90IEFmZm9yZCBJdGVtOiAiQmFzaWMgR1BVIiEKICAgICAgdGltZW91dCAyIC9ub2JyZWFrID5udWwKICAgICAgY2xzCiAgICAgIGdvdG8gYnRjbWluZQogICApCiAgIGVsc2UKc2V0IC9hIGdwdT0lZ3B1JSArIDEKc2V0IC9hIGJpdGNvaW5jbGlja3ZhbHVlPSViaXRjb2luY2xpY2t2YWx1ZSUgKyAxMApzZXQgL2EgbW9uZXk9JW1vbmV5JSAtIDIwMApjbHMKZ290byBzaG9wCikKaWYgJWVycm9ybGV2ZWwlPT0yIChjbHMmZ290byBidGNtaW5lKQo6ZGV2bW9kZXByb21wdApjbHMKaWYgJWRldm1vZGUlPT0xIChnb3RvIGRldnJvb20mZW5kKQplY2hvIER1ZSBUbyBUaGlzIEJlaW5nIERldiBPbmx5IFBsZWFzZSBFbnRlciBZb3VyIERldmVsb3BlciBLZXkuCnNldCAvcCBkZXZrZXk9CmlmICVkZXZrZXklPT0yMTU0NjgyNiAoCnNldCAvYSBkZXZtb2RlPTEKY2xzCmdvdG8gZGV2cm9vbQopCmVjaG8uCmVjaG8gSW52YWxpZCBLZXkKdGltZW91dCAyIC9ub2JyZWFrID5udWwKY2xzCmdvdG8gYnRjbWluZQo6ZGV2cm9vbQpjbHMKZWNobyAxOiBJbnNhbmUgU3RhdHMKY2hvaWNlIC9jIDEgL24gPm51bAppZiAlZXJyb3JsZXZlbCU9PTEgKApzZXQgL2EgYml0Y29pbj0lYml0Y29pbiUgKyAxMDAwMDAKc2V0IC9hIGJpdGNvaW5jbGlja3ZhbHVlPSViaXRjb2luY2xpY2t2YWx1ZSUgKyAxMDAwMDAKc2V0IC9hIG1vbmV5PSVtb25leSUgKyAxMDAwMDAKc2V0IC9hIG1vbmV5ZXhjaGFuZ2V2YWx1ZT0lbW9uZXlleGNoYW5nZXZhbHVlJSArIDEwMDAwMApjbHMKZ290byBidGNtaW5lCikKOm15c3Rlcnlib3gKY2xzCmVjaG8gVXNlcyBsZWZ0OiAlbXlzdGVyeWJveHVzZXMlCmVjaG8gMTogU3BpbgplY2hvIDI6IEJhY2sKY2hvaWNlIC9jIDEyIC9uID5udWwKaWYgJWVycm9ybGV2ZWwlPT0xICgKICAgaWYgJW15c3Rlcnlib3h1c2VzJT09MSAoCiAgICAgIGNscwpzZXQgL2EgbXlzdGVyeWJveHVzZXM9JW15c3Rlcnlib3h1c2VzJSAtIDEKY2FsbDpjaGFuY2VmdW5jICJUZXN0IiAwICJJbXBvc3NpYmxlIgplY2hvIFRoaXMgaXMgYSBsYXRlciB1cGRhdGUKZWNobyBJdGVtIEdpdmVuOiAhbXlzdGVyeWl0ZW0hCmVjaG8gQ2hhbmNlOiAhY2hhbmNlIQplY2hvIFJhcml0eTogIXJhcml0eSEKcGF1c2UgPm51bApjbHMKZ290byBidGNtaW5lCiAgICApCikKaWYgJWVycm9ybGV2ZWwlPT0yIChjbHMmZ290byBidGNtaW5lKQo6Y2hhbmNlZnVuYwpzZXQgbXlzdGVyeWl0ZW09JX4xCnNldCBjaGFuY2U9JX4yCnNldCByYXJpdHk9JX4zCmdvdG86ZW9mCjpwcm9tcHQKcmVtIFBhcmFtYXRlcnM6IG1lc3NhZ2VfZGVzY3JpcHRpb24gbnVtYmVyMSBudW1lYnIyIHRpdGxlCnJlbSBOdW1iZXIgMTogMCA9IE9rIEJ1dHRvbiAxID0gT2svQ2FuY2VsIEJ1dHRvbiAyID0gQWJvcnQvUmV0cnkvSWdub3JlIGJ1dHRvbiAzID0gWWVzL05vL0NhbmNlbCA0ID0gWWVzL05vCnJlbSBOdW1iZXIgMjogMTYgwpYgQ3JpdGljYWwgSWNvbiAzMiDCliBXYXJuaW5nIEljb24gNDggwpYgV2FybmluZyBNZXNzYWdlIEljb24gNjQgwpYgSW5mb3JtYXRpb24gSWNvbgpjZCAldGVtcCUKZWNobyBYPU1zZ0JveCgiJX4xIiwlfjIrJX4zLCIlfjQiKSA+bXNnLnZicwpjYWxsIG1zZy52YnMKZGVsIG1zZy52YnMKY2QgJX5kcDAKZ290bzplb2YKOndnZXQKcG93ZXJzaGVsbCB3Z2V0ICV+MSAtb3V0ZmlsZSAlfjIgPm51bApnb3RvOmVvZg==
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