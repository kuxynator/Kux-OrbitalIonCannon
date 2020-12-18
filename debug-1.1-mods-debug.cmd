@echo off
set version=1.1
set exeName=factorio_debug_%version%.exe
set root=C:\Program Files\Factorio\%version%
set do="D:\Develop\Extern\GitHub.KsWare\FactorioCmdTools\FactorioCmdTools\bin\Debug\netcoreapp3.1\FactorioCmdTools.exe"
set mods=-mods "%root%\mods-debug"
set exe=-exe "%root%\bin\x64\%exeName%"
echo %do% update -fv %version% %exe% %mods% -kill -start
echo start?
%do% update -fv %version% %exe% %mods% -kill -start
pause