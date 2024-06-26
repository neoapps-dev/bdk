@echo off
goto :%1
:about
echo %@.version%
echo Made by NEOAPPS.
echo Special Thanks:
echo 1. Kvc (for batdbug and the PATH method instead of my spaghetti-code lol)
echo 2. Groophy Lifefor (for gecho)
echo 3. TomWright (for dasel)
echo 4. jqlang (for jq)
echo 5. Vitaly Shukela (vi) for websocat
echo 6. Fatih Kodak (for AES tool)
echo 7. NirSoft (for NirCMD)
echo 8. xxfoofyxx (for RE)
echo 9. Zeek05 (for TAT)
echo 10. DarkBatcher (for batbox)
echo 11. Misol101 (for cmdwiz)
echo 12. Judago (for cmdmenusel)
goto :eof

:install
echo BDK install command isn't available!
echo try 'ship install' instead!
goto :eof

:init
set /p bdkpath=<%USERPROFILE%\.bdk
set PATH=%PATH%;%bdkpath%;%~dp0;%USERPROFILE%\.ship\packages;%USERPROFILE%\.ship\packages\AES\Files;%USERPROFILE%\.ship\packages\batdbug\Src;%bdkpath%\ship\ship-master;%USERPROFILE%\.ship\packages\sqlite
set @.import=call
set @.version=BDK version 1.0
set @.ship=ship.bat
set @.menu=cmdmenusel.exe
set @.json=jq.dll
set @.color=gecho.dll
set @.encrypt=aes.exe -e
set @.decrypt=aes.exe -d
set @.debug=batdbug.bat
set @.ini=configman.bat
set @.api=apiclient.bat
set @.ws=websocat.dll
set @.csv2json=dasel.dll -r csv -w json
set @.xml2json=xml2json.bat
set @.uuid=uuid
set @.copy=nircmd.dll clipboard set
set @.speak=nircmd.dll speak text
set @.search=searcher