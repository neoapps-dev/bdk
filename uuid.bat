@echo off
set /p bdkpath=<%USERPROFILE%\.bdk
set PATH=%PATH%;%bdkpath%;%~dp0;%USERPROFILE%\.ship\packages;%USERPROFILE%\.ship\packages\AES\Files;%USERPROFILE%\.ship\packages\batdbug\Src;%bdkpath%\ship\ship-master
uuidgen.dll >%temp%\test.uuid
set /p uuid=<%temp%\test.uuid