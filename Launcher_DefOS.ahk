OS := {}
_OSTextEditor := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe "



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; move
; OS["!Right"]            := "sendinput, !{Right}"       ;;!Right::    ;;move next position
; OS["!Left"]             := "sendinput, !{Left}"        ;;!Left::     ;;move previous position
; OS["!+Up"]              := "sendinput, !+{Up}"           ;;!+Up::      ;;search caller
; OS["!+Down"]            := "sendinput, !+{Down}"              ;;!+Down::    ;;jump to definition
; OS["^tab"]              := "sendinput, ^{tab}"          ;;^tab::      ;;next file or tab
; OS["^+tab"]             := "sendinput, ^+{tab}"         ;;^+tab::     ;;previous file or tab
; OS["^+t"]               := "sendinput, ^+t"             ;;^+t:        ;;reopen recent closed tab or file
; OS["^g"]                := "sendinput, ^g"              ;;^g::        ;;goto line
; OS["^\"]                := "sendinput, ^\"             ;;^\::        ;;goto matching brace toggle
; OS["^F3"]               := "sendinput, ^{F3}"           ;;^F3::       ;;find word at current cursor
; 
; ;;;;;;;; edit
; OS["^y"]                := "sendinput, ^y"             ;;^y::        ;;redo
; OS["^d"]                := "sendinput, ^d"              ;;^d::        ;;duplicate line
; OS["^+d"]               := "sendinput, ^+d"              ;;^+d::       ;;delete line
; OS["^/"]                := "sendinput, ^/"              ;;^/::        ;;comment with line-comment
; OS["^+/"]               := "sendinput, ^+/"             ;;^+/::       ;;comment with block-comment
; OS["^+u"]               := "sendinput, ^+u"             ;;^+u::       ;;toggle upper or lower case
; OS["^+i"]               := "sendinput, ^+i"             ;;^!i::       ;;indent block
; OS["^+!i"]              := "sendinput, ^+!i"             ;;^+!::       ;;indent file


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

