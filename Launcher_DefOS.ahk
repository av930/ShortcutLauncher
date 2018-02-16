OS := {}
OS["name"] := "Windows OS"
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refer: https://autohotkey.com/docs/Variables.htm#os

;;;;;;;; Favorite Directories
OS.c                    := ["Run, c:\"                                                                    ,"directory: C-drive"]
OS.d                    := ["Run, d:\"                                                                   ,"directory: D-drive:"]
OS.pf                   := ["Run," . A_ProgramFiles                                                 ,"directory: Program Files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles )        ,"directory: Program Files"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" )                                  ,"directory: StartUp"]
OS.doc                  := ["Run," . A_MyDocuments ,"directory: MyDocument"]
OS.down                 := [Func( "_OSRunMore" ).Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}") ,"directory: Download"]
OS.QLaunch              := [Func( "_OSRunMore" ).Bind( "shell:Quick Launch" )                         ,"directory quick launch"]
;;;;;;;; goto Windows Tools
OS.control              := ["Run, Control Panel"                                                        ,"launch control panel"]
OS.RemoveProg           := [Func( "_OSRunMore" ).Bind( "shell:ChangeRemoveProgramsFolder" )         ,"program Install & Remove"]



;;;;;;;; do Small function
OS.ip                   := [Func( "_OSCopyText" ).Bind( A_IPAddress1 )                               ,"copy current IP address"]

;;;;;;;; Program Launch
OS.qdir                 := ["Run, D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"        ,"launch program Q-DIR"]
OS.term                 := ["!{delete}"                                                                  ,"launch LogMeTT menu"]
                           
;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" )                                                     ,"listup assigned hotkeys"]

