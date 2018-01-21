OS := {}
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "


{ ;;;; Windows OS
OS.c                    := "Run, c:\"
OS.d                    := "Run, d:\"
OS.cmd                  := Func( "_OSAdmin" ).Bind( "cmd.exe" )
OS.control              := "Run, Control Panel"
OS.ip                   := Func( "_OSCopyText" ).Bind( A_IPAddress1 )
OS.pf                   := "Run," . A_ProgramFiles
OS.pfa                  := Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles ) ; Opens both "Program Files" and "Program Files (x86)"
OS.startup              := Func( "_OSRunMore" ).Bind( "shell:startup" )
OS.qdir              := "Run, D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"


}

{ ;;;; Autohotkey
OS.hotkey               := Func( "_OSHotKeys" )
}
