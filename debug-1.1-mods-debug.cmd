@echo off
set exe=factorio_debug_1.1.exe
set root=C:\Program Files\Factorio\1.1.0-experimental
set do="D:\Develop\Extern\GitHub.KsWare\FactorioCmdTools\FactorioCmdTools\bin\Debug\netcoreapp3.1\FactorioCmdTools.exe"
set mods=-mods "%root%\mods-debug"
set mods=-exe "%root%\bin\x64\%exe%"
%do% update -fv 1.1 %exe% %mods%
pause