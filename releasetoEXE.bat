echo "The ShortcutLauncher scripts will be converted to EXE"
echo "Please input full path of Ahk2Exe.exe"
echo "ex) releaseExe.bat c:\autohotkey\Compiler"

set CONVERT=%1
%CONVERT%\Ahk2Exe.exe /in ShortcutLauncher.ahk /out ShortcutLauncher.exe /icon AT.ico
