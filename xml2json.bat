@echo off
set /p bdkpath=<%USERPROFILE%\.bdk
%~dp0\dasel.dll --pretty=false -r xml -w json < %1 > %temp%\xml2json.tmp
set /p jsonfromxml=<%temp%\xml2json.tmp
set jsonfromxml=%jsonfromxml:#text=value%
set jsonfromxml=%jsonfromxml:-=%
echo %jsonfromxml% | %bdkpath%\ship\ship-master\jq.dll .>%2