OS := {}
F_TextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "

{ ;;;; Windows OS
OS.c					:= "Run, c:\"
OS.d					:= "Run, d:\"
OS.cmd					:= Func( "F_Admin" ).Bind( "cmd.exe" )
OS.control				:= "Run, Control Panel"
OS.ip					:= Func( "F_CopyText" ).Bind( A_IPAddress1 )
OS.pf					:= "Run," . A_ProgramFiles
OS.pfa					:= Func( "F_RunMore" ).Bind( "C:\Program Files\", A_ProgramFiles ) ; Opens both "Program Files" and "Program Files (x86)"
OS.startup				:= Func( "F_RunMore" ).Bind( "shell:startup" )
}	
	
{ ;;;; Autohotkey	
OS.hotkey				:= Func( "F_HotKeys" )
}
