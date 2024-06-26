@echo off
setlocal enabledelayedexpansion
title BatUI - Console

echo Add-Type -AssemblyName PresentationFramework >%temp%\bui.ps1
echo [xml]$xaml = ' >>%temp%\bui.ps1
type %1.xaml >>%temp%\bui.ps1
echo.>>%temp%\bui.ps1
echo ' >>%temp%\bui.ps1
echo $reader = (New-Object System.Xml.XmlNodeReader $xaml) >>%temp%\bui.ps1
echo $window = [Windows.Markup.XamlReader]::Load($reader) >>%temp%\bui.ps1
type %1.bui >> %temp%\bui.ps1
echo.>>%temp%\bui.ps1
echo $window.ShowDialog() ^| Out-Null >>%temp%\bui.ps1
echo [BDK.BatUI] Rendering window...
powershell -File "%temp%\bui.ps1"
echo [BDK.BatUI] Application Ended with Code '%errorlevel%'
endlocal
