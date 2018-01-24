OS := {}
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; move
OS["!Right"]            := "sendinput, !{Right}"       ;;!Right::    ;;move next position
OS["!Left"]             := "sendinput, !{Left}"        ;;!Left::     ;;move previous position
OS["!+Up"]              := "sendinput, !+{Up}"           ;;!+Up::      ;;search caller
OS["!+Down"]            := "sendinput, !+{Down}"              ;;!+Down::    ;;jump to definition
OS["^tab"]              := "sendinput, ^{tab}"          ;;^tab::      ;;next file or tab
OS["^+tab"]             := "sendinput, ^+{tab}"         ;;^+tab::     ;;previous file or tab
OS["^+t"]               := "sendinput, ^+t"             ;;^+t:        ;;reopen recent closed tab or file
OS["^g"]                := "sendinput, ^g"              ;;^g::        ;;goto line
OS["^\"]                := "sendinput, ^\"             ;;^\::        ;;goto matching brace toggle
OS["^F3"]               := "sendinput, ^{F3}"           ;;^F3::       ;;find word at current cursor


;;;;;;;; Windows OS
OS.c                    := "Run, c:\"
OS.d                    := "Run, d:\"
OS.cmd                  := Func( "_OSAdmin" ).Bind( "cmd.exe" )
OS.control              := "Run, Control Panel"
OS.ip                   := Func( "_OSCopyText" ).Bind( A_IPAddress1 )
OS.pf                   := "Run," . A_ProgramFiles
OS.pfa                  := Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles ) ; Opens both "Program Files" and "Program Files (x86)"
OS.startup              := Func( "_OSRunMore" ).Bind( "shell:startup" )
OS.qdir                 := "Run, D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"

;;;;;;;; Autohotkey
OS.hotkey               := Func( "_OSHotKeys" )

