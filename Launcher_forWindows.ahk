OS := {}
OS["name"] := "Windows OS"
OS[prog] := all.exe
OS[clas] := all



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refer: https://autohotkey.com/docs/Variables.htm#os

;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" )                                             ,"autohotkey.list.AssignedHotkeys"]

;;;;;;;; Favorite Directories
OS.c                    := ["Run, c:\"                                                                     ,"directory.C-drive"]
OS.d                    := ["Run, d:\"                                                                     ,"directory.D-drive"]
OS.pf                   := ["Run," . A_ProgramFiles                                                  ,"directory.Program Files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles )         ,"directory.Program Files"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" )                                   ,"directory.StartUp"]
OS.doc                  := ["Run," . A_MyDocuments ,"directory: MyDocument"]
OS.down                 := [Func( "_OSRunMore" ).Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}")  ,"directory.Download"]
OS.QLaunch              := [Func( "_OSRunMore" ).Bind( "shell:Quick Launch" )                          ,"directory.QuickLaunch"]

;;;;;;;; goto Windows Tools
OS.control              := ["Run, Control Panel"                                                         ,"window.ControlPanel"]
OS.install              := [Func( "_OSRunMore" ).Bind( "shell:ChangeRemoveProgramsFolder" )     ,"window.ProgramInstall&Remove"]

;;;;;;;; do Small function
OS.ip                   := [Func( "_OSCopyText" ).Bind( A_IPAddress1 )                               ,"copy current IP address"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; userdefined definitions
global _OSEditor        := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe"
global _OSTerminal      := "D:\OneDrive\_MyProgram\_Shell\_ConEmu\ConEmu64.exe"
_OSExplorer             := "D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"
_OSFTP                  := "D:\OneDrive\_MyProgram\_WebComm\_winscp\winscp.exe"

;;;;;;;; userdefined actions
OS.ex                   := ["Run," . _OSExplorer                                                         ,"program.FileBrowser"]
OS.ftp                  := ["Run," . _OSFTP                                                                   ,"program.WinSCP"]
OS.term                 := ["!{delete}"                                                                     ,"program.Terminal"]

