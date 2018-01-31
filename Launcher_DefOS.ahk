OS := {}
OS["name"] := "OS"
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refer: https://autohotkey.com/docs/Variables.htm#os

;;;;;;;; Favorite Directories
OS.c                    := ["Run, c:\", "launch directory: C-drive"]
OS.d                    := ["Run, d:\", "launch directory: D-drive:"]
OS.pf                   := ["Run," . A_ProgramFiles, "launch directory: Program Files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles ), "launch directory: Program Files"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" ) , "launch directory: StartUp"]
OS.doc                  := ["Run," . A_MyDocuments, "launch directory: MyDocument"]
OS.down                 := [Func( "_OSRunMore" ).Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}"), "launch directory: Download"]
;;;;;;;; goto Windows Tools
OS.control              := ["Run, Control Panel", "launch control panel"]

;;;;;;;; do Small function
OS.ip                   := [Func( "_OSCopyText" ).Bind( A_IPAddress1 ), "copy current IP address"]

;;;;;;;; Program Launch
OS.qdir                 := ["Run, D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe" , "launch program Q-DIR"]
OS.cmd                  := [Func( "_OSAdmin" ).Bind( "cmd.exe" ), "launch program: cmd.exe"]
                           
;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" ) , "listup assigned hotkeys"]

