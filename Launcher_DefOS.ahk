OS := {}
OS["name"] := "OS"
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; Windows OS
OS.c                    := ["Run, c:\", "launch explorer"]
OS.d                    := ["Run, d:\", "launch explorer"]
OS.cmd                  := [Func( "_OSAdmin" ).Bind( "cmd.exe" ), "launch cmd.exe"]
OS.control              := ["Run, Control Panel", "launch control panel"]
OS.ip                   := [Func( "_OSCopyText" ).Bind( A_IPAddress1 ), "copy current IP address"]
OS.pf                   := ["Run," . A_ProgramFiles, "launch explorer: program files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles ), "launch explorer"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" ) , "launch explorer"]
OS.qdir                 := ["Run, D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe" , "launch explorer"]
                           
;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" ) , "listup assigned hotkeys"]

